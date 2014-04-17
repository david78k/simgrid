FILE(REMOVE_RECURSE
  "CMakeFiles/file.dir/file.c.o"
  "file.pdb"
  "file"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang C)
  INCLUDE(CMakeFiles/file.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
