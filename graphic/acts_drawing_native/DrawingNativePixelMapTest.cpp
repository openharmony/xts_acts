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

#include "drawing_pixel_map.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativePixelMapTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_PixelMapGetFromNativePixelMap
 * @tc.desc: test for OH_Drawing_PixelMapGetFromNativePixelMap.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativePixelMapTest, OH_Drawing_PixelMapGetFromNativePixelMap, TestSize.Level1) {
    // todo: don't know how to get NativePixelMap_
    NativePixelMap_ *npm = nullptr;
    OH_Drawing_PixelMap *pm = OH_Drawing_PixelMapGetFromNativePixelMap(npm);
    EXPECT_EQ(pm, nullptr);
}

/*
 * @tc.name: OH_Drawing_PixelMapGetFromOhPixelMapNative
 * @tc.desc: test for OH_Drawing_PixelMapGetFromOhPixelMapNative.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativePixelMapTest, OH_Drawing_PixelMapGetFromOhPixelMapNative, TestSize.Level1) {
    // todo: don't know how to get OH_PixelmapNative
    OH_PixelmapNative *npm = nullptr;
    OH_Drawing_PixelMap *pm = OH_Drawing_PixelMapGetFromOhPixelMapNative(npm);
    EXPECT_EQ(pm, nullptr);
}

/*
 * @tc.name: OH_Drawing_PixelMapDissolve
 * @tc.desc: test for OH_Drawing_PixelMapDissolve.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativePixelMapTest, OH_Drawing_PixelMapDissolve, TestSize.Level1) {
    // todo: don't know how to get OH_Drawing_PixelMap
    OH_Drawing_PixelMap *npm = nullptr;
    OH_Drawing_PixelMapDissolve(npm);
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS