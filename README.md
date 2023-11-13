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

# ライセンス
(C) 2023 Keitaro Nakamura,Ryotaro Karikomi

このパッケージはRT Corporationの公開する[パッケージ](https://github.com/rt-net/crane_x7_ros/tree/ros2)の[crane_x7_examples](https://github.com/rt-net/crane_x7_ros/tree/ros2/crane_x7_examples)のlaunch/launch.py,CMakeList.txt,package.xmlは微小な、src/exec_dir/pick_and_move.cppは大幅な改変によって作成されました。
このパッケージはApache License, Version 2.0に基づき公開されています。  
ライセンスの全文は[LICENSE](./LICENSE)または[https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0)から確認できます。
