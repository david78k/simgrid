/* Copyright (c) 2007-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
  * under the terms of the license (GNU LGPL) which comes with this package. */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "private.h"
#include "smpi_mpi_dt_private.h"
#include "mc/mc.h"
#include "surf/surf.h"
#include "simix/smx_private.h"
#include "simgrid/sg_config.h"


XBT_LOG_NEW_DEFAULT_SUBCATEGORY(smpi_kernel, smpi,
                                "Logging specific to SMPI (kernel)");

typedef struct s_smpi_process_data {
  int index;
  int* argc;
  char*** argv;
  smx_rdv_t mailbox;
  smx_rdv_t mailbox_small;
  xbt_os_timer_t timer;
  double simulated;
  MPI_Comm comm_self;
  void *data; /* user data */
  int initialized;
} s_smpi_process_data_t;

static smpi_process_data_t *process_data = NULL;
static int process_count = 0;

MPI_Comm MPI_COMM_WORLD = MPI_COMM_NULL;
int MPI_UNIVERSE_SIZE;

MPI_Errhandler* MPI_ERRORS_RETURN = NULL;
MPI_Errhandler* MPI_ERRORS_ARE_FATAL = NULL;
MPI_Errhandler* MPI_ERRHANDLER_NULL = NULL;

#define MAILBOX_NAME_MAXLEN (5 + sizeof(int) * 2 + 1)

static char* get_mailbox_name(char* str, int index) {
  snprintf(str, MAILBOX_NAME_MAXLEN, "SMPI-%0*x", (int)(sizeof(int) * 2), index);
  return str;
}

static char* get_mailbox_name_small(char* str, int index) {
  snprintf(str, MAILBOX_NAME_MAXLEN, "small%0*x", (int)(sizeof(int) * 2), index);
  return str;
}

void smpi_process_init(int *argc, char ***argv)
{
  int index;
  smpi_process_data_t data;
  smx_process_t proc;

  if(argc && argv) {
    proc = SIMIX_process_self();
    index = atoi((*argv)[1]);
    data = smpi_process_remote_data(index);
    simcall_process_set_data(proc, data);
    if (*argc > 2) {
      free((*argv)[1]);
      memmove(&(*argv)[1], &(*argv)[2], sizeof(char *) * (*argc - 2));
      (*argv)[(*argc) - 1] = NULL;
    }
    (*argc)--;
    data->argc = argc;
    data->argv = argv;
    simcall_rdv_set_receiver(data->mailbox_small, proc);// set the process attached to the mailbox
    XBT_DEBUG("<%d> New process in the game: %p", index, proc);
  }
}

void smpi_process_destroy(void)
{
  int index = smpi_process_index();
  process_data[index]->index=-100;
  XBT_DEBUG("<%d> Process left the game", index);
}

/**
 * @brief Prepares the current process for termination.
 */
void smpi_process_finalize(void)
{
  // wait for all pending asynchronous comms to finish
  while (SIMIX_process_has_pending_comms(SIMIX_process_self())) {
    simcall_process_sleep(0.01);
  }
}

/**
 * @brief Check if a process is finalized
 */
int smpi_process_finalized()
{
   return (smpi_process_index()==-100);
  // If finalized, this value has been set to -100;
}

/**
 * @brief Check if a process is initialized
 */
int smpi_process_initialized(void)
{
  int index = smpi_process_index();
  return((index != -100) && (index!=MPI_UNDEFINED) && (process_data[index]->initialized));
}

/**
 * @brief Mark a process as initialized (=MPI_Init called)
 */
void smpi_process_mark_as_initialized(void)
{
  int index = smpi_process_index();
  if((index != -100)&& (index!=MPI_UNDEFINED))process_data[index]->initialized=1;
}


#ifdef SMPI_F2C
int smpi_process_argc(void) {
  smpi_process_data_t data = smpi_process_data();

  return data->argc ? *(data->argc) - 1 : 0;
}

int smpi_process_getarg(integer* index, char* dst, ftnlen len) {
  smpi_process_data_t data = smpi_process_data();
  char* arg;
  ftnlen i;

  if(!data->argc || !data->argv
     || *index < 1 || *index >= *(data->argc)) {
    return -1;
  }
  arg = (*data->argv)[*index];
  for(i = 0; i < len && arg[i] != '\0'; i++) {
    dst[i] = arg[i];
  }
  for(; i < len; i++) {
    dst[i] = ' ';
  }
  return 0;
}

