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
include teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/depend.make

# Include the progress variables for this target.
include teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/progress.make

# Include the compile flags for this target's objects.
include teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/flags.make

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o: teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/flags.make
teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o: teshsuite/simdag/partask/test_comp_only_seq.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o"
	cd /root/simgrid/simgrid/teshsuite/simdag/partask && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o   -c /root/simgrid/simgrid/teshsuite/simdag/partask/test_comp_only_seq.c

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.i"
	cd /root/simgrid/simgrid/teshsuite/simdag/partask && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/teshsuite/simdag/partask/test_comp_only_seq.c > CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.i

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.s"
	cd /root/simgrid/simgrid/teshsuite/simdag/partask && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/teshsuite/simdag/partask/test_comp_only_seq.c -o CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.s

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o.requires:
.PHONY : teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o.requires

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o.provides: teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o.requires
	$(MAKE) -f teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/build.make teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o.provides.build
.PHONY : teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o.provides

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o.provides.build: teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o

# Object files for target test_comp_only_seq
test_comp_only_seq_OBJECTS = \
"CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o"

# External object files for target test_comp_only_seq
test_comp_only_seq_EXTERNAL_OBJECTS =

teshsuite/simdag/partask/test_comp_only_seq: teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o
teshsuite/simdag/partask/test_comp_only_seq: teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/build.make
teshsuite/simdag/partask/test_comp_only_seq: lib/libsimgrid.so.3.9.90
teshsuite/simdag/partask/test_comp_only_seq: teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable test_comp_only_seq"
	cd /root/simgrid/simgrid/teshsuite/simdag/partask && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_comp_only_seq.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/build: teshsuite/simdag/partask/test_comp_only_seq
.PHONY : teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/build

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/requires: teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/test_comp_only_seq.c.o.requires
.PHONY : teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/requires

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/clean:
	cd /root/simgrid/simgrid/teshsuite/simdag/partask && $(CMAKE_COMMAND) -P CMakeFiles/test_comp_only_seq.dir/cmake_clean.cmake
.PHONY : teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/clean

teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/simdag/partask /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/simdag/partask /root/simgrid/simgrid/teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : teshsuite/simdag/partask/CMakeFiles/test_comp_only_seq.dir/depend
