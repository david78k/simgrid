/* Copyright (c) 2008-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#include "surf_private.h"
#include "surf/random_mgr.h"
#include "xbt/dict.h"
#include "xbt/str.h"
#include "xbt/log.h"

typedef struct surf_action_network_Constant {
  s_surf_action_t generic_action;
  double latency;
  double lat_init;
  int suspended;
} s_surf_action_network_Constant_t, *surf_action_network_Constant_t;

XBT_LOG_EXTERNAL_DEFAULT_CATEGORY(surf_network);
static int host_number_int = 0;

static void netcste_count_hosts(sg_platf_host_cbarg_t h) {
  host_number_int++;
}

static void netcste_define_callbacks(void) {
  sg_platf_host_add_cb(netcste_count_hosts);
}

static int netcste_resource_used(void *resource_id)
{
  return 0;
}

static int netcste_action_unref(surf_action_t action)
{
  action->refcount--;
  if (!action->refcount) {
    xbt_swag_remove(action, action->state_set);
    surf_action_free(&action);
    return 1;
  }
  return 0;
}

static void netcste_action_cancel(surf_action_t action)
{
  return;
}

static double netcste_share_resources(surf_model_t network_model, double now)
{
  surf_action_network_Constant_t action = NULL;
  xbt_swag_t running_actions =
      network_model->states.running_action_set;
  double min = -1.0;

  xbt_swag_foreach(action, running_actions) {
    if (action->latency > 0) {
      if (min < 0)
        min = action->latency;
      else if (action->latency < min)
        min = action->latency;
    }
  }

  return min;
}

static void netcste_update_actions_state(surf_model_t network_model, double now, double delta)
{
  surf_action_network_Constant_t action = NULL;
  surf_action_network_Constant_t next_action = NULL;
  xbt_swag_t running_actions =
      network_model->states.running_action_set;

  xbt_swag_foreach_safe(action, next_action, running_actions) {
    if (action->latency > 0) {
      if (action->latency > delta) {
        double_update(&(action->latency), delta);
      } else {
        action->latency = 0.0;
      }
    }
    double_update(&(action->generic_action.remains),
                  action->generic_action.cost * delta / action->lat_init);
    if (action->generic_action.max_duration != NO_MAX_DURATION)
      double_update(&(action->generic_action.max_duration), delta);

    if (action->generic_action.remains <= 0) {
      action->generic_action.finish = surf_get_clock();
      network_model->action_state_set((surf_action_t) action,
                                           SURF_ACTION_DONE);
    } else if ((action->generic_action.max_duration != NO_MAX_DURATION)
               && (action->generic_action.max_duration <= 0)) {
      action->generic_action.finish = surf_get_clock();
      network_model->action_state_set((surf_action_t) action,
                                           SURF_ACTION_DONE);
    }
  }
}

static void netcste_update_resource_state(void *id,
                                          tmgr_trace_event_t event_type,
                                          double value, double time)
{
  DIE_IMPOSSIBLE;
}

static surf_action_t netcste_communicate(sg_routing_edge_t src,
                                         sg_routing_edge_t dst,
                                         double size, double rate)
{
  surf_action_network_Constant_t action = NULL;

  char *src_name = src->name;
  char *dst_name = dst->name;

  XBT_IN("(%s,%s,%g,%g)", src_name, dst_name, size, rate);

  action =
      surf_action_new(sizeof(s_surf_action_network_Constant_t), size,
                      surf_network_model, 0);

  action->suspended = 0;

  action->latency = sg_latency_factor;
  action->lat_init = action->latency;

  if (action->latency <= 0.0) {
    action->generic_action.state_set =
        surf_network_model->states.done_action_set;
    xbt_swag_insert(action, action->generic_action.state_set);
  }

  XBT_OUT();

  return (surf_action_t) action;
}

#ifdef HAVE_TRACING
static void netcste_action_set_category(surf_action_t action, const char *category)
{
  //ignore completely the categories in constant model, they are not traced
}
#endif

static double netcste_get_link_bandwidth(const void *link)
{
  DIE_IMPOSSIBLE;
  return -1.0; /* useless since DIE actually abort(), but eclipse prefer to have a useless and harmless return */
}

static double netcste_get_link_latency(const void *link)
{
  DIE_IMPOSSIBLE;
  return -1.0; /* useless since DIE actually abort(), but eclipse prefer to have a useless and harmless return */
}

static int link_shared(const void *link)
{
  DIE_IMPOSSIBLE;
  return -1; /* useless since DIE actually abort(), but eclipse prefer to have a useless and harmless return */
}

static void netcste_action_suspend(surf_action_t action)
{
  ((surf_action_network_Constant_t) action)->suspended = 1;
}

static void netcste_action_resume(surf_action_t action)
{
  if (((surf_action_network_Constant_t) action)->suspended)
    ((surf_action_network_Constant_t) action)->suspended = 0;
}

static int netcste_action_is_suspended(surf_action_t action)
{
  return ((surf_action_network_Constant_t) action)->suspended;
}

static void netcste_finalize(surf_model_t network_model)
{
  surf_model_exit(network_model);
  network_model = NULL;
}



void surf_network_model_init_Constant()
{
  xbt_assert(surf_network_model == NULL);
  if (surf_network_model)
    return;
  surf_network_model = surf_model_init();

  surf_network_model->name = "constant time network";
  surf_network_model->action_unref = netcste_action_unref;
  surf_network_model->action_cancel = netcste_action_cancel;
  surf_network_model->action_recycle = net_action_recycle;
  surf_network_model->get_remains = surf_action_get_remains;
#ifdef HAVE_LATENCY_BOUND_TRACKING
  surf_network_model->get_latency_limited = net_get_link_latency_limited;
#endif

  surf_network_model->model_private->resource_used = netcste_resource_used;
  surf_network_model->model_private->share_resources =
      netcste_share_resources;
  surf_network_model->model_private->update_actions_state =
      netcste_update_actions_state;
  surf_network_model->model_private->update_resource_state =
      netcste_update_resource_state;
  surf_network_model->model_private->finalize = netcste_finalize;

  surf_network_model->suspend = netcste_action_suspend;
  surf_network_model->resume = netcste_action_resume;
  surf_network_model->is_suspended = netcste_action_is_suspended;

  xbt_assert(surf_cpu_model_pm);
  xbt_assert(surf_cpu_model_vm);
  surf_cpu_model_pm->set_max_duration = surf_action_set_max_duration;
  surf_cpu_model_vm->set_max_duration = surf_action_set_max_duration;

  surf_network_model->extension.network.communicate = netcste_communicate;
  surf_network_model->extension.network.get_link_bandwidth =
      netcste_get_link_bandwidth;
  surf_network_model->extension.network.get_link_latency =
      netcste_get_link_latency;
  surf_network_model->extension.network.link_shared = link_shared;
#ifdef HAVE_TRACING
  surf_network_model->set_category = netcste_action_set_category;
#endif

  netcste_define_callbacks();
  xbt_dynar_push(model_list, &surf_network_model);

  routing_model_create(NULL);
}
