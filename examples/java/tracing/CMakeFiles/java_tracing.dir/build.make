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

# Utility rule file for java_tracing.

# Include the progress variables for this target.
include examples/java/tracing/CMakeFiles/java_tracing.dir/progress.make

examples/java/tracing/CMakeFiles/java_tracing: examples/java/tracing/java_tracing_compiled

examples/java/tracing/java_tracing_compiled: examples/java/tracing/PingPongTask.java
examples/java/tracing/java_tracing_compiled: examples/java/tracing/Receiver.java
examples/java/tracing/java_tracing_compiled: examples/java/tracing/Sender.java
examples/java/tracing/java_tracing_compiled: examples/java/tracing/TracingTest.java
examples/java/tracing/java_tracing_compiled: simgrid.jar
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building java_tracing..."
	cd /root/simgrid/simgrid/examples/java/tracing && /usr/lib/jvm/java-8-oracle/bin/javac -cp /root/simgrid/simgrid/simgrid.jar -d /root/simgrid/simgrid/examples/java/tracing/.. /root/simgrid/simgrid/examples/java/tracing/PingPongTask.java /root/simgrid/simgrid/examples/java/tracing/Receiver.java /root/simgrid/simgrid/examples/java/tracing/Sender.java /root/simgrid/simgrid/examples/java/tracing/TracingTest.java
	cd /root/simgrid/simgrid/examples/java/tracing && /usr/bin/cmake -E remove java_tracing_compiled
	cd /root/simgrid/simgrid/examples/java/tracing && /usr/bin/cmake -E touch java_tracing_compiled

java_tracing: examples/java/tracing/CMakeFiles/java_tracing
java_tracing: examples/java/tracing/java_tracing_compiled
java_tracing: examples/java/tracing/CMakeFiles/java_tracing.dir/build.make
.PHONY : java_tracing

# Rule to build all files generated by this target.
examples/java/tracing/CMakeFiles/java_tracing.dir/build: java_tracing
.PHONY : examples/java/tracing/CMakeFiles/java_tracing.dir/build

examples/java/tracing/CMakeFiles/java_tracing.dir/clean:
	cd /root/simgrid/simgrid/examples/java/tracing && $(CMAKE_COMMAND) -P CMakeFiles/java_tracing.dir/cmake_clean.cmake
.PHONY : examples/java/tracing/CMakeFiles/java_tracing.dir/clean

examples/java/tracing/CMakeFiles/java_tracing.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/java/tracing /root/simgrid/simgrid /root/simgrid/simgrid/examples/java/tracing /root/simgrid/simgrid/examples/java/tracing/CMakeFiles/java_tracing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/java/tracing/CMakeFiles/java_tracing.dir/depend

