FILE(REMOVE_RECURSE
  "ms.cat.plist"
  "ms.trace"
  "ms.uncat.plist"
  "CMakeFiles/categories.dir/categories.c.o"
  "categories.pdb"
  "categories"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang C)
  INCLUDE(CMakeFiles/categories.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
