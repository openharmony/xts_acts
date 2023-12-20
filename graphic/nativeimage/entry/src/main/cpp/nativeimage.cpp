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
#include <native_image.h>
#define SUCCESS 0
#define FAIL (-1)
#define ONEVAL 1
#define NUMMAX 16
#define TWOVAL 2

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
static const EGLint surfaceAttr[] = {EGL_WIDTH, 1, EGL_HEIGHT, 1, EGL_NONE};

static const EGLint confAttr[] = {EGL_SURFACE_TYPE, EGL_WINDOW_BIT,
                                  EGL_BLUE_SIZE,    8,
                                  EGL_GREEN_SIZE,   8,
                                  EGL_RED_SIZE,     8,
                                  EGL_ALPHA_SIZE,   8,
                                  EGL_DEPTH_SIZE,   16,
                                  EGL_NONE};
static napi_value OHNativeImageAttachContext(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeImage *image = getNativeImage();
    if (image != nullptr) {
        GLuint textureId2;
        glGenTextures(ONEVAL, &textureId2);
        backInfo = OH_NativeImage_AttachContext(image, textureId2);
        OH_NativeImage_Destroy(&image);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
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
    EGLDisplay m_eglDisplay;
    EGLConfig m_eglConf;
    EGLint numConfigs;
    EGLint config_size = ONEVAL;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);
    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, TWOVAL, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    eglMakeCurrent(m_eglDisplay, m_eglSurface, m_eglSurface, m_eglCtx);
    GLuint textureId;
    glGenTextures(ONEVAL, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    GLuint textureId2;
    glGenTextures(ONEVAL, &textureId2);
    OH_NativeImage_AttachContext(image, textureId2);
    int32_t ret = OH_NativeImage_DetachContext(image);
    OH_NativeImage_Destroy(&image);

    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
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
    int backInfo = FAIL;
    OH_NativeImage *image = getNativeImage();
    if (image != nullptr) {
        EGLDisplay m_eglDisplay;
        EGLConfig m_eglConf;
        EGLint numConfigs;
        EGLint config_size = ONEVAL;
        m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
        eglInitialize(m_eglDisplay, nullptr, nullptr);
        eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);
        EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
        const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, TWOVAL, EGL_NONE};
        EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
        eglMakeCurrent(m_eglDisplay, m_eglSurface, m_eglSurface, m_eglCtx);
        GLuint textureId;
        glGenTextures(ONEVAL, &textureId);
        OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        GLuint textureId2;
        glGenTextures(ONEVAL, &textureId2);
        OH_NativeImage_AttachContext(image, textureId2);
        backInfo = OH_NativeImage_UpdateSurfaceImage(image);
        OH_NativeImage_Destroy(&image);
        eglDestroyContext(m_eglDisplay, m_eglCtx);
        eglDestroySurface(m_eglDisplay, m_eglSurface);
        eglReleaseThread();
        eglTerminate(m_eglDisplay);
    }
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

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
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
        {"oHNativeImageUpdateSurfaceImageAbnormal", nullptr, OHNativeImageUpdateSurfaceImageAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageGetTimestamp", nullptr, OHNativeImageGetTimestamp, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeImageGetTransformMatrix", nullptr, OHNativeImageGetTransformMatrix, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeImageGetTransformMatrixAbnormal", nullptr, OHNativeImageGetTransformMatrixAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeImageDestroy", nullptr, OHNativeImageDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
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
