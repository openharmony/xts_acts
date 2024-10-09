/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "gtest/gtest.h"
#include "EGL/egl.h"
#include "EGL/eglext.h"
#include "GLES3/gl32.h"
#include "drawing_canvas.h"
#include "drawing_gpu_context.h"
#include "drawing_surface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeDrawingSurfaceLargeValueTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
protected:
    EGLDisplay eglDisplay_ = EGL_NO_DISPLAY;
    EGLConfig eglConfig_ = EGL_NO_CONFIG_KHR;
    EGLContext eglContext_ = EGL_NO_CONTEXT;
    EGLSurface eglSurface_ = EGL_NO_SURFACE;
    OH_Drawing_GpuContext* gpuContext_ = nullptr;
    OH_Drawing_Surface* surface_ = nullptr;
    OH_Drawing_Canvas* canvas_ = nullptr;
};

void NativeDrawingSurfaceLargeValueTest::SetUpTestCase() {}
void NativeDrawingSurfaceLargeValueTest::TearDownTestCase() {}
void NativeDrawingSurfaceLargeValueTest::SetUp()
{
    eglDisplay_ = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    EXPECT_NE(eglDisplay_, EGL_NO_DISPLAY);

    EGLint eglMajVers;
    EGLint eglMinVers;
    EGLBoolean ret = eglInitialize(eglDisplay_, &eglMajVers, &eglMinVers);
    EXPECT_EQ(ret, EGL_TRUE);

    EGLint count;
    EGLint configAttribs[] = { EGL_SURFACE_TYPE, EGL_WINDOW_BIT, EGL_RED_SIZE, 8,
        EGL_GREEN_SIZE, 8, EGL_BLUE_SIZE, 8,
        EGL_ALPHA_SIZE, 8, EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT, EGL_NONE };
    ret = eglChooseConfig(eglDisplay_, configAttribs, &eglConfig_, 1, &count);
    EXPECT_EQ(ret, EGL_TRUE);
    EXPECT_GE(count, 1);

    const EGLint contextAttribs[] = { EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE };
    eglContext_ = eglCreateContext(eglDisplay_, eglConfig_, EGL_NO_CONTEXT, contextAttribs);
    EXPECT_NE(eglContext_, EGL_NO_CONTEXT);

    EGLint attribs[] = {EGL_WIDTH, 1, EGL_HEIGHT, 1, EGL_NONE};
    eglSurface_ = eglCreatePbufferSurface(eglDisplay_, eglConfig_, attribs);
    EXPECT_NE(eglSurface_, EGL_NO_SURFACE);

    ret = eglMakeCurrent(eglDisplay_, eglSurface_, eglSurface_, eglContext_);
    EXPECT_EQ(ret, EGL_TRUE);
}

void NativeDrawingSurfaceLargeValueTest::TearDown()
{
    EGLBoolean ret = eglDestroySurface(eglDisplay_, eglSurface_);
    EXPECT_EQ(ret, EGL_TRUE);

    ret = eglDestroyContext(eglDisplay_, eglContext_);
    EXPECT_EQ(ret, EGL_TRUE);

    ret = eglTerminate(eglDisplay_);
    EXPECT_EQ(ret, EGL_TRUE);

    eglSurface_ = EGL_NO_SURFACE;
    eglContext_ = EGL_NO_CONTEXT;
    eglDisplay_ = EGL_NO_DISPLAY;
}

/*
 * @tc.name  : NativeDrawingSurfaceLargeValueTest_CreateFromGpuContext
 * @tc.desc  : test for CreateFromGpuContext.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingSurfaceLargeValueTest, NativeDrawingSurfaceLargeValueTest_CreateFromGpuContext, TestSize.Level1)
{
    OH_Drawing_GpuContextOptions options {true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);

    const int32_t width = 2160;
    const int32_t height = 4096;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);

    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, false, imageInfo);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);

    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(nullptr, false, imageInfo);
    EXPECT_EQ(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
}

/*
 * @tc.name  : NativeDrawingSurfaceLargeValueTest_GetCanvas
 * @tc.desc  : test for GetCanvas.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingSurfaceLargeValueTest, NativeDrawingSurfaceLargeValueTest_GetCanvas, TestSize.Level1)
{
    OH_Drawing_GpuContextOptions options {true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);

    const int32_t width = 2160;
    const int32_t height = 4096;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);

    canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
    EXPECT_NE(canvas_, nullptr);

    canvas_ = OH_Drawing_SurfaceGetCanvas(nullptr);
    EXPECT_EQ(canvas_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS