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

#include "napi/native_api.h"
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl32.h>
#include <bits/alltypes.h>
#include <cstring>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <sys/mman.h>
#include <chrono>

#define SUCCESS 0
#define PARAM_0 0
#define PARAM_8 8
#define PARAM_1 1
#define PARAM_16 16
#define PARAM_800 800
#define PARAM_600 600
#define FAIL (-1)
#define ONEVAL 1
#define NUMMAX 16
#define TWOVAL 2
#define ARR_NUMBER_0 0
#define ARR_NUMBER_1 1
#define ARR_NUMBER_2 2
#define ARR_NUMBER_3 3
#define ARR_NUMBER_4 4
#define NUMBER_99999 99999
#define NUMBER_500 500

using GetPlatformDisplayExt = PFNEGLGETPLATFORMDISPLAYEXTPROC;
constexpr const char *EGL_EXT_PLATFORM_WAYLAND = "EGL_EXT_platform_wayland";
constexpr const char *EGL_KHR_PLATFORM_WAYLAND = "EGL_KHR_platform_wayland";
constexpr int32_t EGL_CONTEXT_CLIENT_VERSION_NUM = 2;
constexpr char CHARACTER_WHITESPACE = ' ';
constexpr const char *CHARACTER_STRING_WHITESPACE = " ";
constexpr const char *EGL_GET_PLATFORM_DISPLAY_EXT = "eglGetPlatformDisplayEXT";
EGLContext eglContext_ = EGL_NO_CONTEXT;
EGLDisplay eglDisplay_ = EGL_NO_DISPLAY;
static inline EGLConfig config_;

static bool CheckEglExtension(const char *extensions, const char *extension)
{
    size_t extlen = strlen(extension);
    const char *end = extensions + strlen(extensions);

    while (extensions < end) {
        size_t n = PARAM_0;
        if (*extensions == CHARACTER_WHITESPACE) {
            extensions++;
            continue;
        }
        n = strcspn(extensions, CHARACTER_STRING_WHITESPACE);
        if (n == extlen && strncmp(extension, extensions, n) == PARAM_0) {
            return true;
        }
        extensions += n;
    }
    return false;
}

static EGLDisplay GetPlatformEglDisplay(EGLenum platform, void *native_display, const EGLint *attrib_list)
{
    static GetPlatformDisplayExt eglGetPlatformDisplayExt = nullptr;

    if (!eglGetPlatformDisplayExt) {
        const char *extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
        if (extensions && (CheckEglExtension(extensions, EGL_EXT_PLATFORM_WAYLAND) ||
                           CheckEglExtension(extensions, EGL_KHR_PLATFORM_WAYLAND))) {
            eglGetPlatformDisplayExt = (GetPlatformDisplayExt)eglGetProcAddress(EGL_GET_PLATFORM_DISPLAY_EXT);
        }
    }

    if (eglGetPlatformDisplayExt) {
        return eglGetPlatformDisplayExt(platform, native_display, attrib_list);
    }

    return eglGetDisplay((EGLNativeDisplayType)native_display);
}

static void InitEGLEnv()
{
    eglDisplay_ = GetPlatformEglDisplay(EGL_PLATFORM_OHOS_KHR, EGL_DEFAULT_DISPLAY, nullptr);
    EGLint major, minor;
    eglInitialize(eglDisplay_, &major, &minor);
    eglBindAPI(EGL_OPENGL_ES_API);
    unsigned int ret;
    EGLint count;
    EGLint config_attribs[] = {EGL_SURFACE_TYPE, EGL_WINDOW_BIT, EGL_RED_SIZE,        PARAM_8,
                               EGL_GREEN_SIZE,   PARAM_8,        EGL_BLUE_SIZE,       PARAM_8,
                               EGL_ALPHA_SIZE,   PARAM_8,        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT,
                               EGL_NONE};

    ret = eglChooseConfig(eglDisplay_, config_attribs, &config_, PARAM_1, &count);
    static const EGLint context_attribs[] = {EGL_CONTEXT_CLIENT_VERSION, EGL_CONTEXT_CLIENT_VERSION_NUM, EGL_NONE};
    eglContext_ = eglCreateContext(eglDisplay_, config_, EGL_NO_CONTEXT, context_attribs);
    eglMakeCurrent(eglDisplay_, EGL_NO_SURFACE, EGL_NO_SURFACE, eglContext_);
}

int32_t g_callBack = 0;

void DealCallback(void * context)
{
    g_callBack++;
    return;
}

static void OnFrameAvailable(void *context)
{
    DealCallback(context);
    return;
}

static OH_NativeImage *getNativeImage()
{
    GLuint textureId = SUCCESS;
    glGenTextures(ONEVAL, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    return image;
}

static napi_value OHNativeImageCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image = getNativeImage();
    int backInfo = FAIL;
    if (image != nullptr) {
        backInfo = SUCCESS;
        OH_NativeImage_Destroy(&image);
    }

    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageAcquireNativeWindow(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backInfo = FAIL;
    OH_NativeImage *image = getNativeImage();

    if (image != nullptr) {
        OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
        if (nativeWindow != nullptr) {
            backInfo = SUCCESS;
        }
        OH_NativeImage_Destroy(&image);
    }
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageAcquireNativeWindowAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backInfo = FAIL;
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nullptr);
    if (nativeWindow != nullptr) {
        backInfo = SUCCESS;
    }
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageAttachContext(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    void *mappedAddr = mmap(handle->virAddr, handle->size, PROT_READ | PROT_WRITE, MAP_SHARED, handle->fd, PARAM_0);
    static uint32_t value = 0x00;
    value++;
    uint32_t *pixel = static_cast<uint32_t *>(mappedAddr);
    for (uint32_t x = PARAM_0; x < width; x++) {
        for (uint32_t y = PARAM_0; y < height; y++) {
            *pixel++ = value;
        }
    }
    munmap(mappedAddr, handle->size);

    Region region{nullptr, PARAM_0};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    OH_NativeImage_UpdateSurfaceImage(image);
    OH_NativeImage_GetTimestamp(image);
    float matrix[16];
    OH_NativeImage_GetTransformMatrix(image, matrix);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_DetachContext(image);
    GLuint textureId2;
    glGenTextures(PARAM_1, &textureId2);
    backInfo = OH_NativeImage_AttachContext(image, textureId2);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeImage_Destroy(&image);
    return result;
}

static napi_value OHNativeImageAttachContextAbnormal(napi_env env, napi_callback_info info)
{
    GLuint textureId2;
    glGenTextures(ONEVAL, &textureId2);
    int backInfo = OH_NativeImage_AttachContext(nullptr, textureId2);
    if (backInfo != SUCCESS) {
        backInfo = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageDetachContext(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    void *mappedAddr = mmap(handle->virAddr, handle->size, PROT_READ | PROT_WRITE, MAP_SHARED, handle->fd, PARAM_0);
    static uint32_t value = 0x00;
    value++;
    uint32_t *pixel = static_cast<uint32_t *>(mappedAddr);
    for (uint32_t x = PARAM_0; x < width; x++) {
        for (uint32_t y = PARAM_0; y < height; y++) {
            *pixel++ = value;
        }
    }
    munmap(mappedAddr, handle->size);

    Region region{nullptr, PARAM_0};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    OH_NativeImage_UpdateSurfaceImage(image);
    OH_NativeImage_GetTimestamp(image);
    float matrix[16];
    OH_NativeImage_GetTransformMatrix(image, matrix);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    backInfo = OH_NativeImage_DetachContext(image);
    GLuint textureId2;
    glGenTextures(PARAM_1, &textureId2);
    OH_NativeImage_AttachContext(image, textureId2);
    OH_NativeImage_Destroy(&image);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageDetachContextAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = OH_NativeImage_DetachContext(nullptr);
    if (backInfo != SUCCESS) {
        backInfo = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageUpdateSurfaceImage(napi_env env, napi_callback_info info)
{
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    void *mappedAddr = mmap(handle->virAddr, handle->size, PROT_READ | PROT_WRITE, MAP_SHARED, handle->fd, PARAM_0);
    static uint32_t value = 0x00;
    value++;
    uint32_t *pixel = static_cast<uint32_t *>(mappedAddr);
    for (uint32_t x = PARAM_0; x < width; x++) {
        for (uint32_t y = PARAM_0; y < height; y++) {
            *pixel++ = value;
        }
    }
    munmap(mappedAddr, handle->size);
    Region region{nullptr, PARAM_0};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    int backInfo = OH_NativeImage_UpdateSurfaceImage(image);
    OH_NativeImage_GetTimestamp(image);
    float matrix[16];
    OH_NativeImage_GetTransformMatrix(image, matrix);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_DetachContext(image);
    GLuint textureId2;
    glGenTextures(PARAM_1, &textureId2);
    OH_NativeImage_AttachContext(image, textureId2);
    OH_NativeImage_Destroy(&image);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageUpdateSurfaceImageBoundary(napi_env env, napi_callback_info info)
{
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 4096;
    int32_t height = 2160;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    void *mappedAddr = mmap(handle->virAddr, handle->size, PROT_READ | PROT_WRITE, MAP_SHARED, handle->fd, PARAM_0);
    static uint32_t value = 0x00;
    value++;
    uint32_t *pixel = static_cast<uint32_t *>(mappedAddr);
    for (uint32_t x = PARAM_0; x < width; x++) {
        for (uint32_t y = PARAM_0; y < height; y++) {
            *pixel++ = value;
        }
    }
    munmap(mappedAddr, handle->size);
    Region region{nullptr, PARAM_0};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    int backInfo = OH_NativeImage_UpdateSurfaceImage(image);
    OH_NativeImage_GetTimestamp(image);
    float matrix[16];
    OH_NativeImage_GetTransformMatrix(image, matrix);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_DetachContext(image);
    GLuint textureId2;
    glGenTextures(PARAM_1, &textureId2);
    OH_NativeImage_AttachContext(image, textureId2);
    OH_NativeImage_Destroy(&image);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageUpdateSurfaceImageAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = OH_NativeImage_UpdateSurfaceImage(nullptr);
    if (backInfo != SUCCESS) {
        backInfo = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageGetTimestamp(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeImage *image = getNativeImage();
    if (image != nullptr) {
        backInfo = OH_NativeImage_GetTimestamp(image);
        OH_NativeImage_Destroy(&image);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageGetTransformMatrix(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeImage *image = getNativeImage();
    if (image != nullptr) {
        float matrix[NUMMAX];
        backInfo = OH_NativeImage_GetTransformMatrix(image, matrix);
        OH_NativeImage_Destroy(&image);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageGetTransformMatrixAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    float matrix[NUMMAX];
    int ret = OH_NativeImage_GetTransformMatrix(nullptr, matrix);
    if (ret != SUCCESS) {
        backInfo = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageDestroy(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeImage *image = getNativeImage();
    OH_NativeImage_Destroy(&image);
    if (image == nullptr) {
        backInfo = SUCCESS;
    }
    
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageCreateNormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeImage *image = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    GLuint textureTarget = GL_TEXTURE_2D;
    image = OH_NativeImage_Create(textureId, textureTarget);
    if (image != nullptr) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeImage_Destroy(&image);
    return result;
}

static napi_value OHNativeImageCreateAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    
    OH_NativeImage *image = OH_NativeImage_Create(0, 1);
    if (image != nullptr) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeImage_Destroy(&image);
    return result;
}

static napi_value OHNativeImageDestroy1(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeImage *image = nullptr;
    GLenum nativeImageTexId_;
    GLuint GL_TEXTURE_EXTERNAL_OES;
    glGenTextures(1, &nativeImageTexId_);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
    image = OH_NativeImage_Create(nativeImageTexId_, GL_TEXTURE_EXTERNAL_OES);
    if (image != nullptr) {
        OH_NativeImage_Destroy(&image);
        if (image == nullptr) {
            backInfo = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeImageCreateMuch(napi_env env, napi_callback_info info)
{
    int backInfo = SUCCESS;
    const int count = NUMBER_500;
    OH_NativeImage *imageArray[500] = {nullptr};
    for (int i = 0; i < count; ++i) {
        GLuint GL_TEXTURE_EXTERNAL_OES;
        glBindTexture(GL_TEXTURE_EXTERNAL_OES, 1);
        imageArray[i] = OH_NativeImage_Create(1, GL_TEXTURE_EXTERNAL_OES);
        if (imageArray[i] == nullptr) {
            backInfo = FAIL;
            break;
        }
    }

    for (int i = 0; i < count; ++i) {
        if (imageArray[i] != nullptr) {
            OH_NativeImage_Destroy(&imageArray[i]); // 销毁单个图像
            if (imageArray[i] != nullptr) {
                backInfo = FAIL;
                break;
            }
        }
    }

    napi_value result = nullptr;
    if (backInfo == FAIL) {
        napi_create_int32(env, backInfo, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }

    return result;
}

static napi_value OHNativeImageAcquireNativeWindowNullptr(napi_env env, napi_callback_info info)
{
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nullptr);
    napi_value result = nullptr;
    if (nativeWindow != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHNativeImageAcquireNativeWindowNormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OHNativeWindow *nativeWindow1 = nullptr;
    OHNativeWindow *nativeWindow2 = nullptr;
    OH_NativeImage *nativeImage = getNativeImage();
    nativeWindow1 = OH_NativeImage_AcquireNativeWindow(nativeImage);
    if (nativeWindow1 != nullptr) {
        nativeWindow2 = OH_NativeImage_AcquireNativeWindow(nativeImage);
        if (nativeWindow1 == nativeWindow2) {
            backInfo = SUCCESS;
        }
    }
    
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageAttachContextNullptr(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    int res1 = OH_NativeImage_AttachContext(nullptr, textureId);
    if (res1 != 0) {
        napi_create_int32(env, FAIL, &result1);
    } else {
        napi_create_int32(env, SUCCESS, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    int res2 = OH_NativeImage_AttachContext(nativeImage, NULL);
    if (res2 != 0) {
        napi_create_int32(env, FAIL, &result2);
    } else {
        napi_create_int32(env, SUCCESS, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageDetachContextNullptr(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    napi_value result = nullptr;
    int res = OH_NativeImage_DetachContext(nullptr);
    if (res != 0) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageAttachContextNormal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    int res1 = OH_NativeImage_AttachContext(nativeImage, textureId);
    if (res1 == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    int res2 = OH_NativeImage_AttachContext(nativeImage, textureId);
    if (res2 == 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageDetachContextNormal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    int res1 = OH_NativeImage_DetachContext(nativeImage);
    if (res1 != 0) {
        napi_create_int32(env, FAIL, &result1);
    } else {
        napi_create_int32(env, SUCCESS, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    int res2 = OH_NativeImage_AttachContext(nativeImage, textureId);
    if (res2 == 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    int res3 = OH_NativeImage_DetachContext(nativeImage);
    if (res3 == 0) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUMBER_2, result3);

    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageGetSurfaceIdNullptr(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    uint64_t surfaceId = NUMBER_99999;
    int res1 = OH_NativeImage_GetSurfaceId(nullptr, &surfaceId);
    if (res1 != 0 && surfaceId == NUMBER_99999) {
        napi_create_int32(env, FAIL, &result1);
    } else {
        napi_create_int32(env, SUCCESS, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    int res2 = OH_NativeImage_GetSurfaceId(nullptr, NULL);
    if (res2 != 0 && surfaceId == NUMBER_99999) {
        napi_create_int32(env, FAIL, &result2);
    } else {
        napi_create_int32(env, SUCCESS, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeGetSurfaceIdNormal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    napi_value result = nullptr;
    uint64_t surfaceId = NUMBER_99999;
    int res = OH_NativeImage_GetSurfaceId(nativeImage, &surfaceId);
    if (res == 0 && surfaceId != NUMBER_99999) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }

    return result;
}

static napi_value OHNativeImageUpdateSurfaceImageNullptr(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    napi_value result = nullptr;
    int res = OH_NativeImage_UpdateSurfaceImage(nullptr);
    if (res != 0) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageGetTimestampNullptr(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    napi_value result = nullptr;
    int64_t timestamp = 0;
    timestamp = OH_NativeImage_GetTimestamp(nullptr);
    if (timestamp == 0) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageGetTransformMatrixNullptr(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    napi_value result = nullptr;
    float matrix[16];
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    int res1 = OH_NativeImage_GetTransformMatrix(nullptr, matrix);
    if (res1 == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    int res2 = OH_NativeImage_GetTransformMatrix(nativeImage, NULL);
    if (res2 == 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageGetTransformMatrixV2Nullptr(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = getNativeImage();
    napi_value result = nullptr;
    float matrix[16];
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    int res1 = OH_NativeImage_GetTransformMatrixV2(nullptr, matrix);
    if (res1 == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    int res2 = OH_NativeImage_GetTransformMatrixV2(nativeImage, NULL);
    if (res2 == 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageUpdateSurfaceImageNormal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = nullptr;
    napi_value result = nullptr;
    GLenum nativeImageTexId_;
    GLuint GL_TEXTURE_EXTERNAL_OES;
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
    nativeImage = OH_NativeImage_Create(nativeImageTexId_, GL_TEXTURE_EXTERNAL_OES);
    int res = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    if (res == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageGetTimestampNormal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = nullptr;
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    GLenum nativeImageTexId_;
    GLuint GL_TEXTURE_EXTERNAL_OES;
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
    nativeImage = OH_NativeImage_Create(nativeImageTexId_, GL_TEXTURE_EXTERNAL_OES);
    int res = OH_NativeImage_UpdateSurfaceImage(nativeImage);

    // 使用chrono获取当前时间点
    auto now = std::chrono::system_clock::now();
    // 将当前时间点转换为自1970年1月1日以来的毫秒数
    auto duration = now.time_since_epoch();
    auto current_timestamp = std::chrono::duration_cast<std::chrono::milliseconds>(duration).count();
    // 将chrono库获取的时间戳存储在int64_t类型的变量中
    int64_t time = static_cast<int64_t>(current_timestamp);

    int64_t timestamp = 0;
    timestamp = OH_NativeImage_GetTimestamp(nativeImage);

    if (res == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    if (timestamp == time) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    napi_value result3 = nullptr;
    int res1 = OH_NativeImage_UpdateSurfaceImage(nativeImage);

    auto now1 = std::chrono::system_clock::now();
    auto duration1 = now1.time_since_epoch();
    auto current_timestamp1 = std::chrono::duration_cast<std::chrono::milliseconds>(duration1).count();
    int64_t time1 = static_cast<int64_t>(current_timestamp);

    int64_t timestamp1 = 0;
    timestamp1 = OH_NativeImage_GetTimestamp(nativeImage);

    if (res1 == 0 && current_timestamp1 == time1) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUMBER_2, result3);

    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageGetTransformMatrixNormal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = nullptr;
    GLenum nativeImageTexId_;
    GLuint GL_TEXTURE_EXTERNAL_OES;
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
    nativeImage = OH_NativeImage_Create(nativeImageTexId_, GL_TEXTURE_EXTERNAL_OES);
    float matrix[16];
    float matrixNull[16] = {};
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    int res1 = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    if (res1 == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    OH_NativeImage_GetTransformMatrix(nativeImage, matrix);
    if (memcmp(matrix, matrixNull, sizeof(matrix)) == 0) {
        napi_create_int32(env, FAIL, &result2);
    } else {
        napi_create_int32(env, SUCCESS, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageGetTransformMatrixV2Normal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = nullptr;
    GLenum nativeImageTexId_;
    GLuint GL_TEXTURE_EXTERNAL_OES;
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
    nativeImage = OH_NativeImage_Create(nativeImageTexId_, GL_TEXTURE_EXTERNAL_OES);
    float matrixV2[16];
    float matrixNull[16] = {};
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    int res1 = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    if (res1 == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    OH_NativeImage_GetTransformMatrixV2(nativeImage, matrixV2);
    if (memcmp(matrixV2, matrixNull, sizeof(matrixV2)) == 0) {
        napi_create_int32(env, FAIL, &result2);
    } else {
        napi_create_int32(env, SUCCESS, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageSetOnFrameAvailableListenerNullptr(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage = nullptr;
    napi_value result = nullptr;
    OH_OnFrameAvailableListener listener;
    int res = OH_NativeImage_SetOnFrameAvailableListener(nullptr, listener);
    if (res == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHNativeImageUnSetOnFrameAvailableListenerNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int res = OH_NativeImage_UnsetOnFrameAvailableListener(nullptr);
    if (res == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }

    return result;
}

static napi_value OHNativeImageSetOnFrameAvailableListenerNormal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage1 = nullptr;
    nativeImage1 = OH_ConsumerSurface_Create();
    OH_OnFrameAvailableListener listener1;
    listener1.context = static_cast<void *>(nativeImage1);
    listener1.onFrameAvailable = OnFrameAvailable;
    napi_value result = nullptr;
    int res = OH_NativeImage_SetOnFrameAvailableListener(nativeImage1, listener1);
    if (res != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_value result2 = nullptr;
    res = OH_NativeImage_SetOnFrameAvailableListener(nativeImage1, listener1);
    if (res != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage *nativeImage2 = nullptr;
    nativeImage2 = OH_ConsumerSurface_Create();
    OH_OnFrameAvailableListener listener2;
    listener2.context = static_cast<void *>(nativeImage1);
    listener2.onFrameAvailable = OnFrameAvailable;
    res = OH_NativeImage_SetOnFrameAvailableListener(nativeImage1, listener2);
    if (res != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_value result4 = nullptr;
    res = OH_NativeImage_SetOnFrameAvailableListener(nativeImage2, listener1);
    if (res != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeImage_Destroy(&nativeImage1);
    OH_NativeImage_Destroy(&nativeImage2);
    return result;
}

static napi_value OHNativeImageUnsetOnFrameAvailableListenerNormal(napi_env env, napi_callback_info info)
{
    OH_NativeImage *nativeImage1 = getNativeImage();
    OH_OnFrameAvailableListener listener1;
    listener1.context = static_cast<void *>(nativeImage1);
    listener1.onFrameAvailable = OnFrameAvailable;
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_3, &result);
    napi_value result1 = nullptr;

    int res1 = OH_NativeImage_UnsetOnFrameAvailableListener(nativeImage1);
    if (res1 == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);

    napi_value result2 = nullptr;
    int res2 = OH_NativeImage_SetOnFrameAvailableListener(nativeImage1, listener1);
    if (res2 == 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);

    napi_value result3 = nullptr;
    int res3 = OH_NativeImage_UnsetOnFrameAvailableListener(nativeImage1);
    if (res3 == 0) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUMBER_2, result3);
    OH_NativeImage_Destroy(&nativeImage1);
    return result;
}

static napi_value OHNativeImageGetBufferMatrixNormal(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    GLuint textureId = 0;
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    OH_OnFrameAvailableListener listener;
    listener.context = static_cast<void *>(image);
    listener.onFrameAvailable = OnFrameAvailable;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(image, listener);
    OHNativeWindowBuffer *Buffer = nullptr;
    int fenceFd = -1;
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    int32_t width = 600;
    int32_t height = 800;
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, SET_BUFFER_GEOMETRY, width, height);
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, SET_TRANSFORM, NATIVEBUFFER_ROTATE_90);
    ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &Buffer, &fenceFd);
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, Buffer, fenceFd, *region);
    ret = OH_NativeImage_UpdateSurfaceImage(image);
    float matrix[16] = {-1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    ret = OH_NativeImage_GetBufferMatrix(image, matrix);
    for (int i = 0; i < 16; i++) {
        if (matrix[i] == -1) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        i++;
    }
    if (ret == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeImage_Destroy(&image);
    return result;
}

static napi_value OHNativeImageGetBufferMatrixNormal01(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    GLuint textureId = 0;
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    OH_OnFrameAvailableListener listener;
    listener.context = static_cast<void *>(image);
    listener.onFrameAvailable = OnFrameAvailable;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(image, listener);
    OHNativeWindowBuffer *Buffer = nullptr;
    int fenceFd = -1;
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    int32_t width = 600;
    int32_t height = 800;
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, SET_BUFFER_GEOMETRY, width, height);
    float matrix[16] = {-1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    ret = OH_NativeImage_GetBufferMatrix(image, matrix);
    for (int i = 0; i < 16; i++) {
        if (matrix[i] == -1) {
            napi_create_int32(env, ret, &result);
            return result;
        }
        i++;
    }
    if (ret == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, ret, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);
    ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &Buffer, &fenceFd);
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, Buffer, fenceFd, *region);
    ret = OH_NativeImage_UpdateSurfaceImage(image);
    int32_t ret1 = OH_NativeImage_GetBufferMatrix(image, matrix);
    if (ret1 == 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, ret, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    OH_NativeImage_Destroy(&image);
    return result;
}

static napi_value OHNativeImageGetBufferMatrixAbNormal(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_3, &result);
    OH_NativeImage *nativeImage = getNativeImage();
    float matrix[16];
    napi_value result1 = nullptr;
    int32_t ret = OH_NativeImage_GetBufferMatrix(nullptr, matrix);
    if (ret == 0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, ret, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);
    napi_value result2 = nullptr;
    int32_t ret1 = OH_NativeImage_GetBufferMatrix(nativeImage, nullptr);
    if (ret1 == 0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, ret1, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    napi_value result3 = nullptr;
    float matrix1[14];
    int32_t ret2 = OH_NativeImage_GetBufferMatrix(nativeImage, matrix1);
    if (ret2 == 0) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, ret2, &result3);
    }
    napi_set_element(env, result, ARR_NUMBER_2, result3);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

static napi_value OHNativeImageGetBufferMatrixCall(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    GLuint textureId = 0;
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    OH_OnFrameAvailableListener listener;
    listener.context = static_cast<void *>(image);
    listener.onFrameAvailable = OnFrameAvailable;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(image, listener);
    OHNativeWindowBuffer *Buffer = nullptr;
    int fenceFd = -1;
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    int32_t width = 600;
    int32_t height = 800;
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, SET_BUFFER_GEOMETRY, width, height);
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, SET_TRANSFORM, NATIVEBUFFER_ROTATE_90);
    ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &Buffer, &fenceFd);
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, Buffer, fenceFd, *region);
    ret = OH_NativeImage_UpdateSurfaceImage(image);
    float matrix[16] = {-1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    for (int i = 0; i < 1000; i++) {
        ret = OH_NativeImage_GetBufferMatrix(image, matrix);
    }
    for (int i = 0; i < 16; i++) {
        if (matrix[i] == -1) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        i++;
    }
    if (ret == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeImage_Destroy(&image);
    return result;
}

napi_value NativeImageInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHNativeImageCreate", nullptr, OHNativeImageCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageAcquireNativeWindow", nullptr, OHNativeImageAcquireNativeWindow, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageAcquireNativeWindowAbnormal", nullptr, OHNativeImageAcquireNativeWindowAbnormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageAttachContext", nullptr, OHNativeImageAttachContext, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeImageAttachContextAbnormal", nullptr, OHNativeImageAttachContextAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageDetachContext", nullptr, OHNativeImageDetachContext, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeImageDetachContextAbnormal", nullptr, OHNativeImageDetachContextAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageUpdateSurfaceImage", nullptr, OHNativeImageUpdateSurfaceImage, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageUpdateSurfaceImageBoundary", nullptr, OHNativeImageUpdateSurfaceImageBoundary, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageUpdateSurfaceImageAbnormal", nullptr, OHNativeImageUpdateSurfaceImageAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageGetTimestamp", nullptr, OHNativeImageGetTimestamp, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeImageGetTransformMatrix", nullptr, OHNativeImageGetTransformMatrix, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageGetTransformMatrixAbnormal", nullptr, OHNativeImageGetTransformMatrixAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageDestroy", nullptr, OHNativeImageDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageCreateNormal", nullptr, OHNativeImageCreateNormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeImageCreateAbnormal", nullptr, OHNativeImageCreateAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeImageDestroy1", nullptr, OHNativeImageDestroy1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageCreateMuch", nullptr, OHNativeImageCreateMuch, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(napi_property_descriptor), desc);
    return exports;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    NativeImageInit(env, exports);
    napi_property_descriptor desc[] = {
        {"oHNativeImageAcquireNativeWindowNullptr", nullptr, OHNativeImageAcquireNativeWindowNullptr, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageAcquireNativeWindowNormal", nullptr, OHNativeImageAcquireNativeWindowNormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageAttachContextNullptr", nullptr, OHNativeImageAttachContextNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageDetachContextNullptr", nullptr, OHNativeImageDetachContextNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageAttachContextNormal", nullptr, OHNativeImageAttachContextNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageDetachContextNormal", nullptr, OHNativeImageDetachContextNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageGetSurfaceIdNullptr", nullptr, OHNativeImageGetSurfaceIdNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeGetSurfaceIdNormal", nullptr, OHNativeGetSurfaceIdNormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeImageUpdateSurfaceImageNullptr", nullptr, OHNativeImageUpdateSurfaceImageNullptr, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageGetTimestampNullptr", nullptr, OHNativeImageGetTimestampNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageGetTransformMatrixNullptr", nullptr, OHNativeImageGetTransformMatrixNullptr, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageGetTransformMatrixV2Nullptr", nullptr, OHNativeImageGetTransformMatrixV2Nullptr, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageUpdateSurfaceImageNormal", nullptr, OHNativeImageUpdateSurfaceImageNormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageGetTimestampNormal", nullptr, OHNativeImageGetTimestampNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageGetTransformMatrixNormal", nullptr, OHNativeImageGetTransformMatrixNormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageGetTransformMatrixV2Normal", nullptr, OHNativeImageGetTransformMatrixV2Normal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageSetOnFrameAvailableListenerNullptr", nullptr, OHNativeImageSetOnFrameAvailableListenerNullptr,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageUnSetOnFrameAvailableListenerNullptr", nullptr,
         OHNativeImageUnSetOnFrameAvailableListenerNullptr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageSetOnFrameAvailableListenerNormal", nullptr, OHNativeImageSetOnFrameAvailableListenerNormal,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageUnsetOnFrameAvailableListenerNormal", nullptr, OHNativeImageUnsetOnFrameAvailableListenerNormal,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeImageGetBufferMatrixNormal", nullptr, OHNativeImageGetBufferMatrixNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageGetBufferMatrixNormal01", nullptr, OHNativeImageGetBufferMatrixNormal01, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageGetBufferMatrixAbNormal", nullptr, OHNativeImageGetBufferMatrixAbNormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageGetBufferMatrixCall", nullptr, OHNativeImageGetBufferMatrixCall, nullptr, nullptr, nullptr,
         napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativeimage",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); };
