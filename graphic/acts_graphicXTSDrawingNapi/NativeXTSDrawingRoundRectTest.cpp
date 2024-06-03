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

#include "drawing_color.h"
#include "drawing_filter.h"
#include "drawing_mask_filter.h"
#include "drawing_rect.h"
#include "drawing_round_rect.h"
#include "utils/scalar.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingRoundRectTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_RoundRectCreate
 * @tc.desc: test for OH_Drawing_RoundRectCreate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingRoundRectTest, OH_Drawing_RoundRectCreate, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.name: OH_Drawing_RoundRectSetCorner
 * @tc.desc: test for OH_Drawing_RoundRectSetCorner.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingRoundRectTest, OH_Drawing_RoundRectSetCorner, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 0, 0);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_RoundRectSetCorner(nullptr, OH_Drawing_CornerPos::CORNER_POS_BOTTOM_LEFT, {10, 10});
    OH_Drawing_RoundRectSetCorner(roundRect, OH_Drawing_CornerPos::CORNER_POS_BOTTOM_LEFT, {10, 10});
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.name: OH_Drawing_RoundRectGetCorner
 * @tc.desc: test for OH_Drawing_RoundRectGetCorner.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingRoundRectTest, OH_Drawing_RoundRectGetCorner, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 0, 0);
    OH_Drawing_RoundRectSetCorner(nullptr, OH_Drawing_CornerPos::CORNER_POS_BOTTOM_LEFT, {10, 10});
    OH_Drawing_RoundRectSetCorner(roundRect, OH_Drawing_CornerPos::CORNER_POS_BOTTOM_LEFT, {10, 10});
    OH_Drawing_Corner_Radii radiusPoint =
        OH_Drawing_RoundRectGetCorner(roundRect, OH_Drawing_CornerPos::CORNER_POS_BOTTOM_LEFT);
    EXPECT_EQ(10.0f, radiusPoint.x);
    EXPECT_EQ(10.0f, radiusPoint.y);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.name: OH_Drawing_RoundRectDestroy
 * @tc.desc: test for OH_Drawing_RoundRectDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingRoundRectTest, OH_Drawing_RoundRectDestroy, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS