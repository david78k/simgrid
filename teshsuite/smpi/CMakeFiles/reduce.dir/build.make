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

# Include any dependencies generated for this target.
include teshsuite/smpi/CMakeFiles/reduce.dir/depend.make

# Include the progress variables for this target.
include teshsuite/smpi/CMakeFiles/reduce.dir/progress.make

# Include the compile flags for this target's objects.
include teshsuite/smpi/CMakeFiles/reduce.dir/flags.make

teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o: teshsuite/smpi/CMakeFiles/reduce.dir/flags.make
teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o: teshsuite/smpi/reduce.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o"
	cd /root/simgrid/simgrid/teshsuite/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/reduce.dir/reduce.c.o   -c /root/simgrid/simgrid/teshsuite/smpi/reduce.c

teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/reduce.dir/reduce.c.i"
	cd /root/simgrid/simgrid/teshsuite/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/teshsuite/smpi/reduce.c > CMakeFiles/reduce.dir/reduce.c.i

teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/reduce.dir/reduce.c.s"
	cd /root/simgrid/simgrid/teshsuite/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/teshsuite/smpi/reduce.c -o CMakeFiles/reduce.dir/reduce.c.s

teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o.requires:
.PHONY : teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o.requires

teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o.provides: teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o.requires
	$(MAKE) -f teshsuite/smpi/CMakeFiles/reduce.dir/build.make teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o.provides.build
.PHONY : teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o.provides

teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o.provides.build: teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o

# Object files for target reduce
reduce_OBJECTS = \
"CMakeFiles/reduce.dir/reduce.c.o"

# External object files for target reduce
reduce_EXTERNAL_OBJECTS =

teshsuite/smpi/reduce: teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o
teshsuite/smpi/reduce: teshsuite/smpi/CMakeFiles/reduce.dir/build.make
teshsuite/smpi/reduce: lib/libsimgrid.so.3.9.90
teshsuite/smpi/reduce: teshsuite/smpi/CMakeFiles/reduce.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable reduce"
	cd /root/simgrid/simgrid/teshsuite/smpi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/reduce.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
teshsuite/smpi/CMakeFiles/reduce.dir/build: teshsuite/smpi/reduce
.PHONY : teshsuite/smpi/CMakeFiles/reduce.dir/build

teshsuite/smpi/CMakeFiles/reduce.dir/requires: teshsuite/smpi/CMakeFiles/reduce.dir/reduce.c.o.requires
.PHONY : teshsuite/smpi/CMakeFiles/reduce.dir/requires

teshsuite/smpi/CMakeFiles/reduce.dir/clean:
	cd /root/simgrid/simgrid/teshsuite/smpi && $(CMAKE_COMMAND) -P CMakeFiles/reduce.dir/cmake_clean.cmake
.PHONY : teshsuite/smpi/CMakeFiles/reduce.dir/clean

teshsuite/smpi/CMakeFiles/reduce.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/smpi /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/smpi /root/simgrid/simgrid/teshsuite/smpi/CMakeFiles/reduce.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : teshsuite/smpi/CMakeFiles/reduce.dir/depend
