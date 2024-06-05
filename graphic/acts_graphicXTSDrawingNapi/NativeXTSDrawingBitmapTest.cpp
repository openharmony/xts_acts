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
class NativeXTSDrawingBitmapTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0100
 * @tc.name: 00.testBitmapDestroyNormal
 * @tc.desc: test for OH_Drawing_BitmapDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0100, TestSize.Level0) {
    // step 1
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    // step 2
    OH_Drawing_BitmapDestroy(cBitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0101
 * @tc.name: 01.testBitmapDestroyNull
 * @tc.desc: test for OH_Drawing_BitmapDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0101, TestSize.Level3) {
    OH_Drawing_BitmapDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0300
 * @tc.name: 00.testBitmapBuildNormal
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0300, TestSize.Level0) {
    const unsigned int width = 500;
    const unsigned int height = 500;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    OH_Drawing_AlphaFormat alphaFormat_;

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();

    // step 2
    for (int i = 1; i < 4; i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[i]};
        OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
        if (bitmap == nullptr) {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[0]);
        } else {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[i]);
        }
    }

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0301
 * @tc.name: 01.testBitmapBuildNull
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0301, TestSize.Level3) {
    const unsigned int width = 500;
    const unsigned int height = 500;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[0]};

    if (0) {
        // todo cpp crash
        // step 2
        OH_Drawing_BitmapBuild(nullptr, width, height, &bitmapFormat);
        // step 3
        OH_Drawing_BitmapBuild(bitmap, 0, height, &bitmapFormat);
        // step 4
        OH_Drawing_BitmapBuild(bitmap, width, 0, &bitmapFormat);
        // step 5
        OH_Drawing_BitmapBuild(bitmap, width, height, nullptr);
    }

    // step 6
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0302
 * @tc.name: 02.testBitmapBuildMultipleCalls
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0302, TestSize.Level3) {
    const unsigned int width = 500;
    const unsigned int height = 500;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    OH_Drawing_AlphaFormat alphaFormat_;

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();

    // step 2
    for (int i = 1; i < 4; i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[i]};
        OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
        if (bitmap == nullptr) {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[0]);
        }
        alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
        EXPECT_EQ(alphaFormat_, alphaFormats[i]);
    }

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);

    // step 4
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap *bitmap2 = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap2, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap2, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap2);
    EXPECT_NE(pixels, nullptr);
    uint32_t rowBytes = width * height * 4;
    OH_Drawing_Bitmap *bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // step 5
    for (int i = 1; i < 4; i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[i]};
        OH_Drawing_BitmapBuild(bitmap3, width, height, &bitmapFormat);
        alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap3);
        EXPECT_EQ(alphaFormat_, alphaFormats[i]);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0400
 * @tc.name: 00.testBitmapGetXXNormal
 * @tc.desc: test for testBitmapGetXXNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0400, TestSize.Level0) {
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 100;
    uint32_t height = 100;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    OH_Drawing_Image_Info imageInfo1{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels1 = new uint32_t[width * height];

    // step 1
    bool res = OH_Drawing_BitmapReadPixels(cBitmap, &imageInfo1, pixels1, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 2
    uint32_t w = OH_Drawing_BitmapGetWidth(cBitmap);
    EXPECT_EQ(w, 100);

    // step 3
    uint32_t h = OH_Drawing_BitmapGetHeight(cBitmap);
    EXPECT_EQ(h, 100);

    // step 5
    OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(cBitmap);
    EXPECT_EQ(colorFormat_, COLOR_FORMAT_RGBA_8888);

    // step 5
    OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(cBitmap);
    EXPECT_EQ(alphaFormat_, ALPHA_FORMAT_OPAQUE);

    // step 6
    void *pixels = OH_Drawing_BitmapGetPixels(cBitmap);
    EXPECT_NE(pixels, nullptr);

    // step 7
    OH_Drawing_Image_Info *imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(cBitmap, imageInfo);
    EXPECT_EQ(width, imageInfo->width);
    EXPECT_EQ(height, imageInfo->height);

    // step 8
    OH_Drawing_BitmapDestroy(cBitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0401
 * @tc.name: 01.testBitmapGetXXNull
 * @tc.desc: test for testBitmapGetXXNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0401, TestSize.Level3) {
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 100;
    uint32_t height = 100;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    // step 1
    uint32_t w = OH_Drawing_BitmapGetWidth(nullptr);
    EXPECT_EQ(w, 0);

    // step 2
    uint32_t h = OH_Drawing_BitmapGetHeight(nullptr);
    EXPECT_EQ(h, 0);

    // step 3
    OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(nullptr);
    EXPECT_EQ(colorFormat_, 0);

    // step 4
    OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(nullptr);
    EXPECT_EQ(alphaFormat_, 0);

    // step 5
    void *pixels = OH_Drawing_BitmapGetPixels(nullptr);
    EXPECT_EQ(pixels, nullptr);

    // step 6
    OH_Drawing_Image_Info *imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(nullptr, imageInfo);

    OH_Drawing_BitmapGetImageInfo(cBitmap, nullptr);

    OH_Drawing_BitmapDestroy(cBitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0402
 * @tc.name: 02.testBitmapGetXXInputDestroyed
 * @tc.desc: test for testBitmapGetXXInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0402, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0500
 * @tc.name: 00.testBitmapReadPixelsNormal
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0500, TestSize.Level0) {
    const unsigned int width = 500;
    const unsigned int height = 500;

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    // don't know how to test

    // step 5
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0501
 * @tc.name: 01.testBitmapReadPixelsNull
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0501, TestSize.Level3) {
    const unsigned int width = 500;
    const unsigned int height = 500;

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(nullptr, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, false);

    // step 4
    res = OH_Drawing_BitmapReadPixels(bitmap, nullptr, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, false);

    // step 5
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, nullptr, width * 4, 0, 0);
    EXPECT_EQ(res, false);

    // step 6
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, 0, 0, 0);
    EXPECT_EQ(res, false);

    // step 7
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 0, 1);
    EXPECT_EQ(res, true);

    // step 8
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 1, 0);
    EXPECT_EQ(res, true);

    // step 9
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0502
 * @tc.name: 02.testBitmapReadPixelsInputDestroyed
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0502, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0503
 * @tc.name: 03.testBitmapReadPixelsMismatch
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingBitmapTest, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_BITMAP_0503, TestSize.Level3) {
    // step 1
    const unsigned int width = 500;
    const unsigned int height = 500;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();

    // step 2
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);

    // step 3
    OH_Drawing_Image_Info imageInfo{1, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    OH_Drawing_Image_Info imageInfo2{width, 1, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo2, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 5
    // don't know how to get a invalid OH_Drawing_ColorFormat

    // step 6
    // don't know how to get a invalid OH_Drawing_AlphaFormat

    // step 7
    // don't know how to test

    // step 8
    OH_Drawing_Image_Info imageInfo5{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo5, pixels, width * 4, 1000, 0);
    EXPECT_EQ(res, false);

    // step 9
    OH_Drawing_Image_Info imageInfo6{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo6, pixels, width * 4, 0, 1000);
    EXPECT_EQ(res, false);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS