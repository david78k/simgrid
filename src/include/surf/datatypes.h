/* Copyright (c) 2009-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#ifndef MAXMIN_DATATYPES_H
#define MAXMIN_DATATYPES_H

/** \ingroup SURF_models
 *  \brief Model datatype
 *
 *  Generic data structure for a model. The workstations,
 *  the CPUs and the network links are examples of models.
 */
typedef struct surf_model *surf_model_t;

/** \ingroup SURF_actions
 *  \brief Action datatype
 *
 * An action is some working amount on a model.
 * It is represented as a cost, a priority, a duration and a state.
 */
typedef struct surf_action *surf_action_t;
typedef struct surf_file *surf_file_t;
typedef struct surf_storage *surf_storage_t;
typedef struct surf_stat *surf_stat_t;

typedef struct lmm_element *lmm_element_t;
typedef struct lmm_variable *lmm_variable_t;
typedef struct lmm_constraint *lmm_constraint_t;
typedef struct lmm_constraint_light *lmm_constraint_light_t;
typedef struct lmm_system *lmm_system_t;

typedef struct tmgr_history *tmgr_history_t;
typedef struct tmgr_trace_event *tmgr_trace_event_t;


#endif                          /* MAXMIN_DATATYPES_H */
