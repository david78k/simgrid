/* Copyright (c) 2004-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#ifndef _SURF_SURF_H
#define _SURF_SURF_H

#include "xbt/swag.h"
#include "xbt/dynar.h"
#include "xbt/dict.h"
#include "xbt/graph.h"
#include "xbt/misc.h"
#include "portable.h"
#include "xbt/config.h"
#include "surf/datatypes.h"
#include "xbt/lib.h"
#include "surf/surf_routing.h"
#include "simgrid/platf_interface.h"

SG_BEGIN_DECL()
/* Actions and models are highly connected structures... */

/* user-visible parameters */
extern double sg_tcp_gamma;
extern double sg_sender_gap;
extern double sg_latency_factor;
extern double sg_bandwidth_factor;
extern double sg_weight_S_parameter;
extern int sg_network_crosstraffic;
#ifdef HAVE_GTNETS
extern double sg_gtnets_jitter;
extern int sg_gtnets_jitter_seed;
#endif
extern xbt_dynar_t surf_path;


typedef enum {
  SURF_NETWORK_ELEMENT_NULL = 0,        /* NULL */
  SURF_NETWORK_ELEMENT_HOST,    /* host type */
  SURF_NETWORK_ELEMENT_ROUTER,  /* router type */
  SURF_NETWORK_ELEMENT_AS       /* AS type */
} e_surf_network_element_type_t;

XBT_PUBLIC(e_surf_network_element_type_t)
  routing_get_network_element_type(const char* name);

/** @Brief Specify that we use that action */
XBT_PUBLIC(void) surf_action_ref(surf_action_t action);

/** @brief Creates a new action.
 *
 * @param size The size is the one of the subtype you want to create
 * @param cost initial value
 * @param model to which model we should attach this action
 * @param failed whether we should start this action in failed mode
 */
XBT_PUBLIC(void *) surf_action_new(size_t size, double cost,
                                   surf_model_t model, int failed);

/** \brief Resource model description
 */
typedef struct surf_model_description {
  const char *name;
  const char *description;
  void_f_void_t model_init_preparse;
} s_surf_model_description_t, *surf_model_description_t;

XBT_PUBLIC(int) find_model_description(s_surf_model_description_t * table,
                                       const char *name);
XBT_PUBLIC(void) model_help(const char *category,
                            s_surf_model_description_t * table);

enum heap_action_type{
  LATENCY = 100,
  MAX_DURATION,
  NORMAL,
  NOTSET
};

/** \ingroup SURF_actions
 *  \brief Action structure
 *
 *  Never create s_surf_action_t by yourself ! The actions are created
 *  on the fly when you call execute or communicate on a model.
 *
 *  \see e_surf_action_state_t
 */
typedef struct surf_action {
  s_xbt_swag_hookup_t state_hookup;
  xbt_swag_t state_set;
  double cost;                  /**< cost        */
  double priority;              /**< priority (1.0 by default) */
  double bound;              /**< the capping of the CPU use  */
  double max_duration;          /**< max_duration (may fluctuate until
           the task is completed) */
  double remains;               /**< How much of that cost remains to
         * be done in the currently running task */
#ifdef HAVE_LATENCY_BOUND_TRACKING
  int latency_limited;               /**< Set to 1 if is limited by latency, 0 otherwise */
#endif

  double start;                 /**< start time  */
  double finish;                /**< finish time : this is modified during the run
         * and fluctuates until the task is completed */
  void *data;                   /**< for your convenience */
  int refcount;

  /* The previous name was model_type. For VM support, we have to distinguish a
   * model type and its model object. Thus, we use model_obj here. The type of
   * a model object is available by looking at the inside of the model object. */
  surf_model_t model_obj;       /**< the surf model object */

#ifdef HAVE_TRACING
  char *category;               /**< tracing category for categorized resource utilization monitoring */
#endif
  surf_file_t file;        /**< surf_file_t for storage model */
  xbt_dict_t ls_dict;
} s_surf_action_t;

typedef struct surf_action_lmm {
  s_surf_action_t generic_action;
  lmm_variable_t variable;
  int suspended;
  s_xbt_swag_hookup_t action_list_hookup;
  int index_heap;
  double last_update;
  double last_value;
  enum heap_action_type hat;
} s_surf_action_lmm_t, *surf_action_lmm_t;

