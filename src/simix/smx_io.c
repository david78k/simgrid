/* Copyright (c) 2007-2010, 2012-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#include "smx_private.h"
#include "surf/storage_private.h"
#include "xbt/sysdep.h"
#include "xbt/log.h"
#include "xbt/dict.h"
#include "mc/mc.h"

XBT_LOG_NEW_DEFAULT_SUBCATEGORY(simix_io, simix,
                                "Logging specific to SIMIX (io)");


/**
 * \brief Internal function to create a SIMIX storage.
 * \param name name of the storage to create
 * \param storage the SURF storage to encapsulate
 * \param data some user data (may be NULL)
 */
smx_storage_t SIMIX_storage_create(const char *name, void *storage, void *data)
{
  smx_storage_priv_t smx_storage = xbt_new0(s_smx_storage_priv_t, 1);

  smx_storage->data = data;

  /* Update global variables */
  xbt_lib_set(storage_lib,name,SIMIX_STORAGE_LEVEL,smx_storage);
  return xbt_lib_get_elm_or_null(storage_lib, name);
}

/**
 * \brief Internal function to destroy a SIMIX storage.
 *
 * \param s the host to destroy (a smx_storage_t)
 */
void SIMIX_storage_destroy(void *s)
{
  smx_storage_priv_t storage = (smx_storage_priv_t) s;

  xbt_assert((storage != NULL), "Invalid parameters");
  if (storage->data)
    free(storage->data);

  /* Clean storage structure */
  free(storage);
}

void* SIMIX_pre_file_get_data(smx_simcall_t simcall,smx_file_t fd){
  return SIMIX_file_get_data(fd);
}

void* SIMIX_file_get_data(smx_file_t fd){
  xbt_assert((fd != NULL), "Invalid parameters (simix file is NULL)");

  return fd->data;
}

void SIMIX_pre_file_set_data(smx_simcall_t simcall, smx_file_t fd, void *data) {
  SIMIX_file_set_data(fd, data);
}

void SIMIX_file_set_data(smx_file_t fd, void *data){
  xbt_assert((fd != NULL), "Invalid parameter");

  fd->data = data;
}

//SIMIX FILE READ
void SIMIX_pre_file_read(smx_simcall_t simcall, smx_file_t fd, sg_storage_size_t size)
{
  smx_action_t action = SIMIX_file_read(simcall->issuer, fd, size);
  xbt_fifo_push(action->simcalls, simcall);
  simcall->issuer->waiting_action = action;
}

smx_action_t SIMIX_file_read(smx_process_t process, smx_file_t fd, sg_storage_size_t size)
{
  smx_action_t action;
  smx_host_t host = process->smx_host;

  /* check if the host is active */
  if (surf_workstation_model->extension.
      workstation.get_state(host) != SURF_RESOURCE_ON) {
    THROWF(host_error, 0, "Host %s failed, you cannot call this function",
           sg_host_name(host));
  }

  action = xbt_mallocator_get(simix_global->action_mallocator);
  action->type = SIMIX_ACTION_IO;
  action->name = NULL;
#ifdef HAVE_TRACING
  action->category = NULL;
#endif

  action->io.host = host;
  action->io.surf_io =
      surf_workstation_model->extension.workstation.read(host, fd->surf_file, size);

  surf_workstation_model->action_data_set(action->io.surf_io, action);
  XBT_DEBUG("Create io action %p", action);

  return action;
}

//SIMIX FILE WRITE
void SIMIX_pre_file_write(smx_simcall_t simcall, smx_file_t fd, sg_storage_size_t size)
{
  smx_action_t action = SIMIX_file_write(simcall->issuer, fd,  size);
  xbt_fifo_push(action->simcalls, simcall);
  simcall->issuer->waiting_action = action;
}

