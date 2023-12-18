# crane_x7_simple_example [![build-test](https://github.com/cit22ros2/crane_x7_simple_examples/actions/workflows/test.yaml/badge.svg)](https://github.com/cit22ros2/crane_x7_simple_examples/actions/workflows/test.yaml)
CRANE-X7を講義の基準で最低限動かすことのできるROS 2のパッケージです。このパッケージを元にみなさんが製作するために作成しました。


## このパッケージを使う前に
### ROS 2及ぶCRANE-X7セットアップ  
  この資料はUbuntu 22.04 LTSを元に書いています。  
  * ROS 2インストール  
　　上田先生の[動画](https://youtu.be/mBhtD08f5KY)及び[インストールスクリプト](https://github.com/ryuichiueda/ros2_setup_scripts)を参照してください。  
  * CRANE-X7及び関連パッケージのインストール  
　　[RT社公式リポジトリ](https://github.com/rt-net/crane_x7_ros/tree/ros2)よりインストールできます。
    ```
    # Setup ROS environment
    $ source /opt/ros/humble/setup.bash

    # Download crane_x7 repositories
    $ mkdir -p ~/ros2_ws/src
    $ cd ~/ros2_ws/src
    $ git clone -b ros2 https://github.com/rt-net/crane_x7_ros.git
    $ git clone -b ros2 https://github.com/rt-net/crane_x7_description.git

    # Install dependencies
    $ rosdep install -r -y -i --from-paths .

    # Build & Install
    $ cd ~/ros2_ws
    $ colcon build --symlink-install
    $ source ~/ros2_ws/install/setup.bash
    ```
    （インストールコマンド：
[https://github.com/rt-net/crane_x7_ros/tree/ros2/README.md](https://github.com/rt-net/crane_x7_ros/tree/ros2/README.md)より引用）  
(#の行はコメント、$の行はshellのコマンドです)  
 また、インストールが完了したらパッケージに含まれるサンプルコードをGazeboで試すことができます。詳しくは
    [こちら](https://github.com/rt-net/crane_x7_ros/tree/ros2/crane_x7_examples)を参照してください。
  * CRANE-X7を動かす際にはUSBポートの設定が必要です。
  ```
  # 一時的な付与の場合(上手くいかない時はUSBポートの名前を確認してください)
  $ sudo chmod 666 /dev/ttyUSB0

  # 永続的な付与の場合(再起動を伴います)
  $ sudo usermod -aG dialout $USER
  $ reboot
  ```
  crane_x7_controlの[README](https://github.com/rt-net/crane_x7_ros/blob/ros2/crane_x7_control/README.md)に詳しく書いてあります。

### RealSenseセットアップ
[IntelRealSenseのgithub
](https://github.com/IntelRealSense/librealsense/blob/development/doc/distribution_linux.md#installing-the-packages)を参照してください。以下先ほどのページから引用
```
# Register the server's public key:
$ sudo mkdir -p /etc/apt/keyrings
$ curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | sudo tee /etc/apt/keyrings/librealsense.pgp > /dev/null

# Make sure apt HTTPS support is installed:
$ sudo apt-get install apt-transport-https

# Add the server to the list of repositories:
$ echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo `lsb_release -cs` main" | \
$ sudo tee /etc/apt/sources.list.d/librealsense.list
$ sudo apt-get update

# Install the libraries (see section below if upgrading packages):
$ sudo apt-get install librealsense2-dkms
$ sudo apt-get install librealsense2-utils

# ビューワーの起動
$ realsense-viewer

```

# このパッケージの使い方
## インストール
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
* for Gazebo
```
ros2 launch crane_x7_simple_examples pick_and_move.launch.py use_sim_time:='true'
```
* for real machine
```
ros2 launch crane_x7_simple_examples pick_and_move.launch.py 
```
![pick_and_moveのデモ動画](https://github.com/cit22ros2/crane_x7_simple_examples/assets/79034190/1ae6a7f3-ab86-4d11-852e-52d320dc2758)



### camera_picking
特定の色の物体を検知する・掴む・持ち上げる・運ぶ・置くコード例です。  
このコードでは青い物体の位置を検知し物体を掴みます。  
次のコマンドで実行します。
* for real machine
```
ros2 launch crane_x7_simple_examples camera_picking.launch.py
```
![camera_pickingのデモ動画](https://github.com/cit22ros2/crane_x7_simple_examples/assets/79034190/6f7d34e0-7bf0-4dd0-a9cf-9fd8b9e58e62)


# 引継ぎ事項
## よく起きるエラーと解決法
* gazeboでCRANE-X7が動かない/動きが途中で止まる  
    実行時にuse_sim_time:=trueをつけてみましょう
* rviz/gazeboの画面が真っ黒  
    1度止めてもう一度立ち上げてみましょう
* colcon buildが通らない  
    1. package名やコードの名前は統一されていますか  
    2. 依存関係の問題かもしれません次を試してみましょう
    ```
    $ rosdep update
    $ rosdep install -r -y --from-paths --ignore-src ./
    ```
* CRANE-X7のROS 2対応のリポジトリが見つからない  
    ros対応のブランチを変えるとあります
* 実行コマンドを叩いたのにパッケージが見つからないと出る
    実行コマンドで呼び出す名前とパッケージのものの名前が間違ってる可能性があります。

## やり残したこと
* gazeboに自分で作成したモデルの導入
* gazebo上でのrealsenseの動作
* Open CVのプログラム([color_detection.cpp](https://github.com/cit22ros2/crane_x7_simple_examples/blob/main/src/color_detection.cpp))の変更
  * 見つける色の変更
  * 探すのに動きを組み合わせるなど


# ライセンス
(C) 2023 Keitaro Nakamura, Ryotaro Karikomi

このパッケージはRT Corporationの公開する[パッケージ](https://github.com/rt-net/crane_x7_ros/tree/ros2)の[crane_x7_examples](https://github.com/rt-net/crane_x7_ros/tree/ros2/crane_x7_examples)のlaunch/camera_picking.launch.py,pick_and_mvoe.launch.py,src/pick_and_move_tf.py,color_detection,CMakeList.txt,package.xmlは微小な、src/pick_and_move.cppは大幅な改変によって作成されました。
このパッケージはApache License, Version 2.0に基づき公開されています。
ライセンスの全文は[LICENSE](./LICENSE)から確認できます。
