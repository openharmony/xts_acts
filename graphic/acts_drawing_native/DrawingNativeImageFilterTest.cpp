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

#include "drawing_bitmap.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_image.h"
#include "drawing_image_filter.h"
#include "effect/color_filter.h"
#include "effect/filter.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeImageFilterTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_ImageFilterCreateBlur
 * @tc.desc: test for OH_Drawing_ImageFilterCreateBlur.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeImageFilterTest, OH_Drawing_ImageFilterCreateBlur, TestSize.Level1) {
    OH_Drawing_ImageFilter *f = OH_Drawing_ImageFilterCreateBlur(1.0, 1.0, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(f, nullptr);
    OH_Drawing_ImageFilterDestroy(f);
}

/*
 * @tc.name: OH_Drawing_ImageFilterCreateFromColorFilter
 * @tc.desc: test for OH_Drawing_ImageFilterCreateFromColorFilter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeImageFilterTest, OH_Drawing_ImageFilterCreateFromColorFilter, TestSize.Level1) {
    OH_Drawing_ColorFilter *colorFilter =
        OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    OH_Drawing_ImageFilter *f = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
    EXPECT_NE(f, nullptr);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ImageFilterDestroy(f);
}

/*
 * @tc.name: OH_Drawing_ImageFilterDestroy
 * @tc.desc: test for OH_Drawing_ImageFilterDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeImageFilterTest, OH_Drawing_ImageFilterDestroy, TestSize.Level1) {
    OH_Drawing_ColorFilter *colorFilter =
        OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    OH_Drawing_ImageFilter *f = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
    EXPECT_NE(f, nullptr);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ImageFilterDestroy(f);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS