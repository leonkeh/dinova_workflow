#!/bin/bash

# Source ROS Noetic setup
source /opt/ros/noetic/setup.bash

# Source the workspace setup
source devel/setup.bash

# Set ROS Master URI
export ROS_MASTER_URI=http://192.168.0.122:11311

# Set ROS IP
export ROS_IP=192.168.8.77
export ROBOT_NAME=dingo2


# Notify user of setup completion
echo "ROS environment configured with:"
echo "  ROS_MASTER_URI=$ROS_MASTER_URI"
echo "  ROS_IP=$ROS_IP"
