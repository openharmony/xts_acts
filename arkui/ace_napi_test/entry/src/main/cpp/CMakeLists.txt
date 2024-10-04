cmake_minimum_required(VERSION 3.5)

project(napitest)
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)
include_directories(${NATIVERENDER_ROOT_PATH}/securec/include)

aux_source_directory(./securec/src SECUREC_SRCS)
add_library(securec SHARED ${SECUREC_SRCS})

add_library(napitest SHARED ./napi/napi_test.cpp)

target_link_libraries(napitest PUBLIC securec libace_napi.z.so libuv.so libhilog_ndk.z.so libc++.a)