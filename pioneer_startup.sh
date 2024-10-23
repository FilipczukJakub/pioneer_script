#!/bin/sh
source /opt/ros/noetic/setup.bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
roscore &
sleep 5
cd catkin_ws
source ./devel/setup.bash
cd src
rosrun pioneer_controller remote_connection.py &
sleep 2
rosrun rosaria RosAria &
