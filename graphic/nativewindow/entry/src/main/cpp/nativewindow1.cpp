/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
// Created on 2024/8/6.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".
#include "napi/native_api.h"
#include <IPCKit/ipc_cparcel.h>
#include <bits/alltypes.h>
#include <GLES2/gl2.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <native_buffer/native_buffer.h>


#define SUCCESS 0
#define FAIL (-1)

#define CONSTANT_0 0
#define CONSTANT_1 1
#define CONSTANT_2 2
#define CONSTANT_3 3
#define CONSTANT_4 4
#define CONSTANT_5 5
#define CONSTANT_6 6
#define CONSTANT_7 7
#define CONSTANT_8 8

#define CONSTANT_500 500
#define CONSTANT_1000 1000
#define CONSTANT_10000 10000

#define CONSTANT_40001000 40001000
#define CONSTANT_41207000 41207000
#define CONSTANT_41208000 41208000
#define CONSTANT_41210000 41210000

#define CONSTANT_50002000 50002000
#define CONSTANT_50102000 50102000

#define CONSTANT_999999999 999999999
#define CONSTANT_9999999999999999999 9999999999999999999

struct result {
    OH_NativeImage *image;
    OHNativeWindow *nativeWindow;
    int32_t width_;
    int32_t height_;
};

static result InitNativeWindow()
{
    struct result result1;
    GLuint textureId;
    glGenTextures(1, &textureId);
    auto _image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    result1.image = _image;
    OHNativeWindow *_nativeWindow = OH_NativeImage_AcquireNativeWindow(_image);
    result1.nativeWindow = _nativeWindow;
    int code = SET_BUFFER_GEOMETRY;
    result1.width_ = 0x100;
    result1.height_ = 0x100;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, code, result1.width_, result1.height_);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    ret = OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, code, usage);
    return result1;
}

static void DestroyNativeWindowImage(OH_NativeImage *image, OHNativeWindow *window)
{
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(window);
}

napi_value testNativeWindowCreateNativeWindowNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    auto p = OH_NativeWindow_CreateNativeWindow(nullptr);
    if (p == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value testNativeWindowDestroyNativeWindowNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeWindow_DestroyNativeWindow(nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowGetSurfaceIdNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    auto r = OH_NativeWindow_GetSurfaceId(nullptr, 0);
    if (CONSTANT_40001000 == r) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}


napi_value testNativeWindowCreateNativeWindowFromSurfaceIdNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 设置OH_NativeWindow_CreateNativeWindowFromSurfaceId()的surfaceId=nullptr，其他参数正常调用该接口
    OHNativeWindow *nativeWindow = nullptr;
    auto flag = OH_NativeWindow_CreateNativeWindowFromSurfaceId(0, &nativeWindow);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    GLuint textureId;
    glGenTextures(1, &textureId);
    auto _image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    auto _nativeWindow = OH_NativeImage_AcquireNativeWindow(_image);
    uint64_t surfaceId;
    OH_NativeWindow_GetSurfaceId(_nativeWindow, &surfaceId);
    // 设置OH_NativeWindow_CreateNativeWindowFromSurfaceId()的window=nullptr,，其他参数正常调用该接口
    flag = OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    OH_NativeImage_Destroy(&_image);
    OH_NativeWindow_DestroyNativeWindow(_nativeWindow);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowCreateNativeWindowFromSurfaceIdNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 创建surface实例 获取id
    GLuint textureId;
    glGenTextures(1, &textureId);
    auto _image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    auto _nativeWindow = OH_NativeImage_AcquireNativeWindow(_image);
    uint64_t surfaceId;
    OH_NativeWindow_GetSurfaceId(_nativeWindow, &surfaceId);

    // 声明nativeWindow空指针为window
    OHNativeWindow *nativeWindow = nullptr;
    auto flag = OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &nativeWindow);
    // 接口执行成功，返回错误码0 | 声明的window指针指向NativeWindow实例
    if (flag != 0 || nativeWindow == nullptr) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    // 声明一个surfaceId2
    uint64_t surfaceId2;
    flag = OH_NativeWindow_GetSurfaceId(nativeWindow, &surfaceId2);
    // 接口调用成功，返回错误码0 | get获取surfaceId2与surfaceId一致
    if (flag != 0 || surfaceId2 != surfaceId) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    OH_NativeImage_Destroy(&_image);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 创建surface实例 获取一个正常的id
    GLuint textureId;
    glGenTextures(1, &textureId);
    auto _image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    auto _nativeWindow = OH_NativeImage_AcquireNativeWindow(_image);
    uint64_t surfaceId;
    OH_NativeWindow_GetSurfaceId(_nativeWindow, &surfaceId);

    // 调用该接口，查看执行结果
    uint64_t ids[] = {0, 1, surfaceId, 0xFFFFFFFF};
    for (int i = 0; i < sizeof(ids) / sizeof(uint64_t); i += 1) {
        uint64_t tmpId = ids[i];
        OHNativeWindow *nativeWindow = nullptr;
        auto flag = OH_NativeWindow_CreateNativeWindowFromSurfaceId(tmpId, &nativeWindow);
        // 只有样例3成功
        if (i == CONSTANT_2) {
            if (flag != SUCCESS) {
                napi_create_int32(env, i + 1, &result);
                return result;
            }
        } else {
            OH_NativeWindow_DestroyNativeWindow(nativeWindow);
            if (flag == SUCCESS) {
                napi_create_int32(env, 1 + 1, &result);
                return result;
            }
        }
    }
    OH_NativeImage_Destroy(&_image);
    OH_NativeWindow_DestroyNativeWindow(_nativeWindow);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    auto buffer = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(nullptr);
    if (buffer == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}


