/* Copyright (c) 2004-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#include "xbt/ex.h"
#include "xbt/dict.h"
#include "portable.h"
#include "surf_private.h"
#include "storage_private.h"
#include "surf/surf_resource.h"
#include "simgrid/sg_config.h"
#include "workstation_private.h"
#include "vm_workstation_private.h"
#include "cpu_cas01_private.h"
#include "maxmin_private.h"

XBT_LOG_NEW_DEFAULT_SUBCATEGORY(surf_workstation, surf,
                                "Logging specific to the SURF workstation module");

surf_model_t surf_workstation_model = NULL;


static void workstation_new(sg_platf_host_cbarg_t host)
{
  const char *name = host->id;

  /* NOTE: The properties object is NULL, because the current code uses that of
   * that of a cpu resource. */
  workstation_CLM03_t ws = (workstation_CLM03_t) surf_resource_new(sizeof(s_workstation_CLM03_t), surf_workstation_model, name, NULL, NULL);

  ws->storage = xbt_lib_get_or_null(storage_lib, name, ROUTING_STORAGE_HOST_LEVEL);
  ws->net_elm = xbt_lib_get_or_null(host_lib, name, ROUTING_HOST_LEVEL);

  XBT_DEBUG("Create ws %s with %ld mounted disks", name, xbt_dynar_length(ws->storage));
  xbt_lib_set(host_lib, name, SURF_WKS_LEVEL, ws);
}

static void ws_parallel_action_cancel(surf_action_t action)
{
  THROW_UNIMPLEMENTED;          /* This model does not implement parallel tasks */
}

static int ws_parallel_action_free(surf_action_t action)
{
  THROW_UNIMPLEMENTED;          /* This model does not implement parallel tasks */
  return -1;
}

int ws_action_unref(surf_action_t action)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    return surf_network_model->action_unref(action);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    return action->model_obj->action_unref(action);
      // previously was: Adrien/Arnaud 6 feb
  	  // surf_cpu_model->action_unref(action);
  else if (action->model_obj->type == SURF_MODEL_TYPE_WORKSTATION)
    return ws_parallel_action_free(action);
  else
    DIE_IMPOSSIBLE;
  return 0;
}

void ws_action_cancel(surf_action_t action)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    surf_network_model->action_cancel(action);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->action_cancel(action);
  else if (action->model_obj->type == SURF_MODEL_TYPE_WORKSTATION)
    ws_parallel_action_cancel(action);
  else
    DIE_IMPOSSIBLE;
  return;
}

static void ws_action_state_set(surf_action_t action,
                                e_surf_action_state_t state)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    surf_network_model->action_state_set(action, state);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->action_state_set(action, state);
  else if (action->model_obj->type == SURF_MODEL_TYPE_WORKSTATION)
    surf_action_state_set(action, state);
  else
    DIE_IMPOSSIBLE;
  return;
}


/* -- The callback functions at model_private -- */
/* These callbacks are also used for the vm workstation model. */
int ws_resource_used(void *resource_id)
{
  /* This model does not implement parallel tasks */
  THROW_IMPOSSIBLE;
  return -1;
}


/* TODO: iterating active constraint_set may be faster? */
#if 0
static void deactivate_dummy_cpu_action(void)
{
  lmm_system_t sys = surf_cpu_model_vm->model_private->maxmin_system;

  lmm_constraint_t cnst;
  xbt_swag_foreach(cnst, &sys->active_constraint_set) {
    /* get vcpu resource */
    surf_resource_t cpu = lmm_constraint_id(cnst);
    xbt_assert(cpu->model == surf_cpu_model_vm);

    /* get vm_ws resource */
    workstation_CLM03_t ws = xbt_lib_get_or_null(host_lib, cpu->name, SURF_WKS_LEVEL);

    /* make sure we can cast */
    xbt_assert(ws->generic_resouce.model == surf_vm_workstation_model);
    workstation_VM2013_t vm_ws = (workstation_VM2013_t) ws;

    /* make it active in the PM layer */
    surf_action_set_priority(vm_ws->cpu_action, 1);
  }
}
#endif


/* TODO: Delete this unused code if everything looks good. */
#if 0
static int constraint_is_active(cpu_Cas01_t cpu_cas01)
{
  surf_model_t cpu_model = cpu_cas01->generic_resource.model;
  lmm_system_t sys = cpu_model->model_private->maxmin_system;
  int found = 0;
  lmm_constraint_t cnst_tmp;

  xbt_swag_foreach(cnst_tmp, &sys->active_constraint_set) {
    if (cnst_tmp == cpu_cas01->constraint) {
      found = 1;
      break;
    }
  }

  return found;
}
#endif


/* Each VM has a dummy CPU action on the PM layer. This CPU action works as the
 * constraint (capacity) of the VM in the PM layer. If the VM does not have any
 * active task, the dummy CPU action must be deactivated, so that the VM does
 * not get any CPU share in the PM layer. */
static void adjust_weight_of_dummy_cpu_actions(void)
{
  /* iterate for all hosts including virtual machines */
  xbt_lib_cursor_t cursor;
  char *key;
  void **ind_host;

  xbt_lib_foreach(host_lib, cursor, key, ind_host) {
    workstation_CLM03_t ws_clm03 = ind_host[SURF_WKS_LEVEL];
    cpu_Cas01_t cpu_cas01 = ind_host[SURF_CPU_LEVEL];

    if (!ws_clm03)
      continue;
    /* skip if it is not a virtual machine */
    if (ws_clm03->generic_resource.model != surf_vm_workstation_model)
      continue;
    xbt_assert(cpu_cas01, "cpu-less workstation");

    /* It is a virtual machine, so we can cast it to workstation_VM2013_t */
    workstation_VM2013_t ws_vm2013 = (workstation_VM2013_t) ws_clm03;

    lmm_system_t sys = surf_cpu_model_vm->model_private->maxmin_system;
    int is_active = lmm_constraint_used(sys, cpu_cas01->constraint);
    // int is_active_old = constraint_is_active(cpu_cas01);

    // {
    //   xbt_assert(is_active == is_active_old, "%d %d", is_active, is_active_old);
    // }

    if (is_active) {
      /* some tasks exist on this VM */
      XBT_DEBUG("set the weight of the dummy CPU action on PM to 1");

      /* FIXME: we shoud use lmm_update_variable_weight() ? */
      /* FIXME: If we assgign 1.05 and 0.05, the system makes apparently wrong values. */
      surf_action_set_priority(ws_vm2013->cpu_action, 1);

    } else {
      /* no task exits on this VM */
      XBT_DEBUG("set the weight of the dummy CPU action on PM to 0");

      surf_action_set_priority(ws_vm2013->cpu_action, 0);
    }
  }
}


double ws_share_resources(surf_model_t workstation_model, double now)
{
  if (workstation_model->type == SURF_MODEL_TYPE_WORKSTATION)
    adjust_weight_of_dummy_cpu_actions();

  /* Invoke the share_resources() callback of the physical cpu model object and
   * the network model objects. */
  surf_model_t cpu_model = workstation_model->extension.workstation.cpu_model;
  surf_model_t net_model = surf_network_model;

  double min_by_cpu = cpu_model->model_private->share_resources(cpu_model, now);
  double min_by_net = net_model->model_private->share_resources(net_model, now);

  XBT_DEBUG("model %p, %s min_by_cpu %f, %s min_by_net %f",
      workstation_model, cpu_model->name, min_by_cpu, net_model->name, min_by_net);

  if (min_by_cpu >= 0.0 && min_by_net >= 0.0)
    return min(min_by_cpu, min_by_net);
  else if (min_by_cpu >= 0.0)
    return min_by_cpu;
  else if (min_by_net >= 0.0)
    return min_by_net;
  else
    return min_by_cpu;  /* probably min_by_cpu == min_by_net == -1 */
}

void ws_update_actions_state(surf_model_t workstation_model, double now, double delta)
{
  return;
}

void ws_update_resource_state(void *id, tmgr_trace_event_t event_type, double value, double date)
{
  /* This model does not implement parallel tasks */
  THROW_IMPOSSIBLE;
}

void ws_finalize(surf_model_t workstation_model)
{
  surf_model_exit(workstation_model);
  workstation_model = NULL;
}



surf_action_t ws_execute(void *workstation, double size)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.execute(workstation, size);
}

surf_action_t ws_action_sleep(void *workstation, double duration)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.sleep(workstation, duration);
}

void ws_action_suspend(surf_action_t action)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    surf_network_model->suspend(action);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->suspend(action);
  else
    DIE_IMPOSSIBLE;
}

void ws_action_resume(surf_action_t action)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    surf_network_model->resume(action);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->resume(action);
  else
    DIE_IMPOSSIBLE;
}

static int ws_action_is_suspended(surf_action_t action)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    return surf_network_model->is_suspended(action);
  if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    return action->model_obj->is_suspended(action);
  DIE_IMPOSSIBLE;
  return -1;
}

static void ws_action_set_max_duration(surf_action_t action,
                                       double duration)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    surf_network_model->set_max_duration(action, duration);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->set_max_duration(action, duration);
  else
    DIE_IMPOSSIBLE;
}

void ws_action_set_priority(surf_action_t action, double priority)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    surf_network_model->set_priority(action, priority);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->set_priority(action, priority);
  else
    DIE_IMPOSSIBLE;
}

void ws_action_set_bound(surf_action_t action, double bound)
{
  /* FIXME: only for CPU model object? */
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    surf_network_model->set_bound(action, bound);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->set_bound(action, bound);
  else
    DIE_IMPOSSIBLE;
}

void ws_action_set_affinity(surf_action_t action, void *workstation, unsigned long mask)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    DIE_IMPOSSIBLE;
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->set_affinity(action, workstation, mask);
  else
    DIE_IMPOSSIBLE;
}

#ifdef HAVE_TRACING
static void ws_action_set_category(surf_action_t action, const char *category)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    surf_network_model->set_category(action, category);
  else if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    action->model_obj->set_category(action, category);
  else
    DIE_IMPOSSIBLE;
}
#endif

#ifdef HAVE_LATENCY_BOUND_TRACKING
static int ws_get_latency_limited(surf_action_t action)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    return surf_network_model->get_latency_limited(action);
  else
    return 0;
}
#endif

double ws_action_get_remains(surf_action_t action)
{
  if (action->model_obj->type == SURF_MODEL_TYPE_NETWORK)
    return surf_network_model->get_remains(action);
  if (action->model_obj->type == SURF_MODEL_TYPE_CPU)
    return action->model_obj->get_remains(action);
  DIE_IMPOSSIBLE;
  return -1.0;
}

static surf_action_t ws_communicate(void *workstation_src,
                                    void *workstation_dst, double size,
                                    double rate)
{
  workstation_CLM03_t src = surf_workstation_resource_priv(workstation_src);
  workstation_CLM03_t dst = surf_workstation_resource_priv(workstation_dst);
  return surf_network_model->extension.network.
      communicate(src->net_elm,
                  dst->net_elm, size, rate);
}

e_surf_resource_state_t ws_get_state(void *workstation)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.get_state(workstation);
}

static void ws_set_state(void *workstation, e_surf_resource_state_t state)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  cpu->model->extension.cpu.set_state(workstation, state);
}

double ws_get_speed(void *workstation, double load)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.get_speed(workstation, load);
}

static int ws_get_core(void *workstation)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.get_core(workstation);
}
static double ws_get_available_speed(void *workstation)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.get_available_speed(workstation);
}

static double ws_get_current_power_peak(void *workstation)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.
      get_current_power_peak(workstation);
}

static double ws_get_power_peak_at(void *workstation, int pstate_index)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.
      get_power_peak_at(workstation, pstate_index);
}

static int ws_get_nb_pstates(void *workstation)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.
      get_nb_pstates(workstation);
}

static void ws_set_power_peak_at(void *workstation, int pstate_index)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  cpu->model->extension.cpu.
      set_power_peak_at(workstation, pstate_index);
}

static double ws_get_consumed_energy(void *workstation)
{
  surf_resource_t cpu = ((surf_resource_t) surf_cpu_resource_priv(workstation));
  return cpu->model->extension.cpu.
      get_consumed_energy(workstation);
}


static surf_action_t ws_execute_parallel_task(int workstation_nb,
                                              void **workstation_list,
                                              double *computation_amount,
                                              double *communication_amount,
                                              double rate)
{
#define cost_or_zero(array,pos) ((array)?(array)[pos]:0.0)
  if ((workstation_nb == 1)
      && (cost_or_zero(communication_amount, 0) == 0.0))
    return ws_execute(workstation_list[0], computation_amount[0]);
  else if ((workstation_nb == 1)
           && (cost_or_zero(computation_amount, 0) == 0.0))
    return ws_communicate(workstation_list[0], workstation_list[0],communication_amount[0], rate);
  else if ((workstation_nb == 2)
             && (cost_or_zero(computation_amount, 0) == 0.0)
             && (cost_or_zero(computation_amount, 1) == 0.0)) {
    int i,nb = 0;
    double value = 0.0;

    for (i = 0; i < workstation_nb * workstation_nb; i++) {
      if (cost_or_zero(communication_amount, i) > 0.0) {
        nb++;
        value = cost_or_zero(communication_amount, i);
      }
    }
    if (nb == 1)
      return ws_communicate(workstation_list[0], workstation_list[1],value, rate);
  }
#undef cost_or_zero

  THROW_UNIMPLEMENTED;          /* This model does not implement parallel tasks */
  return NULL;
}


/* returns an array of network_link_CM02_t */
static xbt_dynar_t ws_get_route(void *workstation_src, void *workstation_dst)
{
  XBT_DEBUG("ws_get_route");
  workstation_CLM03_t src = surf_workstation_resource_priv(workstation_src);
  workstation_CLM03_t dst = surf_workstation_resource_priv(workstation_dst);
  return surf_network_model->extension.
      network.get_route(src->net_elm,
                  dst->net_elm);
}

static double ws_get_link_bandwidth(const void *link)
{
  return surf_network_model->extension.network.get_link_bandwidth(link);
}

static double ws_get_link_latency(const void *link)
{
  return surf_network_model->extension.network.get_link_latency(link);
}

static int ws_link_shared(const void *link)
{
  return surf_network_model->extension.network.link_shared(link);
}

static xbt_dict_t ws_get_properties(const void *ws)
{
  return surf_resource_properties(surf_cpu_resource_priv(ws));
}

static storage_t find_storage_on_mount_list(void *workstation,const char* mount)
{
  storage_t st = NULL;
  s_mount_t mnt;
  unsigned int cursor;
  workstation_CLM03_t ws = (workstation_CLM03_t) surf_workstation_resource_priv(workstation);
  xbt_dynar_t storage_list = ws->storage;

  XBT_DEBUG("Search for storage name '%s' on '%s'",mount,ws->generic_resource.name);
  xbt_dynar_foreach(storage_list,cursor,mnt)
  {
    XBT_DEBUG("See '%s'",mnt.name);
    if(!strcmp(mount,mnt.name)){
      st = mnt.storage;
      break;
    }
  }
  if(!st) xbt_die("Can't find mount '%s' for '%s'",mount,ws->generic_resource.name);
  return st;
}

static xbt_dict_t ws_get_storage_list(void *workstation)
{
  s_mount_t mnt;
  unsigned int i;
  xbt_dict_t storage_list = xbt_dict_new_homogeneous(NULL);
  char *storage_name = NULL;

  workstation_CLM03_t ws = (workstation_CLM03_t) surf_workstation_resource_priv(workstation);
  xbt_dynar_t storages = ws->storage;

  xbt_dynar_foreach(storages,i,mnt){
    storage_name = ((storage_t)mnt.storage)->generic_resource.name;
    xbt_dict_set(storage_list,mnt.name,storage_name,NULL);
  }
  return storage_list;
}

static surf_action_t ws_action_open(void *workstation, const char* mount,
                                    const char* path)
{
  storage_t st = find_storage_on_mount_list(workstation, mount);
  XBT_DEBUG("OPEN on disk '%s'",st->generic_resource.name);
  surf_model_t model = st->generic_resource.model;
  return model->extension.storage.open(st, mount, path);
}

static surf_action_t ws_action_close(void *workstation, surf_file_t fd)
{
  storage_t st = find_storage_on_mount_list(workstation, fd->mount);
  XBT_DEBUG("CLOSE on disk '%s'",st->generic_resource.name);
  surf_model_t model = st->generic_resource.model;
  return model->extension.storage.close(st, fd);
}

static surf_action_t ws_action_read(void *workstation, surf_file_t fd, sg_storage_size_t size)
{
  storage_t st = find_storage_on_mount_list(workstation, fd->mount);
  XBT_DEBUG("READ on disk '%s'",st->generic_resource.name);
  surf_model_t model = st->generic_resource.model;
  return model->extension.storage.read(st, fd, size);
}

static surf_action_t ws_action_write(void *workstation, surf_file_t fd, sg_storage_size_t size)
{
  storage_t st = find_storage_on_mount_list(workstation, fd->mount);
  XBT_DEBUG("WRITE on disk '%s'",st->generic_resource.name);
  surf_model_t model = st->generic_resource.model;
  return model->extension.storage.write(st, fd, size);
}

