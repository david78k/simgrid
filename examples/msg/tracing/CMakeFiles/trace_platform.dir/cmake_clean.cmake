FILE(REMOVE_RECURSE
  "ms.cat.plist"
  "ms.trace"
  "ms.uncat.plist"
  "CMakeFiles/trace_platform.dir/trace_platform.c.o"
  "trace_platform.pdb"
  "trace_platform"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang C)
  INCLUDE(CMakeFiles/trace_platform.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
