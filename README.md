# crane_x7_simple_example
CRANE-X7を講義の基準で最低限動かすことのできるROS 2のパッケージです。


# このパッケージの使い方
## インストール
```
cd ~/ros2_ws/src
git clone https://github.com/cit22ros2/crane_x7_simple_examples.git 
```
## ビルド [![build-test](https://github.com/cit22ros2/crane_x7_simple_examples/actions/workflows/test.yaml/badge.svg)](https://github.com/cit22ros2/crane_x7_simple_examples/actions/workflows/test.yaml)
```
cd ~/ros2_ws
colcon build
source ~/ros2_ws/install/setup.bash
```
## 実行
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
[!['pick_and_move.cppのデモ'](https://github.com/cit22ros2/crane_x7_simple_examples/assets/79034190/ad018b61-cf41-47fd-98b9-6d7f46474003)](https://youtu.be/mTcFaEJwO1E)

### camera_picking
特定の色の物体を検知する・掴む・持ち上げる・運ぶ・置くコード例です。  
このコードでは青い物体の位置を検知し物体を掴みます。  
次のコマンドで実行します。
* for real machine
```
ros2 launch clane_x7_simple_examples camera_picking.launch.py
```
[!['camera_pickingのデモ'](https://github.com/cit22ros2/crane_x7_simple_examples/assets/79034190/ef1064a2-a127-4bb4-80e8-781fe843d839)](https://youtu.be/7FWFhGC4K1I)


# ライセンス
(C) 2023 Keitaro Nakamura

このパッケージはRT Corporationの公開する[パッケージ](https://github.com/rt-net/crane_x7_ros/tree/ros2)の[crane_x7_examples](https://github.com/rt-net/crane_x7_ros/tree/ros2/crane_x7_examples)のlaunch/launch.py,CMakeList.txt,package.xmlは微小な、src/exec_dir/pick_and_move.cppは大幅な改変によって作成されました。
このパッケージはApache License, Version 2.0に基づき公開されています。
ライセンスの全文は[LICENSE](./LICENSE)から確認できます。
