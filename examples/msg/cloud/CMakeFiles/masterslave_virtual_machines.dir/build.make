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
include examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/depend.make

# Include the progress variables for this target.
include examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/flags.make

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o: examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/flags.make
examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o: examples/msg/cloud/masterslave_virtual_machines.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o"
	cd /root/simgrid/simgrid/examples/msg/cloud && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o   -c /root/simgrid/simgrid/examples/msg/cloud/masterslave_virtual_machines.c

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.i"
	cd /root/simgrid/simgrid/examples/msg/cloud && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/cloud/masterslave_virtual_machines.c > CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.i

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.s"
	cd /root/simgrid/simgrid/examples/msg/cloud && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/cloud/masterslave_virtual_machines.c -o CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.s

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o.requires:
.PHONY : examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o.requires

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o.provides: examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o.requires
	$(MAKE) -f examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/build.make examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o.provides.build
.PHONY : examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o.provides

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o.provides.build: examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o

# Object files for target masterslave_virtual_machines
masterslave_virtual_machines_OBJECTS = \
"CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o"

# External object files for target masterslave_virtual_machines
masterslave_virtual_machines_EXTERNAL_OBJECTS =

examples/msg/cloud/masterslave_virtual_machines: examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o
examples/msg/cloud/masterslave_virtual_machines: examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/build.make
examples/msg/cloud/masterslave_virtual_machines: lib/libsimgrid.so.3.9.90
examples/msg/cloud/masterslave_virtual_machines: examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable masterslave_virtual_machines"
	cd /root/simgrid/simgrid/examples/msg/cloud && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/masterslave_virtual_machines.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/build: examples/msg/cloud/masterslave_virtual_machines
.PHONY : examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/build

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/requires: examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/masterslave_virtual_machines.c.o.requires
.PHONY : examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/requires

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/cloud && $(CMAKE_COMMAND) -P CMakeFiles/masterslave_virtual_machines.dir/cmake_clean.cmake
.PHONY : examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/clean

examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/cloud /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/cloud /root/simgrid/simgrid/examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/cloud/CMakeFiles/masterslave_virtual_machines.dir/depend

