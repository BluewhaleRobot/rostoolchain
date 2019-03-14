# rostoolchain
ros android cross compile toolchain file

## 如何使用

### 依赖

[cmake](https://cmake.org/download/) 版本3.14以上
[NDK](https://developer.android.google.cn/ndk/downloads/)
[Boost-for-Android](https://github.com/moritz-wundke/Boost-for-Android)

### 移植自己的ROS程序到Android

```bash
git clone https://github.com/BluewhaleRobot/rostoolchain
export TOOLCHAIN_ROOT=$(pwd)/rostoolchain # 设置toolchain路径
export NDK_ROOT=[你的NDK_ROOT路径]
# 编译Boost库，下面以编译armeabi-v7a为例
git clone https://github.com/moritz-wundke/Boost-for-Android
mkdir boost_libs
cd Boost-for-Android
./build-android.sh --boost=1.68.0 --prefix=$(pwd)/../boost_libs $NDK_ROOT
cd ..
# 复制boost库到自己的库路径
export INSTALL_PREFIX=/opt/ros/arm #设置自己的库安装路径
sudo cp -rf boost_libs/armeabi-v7a/include/boost-1_68/boost $INSTALL_PREFIX/include/
sudo cp boost_libs/armeabi-v7a/lib/*.a $INSTALL_PREFIX/lib/
# 创建工作空间
mkdir -p arm/src
cd arm/src
# 下载ROS相关源代码
git clone https://github.com/ros/catkin --depth=1
git clone https://github.com/ros/common_msgs --depth=1
git clone https://github.com/ros/gencpp --depth=1
git clone https://github.com/jsk-ros-pkg/geneus --depth=1
git clone https://github.com/ros/genlisp --depth=1
git clone https://github.com/ros/genmsg --depth=1
git clone https://github.com/RethinkRobotics-opensource/gennodejs --depth=1
git clone https://github.com/ros/genpy --depth=1
git clone https://github.com/ros/message_generation --depth=1
git clone https://github.com/ros/message_runtime --depth=1
git clone https://github.com/BluewhaleRobot/ros_comm --depth=1
git clone https://github.com/ros/ros_comm_msgs --depth=1
git clone https://github.com/BluewhaleRobot/rosconsole --depth=1
git clone https://github.com/BluewhaleRobot/roscpp_core --depth=1
git clone https://github.com/ros/std_msgs --depth=1
# 添加自己的源代码
# 编译代码
cd ..
./src/catkin/bin/catkin_make -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_ROOT/toolchain-arm.cmake -DCATKIN_WHITELIST_PACKAGES="" -DBUILD_SHARED_LIBS=OFF
```
