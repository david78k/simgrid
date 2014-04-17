/* Copyright (c) 2009-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#include "surf_private.h"
#include "surf/surf_resource.h"
#include "maxmin_private.h"
#include "simgrid/sg_config.h"
#include "cpu_cas01_private.h"

#include "string.h"
#include "stdlib.h"

/* the model objects for physical machines and virtual machines */
surf_model_t surf_cpu_model_pm = NULL;
surf_model_t surf_cpu_model_vm = NULL;

XBT_LOG_NEW_DEFAULT_SUBCATEGORY(surf_cpu, surf,
                                "Logging specific to the SURF CPU IMPROVED module");

static xbt_swag_t
    cpu_running_action_set_that_does_not_need_being_checked = NULL;

/* Additionnal callback function to cleanup some data, called from surf_resource_free */

static void cpu_cas01_cleanup(void* r){
  cpu_Cas01_t cpu = (cpu_Cas01_t)r;
  unsigned int iter;
  xbt_dynar_t power_tuple = NULL;
  xbt_dynar_foreach(cpu->energy->power_range_watts_list, iter, power_tuple)
    xbt_dynar_free(&power_tuple);
  xbt_dynar_free(&cpu->energy->power_range_watts_list);
  xbt_dynar_free(&cpu->power_peak_list);
  xbt_free(cpu->energy);
  return;
}

/* This function is registered as a callback to sg_platf_new_host() and never called directly */
void *cpu_cas01_create_resource(const char *name, xbt_dynar_t power_peak,
								 int pstate,
                                 double power_scale,
                                 tmgr_trace_t power_trace,
                                 int core,
                                 e_surf_resource_state_t state_initial,
                                 tmgr_trace_t state_trace,
                                 xbt_dict_t cpu_properties,
                                 surf_model_t cpu_model)
{
  cpu_Cas01_t cpu = NULL;

  xbt_assert(!surf_cpu_resource_priv(surf_cpu_resource_by_name(name)),
             "Host '%s' declared several times in the platform file",
             name);
  cpu = (cpu_Cas01_t) surf_resource_new(sizeof(s_cpu_Cas01_t),
                                        cpu_model, name,
                                        cpu_properties, &cpu_cas01_cleanup);
  cpu->power_peak = xbt_dynar_get_as(power_peak, pstate, double);
  cpu->power_peak_list = power_peak;
  cpu->pstate = pstate;

  cpu->energy = xbt_new(s_energy_cpu_cas01_t, 1);
  cpu->energy->total_energy = 0;
  cpu->energy->power_range_watts_list = cpu_get_watts_range_list(cpu);
  cpu->energy->last_updated = surf_get_clock();

  XBT_DEBUG("CPU create: peak=%f, pstate=%d",cpu->power_peak, cpu->pstate);

  xbt_assert(cpu->power_peak > 0, "Power has to be >0");
  cpu->power_scale = power_scale;
  cpu->core = core;
  xbt_assert(core > 0, "Invalid number of cores %d", core);

  if (power_trace)
    cpu->power_event =
        tmgr_history_add_trace(history, power_trace, 0.0, 0, cpu);

  cpu->state_current = state_initial;
  if (state_trace)
    cpu->state_event =
        tmgr_history_add_trace(history, state_trace, 0.0, 0, cpu);

  cpu->constraint =
      lmm_constraint_new(cpu_model->model_private->maxmin_system, cpu,
                         cpu->core * cpu->power_scale * cpu->power_peak);

  /* Note (hypervisor): we create a constraint object for each CPU core, which
   * is used for making a contraint problem of CPU affinity.
   **/
  {
    /* At now, we assume that a VM does not have a multicore CPU. */
    if (core > 1)
      xbt_assert(cpu_model == surf_cpu_model_pm);

    cpu->constraint_core = xbt_new(lmm_constraint_t, core);

    unsigned long i;
    for (i = 0; i < core; i++) {
      /* just for a unique id, never used as a string. */
      void *cnst_id = bprintf("%s:%lu", name, i);
      cpu->constraint_core[i] =
        lmm_constraint_new(cpu_model->model_private->maxmin_system, cnst_id,
            cpu->power_scale * cpu->power_peak);
    }
  }

  xbt_lib_set(host_lib, name, SURF_CPU_LEVEL, cpu);

  return xbt_lib_get_elm_or_null(host_lib, name);;
}


static void parse_cpu_init(sg_platf_host_cbarg_t host)
{
  /* This function is called when a platform file is parsed. Physical machines
   * are defined there. Thus, we use the cpu model object for the physical
   * machine layer. */
  cpu_cas01_create_resource(host->id,
                      host->power_peak,
                      host->pstate,
                      host->power_scale,
                      host->power_trace,
                      host->core_amount,
                      host->initial_state,
                      host->state_trace, host->properties,
                      surf_cpu_model_pm);
}

static void cpu_add_traces_cpu(void)
{
  xbt_dict_cursor_t cursor = NULL;
  char *trace_name, *elm;
  static int called = 0;
  if (called)
    return;
  called = 1;

  /* connect all traces relative to hosts */
  xbt_dict_foreach(trace_connect_list_host_avail, cursor, trace_name, elm) {
    tmgr_trace_t trace = xbt_dict_get_or_null(traces_set_list, trace_name);
    cpu_Cas01_t host = surf_cpu_resource_by_name(elm);

    xbt_assert(host, "Host %s undefined", elm);
    xbt_assert(trace, "Trace %s undefined", trace_name);

    host->state_event =
        tmgr_history_add_trace(history, trace, 0.0, 0, host);
  }

  xbt_dict_foreach(trace_connect_list_power, cursor, trace_name, elm) {
    tmgr_trace_t trace = xbt_dict_get_or_null(traces_set_list, trace_name);
    cpu_Cas01_t host = surf_cpu_resource_by_name(elm);

    xbt_assert(host, "Host %s undefined", elm);
    xbt_assert(trace, "Trace %s undefined", trace_name);

    host->power_event =
        tmgr_history_add_trace(history, trace, 0.0, 0, host);
  }
}

static void cpu_define_callbacks_cas01()
{
  sg_platf_host_add_cb(parse_cpu_init);
  sg_platf_postparse_add_cb(cpu_add_traces_cpu);
}

static int cpu_resource_used(void *resource)
{
  surf_model_t cpu_model = ((surf_resource_t) resource)->model;

  /* Note (hypervisor): we do not need to look up constraint_core[i] here. Even
   * when a task is pinned or not, its variable object is always linked to the
   * basic contraint object.
   **/

  return lmm_constraint_used(cpu_model->model_private->maxmin_system,
                             ((cpu_Cas01_t) resource)->constraint);
}

static double cpu_share_resources_lazy(surf_model_t cpu_model, double now)
{
  return generic_share_resources_lazy(now, cpu_model);
}

static double cpu_share_resources_full(surf_model_t cpu_model, double now)
{
  s_surf_action_cpu_Cas01_t action;
  return generic_maxmin_share_resources(cpu_model->states.
                                        running_action_set,
                                        xbt_swag_offset(action,
                                                        generic_lmm_action.
                                                        variable),
                                        cpu_model->model_private->maxmin_system, lmm_solve);
}

static void cpu_update_actions_state_lazy(surf_model_t cpu_model, double now, double delta)
{
  generic_update_actions_state_lazy(now, delta, cpu_model);
}

static void cpu_update_actions_state_full(surf_model_t cpu_model, double now, double delta)
{
  generic_update_actions_state_full(now, delta, cpu_model);
}

xbt_dynar_t cpu_get_watts_range_list(cpu_Cas01_t cpu_model)
{
	xbt_dynar_t power_range_list;
	xbt_dynar_t power_tuple;
	int i = 0, pstate_nb=0;
	xbt_dynar_t current_power_values;
	double min_power, max_power;
	xbt_dict_t props = cpu_model->generic_resource.properties;

	if (props == NULL)
		return NULL;

	char* all_power_values_str = xbt_dict_get_or_null(props, "power_per_state");

	if (all_power_values_str == NULL)
		return NULL;


	power_range_list = xbt_dynar_new(sizeof(xbt_dynar_t), NULL);
	xbt_dynar_t all_power_values = xbt_str_split(all_power_values_str, ",");

	pstate_nb = xbt_dynar_length(all_power_values);
	for (i=0; i< pstate_nb; i++)
	{
		/* retrieve the power values associated with the current pstate */
		current_power_values = xbt_str_split(xbt_dynar_get_as(all_power_values, i, char*), ":");
		xbt_assert(xbt_dynar_length(current_power_values) > 1,
				"Power properties incorrectly defined - could not retrieve min and max power values for host %s",
				cpu_model->generic_resource.name);

		/* min_power corresponds to the idle power (cpu load = 0) */
		/* max_power is the power consumed at 100% cpu load       */
		min_power = atof(xbt_dynar_get_as(current_power_values, 0, char*));
		max_power = atof(xbt_dynar_get_as(current_power_values, 1, char*));

		power_tuple = xbt_dynar_new(sizeof(double), NULL);
		xbt_dynar_push_as(power_tuple, double, min_power);
		xbt_dynar_push_as(power_tuple, double, max_power);

		xbt_dynar_push_as(power_range_list, xbt_dynar_t, power_tuple);
		xbt_dynar_free(&current_power_values);
	}
	xbt_dynar_free(&all_power_values);
	return power_range_list;

}

