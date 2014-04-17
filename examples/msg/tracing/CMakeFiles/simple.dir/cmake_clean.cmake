FILE(REMOVE_RECURSE
  "ms.cat.plist"
  "ms.trace"
  "ms.uncat.plist"
  "CMakeFiles/simple.dir/simple.c.o"
  "simple.pdb"
  "simple"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang C)
  INCLUDE(CMakeFiles/simple.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
