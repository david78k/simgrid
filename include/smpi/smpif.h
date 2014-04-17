/* Copyright (c) 2007-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#ifndef SMPIF_H
#define SMPIF_H

/* #undef SMPI_F2C */

#ifdef SMPI_F2C

#include <xbt/misc.h>
#include <smpi/smpi.h>
#include <f2c.h>

XBT_PUBLIC_DATA(__thread int) smpi_current_rank;

XBT_PUBLIC(void) smpi_process_init(int *argc, char ***argv);
XBT_PUBLIC(int) smpi_process_argc(void);
XBT_PUBLIC(int) smpi_process_getarg(integer* index, char* dst, ftnlen len);
XBT_PUBLIC(int) smpi_global_size(void);

#define smpi_sample_local__(pi,pt) \
   { \
      if(smpi_sample_1(0, __FILE__, __LINE__, *pi, *pt)) { \
         smpi_sample_3(0, __FILE__, __LINE__); \
      } \
      if(!smpi_sample_2(0, __FILE__, __LINE__)) { \
         continue; \
      } \
   }

#define smpi_sample_global__(pi,pt) \
   { \
      if(smpi_sample_1(1, __FILE__, __LINE__, *pi, *pt)) { \
         smpi_sample_3(1, __FILE__, __LINE__); \
      } \
      if(!smpi_sample_2(1, __FILE__, __LINE__)) { \
         continue; \
      } \
   }


#endif

#endif // SMPI_F2C
