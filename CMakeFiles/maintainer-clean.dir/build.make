# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/simgrid/simgrid

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/simgrid/simgrid

# Utility rule file for maintainer-clean.

# Include the progress variables for this target.
include CMakeFiles/maintainer-clean.dir/progress.make

CMakeFiles/maintainer-clean:
	/usr/bin/cmake -E remove -f src/config_unit.c
	/usr/bin/cmake -E remove -f src/cunit_unit.c
	/usr/bin/cmake -E remove -f src/dict_unit.c
	/usr/bin/cmake -E remove -f src/dynar_unit.c
	/usr/bin/cmake -E remove -f src/ex_unit.c
	/usr/bin/cmake -E remove -f src/set_unit.c
	/usr/bin/cmake -E remove -f src/simgrid_units_main.c
	/usr/bin/cmake -E remove -f src/swag_unit.c
	/usr/bin/cmake -E remove -f src/xbt_sha_unit.c
	/usr/bin/cmake -E remove -f src/xbt_str_unit.c
	/usr/bin/cmake -E remove -f src/xbt_strbuff_unit.c
	/usr/bin/cmake -E remove -f src/xbt_synchro_unit.c

maintainer-clean: CMakeFiles/maintainer-clean
maintainer-clean: CMakeFiles/maintainer-clean.dir/build.make
.PHONY : maintainer-clean

# Rule to build all files generated by this target.
CMakeFiles/maintainer-clean.dir/build: maintainer-clean
.PHONY : CMakeFiles/maintainer-clean.dir/build

CMakeFiles/maintainer-clean.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/maintainer-clean.dir/cmake_clean.cmake
.PHONY : CMakeFiles/maintainer-clean.dir/clean

CMakeFiles/maintainer-clean.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid/CMakeFiles/maintainer-clean.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/maintainer-clean.dir/depend
