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
include examples/simdag/goal/CMakeFiles/goal_test.dir/depend.make

# Include the progress variables for this target.
include examples/simdag/goal/CMakeFiles/goal_test.dir/progress.make

# Include the compile flags for this target's objects.
include examples/simdag/goal/CMakeFiles/goal_test.dir/flags.make

examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o: examples/simdag/goal/CMakeFiles/goal_test.dir/flags.make
examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o: examples/simdag/goal/goal_test.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o"
	cd /root/simgrid/simgrid/examples/simdag/goal && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/goal_test.dir/goal_test.c.o   -c /root/simgrid/simgrid/examples/simdag/goal/goal_test.c

examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/goal_test.dir/goal_test.c.i"
	cd /root/simgrid/simgrid/examples/simdag/goal && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/simdag/goal/goal_test.c > CMakeFiles/goal_test.dir/goal_test.c.i

examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/goal_test.dir/goal_test.c.s"
	cd /root/simgrid/simgrid/examples/simdag/goal && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/simdag/goal/goal_test.c -o CMakeFiles/goal_test.dir/goal_test.c.s

examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o.requires:
.PHONY : examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o.requires

examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o.provides: examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o.requires
	$(MAKE) -f examples/simdag/goal/CMakeFiles/goal_test.dir/build.make examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o.provides.build
.PHONY : examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o.provides

examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o.provides.build: examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o

# Object files for target goal_test
goal_test_OBJECTS = \
"CMakeFiles/goal_test.dir/goal_test.c.o"

# External object files for target goal_test
goal_test_EXTERNAL_OBJECTS =

examples/simdag/goal/goal_test: examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o
examples/simdag/goal/goal_test: examples/simdag/goal/CMakeFiles/goal_test.dir/build.make
examples/simdag/goal/goal_test: lib/libsimgrid.so.3.9.90
examples/simdag/goal/goal_test: examples/simdag/goal/CMakeFiles/goal_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable goal_test"
	cd /root/simgrid/simgrid/examples/simdag/goal && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/goal_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/simdag/goal/CMakeFiles/goal_test.dir/build: examples/simdag/goal/goal_test
.PHONY : examples/simdag/goal/CMakeFiles/goal_test.dir/build

examples/simdag/goal/CMakeFiles/goal_test.dir/requires: examples/simdag/goal/CMakeFiles/goal_test.dir/goal_test.c.o.requires
.PHONY : examples/simdag/goal/CMakeFiles/goal_test.dir/requires

examples/simdag/goal/CMakeFiles/goal_test.dir/clean:
	cd /root/simgrid/simgrid/examples/simdag/goal && $(CMAKE_COMMAND) -P CMakeFiles/goal_test.dir/cmake_clean.cmake
.PHONY : examples/simdag/goal/CMakeFiles/goal_test.dir/clean

examples/simdag/goal/CMakeFiles/goal_test.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/simdag/goal /root/simgrid/simgrid /root/simgrid/simgrid/examples/simdag/goal /root/simgrid/simgrid/examples/simdag/goal/CMakeFiles/goal_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/simdag/goal/CMakeFiles/goal_test.dir/depend

