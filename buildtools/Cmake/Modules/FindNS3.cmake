# If you use NS-3 version 3.14 (prefer used at most 3.13) be sure having do
# ln -sf libns3.14.1-applications-debug.so libns3-applications.so
# ln -sf libns3.14.1-internet-debug.so libns3-internet.so
# ln -sf libns3.14.1-point-to-point-debug.so libns3-point-to-point.so
# ln -sf libns3.14.1-csma-debug.so libns3-csma.so
# ln -sf libns3.14.1-core-debug.so libns3-core.so

find_library(HAVE_NS3_LIB
  NAME ns3
  PATH_SUFFIXES lib64 lib ns3/lib
  PATHS
  ${ns3_path}
  )

find_library(HAVE_NS3_CORE_LIB
  NAME ns3-core
  PATH_SUFFIXES lib64 lib ns3/lib
  PATHS
  ${ns3_path}
  )

find_path(HAVE_CORE_MODULE_H
  NAME ns3/core-module.h
  PATH_SUFFIXES include ns3/include include/ns3.14.1
  PATHS
  ${ns3_path}
  )

message(STATUS "Looking for core-module.h")
if(HAVE_CORE_MODULE_H)
  message(STATUS "Looking for core-module.h - found")
else()
  message(STATUS "Looking for core-module.h - not found")
endif()
mark_as_advanced(HAVE_CORE_MODULE_H)

message(STATUS "Looking for lib ns3")
if(HAVE_NS3_LIB)
  message(STATUS "Looking for lib ns3 - found")
else()
  message(STATUS "Looking for lib ns3 - not found")
endif()
mark_as_advanced(HAVE_NS3_LIB)

message(STATUS "Looking for lib ns3-core")
if(HAVE_NS3_CORE_LIB)
  message(STATUS "Looking for lib ns3-core - found")
else()
  message(STATUS "Looking for lib ns3-core - not found")
endif()

mark_as_advanced(HAVE_NS3_LIB)
mark_as_advanced(HAVE_NS3_CORE_LIB)

if(HAVE_CORE_MODULE_H)
  if(HAVE_NS3_LIB)
    message(STATUS "Warning: NS-3 version <= 3.10")
    set(HAVE_NS3 1)
    set(NS3_VERSION 310)
    string(REPLACE "/libns3.${LIB_EXE}" ""  HAVE_NS3_LIB "${HAVE_NS3_LIB}")
  endif()
  if(HAVE_NS3_CORE_LIB)
    message(STATUS "NS-3 version > 3.10")
    set(HAVE_NS3 1)
    set(NS3_VERSION 312)
    string(REPLACE "/libns3-core.${LIB_EXE}" ""  HAVE_NS3_LIB "${HAVE_NS3_CORE_LIB}")
  endif()
endif()

if(HAVE_NS3)
  string(REGEX MATCH "${HAVE_NS3_LIB}" operation "$ENV{LD_LIBRARY_PATH}")
  if(NOT operation)
    message(STATUS "Warning: To use NS-3 don't forget to set LD_LIBRARY_PATH with:	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HAVE_NS3_LIB}")
  else()

    string(REGEX MATCH "-L${HAVE_NS3_LIB} " operation1 "${CMAKE_C_FLAGS}")
    if(NOT operation1)
      SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}-L${HAVE_NS3_LIB} ")
    endif()

    string(REGEX MATCH "-I${HAVE_CORE_MODULE_H} " operation1 "${CMAKE_C_FLAGS}")
    if(NOT operation1)
      SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}-I${HAVE_CORE_MODULE_H} ")
    endif()

    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}-I${HAVE_CORE_MODULE_H} -L${HAVE_NS3_LIB} ")
  endif()
else()
  message(STATUS "Warning: To use NS-3 Please install ns3 at least version 3.10 (http://www.nsnam.org/releases/)")
endif()

if(HAVE_NS3 AND enable_supernovae)
  set(enable_supernovae OFF)
endif()
