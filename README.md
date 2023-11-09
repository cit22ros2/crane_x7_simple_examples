# cit_cranex7_ros2
crane-x7をRos 2において外部から司令を出し動かすためのパッケージです。


# このパッケージの使い方
## install
```
git clone git@github.com:cit22ros2/cit_cranex7_ros2.git
```
## build
```
cd cit_cranex7_ros2/
colcon build
source ~/cit_cranex7_ros2/install/setup.bash
```
## execute
### for GAZEBO
```
ros2 launch cit_cranex7_ros2 launch.py execute:='exec_dir' use_sim_time:='true'
```
### for real machine
```
ros2 launch cit_cranex7_ros2 launch.py execute:='exec_dir' 
```
