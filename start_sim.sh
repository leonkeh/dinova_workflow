#!/bin/bash

ros_sourcing_script='source ./workflow/source_ros.sh; export ROBOT_NAME=dinova'

# launch the ros master
gnome-terminal --tab --title="Simulation Master" -- bash -c "\
$ros_sourcing_script; roslaunch dinova_gazebo dinova.launch mode:=velocity; exec bash"

if [ -z "$1" ]; then
    echo "The example simulation is running"
    # launch the action server
    gnome-terminal --tab --title="Action Server" -- bash -c "\
    $ros_sourcing_script; sleep 3; \
    roslaunch dinova_fabrics_wrapper dinova_joint_space_gazebo.launch lidar:=false with_obstacles:=true; exec bash"

    # call the action client
    gnome-terminal --tab --title="Action Client" -- bash -c "\
    $ros_sourcing_script; rosrun dinova_fabrics_wrapper dinova_joint_client.py dinova; exec bash"
elif [ "$1" == "switching" ]; then
    echo "The switching simulation is running"
    # launch the action server
    gnome-terminal --tab --title="Action Server" -- bash -c "\
    $ros_sourcing_script; sleep 3; \
    roslaunch switched_control switched_fabrics.launch lidar:=false with_obstacles:=true; exec bash"

    # call the action client
    gnome-terminal --tab --title="Action Client" -- bash -c "\
    $ros_sourcing_script; rosrun switched_control switched_joint_client.py dinova; exec bash"
else
    echo "$1 is not a known simulation type"
fi