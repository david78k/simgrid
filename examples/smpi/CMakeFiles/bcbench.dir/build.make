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
include examples/smpi/CMakeFiles/bcbench.dir/depend.make

# Include the progress variables for this target.
include examples/smpi/CMakeFiles/bcbench.dir/progress.make

# Include the compile flags for this target's objects.
include examples/smpi/CMakeFiles/bcbench.dir/flags.make

examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o: examples/smpi/CMakeFiles/bcbench.dir/flags.make
examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o: examples/smpi/bcbench.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o"
	cd /root/simgrid/simgrid/examples/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/bcbench.dir/bcbench.c.o   -c /root/simgrid/simgrid/examples/smpi/bcbench.c

examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bcbench.dir/bcbench.c.i"
	cd /root/simgrid/simgrid/examples/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/smpi/bcbench.c > CMakeFiles/bcbench.dir/bcbench.c.i

examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bcbench.dir/bcbench.c.s"
	cd /root/simgrid/simgrid/examples/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/smpi/bcbench.c -o CMakeFiles/bcbench.dir/bcbench.c.s

examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o.requires:
.PHONY : examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o.requires

examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o.provides: examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o.requires
	$(MAKE) -f examples/smpi/CMakeFiles/bcbench.dir/build.make examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o.provides.build
.PHONY : examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o.provides

examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o.provides.build: examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o

# Object files for target bcbench
bcbench_OBJECTS = \
"CMakeFiles/bcbench.dir/bcbench.c.o"

# External object files for target bcbench
bcbench_EXTERNAL_OBJECTS =

examples/smpi/bcbench: examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o
examples/smpi/bcbench: examples/smpi/CMakeFiles/bcbench.dir/build.make
examples/smpi/bcbench: lib/libsimgrid.so.3.9.90
examples/smpi/bcbench: examples/smpi/CMakeFiles/bcbench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable bcbench"
	cd /root/simgrid/simgrid/examples/smpi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bcbench.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/smpi/CMakeFiles/bcbench.dir/build: examples/smpi/bcbench
.PHONY : examples/smpi/CMakeFiles/bcbench.dir/build

examples/smpi/CMakeFiles/bcbench.dir/requires: examples/smpi/CMakeFiles/bcbench.dir/bcbench.c.o.requires
.PHONY : examples/smpi/CMakeFiles/bcbench.dir/requires

examples/smpi/CMakeFiles/bcbench.dir/clean:
	cd /root/simgrid/simgrid/examples/smpi && $(CMAKE_COMMAND) -P CMakeFiles/bcbench.dir/cmake_clean.cmake
.PHONY : examples/smpi/CMakeFiles/bcbench.dir/clean

examples/smpi/CMakeFiles/bcbench.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/smpi /root/simgrid/simgrid /root/simgrid/simgrid/examples/smpi /root/simgrid/simgrid/examples/smpi/CMakeFiles/bcbench.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/smpi/CMakeFiles/bcbench.dir/depend

