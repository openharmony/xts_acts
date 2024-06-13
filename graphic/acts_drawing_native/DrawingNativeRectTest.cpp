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
#include "scalar.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeRectTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_RectCreate
 * @tc.desc: test for OH_Drawing_RectCreate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectCreate, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectIntersect
 * @tc.desc: test for OH_Drawing_RectIntersect.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectIntersect, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 300);
    EXPECT_NE(nullptr, rect);

    OH_Drawing_Rect *otherOne = OH_Drawing_RectCreate(300, 250, 600, 400);
    EXPECT_NE(nullptr, otherOne);

    OH_Drawing_Rect *otherTwo = OH_Drawing_RectCreate(600, 400, 700, 500);
    EXPECT_NE(nullptr, otherTwo);

    bool ret = OH_Drawing_RectIntersect(rect, otherOne);
    EXPECT_EQ(ret, true);

    ret = OH_Drawing_RectIntersect(rect, otherTwo);
    EXPECT_EQ(ret, false);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(otherOne);
    OH_Drawing_RectDestroy(otherTwo);
}

/*
 * @tc.name: OH_Drawing_RectJoin
 * @tc.desc: test for OH_Drawing_RectJoin.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectJoin, TestSize.Level1) {
    OH_Drawing_Rect *otherOne = OH_Drawing_RectCreate(300, 250, 600, 400);
    EXPECT_NE(nullptr, otherOne);

    OH_Drawing_Rect *otherTwo = OH_Drawing_RectCreate(600, 400, 700, 500);
    EXPECT_NE(nullptr, otherTwo);

    bool ret = OH_Drawing_RectJoin(otherOne, otherTwo);
    EXPECT_TRUE(ret);

    OH_Drawing_RectDestroy(otherOne);
    OH_Drawing_RectDestroy(otherTwo);
}

/*
 * @tc.name: OH_Drawing_RectSetLeft
 * @tc.desc: test for OH_Drawing_RectSetLeft.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectSetLeft, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectSetLeft(rect, 10);
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 10)); // 10 means left
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectSetTop
 * @tc.desc: test for OH_Drawing_RectSetTop.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectSetTop, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectSetTop(rect, 10);
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 10)); // 10 means top
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectSetRight
 * @tc.desc: test for OH_Drawing_RectSetRight.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectSetRight, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectSetRight(rect, 300);
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, 300)); // 300 means right
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectSetBottom
 * @tc.desc: test for OH_Drawing_RectSetBottom.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectSetBottom, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectSetBottom(rect, 400);
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 400)); // 400 means bottom
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectGetLeft
 * @tc.desc: test for OH_Drawing_RectGetLeft.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectGetLeft, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectSetLeft(rect, 10);
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 10)); // 10 means left
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectGetTop
 * @tc.desc: test for OH_Drawing_RectGetTop.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectGetTop, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectSetTop(rect, 10);
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 10)); // 10 means top
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectGetRight
 * @tc.desc: test for OH_Drawing_RectGetRight.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectGetRight, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectSetRight(rect, 300);
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, 300)); // 300 means right
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectGetBottom
 * @tc.desc: test for OH_Drawing_RectGetBottom.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectGetBottom, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectSetBottom(rect, 400);
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 400)); // 400 means bottom
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectGetHeight
 * @tc.desc: test for OH_Drawing_RectGetHeight.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectGetHeight, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    float height = OH_Drawing_RectGetHeight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(height, 800)); // 800 means height
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectGetWidth
 * @tc.desc: test for OH_Drawing_RectGetWidth.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectGetWidth, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 400, 800);
    float width = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(width, 400)); // 400 means height
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RectCopy
 * @tc.desc: test for OH_Drawing_RectCopy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectCopy, TestSize.Level1) {
    OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(0, 0, 400, 800);
    OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(11, 22, 333, 444);
    OH_Drawing_RectCopy(rectDst, rectSrc);
    float left = OH_Drawing_RectGetLeft(rectSrc);
    float top = OH_Drawing_RectGetTop(rectSrc);
    float right = OH_Drawing_RectGetRight(rectSrc);
    float bottom = OH_Drawing_RectGetBottom(rectSrc);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 11));    // 11 means left
    EXPECT_TRUE(IsScalarAlmostEqual(top, 22));     // 22 means top
    EXPECT_TRUE(IsScalarAlmostEqual(right, 333));  // 333 means right
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 444)); // 444 means bottom
    OH_Drawing_RectDestroy(rectSrc);
    OH_Drawing_RectDestroy(rectDst);
}

/*
 * @tc.name: OH_Drawing_RectDestroy
 * @tc.desc: test for OH_Drawing_RectDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRectTest, OH_Drawing_RectDestroy, TestSize.Level1) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RectDestroy(rect);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS