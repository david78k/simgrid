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
include examples/msg/bittorrent/CMakeFiles/bittorrent.dir/depend.make

# Include the progress variables for this target.
include examples/msg/bittorrent/CMakeFiles/bittorrent.dir/progress.make

# Include the compile flags for this target's objects.
include examples/msg/bittorrent/CMakeFiles/bittorrent.dir/flags.make

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/flags.make
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o: examples/msg/bittorrent/bittorrent.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/bittorrent.dir/bittorrent.c.o   -c /root/simgrid/simgrid/examples/msg/bittorrent/bittorrent.c

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bittorrent.dir/bittorrent.c.i"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/bittorrent/bittorrent.c > CMakeFiles/bittorrent.dir/bittorrent.c.i

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bittorrent.dir/bittorrent.c.s"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/bittorrent/bittorrent.c -o CMakeFiles/bittorrent.dir/bittorrent.c.s

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o.requires:
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o.requires

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o.provides: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o.requires
	$(MAKE) -f examples/msg/bittorrent/CMakeFiles/bittorrent.dir/build.make examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o.provides.build
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o.provides

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o.provides.build: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/flags.make
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o: examples/msg/bittorrent/messages.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/bittorrent.dir/messages.c.o   -c /root/simgrid/simgrid/examples/msg/bittorrent/messages.c

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bittorrent.dir/messages.c.i"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/bittorrent/messages.c > CMakeFiles/bittorrent.dir/messages.c.i

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bittorrent.dir/messages.c.s"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/bittorrent/messages.c -o CMakeFiles/bittorrent.dir/messages.c.s

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o.requires:
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o.requires

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o.provides: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o.requires
	$(MAKE) -f examples/msg/bittorrent/CMakeFiles/bittorrent.dir/build.make examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o.provides.build
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o.provides

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o.provides.build: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/flags.make
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o: examples/msg/bittorrent/peer.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/bittorrent.dir/peer.c.o   -c /root/simgrid/simgrid/examples/msg/bittorrent/peer.c

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bittorrent.dir/peer.c.i"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/bittorrent/peer.c > CMakeFiles/bittorrent.dir/peer.c.i

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bittorrent.dir/peer.c.s"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/bittorrent/peer.c -o CMakeFiles/bittorrent.dir/peer.c.s

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o.requires:
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o.requires

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o.provides: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o.requires
	$(MAKE) -f examples/msg/bittorrent/CMakeFiles/bittorrent.dir/build.make examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o.provides.build
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o.provides

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o.provides.build: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/flags.make
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o: examples/msg/bittorrent/tracker.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/bittorrent.dir/tracker.c.o   -c /root/simgrid/simgrid/examples/msg/bittorrent/tracker.c

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bittorrent.dir/tracker.c.i"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/bittorrent/tracker.c > CMakeFiles/bittorrent.dir/tracker.c.i

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bittorrent.dir/tracker.c.s"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/bittorrent/tracker.c -o CMakeFiles/bittorrent.dir/tracker.c.s

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o.requires:
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o.requires

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o.provides: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o.requires
	$(MAKE) -f examples/msg/bittorrent/CMakeFiles/bittorrent.dir/build.make examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o.provides.build
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o.provides

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o.provides.build: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/flags.make
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o: examples/msg/bittorrent/connection.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/bittorrent.dir/connection.c.o   -c /root/simgrid/simgrid/examples/msg/bittorrent/connection.c

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bittorrent.dir/connection.c.i"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/examples/msg/bittorrent/connection.c > CMakeFiles/bittorrent.dir/connection.c.i

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bittorrent.dir/connection.c.s"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/examples/msg/bittorrent/connection.c -o CMakeFiles/bittorrent.dir/connection.c.s

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o.requires:
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o.requires

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o.provides: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o.requires
	$(MAKE) -f examples/msg/bittorrent/CMakeFiles/bittorrent.dir/build.make examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o.provides.build
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o.provides

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o.provides.build: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o

# Object files for target bittorrent
bittorrent_OBJECTS = \
"CMakeFiles/bittorrent.dir/bittorrent.c.o" \
"CMakeFiles/bittorrent.dir/messages.c.o" \
"CMakeFiles/bittorrent.dir/peer.c.o" \
"CMakeFiles/bittorrent.dir/tracker.c.o" \
"CMakeFiles/bittorrent.dir/connection.c.o"

# External object files for target bittorrent
bittorrent_EXTERNAL_OBJECTS =

examples/msg/bittorrent/bittorrent: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o
examples/msg/bittorrent/bittorrent: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o
examples/msg/bittorrent/bittorrent: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o
examples/msg/bittorrent/bittorrent: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o
examples/msg/bittorrent/bittorrent: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o
examples/msg/bittorrent/bittorrent: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/build.make
examples/msg/bittorrent/bittorrent: lib/libsimgrid.so.3.9.90
examples/msg/bittorrent/bittorrent: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable bittorrent"
	cd /root/simgrid/simgrid/examples/msg/bittorrent && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bittorrent.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/build: examples/msg/bittorrent/bittorrent
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/build

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/requires: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/bittorrent.c.o.requires
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/requires: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/messages.c.o.requires
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/requires: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/peer.c.o.requires
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/requires: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/tracker.c.o.requires
examples/msg/bittorrent/CMakeFiles/bittorrent.dir/requires: examples/msg/bittorrent/CMakeFiles/bittorrent.dir/connection.c.o.requires
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/requires

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/clean:
	cd /root/simgrid/simgrid/examples/msg/bittorrent && $(CMAKE_COMMAND) -P CMakeFiles/bittorrent.dir/cmake_clean.cmake
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/clean

examples/msg/bittorrent/CMakeFiles/bittorrent.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/bittorrent /root/simgrid/simgrid /root/simgrid/simgrid/examples/msg/bittorrent /root/simgrid/simgrid/examples/msg/bittorrent/CMakeFiles/bittorrent.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/msg/bittorrent/CMakeFiles/bittorrent.dir/depend

