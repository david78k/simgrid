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
include examples/msg/actions/CMakeFiles/actions.dir/depend.make

# Include the progress variables for this target.
include examples/msg/actions/CMakeFiles/actions.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/actions/CMakeFiles/actions.dir/flags.make

examples/msg/actions/CMakeFiles/actions.dir/actions.c.o: examples/msg/actions/CMakeFiles/actions.dir/flags.make
examples/msg/actions/CMakeFiles/actions.dir/actions.c.o: examples/msg/actions/actions.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/actions/CMakeFiles/actions.dir/actions.c.o"
	cd /root/simgrid/simgrid/examples/msg/actions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/actions.dir/actions.c.o   -c /root/simgrid/simgrid/examples/msg/actions/actions.c

examples/msg/actions/CMakeFiles/actions.dir/actions.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/actions.dir/actions.c.i"
	cd /root/simgrid/simgrid/examples/msg/actions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/actions/actions.c > CMakeFiles/actions.dir/actions.c.i

examples/msg/actions/CMakeFiles/actions.dir/actions.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/actions.dir/actions.c.s"
	cd /root/simgrid/simgrid/examples/msg/actions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/actions/actions.c -o CMakeFiles/actions.dir/actions.c.s

examples/msg/actions/CMakeFiles/actions.dir/actions.c.o.requires:
.PHONY : examples/msg/actions/CMakeFiles/actions.dir/actions.c.o.requires

examples/msg/actions/CMakeFiles/actions.dir/actions.c.o.provides: examples/msg/actions/CMakeFiles/actions.dir/actions.c.o.requires
	$(MAKE) -f examples/msg/actions/CMakeFiles/actions.dir/build.make examples/msg/actions/CMakeFiles/actions.dir/actions.c.o.provides.build
.PHONY : examples/msg/actions/CMakeFiles/actions.dir/actions.c.o.provides

examples/msg/actions/CMakeFiles/actions.dir/actions.c.o.provides.build: examples/msg/actions/CMakeFiles/actions.dir/actions.c.o

# Object files for target actions
actions_OBJECTS = \
"CMakeFiles/actions.dir/actions.c.o"

# External object files for target actions
actions_EXTERNAL_OBJECTS =

examples/msg/actions/actions: examples/msg/actions/CMakeFiles/actions.dir/actions.c.o
examples/msg/actions/actions: examples/msg/actions/CMakeFiles/actions.dir/build.make
examples/msg/actions/actions: lib/libsimgrid.so.3.9.90
examples/msg/actions/actions: examples/msg/actions/CMakeFiles/actions.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable actions"
	cd /root/simgrid/simgrid/examples/msg/actions && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/actions.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/actions/CMakeFiles/actions.dir/build: examples/msg/actions/actions
.PHONY : examples/msg/actions/CMakeFiles/actions.dir/build

examples/msg/actions/CMakeFiles/actions.dir/requires: examples/msg/actions/CMakeFiles/actions.dir/actions.c.o.requires
.PHONY : examples/msg/actions/CMakeFiles/actions.dir/requires

examples/msg/actions/CMakeFiles/actions.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/actions && $(CMAKE_COMMAND) -P CMakeFiles/actions.dir/cmake_clean.cmake
.PHONY : examples/msg/actions/CMakeFiles/actions.dir/clean

examples/msg/actions/CMakeFiles/actions.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/actions /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/actions /root/simgrid/simgrid/examples/msg/actions/CMakeFiles/actions.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/actions/CMakeFiles/actions.dir/depend

