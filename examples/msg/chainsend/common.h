#ifndef KADEPLOY_COMMON_H
#define KADEPLOY_COMMON_H

#include "msg/msg.h"
#include "xbt/sysdep.h"

static XBT_INLINE void queue_pending_connection(msg_comm_t comm, xbt_dynar_t q)
{
  xbt_dynar_push(q, &comm);
}

int process_pending_connections(xbt_dynar_t q);

#endif /* KADEPLOY_COMMON_H */
