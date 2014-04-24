FILE(REMOVE_RECURSE
  "src/context_sysv_config.h"
  "src/internal_config.h"
  "include/smpi/mpif.h"
  "include/smpi/smpif.h"
  "include/simgrid_config.h"
  "bin/smpicc"
  "bin/smpif2c"
  "bin/smpiff"
  "bin/smpif90"
  "bin/smpirun"
  "bin/colorize"
  "bin/simgrid_update_xml"
  "examples/smpi/tracing/smpi_traced.trace"
  "src/supernovae_sg.c"
  "src/supernovae_smpi.c"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o"
  "CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o"
  "lib/libsimgrid-java.pdb"
  "lib/libsimgrid-java.so"
  "lib/libsimgrid-java.so.3.9.90"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang C)
  INCLUDE(CMakeFiles/simgrid-java.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
