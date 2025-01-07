#!/bin/bash

ros_sourcing_script='source ./workflow/source_ros.sh'

# launch the ros master
gnome-terminal --tab --title="Simulation Master" -- bash -c "\
$ros_sourcing_script; roslaunch dinova_gazebo dinova.launch mode:=velocity; exec bash"

# Second tab: Navigate to the user's home directory and list files
gnome-terminal --tab --title="Action Server" -- bash -c "\
$ros_sourcing_script; sleep 3; \
roslaunch dinova_fabrics_wrapper dinova_joint_space_gazebo.launch lidar:=false with_obstacles:=true; exec bash"

# # Third tab: Ping a website to check connectivity
gnome-terminal --tab --title="Action Client" -- bash -c "\
$ros_sourcing_script; rosrun dinova_fabrics_wrapper dinova_joint_client.py dinova; exec bash"
