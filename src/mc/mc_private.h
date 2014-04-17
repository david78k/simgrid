/* Copyright (c) 2007-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#ifndef MC_PRIVATE_H
#define MC_PRIVATE_H

#include "simgrid_config.h"
#include <stdio.h>
#ifndef WIN32
#include <sys/mman.h>
#endif
#include "mc/mc.h"
#include "mc/datatypes.h"
#include "xbt/fifo.h"
#include "xbt/config.h"
#include "xbt/function_types.h"
#include "xbt/mmalloc.h"
#include "../simix/smx_private.h"
#include "xbt/automaton.h"
#include "xbt/hash.h"
#include "msg/msg.h"
#include "msg/datatypes.h"
#include "xbt/strbuff.h"
#include "xbt/parmap.h"

/****************************** Snapshots ***********************************/

#define NB_REGIONS 3 /* binary data (data + BSS) (type = 2), libsimgrid data (data + BSS) (type = 1), std_heap (type = 0)*/ 

typedef struct s_mc_mem_region{
  void *start_addr;
  void *data;
  size_t size;
} s_mc_mem_region_t, *mc_mem_region_t;

typedef struct s_mc_snapshot{
  size_t heap_bytes_used;
  mc_mem_region_t regions[NB_REGIONS];
  int nb_processes;
  size_t *stack_sizes;
  xbt_dynar_t stacks;
  xbt_dynar_t to_ignore;
  char hash_global[41];
  char hash_local[41];
} s_mc_snapshot_t, *mc_snapshot_t;

typedef struct s_mc_snapshot_stack{
  xbt_dynar_t local_variables;
  void *stack_pointer;
  void *real_address;
}s_mc_snapshot_stack_t, *mc_snapshot_stack_t;

typedef struct s_mc_global_t{
  mc_snapshot_t snapshot;
  int raw_mem_set;
  int prev_pair;
  char *prev_req;
}s_mc_global_t, *mc_global_t;

typedef struct s_mc_checkpoint_ignore_region{
  void *addr;
  size_t size;
}s_mc_checkpoint_ignore_region_t, *mc_checkpoint_ignore_region_t;

mc_snapshot_t SIMIX_pre_mc_snapshot(smx_simcall_t simcall);
mc_snapshot_t MC_take_snapshot(int num_state);
void MC_restore_snapshot(mc_snapshot_t);
void MC_free_snapshot(mc_snapshot_t);

extern xbt_dynar_t mc_checkpoint_ignore;

/********************************* MC Global **********************************/

extern double *mc_time;
extern FILE *dot_output;
extern const char* colors[13];
extern xbt_parmap_t parmap;

extern int user_max_depth_reached;

int MC_deadlock_check(void);
void MC_replay(xbt_fifo_t stack, int start);
void MC_replay_liveness(xbt_fifo_t stack, int all_stack);
void MC_wait_for_requests(void);
void MC_show_deadlock(smx_simcall_t req);
void MC_show_stack_safety(xbt_fifo_t stack);
void MC_dump_stack_safety(xbt_fifo_t stack);
void MC_init(void);
int SIMIX_pre_mc_random(smx_simcall_t simcall, int min, int max);


/********************************* Requests ***********************************/

int MC_request_depend(smx_simcall_t req1, smx_simcall_t req2);
char* MC_request_to_string(smx_simcall_t req, int value);
unsigned int MC_request_testany_fail(smx_simcall_t req);
/*int MC_waitany_is_enabled_by_comm(smx_req_t req, unsigned int comm);*/
int MC_request_is_visible(smx_simcall_t req);
int MC_request_is_enabled(smx_simcall_t req);
int MC_request_is_enabled_by_idx(smx_simcall_t req, unsigned int idx);
int MC_process_is_enabled(smx_process_t process);
char *MC_request_get_dot_output(smx_simcall_t req, int value);


/******************************** States **************************************/

/* Possible exploration status of a process in a state */
typedef enum {
  MC_NOT_INTERLEAVE=0,      /* Do not interleave (do not execute) */
  MC_INTERLEAVE,            /* Interleave the process (one or more request) */
  MC_MORE_INTERLEAVE,       /* Interleave twice the process (for mc_random simcall) */
  MC_DONE                   /* Already interleaved */
} e_mc_process_state_t;

/* On every state, each process has an entry of the following type */
typedef struct mc_procstate{
  e_mc_process_state_t state;       /* Exploration control information */
  unsigned int interleave_count;    /* Number of times that the process was
                                       interleaved */
} s_mc_procstate_t, *mc_procstate_t;

/* An exploration state is composed of: */
typedef struct mc_state {
  unsigned long max_pid;            /* Maximum pid at state's creation time */
  mc_procstate_t proc_status;       /* State's exploration status by process */
  s_smx_action_t internal_comm;     /* To be referenced by the internal_req */
  s_smx_simcall_t internal_req;         /* Internal translation of request */
  s_smx_simcall_t executed_req;         /* The executed request of the state */
  int req_num;                      /* The request number (in the case of a
                                       multi-request like waitany ) */
  mc_snapshot_t system_state;      /* Snapshot of system state */
  int num;
} s_mc_state_t, *mc_state_t;

mc_state_t MC_state_new(void);
void MC_state_delete(mc_state_t state);
void MC_state_interleave_process(mc_state_t state, smx_process_t process);
unsigned int MC_state_interleave_size(mc_state_t state);
int MC_state_process_is_done(mc_state_t state, smx_process_t process);
void MC_state_set_executed_request(mc_state_t state, smx_simcall_t req, int value);
smx_simcall_t MC_state_get_executed_request(mc_state_t state, int *value);
smx_simcall_t MC_state_get_internal_request(mc_state_t state);
smx_simcall_t MC_state_get_request(mc_state_t state, int *value);
void MC_state_remove_interleave_process(mc_state_t state, smx_process_t process);


/****************************** Statistics ************************************/

typedef struct mc_stats {
  unsigned long state_size;
  unsigned long visited_states;
  unsigned long visited_pairs;
  unsigned long expanded_states;
  unsigned long expanded_pairs;
  unsigned long executed_transitions;
} s_mc_stats_t, *mc_stats_t;

extern mc_stats_t mc_stats;

void MC_print_statistics(mc_stats_t);


/********************************** MEMORY ******************************/
/* The possible memory modes for the modelchecker are standard and raw. */
/* Normally the system should operate in std, for switching to raw mode */
/* you must wrap the code between MC_SET_RAW_MODE and MC_UNSET_RAW_MODE */

extern void *std_heap;
extern void *raw_heap;


/* FIXME: Horrible hack! because the mmalloc library doesn't provide yet of */
/* an API to query about the status of a heap, we simply call mmstats and */
/* because I now how does structure looks like, then I redefine it here */

/* struct mstats { */
/*   size_t bytes_total;           /\* Total size of the heap. *\/ */
/*   size_t chunks_used;           /\* Chunks allocated by the user. *\/ */
/*   size_t bytes_used;            /\* Byte total of user-allocated chunks. *\/ */
/*   size_t chunks_free;           /\* Chunks in the free list. *\/ */
/*   size_t bytes_free;            /\* Byte total of chunks in the free list. *\/ */
/* }; */

#define MC_SET_RAW_MEM    mmalloc_set_current_heap(raw_heap)
#define MC_UNSET_RAW_MEM  mmalloc_set_current_heap(std_heap)


/******************************* MEMORY MAPPINGS ***************************/
/* These functions and data structures implements a binary interface for   */
/* the proc maps ascii interface                                           */

/* Each field is defined as documented in proc's manual page  */
typedef struct s_map_region {

  void *start_addr;             /* Start address of the map */
  void *end_addr;               /* End address of the map */
  int prot;                     /* Memory protection */
  int flags;                    /* Additional memory flags */
  void *offset;                 /* Offset in the file/whatever */
  char dev_major;               /* Major of the device */
  char dev_minor;               /* Minor of the device */
  unsigned long inode;          /* Inode in the device */
  char *pathname;               /* Path name of the mapped file */

} s_map_region_t;

typedef struct s_memory_map {

  s_map_region_t *regions;      /* Pointer to an array of regions */
  int mapsize;                  /* Number of regions in the memory */

} s_memory_map_t, *memory_map_t;


void MC_init_memory_map_info(void);
memory_map_t MC_get_memory_map(void);
void MC_free_memory_map(memory_map_t map);
void MC_get_libsimgrid_plt_section(void);
void MC_get_binary_plt_section(void);

extern void *start_data_libsimgrid;
extern void *start_data_binary;
extern void *start_bss_binary;
extern char *libsimgrid_path;
extern void *start_text_libsimgrid;
extern void *start_text_binary;
extern void *start_bss_libsimgrid;
extern void *start_plt_libsimgrid;
extern void *end_plt_libsimgrid;
extern void *start_plt_binary;
extern void *end_plt_binary;
extern void *start_got_plt_libsimgrid;
extern void *end_got_plt_libsimgrid;
extern void *start_got_plt_binary;
extern void *end_got_plt_binary;


/********************************** Snapshot comparison **********************************/

typedef struct s_mc_comparison_times{
  double nb_processes_comparison_time;
  double bytes_used_comparison_time;
  double stacks_sizes_comparison_time;
  double binary_global_variables_comparison_time;
  double libsimgrid_global_variables_comparison_time;
  double heap_comparison_time;
  double stacks_comparison_time;
  double hash_global_variables_comparison_time;
  double hash_local_variables_comparison_time;
}s_mc_comparison_times_t, *mc_comparison_times_t;

extern __thread mc_comparison_times_t mc_comp_times;
extern __thread double mc_snapshot_comparison_time;

int snapshot_compare(void *state1, void *state2);
int SIMIX_pre_mc_compare_snapshots(smx_simcall_t simcall, mc_snapshot_t s1, mc_snapshot_t s2);
void print_comparison_times(void);

//#define MC_DEBUG 1
#define MC_VERBOSE 1


/********************************** DPOR for safety property **************************************/

typedef enum {
  e_mc_reduce_unset,
  e_mc_reduce_none,
  e_mc_reduce_dpor
} e_mc_reduce_t;

extern e_mc_reduce_t mc_reduce_kind;
extern mc_global_t initial_state_safety;
extern xbt_fifo_t mc_stack_safety;
extern xbt_dict_t first_enabled_state;

void MC_dpor_init(void);
void MC_dpor(void);

typedef struct s_mc_visited_state{
  mc_snapshot_t system_state;
  size_t heap_bytes_used;
  int nb_processes;
  int num;
  int other_num; // dot_output for
}s_mc_visited_state_t, *mc_visited_state_t;


/********************************** Double-DFS for liveness property **************************************/

extern xbt_fifo_t mc_stack_liveness;
extern mc_global_t initial_state_liveness;
extern xbt_automaton_t _mc_property_automaton;
extern int compare;
extern xbt_dynar_t mc_stack_comparison_ignore;
extern xbt_dynar_t mc_data_bss_comparison_ignore;

typedef struct s_mc_pair{
  int num;
  int search_cycle;
  mc_state_t graph_state; /* System state included */
  xbt_automaton_state_t automaton_state;
  xbt_dynar_t atomic_propositions;
  int requests;
}s_mc_pair_t, *mc_pair_t;

typedef struct s_mc_visited_pair{
  int num;
  int other_num; /* Dot output for */
  int acceptance_pair;
  mc_state_t graph_state; /* System state included */
  xbt_automaton_state_t automaton_state;
  xbt_dynar_t atomic_propositions;
  size_t heap_bytes_used;
  int nb_processes;
  int acceptance_removed;
  int visited_removed;
}s_mc_visited_pair_t, *mc_visited_pair_t;

mc_pair_t MC_pair_new(void);
void MC_pair_delete(mc_pair_t);
void mc_pair_free_voidp(void *p);
mc_visited_pair_t MC_visited_pair_new(int pair_num, xbt_automaton_state_t automaton_state, xbt_dynar_t atomic_propositions);
void MC_visited_pair_delete(mc_visited_pair_t p);

void MC_ddfs_init(void);
void MC_ddfs(void);
void MC_show_stack_liveness(xbt_fifo_t stack);
void MC_dump_stack_liveness(xbt_fifo_t stack);


/********************************** Variables with DWARF **********************************/

extern xbt_dict_t mc_local_variables_libsimgrid;
extern xbt_dict_t mc_local_variables_binary;
extern xbt_dynar_t mc_global_variables_libsimgrid;
extern xbt_dynar_t mc_global_variables_binary;
extern xbt_dict_t mc_variables_type_libsimgrid;
extern xbt_dict_t mc_variables_type_binary;

typedef enum {
  e_dw_loclist,
  e_dw_register,
  e_dw_bregister_op,
  e_dw_lit,
  e_dw_fbregister_op,
  e_dw_piece,
  e_dw_arithmetic,
  e_dw_plus_uconst,
  e_dw_compose,
  e_dw_deref,
  e_dw_uconstant,
  e_dw_sconstant,
  e_dw_unsupported
} e_dw_location_type;

typedef struct s_dw_location{
  e_dw_location_type type;
  union{
    
    xbt_dynar_t loclist;
    
    int reg;
    
    struct{
      unsigned int reg;
      int offset;
    }breg_op;

    unsigned int lit;

    int fbreg_op;

    int piece;

    unsigned short int deref_size;

    xbt_dynar_t compose;

    char *arithmetic;

    struct{
      int bytes;
      long unsigned int value;
    }uconstant;

    struct{
      int bytes;
      long signed int value;
    }sconstant;

    unsigned int plus_uconst;

  }location;
}s_dw_location_t, *dw_location_t;

typedef struct s_dw_location_entry{
  long lowpc;
  long highpc;
  dw_location_t location;
}s_dw_location_entry_t, *dw_location_entry_t;

typedef struct s_dw_variable{
  int global;
  char *name;
  char *type_origin;
  union{
    dw_location_t location;
    void *address;
  }address;
}s_dw_variable_t, *dw_variable_t;

typedef struct s_dw_frame{
  char *name;
  void *low_pc;
  void *high_pc;
  dw_location_t frame_base;
  xbt_dynar_t variables; /* Cannot use dict, there may be several variables with the same name (in different lexical blocks)*/
  unsigned long int start;
  unsigned long int end;
}s_dw_frame_t, *dw_frame_t;

/********************************** Miscellaneous **********************************/

typedef struct s_local_variable{
  char *frame;
  unsigned long ip;
  char *name;
  char *type;
  void *address;
  int region;
}s_local_variable_t, *local_variable_t;

#endif

