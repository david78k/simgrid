### ARGs use -D[var]=[ON/OFF] or [1/0] or [true/false](see after)
### ex: cmake -Denable_java=ON -Denable_gtnets=ON ./

set(BIBTEX2HTML ${BIBTEX2HTML} CACHE PATH "Path to bibtex2html")
set(gtnets_path ${gtnets_path} CACHE PATH "Path to gtnets lib and include")
set(ns3_path ${ns3_path} CACHE PATH "Path to ns3 lib and include")

if(NOT CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local/simgrid/" CACHE PATH "Path where to install project")
else()
  set(CMAKE_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Path where to install project")
endif()

set(pipol_user ${pipol_user} CACHE TYPE INTERNAL FORCE)
mark_as_advanced(pipol_user)

option(release "Whether Release Mode is activated (disable tests on experimental parts)" on)
option(enable_compile_optimizations "Whether to produce efficient code for the SimGrid library" on)
option(enable_gtnets "Whether gtnets model is activated." off)
option(enable_ns3    "Whether ns3 model is activated." off)
option(enable_java   "Whether the Java bindings are activated." off)
option(enable_scala  "Whether the Scala bindings are activated." off)
option(enable_lua    "Whether the lua bindings are activated." off)
option(enable_compile_warnings "Whether compilation warnings should be turned into errors." off)
option(enable_maintainer_mode "Whether flex and flexml files should be rebuilt." off)
option(enable_tracing "Tracing simulations for visualization." on)
option(enable_latency_bound_tracking "" off)
option(enable_coverage "Enable coverage." off)
mark_as_advanced(enable_coverage)
option(enable_memcheck "Enable memcheck." off)
mark_as_advanced(enable_memcheck)
option(enable_mallocators "Enable mallocators (disable only for debugging purpose)." on)
option(enable_print_message "Enable print message during config." off)
mark_as_advanced(enable_print_message)
option(enable_model-checking "Turn this on to experiment with our prototype of model-checker (hinders the simulation's performance even if turned of at runtime)" off)
option(enable_lib_static "" off)
option(enable_jedule "Jedule output of SimDAG." off)
option(enable_debug "Turn this off to remove all debug messages at compile time (faster, but no debug activable)" on)
option(enable_supernovae "Whether Supernovae mode (helping compiler optimization) is activated." off)
option(enable_msg_deprecated "This option enable the use of msg deprecated functions" off)

if(WIN32)
  option(enable_smpi "Whether SMPI in included in library." off)
  option(enable_smpi_MPICH3_testsuite "Whether the test suite form MPICH 3 should be built" off)
else()
  option(enable_smpi "Whether SMPI in included in library." on)
  option(enable_smpi_MPICH3_testsuite "Whether the test suite form MPICH 3 should be built" off)
endif()

if(enable_scala AND NOT enable_java)
  message(WARNING "For using scala you must turn java on with command:\ncmake -Denable_java=on .")
endif()

mark_as_advanced(HAVE_SSH)
mark_as_advanced(HAVE_RSYNC)
mark_as_advanced(BIBTEX2HTML_PATH)
mark_as_advanced(BUILDNAME)
mark_as_advanced(ADDR2LINE)
mark_as_advanced(BIBTOOL_PATH)
mark_as_advanced(BUILD_TESTING)
mark_as_advanced(CMAKE_BUILD_TYPE)
mark_as_advanced(DART_ROOT)
mark_as_advanced(DOXYGEN_PATH)
mark_as_advanced(FIG2DEV_PATH)
mark_as_advanced(FLEXML_EXE)
mark_as_advanced(FLEX_EXE)
mark_as_advanced(PERL_EXECUTABLE)
mark_as_advanced(GCOV_PATH)
mark_as_advanced(ICONV_PATH)
mark_as_advanced(MAKE_PATH)
mark_as_advanced(SVN)
mark_as_advanced(GIT)
mark_as_advanced(CMAKE_OSX_ARCHITECTURES)
mark_as_advanced(CMAKE_OSX_DEPLOYMENT_TARGET)
mark_as_advanced(CMAKE_OSX_SYSROOT)
mark_as_advanced(SED_EXE)
mark_as_advanced(BIBTEX2HTML)
mark_as_advanced(CMAKE_C_LINK_FLAGS)
mark_as_advanced(CMAKE_CXX_FLAGS)
mark_as_advanced(CMAKE_Fortran_LINK_FLAGS)
