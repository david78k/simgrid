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
include examples/simdag/metaxml/CMakeFiles/sd_meta.dir/depend.make

# Include the progress variables for this target.
include examples/simdag/metaxml/CMakeFiles/sd_meta.dir/progress.make

# Include the compile flags for this target's objects.
include examples/simdag/metaxml/CMakeFiles/sd_meta.dir/flags.make

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o: examples/simdag/metaxml/CMakeFiles/sd_meta.dir/flags.make
examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o: examples/simdag/metaxml/sd_meta.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o"
	cd /root/simgrid/simgrid/examples/simdag/metaxml && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sd_meta.dir/sd_meta.c.o   -c /root/simgrid/simgrid/examples/simdag/metaxml/sd_meta.c

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sd_meta.dir/sd_meta.c.i"
	cd /root/simgrid/simgrid/examples/simdag/metaxml && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/simdag/metaxml/sd_meta.c > CMakeFiles/sd_meta.dir/sd_meta.c.i

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sd_meta.dir/sd_meta.c.s"
	cd /root/simgrid/simgrid/examples/simdag/metaxml && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/simdag/metaxml/sd_meta.c -o CMakeFiles/sd_meta.dir/sd_meta.c.s

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o.requires:
.PHONY : examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o.requires

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o.provides: examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o.requires
	$(MAKE) -f examples/simdag/metaxml/CMakeFiles/sd_meta.dir/build.make examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o.provides.build
.PHONY : examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o.provides

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o.provides.build: examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o

# Object files for target sd_meta
sd_meta_OBJECTS = \
"CMakeFiles/sd_meta.dir/sd_meta.c.o"

# External object files for target sd_meta
sd_meta_EXTERNAL_OBJECTS =

examples/simdag/metaxml/sd_meta: examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o
examples/simdag/metaxml/sd_meta: examples/simdag/metaxml/CMakeFiles/sd_meta.dir/build.make
examples/simdag/metaxml/sd_meta: lib/libsimgrid.so.3.9.90
examples/simdag/metaxml/sd_meta: examples/simdag/metaxml/CMakeFiles/sd_meta.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable sd_meta"
	cd /root/simgrid/simgrid/examples/simdag/metaxml && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sd_meta.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/simdag/metaxml/CMakeFiles/sd_meta.dir/build: examples/simdag/metaxml/sd_meta
.PHONY : examples/simdag/metaxml/CMakeFiles/sd_meta.dir/build

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/requires: examples/simdag/metaxml/CMakeFiles/sd_meta.dir/sd_meta.c.o.requires
.PHONY : examples/simdag/metaxml/CMakeFiles/sd_meta.dir/requires

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/clean:
	cd /root/simgrid/simgrid/examples/simdag/metaxml && $(CMAKE_COMMAND) -P CMakeFiles/sd_meta.dir/cmake_clean.cmake
.PHONY : examples/simdag/metaxml/CMakeFiles/sd_meta.dir/clean

examples/simdag/metaxml/CMakeFiles/sd_meta.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/simdag/metaxml /root/simgrid/simgrid /root/simgrid/simgrid/examples/simdag/metaxml /root/simgrid/simgrid/examples/simdag/metaxml/CMakeFiles/sd_meta.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/simdag/metaxml/CMakeFiles/sd_meta.dir/depend
