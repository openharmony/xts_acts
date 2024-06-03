/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "gtest/gtest.h"

#include "EGL/egl.h"
#include "EGL/eglext.h"
#include "GLES3/gl32.h"
#include "drawing_gpu_context.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingGpuContextTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_GpuContextCreateFromGL
 * @tc.desc: test for OH_Drawing_GpuContextCreateFromGL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingGpuContextTest, OH_Drawing_GpuContextCreateFromGL, TestSize.Level1) {
    // todo cpp crash when OH_Drawing_GpuContextCreateFromGL
    EXPECT_TRUE(false);
}

/*
 * @tc.name: OH_Drawing_GpuContextDestroy
 * @tc.desc: test for OH_Drawing_GpuContextDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingGpuContextTest, OH_Drawing_GpuContextDestroy, TestSize.Level1) {
    // todo cpp crash when OH_Drawing_GpuContextCreateFromGL
    EXPECT_TRUE(false);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS