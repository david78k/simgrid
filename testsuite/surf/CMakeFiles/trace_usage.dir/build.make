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
include testsuite/surf/CMakeFiles/trace_usage.dir/depend.make

# Include the progress variables for this target.
include testsuite/surf/CMakeFiles/trace_usage.dir/progress.make

# Include the compile flags for this target's objects.
include testsuite/surf/CMakeFiles/trace_usage.dir/flags.make

testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o: testsuite/surf/CMakeFiles/trace_usage.dir/flags.make
testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o: testsuite/surf/trace_usage.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o"
	cd /root/simgrid/simgrid/testsuite/surf && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/trace_usage.dir/trace_usage.c.o   -c /root/simgrid/simgrid/testsuite/surf/trace_usage.c

testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/trace_usage.dir/trace_usage.c.i"
	cd /root/simgrid/simgrid/testsuite/surf && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/testsuite/surf/trace_usage.c > CMakeFiles/trace_usage.dir/trace_usage.c.i

testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/trace_usage.dir/trace_usage.c.s"
	cd /root/simgrid/simgrid/testsuite/surf && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/testsuite/surf/trace_usage.c -o CMakeFiles/trace_usage.dir/trace_usage.c.s

testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o.requires:
.PHONY : testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o.requires

testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o.provides: testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o.requires
	$(MAKE) -f testsuite/surf/CMakeFiles/trace_usage.dir/build.make testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o.provides.build
.PHONY : testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o.provides

testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o.provides.build: testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o

# Object files for target trace_usage
trace_usage_OBJECTS = \
"CMakeFiles/trace_usage.dir/trace_usage.c.o"

# External object files for target trace_usage
trace_usage_EXTERNAL_OBJECTS =

testsuite/surf/trace_usage: testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o
testsuite/surf/trace_usage: testsuite/surf/CMakeFiles/trace_usage.dir/build.make
testsuite/surf/trace_usage: lib/libsimgrid.so.3.9.90
testsuite/surf/trace_usage: testsuite/surf/CMakeFiles/trace_usage.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable trace_usage"
	cd /root/simgrid/simgrid/testsuite/surf && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/trace_usage.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
testsuite/surf/CMakeFiles/trace_usage.dir/build: testsuite/surf/trace_usage
.PHONY : testsuite/surf/CMakeFiles/trace_usage.dir/build

testsuite/surf/CMakeFiles/trace_usage.dir/requires: testsuite/surf/CMakeFiles/trace_usage.dir/trace_usage.c.o.requires
.PHONY : testsuite/surf/CMakeFiles/trace_usage.dir/requires

testsuite/surf/CMakeFiles/trace_usage.dir/clean:
	cd /root/simgrid/simgrid/testsuite/surf && $(CMAKE_COMMAND) -P CMakeFiles/trace_usage.dir/cmake_clean.cmake
.PHONY : testsuite/surf/CMakeFiles/trace_usage.dir/clean

testsuite/surf/CMakeFiles/trace_usage.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/testsuite/surf /root/simgrid/simgrid /root/simgrid/simgrid/testsuite/surf /root/simgrid/simgrid/testsuite/surf/CMakeFiles/trace_usage.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : testsuite/surf/CMakeFiles/trace_usage.dir/depend