int smpi_global_size(void) {
   char* value = getenv("SMPI_GLOBAL_SIZE");

   if(!value) {
     fprintf(stderr, "Please set env var SMPI_GLOBAL_SIZE to expected number of processes.\n");
     xbt_abort();
   }
   return atoi(value);
}
#endif

smpi_process_data_t smpi_process_data(void)
{
  return SIMIX_process_self_get_data(SIMIX_process_self());
}

smpi_process_data_t smpi_process_remote_data(int index)
{
  return process_data[index];
}

void smpi_process_set_user_data(void *data)
{
  smpi_process_data_t process_data = smpi_process_data();
  process_data->data = data;
}

void* smpi_process_get_user_data(){
  smpi_process_data_t process_data = smpi_process_data();
  return process_data->data;
}

int smpi_process_count(void)
{
  return process_count;
}

int smpi_process_index(void)
{
  smpi_process_data_t data = smpi_process_data();
  //return -1 if not initialized
  return data? data->index : MPI_UNDEFINED;
}

smx_rdv_t smpi_process_mailbox(void) {
  smpi_process_data_t data = smpi_process_data();

  return data->mailbox;
}

smx_rdv_t smpi_process_mailbox_small(void) {
  smpi_process_data_t data = smpi_process_data();

  return data->mailbox_small;
}

smx_rdv_t smpi_process_remote_mailbox(int index) {
  smpi_process_data_t data = smpi_process_remote_data(index);

  return data->mailbox;
}


smx_rdv_t smpi_process_remote_mailbox_small(int index) {
  smpi_process_data_t data = smpi_process_remote_data(index);

  return data->mailbox_small;
}

xbt_os_timer_t smpi_process_timer(void)
{
  smpi_process_data_t data = smpi_process_data();

  return data->timer;
}

void smpi_process_simulated_start(void) {
  smpi_process_data_t data = smpi_process_data();

  data->simulated = SIMIX_get_clock();
}

double smpi_process_simulated_elapsed(void) {
  smpi_process_data_t data = smpi_process_data();

  return SIMIX_get_clock() - data->simulated;
}

MPI_Comm smpi_process_comm_self(void) {
  smpi_process_data_t data = smpi_process_data();

  return data->comm_self;
}

void print_request(const char *message, MPI_Request request) {
  XBT_DEBUG("%s  request %p  [buf = %p, size = %zu, src = %d, dst = %d, tag = %d, flags = %x]",
         message, request, request->buf, request->size,
         request->src, request->dst, request->tag, request->flags);
}

static void SMPI_comm_copy_buffer_callback(smx_action_t comm, void* buff, size_t buff_size)
{
  XBT_DEBUG("Copy the data over");
  memcpy(comm->comm.dst_buff, buff, buff_size);
  if (comm->comm.detached) { // if this is a detached send, the source buffer was duplicated by SMPI sender to make the original buffer available to the application ASAP
    xbt_free(buff);
    //It seems that the request is used after the call there this should
    //be free somewhereelse  but where???
    //xbt_free(comm->comm.src_data);// inside SMPI the request is keep
    //inside the user data and should be free 
    comm->comm.src_buff = NULL;
  }
}

void smpi_global_init(void)
{
  int i;
  MPI_Group group;
  char name[MAILBOX_NAME_MAXLEN];

  SIMIX_comm_set_copy_data_callback(&SMPI_comm_copy_buffer_callback);
  process_count = SIMIX_process_count();
  process_data = xbt_new(smpi_process_data_t, process_count);
  for (i = 0; i < process_count; i++) {
    process_data[i] = xbt_new(s_smpi_process_data_t, 1);
    process_data[i]->index = i;
    process_data[i]->argc = NULL;
    process_data[i]->argv = NULL;
    process_data[i]->mailbox = simcall_rdv_create(get_mailbox_name(name, i));
    process_data[i]->mailbox_small = simcall_rdv_create(get_mailbox_name_small(name, i));
    process_data[i]->timer = xbt_os_timer_new();
    if(MC_is_active())
      MC_ignore_heap(process_data[i]->timer, xbt_os_timer_size());
    group = smpi_group_new(1);
    process_data[i]->comm_self = smpi_comm_new(group);
    process_data[i]->initialized =0;

    smpi_group_set_mapping(group, i, 0);
  }
  group = smpi_group_new(process_count);
  MPI_COMM_WORLD = smpi_comm_new(group);
  MPI_UNIVERSE_SIZE = smpi_comm_size(MPI_COMM_WORLD);
  for (i = 0; i < process_count; i++) {
    smpi_group_set_mapping(group, i, i);
  }

  //check correctness of MPI parameters

  xbt_assert(sg_cfg_get_int("smpi/async_small_thres")<=sg_cfg_get_int("smpi/send_is_detached_thres"));
}

void smpi_global_destroy(void)
{
  int count = smpi_process_count();
  int i;

  smpi_bench_destroy();
  while(smpi_group_unuse(smpi_comm_group(MPI_COMM_WORLD))>0);
  xbt_free(MPI_COMM_WORLD);
  MPI_COMM_WORLD = MPI_COMM_NULL;
  for (i = 0; i < count; i++) {
    smpi_group_unuse(smpi_comm_group(process_data[i]->comm_self));
    smpi_comm_destroy(process_data[i]->comm_self);
    xbt_os_timer_free(process_data[i]->timer);
    simcall_rdv_destroy(process_data[i]->mailbox);
    simcall_rdv_destroy(process_data[i]->mailbox_small);
    xbt_free(process_data[i]);
  }
  xbt_free(process_data);
  process_data = NULL;

  smpi_free_static();
}

/* Fortran specific stuff */
/* With smpicc, the following weak symbols are used */
/* With smpiff, the following weak symbols are replaced by those in libf2c */
int __attribute__((weak)) xargc;
char** __attribute__((weak)) xargv;

#ifndef WIN32
void __attribute__((weak)) user_main_(){
  xbt_die("Should not be in this smpi_simulated_main");
  return;
}
int __attribute__((weak)) smpi_simulated_main_(int argc, char** argv) {
  smpi_process_init(&argc, &argv);
  user_main_();
  //xbt_die("Should not be in this smpi_simulated_main");
  return 0;
}

int __attribute__((weak)) main(int argc, char** argv) {
   return smpi_main(smpi_simulated_main_,argc,argv);
}

int __attribute__((weak)) MAIN__(){
  return smpi_main(smpi_simulated_main_,xargc, xargv);
};
#endif

