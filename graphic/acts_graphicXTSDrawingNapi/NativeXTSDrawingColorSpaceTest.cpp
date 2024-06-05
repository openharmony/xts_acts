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

#include "drawing_color_space.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingColorSpaceTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_ColorSpaceDestroy
 * @tc.desc: test for OH_Drawing_ColorSpaceDestroy.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingColorSpaceTest, OH_Drawing_ColorSpaceDestroy, TestSize.Level1) {
    OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgb();
    EXPECT_NE(colorSpace, nullptr);
    OH_Drawing_ColorSpaceDestroy(colorSpace);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS