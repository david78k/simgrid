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
include teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/depend.make

# Include the progress variables for this target.
include teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/progress.make

# Include the compile flags for this target's objects.
include teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/flags.make

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o: teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/flags.make
teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o: teshsuite/simdag/platforms/is_router_test.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o"
	cd /root/simgrid/simgrid/teshsuite/simdag/platforms && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/is_router_test.dir/is_router_test.c.o   -c /root/simgrid/simgrid/teshsuite/simdag/platforms/is_router_test.c

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/is_router_test.dir/is_router_test.c.i"
	cd /root/simgrid/simgrid/teshsuite/simdag/platforms && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/teshsuite/simdag/platforms/is_router_test.c > CMakeFiles/is_router_test.dir/is_router_test.c.i

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/is_router_test.dir/is_router_test.c.s"
	cd /root/simgrid/simgrid/teshsuite/simdag/platforms && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/teshsuite/simdag/platforms/is_router_test.c -o CMakeFiles/is_router_test.dir/is_router_test.c.s

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o.requires:
.PHONY : teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o.requires

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o.provides: teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o.requires
	$(MAKE) -f teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/build.make teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o.provides.build
.PHONY : teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o.provides

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o.provides.build: teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o

# Object files for target is_router_test
is_router_test_OBJECTS = \
"CMakeFiles/is_router_test.dir/is_router_test.c.o"

# External object files for target is_router_test
is_router_test_EXTERNAL_OBJECTS =

teshsuite/simdag/platforms/is_router_test: teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o
teshsuite/simdag/platforms/is_router_test: teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/build.make
teshsuite/simdag/platforms/is_router_test: lib/libsimgrid.so.3.9.90
teshsuite/simdag/platforms/is_router_test: teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable is_router_test"
	cd /root/simgrid/simgrid/teshsuite/simdag/platforms && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/is_router_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/build: teshsuite/simdag/platforms/is_router_test
.PHONY : teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/build

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/requires: teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/is_router_test.c.o.requires
.PHONY : teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/requires

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/clean:
	cd /root/simgrid/simgrid/teshsuite/simdag/platforms && $(CMAKE_COMMAND) -P CMakeFiles/is_router_test.dir/cmake_clean.cmake
.PHONY : teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/clean

teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/simdag/platforms /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/simdag/platforms /root/simgrid/simgrid/teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : teshsuite/simdag/platforms/CMakeFiles/is_router_test.dir/depend