smx_action_t SIMIX_file_write(smx_process_t process, smx_file_t fd, sg_storage_size_t size)
{
  smx_action_t action;
  smx_host_t host = process->smx_host;

  /* check if the host is active */
  if (surf_workstation_model->extension.
      workstation.get_state(host) != SURF_RESOURCE_ON) {
    THROWF(host_error, 0, "Host %s failed, you cannot call this function",
           sg_host_name(host));
  }

  action = xbt_mallocator_get(simix_global->action_mallocator);
  action->type = SIMIX_ACTION_IO;
  action->name = NULL;
#ifdef HAVE_TRACING
  action->category = NULL;
#endif

  action->io.host = host;
  action->io.surf_io =
      surf_workstation_model->extension.workstation.write(host, fd->surf_file, size);

  surf_workstation_model->action_data_set(action->io.surf_io, action);
  XBT_DEBUG("Create io action %p", action);

  return action;
}

//SIMIX FILE OPEN
void SIMIX_pre_file_open(smx_simcall_t simcall, const char* mount,
                         const char* path)
{
  smx_action_t action = SIMIX_file_open(simcall->issuer, mount, path);
  xbt_fifo_push(action->simcalls, simcall);
  simcall->issuer->waiting_action = action;
}

smx_action_t SIMIX_file_open(smx_process_t process ,const char* mount,
                             const char* path)
{
  smx_action_t action;
  smx_host_t host = process->smx_host;

  /* check if the host is active */
  if (surf_workstation_model->extension.
      workstation.get_state(host) != SURF_RESOURCE_ON) {
    THROWF(host_error, 0, "Host %s failed, you cannot call this function",
           sg_host_name(host));
  }

  action = xbt_mallocator_get(simix_global->action_mallocator);
  action->type = SIMIX_ACTION_IO;
  action->name = NULL;
#ifdef HAVE_TRACING
  action->category = NULL;
#endif

  action->io.host = host;
  action->io.surf_io =
      surf_workstation_model->extension.workstation.open(host, mount, path);

  surf_workstation_model->action_data_set(action->io.surf_io, action);
  XBT_DEBUG("Create io action %p", action);

  return action;
}

//SIMIX FILE CLOSE
void SIMIX_pre_file_close(smx_simcall_t simcall, smx_file_t fd)
{
  smx_action_t action = SIMIX_file_close(simcall->issuer, fd);
  xbt_fifo_push(action->simcalls, simcall);
  simcall->issuer->waiting_action = action;
}

smx_action_t SIMIX_file_close(smx_process_t process, smx_file_t fd)
{
  smx_action_t action;
  smx_host_t host = process->smx_host;

  /* check if the host is active */
  if (surf_workstation_model->extension.
      workstation.get_state(host) != SURF_RESOURCE_ON) {
    THROWF(host_error, 0, "Host %s failed, you cannot call this function",
           sg_host_name(host));
  }

  action = xbt_mallocator_get(simix_global->action_mallocator);
  action->type = SIMIX_ACTION_IO;
  action->name = NULL;
#ifdef HAVE_TRACING
  action->category = NULL;
#endif

  action->io.host = host;
  action->io.surf_io = surf_workstation_model->extension.workstation.close(host, fd->surf_file);

  surf_workstation_model->action_data_set(action->io.surf_io, action);
  XBT_DEBUG("Create io action %p", action);

  return action;
}


//SIMIX FILE UNLINK
int SIMIX_pre_file_unlink(smx_simcall_t simcall, smx_file_t fd)
{
  return SIMIX_file_unlink(simcall->issuer, fd);
}

int SIMIX_file_unlink(smx_process_t process, smx_file_t fd)
{
  smx_host_t host = process->smx_host;
  /* check if the host is active */
  if (surf_workstation_model->extension.
      workstation.get_state(host) != SURF_RESOURCE_ON) {
    THROWF(host_error, 0, "Host %s failed, you cannot call this function",
           sg_host_name(host));
  }

  if (surf_workstation_model->extension.workstation.unlink(host, fd->surf_file)){
    xbt_free(fd);
    return 1;
  } else
    return 0;
}

//SIMIX FILE LS
void SIMIX_pre_file_ls(smx_simcall_t simcall,
                       const char* mount, const char* path)
{
  smx_action_t action = SIMIX_file_ls(simcall->issuer, mount, path);
  xbt_fifo_push(action->simcalls, simcall);
  simcall->issuer->waiting_action = action;
}
smx_action_t SIMIX_file_ls(smx_process_t process, const char* mount, const char *path)
{
  smx_action_t action;
  smx_host_t host = process->smx_host;
  /* check if the host is active */
  if (surf_workstation_model->extension.workstation.get_state(host) != SURF_RESOURCE_ON) {
    THROWF(host_error, 0, "Host %s failed, you cannot call this function",
           sg_host_name(host));
  }

  action = xbt_mallocator_get(simix_global->action_mallocator);
  action->type = SIMIX_ACTION_IO;
  action->name = NULL;
#ifdef HAVE_TRACING
  action->category = NULL;
#endif

  action->io.host = host;
  action->io.surf_io = surf_workstation_model->extension.workstation.ls(host,mount,path);

  surf_workstation_model->action_data_set(action->io.surf_io, action);
  XBT_DEBUG("Create io action %p", action);
  return action;
}

sg_storage_size_t SIMIX_pre_file_get_size(smx_simcall_t simcall, smx_file_t fd)
{
  return SIMIX_file_get_size(simcall->issuer, fd);
}

sg_storage_size_t SIMIX_file_get_size(smx_process_t process, smx_file_t fd)
{
  smx_host_t host = process->smx_host;
  return  surf_workstation_model->extension.workstation.get_size(host,
      fd->surf_file);
}

xbt_dynar_t SIMIX_pre_file_get_info(smx_simcall_t simcall, smx_file_t fd)
{
  return SIMIX_file_get_info(simcall->issuer, fd);
}

xbt_dynar_t SIMIX_file_get_info(smx_process_t process, smx_file_t fd)
{
  smx_host_t host = process->smx_host;
  return  surf_workstation_model->extension.workstation.get_info(host,
      fd->surf_file);
}

sg_storage_size_t SIMIX_pre_storage_get_free_size(smx_simcall_t simcall, const char* name)
{
  return SIMIX_storage_get_free_size(simcall->issuer, name);
}

sg_storage_size_t SIMIX_storage_get_free_size(smx_process_t process, const char* name)
{
  smx_host_t host = process->smx_host;
  return  surf_workstation_model->extension.workstation.get_free_size(host,name);
}

sg_storage_size_t SIMIX_pre_storage_get_used_size(smx_simcall_t simcall, const char* name)
{
  return SIMIX_storage_get_used_size(simcall->issuer, name);
}

sg_storage_size_t SIMIX_storage_get_used_size(smx_process_t process, const char* name)
{
  smx_host_t host = process->smx_host;
  return  surf_workstation_model->extension.workstation.get_used_size(host,name);
}

xbt_dict_t SIMIX_pre_storage_get_properties(smx_simcall_t simcall, smx_storage_t storage){
  return SIMIX_storage_get_properties(storage);
}
xbt_dict_t SIMIX_storage_get_properties(smx_storage_t storage){
  xbt_assert((storage != NULL), "Invalid parameters (simix storage is NULL)");
  return surf_storage_model->extension.storage.get_properties(storage);
}

const char* SIMIX_pre_storage_get_name(smx_simcall_t simcall, smx_storage_t storage){
   return SIMIX_storage_get_name(storage);
}

const char* SIMIX_storage_get_name(smx_storage_t storage){
  xbt_assert((storage != NULL), "Invalid parameters");
  return sg_storage_name(storage);
}

void SIMIX_pre_storage_set_data(smx_simcall_t simcall, smx_storage_t storage, void *data) {
  SIMIX_storage_set_data(storage, data);
}
void SIMIX_storage_set_data(smx_storage_t storage, void *data){
  xbt_assert((storage != NULL), "Invalid parameters");
  xbt_assert((SIMIX_storage_priv(storage)->data == NULL), "Data already set");

  SIMIX_storage_priv(storage)->data = data;
}

void* SIMIX_pre_storage_get_data(smx_simcall_t simcall,smx_storage_t storage){
  return SIMIX_storage_get_data(storage);
}

void* SIMIX_storage_get_data(smx_storage_t storage){
  xbt_assert((storage != NULL), "Invalid parameters (simix storage is NULL)");

  return SIMIX_storage_priv(storage)->data;
}

xbt_dict_t SIMIX_pre_storage_get_content(smx_simcall_t simcall, smx_storage_t storage){
  return SIMIX_storage_get_content(storage);
}

xbt_dict_t SIMIX_storage_get_content(smx_storage_t storage){
  xbt_assert((storage != NULL), "Invalid parameters (simix storage is NULL)");
  return surf_storage_model->extension.storage.get_content(storage);
}

sg_storage_size_t SIMIX_storage_get_size(smx_storage_t storage){
  xbt_assert((storage != NULL), "Invalid parameters (simix storage is NULL)");
  return surf_storage_model->extension.storage.get_size(storage);
}

void SIMIX_post_io(smx_action_t action)
{
  xbt_fifo_item_t i;
  smx_simcall_t simcall;
//  char* key;
//  xbt_dict_cursor_t cursor = NULL;
//  s_file_stat_t *dst = NULL;
//  s_file_stat_t *src = NULL;

  xbt_fifo_foreach(action->simcalls,i,simcall,smx_simcall_t) {
    switch (simcall->call) {
    case SIMCALL_FILE_OPEN:;
      smx_file_t tmp = xbt_new(s_smx_file_t,1);
      tmp->surf_file = (action->io.surf_io)->file;
      simcall_file_open__set__result(simcall, tmp);
      break;

    case SIMCALL_FILE_CLOSE:
      xbt_free(simcall_file_close__get__fd(simcall));
      simcall_file_close__set__result(simcall, 0);
      break;

    case SIMCALL_FILE_WRITE:
      simcall_file_write__set__result(simcall, (action->io.surf_io)->cost);
      break;

    case SIMCALL_FILE_READ:
      simcall_file_read__set__result(simcall, (action->io.surf_io)->cost);
      break;

    case SIMCALL_FILE_LS:
//      xbt_dict_foreach((action->io.surf_io)->ls_dict,cursor,key, src){
//        // if there is a stat we have to duplicate it
//        if(src){
//          dst = xbt_new0(s_file_stat_t,1);
//          file_stat_copy(src, dst);
//          xbt_dict_set((action->io.surf_io)->ls_dict,key,dst,xbt_free);
//        }
//      }
      simcall_file_ls__set__result(simcall, (action->io.surf_io)->ls_dict);
      break;
    default:
      break;
    }
  }

  switch (surf_workstation_model->action_state_get(action->io.surf_io)) {

    case SURF_ACTION_FAILED:
      action->state = SIMIX_FAILED;
      break;

    case SURF_ACTION_DONE:
      action->state = SIMIX_DONE;
      break;

    default:
      THROW_IMPOSSIBLE;
      break;
  }

  SIMIX_io_finish(action);
}

void SIMIX_io_destroy(smx_action_t action)
{
  XBT_DEBUG("Destroy action %p", action);
  if (action->io.surf_io)
    action->io.surf_io->model_obj->action_unref(action->io.surf_io);
  xbt_mallocator_release(simix_global->action_mallocator, action);
}

void SIMIX_io_finish(smx_action_t action)
{
  xbt_fifo_item_t item;
  smx_simcall_t simcall;

  xbt_fifo_foreach(action->simcalls, item, simcall, smx_simcall_t) {

    switch (action->state) {

      case SIMIX_DONE:
        /* do nothing, action done */
        break;

      case SIMIX_FAILED:
        SMX_EXCEPTION(simcall->issuer, io_error, 0, "IO failed");
        break;

      case SIMIX_CANCELED:
        SMX_EXCEPTION(simcall->issuer, cancel_error, 0, "Canceled");
        break;

      default:
        xbt_die("Internal error in SIMIX_io_finish: unexpected action state %d",
            (int)action->state);
    }

    if (surf_workstation_model->extension.
        workstation.get_state(simcall->issuer->smx_host) != SURF_RESOURCE_ON) {
      simcall->issuer->context->iwannadie = 1;
    }

    simcall->issuer->waiting_action = NULL;
    SIMIX_simcall_answer(simcall);
  }

  /* We no longer need it */
  SIMIX_io_destroy(action);
}
