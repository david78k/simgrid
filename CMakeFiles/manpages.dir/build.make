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

# Utility rule file for manpages.

# Include the progress variables for this target.
include CMakeFiles/manpages.dir/progress.make

CMakeFiles/manpages:
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating manpages"
	/usr/bin/cmake -E make_directory /root/simgrid/simgrid/manpages
	pod2man /root/simgrid/simgrid/tools/simgrid_update_xml.pl > /root/simgrid/simgrid/manpages/simgrid_update_xml.1

manpages: CMakeFiles/manpages
manpages: CMakeFiles/manpages.dir/build.make
.PHONY : manpages

# Rule to build all files generated by this target.
CMakeFiles/manpages.dir/build: manpages
.PHONY : CMakeFiles/manpages.dir/build

CMakeFiles/manpages.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/manpages.dir/cmake_clean.cmake
.PHONY : CMakeFiles/manpages.dir/clean

CMakeFiles/manpages.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid/CMakeFiles/manpages.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/manpages.dir/depend