/** \ingroup SURF_actions
 *  \brief Action states
 *
 *  Action states.
 *
 *  \see surf_action_t, surf_action_state_t
 */
typedef enum {
  SURF_ACTION_READY = 0,        /**< Ready        */
  SURF_ACTION_RUNNING,          /**< Running      */
  SURF_ACTION_FAILED,           /**< Task Failure */
  SURF_ACTION_DONE,             /**< Completed    */
  SURF_ACTION_TO_FREE,          /**< Action to free in next cleanup */
  SURF_ACTION_NOT_IN_THE_SYSTEM
                                /**< Not in the system anymore. Why did you ask ? */
} e_surf_action_state_t;

/** \ingroup SURF_actions
 *  \brief Action state sets
 *
 *  This structure contains some sets of actions.
 *  It provides a fast access to the actions in each state.
 *
 *  \see surf_action_t, e_surf_action_state_t
 */
typedef struct surf_action_state {
  xbt_swag_t ready_action_set;
                                 /**< Actions in state SURF_ACTION_READY */
  xbt_swag_t running_action_set;
                                 /**< Actions in state SURF_ACTION_RUNNING */
  xbt_swag_t failed_action_set;
                                 /**< Actions in state SURF_ACTION_FAILED */
  xbt_swag_t done_action_set;
                                 /**< Actions in state SURF_ACTION_DONE */
} s_surf_action_state_t, *surf_action_state_t;

/***************************/
/* Generic model object */
/***************************/
typedef struct s_routing_platf s_routing_platf_t, *routing_platf_t;
XBT_PUBLIC_DATA(routing_platf_t) routing_platf;

/*******************************************
 *  TUTORIAL: New model
 *  New model extension public
 *  Public functions specific to a New model.
 */
typedef struct surf_new_model_extension_public {
  surf_action_t(*fct) ();
  void* (*create_resource) ();
} s_surf_model_extension_new_model_t;
/*******************************************/

/** \ingroup SURF_models
 *  \brief Private data available on all models
 */
typedef struct surf_model_private *surf_model_private_t;

     /* Cpu model */

     /** \ingroup SURF_models
      *  \brief CPU model extension public
      *
      *  Public functions specific to the CPU model.
      */
typedef struct surf_cpu_model_extension_public {
  surf_action_t(*execute) (void *cpu, double size);
  surf_action_t(*sleep) (void *cpu, double duration);
  e_surf_resource_state_t(*get_state) (void *cpu);
  void(*set_state) (void *cpu, e_surf_resource_state_t state);

  int (*get_core) (void *cpu);
  double (*get_speed) (void *cpu, double load);
  double (*get_available_speed) (void *cpu);
  double (*get_current_power_peak) (void *cpu);
  double (*get_power_peak_at) (void *cpu, int pstate_index);
  int (*get_nb_pstates) (void *cpu);
  void (*set_power_peak_at) (void *cpu, int pstate_index);
  double (*get_consumed_energy) (void *cpu);
  void (*add_traces) (void);
} s_surf_model_extension_cpu_t;

     /* Network model */

     /** \ingroup SURF_models
      *  \brief Network model extension public
      *
      *  Public functions specific to the network model
      */
typedef struct surf_network_model_extension_public {
  surf_action_t (*communicate) (sg_routing_edge_t src,
                                sg_routing_edge_t dst,
                                double size, double rate);
  xbt_dynar_t(*get_route) (void *src, void *dst); //FIXME: kill field? That is done by the routing nowadays
  double (*get_link_bandwidth) (const void *link);
  double (*get_link_latency) (const void *link);
  int (*link_shared) (const void *link);
  void (*add_traces) (void);
} s_surf_model_extension_network_t;

/* Storage model */

/** \ingroup SURF_models
 *  \brief Storage model extension public
 *
 *  Public functions specific to the Storage model.
 */

typedef struct surf_storage_model_extension_public {
  surf_action_t(*open) (void *storage, const char* mount, const char* path);
  surf_action_t(*close) (void *storage, surf_file_t fd);
  surf_action_t(*read) (void *storage, surf_file_t fd, sg_storage_size_t size);
  surf_action_t(*write) (void *storage, surf_file_t fd, sg_storage_size_t size);
  surf_action_t(*stat) (void *storage, surf_file_t fd);
  surf_action_t(*ls) (void *storage, const char *path);
  xbt_dict_t(*get_properties) (const void *storage);
  xbt_dict_t(*get_content) (void *storage);
  sg_storage_size_t(*get_size) (void *storage);
} s_surf_model_extension_storage_t;

/** \ingroup SURF_models
 *  \brief Workstation model extension public
 *
 *  Public functions specific to the workstation model.
 */
typedef struct surf_workstation_model_extension_public {
  /* This points to the surf cpu model object bound to the workstation model. */
  surf_model_t cpu_model;

  surf_action_t(*execute) (void *workstation, double size);                                /**< Execute a computation amount on a workstation
                                      and create the corresponding action */
  surf_action_t(*sleep) (void *workstation, double duration);                              /**< Make a workstation sleep during a given duration */
  e_surf_resource_state_t(*get_state) (void *workstation);                                      /**< Return the CPU state of a workstation */
  void(*set_state) (void *workstation, e_surf_resource_state_t state);
  int (*get_core) (void *workstation); 
  double (*get_speed) (void *workstation, double load);                                    /**< Return the speed of a workstation */
  double (*get_available_speed) (void *workstation);                                       /**< Return tha available speed of a workstation */

  double (*get_current_power_peak) (void *workstation);					  /**< Return the current CPU speed of a workstation */
  double (*get_power_peak_at) (void *workstation, int pstate_index);			  /**< Return the speed of a workstation for a specific pstate,
												 (where higher pstate values represent lower processor speeds) */
  int (*get_nb_pstates) (void *workstation);						  /**< Return the number of pstates defined for a workstation (default is 1) */
  void (*set_power_peak_at) (void *workstation, int pstate_index);			  /**< Set the processor speed of a workstation to the speed associated with the pstate_index pstate */
  double (*get_consumed_energy) (void *workstation);					  /**< Return the total energy consumed by a workstation */

   surf_action_t(*communicate) (void *workstation_src,                                     /**< Execute a communication amount between two workstations */
                                void *workstation_dst, double size,
                                double max_rate);
   // FIXME: kill next field, which duplicates the routing
   xbt_dynar_t(*get_route) (void *workstation_src, void *workstation_dst);                 /**< Get the list of links between two ws */

   surf_action_t(*execute_parallel_task) (int workstation_nb,                              /**< Execute a parallel task on several workstations */
                                          void **workstation_list,
                                          double *computation_amount,
                                          double *communication_amount,
                                          double rate);
  double (*get_link_bandwidth) (const void *link);                                         /**< Return the current bandwidth of a network link */
  double (*get_link_latency) (const void *link);                                           /**< Return the current latency of a network link */
  surf_action_t(*open) (void *workstation, const char* storage,
                        const char* path);
  surf_action_t(*close) (void *workstation, surf_file_t fd);
  surf_action_t(*read) (void *workstation, surf_file_t fd, sg_storage_size_t size);
  surf_action_t(*write) (void *workstation, surf_file_t fd, sg_storage_size_t size);
  surf_action_t(*stat) (void *workstation, surf_file_t fd);
  int(*unlink) (void *workstation, surf_file_t fd);
  surf_action_t(*ls) (void *workstation, const char* mount, const char *path);
  sg_storage_size_t (*get_size) (void *workstation, surf_file_t fd);
  xbt_dynar_t (*get_info) (void *workstation, surf_file_t fd);

  int (*link_shared) (const void *link);
  xbt_dict_t(*get_properties) (const void *resource);
  void (*add_traces) (void);

  void (*get_params) (void *ind_vm_ws, ws_params_t param);
  void (*set_params) (void *ind_vm_ws, ws_params_t param);
  xbt_dynar_t (*get_vms) (void *ind_vm_ws);

  sg_storage_size_t (*get_free_size) (void *workstation,const char* name);
  sg_storage_size_t (*get_used_size) (void *workstation,const char* name);
  xbt_dict_t (*get_storage_list) (void *workstation);
} s_surf_model_extension_workstation_t;

