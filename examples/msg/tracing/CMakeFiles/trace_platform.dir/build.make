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
include examples/msg/tracing/CMakeFiles/trace_platform.dir/depend.make

# Include the progress variables for this target.
include examples/msg/tracing/CMakeFiles/trace_platform.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/tracing/CMakeFiles/trace_platform.dir/flags.make

examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o: examples/msg/tracing/CMakeFiles/trace_platform.dir/flags.make
examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o: examples/msg/tracing/trace_platform.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o"
	cd /root/simgrid/simgrid/examples/msg/tracing && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/trace_platform.dir/trace_platform.c.o   -c /root/simgrid/simgrid/examples/msg/tracing/trace_platform.c

examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/trace_platform.dir/trace_platform.c.i"
	cd /root/simgrid/simgrid/examples/msg/tracing && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/tracing/trace_platform.c > CMakeFiles/trace_platform.dir/trace_platform.c.i

examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/trace_platform.dir/trace_platform.c.s"
	cd /root/simgrid/simgrid/examples/msg/tracing && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/tracing/trace_platform.c -o CMakeFiles/trace_platform.dir/trace_platform.c.s

examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o.requires:
.PHONY : examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o.requires

examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o.provides: examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o.requires
	$(MAKE) -f examples/msg/tracing/CMakeFiles/trace_platform.dir/build.make examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o.provides.build
.PHONY : examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o.provides

examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o.provides.build: examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o

# Object files for target trace_platform
trace_platform_OBJECTS = \
"CMakeFiles/trace_platform.dir/trace_platform.c.o"

# External object files for target trace_platform
trace_platform_EXTERNAL_OBJECTS =

examples/msg/tracing/trace_platform: examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o
examples/msg/tracing/trace_platform: examples/msg/tracing/CMakeFiles/trace_platform.dir/build.make
examples/msg/tracing/trace_platform: lib/libsimgrid.so.3.9.90
examples/msg/tracing/trace_platform: examples/msg/tracing/CMakeFiles/trace_platform.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable trace_platform"
	cd /root/simgrid/simgrid/examples/msg/tracing && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/trace_platform.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/tracing/CMakeFiles/trace_platform.dir/build: examples/msg/tracing/trace_platform
.PHONY : examples/msg/tracing/CMakeFiles/trace_platform.dir/build

examples/msg/tracing/CMakeFiles/trace_platform.dir/requires: examples/msg/tracing/CMakeFiles/trace_platform.dir/trace_platform.c.o.requires
.PHONY : examples/msg/tracing/CMakeFiles/trace_platform.dir/requires

examples/msg/tracing/CMakeFiles/trace_platform.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/tracing && $(CMAKE_COMMAND) -P CMakeFiles/trace_platform.dir/cmake_clean.cmake
.PHONY : examples/msg/tracing/CMakeFiles/trace_platform.dir/clean

examples/msg/tracing/CMakeFiles/trace_platform.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/tracing /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/tracing /root/simgrid/simgrid/examples/msg/tracing/CMakeFiles/trace_platform.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/tracing/CMakeFiles/trace_platform.dir/depend

