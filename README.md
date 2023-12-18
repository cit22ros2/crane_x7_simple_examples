# crane_x7_simple_example [![build-test](https://github.com/cit22ros2/crane_x7_simple_examples/actions/workflows/test.yaml/badge.svg)](https://github.com/cit22ros2/crane_x7_simple_examples/actions/workflows/test.yaml)
CRANE-X7を講義の基準で最低限動かすことのできるROS 2のパッケージです。


# このパッケージの使い方
## CRANE-X7のROS 2パッケージのインストール
```
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone -b ros2 https://github.com/rt-net/crane_x7_ros.git
git clone -b ros2 https://github.com/rt-net/crane_x7_description.git
```
## このパッケージインストール
```
cd ~/ros2_ws/src
git clone https://github.com/cit22ros2/crane_x7_simple_examples.git 
```
## ビルド 
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
![pick_and_moveのデモ動画](https://github.com/cit22ros2/crane_x7_simple_examples/assets/79034190/1ae6a7f3-ab86-4d11-852e-52d320dc2758)



### camera_picking
特定の色の物体を検知する・掴む・持ち上げる・運ぶ・置くコード例です。  
このコードでは青い物体の位置を検知し物体を掴みます。  
次のコマンドで実行します。
* for real machine
```
ros2 launch clane_x7_simple_examples camera_picking.launch.py
```
![camera_pickingのデモ動画](https://github.com/cit22ros2/crane_x7_simple_examples/assets/79034190/6f7d34e0-7bf0-4dd0-a9cf-9fd8b9e58e62)



# ライセンス
(C) 2023 Keitaro Nakamura, Ryotaro Karikomi

このパッケージはRT Corporationの公開する[パッケージ](https://github.com/rt-net/crane_x7_ros/tree/ros2)の[crane_x7_examples](https://github.com/rt-net/crane_x7_ros/tree/ros2/crane_x7_examples)のlaunch/camera_picking.launch.py,pick_and_mvoe.launch.py,src/pick_and_move_tf.py,color_detection,CMakeList.txt,package.xmlは微小な、src/pick_and_move.cppは大幅な改変によって作成されました。
このパッケージはApache License, Version 2.0に基づき公開されています。
ライセンスの全文は[LICENSE](./LICENSE)から確認できます。
