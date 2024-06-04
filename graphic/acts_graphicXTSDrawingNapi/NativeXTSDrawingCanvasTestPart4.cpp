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

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS