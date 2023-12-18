# 引き継ぎ用資料
2024年度に知能コースに参加する方に向けた知見達です。

# 細かい手引き
## ROS 2及ぶCRANE-X7セットアップ

## realsenseセットアップ

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
