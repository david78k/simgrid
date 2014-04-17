/* Mailboxes in MSG */

/* Copyright (c) 2008-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#include "msg_mailbox.h"
#include "msg_private.h"

XBT_LOG_NEW_DEFAULT_SUBCATEGORY(msg_mailbox, msg,
                                "Logging specific to MSG (mailbox)");

msg_mailbox_t MSG_mailbox_new(const char *alias)
{
  return simcall_rdv_create(alias);
}

void MSG_mailbox_free(void *mailbox)
{
  simcall_rdv_destroy((msg_mailbox_t)mailbox);
}

int MSG_mailbox_is_empty(msg_mailbox_t mailbox)
{
  return (NULL == simcall_rdv_get_head(mailbox));
}

msg_task_t MSG_mailbox_get_head(msg_mailbox_t mailbox)
{
  smx_action_t comm = simcall_rdv_get_head(mailbox);

  if (!comm)
    return NULL;

  return (msg_task_t) simcall_comm_get_src_data(comm);
}

int
MSG_mailbox_get_count_host_waiting_tasks(msg_mailbox_t mailbox,
                                         msg_host_t host)
{
  return simcall_rdv_comm_count_by_host(mailbox, host);
}

msg_mailbox_t MSG_mailbox_get_by_alias(const char *alias)
{

  msg_mailbox_t mailbox = simcall_rdv_get_by_name(alias);

  if (!mailbox)
    mailbox = MSG_mailbox_new(alias);

  return mailbox;
}

/** \ingroup msg_mailbox_management
 * \brief Set the mailbox to receive in asynchronous mode
 *
 * All messages sent to this mailbox will be transferred to 
 * the receiver without waiting for the receive call. 
 * The receive call will still be necessary to use the received data.
 * If there is a need to receive some messages asynchronously, and some not, 
 * two different mailboxes should be used.
 *
 * \param alias The name of the mailbox 
 */
void MSG_mailbox_set_async(const char *alias){
  msg_mailbox_t mailbox = MSG_mailbox_get_by_alias(alias);

  simcall_rdv_set_receiver(mailbox, SIMIX_process_self());
  XBT_VERB("%s mailbox set to receive eagerly for process %p\n",alias, SIMIX_process_self());

}

/** \ingroup msg_mailbox_management
 * \brief Get a task from a mailbox on a given host
 *
 * \param mailbox The mailbox where the task was sent
 * \param task a memory location for storing a #msg_task_t.
 * \param host a #msg_host_t host from where the task was sent
 * \param timeout a timeout

 * \return Returns
 * #MSG_OK if the task was successfully received,
 * #MSG_HOST_FAILURE, or #MSG_TRANSFER_FAILURE otherwise.
 */
msg_error_t
MSG_mailbox_get_task_ext(msg_mailbox_t mailbox, msg_task_t * task,
                         msg_host_t host, double timeout)
{
  xbt_ex_t e;
  msg_error_t ret = MSG_OK;
  /* We no longer support getting a task from a specific host */
  if (host)
    THROW_UNIMPLEMENTED;

#ifdef HAVE_TRACING
  TRACE_msg_task_get_start();
  double start_time = MSG_get_clock();
#endif

  /* Sanity check */
  xbt_assert(task, "Null pointer for the task storage");

  if (*task)
    XBT_WARN
        ("Asked to write the received task in a non empty struct -- proceeding.");

  /* Try to receive it by calling SIMIX network layer */
  TRY {
    simcall_comm_recv(mailbox, task, NULL, NULL, NULL, timeout);
    XBT_DEBUG("Got task %s from %p",(*task)->name,mailbox);
    (*task)->simdata->isused=0;
  }
  CATCH(e) {
    switch (e.category) {
    case cancel_error:
      ret = MSG_HOST_FAILURE;
      break;
    case network_error:
      ret = MSG_TRANSFER_FAILURE;
      break;
    case timeout_error:
      ret = MSG_TIMEOUT;
      break;
    default:
      RETHROW;
    }
    xbt_ex_free(e);
  }

#ifdef HAVE_TRACING
  if (ret != MSG_HOST_FAILURE &&
      ret != MSG_TRANSFER_FAILURE &&
      ret != MSG_TIMEOUT) {
    TRACE_msg_task_get_end(start_time, *task);
  }
#endif
  MSG_RETURN(ret);
}

/** \ingroup msg_mailbox_management
 * \brief Get a task from a mailbox on a given host at a given rate
 *
 * \param mailbox The mailbox where the task was sent
 * \param task a memory location for storing a #msg_task_t.
 * \param host a #msg_host_t host from where the task was sent
 * \param timeout a timeout
 * \param rate a rate

 * \return Returns
 * #MSG_OK if the task was successfully received,
 * #MSG_HOST_FAILURE, or #MSG_TRANSFER_FAILURE otherwise.
 */
msg_error_t
MSG_mailbox_get_task_ext_bounded(msg_mailbox_t mailbox, msg_task_t * task,
                         msg_host_t host, double timeout, double rate)
{
  xbt_ex_t e;
  msg_error_t ret = MSG_OK;
  /* We no longer support getting a task from a specific host */
  if (host)
    THROW_UNIMPLEMENTED;

#ifdef HAVE_TRACING
  TRACE_msg_task_get_start();
  double start_time = MSG_get_clock();
#endif

  /* Sanity check */
  xbt_assert(task, "Null pointer for the task storage");

  if (*task)
    XBT_WARN
        ("Asked to write the received task in a non empty struct -- proceeding.");

  /* Try to receive it by calling SIMIX network layer */
  TRY {
    simcall_comm_recv_bounded(mailbox, task, NULL, NULL, NULL, timeout, rate);
    XBT_DEBUG("Got task %s from %p",(*task)->name,mailbox);
    (*task)->simdata->isused=0;
  }
  CATCH(e) {
    switch (e.category) {
    case cancel_error:
      ret = MSG_HOST_FAILURE;
      break;
    case network_error:
      ret = MSG_TRANSFER_FAILURE;
      break;
    case timeout_error:
      ret = MSG_TIMEOUT;
      break;
    default:
      RETHROW;
    }
    xbt_ex_free(e);
  }

#ifdef HAVE_TRACING
  if (ret != MSG_HOST_FAILURE &&
      ret != MSG_TRANSFER_FAILURE &&
      ret != MSG_TIMEOUT) {
    TRACE_msg_task_get_end(start_time, *task);
  }
#endif
  MSG_RETURN(ret);
}

msg_error_t
MSG_mailbox_put_with_timeout(msg_mailbox_t mailbox, msg_task_t task,
                             double timeout)
{
  xbt_ex_t e;
  msg_error_t ret = MSG_OK;
  simdata_task_t t_simdata = NULL;
  msg_process_t process = MSG_process_self();
  simdata_process_t p_simdata = SIMIX_process_self_get_data(process);

#ifdef HAVE_TRACING
  int call_end = TRACE_msg_task_put_start(task);    //must be after CHECK_HOST()
#endif

  /* Prepare the task to send */
  t_simdata = task->simdata;
  t_simdata->sender = process;
  t_simdata->source = ((simdata_process_t) SIMIX_process_self_get_data(process))->m_host;

  xbt_assert(t_simdata->isused == 0,
              "This task is still being used somewhere else. You cannot send it now. Go fix your code!");

  t_simdata->isused=1;
  t_simdata->comm = NULL;
  msg_global->sent_msg++;


  p_simdata->waiting_task = task;

  /* Try to send it by calling SIMIX network layer */
  TRY {
    smx_action_t comm = NULL; /* MC needs the comm to be set to NULL during the simix call  */
    comm = simcall_comm_isend(mailbox, t_simdata->message_size,
                                  t_simdata->rate, task, sizeof(void *),
                                  NULL, NULL, task, 0);
#ifdef HAVE_TRACING
    if (TRACE_is_enabled()) {
      simcall_set_category(comm, task->category);
    }
#endif
     t_simdata->comm = comm;
     simcall_comm_wait(comm, timeout);
  }

  CATCH(e) {
    switch (e.category) {
    case cancel_error:
      ret = MSG_HOST_FAILURE;
      break;
    case network_error:
      ret = MSG_TRANSFER_FAILURE;
      break;
    case timeout_error:
      ret = MSG_TIMEOUT;
      break;
    default:
      RETHROW;
    }
    xbt_ex_free(e);

    /* If the send failed, it is not used anymore */
    t_simdata->isused = 0;
  }


  p_simdata->waiting_task = NULL;
#ifdef HAVE_TRACING
  if (call_end)
    TRACE_msg_task_put_end();
#endif
  MSG_RETURN(ret);
}

#ifdef MSG_USE_DEPRECATED
msg_mailbox_t MSG_mailbox_get_by_channel(msg_host_t host,
                                         m_channel_t channel)
{
  XBT_WARN("DEPRECATED! Now use MSG_mailbox_get_by_alias");
  xbt_assert((host != NULL), "Invalid host");
  xbt_assert((channel >= 0)
              && (channel < msg_global->max_channel), "Invalid channel %d",
              channel);

  return host->mailboxes[(size_t) channel];
}
#endif
