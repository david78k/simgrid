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
include examples/msg/cloud/CMakeFiles/migrate_vm.dir/depend.make

# Include the progress variables for this target.
include examples/msg/cloud/CMakeFiles/migrate_vm.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/cloud/CMakeFiles/migrate_vm.dir/flags.make

examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o: examples/msg/cloud/CMakeFiles/migrate_vm.dir/flags.make
examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o: examples/msg/cloud/migrate_vm.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o"
	cd /root/simgrid/simgrid/examples/msg/cloud && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/migrate_vm.dir/migrate_vm.c.o   -c /root/simgrid/simgrid/examples/msg/cloud/migrate_vm.c

examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/migrate_vm.dir/migrate_vm.c.i"
	cd /root/simgrid/simgrid/examples/msg/cloud && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/cloud/migrate_vm.c > CMakeFiles/migrate_vm.dir/migrate_vm.c.i

examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/migrate_vm.dir/migrate_vm.c.s"
	cd /root/simgrid/simgrid/examples/msg/cloud && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/cloud/migrate_vm.c -o CMakeFiles/migrate_vm.dir/migrate_vm.c.s

examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o.requires:
.PHONY : examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o.requires

examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o.provides: examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o.requires
	$(MAKE) -f examples/msg/cloud/CMakeFiles/migrate_vm.dir/build.make examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o.provides.build
.PHONY : examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o.provides

examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o.provides.build: examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o

# Object files for target migrate_vm
migrate_vm_OBJECTS = \
"CMakeFiles/migrate_vm.dir/migrate_vm.c.o"

# External object files for target migrate_vm
migrate_vm_EXTERNAL_OBJECTS =

examples/msg/cloud/migrate_vm: examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o
examples/msg/cloud/migrate_vm: examples/msg/cloud/CMakeFiles/migrate_vm.dir/build.make
examples/msg/cloud/migrate_vm: lib/libsimgrid.so.3.9.90
examples/msg/cloud/migrate_vm: examples/msg/cloud/CMakeFiles/migrate_vm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable migrate_vm"
	cd /root/simgrid/simgrid/examples/msg/cloud && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/migrate_vm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/cloud/CMakeFiles/migrate_vm.dir/build: examples/msg/cloud/migrate_vm
.PHONY : examples/msg/cloud/CMakeFiles/migrate_vm.dir/build

examples/msg/cloud/CMakeFiles/migrate_vm.dir/requires: examples/msg/cloud/CMakeFiles/migrate_vm.dir/migrate_vm.c.o.requires
.PHONY : examples/msg/cloud/CMakeFiles/migrate_vm.dir/requires

examples/msg/cloud/CMakeFiles/migrate_vm.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/cloud && $(CMAKE_COMMAND) -P CMakeFiles/migrate_vm.dir/cmake_clean.cmake
.PHONY : examples/msg/cloud/CMakeFiles/migrate_vm.dir/clean

examples/msg/cloud/CMakeFiles/migrate_vm.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/cloud /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/cloud /root/simgrid/simgrid/examples/msg/cloud/CMakeFiles/migrate_vm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/cloud/CMakeFiles/migrate_vm.dir/depend

