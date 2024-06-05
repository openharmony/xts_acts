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

#include "drawing_path.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeRegionTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_RegionSetRect
 * @tc.desc: test for OH_Drawing_RegionSetRect.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, OH_Drawing_RegionSetRect, TestSize.Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    EXPECT_TRUE(OH_Drawing_RegionSetRect(region, rect));
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RegionContains
 * @tc.desc: test for OH_Drawing_RegionContains.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, OH_Drawing_RegionContains, TestSize.Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(region, rect);

    int32_t x = 100;
    int32_t y = 100;
    bool ret = OH_Drawing_RegionContains(region, x, y);
    EXPECT_TRUE(ret);

    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RegionOp
 * @tc.desc: test for OH_Drawing_RegionOp.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, OH_Drawing_RegionOp, TestSize.Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(region, rect);

    OH_Drawing_Region *dst = OH_Drawing_RegionCreate();
    OH_Drawing_RegionSetRect(dst, rect);

    bool ret = OH_Drawing_RegionOp(region, dst, OH_Drawing_RegionOpMode::REGION_OP_MODE_INTERSECT);
    EXPECT_TRUE(ret);

    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(dst);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_RegionSetPath
 * @tc.desc: test for OH_Drawing_RegionSetPath.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, OH_Drawing_RegionSetPath, TestSize.Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(region, rect);

    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, 100, 0);
    OH_Drawing_PathLineTo(path, 100, 100);
    OH_Drawing_PathLineTo(path, 0, 100);
    OH_Drawing_PathClose(path);

    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();

    OH_Drawing_RegionSetPath(region, path, clip);

    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_RegionDestroy
 * @tc.desc: test for OH_Drawing_RegionDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, OH_Drawing_RegionDestroy, TestSize.Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_RegionDestroy(region);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS