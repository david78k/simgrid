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
include examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/depend.make

# Include the progress variables for this target.
include examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/flags.make

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o: examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/flags.make
examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o: examples/msg/masterslave/masterslave_cluster.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o"
	cd /root/simgrid/simgrid/examples/msg/masterslave && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o   -c /root/simgrid/simgrid/examples/msg/masterslave/masterslave_cluster.c

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.i"
	cd /root/simgrid/simgrid/examples/msg/masterslave && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/masterslave/masterslave_cluster.c > CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.i

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.s"
	cd /root/simgrid/simgrid/examples/msg/masterslave && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/masterslave/masterslave_cluster.c -o CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.s

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o.requires:
.PHONY : examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o.requires

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o.provides: examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o.requires
	$(MAKE) -f examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/build.make examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o.provides.build
.PHONY : examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o.provides

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o.provides.build: examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o

# Object files for target masterslave_cluster
masterslave_cluster_OBJECTS = \
"CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o"

# External object files for target masterslave_cluster
masterslave_cluster_EXTERNAL_OBJECTS =

examples/msg/masterslave/masterslave_cluster: examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o
examples/msg/masterslave/masterslave_cluster: examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/build.make
examples/msg/masterslave/masterslave_cluster: lib/libsimgrid.so.3.9.90
examples/msg/masterslave/masterslave_cluster: examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable masterslave_cluster"
	cd /root/simgrid/simgrid/examples/msg/masterslave && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/masterslave_cluster.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/build: examples/msg/masterslave/masterslave_cluster
.PHONY : examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/build

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/requires: examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/masterslave_cluster.c.o.requires
.PHONY : examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/requires

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/masterslave && $(CMAKE_COMMAND) -P CMakeFiles/masterslave_cluster.dir/cmake_clean.cmake
.PHONY : examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/clean

examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/masterslave /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/masterslave /root/simgrid/simgrid/examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/masterslave/CMakeFiles/masterslave_cluster.dir/depend
