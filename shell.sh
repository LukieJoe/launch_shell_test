#! /bin/bash

clear

echo "shell script launched"

#echo "shell script attempt"
#python mc_test.py
#a=45
#echo $a

#pwd
#ls

#read -p "Can you hear me?" ans
#echo $ans

#run python scripts in parallel
#sudo x-terminal-emulator -e python /home/oaktobotics/raspi_robot_test.py &
#sudo x-terminal-emulator -e python /home/oaktobotics/rrb_led.py

#execute catkin_make in catkin_ws
sudo xterm -e "cd /home/oaktobotics/catkin_ws/; source /opt/ros/kinetic/setup.bash;  catkin_make"

#buffer between catkin_make and roscore - may need to be adjusted 
sleep 1s

#roscore and joy_to_twist launched in parallel - joy_to_twist has 5sec buffer to make sure roscore is running
#-hold keeps the terminal open after the program has executed
#-e tells xterm to execute the following code
sudo xterm -e "cd /home/oaktobotics/catkin_ws/; source /opt/ros/kinetic/setup.bash; roscore" &
sudo xterm -hold -e "cd /home/oaktobotics/catkin_ws/; sleep 5s; source /opt/ros/kinetic/setup.bash; rostopic list" &
sudo xterm -hold -e "cd /home/oaktobotics/catkin_ws/; sleep 5s; source /opt/ros/kinetic/setup.bash; source /home/oaktobotics/catkin_ws/devel/setup.bash; rosrun motor_controller joy_to_twist.py"
