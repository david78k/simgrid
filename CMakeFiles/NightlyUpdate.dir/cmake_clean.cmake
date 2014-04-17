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
  "CMakeFiles/NightlyUpdate"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/NightlyUpdate.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