napi_value testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    auto buffer = OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer(nullptr);
    if (buffer == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}


napi_value testNativeWindowDestroyNativeWindowBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeWindow_DestroyNativeWindowBuffer(nullptr);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowGetBufferHandleFromNativeNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    auto ptr = OH_NativeWindow_GetBufferHandleFromNative(nullptr);
    if (ptr == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native buffer 实例
    OH_NativeBuffer_Config config{
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *buffer = OH_NativeBuffer_Alloc(&config);
    if (buffer == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }

    // 1.
    auto nativeWindowBuffer = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(buffer);
    // 接口执行成功，返回非空指针
    if (nativeWindowBuffer == nullptr) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    // 2.
    auto bufferHandle = OH_NativeWindow_GetBufferHandleFromNative(nativeWindowBuffer);
    if (bufferHandle == nullptr) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    // 3.
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);

    // 4.
    bufferHandle = OH_NativeWindow_GetBufferHandleFromNative(nativeWindowBuffer);
    if (bufferHandle != nullptr) {
        napi_create_int32(env, CONSTANT_4, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native buffer 实例
    OH_NativeBuffer_Config config{
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *buffer = OH_NativeBuffer_Alloc(&config);
    if (buffer == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }

    for (int i = 0; i < CONSTANT_500; i += 1) {
        auto ptr = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(buffer);
        if (ptr == nullptr) {
            napi_create_int32(env, i + 1, &result);
            return result;
        }
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowRequestBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OHNativeWindowBuffer *oHNativeWindowBuffer;
    int fenceFd;

    auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nullptr, &oHNativeWindowBuffer, &fenceFd);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowAbortBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native window 实例
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *oHNativeWindowBuffer;

    // 1. window 为空指针
    auto flag = OH_NativeWindow_NativeWindowAbortBuffer(nullptr, oHNativeWindowBuffer);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    // 2. buffer 为空指针
    flag = OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowRequestAbortBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native window 实例
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;

    // 0. 新建 native window buffer 指针
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;

    // 1.
    int fenceFd = -1;
    auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (flag != 0 || nativeWindowBuffer == nullptr) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    // 2.
    flag = OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, nativeWindowBuffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowRequestAbortBufferAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native window 实例
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;

    // 1.
    int fenceFd = 0;
    auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (flag != 0 || nativeWindowBuffer == nullptr) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    // 2.
    flag = OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, nativeWindowBuffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    // 3.
    flag = OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, nativeWindowBuffer);
    if (flag == 0) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowRequestBufferFenceFdNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native window 实例
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;

    int32_t ls[] = {-CONSTANT_5, -CONSTANT_1, CONSTANT_0, CONSTANT_1, CONSTANT_10000, CONSTANT_999999999};
    for (int i = 0; i < sizeof(ls) / sizeof(int); i += 1) {
        int fenceFd = ls[i];
        auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
        if (flag != 0) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, nativeWindowBuffer);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_2, &result);
            return result;
        }
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowRequestBufferFenceFdAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native window 实例
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;

    int32_t *fenceFd1 = NULL;
    auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, fenceFd1);
    if (flag == 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    int32_t *fenceFd2 = nullptr;
    flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, fenceFd2);
    if (flag == 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowRequestAbortBufferMax(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native window 实例
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;

    for (int i = 0; i < CONSTANT_4; ++i) {
        int fenceFd = -1;
        auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
        if (i >= CONSTANT_3) {
            if (flag == 0) {
                napi_create_int32(env, FAIL, &result);
                return result;
            }
        } else {
            if (flag != 0) {
                napi_create_int32(env, i + 1, &result);
                return result;
            }
        }
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowRequestAbortBufferErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int requestFenceFd;
    auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &requestFenceFd);
    if (flag != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (nativeWindowBuffer == nullptr || requestFenceFd != -1) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    flag = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, requestFenceFd, region);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, nativeWindowBuffer);
    if (flag == 0) {
        napi_create_int32(env, CONSTANT_4, &result);
        return result;
    }

    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowWriteToParcelErrptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native window 实例
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    // 0. 已存在OHIPCParcel
    OHIPCParcel *parcel = OH_IPCParcel_Create();

    // 1.
    auto flag = OH_NativeWindow_WriteToParcel(nullptr, parcel);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    // 2.
    flag = OH_NativeWindow_WriteToParcel(nativeWindow, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowReadFromParcelErrptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OHNativeWindow *nativeWindow = nullptr;
    // 0. 已存在OHIPCParcel
    OHIPCParcel *parcel = OH_IPCParcel_Create();

    // 1.
    auto flag = OH_NativeWindow_ReadFromParcel(parcel, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    // 2.
    flag = OH_NativeWindow_ReadFromParcel(nullptr, &nativeWindow);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowWRParcelNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0. 创建 native window 实例
    GLuint textureId;
    glGenTextures(1, &textureId);
    auto _image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    auto nativeWindow1 = OH_NativeImage_AcquireNativeWindow(_image);
    // 0. 已存在OHIPCParcel
    OHIPCParcel *parcel1 = OH_IPCParcel_Create();

    auto flag = OH_NativeWindow_WriteToParcel(nativeWindow1, parcel1);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    OHNativeWindow *nativeWindow2;
    flag = OH_NativeWindow_ReadFromParcel(parcel1, &nativeWindow2);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    if (nativeWindow1 != nativeWindow2) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }

    OH_NativeImage_Destroy(&_image);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow1);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowWriteToParcelAbNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0.
    GLuint textureId;
    glGenTextures(1, &textureId);
    auto _image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *window1 = nullptr;
    OHIPCParcel *parcel1 = OH_IPCParcel_Create();

    // 1.
    auto flag = OH_NativeWindow_ReadFromParcel(parcel1, &window1);
    if (window1 != nullptr) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    OH_NativeImage_Destroy(&_image);
    OH_NativeWindow_DestroyNativeWindow(window1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowReadFromParcelAbNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0.
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *window1 = result1.nativeWindow;
    OHIPCParcel *parcel1 = OH_IPCParcel_Create();

    // 1.
    auto flag = OH_NativeWindow_WriteToParcel(window1, parcel1);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    // 2.
    flag = OH_NativeWindow_WriteToParcel(window1, parcel1);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, window1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowWRParcelDifferent(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct result result1, result2;
    result1 = InitNativeWindow();
    result2 = InitNativeWindow();
    OH_NativeImage *image1 = result1.image;
    OHNativeWindow *window1 = result1.nativeWindow;
    OH_NativeImage *image2 = result2.image;
    OHNativeWindow *window2 = result2.nativeWindow;
    OHIPCParcel *parcel1 = OH_IPCParcel_Create();
    OHIPCParcel *parcel2 = OH_IPCParcel_Create();

    // 1.
    auto flag = OH_NativeWindow_WriteToParcel(window1, parcel1);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    // 2.
    flag = OH_NativeWindow_WriteToParcel(window1, parcel2);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    // 3.
    flag = OH_NativeWindow_WriteToParcel(window2, parcel1);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    DestroyNativeWindowImage(image1, window1);
    DestroyNativeWindowImage(image2, window2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowFlushBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0.
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    // 1.
    auto flag = OH_NativeWindow_NativeWindowFlushBuffer(nullptr, nativeWindowBuffer, fenceFd, region);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    // 2.
    flag = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nullptr, fenceFd, region);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowFlushBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 0.
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    // 1.
    auto flag = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    // 2.
    flag = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    if (flag != CONSTANT_41207000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowFlushBufferAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1.
    int fenceFdList[] = {-CONSTANT_999999999, -CONSTANT_1000, -CONSTANT_1, CONSTANT_0,
        CONSTANT_1, CONSTANT_1000, CONSTANT_999999999};
    for (int i = 0; i < sizeof(fenceFdList) / sizeof(int); ++i) {
        struct result result1 = InitNativeWindow();
        OH_NativeImage *image = result1.image;
        OHNativeWindow *nativeWindow = result1.nativeWindow;
        OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
        int fenceFd = -1;
        auto ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
        Region::Rect rect{
            .x = 0x100,
            .y = 0x100,
            .w = 0x100,
            .h = 0x100,
        };
        Region region{.rects = &rect};
        auto flag = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFdList[i], region);
        if (flag != 0) {
            napi_create_int32(env, i + 1, &result);
            return result;
        }

        DestroyNativeWindowImage(image, nativeWindow);
        OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

napi_value testNativeWindowNativeWindowFlushBufferErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    OH_NativeBuffer_Config config{
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *newBuffer = OH_NativeBuffer_Alloc(&config);
    nativeWindowBuffer = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(newBuffer);

    // 1.
    auto flag = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, -1, region);
    if (flag != CONSTANT_41210000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeBuffer_Unreference(newBuffer);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowGetLastFlushedBufferV2Nullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    float matrix[16];

    // 1.
    auto flag = OH_NativeWindow_GetLastFlushedBufferV2(nullptr, &nativeWindowBuffer, &fenceFd, matrix);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    // 2.
    flag = OH_NativeWindow_GetLastFlushedBufferV2(nativeWindow, nullptr, &fenceFd, matrix);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowGetLastFlushedBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    float matrix[16];

    // 1.
    auto flag = OH_NativeWindow_GetLastFlushedBuffer(nullptr, &nativeWindowBuffer, &fenceFd, matrix);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    // 2.
    flag = OH_NativeWindow_GetLastFlushedBuffer(nativeWindow, nullptr, &fenceFd, matrix);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowGetLastFlushedBufferV2Normal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    float matrix[16];
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    auto ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    auto flag = OH_NativeWindow_GetLastFlushedBufferV2(nativeWindow, &nativeWindowBuffer, &fenceFd, matrix);
    if (flag != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowGetLastFlushedBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    float matrix[16];
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    auto ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    auto flag = OH_NativeWindow_GetLastFlushedBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd, matrix);
    if (flag != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowSetBufferHold(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;

    OH_NativeWindow_SetBufferHold(nullptr);
    OH_NativeWindow_SetBufferHold(nativeWindow);

    DestroyNativeWindowImage(image, nativeWindow);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowGetNativeObjectMagicNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    auto flag = OH_NativeWindow_GetNativeObjectMagic(nullptr);
    if (flag != -1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowGetNativeObjectMagicNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer;
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    auto magicId = OH_NativeWindow_GetNativeObjectMagic(nativeWindow);
    if (magicId == -1) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    auto magicId2 = OH_NativeWindow_GetNativeObjectMagic(nativeWindow);
    if (magicId == -1) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    if (magicId != magicId2) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    auto magicId3 = OH_NativeWindow_GetNativeObjectMagic(nativeWindowBuffer);
    if (magicId2 == -1) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    auto magicId4 = OH_NativeWindow_GetNativeObjectMagic(nativeWindowBuffer);
    if (magicId2 == -1) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    if (magicId3 != magicId4) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeObjectReferenceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;

    auto magicId = OH_NativeWindow_NativeObjectReference(nullptr);
    if (magicId != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    magicId = OH_NativeWindow_NativeObjectReference(nativeWindowBuffer);
    if (magicId != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeObjectReferenceNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    auto magicId = OH_NativeWindow_NativeObjectReference(nativeWindow);
    if (magicId != 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    magicId = OH_NativeWindow_NativeObjectReference(nativeWindowBuffer);
    if (magicId != 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeObjectUnreferenceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;

    auto magicId = OH_NativeWindow_NativeObjectUnreference(nullptr);
    if (magicId != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    magicId = OH_NativeWindow_NativeObjectUnreference(nativeWindowBuffer);
    if (magicId != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeObjectUnreferenceNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    auto magicId = OH_NativeWindow_NativeObjectUnreference(nativeWindow);
    if (magicId != 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    magicId = OH_NativeWindow_NativeObjectUnreference(nativeWindowBuffer);
    if (magicId != 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowAttachBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    auto flag = OH_NativeWindow_NativeWindowAttachBuffer(nullptr, nativeWindowBuffer);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowDetachBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    auto flag = OH_NativeWindow_NativeWindowDetachBuffer(nullptr, nativeWindowBuffer);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    flag = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowDetachBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (flag != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    flag = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, nativeWindowBuffer);
    if (flag != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    flag = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, nativeWindowBuffer);
    if (flag != CONSTANT_41210000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowAttachBufferErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nwb1, *nwb2, *nwb3, *nwb4;
    int fenceFd = -1;
    OH_NativeBuffer_Config config{
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    OHNativeWindowBuffer **arr[] = {&nwb1, &nwb2, &nwb3, &nwb4};
    nwb1 = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(nativeBuffer);
    nwb2 = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(nativeBuffer);
    nwb3 = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(nativeBuffer);
    nwb4 = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(nativeBuffer);

    auto flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, nwb1);
    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, nwb2);
    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, nwb3);
    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, nwb4);
    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowAttachBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (flag != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, nativeWindowBuffer);
    if (flag != CONSTANT_41208000) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    flag = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, nativeWindowBuffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, nativeWindowBuffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }

    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowDetachBufferErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    auto ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    // 3.
    auto flag = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, nativeWindowBuffer);
    if (flag != CONSTANT_41207000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowAtDetachDifferentBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;
    OHNativeWindowBuffer *nativeWindowBuffer1, *nativeWindowBuffer2, *nativeWindowBuffer3;
    int fenceFd = -1;
    OHNativeWindowBuffer **nativeWindowBuffers[] = {&nativeWindowBuffer1, &nativeWindowBuffer2, &nativeWindowBuffer3};
    for (int i = 0; i < CONSTANT_3; ++i) {
        auto flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, nativeWindowBuffers[i], &fenceFd);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 + i + 1, &result);
            return result;
        }
    }

    for (int i = 0; i < CONSTANT_3; ++i) {
        auto flag = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, *nativeWindowBuffers[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + i + 1, &result);
            return result;
        }
    }

    for (int i = 0; i < CONSTANT_3; ++i) {
        auto flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, *nativeWindowBuffers[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + i + 1, &result);
            return result;
        }
    }

    DestroyNativeWindowImage(image, nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer1);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer2);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer3);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 0.
    OH_NativeImage *image1 = InitNativeWindow().image;
    OHNativeWindow *nativeWindow1 = InitNativeWindow().nativeWindow;
    OH_NativeImage *image2 = InitNativeWindow().image;
    OHNativeWindow *nativeWindow2 = InitNativeWindow().nativeWindow;
    OH_NativeBuffer_Config config{
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    OHNativeWindowBuffer *nativeWindowBuffer1 = nullptr, *nativeWindowBuffer2 = nullptr;
    // 1.
    int fenceFd = -1;
    nativeWindowBuffer1 = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(nativeBuffer);
    if (nativeWindowBuffer1 == nullptr) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    nativeWindowBuffer2 = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(nativeBuffer);
    if (nativeWindowBuffer2 == nullptr) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    // 2.
    int32_t flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow1, nativeWindowBuffer1);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow2, nativeWindowBuffer2);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image1, nativeWindow1);
    DestroyNativeWindowImage(image2, nativeWindow2);
    return result;
}

napi_value testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal2(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image1 = InitNativeWindow().image;
    OHNativeWindow *nativeWindow1 = InitNativeWindow().nativeWindow;
    OH_NativeImage *image2 = InitNativeWindow().image;
    OHNativeWindow *nativeWindow2 = InitNativeWindow().nativeWindow;
    OH_NativeBuffer_Config config{
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    OHNativeWindowBuffer *nativeWindowBuffer1 = nullptr, *nativeWindowBuffer2 = nullptr;
    // 3.
    auto flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow2, nativeWindowBuffer1);
    if (flag == 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow1, nativeWindowBuffer2);
    if (flag == 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    // 4.
    flag = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow1, nativeWindowBuffer1);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow2, nativeWindowBuffer2);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    // 5.
    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow2, nativeWindowBuffer1);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow1, nativeWindowBuffer2);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    DestroyNativeWindowImage(image1, nativeWindow1);
    DestroyNativeWindowImage(image2, nativeWindow2);
    return result;
}