static int ws_file_unlink(void *workstation, surf_file_t fd)
{
  if (!fd){
    XBT_WARN("No such file descriptor. Impossible to unlink");
    return 0;
  } else {
//    XBT_INFO("%s %zu", fd->storage, fd->size);
    storage_t st = find_storage_on_mount_list(workstation, fd->mount);
    xbt_dict_t content_dict = (st)->content;
    /* Check if the file is on this storage */
    if (!xbt_dict_get_or_null(content_dict, fd->name)){
      XBT_WARN("File %s is not on disk %s. Impossible to unlink", fd->name,
          st->generic_resource.name);
      return 0;
    } else {
      XBT_DEBUG("UNLINK on disk '%s'",st->generic_resource.name);
      st->used_size -= fd->size;

      // Remove the file from storage
      xbt_dict_remove(content_dict,fd->name);

      free(fd->name);
      free(fd->mount);
      xbt_free(fd);
      return 1;
    }
  }
}

static surf_action_t ws_action_ls(void *workstation, const char* mount,
                                  const char *path)
{
  XBT_DEBUG("LS on mount '%s' and file '%s'",mount, path);
  storage_t st = find_storage_on_mount_list(workstation, mount);
  surf_model_t model = st->generic_resource.model;
  return model->extension.storage.ls(st, path);
}

static sg_storage_size_t ws_file_get_size(void *workstation, surf_file_t fd)
{
  return fd->size;
}

static xbt_dynar_t ws_file_get_info(void *workstation, surf_file_t fd)
{
  storage_t st = find_storage_on_mount_list(workstation, fd->mount);
  sg_storage_size_t *psize = xbt_new(sg_storage_size_t, 1);
  *psize = fd->size;
  xbt_dynar_t info = xbt_dynar_new(sizeof(void*), NULL);
  xbt_dynar_push_as(info, sg_storage_size_t *, psize);
  xbt_dynar_push_as(info, void *, fd->mount);
  xbt_dynar_push_as(info, void *, st->generic_resource.name);
  xbt_dynar_push_as(info, void *, st->type_id);
  xbt_dynar_push_as(info, void *, st->content_type);

  return info;
}

static sg_storage_size_t ws_storage_get_free_size(void *workstation,const char* name)
{
  storage_t st = find_storage_on_mount_list(workstation, name);
  return st->size - st->used_size;
}

static sg_storage_size_t ws_storage_get_used_size(void *workstation,const char* name)
{
  storage_t st = find_storage_on_mount_list(workstation, name);
  return st->used_size;
}

void ws_get_params(void *ws, ws_params_t params)
{
  workstation_CLM03_t ws_clm03 = surf_workstation_resource_priv(ws);
  memcpy(params, &ws_clm03->params, sizeof(s_ws_params_t));
}

void ws_set_params(void *ws, ws_params_t params)
{
  workstation_CLM03_t ws_clm03 = surf_workstation_resource_priv(ws);
  /* may check something here. */
  memcpy(&ws_clm03->params, params, sizeof(s_ws_params_t));
}

static xbt_dynar_t ws_get_vms(void *pm)
{
  xbt_dynar_t dyn = xbt_dynar_new(sizeof(smx_host_t), NULL);

  /* iterate for all hosts including virtual machines */
  xbt_lib_cursor_t cursor;
  char *key;
  void **ind_host;
  xbt_lib_foreach(host_lib, cursor, key, ind_host) {
    workstation_CLM03_t ws_clm03 = ind_host[SURF_WKS_LEVEL];
    if (!ws_clm03)
      continue;
    /* skip if it is not a virtual machine */
    if (ws_clm03->generic_resource.model != surf_vm_workstation_model)
      continue;

    /* It is a virtual machine, so we can cast it to workstation_VM2013_t */
    workstation_VM2013_t ws_vm2013 = (workstation_VM2013_t) ws_clm03;
    if (pm == ws_vm2013->sub_ws)
      xbt_dynar_push(dyn, &ws_vm2013->sub_ws);
  }

  return dyn;
}


static void surf_workstation_model_init_internal(void)
{
  surf_model_t model = surf_model_init();

  model->name = "Workstation";
  model->type = SURF_MODEL_TYPE_WORKSTATION;
  model->action_unref     = ws_action_unref;
  model->action_cancel    = ws_action_cancel;
  model->action_state_set = ws_action_state_set;

  model->model_private->resource_used         = ws_resource_used;
  model->model_private->share_resources       = ws_share_resources;
  model->model_private->update_actions_state  = ws_update_actions_state;
  model->model_private->update_resource_state = ws_update_resource_state;
  model->model_private->finalize              = ws_finalize;

  model->suspend          = ws_action_suspend;
  model->resume           = ws_action_resume;
  model->is_suspended     = ws_action_is_suspended;
  model->set_max_duration = ws_action_set_max_duration;
  model->set_priority     = ws_action_set_priority;
  model->set_bound        = ws_action_set_bound;
  model->set_affinity     = ws_action_set_affinity;
  #ifdef HAVE_TRACING
  model->set_category     = ws_action_set_category;
  #endif
  model->get_remains      = ws_action_get_remains;
  #ifdef HAVE_LATENCY_BOUND_TRACKING
  model->get_latency_limited = ws_get_latency_limited;
  #endif

  /* For VM support, we have a surf cpu model object for each workstation model
   * object. The physical workstation model object has the cpu model object of
   * the physical machine layer. */
  xbt_assert(surf_cpu_model_pm);
  model->extension.workstation.cpu_model = surf_cpu_model_pm;

  model->extension.workstation.execute   = ws_execute;
  model->extension.workstation.sleep     = ws_action_sleep;
  model->extension.workstation.get_state = ws_get_state;
  model->extension.workstation.set_state = ws_set_state;
  model->extension.workstation.get_core  = ws_get_core;
  model->extension.workstation.get_speed = ws_get_speed;
  model->extension.workstation.get_available_speed =
      ws_get_available_speed;
  model->extension.workstation.get_current_power_peak = ws_get_current_power_peak;
  model->extension.workstation.get_power_peak_at = ws_get_power_peak_at;
  model->extension.workstation.get_nb_pstates = ws_get_nb_pstates;
  model->extension.workstation.set_power_peak_at = ws_set_power_peak_at;
  model->extension.workstation.get_consumed_energy = ws_get_consumed_energy;

  model->extension.workstation.communicate = ws_communicate;
  model->extension.workstation.get_route = ws_get_route;
  model->extension.workstation.execute_parallel_task = ws_execute_parallel_task;
  model->extension.workstation.get_link_bandwidth = ws_get_link_bandwidth;
  model->extension.workstation.get_link_latency = ws_get_link_latency;
  model->extension.workstation.link_shared = ws_link_shared;
  model->extension.workstation.get_properties = ws_get_properties;

  model->extension.workstation.open = ws_action_open;
  model->extension.workstation.close = ws_action_close;
  model->extension.workstation.read = ws_action_read;
  model->extension.workstation.write = ws_action_write;
  model->extension.workstation.unlink = ws_file_unlink;
  model->extension.workstation.ls = ws_action_ls;
  model->extension.workstation.get_size = ws_file_get_size;
  model->extension.workstation.get_info = ws_file_get_info;
  model->extension.workstation.get_free_size = ws_storage_get_free_size;
  model->extension.workstation.get_used_size = ws_storage_get_used_size;
  model->extension.workstation.get_storage_list = ws_get_storage_list;

  model->extension.workstation.get_params = ws_get_params;
  model->extension.workstation.set_params = ws_set_params;
  model->extension.workstation.get_vms    = ws_get_vms;

  surf_workstation_model = model;
}

void surf_workstation_model_init_current_default(void)
{
  xbt_cfg_setdefault_boolean(_sg_cfg_set, "network/crosstraffic", "yes");
  surf_cpu_model_init_Cas01();
  surf_network_model_init_LegrandVelho();

  /* surf_cpu_mode_pm and surf_network_model must be initialized in advance. */
  xbt_assert(surf_cpu_model_pm);
  xbt_assert(surf_network_model);
  surf_workstation_model_init_internal();

  xbt_dynar_push(model_list, &surf_workstation_model);
  xbt_dynar_push(model_list_invoke, &surf_workstation_model);
  sg_platf_host_add_cb(workstation_new);
}

void surf_workstation_model_init_compound()
{
  xbt_assert(surf_cpu_model_pm, "No CPU model defined yet!");
  xbt_assert(surf_network_model, "No network model defined yet!");

  surf_workstation_model_init_internal();
  xbt_dynar_push(model_list, &surf_workstation_model);
  xbt_dynar_push(model_list_invoke, &surf_workstation_model);
  sg_platf_host_add_cb(workstation_new);
}
