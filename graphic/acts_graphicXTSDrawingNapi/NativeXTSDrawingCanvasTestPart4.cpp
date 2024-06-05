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
#include <climits>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingCanvasTestPart4 : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2800
 * @tc.name: 00.testCanvasScaleNormal
 * @tc.desc: test for 00.testCanvasScaleNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2800, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasScale
    OH_Drawing_CanvasScale(canvas, 1.0, 1.0);
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2801
 * @tc.name: 01.testCanvasScaleNull
 * @tc.desc: test for 01.testCanvasScaleNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2801, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasScale with the first parameter as null
    OH_Drawing_CanvasScale(nullptr, 2, 2);
    // 3. OH_Drawing_CanvasScale with the second parameter as 0
    OH_Drawing_CanvasScale(canvas, 0, 2);
    // 4. OH_Drawing_CanvasScale with the third parameter as 0
    OH_Drawing_CanvasScale(canvas, 2, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2802
 * @tc.name: 02.testCanvasScaleAbnormal
 * @tc.desc: test for 02.testCanvasScaleAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2802, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasScale with a negative scaling factor sx in the x-axis direction
    OH_Drawing_CanvasScale(canvas, -1, 1);
    // 3. OH_Drawing_CanvasScale with a negative scaling factor sy in the y-axis direction
    OH_Drawing_CanvasScale(canvas, 1, -1);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2803
 * @tc.name: 03.testCanvasScaleMaximum
 * @tc.desc: test for 03.testCanvasScaleMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2803, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasScale with the scaling factor sx in the x-axis direction as the maximum value
    OH_Drawing_CanvasScale(canvas, FLT_MAX, 1);
    // 3. OH_Drawing_CanvasScale with the scaling factor sy in the y-axis direction as the maximum value
    OH_Drawing_CanvasScale(canvas, 1, FLT_MAX);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2804
 * @tc.name: 04.testCanvasScaleInputDestroyed
 * @tc.desc: test for 04.testCanvasScaleInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2804, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2805
 * @tc.name: 05.testCanvasScaleMultipleCalls
 * @tc.desc: test for 05.testCanvasScaleMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2805, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_CanvasScale 10 times, each time with a different compression ratio
    for (int i = 0; i < 10; i++) {
        float scale = i * 0.1; // Compression ratio
        OH_Drawing_CanvasScale(canvas, scale, scale);
    }
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2900
 * @tc.name: 00.testCanvasSkewNormal
 * @tc.desc: test for 00.testCanvasSkewNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2900, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasSkew with positive skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, 1.0, 1.0);
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect1);
    // 4. OH_Drawing_CanvasSkew with negative skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, -1.0, -1.0);
    // 5. Call drawing class interface
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect2);
    // 6. OH_Drawing_CanvasSkew with positive skew value on the x-axis and negative skew value on the y-axis
    OH_Drawing_CanvasSkew(canvas, 1.0, -1.0);
    // 7. Call drawing class interface
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect3);
    // 8. Free memory
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2901
 * @tc.name: 01.testCanvasSkewNull
 * @tc.desc: test for 01.testCanvasSkewNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2901, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasSkew with the first parameter as null
    OH_Drawing_CanvasSkew(nullptr, 2, 2);
    // 3. OH_Drawing_CanvasSkew with the second parameter as 0
    OH_Drawing_CanvasSkew(canvas, 0, 2);
    // 4. OH_Drawing_CanvasSkew with the third parameter as 0
    OH_Drawing_CanvasSkew(canvas, 2, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2903
 * @tc.name: 03.testCanvasSkewMaximum
 * @tc.desc: test for 03.testCanvasSkewMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2903, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasSkew with the skew amount sx on the x-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, FLT_MAX, 1);
    // 3. OH_Drawing_CanvasSkew with the skew amount sy on the y-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, 1, FLT_MAX);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2904
 * @tc.name: 04.testCanvasSkewInputDestroyed
 * @tc.desc: test for 04.testCanvasSkewInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2904, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2905
 * @tc.name: 05.testCanvasSkewMultipleCalls
 * @tc.desc: test for 05.testCanvasSkewMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2905, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_CanvasSkew 10 times, each time with a different skew value
    for (int i = 0; i < 10; i++) {
        float skew = i * 0.1;
        OH_Drawing_CanvasSkew(canvas, skew, skew);
    }
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3000
 * @tc.name: 00.testCanvasGetWidthtestCanvasGetHeightNormal
 * @tc.desc: test for 00.testCanvasGetWidthtestCanvasGetHeightNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3000, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Switch the binding to a bitmap canvas using OH_Drawing_CanvasBind, and verify the canvas information by
    // calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);
    int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
    int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
    EXPECT_EQ(canvasWidth, width);
    EXPECT_EQ(canvasHeight, height);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3001
 * @tc.name: 01.testCanvasGetWidthtestCanvasGetHeightNull
 * @tc.desc: test for 01.testCanvasGetWidthtestCanvasGetHeightNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3001, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasGetHeight with null input
    int32_t canvasHeight = OH_Drawing_CanvasGetHeight(nullptr);
    EXPECT_EQ(canvasHeight, 0);
    // 3. OH_Drawing_CanvasGetWidth with null input
    int32_t canvasWidth = OH_Drawing_CanvasGetWidth(nullptr);
    EXPECT_EQ(canvasWidth, 0);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3002
 * @tc.name: 02.testCanvasGetWidthtestCanvasGetHeightMultipleCalls
 * @tc.desc: test for 02.testCanvasGetWidthtestCanvasGetHeightMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3002, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < 10; i++) {
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, 200 + 90);
        EXPECT_EQ(canvasHeight, 200 + 90);
    }

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3003
 * @tc.name: 03.testCanvasGetWidthtestCanvasGetHeightInputDestroyed
 * @tc.desc: test for 03.testCanvasGetWidthtestCanvasGetHeightInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3003, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3100
 * @tc.name: 00.testCanvasGetLocalClipBoundsNormal
 * @tc.desc: test for 00.testCanvasGetLocalClipBoundsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3100, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. OH_Drawing_CanvasGetLocalClipBounds
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 4. OH_Drawing_CanvasDrawRect
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3101
 * @tc.name: 01.testCanvasGetLocalClipBoundsNull
 * @tc.desc: test for 01.testCanvasGetLocalClipBoundsNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3101, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. OH_Drawing_CanvasGetLocalClipBounds with the first parameter as null
    OH_Drawing_CanvasGetLocalClipBounds(nullptr, rect);
    // 4. OH_Drawing_CanvasGetLocalClipBounds with the second parameter as null
    OH_Drawing_CanvasGetLocalClipBounds(canvas, nullptr);
    // 5. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with left, top, right, bottom as 0
    rect = OH_Drawing_RectCreate(0, 100, 100, 100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 0, 100, 100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 0, 100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 100, 0);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 6. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with all values as 0
    rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3102
 * @tc.name: 02.testCanvasGetLocalClipBoundsAbnormal
 * @tc.desc: test for 02.testCanvasGetLocalClipBoundsAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3102, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with negative values for left, top, right,
    // and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-100, 100, 100, 100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, -100, 100, 100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, -100, 100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 100, -100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 3. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate or the top-left coordinate equal to the bottom-right coordinate
    rect = OH_Drawing_RectCreate(100, 200, 200, 200);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(200, 100, 200, 200);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 4. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate
    rect = OH_Drawing_RectCreate(100, 100, 100, 100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 5. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate greater than
    // the bottom-right coordinate
    rect = OH_Drawing_RectCreate(200, 200, 100, 100);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);

    // 6. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3103
 * @tc.name: 03.testCanvasGetLocalClipBoundsMultipleCalls
 * @tc.desc: test for 03.testCanvasGetLocalClipBoundsMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3103, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200;
        uint32_t height = 200;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 4. Call OH_Drawing_CanvasGetLocalClipBounds 10 times to verify the canvas
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3104
 * @tc.name: 04.testCanvasGetLocalClipBoundsInputDestroyed
 * @tc.desc: test for 04.testCanvasGetLocalClipBoundsInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3104, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3200
 * @tc.name: 00.testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal
 * @tc.desc: test for 00.testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3200, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    EXPECT_NE(totalMatrix, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(totalMatrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3201
 * @tc.name: 01.testCanvasConcatMatrixNull
 * @tc.desc: test for 01.testCanvasConcatMatrixNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3201, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. OH_Drawing_CanvasConcatMatrix with the first parameter as null
    OH_Drawing_CanvasConcatMatrix(nullptr, matrix);
    // 4. OH_Drawing_CanvasConcatMatrix with the second parameter as null
    OH_Drawing_CanvasConcatMatrix(canvas, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3202
 * @tc.name: 02.testCanvasGetTotalMatrixNull
 * @tc.desc: test for 02.testCanvasGetTotalMatrixNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3202, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 3. OH_Drawing_CanvasGetTotalMatrix with the first parameter as null
    OH_Drawing_CanvasGetTotalMatrix(nullptr, matrix);
    // 4. OH_Drawing_CanvasGetTotalMatrix with the second parameter as null
    OH_Drawing_CanvasGetTotalMatrix(canvas, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3203
 * @tc.name: 03.testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls
 * @tc.desc: test for 03.testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3203, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_MatrixCreateScale
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(10, 10, 10, 10);
    // 3. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    // 4. OH_Drawing_MatrixCreateRotation
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, 1, 1);
    // 5. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
    OH_Drawing_Matrix *totalMatrix2 = OH_Drawing_MatrixCreate();
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);
    // 6. OH_Drawing_MatrixCreateTranslation
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateTranslation(10, 10);
    // 7. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
    OH_Drawing_Matrix *totalMatrix3 = OH_Drawing_MatrixCreate();
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);
    // 8. Repeat steps 2-7 10 times
    for (int i = 0; i < 10; i++) {
        matrix = OH_Drawing_MatrixCreateScale(10, 10, 10, 10);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
        totalMatrix = OH_Drawing_MatrixCreate();
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);

        matrix2 = OH_Drawing_MatrixCreateRotation(180, 1, 1);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
        totalMatrix2 = OH_Drawing_MatrixCreate();
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);

        matrix3 = OH_Drawing_MatrixCreateTranslation(10, 10);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
        totalMatrix3 = OH_Drawing_MatrixCreate();
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);
    }
    // 9. Call OH_Drawing_CanvasConcatMatrix 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    }

    // 10. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(totalMatrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3204
 * @tc.name: 04.testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed
 * @tc.desc: test for 04.testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3204, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3300
 * @tc.name: 00.testCanvasDrawShadowNormal
 * @tc.desc: test for 00.testCanvasDrawShadowNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3300, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow, iterate through the OH_Drawing_CanvasShadowFlags enumeration values
    OH_Drawing_CanvasShadowFlags flags[] = {
        SHADOW_FLAGS_NONE,
        SHADOW_FLAGS_TRANSPARENT_OCCLUDER,
        SHADOW_FLAGS_GEOMETRIC_ONLY,
        SHADOW_FLAGS_ALL,
    };
    OH_Drawing_Point3D p1{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    for (int i = 0; i < 4; i++) {
        OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0xFF000000, flags[i]);
    }
    // 4. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3301
 * @tc.name: 01.testCanvasDrawShadowNull
 * @tc.desc: test for 01.testCanvasDrawShadowNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3301, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 3. OH_Drawing_CanvasDrawShadow with the first parameter as null
    OH_Drawing_Point3D p1{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    OH_Drawing_CanvasDrawShadow(nullptr, path, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow with the second parameter as null
    OH_Drawing_CanvasDrawShadow(canvas, nullptr, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow with the third parameter as null
    // Unable to test, compilation error
    // 6. OH_Drawing_CanvasDrawShadow with the fourth parameter as null
    // Unable to test, compilation error
    // 7. OH_Drawing_CanvasDrawShadow with the fifth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 0, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 8. OH_Drawing_CanvasDrawShadow with the sixth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0, 0xFF000000, SHADOW_FLAGS_ALL);
    // 9. OH_Drawing_CanvasDrawShadow with the seventh parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0, SHADOW_FLAGS_ALL);
    // 10. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3302
 * @tc.name: 02.testCanvasDrawShadowAbnormal
 * @tc.desc: test for 02.testCanvasDrawShadowAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3302, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 3. OH_Drawing_CanvasDrawShadow, the third parameter planeParams x, y, z are set to negative values
    OH_Drawing_Point3D p1{-1.0, -1.0, -1.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, the fourth parameter devLightPos x, y, z are set to negative values
    OH_Drawing_Point3D p3{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p4{-10.0, -10.0, -10.0};
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, the fifth parameter lightRadius is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, -10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, the sixth parameter ambientColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, -0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, the seventh parameter spotColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, 0xFF000000, -0xFF000000, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3303
 * @tc.name: 03.testCanvasDrawShadowMaximum
 * @tc.desc: test for 03.testCanvasDrawShadowMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3303, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Point3D p1{1.0, 1.0, 1.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    // 3. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the planeParams parameter to maximum values
    p1 = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the devLightPos parameter to maximum values
    p1 = {1.0, 1.0, 1.0};
    p2 = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, set the lightRadius parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, FLT_MAX, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, set the ambientColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, set the spotColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3304
 * @tc.name: 04.testCanvasDrawShadowInputDestroyed
 * @tc.desc: test for 04.testCanvasDrawShadowInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3304, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3400
 * @tc.name: 00.testCanvasClearNormal
 * @tc.desc: test for 00.testCanvasClearNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3400, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasClear, covering the minimum value 0x00000000 and the maximum value 0xFFFFFFFF for color
    OH_Drawing_CanvasClear(canvas, 0x00000000);
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3401
 * @tc.name: 01.testCanvasClearNull
 * @tc.desc: test for 01.testCanvasClearNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3401, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasClear with the first parameter as null
    OH_Drawing_CanvasClear(nullptr, 0x00000000);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3402
 * @tc.name: 02.testCanvasClearAbnormal
 * @tc.desc: test for 02.testCanvasClearAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3402, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasClear with the parameter color set to a negative value
    OH_Drawing_CanvasClear(canvas, -1);
    // 3. OH_Drawing_CanvasClear with the parameter color set to a floating-point value
    // compile error, ignore
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3403
 * @tc.name: 03.testCanvasClearMultipleCalls
 * @tc.desc: test for 03.testCanvasClearMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3403, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_CanvasClear 10 times, each time with a different color
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasClear(canvas, 0x11111111 + i * 10);
    }
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3404
 * @tc.name: 04.testCanvasClearInputDestroyed
 * @tc.desc: test for 04.testCanvasClearInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3404, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3405
 * @tc.name: 05.testCanvasClearMaximum
 * @tc.desc: test for 05.testCanvasClearMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3405, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasClear with the parameter color set to the maximum value
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3500
 * @tc.name: 00.testCanvasSetMatrixNormal
 * @tc.desc: test for 00.testCanvasSetMatrixNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3500, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix and use OH_Drawing_MatrixGetValue to get the matrix information
    OH_Drawing_CanvasSetMatrix(canvas, matrix);
    float val = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(val, 1);

    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3501
 * @tc.name: 01.testCanvasSetMatrixNull
 * @tc.desc: test for 01.testCanvasSetMatrixNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3501, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. OH_Drawing_CanvasSetMatrix with the first parameter as null
    OH_Drawing_CanvasSetMatrix(nullptr, matrix);
    // 4. OH_Drawing_CanvasSetMatrix with the second parameter as null
    OH_Drawing_CanvasSetMatrix(canvas, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3502
 * @tc.name: 02.testCanvasSetMatrixMultipleCalls
 * @tc.desc: test for 02.testCanvasSetMatrixMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3502, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, and after each call, call OH_Drawing_MatrixGetValue to get the
    // matrix information
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        float val = OH_Drawing_MatrixGetValue(matrix, 0);
        EXPECT_EQ(val, 1);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3503
 * @tc.name: 03.testCanvasSetMatrixInputDestroyed
 * @tc.desc: test for 03.testCanvasSetMatrixInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3503, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3600
 * @tc.name: 00.testCanvasResetMatrixNormal
 * @tc.desc: test for 00.testCanvasResetMatrixNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3600, TestSize.Level0) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_CanvasResetMatrix
    OH_Drawing_CanvasResetMatrix(canvas);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3601
 * @tc.name: 01.testCanvasResetMatrixNull
 * @tc.desc: test for 01.testCanvasResetMatrixNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3601, TestSize.Level3) {
    // 1. Call OH_Drawing_CanvasResetMatrix with a null parameter
    OH_Drawing_CanvasResetMatrix(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3603
 * @tc.name: 02.testCanvasResetMatrixMultipleCalls
 * @tc.desc: test for 02.testCanvasResetMatrixMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3603, TestSize.Level3) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, call OH_Drawing_CanvasResetMatrix 10 times, and get matrix
    // information using OH_Drawing_MatrixGetValue
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
    }
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasResetMatrix(canvas);
    }
    // 4. Call OH_Drawing_CanvasSetMatrix, OH_Drawing_CanvasResetMatrix, and get matrix information using
    // OH_Drawing_MatrixGetValue
    OH_Drawing_CanvasSetMatrix(canvas, matrix);
    OH_Drawing_CanvasResetMatrix(canvas);
    float val = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(val, 1);
    // 5. Repeat steps 4 for 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        OH_Drawing_CanvasResetMatrix(canvas);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1);
    }
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3700
 * @tc.name: 00.testCanvasDrawImageRectWithSrcNormal
 * @tc.desc: test for 00.testCanvasDrawImageRectWithSrcNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3700, TestSize.Level0) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_ImageCreate to create an image object
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    // 3. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 4. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 5. Call OH_Drawing_SamplingOptionsCreate to create a sampling options object
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    EXPECT_NE(options, nullptr);
    // 6. Call OH_Drawing_CanvasDrawImageRectWithSrc with the sixth parameter iterating through the enumeration
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, rect2, options, FAST_SRC_RECT_CONSTRAINT);
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3701
 * @tc.name: 01.testCanvasDrawImageRectWithSrcNull
 * @tc.desc: test for 01.testCanvasDrawImageRectWithSrcNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3701, TestSize.Level3) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    // 1. Call OH_Drawing_CanvasDrawImageRectWithSrc with the first parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(nullptr, image, rect, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    // 2. Call OH_Drawing_CanvasDrawImageRectWithSrc with the second parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, nullptr, rect, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    // 3. Call OH_Drawing_CanvasDrawImageRectWithSrc with the third parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, nullptr, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    // 4. Call OH_Drawing_CanvasDrawImageRectWithSrc with the fourth parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, nullptr, options, STRICT_SRC_RECT_CONSTRAINT);
    // 5. Call OH_Drawing_CanvasDrawImageRectWithSrc with the fifth parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, rect2, nullptr, STRICT_SRC_RECT_CONSTRAINT);
    // 6. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3800
 * @tc.name: 00.testCanvasDrawImageRectNormal
 * @tc.desc: test for 00.testCanvasDrawImageRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3800, TestSize.Level0) {
    // 1. Create a canvas object using OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Create an image object using OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // 3. Create a rectangle object using OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 4. Create a sampling options object using OH_Drawing_SamplingOptionsCreate
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    // 5. Call OH_Drawing_CanvasDrawImageRect
    OH_Drawing_CanvasDrawImageRect(canvas, image, rect, options);
    // 6. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3801
 * @tc.name: 01.testCanvasDrawImageRectNull
 * @tc.desc: test for 01.testCanvasDrawImageRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3801, TestSize.Level3) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    // 1. Call OH_Drawing_CanvasDrawImageRect with the first parameter as null
    OH_Drawing_CanvasDrawImageRect(nullptr, image, rect, options);
    // 2. Call OH_Drawing_CanvasDrawImageRect with the second parameter as null
    OH_Drawing_CanvasDrawImageRect(canvas, nullptr, rect, options);
    // 3. Call OH_Drawing_CanvasDrawImageRect with the third parameter as null
    OH_Drawing_CanvasDrawImageRect(canvas, image, nullptr, options);
    // 4. Call OH_Drawing_CanvasDrawImageRect with the fourth parameter as null
    OH_Drawing_CanvasDrawImageRect(canvas, image, rect, nullptr);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3900
 * @tc.name: 00.testCanvasDrawVerticesNormal
 * @tc.desc: test for 00.testCanvasDrawVerticesNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3900, TestSize.Level0) {
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {100, 100};
    OH_Drawing_Point2D point_three = {300, 100};
    OH_Drawing_Point2D points_vertices[3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {1, 1};
    OH_Drawing_Point2D texs_three = {2, 0};
    OH_Drawing_Point2D texs_vertices[3] = {texs_one, texs_two, texs_three};
    uint32_t colors[3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[3] = {0, 1, 2};
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_CanvasDrawVertices with the second parameter iterating through the enum
    OH_Drawing_VertexMode mode[] = {VERTEX_MODE_TRIANGLES, VERTEX_MODE_TRIANGLES_STRIP, VERTEX_MODE_TRIANGLE_FAN};
    for (int i = 0; i < 3; i++) {
        OH_Drawing_CanvasDrawVertices(canvas, mode[i], 3, points_vertices, texs_vertices, colors, 3, indices,
                                      BLEND_MODE_COLOR);
    }
    // 3. Call OH_Drawing_CanvasDrawVertices with the ninth parameter iterating through the enum
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
    for (int i = 0; i < 30; i++) {
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors, 3,
                                      indices, blendMode[i]);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3901
 * @tc.name: 01.testCanvasDrawVerticesNull
 * @tc.desc: test for 01.testCanvasDrawVerticesNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3901, TestSize.Level3) {
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {100, 100};
    OH_Drawing_Point2D point_three = {300, 100};
    OH_Drawing_Point2D points_vertices[3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {1, 1};
    OH_Drawing_Point2D texs_three = {2, 0};
    OH_Drawing_Point2D texs_vertices[3] = {texs_one, texs_two, texs_three};
    uint32_t colors[3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[3] = {0, 1, 2};

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    // 1. Call OH_Drawing_CanvasDrawVertices with the first parameter as nullptr
    OH_Drawing_CanvasDrawVertices(nullptr, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors, 3, indices,
                                  BLEND_MODE_COLOR);
    // 2. Call OH_Drawing_CanvasDrawVertices with the third parameter as 0
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 0, points_vertices, texs_vertices, colors, 3, indices,
                                  BLEND_MODE_COLOR);
    // 3. Call OH_Drawing_CanvasDrawVertices with the fourth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, nullptr, texs_vertices, colors, 3, indices,
                                  BLEND_MODE_COLOR);
    // 4. Call OH_Drawing_CanvasDrawVertices with the fifth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, nullptr, colors, 3, indices,
                                  BLEND_MODE_COLOR);
    // 5. Call OH_Drawing_CanvasDrawVertices with the sixth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, nullptr, 3, indices,
                                  BLEND_MODE_COLOR);
    // 6. Call OH_Drawing_CanvasDrawVertices with the seventh parameter as 0
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors, 0, indices,
                                  BLEND_MODE_COLOR);
    // 7. Call OH_Drawing_CanvasDrawVertices with the eighth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors, 3, nullptr,
                                  BLEND_MODE_COLOR);
    // 8. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3902
 * @tc.name: 02.testCanvasDrawVerticesAbnormal
 * @tc.desc: test for 02.testCanvasDrawVerticesAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3902, TestSize.Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    // 2. Call OH_Drawing_CanvasDrawVertices with a floating-point number as the third parameter
    // Compilation error, cannot pass a floating-point number

    // 3. Call OH_Drawing_CanvasDrawVertices with a floating-point number as the seventh parameter
    // Compilation error, cannot pass a floating-point number

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3903
 * @tc.name: 03.testCanvasDrawVerticesMaximum
 * @tc.desc: test for 03.testCanvasDrawVerticesMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_3903, TestSize.Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {100, 100};
    OH_Drawing_Point2D point_three = {300, 100};
    OH_Drawing_Point2D points_vertices[3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {1, 1};
    OH_Drawing_Point2D texs_three = {2, 0};
    OH_Drawing_Point2D texs_vertices[3] = {texs_one, texs_two, texs_three};
    uint32_t colors[3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[3] = {0, 1, 2};

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    if (0) {
        // todo cpp crash
        // 2. Call OH_Drawing_CanvasDrawVertices with the third parameter as the maximum value 0x7FFFFFFF
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 0x7FFFFFFF, points_vertices, texs_vertices, colors,
                                      3, indices, BLEND_MODE_COLOR);
        // 3. Call OH_Drawing_CanvasDrawVertices with the seventh parameter as the maximum value 0x7FFFFFFF
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors,
                                      0x7FFFFFFF, indices, BLEND_MODE_COLOR);
    }

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4000
 * @tc.name: 00.testCanvasReadPixelsNormal
 * @tc.desc: test for 00.testCanvasReadPixelsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4000, TestSize.Level0) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_CanvasReadPixels
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, 0);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4001
 * @tc.name: 01.testCanvasReadPixelsNull
 * @tc.desc: test for 01.testCanvasReadPixelsNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4001, TestSize.Level3) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 1. Call OH_Drawing_CanvasReadPixels with the first parameter as nullptr
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_CanvasReadPixels(nullptr, &imageInfo, pixels, 0, 0, 0);
    // 2. Call OH_Drawing_CanvasReadPixels with the second parameter as nullptr
    OH_Drawing_CanvasReadPixels(canvas, nullptr, pixels, 0, 0, 0);
    // 3. Call OH_Drawing_CanvasReadPixels with the third parameter as nullptr
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, nullptr, 0, 0, 0);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4002
 * @tc.name: 02.testCanvasReadPixelsMismatch
 * @tc.desc: test for 02.testCanvasReadPixelsMismatch.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4002, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4003
 * @tc.name: 03.testCanvasReadPixelsAbnormal
 * @tc.desc: test for 03.testCanvasReadPixelsAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4003, TestSize.Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_CanvasReadPixels with the fourth parameter as a negative number or a floating-point number
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, -1, 0, 0);
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 1.0f, 0, 0);
    // 3. Call OH_Drawing_CanvasReadPixels with the fifth parameter as a floating-point number
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 1.0f, 0);
    // 4. Call OH_Drawing_CanvasReadPixels with the sixth parameter as a floating-point number
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, 1.0f);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4004
 * @tc.name: 04.testCanvasReadPixelsMaximum
 * @tc.desc: test for 04.testCanvasReadPixelsMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4004, TestSize.Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Call OH_Drawing_CanvasReadPixels with the fourth parameter as the maximum value 0xFFFFFFFF
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0xFFFFFFFF, 0, 0);
    // 3. Call OH_Drawing_CanvasReadPixels with the fifth parameter as the maximum value 0x7FFFFFFF
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0x7FFFFFFF, 0);
    // 4. Call OH_Drawing_CanvasReadPixels with the sixth parameter as the maximum value 0x7FFFFFFF
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, 0x7FFFFFFF);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4100
 * @tc.name: 00.testCanvasReadPixelsToBitmapNormal
 * @tc.desc: test for 00.testCanvasReadPixelsToBitmapNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4100, TestSize.Level0) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap
    OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1, 1);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4101
 * @tc.name: 01.testCanvasReadPixelsToBitmapNull
 * @tc.desc: test for 01.testCanvasReadPixelsToBitmapNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4101, TestSize.Level3) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 1. Call OH_Drawing_CanvasReadPixelsToBitmap with the first parameter as null
    OH_Drawing_CanvasReadPixelsToBitmap(nullptr, bitmap, 1, 1);
    // 2. Call OH_Drawing_CanvasReadPixelsToBitmap with the second parameter as null
    OH_Drawing_CanvasReadPixelsToBitmap(canvas, nullptr, 1, 1);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter as 0
    OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 0, 1);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter as 0
    OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1, 0);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4102
 * @tc.name: 02.testCanvasReadPixelsToBitmapAbnormal
 * @tc.desc: test for 02.testCanvasReadPixelsToBitmapAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4102, TestSize.Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter as a floating-point number
    OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1.0f, 0);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter as a floating-point number
    OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1, 1.0f);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4103
 * @tc.name: 03.testCanvasReadPixelsToBitmapMaximum
 * @tc.desc: test for 03.testCanvasReadPixelsToBitmapMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart4, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_4103, TestSize.Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter set to the maximum value 0x7FFFFFFF
    OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 0x7FFFFFFF, 0);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter set to the maximum value 0x7FFFFFFF
    OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1, 0x7FFFFFFF);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS