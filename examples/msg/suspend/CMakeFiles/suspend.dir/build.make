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
include examples/msg/suspend/CMakeFiles/suspend.dir/depend.make

# Include the progress variables for this target.
include examples/msg/suspend/CMakeFiles/suspend.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/suspend/CMakeFiles/suspend.dir/flags.make

examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o: examples/msg/suspend/CMakeFiles/suspend.dir/flags.make
examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o: examples/msg/suspend/suspend.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o"
	cd /root/simgrid/simgrid/examples/msg/suspend && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/suspend.dir/suspend.c.o   -c /root/simgrid/simgrid/examples/msg/suspend/suspend.c

examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/suspend.dir/suspend.c.i"
	cd /root/simgrid/simgrid/examples/msg/suspend && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/suspend/suspend.c > CMakeFiles/suspend.dir/suspend.c.i

examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/suspend.dir/suspend.c.s"
	cd /root/simgrid/simgrid/examples/msg/suspend && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/suspend/suspend.c -o CMakeFiles/suspend.dir/suspend.c.s

examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o.requires:
.PHONY : examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o.requires

examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o.provides: examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o.requires
	$(MAKE) -f examples/msg/suspend/CMakeFiles/suspend.dir/build.make examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o.provides.build
.PHONY : examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o.provides

examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o.provides.build: examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o

# Object files for target suspend
suspend_OBJECTS = \
"CMakeFiles/suspend.dir/suspend.c.o"

# External object files for target suspend
suspend_EXTERNAL_OBJECTS =

examples/msg/suspend/suspend: examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o
examples/msg/suspend/suspend: examples/msg/suspend/CMakeFiles/suspend.dir/build.make
examples/msg/suspend/suspend: lib/libsimgrid.so.3.9.90
examples/msg/suspend/suspend: examples/msg/suspend/CMakeFiles/suspend.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable suspend"
	cd /root/simgrid/simgrid/examples/msg/suspend && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/suspend.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/suspend/CMakeFiles/suspend.dir/build: examples/msg/suspend/suspend
.PHONY : examples/msg/suspend/CMakeFiles/suspend.dir/build

examples/msg/suspend/CMakeFiles/suspend.dir/requires: examples/msg/suspend/CMakeFiles/suspend.dir/suspend.c.o.requires
.PHONY : examples/msg/suspend/CMakeFiles/suspend.dir/requires

examples/msg/suspend/CMakeFiles/suspend.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/suspend && $(CMAKE_COMMAND) -P CMakeFiles/suspend.dir/cmake_clean.cmake
.PHONY : examples/msg/suspend/CMakeFiles/suspend.dir/clean

examples/msg/suspend/CMakeFiles/suspend.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/suspend /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/suspend /root/simgrid/simgrid/examples/msg/suspend/CMakeFiles/suspend.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/suspend/CMakeFiles/suspend.dir/depend

