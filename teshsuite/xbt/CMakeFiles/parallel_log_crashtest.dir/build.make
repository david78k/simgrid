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
include teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/depend.make

# Include the progress variables for this target.
include teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/progress.make

# Include the compile flags for this target's objects.
include teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/flags.make

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o: teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/flags.make
teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o: teshsuite/xbt/parallel_log_crashtest.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o"
	cd /root/simgrid/simgrid/teshsuite/xbt && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o   -c /root/simgrid/simgrid/teshsuite/xbt/parallel_log_crashtest.c

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.i"
	cd /root/simgrid/simgrid/teshsuite/xbt && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/teshsuite/xbt/parallel_log_crashtest.c > CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.i

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.s"
	cd /root/simgrid/simgrid/teshsuite/xbt && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/teshsuite/xbt/parallel_log_crashtest.c -o CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.s

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o.requires:
.PHONY : teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o.requires

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o.provides: teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o.requires
	$(MAKE) -f teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/build.make teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o.provides.build
.PHONY : teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o.provides

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o.provides.build: teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o

# Object files for target parallel_log_crashtest
parallel_log_crashtest_OBJECTS = \
"CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o"

# External object files for target parallel_log_crashtest
parallel_log_crashtest_EXTERNAL_OBJECTS =

teshsuite/xbt/parallel_log_crashtest: teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o
teshsuite/xbt/parallel_log_crashtest: teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/build.make
teshsuite/xbt/parallel_log_crashtest: lib/libsimgrid.so.3.9.90
teshsuite/xbt/parallel_log_crashtest: teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable parallel_log_crashtest"
	cd /root/simgrid/simgrid/teshsuite/xbt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parallel_log_crashtest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/build: teshsuite/xbt/parallel_log_crashtest
.PHONY : teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/build

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/requires: teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/parallel_log_crashtest.c.o.requires
.PHONY : teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/requires

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/clean:
	cd /root/simgrid/simgrid/teshsuite/xbt && $(CMAKE_COMMAND) -P CMakeFiles/parallel_log_crashtest.dir/cmake_clean.cmake
.PHONY : teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/clean

teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/xbt /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/xbt /root/simgrid/simgrid/teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : teshsuite/xbt/CMakeFiles/parallel_log_crashtest.dir/depend

