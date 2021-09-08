FROM ros:noetic-ros-base

# Use bash instead of sh
SHELL ["/bin/bash", "-c"]

# Update Ubuntu Software repository
RUN apt update && \
    apt upgrade -y

RUN apt install -y ros-$ROS_DISTRO-joy

# Create and initialise ROS workspace
RUN mkdir -p /app/ros_ws/src
WORKDIR /app/ros_ws
COPY ./logitech_f710_ros /app/ros_ws/src/logitech_f710_ros
RUN mkdir build && \
    source /opt/ros/$ROS_DISTRO/setup.bash && \
    catkin_make

WORKDIR /app

# Clear 
RUN apt clean && \
    rm -rf /var/lib/apt/lists/* 

COPY ./ros_entrypoint.sh /
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]