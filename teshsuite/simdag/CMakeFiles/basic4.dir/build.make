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
include teshsuite/simdag/CMakeFiles/basic4.dir/depend.make

# Include the progress variables for this target.
include teshsuite/simdag/CMakeFiles/basic4.dir/progress.make

# Include the compile flags for this target's objects.
include teshsuite/simdag/CMakeFiles/basic4.dir/flags.make

teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o: teshsuite/simdag/CMakeFiles/basic4.dir/flags.make
teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o: teshsuite/simdag/basic4.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o"
	cd /root/simgrid/simgrid/teshsuite/simdag && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/basic4.dir/basic4.c.o   -c /root/simgrid/simgrid/teshsuite/simdag/basic4.c

teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/basic4.dir/basic4.c.i"
	cd /root/simgrid/simgrid/teshsuite/simdag && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/teshsuite/simdag/basic4.c > CMakeFiles/basic4.dir/basic4.c.i

teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/basic4.dir/basic4.c.s"
	cd /root/simgrid/simgrid/teshsuite/simdag && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/teshsuite/simdag/basic4.c -o CMakeFiles/basic4.dir/basic4.c.s

teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o.requires:
.PHONY : teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o.requires

teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o.provides: teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o.requires
	$(MAKE) -f teshsuite/simdag/CMakeFiles/basic4.dir/build.make teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o.provides.build
.PHONY : teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o.provides

teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o.provides.build: teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o

# Object files for target basic4
basic4_OBJECTS = \
"CMakeFiles/basic4.dir/basic4.c.o"

# External object files for target basic4
basic4_EXTERNAL_OBJECTS =

teshsuite/simdag/basic4: teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o
teshsuite/simdag/basic4: teshsuite/simdag/CMakeFiles/basic4.dir/build.make
teshsuite/simdag/basic4: lib/libsimgrid.so.3.9.90
teshsuite/simdag/basic4: teshsuite/simdag/CMakeFiles/basic4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable basic4"
	cd /root/simgrid/simgrid/teshsuite/simdag && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/basic4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
teshsuite/simdag/CMakeFiles/basic4.dir/build: teshsuite/simdag/basic4
.PHONY : teshsuite/simdag/CMakeFiles/basic4.dir/build

teshsuite/simdag/CMakeFiles/basic4.dir/requires: teshsuite/simdag/CMakeFiles/basic4.dir/basic4.c.o.requires
.PHONY : teshsuite/simdag/CMakeFiles/basic4.dir/requires

teshsuite/simdag/CMakeFiles/basic4.dir/clean:
	cd /root/simgrid/simgrid/teshsuite/simdag && $(CMAKE_COMMAND) -P CMakeFiles/basic4.dir/cmake_clean.cmake
.PHONY : teshsuite/simdag/CMakeFiles/basic4.dir/clean

teshsuite/simdag/CMakeFiles/basic4.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/simdag /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/simdag /root/simgrid/simgrid/teshsuite/simdag/CMakeFiles/basic4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : teshsuite/simdag/CMakeFiles/basic4.dir/depend

