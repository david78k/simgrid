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

# Utility rule file for dist.

# Include the progress variables for this target.
include CMakeFiles/dist.dir/progress.make

CMakeFiles/dist: SimGrid-3.9.90.tar.gz
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Removing the distribution directory"
	/usr/bin/cmake -E echo SimGrid-3.9.90 > /root/simgrid/simgrid/VERSION
	/usr/bin/cmake -E remove_directory SimGrid-3.9.90/

SimGrid-3.9.90.tar.gz:
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Compressing the archive from the distribution directory"
	/usr/bin/cmake -E tar cf SimGrid-3.9.90.tar SimGrid-3.9.90/
	gzip -9v SimGrid-3.9.90.tar
	/usr/bin/cmake -E remove_directory SimGrid-3.9.90/

dist: CMakeFiles/dist
dist: SimGrid-3.9.90.tar.gz
dist: CMakeFiles/dist.dir/build.make
.PHONY : dist

# Rule to build all files generated by this target.
CMakeFiles/dist.dir/build: dist
.PHONY : CMakeFiles/dist.dir/build

CMakeFiles/dist.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dist.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dist.dir/clean

CMakeFiles/dist.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid/CMakeFiles/dist.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dist.dir/depend