/**
 * Computes the power consumed by the host according to the current pstate and processor load
 *
 */
static double cpu_get_current_watts_value(cpu_Cas01_t cpu_model, double cpu_load)
{
	xbt_dynar_t power_range_list = cpu_model->energy->power_range_watts_list;

	if (power_range_list == NULL)
	{
		XBT_DEBUG("No power range properties specified for host %s", cpu_model->generic_resource.name);
		return 0;
	}
	xbt_assert(xbt_dynar_length(power_range_list) == xbt_dynar_length(cpu_model->power_peak_list),
						"The number of power ranges in the properties does not match the number of pstates for host %s",
						cpu_model->generic_resource.name);

    /* retrieve the power values associated with the current pstate */
    xbt_dynar_t current_power_values = xbt_dynar_get_as(power_range_list, cpu_model->pstate, xbt_dynar_t);

    /* min_power corresponds to the idle power (cpu load = 0) */
    /* max_power is the power consumed at 100% cpu load       */
    double min_power = xbt_dynar_get_as(current_power_values, 0, double);
    double max_power = xbt_dynar_get_as(current_power_values, 1, double);
    double power_slope = max_power - min_power;

    double current_power = min_power + cpu_load * power_slope;

	XBT_DEBUG("[get_current_watts] min_power=%f, max_power=%f, slope=%f", min_power, max_power, power_slope);
    XBT_DEBUG("[get_current_watts] Current power (watts) = %f, load = %f", current_power, cpu_load);

	return current_power;

}

/**
 * Updates the total energy consumed as the sum of the current energy and
 * 						 the energy consumed by the current action
 */
void cpu_update_energy(cpu_Cas01_t cpu_model, double cpu_load)
{

  double start_time = cpu_model->energy->last_updated;
  double finish_time = surf_get_clock();

  XBT_DEBUG("[cpu_update_energy] action time interval=(%f-%f), current power peak=%f, current pstate=%d",
		  start_time, finish_time, cpu_model->power_peak, cpu_model->pstate);
  double current_energy = cpu_model->energy->total_energy;
  double action_energy = cpu_get_current_watts_value(cpu_model, cpu_load)*(finish_time-start_time);

  cpu_model->energy->total_energy = current_energy + action_energy;
  cpu_model->energy->last_updated = finish_time;

  XBT_DEBUG("[cpu_update_energy] old_energy_value=%f, action_energy_value=%f", current_energy, action_energy);

}

