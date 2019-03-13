# Sample toolchain file for building for Windows from an Ubuntu Linux system.
#
# Typical usage:
#    *) install cross compiler: `sudo apt-get install mingw-w64 g++-mingw-w64`
#    *) cd build
#    *) cmake -DCMAKE_TOOLCHAIN_FILE=~/Toolchain-Ubuntu-mingw64.cmake ..

set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_ANDROID_NDK $ENV{NDK_ROOT})
set(CMAKE_ANDROID_ARCH_ABI x86)
set(CMAKE_SYSTEM_VERSION 19)
set(Boost_USE_STATIC_LIBS ON)
set(Boost_LIB_PREFIX lib)
set(Boost_COMPILER -clang)
set(Boost_ARCHITECTURE -x86)
set(CATKIN_ENABLE_TESTING OFF)

# target environment on the build host system
#   set 1st to dir with the cross compiler's C/C++ headers/libs
set(CMAKE_FIND_ROOT_PATH /opt/ros/x86)

# modify default behavior of FIND_XXX() commands to
# search for headers/libs in the target environment and
# search for programs in the build host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
