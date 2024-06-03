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
class NativeXTSDrawingCanvasTestPart3 : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1900
 * @tc.name: 00.testCanvasDrawOvalNormal
 * @tc.desc: test for 00.testCanvasDrawOvalNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1900, TestSize.Level0) {
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    // 2. Create OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);

    // 3. Draw oval on canvas
    OH_Drawing_CanvasDrawOval(canvas, rect);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1901
 * @tc.name: 01.testCanvasDrawOvalNull
 * @tc.desc: test for 01.testCanvasDrawOvalNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1901, TestSize.Level3) {
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Create OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // 3. OH_Drawing_CanvasDrawOval with nullptr as the first parameter
    OH_Drawing_CanvasDrawOval(nullptr, rect);
    // 4. OH_Drawing_CanvasDrawOval with OH_Drawing_Rect created with 0 for left, top, right, and bottom
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 200, 200, 200);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(200, 0, 200, 200);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(200, 200, 0, 200);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(200, 200, 200, 0);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    // 5. OH_Drawing_CanvasDrawOval with OH_Drawing_Rect created with all 0 values
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_CanvasDrawOval(canvas, rect3);
    // 6. OH_Drawing_CanvasDrawOval with nullptr as the second parameter
    OH_Drawing_CanvasDrawOval(canvas, nullptr);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1902
 * @tc.name: 02.testCanvasDrawOvalAbnormal
 * @tc.desc: test for 02.testCanvasDrawOvalAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1902, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Create OH_Drawing_Rect with left, top, right, and bottom values as negative numbers
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-100, 100, 200, 200);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(100, -100, 200, 200);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, -200, 200);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 200, -200);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    // 3. Create OH_Drawing_Rect with the horizontal coordinate of the top-left corner equal to the horizontal
    // coordinate of the bottom-right corner, or the vertical coordinate of the top-left corner equal to the vertical
    // coordinate of the bottom-right corner
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100, 0, 100, 100);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 100, 100, 100);
    OH_Drawing_CanvasDrawOval(canvas, rect3);
    // 4. Create OH_Drawing_Rect with the top-left corner coordinates equal to the bottom-right corner coordinates
    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(100, 100, 100, 100);
    OH_Drawing_CanvasDrawOval(canvas, rect4);
    // 5. Create OH_Drawing_Rect with the top-left corner coordinates greater than the bottom-right corner coordinates
    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(200, 200, 100, 100);
    OH_Drawing_CanvasDrawOval(canvas, rect5);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1903
 * @tc.name: 03.testCanvasDrawOvalMaximum
 * @tc.desc: test for 03.testCanvasDrawOvalMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1903, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. Create OH_Drawing_Rect with FLT_MAX as the values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 0, 0, 0);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(0, FLT_MAX, 0, 0);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(0, 0, FLT_MAX, 0);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(0, 0, 0, FLT_MAX);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1904
 * @tc.name: 04.testCanvasDrawOvalInputDestroyed
 * @tc.desc: test for 04.testCanvasDrawOvalInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_1904, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. OH_Drawing_CanvasDrawOval
    OH_Drawing_CanvasDrawOval(canvas, rect);

    if (0) {
        // todo cpp crash
        // 4. OH_Drawing_CanvasDestroy  Destroy the canvas
        OH_Drawing_CanvasDestroy(canvas);
        // 5. OH_Drawing_CanvasDrawOval
        OH_Drawing_CanvasDrawOval(canvas, rect);
        // 6. OH_Drawing_CanvasCreate
        canvas = OH_Drawing_CanvasCreate();
        // 7. OH_Drawing_RectDestroy
        OH_Drawing_RectDestroy(rect);
        // 8. OH_Drawing_CanvasDrawOval
        OH_Drawing_CanvasDrawOval(canvas, rect);
        // 9. Free memory
        OH_Drawing_CanvasDestroy(canvas);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2000
 * @tc.name: 00.testCanvasDrawArcNormal
 * @tc.desc: test for 00.testCanvasDrawArcNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2000, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. OH_Drawing_CanvasDrawArc with startAngle iterating over 0°, 180°, and 360°
    float startAngles[] = {0.0f, 180.0f, 360.0f};
    for (float startAngle : startAngles) {
        OH_Drawing_CanvasDrawArc(canvas, rect, startAngle, 90.0f);
    }
    // 4. OH_Drawing_CanvasDrawArc with sweepAngle iterating over 0°, 180°, and 360°
    float sweepAngles[] = {0.0f, 180.0f, 360.0f};
    for (float sweepAngle : sweepAngles) {
        OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, sweepAngle);
    }
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2001
 * @tc.name: 01.testCanvasDrawArcNull
 * @tc.desc: test for 01.testCanvasDrawArcNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2001, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. OH_Drawing_CanvasDrawArc with nullptr as the first parameter
    OH_Drawing_CanvasDrawArc(nullptr, rect, 0.0f, 90.0f);
    // 4. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with 0 for left, top, right, and bottom
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 100, 200, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(100, 0, 200, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(100, 100, 0, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(100, 100, 200, 0);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    // 5. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with all 0 values
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_CanvasDrawArc(canvas, rect3, 0.0f, 90.0f);
    // 6. OH_Drawing_CanvasDrawArc with nullptr as the second parameter
    OH_Drawing_CanvasDrawArc(canvas, nullptr, 0.0f, 90.0f);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2002
 * @tc.name: 02.testCanvasDrawArcAbnormal
 * @tc.desc: test for 02.testCanvasDrawArcAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2002, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with negative values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-100, -100, -200, -200);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(-100, 100, 200, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(100, -100, 200, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(100, 100, -200, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(100, 100, 200, -200);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    // 3. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the horizontal coordinate of the top-left corner
    // equal to the horizontal coordinate of the bottom-right corner, or the vertical coordinate of the top-left corner
    // equal to the vertical coordinate of the bottom-right corner
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100, 0, 100, 100);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 100, 100, 100);
    OH_Drawing_CanvasDrawArc(canvas, rect3, 0.0f, 90.0f);
    // 4. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the top-left corner coordinates equal to the
    // bottom-right corner coordinates
    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(100, 100, 100, 100);
    OH_Drawing_CanvasDrawArc(canvas, rect4, 0.0f, 90.0f);
    // 5. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the top-left corner coordinates greater than the
    // bottom-right corner coordinates
    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(200, 200, 100, 100);
    OH_Drawing_CanvasDrawArc(canvas, rect5, 0.0f, 90.0f);
    // 6. OH_Drawing_CanvasDrawArc with negative startAngle
    OH_Drawing_CanvasDrawArc(canvas, rect, -90.0f, 90.0f);
    // 7. OH_Drawing_CanvasDrawArc with startAngle greater than 360°
    OH_Drawing_CanvasDrawArc(canvas, rect, 400.0f, 90.0f);
    // 8. OH_Drawing_CanvasDrawArc with negative sweepAngle
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, -90.0f);
    // 9. OH_Drawing_CanvasDrawArc with sweepAngle greater than 360°
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 400.0f);
    // 10. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2003
 * @tc.name: 03.testCanvasDrawArcMaximum
 * @tc.desc: test for 03.testCanvasDrawArcMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2003, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with FLT_MAX as the values for left, top, right, and
    // bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 0, 0, 0);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(0, FLT_MAX, 0, 0);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(0, 0, FLT_MAX, 0);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(0, 0, 0, FLT_MAX);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    OH_Drawing_RectDestroy(rect);
    // 3. OH_Drawing_CanvasDrawArc with startAngle FLT_MAX
    rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawArc(canvas, rect, FLT_MAX, 90.0f);
    OH_Drawing_RectDestroy(rect);
    // 4. OH_Drawing_CanvasDrawArc with sweepAngle FLT_MAX
    rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, FLT_MAX);
    OH_Drawing_RectDestroy(rect);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2004
 * @tc.name: 04.testCanvasDrawArcInputDestroyed
 * @tc.desc: test for 04.testCanvasDrawArcInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2004, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);

    // 3. OH_Drawing_CanvasDrawArc
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);

    // 4. OH_Drawing_CanvasDestroy  Destroy the canvas
    OH_Drawing_CanvasDestroy(canvas);

    // 5. OH_Drawing_CanvasDrawArc
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);

    // 6. OH_Drawing_CanvasCreate
    canvas = OH_Drawing_CanvasCreate();

    // 7. OH_Drawing_RectDestroy
    OH_Drawing_RectDestroy(rect);

    // 8. OH_Drawing_CanvasDrawArc
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);

    // 9. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2100
 * @tc.name: 00.testCanvasDrawRoundRectNormal
 * @tc.desc: test for 00.testCanvasDrawRoundRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2100, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);

    // 3. OH_Drawing_CanvasDrawRoundRect
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2101
 * @tc.name: 01.testCanvasDrawRoundRectNull
 * @tc.desc: test for 01.testCanvasDrawRoundRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2101, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);

    // 3. OH_Drawing_CanvasDrawRoundRect with the first parameter being nullptr
    OH_Drawing_CanvasDrawRoundRect(nullptr, roundRect);

    // 4. OH_Drawing_CanvasDrawRoundRect with the second parameter being nullptr
    OH_Drawing_CanvasDrawRoundRect(canvas, nullptr);

    // 5. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect having 0
    // in any of the four positions
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect2, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect2);

    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(10, 0, 200, 300);
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect3, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect3);

    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(10, 100, 0, 300);
    OH_Drawing_RoundRect *roundRect4 = OH_Drawing_RoundRectCreate(rect4, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect4);

    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(10, 100, 200, 0);
    OH_Drawing_RoundRect *roundRect5 = OH_Drawing_RoundRectCreate(rect5, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect5);

    // 6. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect having
    // all positions as 0
    OH_Drawing_Rect *rect6 = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_RoundRect *roundRect6 = OH_Drawing_RoundRectCreate(rect6, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect6);

    // 7. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad as 0
    OH_Drawing_Rect *rect7 = OH_Drawing_RectCreate(10, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect7 = OH_Drawing_RoundRectCreate(rect7, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect7);

    // 8. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad as 0
    OH_Drawing_Rect *rect8 = OH_Drawing_RectCreate(10, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect8 = OH_Drawing_RoundRectCreate(rect8, 1.0f, 0.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect8);

    // 9. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RoundRectDestroy(roundRect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RoundRectDestroy(roundRect4);
    OH_Drawing_RectDestroy(rect5);
    OH_Drawing_RoundRectDestroy(roundRect5);
    OH_Drawing_RectDestroy(rect6);
    OH_Drawing_RoundRectDestroy(roundRect6);
    OH_Drawing_RectDestroy(rect7);
    OH_Drawing_RoundRectDestroy(roundRect7);
    OH_Drawing_RectDestroy(rect8);
    OH_Drawing_RoundRectDestroy(roundRect8);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2102
 * @tc.name: 02.testCanvasDrawRoundRectAbnormal
 * @tc.desc: test for 02.testCanvasDrawRoundRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2102, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    // 2. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with left, top, right, bottom
    // being set to negative numbers
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-10, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, -100, 200, 300);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, 100, -200, 300);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, 100, 200, -300);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 3. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_CanvasDrawRoundRect creating rect with the horizontal
    // coordinate of the top-left corner equal to the horizontal coordinate of the bottom-right corner, or the vertical
    // coordinate of the top-left corner equal to the vertical coordinate of the bottom-right corner
    rect = OH_Drawing_RectCreate(100, 0, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(0, 100, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with the top-left corner
    // coordinates equal to the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(100, 100, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 5. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with the top-left corner
    // coordinates greater than the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(200, 200, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 6. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate creating roundRect with a
    // negative xRad
    rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    roundRect = OH_Drawing_RoundRectCreate(rect, -1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 7. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate creating roundRect with a
    // negative yRad
    rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, -1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 8. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2103
 * @tc.name: 03.testCanvasDrawRoundRectMaximum
 * @tc.desc: test for 03.testCanvasDrawRoundRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2103, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with left, top, right, bottom
    // being set to FLT_MAX
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, FLT_MAX, 200, 300);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, 100, FLT_MAX, 300);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, 100, 200, FLT_MAX);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 3. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad being
    // set to FLT_MAX
    rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad being
    // set to FLT_MAX
    rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, FLT_MAX);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2104
 * @tc.name: 04.testCanvasDrawRoundRectInputDestroyed
 * @tc.desc: test for 04.testCanvasDrawRoundRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2104, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);

    // 3. OH_Drawing_CanvasDrawRoundRect
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. OH_Drawing_CanvasDestroy  Destroy the canvas
    OH_Drawing_CanvasDestroy(canvas);

    // 5. OH_Drawing_CanvasDrawRoundRect
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 6. OH_Drawing_CanvasCreate
    canvas = OH_Drawing_CanvasCreate();

    // 7. OH_Drawing_RectDestroy
    OH_Drawing_RectDestroy(rect);

    // 8. OH_Drawing_RoundRectDestroy
    OH_Drawing_RoundRectDestroy(roundRect);

    // 9. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2200
 * @tc.name: 00.testCanvasDrawTextBlobNormal
 * @tc.desc: test for 00.testCanvasDrawTextBlobNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2200, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    if (0) {
        // todo cpp crash
        // 2. OH_Drawing_TextBlobCreateFromText
        const char *str = "123456";
        OH_Drawing_Font *font = OH_Drawing_FontCreate();
        OH_Drawing_TextBlob *textBlob =
            OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        // 3. OH_Drawing_CanvasDrawTextBlob
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, 10);
        // 4. Free memory
        OH_Drawing_TextBlobDestroy(textBlob);
    }

    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2201
 * @tc.name: 01.testCanvasDrawTextBlobNull
 * @tc.desc: test for 01.testCanvasDrawTextBlobNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2201, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_TextBlobCreateFromString
    if (0) {
        // todo cpp crash
        const char *str = "123456";
        OH_Drawing_Font *font = OH_Drawing_FontCreate();
        OH_Drawing_TextBlob *textBlob =
            OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        // 3. OH_Drawing_CanvasDrawTextBlob with the first parameter being nullptr
        OH_Drawing_CanvasDrawTextBlob(nullptr, textBlob, 10, 10);
        // 4. OH_Drawing_CanvasDrawTextBlob with the second parameter being nullptr
        OH_Drawing_CanvasDrawTextBlob(canvas, nullptr, 10, 10);
        // 5. OH_Drawing_CanvasDrawTextBlob with the third parameter being 0
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 0, 10);
        // 6. OH_Drawing_CanvasDrawTextBlob with the fourth parameter being 0
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, 0);
        // 7. Free memory
        OH_Drawing_TextBlobDestroy(textBlob);
    }

    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2202
 * @tc.name: 02.testCanvasDrawTextBlobAbnormal
 * @tc.desc: test for 02.testCanvasDrawTextBlobAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2202, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    if (0) {
        // todo cpp crash

        // 2. Create OH_Drawing_TextBlob from text
        const char *str = "123456";
        OH_Drawing_Font *font = OH_Drawing_FontCreate();
        OH_Drawing_TextBlob *textBlob =
            OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        // 3. Draw OH_Drawing_TextBlob on canvas with x-coordinate of the bottom left corner of the text object set to a
        // negative value
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, -10, 10);
        // 4. Draw OH_Drawing_TextBlob on canvas with y-coordinate of the bottom left corner of the text object set to a
        // negative value
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, -10);
        // 5. Release memory
        OH_Drawing_TextBlobDestroy(textBlob);
    }

    // 5. Release memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2203
 * @tc.name: 04.testCanvasDrawTextBlobMaximum
 * @tc.desc: test for 04.testCanvasDrawTextBlobMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2203, TestSize.Level3) {
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    if (0) {
        // todo cpp crash
        // 2. Create OH_Drawing_TextBlob from text
        const char *str = "123456";
        OH_Drawing_Font *font = OH_Drawing_FontCreate();
        OH_Drawing_TextBlob *textBlob =
            OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        // 3. Draw OH_Drawing_TextBlob on canvas with x-coordinate of the bottom left corner of the text object set to
        // maximum value
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, FLT_MAX, 10);
        // 4. Draw OH_Drawing_TextBlob on canvas with y-coordinate of the bottom left corner of the text object set to
        // maximum value
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, FLT_MAX);
        // 5. Release memory
        OH_Drawing_TextBlobDestroy(textBlob);
    }

    // 5. Release memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2204
 * @tc.name: 05.testCanvasDrawTextBlobInputDestroyed
 * @tc.desc: test for 05.testCanvasDrawTextBlobInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2204, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();

    if (0) {
        // todo cpp crash
        // 2. OH_Drawing_TextBlobCreateFromString
        const char *str = "123456";
        OH_Drawing_Font *font = OH_Drawing_FontCreate();
        OH_Drawing_TextBlob *textBlob =
            OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        // 3. OH_Drawing_CanvasDrawTextBlob
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, 10);
        // 4. OH_Drawing_CanvasDestroy  Destroy the Canvas
        OH_Drawing_CanvasDestroy(canvas);
        // 5. OH_Drawing_CanvasDrawTextBlob
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, 10);
        // 6. OH_Drawing_CanvasCreate
        canvas = OH_Drawing_CanvasCreate();
        // 7. OH_Drawing_TextBlobDestroy  Destroy the TextBlob
        OH_Drawing_TextBlobDestroy(textBlob);
        // 8. OH_Drawing_CanvasDrawTextBlob
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, 10);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2300
 * @tc.name: 00.testCanvasClipRectNormal
 * @tc.desc: test for 00.testCanvasClipRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2300, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // 3. OH_Drawing_CanvasClipRect with clipOp and doAntiAlias parameters, iterate through enum values
    OH_Drawing_CanvasClipOp clipOp[] = {OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            OH_Drawing_CanvasClipRect(canvas, rect, clipOp[i], doAntiAlias[j]);
        }
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2301
 * @tc.name: 01.testCanvasClipRectNull
 * @tc.desc: test for 01.testCanvasClipRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2301, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // 3. OH_Drawing_CanvasClipRect with the first parameter being nullptr
    OH_Drawing_CanvasClipRect(nullptr, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRect with the second parameter OH_Drawing_Rect created with left, top, right, and bottom
    // values being 0
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 10, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 0, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 10, 0, 100);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 10, 100, 0);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRect with the second parameter OH_Drawing_Rect created with all values being 0
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_CanvasClipRect(canvas, rect3, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. OH_Drawing_CanvasClipRect with the second parameter being nullptr
    OH_Drawing_CanvasClipRect(canvas, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2302
 * @tc.name: 02.testCanvasClipRectAbnormal
 * @tc.desc: test for 02.testCanvasClipRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2302, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created with negative values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-10, 10, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, -10, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, -100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, 100, -100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the x-coordinate of the top-left corner is equal
    // to the x-coordinate of the bottom-right corner, or the y-coordinate of the top-left corner is equal to the
    // y-coordinate of the bottom-right corner
    rect = OH_Drawing_RectCreate(100, 10, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 100, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the top-left corner coordinates are equal to the
    // bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(100, 100, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the top-left corner coordinates are greater than
    // the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(200, 200, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2303
 * @tc.name: 03.testCanvasClipRectMaximum
 * @tc.desc: test for 03.testCanvasClipRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2303, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created with extreme values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 10, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, FLT_MAX, 100, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, FLT_MAX, 100);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, 100, FLT_MAX);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2304
 * @tc.name: 04.testCanvasClipRectInputDestroyed
 * @tc.desc: test for 04.testCanvasClipRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2304, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // 3. OH_Drawing_CanvasClipRect
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasDestroy  Destroy the Canvas
    OH_Drawing_CanvasDestroy(canvas);

    if (0) {
        // todo cpp crash
        // 5. OH_Drawing_CanvasClipRect
        OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    }

    // 6. OH_Drawing_CanvasCreate
    canvas = OH_Drawing_CanvasCreate();

    if (0) {
        // todo cpp crash
        // 7. OH_Drawing_RectDestroy  Destroy the Rect
        OH_Drawing_RectDestroy(rect);
        // 8. OH_Drawing_CanvasClipRect
        OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    }
    // 9. Release memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2400
 * @tc.name: 00.testCanvasClipRoundRectNormal
 * @tc.desc: test for 00.testCanvasClipRoundRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2400, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // 3. OH_Drawing_CanvasClipRoundRect with parameters clipOp and doAntiAlias, iterate through the enumeration values
    OH_Drawing_CanvasClipOp clipOp[] = {OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp[i], doAntiAlias[j]);
        }
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2401
 * @tc.name: 01.testCanvasClipRoundRectNull
 * @tc.desc: test for 01.testCanvasClipRoundRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2401, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // 3. OH_Drawing_CanvasClipRoundRect with the first parameter being null
    OH_Drawing_CanvasClipRoundRect(nullptr, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRoundRect with the second parameter being null
    OH_Drawing_CanvasClipRoundRect(canvas, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect's left, top, right, and bottom values all set to 0
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 10, 100, 100);
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 0, 100, 100);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 10, 0, 100);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 10, 100, 0);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with all rect's left, top, right, and bottom values set to 0
    rect2 = OH_Drawing_RectCreate(0, 0, 0, 0);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 7. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad set to 0
    rect2 = OH_Drawing_RectCreate(10, 10, 100, 100);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 0, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 8. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad set to 0
    rect2 = OH_Drawing_RectCreate(10, 10, 100, 100);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 0);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 9. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2402
 * @tc.name: 02.testCanvasClipRoundRectAbnormal
 * @tc.desc: test for 02.testCanvasClipRoundRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2402, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasClipRoundRect, pass negative values for left, top, right, and bottom when creating OH_Drawing_RoundRect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-10, 10, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, -10, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, -100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, 100, -100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 3. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates equal to right-bottom coordinates
    rect = OH_Drawing_RectCreate(100, 10, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 100, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 4. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates equal to right-bottom coordinates
    rect = OH_Drawing_RectCreate(100, 100, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 5. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates greater than right-bottom coordinates
    rect = OH_Drawing_RectCreate(200, 200, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 6. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with negative xRad
    rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, -10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 7. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with negative yRad
    rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, -10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 8. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2403
 * @tc.name: 03.testCanvasClipRoundRectMaximum
 * @tc.desc: test for 03.testCanvasClipRoundRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2403, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_CanvasClipRoundRect, pass extreme values for left, top, right, and bottom when creating OH_Drawing_RoundRect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 10, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, FLT_MAX, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, FLT_MAX, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, 100, FLT_MAX);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRoundRect, pass FLT_MAX for xRad when creating OH_Drawing_RoundRect
    rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, 10);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRoundRect, pass FLT_MAX for yRad when creating OH_Drawing_RoundRect
    rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, FLT_MAX);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2404
 * @tc.name: 04.testCanvasClipRoundRectInputDestroyed
 * @tc.desc: test for 04.testCanvasClipRoundRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeXTSDrawingCanvasTestPart3, SUB_BASIC_GRAPHICS_SPECIAL_API_NDK_DRAWING_CANVAS_2404, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // 3. OH_Drawing_CanvasClipRoundRect
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasDestroy  Destroy the Canvas
    OH_Drawing_CanvasDestroy(canvas);
    if (0) {
        // todo cpp crash
        // 5. OH_Drawing_CanvasClipRoundRect
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    }
    // 6. OH_Drawing_CanvasCreate
    canvas = OH_Drawing_CanvasCreate();
    // 7. OH_Drawing_RectDestroy
    OH_Drawing_RectDestroy(rect);
    if (0) {
        // todo cpp crash
        // 8. OH_Drawing_CanvasClipRoundRect
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    }
    // 9. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RoundRectDestroy(roundRect);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS