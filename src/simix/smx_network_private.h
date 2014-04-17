/* Copyright (c) 2007-2010, 2012-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#ifndef _SIMIX_NETWORK_PRIVATE_H
#define _SIMIX_NETWORK_PRIVATE_H

#include "simgrid/simix.h"
#include "smx_smurf_private.h"

/** @brief Rendez-vous point datatype */
typedef struct s_smx_rvpoint {
  char *name;
  xbt_fifo_t comm_fifo;
  void *data;
  smx_process_t permanent_receiver; //process which the mailbox is attached to
  xbt_fifo_t done_comm_fifo;//messages already received in the permanent receive mode
} s_smx_rvpoint_t;

void SIMIX_network_init(void);
void SIMIX_network_exit(void);

#ifdef HAVE_LATENCY_BOUND_TRACKING
XBT_INLINE XBT_PUBLIC(int) SIMIX_comm_is_latency_bounded(smx_action_t comm);
#endif

smx_rdv_t SIMIX_rdv_create(const char *name);
void SIMIX_rdv_destroy(smx_rdv_t rdv);
smx_rdv_t SIMIX_rdv_get_by_name(const char *name);
void SIMIX_rdv_remove(smx_rdv_t rdv, smx_action_t comm);
int SIMIX_rdv_comm_count_by_host(smx_rdv_t rdv, smx_host_t host);
smx_action_t SIMIX_rdv_get_head(smx_rdv_t rdv);
void SIMIX_rdv_set_receiver(smx_rdv_t rdv, smx_process_t proc);
smx_process_t SIMIX_rdv_get_receiver(smx_rdv_t rdv);
void SIMIX_comm_start(smx_action_t action);
smx_action_t SIMIX_comm_isend(smx_process_t src_proc, smx_rdv_t rdv,
                              double task_size, double rate,
                              void *src_buff, size_t src_buff_size,
                              int (*match_fun)(void *, void *, smx_action_t),
                              void (*clean_fun)(void *), // used to free the action in case of problem after a detached send
                              void *data,
                              int detached);
smx_action_t SIMIX_comm_irecv(smx_process_t dst_proc, smx_rdv_t rdv,
                              void *dst_buff, size_t *dst_buff_size,
                              int (*)(void *, void *, smx_action_t), void *data);
smx_action_t SIMIX_comm_irecv_bounded(smx_process_t dst_proc, smx_rdv_t rdv,
                              void *dst_buff, size_t *dst_buff_size,
                              int (*)(void *, void *, smx_action_t), void *data, double rate);
void SIMIX_comm_destroy(smx_action_t action);
void SIMIX_comm_destroy_internal_actions(smx_action_t action);
smx_action_t SIMIX_comm_iprobe(smx_process_t dst_proc, smx_rdv_t rdv, int src,
                              int tag, int (*match_fun)(void *, void *, smx_action_t), void *data);
void SIMIX_pre_comm_wait(smx_simcall_t simcall, smx_action_t action, double timeout);
void SIMIX_pre_comm_waitany(smx_simcall_t simcall, xbt_dynar_t actions);
void SIMIX_post_comm(smx_action_t action);
void SIMIX_pre_comm_test(smx_simcall_t simcall, smx_action_t action);
void SIMIX_pre_comm_testany(smx_simcall_t simcall, xbt_dynar_t actions);
void SIMIX_comm_cancel(smx_action_t action);
double SIMIX_comm_get_remains(smx_action_t action);
e_smx_state_t SIMIX_comm_get_state(smx_action_t action);
void SIMIX_comm_suspend(smx_action_t action);
void SIMIX_comm_resume(smx_action_t action);
smx_process_t SIMIX_comm_get_src_proc(smx_action_t action);
smx_process_t SIMIX_comm_get_dst_proc(smx_action_t action);

// pre prototypes
smx_action_t SIMIX_pre_comm_iprobe(smx_simcall_t simcall, smx_rdv_t rdv,
                                   int src, int tag,
                                   int (*match_fun)(void *, void *, smx_action_t),
                                   void *data);
smx_rdv_t SIMIX_pre_rdv_create(smx_simcall_t simcall, const char *name);
void SIMIX_pre_rdv_destroy(smx_simcall_t simcall, smx_rdv_t rdv);
smx_rdv_t SIMIX_pre_rdv_get_by_name(smx_simcall_t simcall, const char *name);
int SIMIX_pre_rdv_comm_count_by_host(smx_simcall_t simcall, smx_rdv_t rdv, smx_host_t host);
smx_action_t SIMIX_pre_rdv_get_head(smx_simcall_t simcall, smx_rdv_t rdv);
smx_process_t SIMIX_pre_rdv_get_receiver(smx_simcall_t simcall, smx_rdv_t rdv);
void SIMIX_pre_rdv_set_receiver(smx_simcall_t simcall, smx_rdv_t rdv,
		            smx_process_t process);
void SIMIX_pre_comm_send(smx_simcall_t simcall, smx_rdv_t rdv,
                                  double task_size, double rate,
                                  void *src_buff, size_t src_buff_size,
                                  int (*match_fun)(void *, void *,smx_action_t),
				  void *data, double timeout);
smx_action_t SIMIX_pre_comm_isend(smx_simcall_t simcall, smx_rdv_t rdv,
                                  double task_size, double rate,
                                  void *src_buff, size_t src_buff_size,
                                  int (*match_fun)(void *, void *,smx_action_t),
                                  void (*clean_fun)(void *), 
				  void *data, int detached);
void SIMIX_pre_comm_recv(smx_simcall_t simcall, smx_rdv_t rdv,
                                  void *dst_buff, size_t *dst_buff_size,
                                  int (*match_fun)(void *, void *, smx_action_t),
				  void *data, double timeout);
void SIMIX_pre_comm_recv_bounded(smx_simcall_t simcall, smx_rdv_t rdv,
                                  void *dst_buff, size_t *dst_buff_size,
                                  int (*match_fun)(void *, void *, smx_action_t),
				  void *data, double timeout, double rate);
smx_action_t SIMIX_pre_comm_irecv(smx_simcall_t simcall, smx_rdv_t rdv,
                                  void *dst_buff, size_t *dst_buff_size,
                                  int (*match_fun)(void *, void *, smx_action_t),
				  void *data);
smx_action_t SIMIX_pre_comm_irecv_bounded(smx_simcall_t simcall, smx_rdv_t rdv,
                                  void *dst_buff, size_t *dst_buff_size,
                                  int (*match_fun)(void *, void *, smx_action_t),
				  void *data, double rate);
void SIMIX_pre_comm_destroy(smx_simcall_t simcall, smx_action_t action);
void SIMIX_pre_comm_cancel(smx_simcall_t simcall, smx_action_t action);
double SIMIX_pre_comm_get_remains(smx_simcall_t simcall, smx_action_t action);
e_smx_state_t SIMIX_pre_comm_get_state(smx_simcall_t simcall, smx_action_t action);
void* SIMIX_pre_comm_get_src_data(smx_simcall_t simcall, smx_action_t action);
void* SIMIX_pre_comm_get_dst_data(smx_simcall_t simcall, smx_action_t action);
smx_process_t SIMIX_pre_comm_get_src_proc(smx_simcall_t simcall, smx_action_t action);
smx_process_t SIMIX_pre_comm_get_dst_proc(smx_simcall_t simcall, smx_action_t action);
#ifdef HAVE_LATENCY_BOUND_TRACKING
int SIMIX_pre_comm_is_latency_bounded(smx_simcall_t simcall, smx_action_t action);
#endif
#endif

