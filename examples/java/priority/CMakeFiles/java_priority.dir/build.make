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

# Utility rule file for java_priority.

# Include the progress variables for this target.
include examples/java/priority/CMakeFiles/java_priority.dir/progress.make

examples/java/priority/CMakeFiles/java_priority: examples/java/priority/java_priority_compiled

examples/java/priority/java_priority_compiled: examples/java/priority/Priority.java
examples/java/priority/java_priority_compiled: examples/java/priority/Test.java
examples/java/priority/java_priority_compiled: simgrid.jar
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building java_priority..."
	cd /root/simgrid/simgrid/examples/java/priority && /usr/lib/jvm/java-8-oracle/bin/javac -cp /root/simgrid/simgrid/simgrid.jar -d /root/simgrid/simgrid/examples/java/priority/.. /root/simgrid/simgrid/examples/java/priority/Priority.java /root/simgrid/simgrid/examples/java/priority/Test.java
	cd /root/simgrid/simgrid/examples/java/priority && /usr/bin/cmake -E remove java_priority_compiled
	cd /root/simgrid/simgrid/examples/java/priority && /usr/bin/cmake -E touch java_priority_compiled

java_priority: examples/java/priority/CMakeFiles/java_priority
java_priority: examples/java/priority/java_priority_compiled
java_priority: examples/java/priority/CMakeFiles/java_priority.dir/build.make
.PHONY : java_priority

# Rule to build all files generated by this target.
examples/java/priority/CMakeFiles/java_priority.dir/build: java_priority
.PHONY : examples/java/priority/CMakeFiles/java_priority.dir/build

examples/java/priority/CMakeFiles/java_priority.dir/clean:
	cd /root/simgrid/simgrid/examples/java/priority && $(CMAKE_COMMAND) -P CMakeFiles/java_priority.dir/cmake_clean.cmake
.PHONY : examples/java/priority/CMakeFiles/java_priority.dir/clean

examples/java/priority/CMakeFiles/java_priority.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/java/priority /root/simgrid/simgrid /root/simgrid/simgrid/examples/java/priority /root/simgrid/simgrid/examples/java/priority/CMakeFiles/java_priority.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/java/priority/CMakeFiles/java_priority.dir/depend