static void cpu_update_resource_state(void *id,
                                      tmgr_trace_event_t event_type,
                                      double value, double date)
{
  cpu_Cas01_t cpu = id;
  lmm_variable_t var = NULL;
  lmm_element_t elem = NULL;
  surf_model_t cpu_model = ((surf_resource_t) cpu)->model;

  if (event_type == cpu->power_event) {
    /* TODO (Hypervisor): do the same thing for constraint_core[i] */
    xbt_assert(cpu->core == 1, "FIXME: add power scaling code also for constraint_core[i]");

    cpu->power_scale = value;
    lmm_update_constraint_bound(cpu_model->model_private->maxmin_system, cpu->constraint,
                                cpu->core * cpu->power_scale *
                                cpu->power_peak);
#ifdef HAVE_TRACING
    TRACE_surf_host_set_power(date, cpu->generic_resource.name,
                              cpu->core * cpu->power_scale *
                              cpu->power_peak);
#endif
    while ((var = lmm_get_var_from_cnst
            (cpu_model->model_private->maxmin_system, cpu->constraint, &elem))) {
      surf_action_cpu_Cas01_t action = lmm_variable_id(var);
      lmm_update_variable_bound(cpu_model->model_private->maxmin_system,
                                GENERIC_LMM_ACTION(action).variable,
                                cpu->power_scale * cpu->power_peak);
    }
    if (tmgr_trace_event_free(event_type))
      cpu->power_event = NULL;
  } else if (event_type == cpu->state_event) {
    /* TODO (Hypervisor): do the same thing for constraint_core[i] */
    xbt_assert(cpu->core == 1, "FIXME: add state change code also for constraint_core[i]");

    if (value > 0) {
      if(cpu->state_current == SURF_RESOURCE_OFF)
        xbt_dynar_push_as(host_that_restart, char*, (cpu->generic_resource.name));
      cpu->state_current = SURF_RESOURCE_ON;
    } else {
      lmm_constraint_t cnst = cpu->constraint;

      cpu->state_current = SURF_RESOURCE_OFF;

      while ((var = lmm_get_var_from_cnst(cpu_model->model_private->maxmin_system, cnst, &elem))) {
        surf_action_t action = lmm_variable_id(var);

        if (surf_action_state_get(action) == SURF_ACTION_RUNNING ||
            surf_action_state_get(action) == SURF_ACTION_READY ||
            surf_action_state_get(action) ==
            SURF_ACTION_NOT_IN_THE_SYSTEM) {
          action->finish = date;
          surf_action_state_set(action, SURF_ACTION_FAILED);
        }
      }
    }
    if (tmgr_trace_event_free(event_type))
      cpu->state_event = NULL;
  } else {
    XBT_CRITICAL("Unknown event ! \n");
    xbt_abort();
  }

  return;
}


/*
 *
 * This function formulates a constraint problem that pins a given task to
 * particular cores. Currently, it is possible to pin a task to an exactly one
 * specific core. The system links the variable object of the task to the
 * per-core constraint object.
 *
 * But, the taskset command on Linux takes a mask value specifying a CPU
 * affinity setting of a given task. If the mask value is 0x03, the given task
 * will be executed on the first core (CPU0) or the second core (CPU1) on the
 * given PM. The schedular will determine appropriate placements of tasks,
 * considering given CPU affinities and task activities.
 *
 * How should the system formulate constraint problems for an affinity to
 * multiple cores?
 *
 * The cpu argument must be the host where the task is being executed. The
 * action object does not have the information about the location where the
 * action is being executed.
 */
static void cpu_action_set_affinity(surf_action_t action, void *cpu, unsigned long mask)
{
  lmm_variable_t var_obj = ((surf_action_lmm_t) action)->variable;

  surf_model_t cpu_model = action->model_obj;
  xbt_assert(cpu_model->type == SURF_MODEL_TYPE_CPU);
  cpu_Cas01_t CPU = surf_cpu_resource_priv(cpu);

  XBT_IN("(%p,%lx)", action, mask);

  {
    unsigned long nbits = 0;

    /* FIXME: There is much faster algorithms doing this. */
    unsigned long i;
    for (i = 0; i < CPU->core; i++) {
      unsigned long has_affinity = (1UL << i) & mask;
      if (has_affinity)
        nbits += 1;
    }

    if (nbits > 1) {
      XBT_CRITICAL("Do not specify multiple cores for an affinity mask.");
      XBT_CRITICAL("See the comment in cpu_action_set_affinity().");
      DIE_IMPOSSIBLE;
    }
  }



  unsigned long i;
  for (i = 0; i < CPU->core; i++) {
    XBT_DEBUG("clear affinity %p to cpu-%lu@%s", action, i, CPU->generic_resource.name);
    lmm_shrink(cpu_model->model_private->maxmin_system, CPU->constraint_core[i], var_obj);

    unsigned long has_affinity = (1UL << i) & mask;
    if (has_affinity) {
      /* This function only accepts an affinity setting on the host where the
       * task is now running. In future, a task might move to another host.
       * But, at this moment, this function cannot take an affinity setting on
       * that future host.
       *
       * It might be possible to extend the code to allow this function to
       * accept affinity settings on a future host. We might be able to assign
       * zero to elem->value to maintain such inactive affinity settings in the
       * system. But, this will make the system complex. */
      XBT_DEBUG("set affinity %p to cpu-%lu@%s", action, i, CPU->generic_resource.name);
      lmm_expand(cpu_model->model_private->maxmin_system, CPU->constraint_core[i], var_obj, 1.0);
    }
  }

  if (cpu_model->model_private->update_mechanism == UM_LAZY) {
    /* FIXME (hypervisor): Do we need to do something for the LAZY mode? */
  }

  XBT_OUT();
}

