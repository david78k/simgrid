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
include examples/msg/start_kill_time/CMakeFiles/sk_time.dir/depend.make

# Include the progress variables for this target.
include examples/msg/start_kill_time/CMakeFiles/sk_time.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/start_kill_time/CMakeFiles/sk_time.dir/flags.make

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o: examples/msg/start_kill_time/CMakeFiles/sk_time.dir/flags.make
examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o: examples/msg/start_kill_time/sk_time.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o"
	cd /root/simgrid/simgrid/examples/msg/start_kill_time && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sk_time.dir/sk_time.c.o   -c /root/simgrid/simgrid/examples/msg/start_kill_time/sk_time.c

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sk_time.dir/sk_time.c.i"
	cd /root/simgrid/simgrid/examples/msg/start_kill_time && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/start_kill_time/sk_time.c > CMakeFiles/sk_time.dir/sk_time.c.i

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sk_time.dir/sk_time.c.s"
	cd /root/simgrid/simgrid/examples/msg/start_kill_time && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/start_kill_time/sk_time.c -o CMakeFiles/sk_time.dir/sk_time.c.s

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o.requires:
.PHONY : examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o.requires

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o.provides: examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o.requires
	$(MAKE) -f examples/msg/start_kill_time/CMakeFiles/sk_time.dir/build.make examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o.provides.build
.PHONY : examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o.provides

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o.provides.build: examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o

# Object files for target sk_time
sk_time_OBJECTS = \
"CMakeFiles/sk_time.dir/sk_time.c.o"

# External object files for target sk_time
sk_time_EXTERNAL_OBJECTS =

examples/msg/start_kill_time/sk_time: examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o
examples/msg/start_kill_time/sk_time: examples/msg/start_kill_time/CMakeFiles/sk_time.dir/build.make
examples/msg/start_kill_time/sk_time: lib/libsimgrid.so.3.9.90
examples/msg/start_kill_time/sk_time: examples/msg/start_kill_time/CMakeFiles/sk_time.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable sk_time"
	cd /root/simgrid/simgrid/examples/msg/start_kill_time && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sk_time.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/start_kill_time/CMakeFiles/sk_time.dir/build: examples/msg/start_kill_time/sk_time
.PHONY : examples/msg/start_kill_time/CMakeFiles/sk_time.dir/build

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/requires: examples/msg/start_kill_time/CMakeFiles/sk_time.dir/sk_time.c.o.requires
.PHONY : examples/msg/start_kill_time/CMakeFiles/sk_time.dir/requires

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/start_kill_time && $(CMAKE_COMMAND) -P CMakeFiles/sk_time.dir/cmake_clean.cmake
.PHONY : examples/msg/start_kill_time/CMakeFiles/sk_time.dir/clean

examples/msg/start_kill_time/CMakeFiles/sk_time.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/start_kill_time /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/start_kill_time /root/simgrid/simgrid/examples/msg/start_kill_time/CMakeFiles/sk_time.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/start_kill_time/CMakeFiles/sk_time.dir/depend
