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
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_image_filter.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_shadow_layer.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "effect/color_filter.h"
#include "effect/filter.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingFilterTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_FilterSetImageFilter
 * @tc.desc: test for OH_Drawing_FilterSetImageFilter.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFilterTest, OH_Drawing_FilterSetImageFilter, TestSize.Level1) {
    OH_Drawing_Filter *cFilter_ = OH_Drawing_FilterCreate();
    EXPECT_NE(cFilter_, nullptr);
    OH_Drawing_ImageFilter *f = OH_Drawing_ImageFilterCreateBlur(1.0, 1.0, OH_Drawing_TileMode::MIRROR, nullptr);
    OH_Drawing_FilterSetImageFilter(cFilter_, f);
    OH_Drawing_FilterDestroy(cFilter_);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_FilterGetColorFilter
 * @tc.desc: test for OH_Drawing_FilterGetColorFilter.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFilterTest, OH_Drawing_FilterGetColorFilter, TestSize.Level1) {
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    EXPECT_NE(filter, nullptr);
    OH_Drawing_ColorFilter *colorFilter =
        OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    EXPECT_NE(colorFilter, nullptr);
    OH_Drawing_ColorFilter *colorFilterTmp = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    EXPECT_NE(colorFilterTmp, nullptr);
    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    OH_Drawing_FilterGetColorFilter(filter, colorFilterTmp);

    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ColorFilterDestroy(colorFilterTmp);
    OH_Drawing_FilterDestroy(filter);
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS