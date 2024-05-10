# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

add_library(nativerender SHARED
    manager/plugin_manager.cpp
    napi_render_init.cpp
    commonattrs/commonattrs_enabled_test.cpp
    commonattrs/commonattrs_focusable_test.cpp
    commonevent/commonevent_onappear_test.cpp
    commonevent/commonevent_onareachange_test.cpp
    commonevent/commonevent_onblur_test.cpp
    commonevent/commonevent_ontouch_test.cpp
    commonevent/commonevent_onfocus_test.cpp
    commonevent/commonevent_onclick_test.cpp
    commonattrs/commonattrs_hittestbehavior_test.cpp
    commonattrs/commonattrs_id_test.cpp
    image/image_hittestbehavior_test.cpp
    image/image_id_test.cpp
    image/image_oncomplete_test.cpp
    image/image_onerror_test.cpp
    list/list_hittestbehavior_test.cpp
    listitem/listitem_hittestbehavior_test.cpp
    toggle/toggle_onchange_test.cpp
    toggle/toggle_enabled_test.cpp
    scroll/scroll_nestedscroll_test.cpp
    scroll/scroll_onscroll_test.cpp
    scroll/scroll_onscrollframebegin_test.cpp
    scroll/scroll_onscrollstart_test.cpp
    scroll/scroll_onscrollstop_test.cpp
    scroll/scroll_onappear_test.cpp
    scroll/scroll_onscrolledge_test.cpp
    scroll/scroll_scrolledge_test.cpp
    scroll/scroll_hittestbehavior_test.cpp
    stack/stack_hittestbehavior_test.cpp
    stack/stack_onareachange_test
    stack/stack_ontouch_test.cpp
    text/text_enabled_test.cpp
)

add_library(nativefunc SHARED
    napi_func_init.cpp
)

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
    # Sets the name of the path variable.
    libuv-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    uv
)

target_link_libraries(nativerender PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})
target_link_libraries(nativefunc PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})