int smpi_main(int (*realmain) (int argc, char *argv[]),int argc, char *argv[])
{
  srand(SMPI_RAND_SEED);
  
  if(getenv("SMPI_PRETEND_CC") != NULL) {
  /* Hack to ensure that smpicc can pretend to be a simple compiler. Particularly handy to pass it to the configuration tools */
    return 0;
  }

  /* Connect log categories.  See xbt/log.c */
  XBT_LOG_CONNECT(smpi);  /* Keep this line as soon as possible in this
                             function: xbt_log_appender_file.c depends on it
                             DO NOT connect this in XBT or so, or it will be
                             useless to xbt_log_appender_file.c */
#ifdef HAVE_TRACING
  XBT_LOG_CONNECT(instr_smpi);
#endif
  XBT_LOG_CONNECT(smpi_base);
  XBT_LOG_CONNECT(smpi_bench);
  XBT_LOG_CONNECT(smpi_coll);
  XBT_LOG_CONNECT(smpi_comm);
  XBT_LOG_CONNECT(smpi_group);
  XBT_LOG_CONNECT(smpi_kernel);
  XBT_LOG_CONNECT(smpi_mpi);
  XBT_LOG_CONNECT(smpi_mpi_dt);
  XBT_LOG_CONNECT(smpi_pmpi);
  XBT_LOG_CONNECT(smpi_replay);
  XBT_LOG_CONNECT(smpi_colls);

#ifdef HAVE_TRACING
  TRACE_global_init(&argc, argv);

  TRACE_add_start_function(TRACE_smpi_alloc);
  TRACE_add_end_function(TRACE_smpi_release);
#endif

  SIMIX_global_init(&argc, argv);

#ifdef HAVE_TRACING
  TRACE_start();
#endif

  // parse the platform file: get the host list
  SIMIX_create_environment(argv[1]);

  SIMIX_function_register_default(realmain);
  SIMIX_launch_application(argv[2]);

  int gather_id = find_coll_description(mpi_coll_gather_description,
                                           sg_cfg_get_string("smpi/gather"));
  mpi_coll_gather_fun = (int (*)(void *, int, MPI_Datatype,
		                    void*, int, MPI_Datatype, int, MPI_Comm))
	                   mpi_coll_gather_description[gather_id].coll;

  int allgather_id = find_coll_description(mpi_coll_allgather_description,
                                           sg_cfg_get_string("smpi/allgather"));
  mpi_coll_allgather_fun = (int (*)(void *, int, MPI_Datatype,
		                    void*, int, MPI_Datatype, MPI_Comm))
	                   mpi_coll_allgather_description[allgather_id].coll;

  int allgatherv_id = find_coll_description(mpi_coll_allgatherv_description,
                                           sg_cfg_get_string("smpi/allgatherv"));
  mpi_coll_allgatherv_fun = (int (*)(void *, int, MPI_Datatype,
		                    void*, int*, int*, MPI_Datatype, MPI_Comm))
	                   mpi_coll_allgatherv_description[allgatherv_id].coll;

  int allreduce_id = find_coll_description(mpi_coll_allreduce_description,
                                           sg_cfg_get_string("smpi/allreduce"));
  mpi_coll_allreduce_fun = (int (*)(void *sbuf, void *rbuf, int rcount, \
                                    MPI_Datatype dtype, MPI_Op op, MPI_Comm comm))
	                   mpi_coll_allreduce_description[allreduce_id].coll;

  int alltoall_id = find_coll_description(mpi_coll_alltoall_description,
                                          sg_cfg_get_string("smpi/alltoall"));
  mpi_coll_alltoall_fun = (int (*)(void *, int, MPI_Datatype,
			           void*, int, MPI_Datatype, MPI_Comm))
	                  mpi_coll_alltoall_description[alltoall_id].coll;

  int alltoallv_id = find_coll_description(mpi_coll_alltoallv_description,
                                          sg_cfg_get_string("smpi/alltoallv"));
  mpi_coll_alltoallv_fun = (int (*)(void *, int*, int*, MPI_Datatype,
			            void*, int*, int*, MPI_Datatype, MPI_Comm))
	                  mpi_coll_alltoallv_description[alltoallv_id].coll;

  int bcast_id = find_coll_description(mpi_coll_bcast_description,
                                          sg_cfg_get_string("smpi/bcast"));
  mpi_coll_bcast_fun = (int (*)(void *buf, int count, MPI_Datatype datatype, \
	                        int root, MPI_Comm com))
	               mpi_coll_bcast_description[bcast_id].coll;

  int reduce_id = find_coll_description(mpi_coll_reduce_description,
                                          sg_cfg_get_string("smpi/reduce"));
  mpi_coll_reduce_fun = (int (*)(void *buf, void *rbuf, int count, MPI_Datatype datatype, \
                                 MPI_Op op, int root, MPI_Comm comm))
	                mpi_coll_reduce_description[reduce_id].coll;

  int reduce_scatter_id = find_coll_description(mpi_coll_reduce_scatter_description,
                                           sg_cfg_get_string("smpi/reduce_scatter"));
  mpi_coll_reduce_scatter_fun = (int (*)(void *sbuf, void *rbuf, int *rcounts,\
                    MPI_Datatype dtype,MPI_Op  op,MPI_Comm  comm))
	                   mpi_coll_reduce_scatter_description[reduce_scatter_id].coll;

  int scatter_id = find_coll_description(mpi_coll_scatter_description,
                                           sg_cfg_get_string("smpi/scatter"));
  mpi_coll_scatter_fun = (int (*)(void *sendbuf, int sendcount, MPI_Datatype sendtype,\
                void *recvbuf, int recvcount, MPI_Datatype recvtype,\
                int root, MPI_Comm comm))
	                   mpi_coll_scatter_description[scatter_id].coll;

  int barrier_id = find_coll_description(mpi_coll_barrier_description,
                                           sg_cfg_get_string("smpi/barrier"));
  mpi_coll_barrier_fun = (int (*)(MPI_Comm comm))
	                   mpi_coll_barrier_description[barrier_id].coll;

  smpi_global_init();

  /* Clean IO before the run */
  fflush(stdout);
  fflush(stderr);

  if (MC_is_active())
    MC_do_the_modelcheck_for_real();
  else
    SIMIX_run();

  if (sg_cfg_get_boolean("smpi/display_timing"))
    XBT_INFO("Simulation time: %g seconds.", SIMIX_get_clock());

  smpi_global_destroy();

#ifdef HAVE_TRACING
  TRACE_end();
#endif

  return 0;
}
