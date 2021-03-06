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

# Utility rule file for distcheck.

# Include the progress variables for this target.
include CMakeFiles/distcheck.dir/progress.make

CMakeFiles/distcheck:
	/usr/bin/cmake -E echo XXX\ compare\ archive\ with\ git\ repository
	tools/check_dist_archive -batch /root/simgrid/simgrid/SimGrid-3.9.90.tar.gz
	/usr/bin/cmake -E echo XXX\ remove\ old\ copy
	/usr/bin/cmake -E remove_directory /root/simgrid/simgrid/SimGrid-3.9.90
	/usr/bin/cmake -E echo XXX\ Untar\ distrib
	/usr/bin/cmake -E tar xf /root/simgrid/simgrid/SimGrid-3.9.90.tar.gz /root/simgrid/simgrid/SimGrid-3.9.90
	/usr/bin/cmake -E echo XXX\ create\ build\ and\ install\ subtrees
	/usr/bin/cmake -E make_directory /root/simgrid/simgrid/SimGrid-3.9.90/_build
	/usr/bin/cmake -E make_directory /root/simgrid/simgrid/SimGrid-3.9.90/_inst
	/usr/bin/cmake -E echo XXX\ Configure
	/usr/bin/cmake -E chdir /root/simgrid/simgrid/SimGrid-3.9.90/_build /usr/bin/cmake -DCMAKE_INSTALL_PREFIX=/root/simgrid/simgrid/SimGrid-3.9.90/_inst ..
	/usr/bin/cmake -E echo XXX\ Build
	/usr/bin/cmake -E chdir /root/simgrid/simgrid/SimGrid-3.9.90/_build /usr/bin/make
	/usr/bin/cmake -E echo XXX\ Test
	/usr/bin/cmake -E chdir /root/simgrid/simgrid/SimGrid-3.9.90/_build ctest --output-on-failure
	/usr/bin/cmake -E echo XXX\ Install
	/usr/bin/cmake -E chdir /root/simgrid/simgrid/SimGrid-3.9.90/_build /usr/bin/make install
	/usr/bin/cmake -E create_symlink /root/simgrid/simgrid/SimGrid-3.9.90/_inst/lib/libsimgrid.so /root/simgrid/simgrid/SimGrid-3.9.90/_inst/lib/libsimgridtest.so
	/usr/bin/cmake -E echo XXX\ Build\ documentation
	/usr/bin/cmake -E chdir /root/simgrid/simgrid/SimGrid-3.9.90/_build /usr/bin/make simgrid_documentation
	/usr/bin/cmake -E echo XXX\ Install\ with\ documentation
	/usr/bin/cmake -E chdir /root/simgrid/simgrid/SimGrid-3.9.90/_build /usr/bin/make install
	/usr/bin/cmake -E echo XXX\ Remove\ temp\ directories
	/usr/bin/cmake -E remove_directory /root/simgrid/simgrid/SimGrid-3.9.90

distcheck: CMakeFiles/distcheck
distcheck: CMakeFiles/distcheck.dir/build.make
.PHONY : distcheck

# Rule to build all files generated by this target.
CMakeFiles/distcheck.dir/build: distcheck
.PHONY : CMakeFiles/distcheck.dir/build

CMakeFiles/distcheck.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/distcheck.dir/cmake_clean.cmake
.PHONY : CMakeFiles/distcheck.dir/clean

CMakeFiles/distcheck.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid/CMakeFiles/distcheck.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/distcheck.dir/depend

