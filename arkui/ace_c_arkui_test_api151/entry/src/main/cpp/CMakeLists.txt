# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(testndk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nativeNode SHARED container.cpp manager.cpp init.cpp )

find_library(
    # Sets the name of the path variable.
    hilog-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    hilog_ndk.z
)

find_library(
    # Sets the name of the path variable.
    libace-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    ace_ndk.z
)

find_library(
    # Sets the name of the path variable.
    libnapi-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    ace_napi.z
)
find_library(
    libnative_window

    native_window
)

find_library(
    libnative_drawing

    native_drawing
)

target_link_libraries(nativeNode PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib}  ${libnative_drawing})