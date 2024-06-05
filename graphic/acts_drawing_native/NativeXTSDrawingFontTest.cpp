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
#include "effect/color_filter.h"
#include "effect/filter.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingFontTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_FontSetBaselineSnap
 * @tc.desc: test for OH_Drawing_FontSetBaselineSnap.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetBaselineSnap, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetBaselineSnap(font, true);
    OH_Drawing_FontSetBaselineSnap(font, false);
    OH_Drawing_FontDestroy(font);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_FontIsBaselineSnap
 * @tc.desc: test for OH_Drawing_FontIsBaselineSnap.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontIsBaselineSnap, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetBaselineSnap(nullptr, true);
    EXPECT_EQ(OH_Drawing_FontIsBaselineSnap(nullptr), false);
    OH_Drawing_FontSetBaselineSnap(nullptr, false);
    EXPECT_EQ(OH_Drawing_FontIsBaselineSnap(nullptr), false);
    OH_Drawing_FontSetBaselineSnap(font, true);
    EXPECT_EQ(OH_Drawing_FontIsBaselineSnap(font), true);
    OH_Drawing_FontSetBaselineSnap(font, false);
    EXPECT_EQ(OH_Drawing_FontIsBaselineSnap(font), false);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetSubpixel
 * @tc.desc: test for OH_Drawing_FontSetSubpixel.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetSubpixel, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetSubpixel(nullptr, false);
    EXPECT_EQ(OH_Drawing_FontIsSubpixel(nullptr), false);
    OH_Drawing_FontSetSubpixel(nullptr, true);
    EXPECT_EQ(OH_Drawing_FontIsSubpixel(nullptr), false);
    OH_Drawing_FontSetSubpixel(font, true);
    EXPECT_EQ(OH_Drawing_FontIsSubpixel(font), true);
    OH_Drawing_FontSetSubpixel(font, false);
    EXPECT_EQ(OH_Drawing_FontIsSubpixel(font), false);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontIsSubpixel
 * @tc.desc: test for OH_Drawing_FontIsSubpixel.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontIsSubpixel, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetSubpixel(nullptr, false);
    EXPECT_EQ(OH_Drawing_FontIsSubpixel(nullptr), false);
    OH_Drawing_FontSetSubpixel(nullptr, true);
    EXPECT_EQ(OH_Drawing_FontIsSubpixel(nullptr), false);
    OH_Drawing_FontSetSubpixel(font, true);
    EXPECT_EQ(OH_Drawing_FontIsSubpixel(font), true);
    OH_Drawing_FontSetSubpixel(font, false);
    EXPECT_EQ(OH_Drawing_FontIsSubpixel(font), false);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetForceAutoHinting
 * @tc.desc: test for OH_Drawing_FontSetForceAutoHinting.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetForceAutoHinting, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    EXPECT_EQ(OH_Drawing_FontIsForceAutoHinting(nullptr), false);
    OH_Drawing_FontSetForceAutoHinting(nullptr, true);
    EXPECT_EQ(OH_Drawing_FontIsForceAutoHinting(font), false);
    OH_Drawing_FontSetForceAutoHinting(font, true);
    EXPECT_EQ(OH_Drawing_FontIsForceAutoHinting(font), true);
    OH_Drawing_FontSetForceAutoHinting(font, false);
    EXPECT_EQ(OH_Drawing_FontIsForceAutoHinting(font), false);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontIsForceAutoHinting
 * @tc.desc: test for OH_Drawing_FontIsForceAutoHinting.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontIsForceAutoHinting, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    EXPECT_EQ(OH_Drawing_FontIsForceAutoHinting(nullptr), false);
    OH_Drawing_FontSetForceAutoHinting(nullptr, true);
    EXPECT_EQ(OH_Drawing_FontIsForceAutoHinting(font), false);
    OH_Drawing_FontSetForceAutoHinting(font, true);
    EXPECT_EQ(OH_Drawing_FontIsForceAutoHinting(font), true);
    OH_Drawing_FontSetForceAutoHinting(font, false);
    EXPECT_EQ(OH_Drawing_FontIsForceAutoHinting(font), false);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontGetTextSize
 * @tc.desc: test for OH_Drawing_FontGetTextSize.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontGetTextSize, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetTextSize(font, 100);
    float size = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(size, 100);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontTextToGlyphs
 * @tc.desc: test for OH_Drawing_FontTextToGlyphs.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontTextToGlyphs, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 100); // 100 means font text size
    EXPECT_NE(font, nullptr);
    const char *str = "hello world";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_EQ(11, count); // 11 means str length

    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, 0, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, 0);
    EXPECT_EQ(0, glyphsCount);

    glyphsCount =
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(11, glyphsCount); // 11 means glyphsCount
}

