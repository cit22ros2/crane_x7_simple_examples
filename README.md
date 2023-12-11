# crane_x7_simple_example
CRANE-X7をROS 2において外部から司令を出し動かすためのパッケージです。


# このパッケージの使い方
## install
```
cd ~/ros2_ws/src
git clone https://github.com/cit22ros2/crane_x7_simple_examples.git 
```
## build
```
cd ~/ros2_ws
colcon build
source ~/ros2_ws/install/setup.bash
```
## execute
### pick_and_move
特定の場所にある物体を掴む・持ち上げる・運ぶ・置くコード例です。  
次のコマンドで実行します。
* for GAZEBO
```
ros2 launch pick_and_move.launch.py use_sim_time:='true'
```
* for real machine
```
ros2 launch clane_x7_simple_examples pick_and_move.launch.py 
```

### camera_picking
特定の色の物体を検知する・掴む・持ち上げる・運ぶ・置くコード例です。  
このコードでは青い物体の位置を検知し物体を掴みます。  
次のコマンドで実行します。
* for real machine
```
ros2 launch clane_x7_simple_examples camera_picking.launch.py
```

# ライセンス
(C) 2023 Keitaro Nakamura

このパッケージはRT Corporationの公開する[パッケージ](https://github.com/rt-net/crane_x7_ros/tree/ros2)の[crane_x7_examples](https://github.com/rt-net/crane_x7_ros/tree/ros2/crane_x7_examples)のlaunch/launch.py,CMakeList.txt,package.xmlは微小な、src/exec_dir/pick_and_move.cppは大幅な改変によって作成されました。
このパッケージはApache License, Version 2.0に基づき公開されています。
ライセンスの全文は[LICENSE](./LICENSE)から確認できます。
