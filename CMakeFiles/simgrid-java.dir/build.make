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
include CMakeFiles/simgrid-java.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/simgrid-java.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/simgrid-java.dir/flags.make

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o: src/bindings/java/jmsg.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o: src/bindings/java/jmsg_as.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_as.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_as.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_as.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o: src/bindings/java/jmsg_comm.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_comm.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_comm.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_comm.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o: src/bindings/java/jmsg_file.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_file.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_file.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_file.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o: src/bindings/java/jmsg_host.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_host.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_host.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_host.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o: src/bindings/java/jmsg_process.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_process.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_process.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_process.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o: src/bindings/java/jmsg_rngstream.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_rngstream.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_rngstream.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_rngstream.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o: src/bindings/java/jmsg_synchro.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_synchro.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_synchro.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_synchro.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o: src/bindings/java/jmsg_task.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_task.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_task.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_task.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o: src/bindings/java/jmsg_vm.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o   -c /root/simgrid/simgrid/src/bindings/java/jmsg_vm.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jmsg_vm.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jmsg_vm.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o: src/bindings/java/jxbt_utilities.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o   -c /root/simgrid/simgrid/src/bindings/java/jxbt_utilities.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jxbt_utilities.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jxbt_utilities.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o: src/bindings/java/smx_context_cojava.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o   -c /root/simgrid/simgrid/src/bindings/java/smx_context_cojava.c

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/smx_context_cojava.c > CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/smx_context_cojava.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o: src/bindings/java/smx_context_java.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_13)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o   -c /root/simgrid/simgrid/src/bindings/java/smx_context_java.c

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/smx_context_java.c > CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/smx_context_java.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o

CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o: CMakeFiles/simgrid-java.dir/flags.make
CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o: src/bindings/java/jtrace.c
	$(CMAKE_COMMAND) -E cmake_progress_report /root/simgrid/simgrid/CMakeFiles $(CMAKE_PROGRESS_14)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o   -c /root/simgrid/simgrid/src/bindings/java/jtrace.c

CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /root/simgrid/simgrid/src/bindings/java/jtrace.c > CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.i

CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /root/simgrid/simgrid/src/bindings/java/jtrace.c -o CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.s

CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o.requires:
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o.requires

CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o.provides: CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o.requires
	$(MAKE) -f CMakeFiles/simgrid-java.dir/build.make CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o.provides.build
.PHONY : CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o.provides

CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o.provides.build: CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o

# Object files for target simgrid-java
simgrid__java_OBJECTS = \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o" \
"CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o"

# External object files for target simgrid-java
simgrid__java_EXTERNAL_OBJECTS =

lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/build.make
lib/libsimgrid-java.so.3.9.90: lib/libsimgrid.so.3.9.90
lib/libsimgrid-java.so.3.9.90: CMakeFiles/simgrid-java.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library lib/libsimgrid-java.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simgrid-java.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library lib/libsimgrid-java.so.3.9.90 lib/libsimgrid-java.so.3.9.90 lib/libsimgrid-java.so

lib/libsimgrid-java.so: lib/libsimgrid-java.so.3.9.90

# Rule to build all files generated by this target.
CMakeFiles/simgrid-java.dir/build: lib/libsimgrid-java.so
.PHONY : CMakeFiles/simgrid-java.dir/build

CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_as.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_comm.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_file.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_host.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_process.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_rngstream.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_synchro.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_task.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jmsg_vm.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jxbt_utilities.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_cojava.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/smx_context_java.c.o.requires
CMakeFiles/simgrid-java.dir/requires: CMakeFiles/simgrid-java.dir/src/bindings/java/jtrace.c.o.requires
.PHONY : CMakeFiles/simgrid-java.dir/requires

CMakeFiles/simgrid-java.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/simgrid-java.dir/cmake_clean.cmake
.PHONY : CMakeFiles/simgrid-java.dir/clean

CMakeFiles/simgrid-java.dir/depend:
	cd /root/simgrid/simgrid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid /root/simgrid/simgrid/CMakeFiles/simgrid-java.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/simgrid-java.dir/depend
