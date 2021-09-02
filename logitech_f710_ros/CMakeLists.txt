cmake_minimum_required(VERSION 3.0.2)
project(logitech_f710_joy_ros)

find_package(catkin REQUIRED COMPONENTS
  joy
  roscpp
)


catkin_package(

)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

add_executable(f710_teleop_joy src/joy_node.cpp)
target_link_libraries(f710_teleop_joy ${catkin_LIBRARIES})