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
include examples/msg/energy/e1/CMakeFiles/e1.dir/depend.make

# Include the progress variables for this target.
include examples/msg/energy/e1/CMakeFiles/e1.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/energy/e1/CMakeFiles/e1.dir/flags.make

examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o: examples/msg/energy/e1/CMakeFiles/e1.dir/flags.make
examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o: examples/msg/energy/e1/e1.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o"
	cd /root/simgrid/simgrid/examples/msg/energy/e1 && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/e1.dir/e1.c.o   -c /root/simgrid/simgrid/examples/msg/energy/e1/e1.c

examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/e1.dir/e1.c.i"
	cd /root/simgrid/simgrid/examples/msg/energy/e1 && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/energy/e1/e1.c > CMakeFiles/e1.dir/e1.c.i

examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/e1.dir/e1.c.s"
	cd /root/simgrid/simgrid/examples/msg/energy/e1 && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/energy/e1/e1.c -o CMakeFiles/e1.dir/e1.c.s

examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o.requires:
.PHONY : examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o.requires

examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o.provides: examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o.requires
	$(MAKE) -f examples/msg/energy/e1/CMakeFiles/e1.dir/build.make examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o.provides.build
.PHONY : examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o.provides

examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o.provides.build: examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o

# Object files for target e1
e1_OBJECTS = \
"CMakeFiles/e1.dir/e1.c.o"

# External object files for target e1
e1_EXTERNAL_OBJECTS =

examples/msg/energy/e1/e1: examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o
examples/msg/energy/e1/e1: examples/msg/energy/e1/CMakeFiles/e1.dir/build.make
examples/msg/energy/e1/e1: lib/libsimgrid.so.3.9.90
examples/msg/energy/e1/e1: examples/msg/energy/e1/CMakeFiles/e1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable e1"
	cd /root/simgrid/simgrid/examples/msg/energy/e1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/e1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/energy/e1/CMakeFiles/e1.dir/build: examples/msg/energy/e1/e1
.PHONY : examples/msg/energy/e1/CMakeFiles/e1.dir/build

examples/msg/energy/e1/CMakeFiles/e1.dir/requires: examples/msg/energy/e1/CMakeFiles/e1.dir/e1.c.o.requires
.PHONY : examples/msg/energy/e1/CMakeFiles/e1.dir/requires

examples/msg/energy/e1/CMakeFiles/e1.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/energy/e1 && $(CMAKE_COMMAND) -P CMakeFiles/e1.dir/cmake_clean.cmake
.PHONY : examples/msg/energy/e1/CMakeFiles/e1.dir/clean

examples/msg/energy/e1/CMakeFiles/e1.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/energy/e1 /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/energy/e1 /root/simgrid/simgrid/examples/msg/energy/e1/CMakeFiles/e1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/energy/e1/CMakeFiles/e1.dir/depend

