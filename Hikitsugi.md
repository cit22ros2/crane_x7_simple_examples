# 引き継ぎ用資料
2024年度に知能コースに参加する方に向けた知見達です。

# 細かい手引き
## ROS 2及ぶCRANE-X7セットアップ  
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
　また、インストールが完了したらパッケージに含まれるサンプルコードを試すことができます。詳しくは
    [こちら](https://github.com/rt-net/crane_x7_ros/tree/ros2/crane_x7_examples)を参照してください。
## realsenseセットアップ
[IntelRealsenseのgithub
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

## よく起きるエラーと解決法
* gazeboでcrane-x7が動かない/動きが途中で止まる  
    実行時にuse_sim_time:=trueをつけてみましょう
* rviz/gazeboの画面が真っ黒  
    1度止めてもう一度立ち上げてみましょう
* colcon buildが通らない  
    package名やコードの名前は統一されていますか
    依存関係の問題かもしれません次を試してみましょう
    ```
    rssdep update
    ```

# コード解説
## pick_and_move.cpp

## pick_and_move_tf.cpp

## color_detection.cpp

## *.launch.py


# やり残したこと
* gazeboに自分で作成したモデルの導入
* gazebo上でのrealsenseの動作
* open-cvのプログラム(color_detection.cpp)の変更
  * 見つける色の変更
  * 探すのに動きを組み合わせるなど