napi_value testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    result = testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal1(env, info);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal2(env, info);
    if (result != nullptr) {
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int code = SET_BUFFER_GEOMETRY;
    auto flag = OH_NativeWindow_NativeWindowHandleOpt(nullptr, code, 100, 100);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    struct result result1 = InitNativeWindow();
    OH_NativeImage *image = result1.image;
    OHNativeWindow *nativeWindow = result1.nativeWindow;

    int arr[][2] = {{0, 0},        {2147483647, 2147483647},   {100, 100}, {-1000, -1000}, {-1000, 1000},
                    {1000, -1000}, {-2147483647, -2147483647}, {-1, -1}};
    int width1, height1;
    auto ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_BUFFER_GEOMETRY, &width1, &height1);
    if (ret != 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }

    for (int i = 0; i < sizeof(arr) / sizeof(int[2]); ++i) {
        int width = arr[i][0];
        int height = arr[i][1];
        auto flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
        if (flag != 0) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_1, &result);
            return result;
        }
        int width2, height2;
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_BUFFER_GEOMETRY, &height2, &width2);
        if (flag != 0) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_2, &result);
            return result;
        }
        if (width != width2 || height != height2) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_3, &result);
            return result;
        }
    }

    DestroyNativeWindowImage(image, nativeWindow);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image1 = InitNativeWindow().image;
    OHNativeWindow *nativeWindow = InitNativeWindow().nativeWindow;

    int32_t width, height;

    // 1.
    auto flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, NULL, NULL);
    if (flag != 0) { // 应为 非0
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_BUFFER_GEOMETRY, &height, &width);
    if (flag != 0) { // 应为 成功
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (width != 0 || height != 0) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    // 2.2147483648
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY,
        CONSTANT_9999999999999999999, CONSTANT_9999999999999999999);
    if (flag != 0) { // 应为 非0
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_BUFFER_GEOMETRY, &height, &width);
    if (flag != 0) { // 应为 成功
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    // 3.
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, "abc", "abc");
    if (flag != 0) { // 应为 失败
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }

    DestroyNativeWindowImage(image1, nativeWindow);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