typedef struct surf_vm_workstation_model_extension_public {
  /* The vm workstation model object has all members of the physical machine
   * workstation model object. If these members are correctly initialized also
   * in the vm workstation model object, we can access the vm workstation model
   * object as if it is the pm workstatoin model object.
   *
   * But, it's not so clean. Think it again later.
   * */
  s_surf_model_extension_workstation_t basic;

  // start does not appear here as it corresponds to turn the state from created to running (see smx_vm.c)

  void   (*create)  (const char *name, void *ind_phys_workstation); // First operation of the VM model
  void   (*destroy) (void *ind_vm_ws); // will be vm_ws_destroy(), which destroies the vm-workstation-specific data

  void   (*suspend) (void *ind_vm_ws);
  void   (*resume)  (void *ind_vm_ws);

  void   (*save)    (void *ind_vm_ws);
  void   (*restore) (void *ind_vm_ws);

  void   (*migrate) (void *ind_vm_ws, void *ind_vm_ws_dest); // will be vm_ws_migrate()

  int    (*get_state) (void *ind_vm_ws);
  void   (*set_state) (void *ind_vm_ws, int state);

  void * (*get_pm) (void *ind_vm_ws); // will be vm_ws_get_pm()

  void   (*set_vm_bound) (void *ind_vm_ws, double bound); // will be vm_ws_set_vm_bound()
  void   (*set_vm_affinity) (void *ind_vm_ws, void *ind_pm_ws, unsigned long mask); // will be vm_ws_set_vm_affinity()

} s_surf_model_extension_vm_workstation_t;

/** \ingroup SURF_models
 *  \brief Model types
 *
 *  The type of the model object. For example, we will have two model objects
 *  of the surf cpu model. One is for physical machines, and the other is for
 *  virtual machines.
 *
 */
typedef enum {
  SURF_MODEL_TYPE_CPU = 0,
  SURF_MODEL_TYPE_NETWORK,
  SURF_MODEL_TYPE_STORAGE,
  SURF_MODEL_TYPE_WORKSTATION,
  SURF_MODEL_TYPE_VM_WORKSTATION,
  SURF_MODEL_TYPE_NEW_MODEL
} e_surf_model_type_t;

/** \ingroup SURF_models
 *  \brief Model datatype
 *
 *  Generic data structure for a model. The workstations,
 *  the CPUs and the network links are examples of models.
 */
typedef struct surf_model {
  const char *name;     /**< Name of this model */
  s_surf_action_state_t states;      /**< Any living action on this model */

  e_surf_model_type_t type; /**< See e_surf_model_type_t */

  e_surf_action_state_t(*action_state_get) (surf_action_t action);
                                                                       /**< Return the state of an action */
  void (*action_state_set) (surf_action_t action,
                            e_surf_action_state_t state);
                                                                  /**< Change an action state*/

  double (*action_get_start_time) (surf_action_t action);     /**< Return the start time of an action */
  double (*action_get_finish_time) (surf_action_t action);     /**< Return the finish time of an action */
  int (*action_unref) (surf_action_t action);     /**< Specify that we don't use that action anymore. Returns true if the action was destroyed and false if someone still has references on it. */
  void (*action_cancel) (surf_action_t action);     /**< Cancel a running action */
  void (*action_recycle) (surf_action_t action);     /**< Recycle an action */
  void (*action_data_set) (surf_action_t action, void *data);     /**< Set the user data of an action */
  void (*suspend) (surf_action_t action);     /**< Suspend an action */
  void (*resume) (surf_action_t action);     /**< Resume a suspended action */
  int (*is_suspended) (surf_action_t action);     /**< Return whether an action is suspended */
  void (*set_max_duration) (surf_action_t action, double duration);     /**< Set the max duration of an action*/
  void (*set_priority) (surf_action_t action, double priority);     /**< Set the priority of an action */
  void (*set_bound) (surf_action_t action, double bound);     /**< Set the bound (the maximum CPU utilization) of an action */

  /* Note (hypervisor): set_affinity() may be used only in CPU models. It might
   * be better to move this member to the extension field.
   **/
  void (*set_affinity) (surf_action_t action, void *workstation, unsigned long mask);     /**< Set the CPU affinity of an action */

#ifdef HAVE_TRACING
  void (*set_category) (surf_action_t action, const char *category); /**< Set the category of an action */
#endif
  double (*get_remains) (surf_action_t action);     /**< Get the remains of an action */
#ifdef HAVE_LATENCY_BOUND_TRACKING
  int (*get_latency_limited) (surf_action_t action);     /**< Return 1 if action is limited by latency, 0 otherwise */
#endif

  void (*gap_remove) (surf_action_lmm_t action);

  surf_model_private_t model_private;

  union extension {
    s_surf_model_extension_cpu_t cpu;
    s_surf_model_extension_network_t network;
    s_surf_model_extension_storage_t storage;
    s_surf_model_extension_workstation_t workstation;
    // TODO Implement the corresponding model
    s_surf_model_extension_vm_workstation_t vm_workstation;
    /*******************************************/
    /* TUTORIAL: New model                     */
    s_surf_model_extension_new_model_t new_model;
    /*******************************************/
  } extension;
} s_surf_model_t;

surf_model_t surf_model_init(void);
void surf_model_exit(surf_model_t model);

static inline void *surf_cpu_resource_priv(const void *host) {
  return xbt_lib_get_level((void *)host, SURF_CPU_LEVEL);
}
static inline void *surf_workstation_resource_priv(const void *host){
  return xbt_lib_get_level((void *)host, SURF_WKS_LEVEL);
}
static inline void *surf_storage_resource_priv(const void *storage){
  return xbt_lib_get_level((void *)storage, SURF_STORAGE_LEVEL);
}

static inline void *surf_cpu_resource_by_name(const char *name) {
  return xbt_lib_get_elm_or_null(host_lib, name);
}
static inline void *surf_workstation_resource_by_name(const char *name){
  return xbt_lib_get_elm_or_null(host_lib, name);
}
static inline void *surf_storage_resource_by_name(const char *name){
  return xbt_lib_get_elm_or_null(storage_lib, name);
}

typedef struct surf_resource {
  surf_model_t model;
  char *name;
  xbt_dict_t properties;
  void_f_pvoid_t free_f;
} s_surf_resource_t, *surf_resource_t;

static inline surf_model_t surf_resource_model(const void *host, int level) {
  /* If level is SURF_WKS_LEVEL, ws is a workstation_CLM03 object. It has
   * surf_resource at the generic_resource field. */
  surf_resource_t ws = xbt_lib_get_level((void *) host, level);
  return ws->model;
}

/**
 * Resource which have a metric handled by a maxmin system
 */
typedef struct {
  double scale;
  double peak;
  tmgr_trace_event_t event;
} s_surf_metric_t;

typedef struct surf_resource_lmm {
  s_surf_resource_t generic_resource;
  lmm_constraint_t constraint;
  e_surf_resource_state_t state_current;
  tmgr_trace_event_t state_event;
  s_surf_metric_t power;
} s_surf_resource_lmm_t, *surf_resource_lmm_t;

/**************************************/
/* Implementations of model object */
/**************************************/


/** \ingroup SURF_models
 *  \brief The CPU model object for the physical machine layer
 */
XBT_PUBLIC_DATA(surf_model_t) surf_cpu_model_pm;

/** \ingroup SURF_models
 *  \brief The CPU model object for the virtual machine layer
 */
XBT_PUBLIC_DATA(surf_model_t) surf_cpu_model_vm;

/** \ingroup SURF_models
 *  \brief Initializes the CPU model with the model Cas01
 *
 *  By default, this model uses the lazy optimization mechanism that
 *  relies on partial invalidation in LMM and a heap for lazy action update.
 *  You can change this behavior by setting the cpu/optim configuration
 *  variable to a different value.
 *
 *  You shouldn't have to call it by yourself.
 */
XBT_PUBLIC(void) surf_cpu_model_init_Cas01(void);

/** \ingroup SURF_models
 *  \brief Initializes the CPU model with trace integration [Deprecated]
 *
 *  You shouldn't have to call it by yourself.
 */
XBT_PUBLIC(surf_model_t) surf_cpu_model_init_ti(void);

/** \ingroup SURF_models
 *  \brief The list of all available optimization modes (both for cpu and networks).
 *  These optimization modes can be set using --cfg=cpu/optim:... and --cfg=network/optim:...
 */
XBT_PUBLIC_DATA(s_surf_model_description_t) surf_optimization_mode_description[];

/** \ingroup SURF_models
 *  \brief The list of all available cpu model models
 */
XBT_PUBLIC_DATA(s_surf_model_description_t) surf_cpu_model_description[];

/**\brief create new host bypass the parser
 *
 */


/** \ingroup SURF_models
 *  \brief The network model
 *
 *  When creating a new API on top on SURF, you shouldn't use the
 *  network model unless you know what you are doing. Only the workstation
 *  model should be accessed because depending on the platform model,
 *  the network model can be NULL.
 */
XBT_PUBLIC_DATA(surf_model_t) surf_network_model;

/** \ingroup SURF_models
 *  \brief Same as network model 'LagrangeVelho', only with different correction factors.
 *
 * This model is proposed by Pierre-Nicolas Clauss and Martin Quinson and Stéphane Génaud
 * based on the model 'LV08' and different correction factors depending on the communication
 * size (< 1KiB, < 64KiB, >= 64KiB).
 * See comments in the code for more information.
 *
 *  \see surf_workstation_model_init_SMPI()
 */
XBT_PUBLIC(void) surf_network_model_init_SMPI(void);

/** \ingroup SURF_models
 *  \brief Initializes the platform with the network model 'LegrandVelho'
 *
 * This model is proposed by Arnaud Legrand and Pedro Velho based on
 * the results obtained with the GTNets simulator for onelink and
 * dogbone sharing scenarios. See comments in the code for more information.
 *
 *  \see surf_workstation_model_init_LegrandVelho()
 */
XBT_PUBLIC(void) surf_network_model_init_LegrandVelho(void);

/** \ingroup SURF_models
 *  \brief Initializes the platform with the network model 'Constant'
 *
 *  In this model, the communication time between two network cards is
 *  constant, hence no need for a routing table. This is particularly
 *  usefull when simulating huge distributed algorithms where
 *  scalability is really an issue. This function is called in
 *  conjunction with surf_workstation_model_init_compound.
 *
 *  \see surf_workstation_model_init_compound()
 */
XBT_PUBLIC(void) surf_network_model_init_Constant(void);

/** \ingroup SURF_models
 *  \brief Initializes the platform with the network model CM02
 *
 *  You sould call this function by yourself only if you plan using
 *  surf_workstation_model_init_compound.
 *  See comments in the code for more information.
 */
XBT_PUBLIC(void) surf_network_model_init_CM02(void);

#ifdef HAVE_GTNETS
/** \ingroup SURF_models
 *  \brief Initializes the platform with the network model GTNETS
 *  \param filename XML platform file name
 *
 *  This function is called by surf_workstation_model_init_GTNETS
 *  or by yourself only if you plan using surf_workstation_model_init_compound
 *
 *  \see surf_workstation_model_init_GTNETS()
 */
XBT_PUBLIC(void) surf_network_model_init_GTNETS(void);
#endif

#ifdef HAVE_NS3
/** \ingroup SURF_models
 *  \brief Initializes the platform with the network model NS3
 *  \param filename XML platform file name
 *
 *  This function is called by surf_workstation_model_init_NS3
 *  or by yourself only if you plan using surf_workstation_model_init_compound
 *
 *  \see surf_workstation_model_init_NS3()
 */
XBT_PUBLIC(void) surf_network_model_init_NS3(void);
#endif

/** \ingroup SURF_models
 *  \brief Initializes the platform with the network model Reno
 *  \param filename XML platform file name
 *
 *  The problem is related to max( sum( arctan(C * Df * xi) ) ).
 *
 *  Reference:
 *  [LOW03] S. H. Low. A duality model of TCP and queue management algorithms.
 *  IEEE/ACM Transaction on Networking, 11(4):525-536, 2003.
 *
 *  Call this function only if you plan using surf_workstation_model_init_compound.
 *
 */
XBT_PUBLIC(void) surf_network_model_init_Reno(void);

/** \ingroup SURF_models
 *  \brief Initializes the platform with the network model Reno2
 *  \param filename XML platform file name
 *
 *  The problem is related to max( sum( arctan(C * Df * xi) ) ).
 *
 *  Reference:
 *  [LOW01] S. H. Low. A duality model of TCP and queue management algorithms.
 *  IEEE/ACM Transaction on Networking, 11(4):525-536, 2003.
 *
 *  Call this function only if you plan using surf_workstation_model_init_compound.
 *
 */
XBT_PUBLIC(void) surf_network_model_init_Reno2(void);

/** \ingroup SURF_models
 *  \brief Initializes the platform with the network model Vegas
 *  \param filename XML platform file name
 *
 *  This problem is related to max( sum( a * Df * ln(xi) ) ) which is equivalent
 *  to the proportional fairness.
 *
 *  Reference:
 *  [LOW03] S. H. Low. A duality model of TCP and queue management algorithms.
 *  IEEE/ACM Transaction on Networking, 11(4):525-536, 2003.
 *
 *  Call this function only if you plan using surf_workstation_model_init_compound.
 *
 */
XBT_PUBLIC(void) surf_network_model_init_Vegas(void);

/** \ingroup SURF_models
 *  \brief The list of all available network model models
 */
XBT_PUBLIC_DATA(s_surf_model_description_t)
    surf_network_model_description[];

/** \ingroup SURF_models
 *  \brief The storage model
 */
XBT_PUBLIC(void) surf_storage_model_init_default(void);

/** \ingroup SURF_models
 *  \brief The list of all available storage modes.
 *  This storage mode can be set using --cfg=storage/model:...
 */
XBT_PUBLIC_DATA(s_surf_model_description_t) surf_storage_model_description[];

XBT_PUBLIC_DATA(surf_model_t) surf_storage_model;

/** \ingroup SURF_models
 *  \brief The workstation model
 *
 *  Note that when you create an API on top of SURF,
 *  the workstation model should be the only one you use
 *  because depending on the platform model, the network model and the CPU model
 *  may not exist.
 */
XBT_PUBLIC_DATA(surf_model_t) surf_workstation_model;

/** \ingroup SURF_models
 *  \brief The vm_workstation model
 *
 *  Note that when you create an API on top of SURF,
 *  the vm_workstation model should be the only one you use
 *  because depending on the platform model, the network model and the CPU model
 *  may not exist.
 */
XBT_PUBLIC_DATA(surf_model_t) surf_vm_workstation_model;

/** \ingroup SURF_models
 *  \brief Initializes the platform with a compound workstation model
 *
 *  This function should be called after a cpu_model and a
 *  network_model have been set up.
 *
 */
XBT_PUBLIC(void) surf_workstation_model_init_compound(void);

/** \ingroup SURF_models
 *  \brief Initializes the platform with the current best network and cpu models at hand
 *
 *  This platform model seperates the workstation model and the network model.
 *  The workstation model will be initialized with the model compound, the network
 *  model with the model LV08 (with cross traffic support) and the CPU model with
 *  the model Cas01.
 *  Such model is subject to modification with warning in the ChangeLog so monitor it!
 *
 */
XBT_PUBLIC(void) surf_workstation_model_init_current_default(void);

/** \ingroup SURF_models
 *  \brief Initializes the platform with the model KCCFLN05
 *
 *  With this model, only parallel tasks can be used. Resource sharing
 *  is done by identifying bottlenecks and giving an equal share of
 *  the model to each action.
 *
 */
XBT_PUBLIC(void) surf_workstation_model_init_ptask_L07(void);

/** \ingroup SURF_models
 *  \brief The list of all available workstation model models
 */
XBT_PUBLIC_DATA(s_surf_model_description_t)
    surf_workstation_model_description[];

/*******************************************
 *  TUTORIAL: New model
 */
XBT_PUBLIC(void) surf_new_model_init_default(void);
XBT_PUBLIC_DATA(s_surf_model_description_t) surf_new_model_description[];
/*******************************************/

/** \ingroup SURF_models
 *  \brief List of initialized models
 */
XBT_PUBLIC_DATA(xbt_dynar_t) model_list;
XBT_PUBLIC_DATA(xbt_dynar_t) model_list_invoke;

/** \ingroup SURF_simulation
 *  \brief List of hosts that have juste restarted and whose autorestart process should be restarted.
 */
XBT_PUBLIC_DATA(xbt_dynar_t) host_that_restart;

/** \ingroup SURF_simulation
 *  \brief List of hosts for which one want to be notified if they ever restart.
 */
XBT_PUBLIC(xbt_dict_t) watched_hosts_lib;

/*******************************************/
/*** SURF Platform *************************/
/*******************************************/
typedef struct s_as *AS_t;

XBT_PUBLIC_DATA(AS_t) surf_AS_get_routing_root(void); 
XBT_PUBLIC_DATA(const char *) surf_AS_get_name(AS_t as);
XBT_PUBLIC_DATA(xbt_dict_t) surf_AS_get_routing_sons(AS_t as);
XBT_PUBLIC_DATA(const char *) surf_AS_get_model(AS_t as);
XBT_PUBLIC_DATA(xbt_dynar_t) surf_AS_get_hosts(AS_t as);

/*******************************************/
/*** SURF Globals **************************/
/*******************************************/

/** \ingroup SURF_simulation
 *  \brief Initialize SURF
 *  \param argc argument number
 *  \param argv arguments
 *
 *  This function has to be called to initialize the common
 *  structures.  Then you will have to create the environment by
 *  calling 
 *  e.g. surf_workstation_model_init_CM02()
 *
 *  \see surf_workstation_model_init_CM02(), surf_workstation_model_init_compound(), surf_exit()
 */
XBT_PUBLIC(void) surf_init(int *argc, char **argv);     /* initialize common structures */

/** \ingroup SURF_simulation
 *  \brief Finish simulation initialization
 *
 *  This function must be called before the first call to surf_solve()
 */
XBT_PUBLIC(void) surf_presolve(void);

/** \ingroup SURF_simulation
 *  \brief Performs a part of the simulation
 *  \param max_date Maximum date to update the simulation to, or -1
 *  \return the elapsed time, or -1.0 if no event could be executed
 *
 *  This function execute all possible events, update the action states
 *  and returns the time elapsed.
 *  When you call execute or communicate on a model, the corresponding actions
 *  are not executed immediately but only when you call surf_solve.
 *  Note that the returned elapsed time can be zero.
 */
XBT_PUBLIC(double) surf_solve(double max_date);

/** \ingroup SURF_simulation
 *  \brief Return the current time
 *
 *  Return the current time in millisecond.
 */
XBT_PUBLIC(double) surf_get_clock(void);

/** \ingroup SURF_simulation
 *  \brief Exit SURF
 *
 *  Clean everything.
 *
 *  \see surf_init()
 */
XBT_PUBLIC(void) surf_exit(void);

/* Prototypes of the functions that handle the properties */
XBT_PUBLIC_DATA(xbt_dict_t) current_property_set;       /* the prop set for the currently parsed element (also used in SIMIX) */

/* surf parse file related (public because called from a test suite) */
XBT_PUBLIC(void) parse_platform_file(const char *file);

/* For the trace and trace:connect tag (store their content till the end of the parsing) */
XBT_PUBLIC_DATA(xbt_dict_t) traces_set_list;
XBT_PUBLIC_DATA(xbt_dict_t) trace_connect_list_host_avail;
XBT_PUBLIC_DATA(xbt_dict_t) trace_connect_list_power;
XBT_PUBLIC_DATA(xbt_dict_t) trace_connect_list_link_avail;
XBT_PUBLIC_DATA(xbt_dict_t) trace_connect_list_bandwidth;
XBT_PUBLIC_DATA(xbt_dict_t) trace_connect_list_latency;


XBT_PUBLIC(double) get_cpu_power(const char *power);

XBT_PUBLIC(xbt_dict_t) get_as_router_properties(const char* name);

int surf_get_nthreads(void);
void surf_set_nthreads(int nthreads);

/*
 * Returns the initial path. On Windows the initial path is
 * the current directory for the current process in the other
 * case the function returns "./" that represents the current
 * directory on Unix/Linux platforms.
 */
const char *__surf_get_initial_path(void);

/********** Tracing **********/
/* from surf_instr.c */
void TRACE_surf_action(surf_action_t surf_action, const char *category);
void TRACE_surf_alloc(void);
void TRACE_surf_release(void);

/* instr_routing.c */
void instr_routing_define_callbacks (void);
void instr_new_variable_type (const char *new_typename, const char *color);
void instr_new_user_variable_type  (const char *father_type, const char *new_typename, const char *color);
void instr_new_user_state_type (const char *father_type, const char *new_typename);
void instr_new_value_for_user_state_type (const char *typename, const char *value, const char *color);
int instr_platform_traced (void);
xbt_graph_t instr_routing_platform_graph (void);
void instr_routing_platform_graph_export_graphviz (xbt_graph_t g, const char *filename);

SG_END_DECL()
#endif                          /* _SURF_SURF_H */
