#! /bin/bash

clear
#echo "shell script attempt"
#python mc_test.py
#a=45
#echo $a

#pwd
#ls

#read -p "Can you hear me?" ans
#echo $ans

sudo x-terminal-emulator -e python /home/oaktobotics/raspi_robot_test.py &
sudo x-terminal-emulator -e python /home/oaktobotics/rrb_led.py

sudo xterm -e "cd /home/oaktobotics/catkin_ws/; source /opt/ros/kinetic/setup.bash;  catkin_make"

sudo xterm -e "cd /home/oaktobotics/catkin_ws/; source /opt/ros/kinetic/setup.bash; roscore" &
sudo xterm -hold -e "cd /home/oaktobotics/catkin_ws/; sleep 5s; source /opt/ros/kinetic/setup.bash; rostopic list" &
sudo xterm -hold -e "cd /home/oaktobotics/catkin_ws/; sleep 5s; source /opt/ros/kinetic/setup.bash; source /home/oaktobotics/catkin_ws/devel/setup.bash; rosrun motor_controller joy_to_twist.py"
