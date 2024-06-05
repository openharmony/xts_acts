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
class DrawingNativeBrushTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_BrushDestroy
 * @tc.desc: test for OH_Drawing_BrushDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushDestroy, TestSize.Level1) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushDestroy(brush);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_BrushGetAlpha
 * @tc.desc: test for OH_Drawing_BrushGetAlpha.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushGetAlpha, TestSize.Level1) {
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    constexpr uint8_t alpha = 128;
    OH_Drawing_BrushSetAlpha(brush1, alpha);
    EXPECT_EQ(OH_Drawing_BrushGetAlpha(brush1), alpha);
    OH_Drawing_BrushDestroy(brush1);
}

/*
 * @tc.name: OH_Drawing_BrushSetAlpha
 * @tc.desc: test for OH_Drawing_BrushSetAlpha.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushSetAlpha, TestSize.Level1) {
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    constexpr uint8_t alpha = 128;
    OH_Drawing_BrushSetAlpha(brush1, alpha);
    EXPECT_EQ(OH_Drawing_BrushGetAlpha(brush1), alpha);
    OH_Drawing_BrushDestroy(brush1);
}

/*
 * @tc.name: OH_Drawing_BrushIsAntiAlias
 * @tc.desc: test for OH_Drawing_BrushIsAntiAlias.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushIsAntiAlias, TestSize.Level1) {
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetAntiAlias(brush1, false);
    EXPECT_EQ(OH_Drawing_BrushIsAntiAlias(brush1), false);
    OH_Drawing_BrushDestroy(brush1);
}

/*
 * @tc.name: OH_Drawing_BrushSetAntiAlias
 * @tc.desc: test for OH_Drawing_BrushSetAntiAlias.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushSetAntiAlias, TestSize.Level1) {
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    EXPECT_NE(brush1, nullptr);
    OH_Drawing_BrushSetAntiAlias(brush1, true);
    OH_Drawing_BrushDestroy(brush1);
}

/*
 * @tc.name: OH_Drawing_BrushGetColor
 * @tc.desc: test for OH_Drawing_BrushGetColor.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushGetColor, TestSize.Level1) {
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush1, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush1), 0xFFFF0000);
    OH_Drawing_BrushDestroy(brush1);
}

/*
 * @tc.name: OH_Drawing_BrushSetColor
 * @tc.desc: test for OH_Drawing_BrushSetColor.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushSetColor, TestSize.Level1) {
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush1, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    OH_Drawing_BrushDestroy(brush1);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_BrushSetFilter
 * @tc.desc: test for OH_Drawing_BrushSetFilter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushSetFilter, TestSize.Level1) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush), 0xFFFF0000);
    OH_Drawing_ColorFilter *outerFilter = OH_Drawing_ColorFilterCreateLuma();
    OH_Drawing_ColorFilter *innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    OH_Drawing_ColorFilter *compose = OH_Drawing_ColorFilterCreateCompose(nullptr, nullptr);
    EXPECT_EQ(compose, nullptr);
    compose = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
    EXPECT_NE(compose, nullptr);
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    OH_Drawing_FilterSetColorFilter(filter, compose);
    OH_Drawing_BrushSetFilter(brush, filter);
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ColorFilterDestroy(outerFilter);
    OH_Drawing_ColorFilterDestroy(innerFilter);
    OH_Drawing_ColorFilterDestroy(compose);
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.name: OH_Drawing_BrushSetShaderEffect
 * @tc.desc: test for OH_Drawing_BrushSetShaderEffect.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushSetShaderEffect, TestSize.Level1) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2, OH_Drawing_TileMode::CLAMP);
    OH_Drawing_BrushSetShaderEffect(nullptr, linearGradient);
    OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    OH_Drawing_BrushSetShaderEffect(brush, linearGradient);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ShaderEffectDestroy(nullptr);
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.name: OH_Drawing_BrushSetShadowLayer
 * @tc.desc: test for OH_Drawing_BrushSetShadowLayer.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushSetShadowLayer, TestSize.Level1) {
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(3.f, -3.f, 3.f, 0xFF00FF00);
    EXPECT_NE(shadowLayer, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_BrushSetShadowLayer(nullptr, shadowLayer);
    OH_Drawing_BrushSetShadowLayer(brush, nullptr);
    OH_Drawing_BrushSetShadowLayer(brush, shadowLayer);
    OH_Drawing_ShadowLayerDestroy(shadowLayer);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.name: OH_Drawing_BrushGetFilter
 * @tc.desc: test for OH_Drawing_BrushGetFilter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushGetFilter, TestSize.Level1) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Filter *cFilter = OH_Drawing_FilterCreate();
    OH_Drawing_Filter *tmpFilter = OH_Drawing_FilterCreate();

    OH_Drawing_BrushSetFilter(brush, cFilter);
    OH_Drawing_BrushGetFilter(brush, tmpFilter);

    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FilterDestroy(cFilter);
    OH_Drawing_FilterDestroy(tmpFilter);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_BrushReset
 * @tc.desc: test for OH_Drawing_BrushReset.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeBrushTest, OH_Drawing_BrushReset, TestSize.Level1) {
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetAntiAlias(brush1, true);
    OH_Drawing_BrushSetColor(brush1, OH_Drawing_ColorSetArgb(0x00, 0xFF, 0x00, 0xFF));
    constexpr uint8_t alpha = 128;
    OH_Drawing_BrushSetAlpha(brush1, alpha);

    OH_Drawing_BrushReset(brush1);
    EXPECT_EQ(OH_Drawing_BrushIsAntiAlias(brush1), false);
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush1), 0xFF000000);
    EXPECT_EQ(OH_Drawing_BrushGetAlpha(brush1), 0xFF);

    OH_Drawing_BrushDestroy(brush1);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS