cmake_minimum_required(VERSION 3.5)
project(crane_x7_simple_examples)

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
find_package(cv_bridge REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(image_geometry REQUIRED)
find_package(moveit_ros_planning_interface REQUIRED)
find_package(OpenCV REQUIRED COMPONENTS core)
find_package(rclcpp REQUIRED)
find_package(tf2_geometry_msgs REQUIRED)

# ここから
add_executable(color_detection
  src/color_detection.cpp
)
ament_target_dependencies(color_detection
    cv_bridge
    geometry_msgs
    image_geometry
    moveit_ros_planning_interface
    OpenCV
    rclcpp
    tf2_geometry_msgs
)
# ここまででコードに必要なものを記述
add_executable(pick_and_move
  src/pick_and_move.cpp
)
ament_target_dependencies(pick_and_move
    cv_bridge
    geometry_msgs
    image_geometry
    moveit_ros_planning_interface
    OpenCV
    rclcpp
    tf2_geometry_msgs
)
add_executable(pick_and_move_tf
  src/pick_and_move_tf.cpp
)
ament_target_dependencies(pick_and_move_tf
    cv_bridge
    geometry_msgs
    image_geometry
    moveit_ros_planning_interface
    OpenCV
    rclcpp
    tf2_geometry_msgs
)

# src下のソースコードはTARGETSで
# launch下のlaunchファイルはDIRECTORYで
install(TARGETS
  color_detection
  DESTINATION lib/${PROJECT_NAME}/
)
install(TARGETS
  pick_and_move 
  DESTINATION lib/${PROJECT_NAME}/
)
install(TARGETS
  pick_and_move_tf
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
