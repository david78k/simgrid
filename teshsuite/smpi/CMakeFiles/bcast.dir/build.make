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
include teshsuite/smpi/CMakeFiles/bcast.dir/depend.make

# Include the progress variables for this target.
include teshsuite/smpi/CMakeFiles/bcast.dir/progress.make

# Include the compile flags for this target's objects.
include teshsuite/smpi/CMakeFiles/bcast.dir/flags.make

teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o: teshsuite/smpi/CMakeFiles/bcast.dir/flags.make
teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o: teshsuite/smpi/bcast.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o"
	cd /root/simgrid/simgrid/teshsuite/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/bcast.dir/bcast.c.o   -c /root/simgrid/simgrid/teshsuite/smpi/bcast.c

teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bcast.dir/bcast.c.i"
	cd /root/simgrid/simgrid/teshsuite/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/teshsuite/smpi/bcast.c > CMakeFiles/bcast.dir/bcast.c.i

teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bcast.dir/bcast.c.s"
	cd /root/simgrid/simgrid/teshsuite/smpi && /root/simgrid/simgrid/smpi_script/bin/smpicc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/teshsuite/smpi/bcast.c -o CMakeFiles/bcast.dir/bcast.c.s

teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o.requires:
.PHONY : teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o.requires

teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o.provides: teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o.requires
	$(MAKE) -f teshsuite/smpi/CMakeFiles/bcast.dir/build.make teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o.provides.build
.PHONY : teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o.provides

teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o.provides.build: teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o

# Object files for target bcast
bcast_OBJECTS = \
"CMakeFiles/bcast.dir/bcast.c.o"

# External object files for target bcast
bcast_EXTERNAL_OBJECTS =

teshsuite/smpi/bcast: teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o
teshsuite/smpi/bcast: teshsuite/smpi/CMakeFiles/bcast.dir/build.make
teshsuite/smpi/bcast: lib/libsimgrid.so.3.9.90
teshsuite/smpi/bcast: teshsuite/smpi/CMakeFiles/bcast.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable bcast"
	cd /root/simgrid/simgrid/teshsuite/smpi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bcast.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
teshsuite/smpi/CMakeFiles/bcast.dir/build: teshsuite/smpi/bcast
.PHONY : teshsuite/smpi/CMakeFiles/bcast.dir/build

teshsuite/smpi/CMakeFiles/bcast.dir/requires: teshsuite/smpi/CMakeFiles/bcast.dir/bcast.c.o.requires
.PHONY : teshsuite/smpi/CMakeFiles/bcast.dir/requires

teshsuite/smpi/CMakeFiles/bcast.dir/clean:
	cd /root/simgrid/simgrid/teshsuite/smpi && $(CMAKE_COMMAND) -P CMakeFiles/bcast.dir/cmake_clean.cmake
.PHONY : teshsuite/smpi/CMakeFiles/bcast.dir/clean

teshsuite/smpi/CMakeFiles/bcast.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/smpi /root/simgrid/simgrid /root/simgrid/simgrid/teshsuite/smpi /root/simgrid/simgrid/teshsuite/smpi/CMakeFiles/bcast.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : teshsuite/smpi/CMakeFiles/bcast.dir/depend

