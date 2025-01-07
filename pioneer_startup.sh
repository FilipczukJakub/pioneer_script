#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost
set -e
source /opt/ros/noetic/setup.bash
roscore &
until rostopic list; do sleep 1; done
cd catkin_ws
source ./devel/setup.bash
cd src

fuser -k 8765/tcp
fuser -k 8766/tcp
fuser -k 12345/tcp

rosrun pioneer_controller remote_connection.py &
sleep 2
rosrun rosaria RosAria &

wait
