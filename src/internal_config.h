/* internal_config.h -- characteristics of the platform, as probed by Cmake */

/* This file is AUTOMATICALLY GENERATED by Cmake. Edit the following
   template instead buildtools/Cmake/src/internal_config.h.in               */

/* Copyright (c) 2004-2013. The SimGrid Team.
 * All rights reserved.                                                     */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */


/* Set somes variables for Windows compilation */

#ifdef _XBT_DLL_EXPORT
	#ifndef DLL_EXPORT
		#define DLL_EXPORT
	#endif
#else
	#ifdef _XBT_DLL_STATIC
		#ifndef DLL_STATIC
			#define DLL_STATIC
		#endif
	#else
		#ifndef DLL_EXPORT
			#define DLL_IMPORT
		#endif
	#endif
#endif

#define SIZEOF_INT 4
#define SIZEOF_VOIDP 8

/* If __thread is available */
/* #undef HAVE_THREAD_LOCAL_STORAGE */

#ifndef __STRICT_ANSI__
/* #undef __STRICT_ANSI__ */
#endif
#ifndef _MSC_VER
/* #undef _MSC_VER */
#endif
#ifndef _M_IX86
/* #undef _M_IX86 */
#endif
/* #undef _XBT_WIN32 */
/* #undef _WIN32 */
/* #undef _WIN64 */
/* #undef __VISUALC__ */
/* #undef __BORLANDC__ */
/* #undef APPLE */
#ifdef _XBT_WIN32
	#ifndef __GNUC__
/* #undef __GNUC__ */
	#endif
#endif
/* Set to true if enable_model-checking is true */
/* #undef MMALLOC_WANT_OVERRIDE_LEGACY */
/* #undef HAVE_MC */

/* Set to true if have the mergesort function */
/* #undef HAVE_MERGESORT */

/* If have linux_futex.h */
#define HAVE_FUTEX_H 1

/* Some variable for graphviz */
/* #undef HAVE_GRAPHVIZ */
/* #undef HAVE_GRAPH_H */
/* #undef HAVE_CGRAPH_H */
/* #undef HAVE_AGRAPH_H */

/* Define if building universal (internal helper macro) */
/* #undef AC_APPLE_UNIVERSAL_BUILD */

/* Arguments passed to the configure script */
/* #undef AC_CONFIGURE_ARGS */

/* Path to the addr2line tool */
#define ADDR2LINE "/usr/bin/addr2line"

/* Predefined possible va_copy() implementation (id: ASP) */
#define __VA_COPY_USE_ASP(d, s) do { *(d) = *(s); } while (0)

/* Predefined possible va_copy() implementation (id: ASS) */
/* #undef __VA_COPY_USE_ASS */

/* Predefined possible va_copy() implementation (id: C99) */
#define __VA_COPY_USE_C99(d, s) va_copy((d),(s))

/* Define if xbt contexts are based on our threads implementation or not */
#define CONTEXT_THREADS 1

/* Define to 1 if you have the <ucontext.h> header file. */
#define HAVE_UCONTEXT_H 1

/* Define if xbt contexts are based on ucontext or not */
#define CONTEXT_UCONTEXT 1

/* Predefined possible va_copy() implementation (id: CPP) */
#define __VA_COPY_USE_CPP(d, s) memcpy((void *)(d), (void *)(s), sizeof(*(s)))

/* Predefined possible va_copy() implementation (id: CPS) */
#define __VA_COPY_USE_CPS(d, s) memcpy((void *)&(d), (void *)&(s), sizeof(s))

/* Predefined possible va_copy() implementation (id: GCB) */
#define __VA_COPY_USE_GCB(d, s) __builtin_va_copy((d),(s))

/* Predefined possible va_copy() implementation (id: GCH) */
#define __VA_COPY_USE_GCH(d, s) __va_copy((d),(s))

/* Predefined possible va_copy() implementation (id: GCM) */
/* #undef __VA_COPY_USE_GCM */

/* Used to select the flavor of assembly that we need today */
/* #undef PROCESSOR_i686 */
#define PROCESSOR_x86_64 1
#define CMAKE_SYSTEM_PROCESSOR x86_64
#define HAVE_RAWCTX 1

/* Define to 1 if you have the GNU ld library */
#define HAVE_GNU_LD 1

/* Define to 1 if you have the <errno.h> header file. */
#define HAVE_ERRNO_H 1

/* Define to 1 if you have the <execinfo.h> header file. */
#define HAVE_EXECINFO_H 1

/* Define to 1 if you have the `mmap' function. */
#define HAVE_MMAP 1

/* Define to 1 if you have the `getdtablesize' function. */
#define HAVE_GETDTABLESIZE 1

/* Define to 1 if you have the `gettimeofday' function. */
#define HAVE_GETTIMEOFDAY 1

/* Define to 1 if you have the `clock_gettime' function. */
#define HAVE_POSIX_GETTIME 1

/* Indicates that we have GTNETS support */
/* #undef HAVE_GTNETS */

/* Indicates that we have SMPI support */
#define HAVE_SMPI 1

/* Indicates that we have SMPI F2C support */
/* #undef SMPI_F2C */

/* Indicates that we have NS3 support */
/* #undef HAVE_NS3 */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* defines whether Lua bindings must be compiled or not */
/* #undef HAVE_LUA */

/* Define to 1 if you have the <lua5.1/lualib.h> header file. */
/* #undef HAVE_LUA5_1_LUALIB_H */

/* Define to 1 if you have the `makecontext' function. */
#define HAVE_MAKECONTEXT 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define if pthread_mutex_timedlock() is avaible or not (part of XPG6
   standard only?) */
#define HAVE_MUTEX_TIMEDLOCK 1

/* Define to 1 if you have the `popen' function. */
#define HAVE_POPEN 1

/* Define to 1 if you have the <pthread.h> header file. */
#define HAVE_PTHREAD_H 1

/* Define to 1 if you have the `readv' function. */
#define HAVE_READV 1

/* Define if sem_init() is avaible or not (part of XPG6 standard only) */
#define HAVE_SEM_INIT 1

/* Define if sem_timedwait() is avaible or not (part of XPG6 standard only) */
#define HAVE_SEM_TIMEDWAIT 1

/* Define to 1 if you have the `signal' function. */
#define HAVE_SIGNAL 1

/* Define to 1 if you have the <signal.h> header file. */
#define HAVE_SIGNAL_H 1

/* Define to 1 if you have the `snprintf' function. */
#define HAVE_SNPRINTF 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `sysconf' function. */
#define HAVE_SYSCONF 1

/* Define to 1 if you have the <sys/socket.h> header file. */
#define HAVE_SYS_SOCKET_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the `nanosleep' function. */
#define HAVE_NANOSLEEP 1

/* Define to 1 if you have the <valgrind/valgrind.h> header file. */
/* #undef HAVE_VALGRIND_VALGRIND_H */

/* Define if va_copy() macro exists (and no fallback implementation is
   required) */
#define HAVE_VA_COPY 1

/* Define to 1 if you have the `vsnprintf' function. */
#define HAVE_VSNPRINTF 1

/* Define to 1 if you have the <windows.h> header file. */
/* #undef HAVE_WINDOWS_H */

/* Define to 1 if you have the <winsock2.h> header file. */
/* #undef HAVE_WINSOCK2_H */

/* Define to 1 if you have the <winsock.h> header file. */
/* #undef HAVE_WINSOCK_H */

/* Define to the sub-directory in which libtool stores uninstalled libraries.*/
/* #undef LT_OBJDIR */

/* enable the asprintf replacement */
/* #undef NEED_ASPRINTF */

/* enable the vasprintf replacement */
/* #undef NEED_VASPRINTF */

/* Name of package */
/* #undef PACKAGE */

/* Define to the address where bug reports for this package should be sent. */
/* #undef PACKAGE_BUGREPORT */

/* Define to the full name of this package. */
/* #undef PACKAGE_NAME */

/* Define to the full name and version of this package. */
/* #undef PACKAGE_STRING */

/* Define to the one symbol short name of this package. */
/* #undef PACKAGE_TARNAME */

/* Define to the home page for this package. */
/* #undef PACKAGE_URL */

/* Define to the version of this package. */
/* #undef PACKAGE_VERSION */

/* "enable replacement (v)snprintf if system (v)snprintf is broken" */
/* #undef PREFER_PORTABLE_SNPRINTF */

/* Indicates whether printf("%s",NULL) works */
#define PRINTF_NULL_WORKING 1

/* define for stack growth */
#define PTH_STACKGROWTH -1

/* The maximal size of any scalar on this arch */
/* #undef SIZEOF_MAX */

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#define TIME_WITH_SYS_TIME 1

/* Tracing SimGrid */
#define HAVE_TRACING 1

/* Tracking of latency bound */
/* #undef HAVE_LATENCY_BOUND_TRACKING */

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif

/* Define to 1 if `lex' declares `yytext' as a `char *' by default, not a
   `char[]'. */
/* #undef YYTEXT_POINTER */

/* Optional va_copy() implementation activation */
#ifndef HAVE_VA_COPY
#define va_copy(d, s) __VA_COPY_USE(d, s)
#endif
/* Define to id of used va_copy() implementation */
#define __VA_COPY_USE(d, s) __VA_COPY_USE_C99(d, s)

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */
