cmake_minimum_required(VERSION 3.5)
project(cit_cranex7_ros2)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(pcl_conversions REQUIRED)
find_package(pcl_ros REQUIRED)
find_package(angles REQUIRED)
find_package(rclcpp REQUIRED)
find_package(moveit_ros_planning_interface REQUIRED)

# Build and install node executables
add_executable(exec_dir
  src/exec_dir/pick_and_move.cpp
)

ament_target_dependencies(exec_dir
  ament_cmake
  pcl_conversions
  pcl_ros
  angles
  rclcpp
  moveit_ros_planning_interface
)

install(TARGETS
  exec_dir
  DESTINATION lib/${PROJECT_NAME}/
)

install(DIRECTORY
  launch
  DESTINATION share/${PROJECT_NAME}/
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
