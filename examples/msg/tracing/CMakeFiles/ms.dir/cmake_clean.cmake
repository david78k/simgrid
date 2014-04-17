FILE(REMOVE_RECURSE
  "ms.cat.plist"
  "ms.trace"
  "ms.uncat.plist"
  "CMakeFiles/ms.dir/ms.c.o"
  "ms.pdb"
  "ms"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang C)
  INCLUDE(CMakeFiles/ms.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