static surf_action_t cpu_execute(void *cpu, double size)
{
  surf_action_cpu_Cas01_t action = NULL;
  //xbt_dict_cursor_t cursor = NULL;
  cpu_Cas01_t CPU = surf_cpu_resource_priv(cpu);
  surf_model_t cpu_model = ((surf_resource_t) CPU)->model;

  XBT_IN("(%s,%g)", surf_resource_name(CPU), size);
  action =
      surf_action_new(sizeof(s_surf_action_cpu_Cas01_t), size,
                      cpu_model,
                      CPU->state_current != SURF_RESOURCE_ON);

  GENERIC_LMM_ACTION(action).suspended = 0;     /* Should be useless because of the
                                                   calloc but it seems to help valgrind... */

  /* Note (hypervisor): here, the bound value of the variable is set to the
   * capacity of a CPU core. But, after MSG_{task/vm}_set_bound() were added to
   * the hypervisor branch, this bound value is overwritten in
   * SIMIX_host_execute().
   * TODO: cleanup this.
   */
  GENERIC_LMM_ACTION(action).variable =
      lmm_variable_new(cpu_model->model_private->maxmin_system, action,
                       GENERIC_ACTION(action).priority,
                       CPU->power_scale * CPU->power_peak, 1 + CPU->core); // the basic constraint plus core-specific constraints
  if (cpu_model->model_private->update_mechanism == UM_LAZY) {
    GENERIC_LMM_ACTION(action).index_heap = -1;
    GENERIC_LMM_ACTION(action).last_update = surf_get_clock();
    GENERIC_LMM_ACTION(action).last_value = 0.0;
  }
  lmm_expand(cpu_model->model_private->maxmin_system, CPU->constraint,
             GENERIC_LMM_ACTION(action).variable, 1.0);
  XBT_OUT();
  return (surf_action_t) action;
}

static surf_action_t cpu_action_sleep(void *cpu, double duration)
{
  surf_action_cpu_Cas01_t action = NULL;
  cpu_Cas01_t CPU = surf_cpu_resource_priv(cpu);
  surf_model_t cpu_model = ((surf_resource_t) CPU)->model;

  if (duration > 0)
    duration = MAX(duration, MAXMIN_PRECISION);

  XBT_IN("(%s,%g)", surf_resource_name(surf_cpu_resource_priv(cpu)), duration);
  action = (surf_action_cpu_Cas01_t) cpu_execute(cpu, 1.0);
  // FIXME: sleep variables should not consume 1.0 in lmm_expand
  GENERIC_ACTION(action).max_duration = duration;
  GENERIC_LMM_ACTION(action).suspended = 2;
  if (duration == NO_MAX_DURATION) {
    /* Move to the *end* of the corresponding action set. This convention
       is used to speed up update_resource_state  */
    xbt_swag_remove(action, ((surf_action_t) action)->state_set);
    ((surf_action_t) action)->state_set =
        cpu_running_action_set_that_does_not_need_being_checked;
    xbt_swag_insert(action, ((surf_action_t) action)->state_set);
  }

  lmm_update_variable_weight(cpu_model->model_private->maxmin_system,
                             GENERIC_LMM_ACTION(action).variable, 0.0);
  if (cpu_model->model_private->update_mechanism == UM_LAZY) {     // remove action from the heap
    surf_action_lmm_heap_remove(cpu_model->model_private->action_heap,(surf_action_lmm_t)action);
    // this is necessary for a variable with weight 0 since such
    // variables are ignored in lmm and we need to set its max_duration
    // correctly at the next call to share_resources
    xbt_swag_insert_at_head(action, cpu_model->model_private->modified_set);
  }

  XBT_OUT();
  return (surf_action_t) action;
}

static e_surf_resource_state_t cpu_get_state(void *cpu)
{
  return ((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->state_current;
}

static void cpu_set_state(void *cpu, e_surf_resource_state_t state)
{
  ((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->state_current = state;
}

static double cpu_get_speed(void *cpu, double load)
{
  return load * ((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->power_peak;
}

static int cpu_get_core(void *cpu)
{
  return ((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->core;
}
static double cpu_get_available_speed(void *cpu)
{
  /* number between 0 and 1 */
  return ((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->power_scale;
}

static double cpu_get_current_power_peak(void *cpu)
{
  return ((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->power_peak;
}

static double cpu_get_power_peak_at(void *cpu, int pstate_index)
{
  xbt_dynar_t plist = ((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->power_peak_list;
  xbt_assert((pstate_index <= xbt_dynar_length(plist)), "Invalid parameters (pstate index out of bounds)");

  return xbt_dynar_get_as(plist, pstate_index, double);
}

static int cpu_get_nb_pstates(void *cpu)
{
  return xbt_dynar_length(((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->power_peak_list);
}

static void cpu_set_power_peak_at(void *cpu, int pstate_index)
{
  cpu_Cas01_t cpu_implem = (cpu_Cas01_t)surf_cpu_resource_priv(cpu);
  xbt_dynar_t plist = cpu_implem->power_peak_list;
  xbt_assert((pstate_index <= xbt_dynar_length(plist)), "Invalid parameters (pstate index out of bounds)");

  double new_power_peak = xbt_dynar_get_as(plist, pstate_index, double);
  cpu_implem->pstate = pstate_index;
  cpu_implem->power_peak = new_power_peak;
}

static double cpu_get_consumed_energy(void *cpu)
{
  return ((cpu_Cas01_t)surf_cpu_resource_priv(cpu))->energy->total_energy;
}

static void cpu_finalize(surf_model_t cpu_model)
{
  lmm_system_free(cpu_model->model_private->maxmin_system);
  cpu_model->model_private->maxmin_system = NULL;

  if (cpu_model->model_private->action_heap)
    xbt_heap_free(cpu_model->model_private->action_heap);
  xbt_swag_free(cpu_model->model_private->modified_set);

  surf_model_exit(cpu_model);
  cpu_model = NULL;

  xbt_swag_free(cpu_running_action_set_that_does_not_need_being_checked);
  cpu_running_action_set_that_does_not_need_being_checked = NULL;
}

static surf_model_t surf_cpu_model_init_cas01(void)
{
  s_surf_action_t action;
  s_surf_action_cpu_Cas01_t comp;

  char *optim = xbt_cfg_get_string(_sg_cfg_set, "cpu/optim");
  int select =
      xbt_cfg_get_boolean(_sg_cfg_set, "cpu/maxmin_selective_update");

  surf_model_t cpu_model = surf_model_init();

  if (!strcmp(optim, "Full")) {
    cpu_model->model_private->update_mechanism = UM_FULL;
    cpu_model->model_private->selective_update = select;
  } else if (!strcmp(optim, "Lazy")) {
    cpu_model->model_private->update_mechanism = UM_LAZY;
    cpu_model->model_private->selective_update = 1;
    xbt_assert((select == 1)
               ||
               (xbt_cfg_is_default_value
                (_sg_cfg_set, "cpu/maxmin_selective_update")),
               "Disabling selective update while using the lazy update mechanism is dumb!");
  } else {
    xbt_die("Unsupported optimization (%s) for this model", optim);
  }

  cpu_running_action_set_that_does_not_need_being_checked =
      xbt_swag_new(xbt_swag_offset(action, state_hookup));

  cpu_model->name = "cpu";
  cpu_model->type = SURF_MODEL_TYPE_CPU;

  cpu_model->action_unref = surf_action_unref;
  cpu_model->action_cancel = surf_action_cancel;
  cpu_model->action_state_set = surf_action_state_set;

  cpu_model->model_private->resource_used = cpu_resource_used;

  if (cpu_model->model_private->update_mechanism == UM_LAZY) {
    cpu_model->model_private->share_resources =
        cpu_share_resources_lazy;
    cpu_model->model_private->update_actions_state =
        cpu_update_actions_state_lazy;
  } else if (cpu_model->model_private->update_mechanism == UM_FULL) {
    cpu_model->model_private->share_resources =
        cpu_share_resources_full;
    cpu_model->model_private->update_actions_state =
        cpu_update_actions_state_full;
  } else
    xbt_die("Invalid cpu update mechanism!");

  cpu_model->model_private->update_resource_state =
      cpu_update_resource_state;
  cpu_model->model_private->finalize = cpu_finalize;

  cpu_model->suspend = surf_action_suspend;
  cpu_model->resume = surf_action_resume;
  cpu_model->is_suspended = surf_action_is_suspended;
  cpu_model->set_max_duration = surf_action_set_max_duration;
  cpu_model->set_priority = surf_action_set_priority;
  cpu_model->set_bound = surf_action_set_bound;
  cpu_model->set_affinity = cpu_action_set_affinity;
#ifdef HAVE_TRACING
  cpu_model->set_category = surf_action_set_category;
#endif
  cpu_model->get_remains = surf_action_get_remains;

  cpu_model->extension.cpu.execute = cpu_execute;
  cpu_model->extension.cpu.sleep = cpu_action_sleep;

  cpu_model->extension.cpu.get_state = cpu_get_state;
  cpu_model->extension.cpu.set_state = cpu_set_state;
  cpu_model->extension.cpu.get_core = cpu_get_core;
  cpu_model->extension.cpu.get_speed = cpu_get_speed;
  cpu_model->extension.cpu.get_available_speed =
      cpu_get_available_speed;
  cpu_model->extension.cpu.get_current_power_peak = cpu_get_current_power_peak;
  cpu_model->extension.cpu.get_power_peak_at = cpu_get_power_peak_at;
  cpu_model->extension.cpu.get_nb_pstates = cpu_get_nb_pstates;
  cpu_model->extension.cpu.set_power_peak_at = cpu_set_power_peak_at;
  cpu_model->extension.cpu.get_consumed_energy = cpu_get_consumed_energy;

  cpu_model->extension.cpu.add_traces = cpu_add_traces_cpu;

  if (!cpu_model->model_private->maxmin_system) {
    cpu_model->model_private->maxmin_system = lmm_system_new(cpu_model->model_private->selective_update);
  }
  if (cpu_model->model_private->update_mechanism == UM_LAZY) {
    cpu_model->model_private->action_heap = xbt_heap_new(8, NULL);
    xbt_heap_set_update_callback(cpu_model->model_private->action_heap,
        surf_action_lmm_update_index_heap);
    cpu_model->model_private->modified_set =
        xbt_swag_new(xbt_swag_offset(comp, generic_lmm_action.action_list_hookup));
    cpu_model->model_private->maxmin_system->keep_track = cpu_model->model_private->modified_set;
  }

  return cpu_model;
}

/*********************************************************************/
/* Basic sharing model for CPU: that is where all this started... ;) */
/*********************************************************************/
/* @InProceedings{casanova01simgrid, */
/*   author =       "H. Casanova", */
/*   booktitle =    "Proceedings of the IEEE Symposium on Cluster Computing */
/*                  and the Grid (CCGrid'01)", */
/*   publisher =    "IEEE Computer Society", */
/*   title =        "Simgrid: {A} Toolkit for the Simulation of Application */
/*                  Scheduling", */
/*   year =         "2001", */
/*   month =        may, */
/*   note =         "Available at */
/*                  \url{http://grail.sdsc.edu/papers/simgrid_ccgrid01.ps.gz}." */
/* } */


void surf_cpu_model_init_Cas01(void)
{
  char *optim = xbt_cfg_get_string(_sg_cfg_set, "cpu/optim");

  xbt_assert(!surf_cpu_model_pm);
  xbt_assert(!surf_cpu_model_vm);

  if (strcmp(optim, "TI") == 0) {
    /* FIXME: do we have to supprot TI? for VM */
    surf_cpu_model_pm = surf_cpu_model_init_ti();
    XBT_INFO("TI model is used (it will crashed since this is the hypervisor branch)");
  } else {
    surf_cpu_model_pm  = surf_cpu_model_init_cas01();
    surf_cpu_model_vm  = surf_cpu_model_init_cas01();

    /* cpu_model is registered only to model_list, and not to
     * model_list_invoke. The shared_resource callback function will be called
     * from that of the workstation model. */
    xbt_dynar_push(model_list, &surf_cpu_model_pm);
    xbt_dynar_push(model_list, &surf_cpu_model_vm);

    cpu_define_callbacks_cas01();
  }
}

/* TODO: do we address nested virtualization later? */
#if 0
surf_model_t cpu_model_cas01(int level){
	// TODO this table should be allocated
	if(!surf_cpu_model[level])
	 // allocate it
	return surf_cpu_model[level];
}
#endif
