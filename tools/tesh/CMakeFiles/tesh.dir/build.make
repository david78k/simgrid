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
include tools/tesh/CMakeFiles/tesh.dir/depend.make

# Include the progress variables for this target.
include tools/tesh/CMakeFiles/tesh.dir/progress.make

# Include the compile flags for this target's objects.
include tools/tesh/CMakeFiles/tesh.dir/flags.make

tools/tesh/CMakeFiles/tesh.dir/tesh.c.o: tools/tesh/CMakeFiles/tesh.dir/flags.make
tools/tesh/CMakeFiles/tesh.dir/tesh.c.o: tools/tesh/tesh.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tools/tesh/CMakeFiles/tesh.dir/tesh.c.o"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/tesh.dir/tesh.c.o   -c /root/simgrid/simgrid/tools/tesh/tesh.c

tools/tesh/CMakeFiles/tesh.dir/tesh.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tesh.dir/tesh.c.i"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/tools/tesh/tesh.c > CMakeFiles/tesh.dir/tesh.c.i

tools/tesh/CMakeFiles/tesh.dir/tesh.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tesh.dir/tesh.c.s"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/tools/tesh/tesh.c -o CMakeFiles/tesh.dir/tesh.c.s

tools/tesh/CMakeFiles/tesh.dir/tesh.c.o.requires:
.PHONY : tools/tesh/CMakeFiles/tesh.dir/tesh.c.o.requires

tools/tesh/CMakeFiles/tesh.dir/tesh.c.o.provides: tools/tesh/CMakeFiles/tesh.dir/tesh.c.o.requires
	$(MAKE) -f tools/tesh/CMakeFiles/tesh.dir/build.make tools/tesh/CMakeFiles/tesh.dir/tesh.c.o.provides.build
.PHONY : tools/tesh/CMakeFiles/tesh.dir/tesh.c.o.provides

tools/tesh/CMakeFiles/tesh.dir/tesh.c.o.provides.build: tools/tesh/CMakeFiles/tesh.dir/tesh.c.o

tools/tesh/CMakeFiles/tesh.dir/run_context.c.o: tools/tesh/CMakeFiles/tesh.dir/flags.make
tools/tesh/CMakeFiles/tesh.dir/run_context.c.o: tools/tesh/run_context.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tools/tesh/CMakeFiles/tesh.dir/run_context.c.o"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/tesh.dir/run_context.c.o   -c /root/simgrid/simgrid/tools/tesh/run_context.c

tools/tesh/CMakeFiles/tesh.dir/run_context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tesh.dir/run_context.c.i"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/tools/tesh/run_context.c > CMakeFiles/tesh.dir/run_context.c.i

tools/tesh/CMakeFiles/tesh.dir/run_context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tesh.dir/run_context.c.s"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/tools/tesh/run_context.c -o CMakeFiles/tesh.dir/run_context.c.s

tools/tesh/CMakeFiles/tesh.dir/run_context.c.o.requires:
.PHONY : tools/tesh/CMakeFiles/tesh.dir/run_context.c.o.requires

tools/tesh/CMakeFiles/tesh.dir/run_context.c.o.provides: tools/tesh/CMakeFiles/tesh.dir/run_context.c.o.requires
	$(MAKE) -f tools/tesh/CMakeFiles/tesh.dir/build.make tools/tesh/CMakeFiles/tesh.dir/run_context.c.o.provides.build
.PHONY : tools/tesh/CMakeFiles/tesh.dir/run_context.c.o.provides

tools/tesh/CMakeFiles/tesh.dir/run_context.c.o.provides.build: tools/tesh/CMakeFiles/tesh.dir/run_context.c.o

tools/tesh/CMakeFiles/tesh.dir/signal.c.o: tools/tesh/CMakeFiles/tesh.dir/flags.make
tools/tesh/CMakeFiles/tesh.dir/signal.c.o: tools/tesh/signal.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tools/tesh/CMakeFiles/tesh.dir/signal.c.o"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/tesh.dir/signal.c.o   -c /root/simgrid/simgrid/tools/tesh/signal.c

tools/tesh/CMakeFiles/tesh.dir/signal.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tesh.dir/signal.c.i"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/tools/tesh/signal.c > CMakeFiles/tesh.dir/signal.c.i

tools/tesh/CMakeFiles/tesh.dir/signal.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tesh.dir/signal.c.s"
	cd /root/simgrid/simgrid/tools/tesh && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/tools/tesh/signal.c -o CMakeFiles/tesh.dir/signal.c.s

tools/tesh/CMakeFiles/tesh.dir/signal.c.o.requires:
.PHONY : tools/tesh/CMakeFiles/tesh.dir/signal.c.o.requires

tools/tesh/CMakeFiles/tesh.dir/signal.c.o.provides: tools/tesh/CMakeFiles/tesh.dir/signal.c.o.requires
	$(MAKE) -f tools/tesh/CMakeFiles/tesh.dir/build.make tools/tesh/CMakeFiles/tesh.dir/signal.c.o.provides.build
.PHONY : tools/tesh/CMakeFiles/tesh.dir/signal.c.o.provides

tools/tesh/CMakeFiles/tesh.dir/signal.c.o.provides.build: tools/tesh/CMakeFiles/tesh.dir/signal.c.o

# Object files for target tesh
tesh_OBJECTS = \
"CMakeFiles/tesh.dir/tesh.c.o" \
"CMakeFiles/tesh.dir/run_context.c.o" \
"CMakeFiles/tesh.dir/signal.c.o"

# External object files for target tesh
tesh_EXTERNAL_OBJECTS =

bin/tesh: tools/tesh/CMakeFiles/tesh.dir/tesh.c.o
bin/tesh: tools/tesh/CMakeFiles/tesh.dir/run_context.c.o
bin/tesh: tools/tesh/CMakeFiles/tesh.dir/signal.c.o
bin/tesh: tools/tesh/CMakeFiles/tesh.dir/build.make
bin/tesh: lib/libsimgrid.so.3.9.90
bin/tesh: tools/tesh/CMakeFiles/tesh.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable ../../bin/tesh"
	cd /root/simgrid/simgrid/tools/tesh && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tesh.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/tesh/CMakeFiles/tesh.dir/build: bin/tesh
.PHONY : tools/tesh/CMakeFiles/tesh.dir/build

tools/tesh/CMakeFiles/tesh.dir/requires: tools/tesh/CMakeFiles/tesh.dir/tesh.c.o.requires
tools/tesh/CMakeFiles/tesh.dir/requires: tools/tesh/CMakeFiles/tesh.dir/run_context.c.o.requires
tools/tesh/CMakeFiles/tesh.dir/requires: tools/tesh/CMakeFiles/tesh.dir/signal.c.o.requires
.PHONY : tools/tesh/CMakeFiles/tesh.dir/requires

tools/tesh/CMakeFiles/tesh.dir/clean:
	cd /root/simgrid/simgrid/tools/tesh && $(CMAKE_COMMAND) -P CMakeFiles/tesh.dir/cmake_clean.cmake
.PHONY : tools/tesh/CMakeFiles/tesh.dir/clean

tools/tesh/CMakeFiles/tesh.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/tools/tesh /root/simgrid/simgrid /root/simgrid/simgrid/tools/tesh /root/simgrid/simgrid/tools/tesh/CMakeFiles/tesh.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/tesh/CMakeFiles/tesh.dir/depend

