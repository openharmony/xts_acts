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
#include "drawing_text_blob.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeColorFilterTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_ColorFilterCreateBlendMode
 * @tc.desc: test for OH_Drawing_ColorFilterCreateBlendMode.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeColorFilterTest, OH_Drawing_ColorFilterCreateBlendMode, TestSize.Level1) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();

    OH_Drawing_BrushSetColor(brush, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush), 0xFFFF0000);
    OH_Drawing_ColorFilter *colorFilter =
        OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    EXPECT_NE(colorFilter, nullptr);
    OH_Drawing_ColorFilter *colorFilterTmp = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    EXPECT_NE(colorFilterTmp, nullptr);
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    EXPECT_NE(filter, nullptr);

    OH_Drawing_FilterSetColorFilter(nullptr, colorFilter);
    OH_Drawing_FilterSetColorFilter(filter, nullptr);
    OH_Drawing_FilterGetColorFilter(filter, colorFilterTmp);

    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    OH_Drawing_FilterGetColorFilter(filter, colorFilterTmp);

    OH_Drawing_BrushSetFilter(brush, nullptr);
    OH_Drawing_BrushSetFilter(brush, filter);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_ColorFilter *linear = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    OH_Drawing_FilterSetColorFilter(filter, linear);
    OH_Drawing_CanvasTranslate(canvas, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_ColorFilter *luma = OH_Drawing_ColorFilterCreateLuma();
    OH_Drawing_FilterSetColorFilter(filter, luma);
    OH_Drawing_CanvasTranslate(canvas, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    const float matrix[20] = {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0.5f, 0};
    OH_Drawing_ColorFilter *matrixFilter = OH_Drawing_ColorFilterCreateMatrix(nullptr);
    EXPECT_EQ(matrixFilter, nullptr);
    matrixFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    EXPECT_NE(matrixFilter, nullptr);
    OH_Drawing_FilterSetColorFilter(filter, matrixFilter);
    OH_Drawing_CanvasTranslate(canvas, 300, 300);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ColorFilterDestroy(luma);
    OH_Drawing_ColorFilterDestroy(matrixFilter);
    OH_Drawing_ColorFilterDestroy(linear);
    OH_Drawing_ColorFilterDestroy(colorFilterTmp);
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_FilterDestroy(nullptr);

    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.name: OH_Drawing_ColorFilterDestroy
 * @tc.desc: test for OH_Drawing_ColorFilterDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeColorFilterTest, OH_Drawing_ColorFilterDestroy, TestSize.Level1) {
    OH_Drawing_ColorFilter *cColorFilter_ = OH_Drawing_ColorFilterCreateBlendMode(0xFF0000FF, BLEND_MODE_COLOR);
    OH_Drawing_ColorFilterDestroy(cColorFilter_);
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS