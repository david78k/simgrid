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
include teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/depend.make

# Include the progress variables for this target.
include teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/progress.make

# Include the compile flags for this target's objects.
include teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/flags.make

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o: teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/flags.make
teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o: teshsuite/simdag/network/mxn/test_intra_all2all.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o"
	cd /root/simgrid/simgrid/teshsuite/simdag/network/mxn && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o   -c /root/simgrid/simgrid/teshsuite/simdag/network/mxn/test_intra_all2all.c

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.i"
	cd /root/simgrid/simgrid/teshsuite/simdag/network/mxn && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/teshsuite/simdag/network/mxn/test_intra_all2all.c > CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.i

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.s"
	cd /root/simgrid/simgrid/teshsuite/simdag/network/mxn && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/teshsuite/simdag/network/mxn/test_intra_all2all.c -o CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.s

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o.requires:
.PHONY : teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o.requires

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o.provides: teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o.requires
	$(MAKE) -f teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/build.make teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o.provides.build
.PHONY : teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o.provides

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o.provides.build: teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o

# Object files for target test_intra_all2all
test_intra_all2all_OBJECTS = \
"CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o"

# External object files for target test_intra_all2all
test_intra_all2all_EXTERNAL_OBJECTS =

teshsuite/simdag/network/mxn/test_intra_all2all: teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o
teshsuite/simdag/network/mxn/test_intra_all2all: teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/build.make
teshsuite/simdag/network/mxn/test_intra_all2all: lib/libsimgrid.so.3.9.90
teshsuite/simdag/network/mxn/test_intra_all2all: teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable test_intra_all2all"
	cd /root/simgrid/simgrid/teshsuite/simdag/network/mxn && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_intra_all2all.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/build: teshsuite/simdag/network/mxn/test_intra_all2all
.PHONY : teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/build

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/requires: teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/test_intra_all2all.c.o.requires
.PHONY : teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/requires

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/clean:
	cd /root/simgrid/simgrid/teshsuite/simdag/network/mxn && $(CMAKE_COMMAND) -P CMakeFiles/test_intra_all2all.dir/cmake_clean.cmake
.PHONY : teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/clean

teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/simdag/network/mxn /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/simdag/network/mxn /root/simgrid/simgrid/teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : teshsuite/simdag/network/mxn/CMakeFiles/test_intra_all2all.dir/depend

