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

# Utility rule file for java_bittorrent.

# Include the progress variables for this target.
include examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/progress.make

examples/java/bittorrent/CMakeFiles/java_bittorrent: examples/java/bittorrent/java_bittorrent_compiled

examples/java/bittorrent/java_bittorrent_compiled: examples/java/bittorrent/Bittorrent.java
examples/java/bittorrent/java_bittorrent_compiled: examples/java/bittorrent/Common.java
examples/java/bittorrent/java_bittorrent_compiled: examples/java/bittorrent/Connection.java
examples/java/bittorrent/java_bittorrent_compiled: examples/java/bittorrent/MessageTask.java
examples/java/bittorrent/java_bittorrent_compiled: examples/java/bittorrent/Peer.java
examples/java/bittorrent/java_bittorrent_compiled: examples/java/bittorrent/Tracker.java
examples/java/bittorrent/java_bittorrent_compiled: examples/java/bittorrent/TrackerTask.java
examples/java/bittorrent/java_bittorrent_compiled: simgrid.jar
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building java_bittorrent..."
	cd /root/simgrid/simgrid/examples/java/bittorrent && /usr/lib/jvm/java-8-oracle/bin/javac -cp /root/simgrid/simgrid/simgrid.jar -d /root/simgrid/simgrid/examples/java/bittorrent/.. /root/simgrid/simgrid/examples/java/bittorrent/Bittorrent.java /root/simgrid/simgrid/examples/java/bittorrent/Common.java /root/simgrid/simgrid/examples/java/bittorrent/Connection.java /root/simgrid/simgrid/examples/java/bittorrent/MessageTask.java /root/simgrid/simgrid/examples/java/bittorrent/Peer.java /root/simgrid/simgrid/examples/java/bittorrent/Tracker.java /root/simgrid/simgrid/examples/java/bittorrent/TrackerTask.java
	cd /root/simgrid/simgrid/examples/java/bittorrent && /usr/bin/cmake -E remove java_bittorrent_compiled
	cd /root/simgrid/simgrid/examples/java/bittorrent && /usr/bin/cmake -E touch java_bittorrent_compiled

java_bittorrent: examples/java/bittorrent/CMakeFiles/java_bittorrent
java_bittorrent: examples/java/bittorrent/java_bittorrent_compiled
java_bittorrent: examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/build.make
.PHONY : java_bittorrent

# Rule to build all files generated by this target.
examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/build: java_bittorrent
.PHONY : examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/build

examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/clean:
	cd /root/simgrid/simgrid/examples/java/bittorrent && $(CMAKE_COMMAND) -P CMakeFiles/java_bittorrent.dir/cmake_clean.cmake
.PHONY : examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/clean

examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/java/bittorrent /root/simgrid/simgrid /root/simgrid/simgrid/examples/java/bittorrent /root/simgrid/simgrid/examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/java/bittorrent/CMakeFiles/java_bittorrent.dir/depend
