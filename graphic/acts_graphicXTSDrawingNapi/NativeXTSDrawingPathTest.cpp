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

#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_image.h"
#include "drawing_matrix.h"
#include "drawing_path.h"
#include "drawing_path_effect.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "effect/color_filter.h"
#include "effect/filter.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingPathTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_CreateDashPathEffect
 * @tc.desc: test for OH_Drawing_CreateDashPathEffect.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_CreateDashPathEffect, TestSize.Level1) {
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);
    float intervals[] = {1, 1, 1};
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 3, 0.0);
    OH_Drawing_PenSetPathEffect(nullptr, pathEffect);
    OH_Drawing_PenSetPathEffect(pen, pathEffect);
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.name: OH_Drawing_PathEffectDestroy
 * @tc.desc: test for OH_Drawing_PathEffectDestroy.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathEffectDestroy, TestSize.Level1) {
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);
    float intervals[] = {1, 1, 1};
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 3, 0.0);
    OH_Drawing_PenSetPathEffect(nullptr, pathEffect);
    OH_Drawing_PenSetPathEffect(pen, pathEffect);
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.name: OH_Drawing_PathDestroy
 * @tc.desc: test for OH_Drawing_PathDestroy.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathDestroy, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathMoveTo
 * @tc.desc: test for OH_Drawing_PathMoveTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathMoveTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 20, 20);
    OH_Drawing_PathMoveTo(path, -1, 21.5);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 21.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 1.5));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathLineTo
 * @tc.desc: test for OH_Drawing_PathLineTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathLineTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathLineTo(path, 50, 40);
    OH_Drawing_PathLineTo(path, -50, 10.2);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 100.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 40.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathArcTo
 * @tc.desc: test for OH_Drawing_PathArcTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathArcTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0, 90);
    OH_Drawing_PathArcTo(path, -10, 10, 10, -10, 0, 90);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 0.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 0.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathQuadTo
 * @tc.desc: test for OH_Drawing_PathQuadTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathQuadTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathQuadTo(path, 0, 0, 30, 30);
    OH_Drawing_PathQuadTo(path, -20.5f, -20.5f, 30, 0);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 50.5));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 50.5));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathConicTo
 * @tc.desc: test for OH_Drawing_PathConicTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathConicTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathConicTo(path, 0, 0, 30, 30, 1);
    OH_Drawing_PathConicTo(path, -20.5f, -20.5f, 30, 0, 1);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 50.5));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 50.5));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathCubicTo
 * @tc.desc: test for OH_Drawing_PathCubicTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathCubicTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathCubicTo(path, 30, 40, 60, 0, 50, 20);
    OH_Drawing_PathRCubicTo(path, 30, 40, 60, 0, 50, 20);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 110.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 60.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathAddRect
 * @tc.desc: test for OH_Drawing_PathAddRect.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddRect, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // rect left[50], top[50],right[250], bottom[250]
    OH_Drawing_PathAddRect(path, 50, 50, 250, 250, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathContains(nullptr, 0, 0);
    bool ret = OH_Drawing_PathContains(path, 0, 0);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_PathContains(path, 60, 60);
    EXPECT_EQ(ret, true);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathAddRoundRect
 * @tc.desc: test for OH_Drawing_PathAddRoundRect.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddRoundRect, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(50, 50, 250, 250);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    OH_Drawing_PathAddRoundRect(path, roundRect, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 200.0));
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_PathAddArc
 * @tc.desc: test for OH_Drawing_PathAddArc.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddArc, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // rect left[50], top[50],right[250], bottom[250]
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(50, 50, 250, 250);
    OH_Drawing_PathAddArc(nullptr, rect, 0, 180);
    OH_Drawing_PathAddArc(path, nullptr, 0, 180);
    OH_Drawing_PathAddArc(path, rect, 0, 180);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 100.0));
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_PathContains
 * @tc.desc: test for OH_Drawing_PathContains.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathContains, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // rect left[50], top[50],right[250], bottom[250]
    OH_Drawing_PathAddRect(path, 50, 50, 250, 250, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathContains(nullptr, 0, 0);
    bool ret = OH_Drawing_PathContains(path, 0, 0);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_PathContains(path, 60, 60);
    EXPECT_EQ(ret, true);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathSetFillType
 * @tc.desc: test for OH_Drawing_PathSetFillType.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathSetFillType, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathSetFillType(nullptr, PATH_FILL_TYPE_WINDING);
    OH_Drawing_PathSetFillType(path, PATH_FILL_TYPE_WINDING);
    OH_Drawing_PathLineTo(path, 50, 40);
    OH_Drawing_PathClose(path);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 50.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 40.0));
    float ret = OH_Drawing_PathGetLength(path, true);
    EXPECT_TRUE(IsScalarAlmostEqual(ret, 128.062485)); // 128.062485 is length of path
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathClose
 * @tc.desc: test for OH_Drawing_PathClose.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathClose, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathLineTo(path, 50, 40);
    OH_Drawing_PathClose(path);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 50.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 40.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathReset
 * @tc.desc: test for OH_Drawing_PathReset.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathReset, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 20, 20);
    OH_Drawing_PathReset(path);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 0.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 0.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathAddOvalWithInitialPoint
 * @tc.desc: test for OH_Drawing_PathAddOvalWithInitialPoint.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddOvalWithInitialPoint, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 100, 500, 400);
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, 10, PATH_DIRECTION_CW);
    OH_Drawing_PathClose(path);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 500.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 300.0));
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_PathRMoveTo
 * @tc.desc: test for OH_Drawing_PathRMoveTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathRMoveTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathRMoveTo(path, 100, 100);
    OH_Drawing_PathLineTo(path, 300, 300);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 200.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathRLineTo
 * @tc.desc: test for OH_Drawing_PathRLineTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathRLineTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 100, 100);
    OH_Drawing_PathRLineTo(path, 300, 300);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 300.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 300.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathRQuadTo
 * @tc.desc: test for OH_Drawing_PathRQuadTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathRQuadTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathQuadTo(path, 0, 0, 30, 30);
    OH_Drawing_PathRQuadTo(path, 100, 100, 100, 300);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 130.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 330.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathRConicTo
 * @tc.desc: test for OH_Drawing_PathRConicTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathRConicTo, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 300, 5);
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 300, 5);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 600.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathRCubicTo
 * @tc.desc: test for OH_Drawing_PathRCubicTo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathRCubicTo, TestSize.Level1) {
    OH_Drawing_Path *path14 = OH_Drawing_PathCreate();
    OH_Drawing_PathCubicTo(path14, 30, 40, 60, 0, 50, 20);
    OH_Drawing_PathRCubicTo(path14, 30, 40, 60, 0, 50, 20);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path14)->GetBounds().GetWidth(), 110.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path14)->GetBounds().GetHeight(), 60.0));
    OH_Drawing_PathDestroy(path14);
}

/*
 * @tc.name: OH_Drawing_PathAddPathWithMode
 * @tc.desc: test for OH_Drawing_PathAddPathWithMode.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddPathWithMode, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 300.0f);
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, PATH_DIRECTION_CW, 0);
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    OH_Drawing_PathAddPathWithMode(path2, path, PATH_ADD_MODE_APPEND);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path2)->GetBounds().GetWidth(), 200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path2)->GetBounds().GetHeight(), 300.0));
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path2);
}

/*
 * @tc.name: OH_Drawing_PathAddPathWithMatrixAndMode
 * @tc.desc: test for OH_Drawing_PathAddPathWithMatrixAndMode.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddPathWithMatrixAndMode, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 300.0f);
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, PATH_DIRECTION_CW, 0);
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();

    OH_Drawing_PathAddPathWithMatrixAndMode(path2, path, matrix, PATH_ADD_MODE_APPEND);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path2)->GetBounds().GetWidth(), 200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path2)->GetBounds().GetHeight(), 300.0));

    OH_Drawing_Path *pathRect = OH_Drawing_PathCreate();
    OH_Drawing_PathAddRect(pathRect, 0.0f, 0.0f, 200.0f, 300.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_PathAddPath(pathRect, pathRect, nullptr);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(pathRect)->GetBounds().GetWidth(), 200.0));
    OH_Drawing_PathAddPath(pathRect, pathRect, matrix);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(pathRect)->GetBounds().GetWidth(), 2200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(pathRect)->GetBounds().GetHeight(), 600.0));
    OH_Drawing_PathAddPath(nullptr, pathRect, matrix);
    OH_Drawing_PathAddPath(pathRect, nullptr, matrix);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathDestroy(pathRect);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.name: OH_Drawing_PathAddPathWithOffsetAndMode
 * @tc.desc: test for OH_Drawing_PathAddPathWithOffsetAndMode.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddPathWithOffsetAndMode, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 300.0f);
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, PATH_DIRECTION_CW, 0);
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    OH_Drawing_PathAddPathWithOffsetAndMode(path2, path, 0, 0, PATH_ADD_MODE_APPEND);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path2)->GetBounds().GetWidth(), 200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path2)->GetBounds().GetHeight(), 300.0));
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path2);
}

/*
 * @tc.name: OH_Drawing_PathAddRectWithInitialCorner
 * @tc.desc: test for OH_Drawing_PathAddRectWithInitialCorner.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddRectWithInitialCorner, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 300.0f);
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, PATH_DIRECTION_CW, 0);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 200.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 300.0));
    OH_Drawing_PathClose(path);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_PathOffset
 * @tc.desc: test for OH_Drawing_PathOffset.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathOffset, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    OH_Drawing_PathOffset(path, path2, 50, 40);
    OH_Drawing_PathReset(path);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 0.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 0.0));
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
}

/*
 * @tc.name: OH_Drawing_PathTransformWithPerspectiveClip
 * @tc.desc: test for OH_Drawing_PathTransformWithPerspectiveClip.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathTransformWithPerspectiveClip, TestSize.Level1) {
    OH_Drawing_Path *path15 = OH_Drawing_PathCreate();
    OH_Drawing_PathAddRect(path15, 100, 500, 500, 100, PATH_DIRECTION_CW);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(100, 100);
    OH_Drawing_PathTransformWithPerspectiveClip(path15, matrix, path15, true);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path15)->GetBounds().GetWidth(), 400.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path15)->GetBounds().GetHeight(), 400.0));
    OH_Drawing_PathDestroy(path15);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.name: OH_Drawing_PathGetLength
 * @tc.desc: test for OH_Drawing_PathGetLength.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathGetLength, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathSetFillType(nullptr, PATH_FILL_TYPE_WINDING);
    OH_Drawing_PathSetFillType(path, PATH_FILL_TYPE_WINDING);
    // line point x = 50, y = 40
    OH_Drawing_PathLineTo(path, 50, 40);
    OH_Drawing_PathClose(path);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 50.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 40.0));
    float ret = OH_Drawing_PathGetLength(path, true);
    EXPECT_TRUE(IsScalarAlmostEqual(ret, 128.062485)); // 128.062485 is length of path
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathAddOval
 * @tc.desc: test for OH_Drawing_PathAddOval.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddOval, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 100, 500, 400);
    OH_Drawing_PathAddOval(path, rect, PATH_DIRECTION_CW);
    OH_Drawing_PathClose(path);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 500.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 300.0));
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: OH_Drawing_PathAddCircle
 * @tc.desc: test for OH_Drawing_PathAddCircle.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddCircle, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathAddCircle(path, 1.0, 1.0, 1.0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathClose(path);
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetWidth(), 2.0));
    EXPECT_TRUE(IsScalarAlmostEqual(reinterpret_cast<Path *>(path)->GetBounds().GetHeight(), 2.0));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathAddPolygon
 * @tc.desc: test for OH_Drawing_PathAddPolygon.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathAddPolygon, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);

    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {100, 0};
    OH_Drawing_Point2D point3 = {100, 100};
    OH_Drawing_Point2D point4 = {0, 100};
    OH_Drawing_Point2D points[4] = {point1, point2, point3, point4};

    OH_Drawing_PathAddPolygon(path, points, 1, true);
    OH_Drawing_PathClose(path);

    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathGetBounds
 * @tc.desc: test for OH_Drawing_PathGetBounds.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathGetBounds, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 100, 500, 400);
    EXPECT_NE(rect, nullptr);

    OH_Drawing_PathGetBounds(path, rect);
    EXPECT_NE(rect, nullptr);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathIsClosed
 * @tc.desc: test for OH_Drawing_PathIsClosed.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathIsClosed, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathAddCircle(path, 1.0, 1.0, 1.0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathClose(path);
    EXPECT_TRUE(OH_Drawing_PathIsClosed(path, false));
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathGetPositionTangent
 * @tc.desc: test for OH_Drawing_PathGetPositionTangent.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathGetPositionTangent, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);

    OH_Drawing_PathAddCircle(path, 1.0, 1.0, 1.0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathClose(path);
    float distance = 1.0;
    OH_Drawing_Point2D position = {2, 1};
    OH_Drawing_Point2D tangent = {2, 1};
    bool ret = OH_Drawing_PathGetPositionTangent(path, false, distance, &position, &tangent);
    EXPECT_TRUE(ret);

    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathOp
 * @tc.desc: test for OH_Drawing_PathOp.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathOp, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathAddCircle(path, 1.0, 1.0, 1.0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathClose(path);

    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    EXPECT_NE(path2, nullptr);
    OH_Drawing_PathAddCircle(path2, 2.0, 2.0, 2.0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathClose(path2);

    bool ret = OH_Drawing_PathOp(path, path2, OH_Drawing_PathOpMode::PATH_OP_MODE_UNION);
    EXPECT_TRUE(ret);

    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathGetMatrix
 * @tc.desc: test for OH_Drawing_PathGetMatrix.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathGetMatrix, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathAddCircle(path, 1.0, 1.0, 1.0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathClose(path);

    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    float distance = 1.0;
    bool ret =
        OH_Drawing_PathGetMatrix(path, false, distance, matrix, OH_Drawing_PathMeasureMatrixFlags::GET_POSITION_MATRIX);
    EXPECT_TRUE(ret);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: OH_Drawing_PathBuildFromSvgString
 * @tc.desc: test for OH_Drawing_PathBuildFromSvgString.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPathTest, OH_Drawing_PathBuildFromSvgString, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    const char *str = "123456";
    OH_Drawing_PathBuildFromSvgString(path, str);
    OH_Drawing_PathDestroy(path);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS