# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/junpinfoo/cmpt433/work/as4/R5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/junpinfoo/cmpt433/work/as4/R5/build

# Utility rule file for ram_report.

# Include any custom commands dependencies for this target.
include zephyr/cmake/reports/CMakeFiles/ram_report.dir/compiler_depend.make

# Include the progress variables for this target.
include zephyr/cmake/reports/CMakeFiles/ram_report.dir/progress.make

zephyr/cmake/reports/CMakeFiles/ram_report: zephyr/zephyr.elf
	/home/junpinfoo/zephyrproject/.venv/bin/python /home/junpinfoo/zephyrproject/zephyr/scripts/footprint/size_report -k /home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/zephyr.elf -z /home/junpinfoo/zephyrproject/zephyr -o /home/junpinfoo/cmpt433/work/as4/R5/build --workspace=/home/junpinfoo/zephyrproject -d 99 ram

ram_report: zephyr/cmake/reports/CMakeFiles/ram_report
ram_report: zephyr/cmake/reports/CMakeFiles/ram_report.dir/build.make
.PHONY : ram_report

# Rule to build all files generated by this target.
zephyr/cmake/reports/CMakeFiles/ram_report.dir/build: ram_report
.PHONY : zephyr/cmake/reports/CMakeFiles/ram_report.dir/build

zephyr/cmake/reports/CMakeFiles/ram_report.dir/clean:
	cd /home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/cmake/reports && $(CMAKE_COMMAND) -P CMakeFiles/ram_report.dir/cmake_clean.cmake
.PHONY : zephyr/cmake/reports/CMakeFiles/ram_report.dir/clean

zephyr/cmake/reports/CMakeFiles/ram_report.dir/depend:
	cd /home/junpinfoo/cmpt433/work/as4/R5/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/junpinfoo/cmpt433/work/as4/R5 /home/junpinfoo/zephyrproject/zephyr/cmake/reports /home/junpinfoo/cmpt433/work/as4/R5/build /home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/cmake/reports /home/junpinfoo/cmpt433/work/as4/R5/build/zephyr/cmake/reports/CMakeFiles/ram_report.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : zephyr/cmake/reports/CMakeFiles/ram_report.dir/depend

