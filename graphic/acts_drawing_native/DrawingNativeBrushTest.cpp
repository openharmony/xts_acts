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
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0100
 * @tc.name: testBrushCreateNormal
 * @tc.desc: test for testBrushCreateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCreateNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0200
 * @tc.name: testBrushCopyNormal
 * @tc.desc: test for testBrushCopyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象1
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetColor给画刷1设置画刷颜色
    OH_Drawing_BrushSetColor(brush1, 0x12345678);
    // 3、调用OH_Drawing_BrushCopy复制出一个画刷对象2
    OH_Drawing_Brush *brush2 = OH_Drawing_BrushCopy(brush1);
    // 4、调用OH_Drawing_BrushGetColor获取画刷对象2的颜色
    uint32_t color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, 0x12345678);
    // 5、调用OH_Drawing_BrushSetColor修改画刷对象1的颜色
    OH_Drawing_BrushSetColor(brush1, 0x87654321);
    // 6、调用OH_Drawing_BrushGetColor获取画刷对象2的颜色
    color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, 0x12345678);
    // 7、释放内存
    OH_Drawing_BrushDestroy(brush1);
    OH_Drawing_BrushDestroy(brush2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0201
 * @tc.name: testBrushCopyNull
 * @tc.desc: test for testBrushCopyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushCopy参数为空
    OH_Drawing_Brush *brushCopy = OH_Drawing_BrushCopy(nullptr);
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_BrushDestroy(brushCopy);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0202
 * @tc.name: testBrushCopyInputDestroyed
 * @tc.desc: test for testBrushCopyInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyInputDestroyed, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象1
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushCopy复制出一个画刷对象2
    OH_Drawing_Brush *brush2 = OH_Drawing_BrushCopy(brush1);
    // 3、调用OH_Drawing_BrushDestroy销毁画刷1
    OH_Drawing_BrushDestroy(brush1);
    // 4、调用OH_Drawing_BrushSetColor给画刷2设置颜色
    OH_Drawing_BrushSetColor(brush2, 0x12345678);
    // 5、调用OH_Drawing_BrushGetColor获取画刷2的颜色
    uint32_t color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, 0x12345678);
    // 6、释放内存
    OH_Drawing_BrushDestroy(brush2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0203
 * @tc.name: testBrushCopyMultipleCalls
 * @tc.desc: test for testBrushCopyMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyMultipleCalls, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、循环调用OH_Drawing_BrushCopy十次
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Brush *brushCopy = OH_Drawing_BrushCopy(brush);
        OH_Drawing_BrushDestroy(brushCopy);
    }
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0300
 * @tc.name: testBrushDestroyNormal
 * @tc.desc: test for testBrushDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushDestroyNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushDestroy销毁该对象
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0301
 * @tc.name: testBrushDestroyNull
 * @tc.desc: test for testBrushDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushDestroyNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushDestroy参数为空
    OH_Drawing_BrushDestroy(nullptr);
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0400
 * @tc.name: testBrushIsAntiAliasNormal
 * @tc.desc: test for testBrushIsAntiAliasNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushIsAntiAliasNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetAntiAlias设置抗锯齿属性为true
    OH_Drawing_BrushSetAntiAlias(brush, true);
    // 3、调用OH_Drawing_BrushIsAntiAlias查看返回值
    bool isAntiAlias = OH_Drawing_BrushIsAntiAlias(brush);
    EXPECT_EQ(isAntiAlias, true);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0401
 * @tc.name: testBrushIsAntiAliasNull
 * @tc.desc: test for testBrushIsAntiAliasNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushIsAntiAliasNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushIsAntiAlias参数为空
    OH_Drawing_BrushIsAntiAlias(nullptr);
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0500
 * @tc.name: testBrushSetAntiAliasNormal
 * @tc.desc: test for testBrushSetAntiAliasNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAntiAliasNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetAntiAlias设置抗锯齿属性为true
    OH_Drawing_BrushSetAntiAlias(brush, true);
    // 3、调用OH_Drawing_BrushIsAntiAlias查看返回值
    bool isAntiAlias = OH_Drawing_BrushIsAntiAlias(brush);
    EXPECT_EQ(isAntiAlias, true);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0501
 * @tc.name: testBrushSetAntiAliasNull
 * @tc.desc: test for testBrushSetAntiAliasNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAntiAliasNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetAntiAlias第一个参数为空
    OH_Drawing_BrushSetAntiAlias(nullptr, true);
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0600
 * @tc.name: testBrushGetColorNormal
 * @tc.desc: Test for testBrushGetColorNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetColorNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetColor给画刷设置颜色
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // 3、调用OH_Drawing_BrushGetColor获取画刷颜色
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0x12345678);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0601
 * @tc.name: testBrushGetColorNull
 * @tc.desc: Test for testBrushGetColorNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetColorNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushGetColor参数为空
    OH_Drawing_BrushGetColor(nullptr);
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0700
 * @tc.name: testBrushSetColorNormal
 * @tc.desc: Test for testBrushSetColorNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetColor给画刷设置颜色
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // 3、调用OH_Drawing_BrushGetColor获取画刷颜色
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0x12345678);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0701
 * @tc.name: testBrushSetColorNull
 * @tc.desc: Test for testBrushSetColorNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetColor第一个参数为空
    OH_Drawing_BrushSetColor(nullptr, 0x12345678);
    // 3、调用OH_Drawing_BrushSetColor第二个参数为0
    OH_Drawing_BrushSetColor(brush, 0);
    // 4、调用OH_Drawing_BrushGetColor获取画刷颜色
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 5、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0702
 * @tc.name: testBrushSetColorAbnormal
 * @tc.desc: Test for testBrushSetColorAbnormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetColor第二个参数传入负数或者浮点数等非uint32_t类型的参数
    OH_Drawing_BrushSetColor(brush, -1);
    // 传浮点会报错，忽略测试
    // 3、调用OH_Drawing_BrushGetColor获取画刷颜色
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, std::pow(2, 32) - 1);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0703
 * @tc.name: testBrushSetColorMaximum
 * @tc.desc: Test for testBrushSetColorMaximum.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorMaximum, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetColor第二个参数传入极大值0xFFFFFFFF+1
    OH_Drawing_BrushSetColor(brush, 0xFFFFFFFF + 1);
    // 3、调用OH_Drawing_BrushGetColor获取画刷颜色
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0800
 * @tc.name: testBrushGetAlphaNormal
 * @tc.desc: Test for testBrushGetAlphaNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetAlphaNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetAlpha设置透明度
    OH_Drawing_BrushSetAlpha(brush, 128);
    // 3、调用OH_Drawing_BrushGetAlpha获取透明度
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 128);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0801
 * @tc.name: testBrushGetAlphaNull
 * @tc.desc: Test for testBrushGetAlphaNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetAlphaNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushGetAlpha参数为空
    OH_Drawing_BrushGetAlpha(nullptr);
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0900
 * @tc.name: testBrushSetAlphaNormal
 * @tc.desc: Test for testBrushSetAlphaNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetAlpha设置透明度
    OH_Drawing_BrushSetAlpha(brush, 128);
    // 3、调用OH_Drawing_BrushGetAlpha获取透明度
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 128);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0901
 * @tc.name: testBrushSetAlphaNull
 * @tc.desc: Test for testBrushSetAlphaNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetAlpha第一个参数为空
    OH_Drawing_BrushSetAlpha(nullptr, 128);
    // 3、调用OH_Drawing_BrushSetAlpha第二个参数为0
    OH_Drawing_BrushSetAlpha(brush, 0);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0902
 * @tc.name: testBrushSetAlphaAbnormal
 * @tc.desc: Test for testBrushSetAlphaAbnormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetAlpha第二个参数传入负数或者浮点数等非uint8_t类型的参数
    OH_Drawing_BrushSetAlpha(brush, -1);
    // 3、调用OH_Drawing_BrushGetAlpha获取透明度
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 0xff);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0903
 * @tc.name: testBrushSetAlphaMaximum
 * @tc.desc: Test for testBrushSetAlphaMaximum.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaMaximum, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetAlpha第二个参数传入极大值0xFFFFFFFF+1
    OH_Drawing_BrushSetAlpha(brush, 0xFFFFFFFF + 1);
    // 3、调用OH_Drawing_BrushGetAlpha获取透明度
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 0);
    // 4、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1000
 * @tc.name: testBrushSetShaderEffectNormal
 * @tc.desc: Test for testBrushSetShaderEffectNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShaderEffectNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_ShaderEffectCreate创建一个着色器对象
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2, OH_Drawing_TileMode::CLAMP);
    // 3、调用OH_Drawing_BrushSetShaderEffect为画刷设置着色器效果
    OH_Drawing_BrushSetShaderEffect(brush, linearGradient);
    // 4、释放内存
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1001
 * @tc.name: testBrushSetShaderEffectNull
 * @tc.desc: Test for testBrushSetShaderEffectNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShaderEffectNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2, OH_Drawing_TileMode::CLAMP);
    // 2、调用OH_Drawing_BrushSetShaderEffect第一个参数为空
    OH_Drawing_BrushSetShaderEffect(nullptr, linearGradient);
    // 3、调用OH_Drawing_BrushSetShaderEffect第二个参数为空
    OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    // 4、释放内存
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1100
 * @tc.name: testBrushSetShadowLayerNormal
 * @tc.desc: Test for testBrushSetShadowLayerNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShadowLayerNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_ShaderLayerCreate创建一个阴影层对象
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(10, 10, 10, 0x12345678);
    // 3、调用OH_Drawing_BrushSetShadowLayer为画刷设置阴影层
    OH_Drawing_BrushSetShadowLayer(brush, shadowLayer);
    // 4、释放内存
    OH_Drawing_ShadowLayerDestroy(shadowLayer);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1101
 * @tc.name: testBrushSetShadowLayerNull
 * @tc.desc: Test for testBrushSetShadowLayerNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShadowLayerNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(10, 10, 10, 0x12345678);
    // 2、调用OH_Drawing_BrushSetShadowLayer第一个参数为空
    OH_Drawing_BrushSetShadowLayer(nullptr, shadowLayer);
    // 3、调用OH_Drawing_BrushSetShadowLayer第二个参数为空
    OH_Drawing_BrushSetShadowLayer(brush, nullptr);
    // 4、释放内存
    OH_Drawing_ShadowLayerDestroy(shadowLayer);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1200
 * @tc.name: testBrushSetFilterNormal
 * @tc.desc: Test for testBrushSetFilterNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetFilterNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_FilterCreate创建一个滤波器对象
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // 3、调用OH_Drawing_BrushSetFilter为画刷设置滤波器
    OH_Drawing_BrushSetFilter(brush, filter);
    // 4、释放内存
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1201
 * @tc.name: testBrushSetFilterNull
 * @tc.desc: Test for testBrushSetFilterNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetFilterNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // 2、调用OH_Drawing_BrushSetFilter第一个参数为空
    OH_Drawing_BrushSetFilter(nullptr, filter);
    // 3、调用OH_Drawing_BrushSetFilter第二个参数为空
    OH_Drawing_BrushSetFilter(brush, nullptr);
    // 4、释放内存
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1300
 * @tc.name: testBrushGetFilterNormal
 * @tc.desc: Test for testBrushGetFilterNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetFilterNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_FilterCreate创建一个滤波器对象
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // 3、调用OH_Drawing_BrushSetFilter为画刷设置滤波器
    OH_Drawing_BrushSetFilter(brush, filter);
    // 4、调用OH_Drawing_BrushGetFilter获取滤波器
    OH_Drawing_Filter *tmpFilter = OH_Drawing_FilterCreate();
    OH_Drawing_BrushGetFilter(brush, tmpFilter);
    // 5、释放内存
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_FilterDestroy(tmpFilter);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1301
 * @tc.name: testBrushGetFilterNull
 * @tc.desc: Test for testBrushGetFilterNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetFilterNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // 2、调用OH_Drawing_BrushGetFilter第一个参数为空
    OH_Drawing_BrushGetFilter(nullptr, filter);
    // 3、调用OH_Drawing_BrushGetFilter第二个参数为空
    OH_Drawing_BrushGetFilter(brush, nullptr);
    // 4、释放内存
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1400
 * @tc.name: testBrushSetBlendModeNormal
 * @tc.desc: Test for testBrushSetBlendModeNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetBlendModeNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetBlendMode遍历第二个参数的枚举
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < sizeof(blendMode) / sizeof(OH_Drawing_BlendMode); i++) {
        OH_Drawing_BrushSetBlendMode(brush, blendMode[i]);
    }
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1401
 * @tc.name: testBrushSetBlendModeNull
 * @tc.desc: Test for testBrushSetBlendModeNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetBlendModeNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushSetBlendMode参数为空
    OH_Drawing_BrushSetBlendMode(nullptr, BLEND_MODE_CLEAR);
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1500
 * @tc.name: testBrushResetNormal
 * @tc.desc: Test for testBrushResetNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushResetNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    uint32_t color1 = OH_Drawing_BrushGetColor(brush);
    // 2、调用OH_Drawing_BrushSetColor给画刷设置颜色
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // 3、调用OH_Drawing_BrushGetColor获取画刷颜色
    uint32_t color2 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color2, 0x12345678);
    // 4、调用OH_Drawing_BrushReset重置画刷状态
    OH_Drawing_BrushReset(brush);
    // 5、调用OH_Drawing_BrushGetColor获取画刷颜色
    uint32_t color3 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color3, color1);
    // 6、释放内存
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1501
 * @tc.name: testBrushResetNull
 * @tc.desc: Test for testBrushResetNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushResetNull, TestSize.Level3) {
    // 1、调用OH_Drawing_BrushCreate创建一个画刷对象
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2、调用OH_Drawing_BrushReset入参对象为空
    OH_Drawing_BrushReset(nullptr);
    // 3、释放内存
    OH_Drawing_BrushDestroy(brush);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS