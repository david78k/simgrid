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

# Utility rule file for java_mutualExclusion.

# Include the progress variables for this target.
include examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/progress.make

examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion: examples/java/mutualExclusion/java_mutualExclusion_compiled

examples/java/mutualExclusion/java_mutualExclusion_compiled: examples/java/mutualExclusion/Coordinator.java
examples/java/mutualExclusion/java_mutualExclusion_compiled: examples/java/mutualExclusion/GrantTask.java
examples/java/mutualExclusion/java_mutualExclusion_compiled: examples/java/mutualExclusion/MutexCentral.java
examples/java/mutualExclusion/java_mutualExclusion_compiled: examples/java/mutualExclusion/Node.java
examples/java/mutualExclusion/java_mutualExclusion_compiled: examples/java/mutualExclusion/ReleaseTask.java
examples/java/mutualExclusion/java_mutualExclusion_compiled: examples/java/mutualExclusion/RequestTask.java
examples/java/mutualExclusion/java_mutualExclusion_compiled: simgrid.jar
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building java_mutualExclusion..."
	cd /root/simgrid/simgrid/examples/java/mutualExclusion && /usr/lib/jvm/java-8-oracle/bin/javac -cp /root/simgrid/simgrid/simgrid.jar -d /root/simgrid/simgrid/examples/java/mutualExclusion/.. /root/simgrid/simgrid/examples/java/mutualExclusion/Coordinator.java /root/simgrid/simgrid/examples/java/mutualExclusion/GrantTask.java /root/simgrid/simgrid/examples/java/mutualExclusion/MutexCentral.java /root/simgrid/simgrid/examples/java/mutualExclusion/Node.java /root/simgrid/simgrid/examples/java/mutualExclusion/ReleaseTask.java /root/simgrid/simgrid/examples/java/mutualExclusion/RequestTask.java
	cd /root/simgrid/simgrid/examples/java/mutualExclusion && /usr/bin/cmake -E remove java_mutualExclusion_compiled
	cd /root/simgrid/simgrid/examples/java/mutualExclusion && /usr/bin/cmake -E touch java_mutualExclusion_compiled

java_mutualExclusion: examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion
java_mutualExclusion: examples/java/mutualExclusion/java_mutualExclusion_compiled
java_mutualExclusion: examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/build.make
.PHONY : java_mutualExclusion

# Rule to build all files generated by this target.
examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/build: java_mutualExclusion
.PHONY : examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/build

examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/clean:
	cd /root/simgrid/simgrid/examples/java/mutualExclusion && $(CMAKE_COMMAND) -P CMakeFiles/java_mutualExclusion.dir/cmake_clean.cmake
.PHONY : examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/clean

examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid/examples/java/mutualExclusion /root/simgrid/simgrid /root/simgrid/simgrid/examples/java/mutualExclusion /root/simgrid/simgrid/examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/java/mutualExclusion/CMakeFiles/java_mutualExclusion.dir/depend

