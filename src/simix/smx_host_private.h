/* Copyright (c) 2007-2010, 2012-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#ifndef _SIMIX_HOST_PRIVATE_H
#define _SIMIX_HOST_PRIVATE_H

#include "simgrid/simix.h"
#include "smx_smurf_private.h"

/** @brief Host datatype */
typedef struct s_smx_host_priv {
  xbt_swag_t process_list;
  xbt_dynar_t auto_restart_processes;
  xbt_dynar_t boot_processes; 
  void *data;              /**< @brief user data */
} s_smx_host_priv_t;

static inline smx_host_priv_t SIMIX_host_priv(smx_host_t host){
  return xbt_lib_get_level(host, SIMIX_HOST_LEVEL);
}

void _SIMIX_host_free_process_arg(void *);

smx_host_t SIMIX_host_create(const char *name, void *workstation, void *data);
void SIMIX_host_destroy(void *host);

void SIMIX_host_add_auto_restart_process(smx_host_t host,
                                         const char *name,
                                         xbt_main_func_t code,
                                         void *data,
                                         const char *hostname,
                                         double kill_time,
                                         int argc, char **argv,
                                         xbt_dict_t properties,
                                         int auto_restart);

void SIMIX_host_restart_processes(smx_host_t host);
void SIMIX_host_autorestart(smx_host_t host);
xbt_dict_t SIMIX_host_get_properties(smx_host_t host);
int SIMIX_host_get_core(smx_host_t host);
xbt_swag_t SIMIX_host_get_process_list(smx_host_t host);
double SIMIX_host_get_speed(smx_host_t host);
double SIMIX_host_get_available_speed(smx_host_t host);
int SIMIX_host_get_state(smx_host_t host);
void SIMIX_host_on(smx_host_t host);
void SIMIX_host_off(smx_host_t host, smx_process_t issuer);
double SIMIX_host_get_current_power_peak(smx_host_t host);
double SIMIX_host_get_power_peak_at(smx_host_t host, int pstate_index);
int SIMIX_host_get_nb_pstates(smx_host_t host);
double SIMIX_host_get_consumed_energy(smx_host_t host);
void SIMIX_host_set_power_peak_at(smx_host_t host, int pstate_index);
smx_action_t SIMIX_host_execute(const char *name,
    smx_host_t host, double computation_amount, double priority, double bound, unsigned long affinity_mask);
smx_action_t SIMIX_host_parallel_execute(const char *name,
    int host_nb, smx_host_t *host_list,
    double *computation_amount, double *communication_amount,
    double amount, double rate);
void SIMIX_host_execution_destroy(smx_action_t action);
void SIMIX_host_execution_cancel(smx_action_t action);
double SIMIX_host_execution_get_remains(smx_action_t action);
e_smx_state_t SIMIX_host_execution_get_state(smx_action_t action);
void SIMIX_host_execution_set_priority(smx_action_t action, double priority);
void SIMIX_host_execution_set_bound(smx_action_t action, double bound);
void SIMIX_host_execution_set_affinity(smx_action_t action, smx_host_t host, unsigned long mask);
void SIMIX_pre_host_execution_wait(smx_simcall_t simcall, smx_action_t action);
xbt_dict_t SIMIX_host_get_storage_list(smx_host_t host);

// pre prototypes
smx_host_t SIMIX_pre_host_get_by_name(smx_simcall_t, const char*);
const char* SIMIX_pre_host_self_get_name(smx_simcall_t);
const char* SIMIX_pre_host_get_name(smx_simcall_t, smx_host_t);
void SIMIX_pre_host_on(smx_simcall_t, smx_host_t host);
void SIMIX_pre_host_off(smx_simcall_t, smx_host_t host);
xbt_dict_t SIMIX_pre_host_get_properties(smx_simcall_t, smx_host_t);
int SIMIX_pre_host_get_core(smx_simcall_t, smx_host_t);
xbt_swag_t SIMIX_pre_host_get_process_list(smx_simcall_t, smx_host_t host);
double SIMIX_pre_host_get_speed(smx_simcall_t, smx_host_t);
double SIMIX_pre_host_get_available_speed(smx_simcall_t, smx_host_t);
int SIMIX_pre_host_get_state(smx_simcall_t, smx_host_t);
double SIMIX_pre_host_get_current_power_peak(smx_simcall_t, smx_host_t);
double SIMIX_pre_host_get_power_peak_at(smx_simcall_t, smx_host_t host, int pstate_index);
int SIMIX_pre_host_get_nb_pstates(smx_simcall_t, smx_host_t host);
void SIMIX_pre_host_set_power_peak_at(smx_simcall_t, smx_host_t host, int pstate_index);
double SIMIX_pre_host_get_consumed_energy(smx_simcall_t, smx_host_t);
void* SIMIX_pre_host_self_get_data(smx_simcall_t);
void* SIMIX_pre_host_get_data(smx_simcall_t, smx_host_t);
void SIMIX_pre_host_set_data(smx_simcall_t, smx_host_t, void*);
smx_action_t SIMIX_pre_host_execute(smx_simcall_t, const char*, smx_host_t, double, double, double, unsigned long);
smx_action_t SIMIX_pre_host_parallel_execute(smx_simcall_t, const char*, int, smx_host_t*,
                                             double*, double*, double, double);
void SIMIX_pre_host_execution_destroy(smx_simcall_t, smx_action_t);
void SIMIX_pre_host_execution_cancel(smx_simcall_t, smx_action_t);
double SIMIX_pre_host_execution_get_remains(smx_simcall_t, smx_action_t);
e_smx_state_t SIMIX_pre_host_execution_get_state(smx_simcall_t, smx_action_t);
void SIMIX_pre_host_execution_set_priority(smx_simcall_t, smx_action_t, double);
void SIMIX_pre_host_execution_set_bound(smx_simcall_t simcall, smx_action_t action, double bound);
void SIMIX_pre_host_execution_set_affinity(smx_simcall_t simcall, smx_action_t action, smx_host_t host, unsigned long mask);

void SIMIX_host_execution_suspend(smx_action_t action);
void SIMIX_host_execution_resume(smx_action_t action);

void SIMIX_post_host_execute(smx_action_t action);
xbt_dict_t SIMIX_pre_host_get_storage_list(smx_simcall_t, smx_host_t);
#ifdef HAVE_TRACING
void SIMIX_pre_set_category(smx_simcall_t simcall, smx_action_t action,
		            const char *category);
void SIMIX_set_category(smx_action_t action, const char *category);
#endif



/* vm related stuff */
smx_host_t SIMIX_vm_create(const char *name, smx_host_t ind_phys_host);
smx_host_t SIMIX_pre_vm_create(smx_simcall_t simcall, const char *name, smx_host_t ind_phys_host);

void SIMIX_vm_destroy(smx_host_t ind_vm);
void SIMIX_pre_vm_destroy(smx_simcall_t simcall, smx_host_t ind_vm);
// --
void SIMIX_vm_resume(smx_host_t ind_vm, smx_process_t issuer);
void SIMIX_pre_vm_resume(smx_simcall_t simcall, smx_host_t ind_vm);

void SIMIX_vm_suspend(smx_host_t ind_vm, smx_process_t issuer);
void SIMIX_pre_vm_suspend(smx_simcall_t simcall, smx_host_t ind_vm);
// --
void SIMIX_vm_save(smx_host_t ind_vm, smx_process_t issuer);
void SIMIX_pre_vm_save(smx_simcall_t simcall, smx_host_t ind_vm);

void SIMIX_vm_restore(smx_host_t ind_vm, smx_process_t issuer);
void SIMIX_pre_vm_restore(smx_simcall_t simcall, smx_host_t ind_vm);
// --
void SIMIX_vm_start(smx_host_t ind_vm);
void SIMIX_pre_vm_start(smx_simcall_t simcall, smx_host_t ind_vm);

void SIMIX_vm_shutdown(smx_host_t ind_vm, smx_process_t issuer);
void SIMIX_pre_vm_shutdown(smx_simcall_t simcall, smx_host_t ind_vm);
// --
void SIMIX_vm_set_state(smx_host_t ind_vm, int state);
void SIMIX_pre_vm_set_state(smx_simcall_t simcall, smx_host_t ind_vm, int state);

int SIMIX_vm_get_state(smx_host_t ind_vm);
int SIMIX_pre_vm_get_state(smx_simcall_t simcall, smx_host_t ind_vm);
// --
void SIMIX_vm_migrate(smx_host_t ind_vm, smx_host_t ind_dst_pm);
void SIMIX_pre_vm_migrate(smx_simcall_t simcall, smx_host_t ind_vm, smx_host_t ind_dst_pm);

void *SIMIX_vm_get_pm(smx_host_t ind_vm);
void *SIMIX_pre_vm_get_pm(smx_simcall_t simcall, smx_host_t ind_vm);

void SIMIX_vm_set_bound(smx_host_t ind_vm, double bound);
void SIMIX_pre_vm_set_bound(smx_simcall_t simcall, smx_host_t ind_vm, double bound);

void SIMIX_vm_set_affinity(smx_host_t ind_vm, smx_host_t ind_pm, unsigned long mask);
void SIMIX_pre_vm_set_affinity(smx_simcall_t simcall, smx_host_t ind_vm, smx_host_t ind_pm, unsigned long mask);

void SIMIX_host_get_params(smx_host_t ind_vm, ws_params_t params);
void SIMIX_pre_host_get_params(smx_simcall_t simcall, smx_host_t ind_vm, ws_params_t params);

void SIMIX_host_set_params(smx_host_t ind_vm, ws_params_t params);
void SIMIX_pre_host_set_params(smx_simcall_t simcall, smx_host_t ind_vm, ws_params_t params);

#endif