/*
 * @tc.name: OH_Drawing_FontGetWidths
 * @tc.desc: test for OH_Drawing_FontGetWidths.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontGetWidths, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 100); // 100 means font text size
    EXPECT_NE(font, nullptr);
    const char *str = "hello world";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_EQ(11, count); // 11 means str length

    uint16_t glyphs[50] = {0}; // 50 means glyphs array number
    int glyphsCount = 0;

    glyphsCount =
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(11, glyphsCount); // 11 means glyphsCount

    float widths[50] = {0.f}; // 50 means widths array number
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths);
    EXPECT_EQ(58.0, widths[0]); // 58.0 means glyphs[0] width
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontIsLinearText
 * @tc.desc: test for OH_Drawing_FontIsLinearText.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontIsLinearText, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    bool ret = OH_Drawing_FontIsLinearText(font);
    EXPECT_EQ(ret, false);
    OH_Drawing_FontSetLinearText(font, true);
    ret = OH_Drawing_FontIsLinearText(font);
    EXPECT_EQ(ret, true);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontGetTextSkewX
 * @tc.desc: test for OH_Drawing_FontGetTextSkewX.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontGetTextSkewX, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetTextSkewX(font, 10);
    float size = OH_Drawing_FontGetTextSkewX(font);
    EXPECT_EQ(size, 10);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontIsFakeBoldText
 * @tc.desc: test for OH_Drawing_FontIsFakeBoldText.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontIsFakeBoldText, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    bool ret = OH_Drawing_FontIsFakeBoldText(font);
    EXPECT_EQ(ret, false);
    OH_Drawing_FontSetFakeBoldText(font, true);
    ret = OH_Drawing_FontIsFakeBoldText(font);
    EXPECT_EQ(ret, true);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetScaleX
 * @tc.desc: test for OH_Drawing_FontSetScaleX.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetScaleX, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetScaleX(nullptr, 2);
    EXPECT_TRUE(OH_Drawing_FontGetScaleX(nullptr) == -1);
    EXPECT_TRUE(OH_Drawing_FontGetScaleX(font) == 1);
    OH_Drawing_FontSetScaleX(font, 2);
    EXPECT_TRUE(OH_Drawing_FontGetScaleX(font) == 2);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontGetScaleX
 * @tc.desc: test for OH_Drawing_FontGetScaleX.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontGetScaleX, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetScaleX(nullptr, 2);
    EXPECT_TRUE(OH_Drawing_FontGetScaleX(nullptr) == -1);
    EXPECT_TRUE(OH_Drawing_FontGetScaleX(font) == 1);
    OH_Drawing_FontSetScaleX(font, 2);
    EXPECT_TRUE(OH_Drawing_FontGetScaleX(font) == 2);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetHinting
 * @tc.desc: test for OH_Drawing_FontSetHinting.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetHinting, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    EXPECT_TRUE(OH_Drawing_FontGetHinting(nullptr) == OH_Drawing_FontHinting::FONT_HINTING_NONE);
    OH_Drawing_FontSetHinting(font, OH_Drawing_FontHinting::FONT_HINTING_NONE);
    EXPECT_TRUE(OH_Drawing_FontGetHinting(font) == OH_Drawing_FontHinting::FONT_HINTING_NONE);
    OH_Drawing_FontSetHinting(font, OH_Drawing_FontHinting::FONT_HINTING_SLIGHT);
    EXPECT_TRUE(OH_Drawing_FontGetHinting(font) == OH_Drawing_FontHinting::FONT_HINTING_SLIGHT);
    OH_Drawing_FontSetHinting(font, OH_Drawing_FontHinting::FONT_HINTING_SLIGHT);
    EXPECT_TRUE(OH_Drawing_FontGetHinting(font) == OH_Drawing_FontHinting::FONT_HINTING_SLIGHT);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontGetHinting
 * @tc.desc: test for OH_Drawing_FontGetHinting.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontGetHinting, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    EXPECT_TRUE(OH_Drawing_FontGetHinting(nullptr) == OH_Drawing_FontHinting::FONT_HINTING_NONE);
    OH_Drawing_FontSetHinting(font, OH_Drawing_FontHinting::FONT_HINTING_NONE);
    EXPECT_TRUE(OH_Drawing_FontGetHinting(font) == OH_Drawing_FontHinting::FONT_HINTING_NONE);
    OH_Drawing_FontSetHinting(font, OH_Drawing_FontHinting::FONT_HINTING_SLIGHT);
    EXPECT_TRUE(OH_Drawing_FontGetHinting(font) == OH_Drawing_FontHinting::FONT_HINTING_SLIGHT);
    OH_Drawing_FontSetHinting(font, OH_Drawing_FontHinting::FONT_HINTING_SLIGHT);
    EXPECT_TRUE(OH_Drawing_FontGetHinting(font) == OH_Drawing_FontHinting::FONT_HINTING_SLIGHT);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetEmbeddedBitmaps
 * @tc.desc: test for OH_Drawing_FontSetEmbeddedBitmaps.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetEmbeddedBitmaps, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    EXPECT_TRUE(OH_Drawing_FontIsEmbeddedBitmaps(nullptr) == false);
    OH_Drawing_FontSetEmbeddedBitmaps(font, true);
    EXPECT_TRUE(OH_Drawing_FontIsEmbeddedBitmaps(font) == true);
    OH_Drawing_FontSetEmbeddedBitmaps(font, false);
    EXPECT_TRUE(OH_Drawing_FontIsEmbeddedBitmaps(font) == false);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontIsEmbeddedBitmaps
 * @tc.desc: test for OH_Drawing_FontIsEmbeddedBitmaps.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontIsEmbeddedBitmaps, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    EXPECT_TRUE(OH_Drawing_FontIsEmbeddedBitmaps(nullptr) == false);
    OH_Drawing_FontSetEmbeddedBitmaps(font, true);
    EXPECT_TRUE(OH_Drawing_FontIsEmbeddedBitmaps(font) == true);
    OH_Drawing_FontSetEmbeddedBitmaps(font, false);
    EXPECT_TRUE(OH_Drawing_FontIsEmbeddedBitmaps(font) == false);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetEdging
 * @tc.desc: test for OH_Drawing_FontSetEdging.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetEdging, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_ANTI_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(nullptr), OH_Drawing_FontEdging::FONT_EDGING_ALIAS);
    OH_Drawing_FontSetEdging(nullptr, OH_Drawing_FontEdging::FONT_EDGING_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_ANTI_ALIAS);
    OH_Drawing_FontSetEdging(font, OH_Drawing_FontEdging::FONT_EDGING_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_ALIAS);
    OH_Drawing_FontSetEdging(font, OH_Drawing_FontEdging::FONT_EDGING_ANTI_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_ANTI_ALIAS);
    OH_Drawing_FontSetEdging(font, OH_Drawing_FontEdging::FONT_EDGING_SUBPIXEL_ANTI_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_SUBPIXEL_ANTI_ALIAS);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontGetEdging
 * @tc.desc: test for OH_Drawing_FontGetEdging.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontGetEdging, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_ANTI_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(nullptr), OH_Drawing_FontEdging::FONT_EDGING_ALIAS);
    OH_Drawing_FontSetEdging(nullptr, OH_Drawing_FontEdging::FONT_EDGING_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_ANTI_ALIAS);
    OH_Drawing_FontSetEdging(font, OH_Drawing_FontEdging::FONT_EDGING_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_ALIAS);
    OH_Drawing_FontSetEdging(font, OH_Drawing_FontEdging::FONT_EDGING_ANTI_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_ANTI_ALIAS);
    OH_Drawing_FontSetEdging(font, OH_Drawing_FontEdging::FONT_EDGING_SUBPIXEL_ANTI_ALIAS);
    EXPECT_EQ(OH_Drawing_FontGetEdging(font), OH_Drawing_FontEdging::FONT_EDGING_SUBPIXEL_ANTI_ALIAS);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontDestroy
 * @tc.desc: test for OH_Drawing_FontDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontDestroy, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetFakeBoldText
 * @tc.desc: test for OH_Drawing_FontSetFakeBoldText.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetFakeBoldText, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    bool ret = OH_Drawing_FontIsFakeBoldText(font);
    EXPECT_EQ(ret, false);
    OH_Drawing_FontSetFakeBoldText(font, true);
    ret = OH_Drawing_FontIsFakeBoldText(font);
    EXPECT_EQ(ret, true);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetLinearText
 * @tc.desc: test for OH_Drawing_FontSetLinearText.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetLinearText, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    bool ret = OH_Drawing_FontIsLinearText(font);
    EXPECT_EQ(ret, false);
    OH_Drawing_FontSetLinearText(font, true);
    ret = OH_Drawing_FontIsLinearText(font);
    EXPECT_EQ(ret, true);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetTextSize
 * @tc.desc: test for OH_Drawing_FontSetTextSize.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetTextSize, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetTextSize(font, 100);
    float size = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(size, 100);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontCountText
 * @tc.desc: test for OH_Drawing_FontCountText.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontCountText, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 100); // 100 means font text size
    EXPECT_NE(font, nullptr);
    const char *str = "hello world";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_EQ(11, count); // 11 means str length
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetTextSkewX
 * @tc.desc: test for OH_Drawing_FontSetTextSkewX.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetTextSkewX, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetTextSkewX(font, 10);
    float size = OH_Drawing_FontGetTextSkewX(font);
    EXPECT_EQ(size, 10);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: OH_Drawing_FontSetTypeface
 * @tc.desc: test for OH_Drawing_FontSetTypeface.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontSetTypeface, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
}

/*
 * @tc.name: OH_Drawing_FontGetTypeface
 * @tc.desc: test for OH_Drawing_FontGetTypeface.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingFontTest, OH_Drawing_FontGetTypeface, TestSize.Level1) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile(nullptr, 0);
    EXPECT_EQ(nullptr, typeface);
    OH_Drawing_FontGetTypeface(nullptr);
    EXPECT_EQ(nullptr, typeface);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    EXPECT_NE(nullptr, OH_Drawing_FontGetTypeface(font));
    OH_Drawing_FontDestroy(font);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS