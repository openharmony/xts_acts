/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
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
#include "drawing_memory_stream.h"
#include "effect/color_filter.h"
#include "effect/filter.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeDrawingCanvasTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    protected:
        OH_Drawing_Canvas *canvas_ = nullptr;
        OH_Drawing_Brush *brush_ = nullptr;
};

constexpr uint32_t POINT_PARAMETER = 3;
constexpr uint32_t COLOR_PARAMETER = 3;

void NativeDrawingCanvasTest::SetUpTestCase() {}
void NativeDrawingCanvasTest::TearDownTestCase() {}
void NativeDrawingCanvasTest::SetUp()
{
    canvas_ = OH_Drawing_CanvasCreate();
    ASSERT_NE(nullptr, canvas_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    brush_ = OH_Drawing_BrushCreate();
    EXPECT_NE(brush_, nullptr);
    OH_Drawing_BrushSetColor(brush_, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas_, brush_);
}

void NativeDrawingCanvasTest::TearDown()
{
    if (canvas_ != nullptr) {
        OH_Drawing_CanvasDetachBrush(canvas_);
        OH_Drawing_BrushDestroy(brush_);
        brush_ = nullptr;
        OH_Drawing_CanvasDestroy(canvas_);
        canvas_ = nullptr;
    }
}

/*
 * @tc.name: NativeDrawingCanvasTest_CanvasNULLPTR001
 * @tc.desc: test for OH_Drawing_CanvasBind.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_CanvasNULLPTR001, Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_CanvasBind(nullptr, bitmap);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasAttachPen(canvas_, nullptr);
    OH_Drawing_CanvasTranslate(canvas_, INT32_MIN, INT32_MIN);
    OH_Drawing_CanvasTranslate(canvas_, INT32_MAX, INT32_MAX);
    OH_Drawing_CanvasDrawLine(nullptr, 0, 0, 20, 20);
    OH_Drawing_CanvasDrawLine(canvas_, 0, 0, INT32_MAX, INT32_MAX);
    OH_Drawing_CanvasDrawLine(canvas_, 0, 0, INT32_MIN, INT32_MIN);
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, INT32_MAX, INT32_MIN);
    OH_Drawing_PathMoveTo(nullptr, 9999, -1000);
    OH_Drawing_PathClose(nullptr);
    OH_Drawing_PathClose(path);
    OH_Drawing_CanvasDrawPath(nullptr, path);
    OH_Drawing_CanvasDrawPath(canvas_, nullptr);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: NativeDrawingCanvasTest_CanvasBind002
 * @tc.desc: test for OH_Drawing_CanvasBind.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_CanvasBind002, Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_CanvasBind(canvas_, bitmap);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasTest_canvas003
 * @tc.desc: test for OH_Drawing_CanvasAttachPen & OH_Drawing_CanvasDetachPen.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_canvas003, Function | MediumTest | Level1)
{
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);
    OH_Drawing_CanvasAttachPen(canvas_, pen);
    OH_Drawing_CanvasDetachPen(canvas_);
    OH_Drawing_PenDestroy(pen);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawLine004
 * @tc.desc: test for OH_Drawing_CanvasDrawLine.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawLine004, Function | MediumTest | Level1)
{
    OH_Drawing_CanvasDrawLine(canvas_, 0, 0, 20, 20);
    OH_Drawing_CanvasDrawLine(canvas_, -15.2f, -1, 0, 20);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawPath005
 * @tc.desc: test for OH_Drawing_CanvasDrawPath.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawPath005, Function | MediumTest | Level1)
{
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    constexpr int height = 300;
    constexpr int width = 300;
    constexpr float arc = 18.0f;
    int len = height / 4;
    float aX = width / 2;
    float aY = height / 4;
    float dX = aX - len * std::sin(arc);
    float dY = aY + len * std::cos(arc);
    float cX = aX + len * std::sin(arc);
    float cY = dY;
    float bX = aX + (len / 2.0);
    float bY = aY + std::sqrt((cX - dX) * (cX - dX) + (len / 2.0) * (len / 2.0));
    float eX = aX - (len / 2.0);
    float eY = bY;
    OH_Drawing_PathMoveTo(path, aX, aY);
    OH_Drawing_PathLineTo(path, bX, bY);
    OH_Drawing_PathLineTo(path, cX, cY);
    OH_Drawing_PathLineTo(path, dX, dY);
    OH_Drawing_PathLineTo(path, eX, eY);
    OH_Drawing_PathClose(path);
    OH_Drawing_CanvasDrawPath(canvas_, path);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawPoints006
 * @tc.desc: test for OH_Drawing_CanvasDrawPoints.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawPoints006, Function | MediumTest | Level1)
{
    OH_Drawing_Point2D pointOne={250, 500};
    OH_Drawing_Point2D pointTwo={200, 500};
    OH_Drawing_Point2D pointThree={500, 700};
    OH_Drawing_Point2D points[POINT_PARAMETER] = {pointOne, pointTwo, pointThree};
    OH_Drawing_CanvasDrawPoints(canvas_, POINT_MODE_POINTS, POINT_PARAMETER, nullptr);
    OH_Drawing_CanvasDrawPoints(nullptr, POINT_MODE_POINTS, POINT_PARAMETER, nullptr);
    OH_Drawing_CanvasDrawPoints(canvas_, POINT_MODE_POINTS, POINT_PARAMETER, points);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawVertices007
 * @tc.desc: test for OH_Drawing_CanvasDrawVertices.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawVertices007, Function | MediumTest | Level1)
{
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {100, 100};
    OH_Drawing_Point2D point_three = {300, 100};
    OH_Drawing_Point2D points_vertices[POINT_PARAMETER] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {1, 1};
    OH_Drawing_Point2D texs_three = {2, 0};
    OH_Drawing_Point2D texs_vertices[POINT_PARAMETER] = {texs_one, texs_two, texs_three};
    uint32_t colors[COLOR_PARAMETER] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};

    uint16_t indices[COLOR_PARAMETER] = {0, 1, 2};
    OH_Drawing_CanvasDrawVertices(nullptr, VERTEX_MODE_TRIANGLES, POINT_PARAMETER, points_vertices, texs_vertices,
                                  colors, POINT_PARAMETER, indices, BLEND_MODE_COLOR);
    OH_Drawing_CanvasDrawVertices(canvas_, VERTEX_MODE_TRIANGLES, POINT_PARAMETER, nullptr, texs_vertices, colors,
                                  POINT_PARAMETER, indices, BLEND_MODE_COLOR);
    OH_Drawing_CanvasDrawVertices(canvas_, VERTEX_MODE_TRIANGLES, POINT_PARAMETER, points_vertices, nullptr, colors,
                                  POINT_PARAMETER, indices, BLEND_MODE_COLOR);
    OH_Drawing_CanvasDrawVertices(canvas_, VERTEX_MODE_TRIANGLES, POINT_PARAMETER, points_vertices, texs_vertices,
                                  nullptr, POINT_PARAMETER, indices, BLEND_MODE_COLOR);
    OH_Drawing_CanvasDrawVertices(canvas_, VERTEX_MODE_TRIANGLES, POINT_PARAMETER, points_vertices, texs_vertices,
                                  colors, POINT_PARAMETER, nullptr, BLEND_MODE_COLOR);
    OH_Drawing_CanvasDrawVertices(nullptr, VERTEX_MODE_TRIANGLES, POINT_PARAMETER, nullptr, nullptr, nullptr,
                                  POINT_PARAMETER, nullptr, BLEND_MODE_COLOR);
    OH_Drawing_CanvasDrawVertices(canvas_, VERTEX_MODE_TRIANGLES, POINT_PARAMETER, points_vertices, texs_vertices,
                                  colors, POINT_PARAMETER, indices, BLEND_MODE_COLOR);
}

/*
 * @tc.name: NativeDrawingCanvasTest_SaveAndRestore008
 * @tc.desc: test for OH_Drawing_CanvasSave & OH_Drawing_CanvasRestore.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_SaveAndRestore008, Function | MediumTest | Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 300);
    EXPECT_NE(nullptr, rect);
    OH_Drawing_CanvasSave(nullptr);
    OH_Drawing_CanvasSave(canvas_);
    OH_Drawing_CanvasTranslate(nullptr, 100, 100);
    OH_Drawing_CanvasTranslate(canvas_, 100, 100);
    OH_Drawing_CanvasDrawArc(nullptr, rect, 10, 200);
    OH_Drawing_CanvasDrawArc(canvas_, nullptr, 10, 200);
    OH_Drawing_CanvasDrawArc(canvas_, rect, 10, 200);
    OH_Drawing_CanvasRestore(nullptr);
    OH_Drawing_CanvasRestore(canvas_);
    OH_Drawing_CanvasTranslate(canvas_, 200, 200);
    OH_Drawing_CanvasDrawOval(nullptr, rect);
    OH_Drawing_CanvasDrawOval(canvas_, nullptr);
    OH_Drawing_CanvasDrawOval(canvas_, rect);
    OH_Drawing_RectDestroy(nullptr);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: NativeDrawingCanvasTest_Clear009
 * @tc.desc: test for OH_Drawing_CanvasClear.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_Clear009, Function | MediumTest | Level1)
{
    OH_Drawing_CanvasClear(nullptr, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    OH_Drawing_CanvasClear(canvas_, -100);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(INT32_MAX, INT32_MAX, INT32_MIN, INT32_MIN));
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
}

/*
 * @tc.name: NativeDrawingCanvasTest_RestoreToCount010
 * @tc.desc: test for OH_Drawing_CanvasRestoreToCount.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_RestoreToCount010, Function | MediumTest | Level1)
{
    OH_Drawing_CanvasSave(canvas_);
    OH_Drawing_CanvasTranslate(canvas_, 300, 300);
    OH_Drawing_CanvasSave(canvas_);
    OH_Drawing_CanvasTranslate(canvas_, 100, 100);
    OH_Drawing_CanvasSave(canvas_);
    OH_Drawing_CanvasTranslate(canvas_, 100, 100);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    int count = OH_Drawing_CanvasGetSaveCount(canvas_);
    EXPECT_EQ(count, 4);
    OH_Drawing_CanvasRestoreToCount(nullptr, count - 2);
    OH_Drawing_CanvasRestoreToCount(canvas_, count - 2);
    EXPECT_EQ(2, OH_Drawing_CanvasGetSaveCount(canvas_));
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(nullptr, 20, 20);
    EXPECT_EQ(roundRect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(nullptr, roundRect);
    OH_Drawing_CanvasDrawRoundRect(canvas_, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas_, roundRect);
    OH_Drawing_CanvasRestoreToCount(canvas_, 1);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(nullptr);
    OH_Drawing_RectDestroy(nullptr);
}

/*
 * @tc.name: NativeDrawingCanvasTest_Scale011
 * @tc.desc: test for OH_Drawing_CanvasScale.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_Scale011, Function | MediumTest | Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 20, 60, 120);
    OH_Drawing_CanvasTranslate(canvas_, 20, 20);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_CanvasScale(nullptr, 2, .5f);
    OH_Drawing_CanvasScale(canvas_, 2, .5f);
    OH_Drawing_BrushSetColor(nullptr, 0xFF67C23A);
    OH_Drawing_BrushSetColor(brush_, 0xFF67C23A);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
}
/*
 * @tc.name  : NativeDrawingCanvasTest_Skew012
 * @tc.desc  : test for OH_Drawing_CanvasSkew.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_Skew012, Function | MediumTest | Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    ASSERT_NE(rect, nullptr);
    OH_Drawing_CanvasSkew(nullptr, 0, 0.3f);
    OH_Drawing_BrushSetColor(brush_, 0xFF67C23A);
    OH_Drawing_CanvasSkew(canvas_, 0, 0.3f);
    OH_Drawing_CanvasDrawRect(canvas_, rect);

    OH_Drawing_Matrix* matrixSkew= OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixReset(matrixSkew);
    Matrix* cMatrix = reinterpret_cast<Matrix*>(matrixSkew);
    EXPECT_NE(cMatrix, nullptr);
    cMatrix->SetSkew(0, 0.3f);

    OH_Drawing_Matrix* matrixTotal = OH_Drawing_MatrixCreate();
    OH_Drawing_CanvasGetTotalMatrix(canvas_, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(nullptr, matrixTotal);
    float valueMatrixSkew;
    float valueCanvasSkew;
    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 0);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 0);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    OH_Drawing_CanvasGetTotalMatrix(canvas_, matrixTotal);
    EXPECT_NE(matrixTotal, nullptr);

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 0);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 0);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 1);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 1);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 2);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 2);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 3);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 3);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 4);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 4);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 5);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 5);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 6);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 6);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 7);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 7);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    valueMatrixSkew = OH_Drawing_MatrixGetValue(matrixSkew, 8);
    valueCanvasSkew = OH_Drawing_MatrixGetValue(matrixTotal, 8);
    EXPECT_TRUE(IsScalarAlmostEqual(valueMatrixSkew, valueCanvasSkew));

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_MatrixDestroy(matrixSkew);
    OH_Drawing_MatrixDestroy(matrixTotal);
}
/*
 * @tc.name: NativeDrawingCanvasTest_ClipRect013
 * @tc.desc: test for OH_Drawing_CanvasClipRect.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ClipRect013, Function | MediumTest | Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 90, 90);
    OH_Drawing_CanvasRotate(nullptr, 10, 0, 0);
    OH_Drawing_CanvasRotate(canvas_, 10, 0, 0);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    OH_Drawing_BrushSetAntiAlias(nullptr, true);
    OH_Drawing_BrushSetAntiAlias(brush_, true);
    for (auto alias : {false, true}) {
        OH_Drawing_CanvasSave(canvas_);
        OH_Drawing_CanvasClipRect(nullptr, rect, OH_Drawing_CanvasClipOp::INTERSECT, alias);
        OH_Drawing_CanvasClipRect(canvas_, nullptr, OH_Drawing_CanvasClipOp::INTERSECT, alias);
        OH_Drawing_CanvasClipRect(canvas_, rect, OH_Drawing_CanvasClipOp::INTERSECT, alias);
        OH_Drawing_CanvasDrawCircle(canvas_, nullptr, 60);
        OH_Drawing_CanvasDrawCircle(nullptr, point, 60);
        OH_Drawing_CanvasDrawCircle(canvas_, point, 60);
        OH_Drawing_CanvasRestore(canvas_);
        OH_Drawing_CanvasTranslate(canvas_, 80, 0);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ClipPath014
 * @tc.desc: test for OH_Drawing_CanvasClipPath.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ClipPath014, Function | MediumTest | Level1)
{
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 100, 300);
    OH_Drawing_PathLineTo(path, 200, 300);
    OH_Drawing_PathLineTo(path, 200, 400);
    OH_Drawing_PathLineTo(path, 100, 350);
    OH_Drawing_PathClose(nullptr);
    OH_Drawing_PathClose(path);
    OH_Drawing_CanvasClipPath(nullptr, path, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_CanvasClipPath(canvas_, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_CanvasClipPath(canvas_, path, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 300, 200, 400);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: NativeDrawingCanvasTest_LinearGradient015
 * @tc.desc: test for LinearGradient
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_LinearGradient015, Function | MediumTest | Level1)
{
    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect* linearGradient = OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt,
        color, pos, 2, OH_Drawing_TileMode::CLAMP);
    OH_Drawing_BrushSetShaderEffect(nullptr, linearGradient);
    OH_Drawing_BrushSetShaderEffect(brush_, nullptr);
    OH_Drawing_BrushSetShaderEffect(brush_, linearGradient);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ShaderEffectDestroy(nullptr);
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
}

/*
 * @tc.name: NativeDrawingCanvasTest_SweepGradient016
 * @tc.desc: test for sweep gradient shader effect
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_SweepGradient016, Function | MediumTest | Level1)
{
    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(350, 450);
    uint32_t colors[] = {0xffff00ff, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect* sweepGradient = OH_Drawing_ShaderEffectCreateSweepGradient(nullptr, nullptr,
        nullptr, -2, OH_Drawing_TileMode::MIRROR);
    EXPECT_EQ(sweepGradient, nullptr);
    sweepGradient = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors,
        pos, 2, OH_Drawing_TileMode::MIRROR);
    EXPECT_NE(sweepGradient, nullptr);
    OH_Drawing_BrushSetShaderEffect(brush_, sweepGradient);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(300, 400, 500, 500);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ShaderEffectDestroy(sweepGradient);
    OH_Drawing_PointDestroy(centerPt);
}
/*
 * @tc.name: NativeDrawingCanvasTest_ImageShader017
 * @tc.desc: test for image shader effect
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ImageShader017, Function | MediumTest | Level1)
{
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0x00));
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR, MIPMAP_MODE_LINEAR);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect *effect = nullptr;
    effect = OH_Drawing_ShaderEffectCreateImageShader(nullptr, CLAMP, CLAMP, nullptr, nullptr);
    EXPECT_EQ(effect, nullptr);
    effect = OH_Drawing_ShaderEffectCreateImageShader(image, CLAMP, CLAMP, options, matrix);
    OH_Drawing_BrushSetShaderEffect(brush, effect);
    OH_Drawing_CanvasAttachBrush(canvas_, brush);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(300, 400, 500, 500);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_ImageDestroy(image);
}

/*
 * @tc.name: NativeDrawingCanvasTest_RadialGradient
 * @tc.desc: test for Radial gradient shader effect
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_RadialGradient, Function | MediumTest | Level1)
{
    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(350, 450);
    uint32_t colors[] = {0xffff00ff, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect* radialGradient = OH_Drawing_ShaderEffectCreateRadialGradient(nullptr, 20,
        nullptr, nullptr, -2, OH_Drawing_TileMode::MIRROR);
    EXPECT_EQ(radialGradient, nullptr);
    radialGradient = OH_Drawing_ShaderEffectCreateRadialGradient(centerPt, 30, colors,
        pos, 2, OH_Drawing_TileMode::MIRROR);
    EXPECT_NE(radialGradient, nullptr);
    OH_Drawing_BrushSetShaderEffect(brush_, radialGradient);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(300, 400, 500, 500);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ShaderEffectDestroy(radialGradient);
    OH_Drawing_PointDestroy(centerPt);
}

/*
 * @tc.name: NativeDrawingCanvasTest_MaskFilter018
 * @tc.desc: test for maskfilter
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_MaskFilter018, Function | MediumTest | Level1)
{
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush_), 0xFFFF0000);
    OH_Drawing_MaskFilter* maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, 10, true);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    OH_Drawing_FilterSetMaskFilter(nullptr, maskFilter);
    OH_Drawing_FilterSetMaskFilter(filter, nullptr);
    OH_Drawing_FilterSetMaskFilter(filter, maskFilter);
    OH_Drawing_BrushSetFilter(brush_, filter);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_MaskFilterDestroy(maskFilter);
    OH_Drawing_FilterDestroy(filter);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ColorFilter019
 * @tc.desc: test for colorfilter create blend mode, linear to srgb gamma, luma, matrix
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ColorFilterCreateBlendMode019, Function | MediumTest | Level1)
{
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush_), 0xFFFF0000);
    OH_Drawing_ColorFilter* colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff,
        OH_Drawing_BlendMode::BLEND_MODE_SRC);
    EXPECT_NE(colorFilter, nullptr);
    OH_Drawing_ColorFilter* colorFilterTmp = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    EXPECT_NE(colorFilterTmp, nullptr);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    EXPECT_NE(filter, nullptr);

    OH_Drawing_FilterSetColorFilter(nullptr, colorFilter);
    OH_Drawing_FilterSetColorFilter(filter, nullptr);
    OH_Drawing_FilterGetColorFilter(filter, colorFilterTmp);
    EXPECT_EQ(reinterpret_cast<ColorFilter*>(colorFilterTmp)->GetType(), ColorFilter::FilterType::NO_TYPE);

    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    OH_Drawing_FilterGetColorFilter(filter, colorFilterTmp);
    EXPECT_EQ(reinterpret_cast<ColorFilter*>(colorFilterTmp)->GetType(), ColorFilter::FilterType::BLEND_MODE);

    OH_Drawing_BrushSetFilter(brush_, nullptr);
    OH_Drawing_BrushSetFilter(brush_, filter);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_ColorFilter* linear = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    OH_Drawing_FilterSetColorFilter(filter, linear);
    OH_Drawing_CanvasTranslate(canvas_, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_ColorFilter* luma = OH_Drawing_ColorFilterCreateLuma();
    OH_Drawing_FilterSetColorFilter(filter, luma);
    OH_Drawing_CanvasTranslate(canvas_, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    const float matrix[20] = {
        1, 0, 0, 0, 0,
        0, 1, 0, 0, 0,
        0, 0, 1, 0, 0,
        0, 0, 0, 0.5f, 0
    };
    OH_Drawing_ColorFilter* matrixFilter = OH_Drawing_ColorFilterCreateMatrix(nullptr);
    EXPECT_EQ(matrixFilter, nullptr);
    matrixFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    EXPECT_NE(matrixFilter, nullptr);
    OH_Drawing_FilterSetColorFilter(filter, matrixFilter);
    OH_Drawing_CanvasTranslate(canvas_, 300, 300);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ColorFilterDestroy(luma);
    OH_Drawing_ColorFilterDestroy(matrixFilter);
    OH_Drawing_ColorFilterDestroy(linear);
    OH_Drawing_ColorFilterDestroy(colorFilterTmp);
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_FilterDestroy(nullptr);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ColorFilterCreateCompose020
 * @tc.desc: test for create compose color filter
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ColorFilterCreateCompose020, Function | MediumTest | Level1)
{
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush_), 0xFFFF0000);
    OH_Drawing_ColorFilter* outerFilter = OH_Drawing_ColorFilterCreateLuma();
    OH_Drawing_ColorFilter* innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    OH_Drawing_ColorFilter* compose = OH_Drawing_ColorFilterCreateCompose(nullptr, nullptr);
    EXPECT_EQ(compose, nullptr);
    compose = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
    EXPECT_NE(compose, nullptr);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    OH_Drawing_FilterSetColorFilter(filter, compose);
    OH_Drawing_BrushSetFilter(brush_, filter);
    OH_Drawing_Canvas* canvas_ = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ColorFilterDestroy(outerFilter);
    OH_Drawing_ColorFilterDestroy(innerFilter);
    OH_Drawing_ColorFilterDestroy(compose);
    OH_Drawing_FilterDestroy(filter);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawBitmap021
 * @tc.desc: test for DrawBitmap
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawBitmap021, Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);
    OH_Drawing_CanvasDrawBitmap(canvas_, bitmap, 0, 0);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_BitmapDestroy(bitmap);
}
/*
 * @tc.name: NativeDrawingCanvasTest_DrawBitmapRect022
 * @tc.desc: test for DrawBitmapRect
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawBitmapRect022, Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST, OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    EXPECT_NE(options, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, bitmap, src, dst, options);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, bitmap, src, dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, bitmap, src, nullptr, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, bitmap, nullptr, nullptr, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, nullptr, nullptr, nullptr, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(nullptr, nullptr, nullptr, nullptr, nullptr);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasTest_SetMatrix023
 * @tc.desc: test for SetMatrix
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_SetMatrix023, Function | MediumTest | Level1)
{
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(
        matrix,
        1, 0, 0,
        0, -1, 0,
        0, 0, 1);
    OH_Drawing_CanvasSetMatrix(canvas_, matrix);
    OH_Drawing_CanvasSetMatrix(canvas_, nullptr);
    OH_Drawing_CanvasSetMatrix(nullptr, nullptr);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ResetMatrix024
 * @tc.desc: test for ResetMatrix
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ResetMatrix024, Function | MediumTest | Level1)
{
    OH_Drawing_CanvasResetMatrix(nullptr);
    OH_Drawing_CanvasResetMatrix(canvas_);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawImageRect025
 * @tc.desc: test for DrawImageRect
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawImageRect025, Function | MediumTest | Level1)
{
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST, OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    EXPECT_NE(options, nullptr);
    OH_Drawing_CanvasDrawImageRect(canvas_, image, rect, options);
    OH_Drawing_CanvasDrawImageRect(canvas_, image, rect, nullptr);
    OH_Drawing_CanvasDrawImageRect(canvas_, image, nullptr, nullptr);
    OH_Drawing_CanvasDrawImageRect(canvas_, nullptr, nullptr, nullptr);
    OH_Drawing_CanvasDrawImageRect(nullptr, nullptr, nullptr, nullptr);
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas_, image, rect, rect, options, STRICT_SRC_RECT_CONSTRAINT);
    OH_Drawing_CanvasDrawImageRectWithSrc(nullptr, nullptr, nullptr, nullptr, nullptr, STRICT_SRC_RECT_CONSTRAINT);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_ImageDestroy(image);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ReadPixelsToBitmap026
 * @tc.desc: test for ReadPixelsToBitmap
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ReadPixelsToBitmap026, Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixelsToBitmap(canvas_, bitmap, 100, 100));
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixelsToBitmap(canvas_, nullptr, 100, 100));
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixelsToBitmap(nullptr, nullptr, 100, 100));
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ReadPixels027
 * @tc.desc: test for ReadPixels
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ReadPixels027, Function | MediumTest | Level1)
{
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixels(canvas_, &imageInfo, pixels, 0, 0, 0));
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixels(canvas_, &imageInfo, nullptr, 0, 0, 0));
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixels(canvas_, nullptr, nullptr, 0, 0, 0));
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixels(nullptr, nullptr, nullptr, 0, 0, 0));
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasTest_GetWidth028
 * @tc.desc: test for GetWidth
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_GetWidth028, Function | MediumTest | Level1)
{
    EXPECT_TRUE(OH_Drawing_CanvasGetWidth(nullptr) == 0);
    EXPECT_TRUE(OH_Drawing_CanvasGetWidth(canvas_) >= 0);
}

/*
 * @tc.name: NativeDrawingCanvasTest_GetHeight029
 * @tc.desc: test for GetHeight
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_GetHeight029, Function | MediumTest | Level1)
{
    EXPECT_TRUE(OH_Drawing_CanvasGetHeight(nullptr) == 0);
    EXPECT_TRUE(OH_Drawing_CanvasGetHeight(canvas_) >= 0);
}

/*
 * @tc.name: NativeDrawingCanvasTest_GetLocalClipBounds030
 * @tc.desc: test for GetLocalClipBounds
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_GetLocalClipBounds030, Function | MediumTest | Level1)
{
    OH_Drawing_CanvasGetLocalClipBounds(nullptr, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 1, 1);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(nullptr, rect);
    OH_Drawing_CanvasGetLocalClipBounds(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ConcatMatrix031
 * @tc.desc: test for ConcatMatrix
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ConcatMatrix031, Function | MediumTest | Level1)
{
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(
        matrix,
        1, 0, 0,
        0, -1, 0,
        0, 0, 1);
    OH_Drawing_CanvasConcatMatrix(canvas_, matrix);
    OH_Drawing_CanvasConcatMatrix(canvas_, nullptr);
    OH_Drawing_CanvasConcatMatrix(nullptr, nullptr);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawShadow032
 * @tc.desc: test for DrawShadow
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawShadow032, Function | MediumTest | Level1)
{
    OH_Drawing_Point3D p1{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    OH_Drawing_CanvasDrawShadow(nullptr, nullptr, p1, p2, 0, 0xFF000000,
        0xFF000000, OH_Drawing_CanvasShadowFlags::SHADOW_FLAGS_ALL);

    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_CanvasDrawShadow(canvas_, path, p1, p2, 10, 0xFF000000, 0xFF000000,
        OH_Drawing_CanvasShadowFlags::SHADOW_FLAGS_ALL);
}
/*
 * @tc.name: NativeDrawingCanvasTest_DrawTextBlob033
 * @tc.desc: test for DrawTextBlob
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawTextBlob033, Function | MediumTest | Level1)
{
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetTextSize(font, 20);
    OH_Drawing_FontSetTextSkewX(font, 0.25);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    auto *builder = OH_Drawing_TextBlobBuilderCreate();
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobBuilderAllocRunPos(nullptr, nullptr, INT32_MAX, nullptr));
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, INT32_MIN, nullptr));
    const OH_Drawing_RunBuffer* runBuffer = OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, 9, nullptr);
    ASSERT_NE(runBuffer, nullptr);
    runBuffer->glyphs[0] = 65;
    runBuffer->pos[0] = 0;
    runBuffer->pos[1] = 0;
    runBuffer->glyphs[1] = 227;
    runBuffer->pos[2] = 14.9;
    runBuffer->pos[3] = 0;
    runBuffer->glyphs[2] = 283;
    runBuffer->pos[4] = 25.84;
    runBuffer->pos[5] = 0;
    runBuffer->glyphs[3] = 283;
    runBuffer->pos[6] = 30.62;
    runBuffer->pos[7] = 0;
    runBuffer->glyphs[4] = 299;
    runBuffer->pos[8] = 35.4;
    runBuffer->pos[9] = 0;
    runBuffer->glyphs[5] = 2;
    runBuffer->pos[10] = 47.22;
    runBuffer->pos[11] = 0;
    runBuffer->glyphs[6]= 94;
    runBuffer->pos[12] = 52.62;
    runBuffer->pos[13] = 0;
    runBuffer->glyphs[7] = 37;
    runBuffer->pos[14] = 67.42;
    runBuffer->pos[15] = 0;
    runBuffer->glyphs[8] = 84;
    runBuffer->pos[16] = 81.7;
    runBuffer->pos[17] = 0;
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobBuilderMake(builder);
    OH_Drawing_CanvasDrawTextBlob(canvas_, textBlob, 100, 700);
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_TextBlobBuilderDestroy(builder);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
    OH_Drawing_TextBlobDestroy(nullptr);
    OH_Drawing_TextBlobBuilderDestroy(nullptr);
    OH_Drawing_FontDestroy(nullptr);
    OH_Drawing_TypefaceDestroy(nullptr);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawTextBlob034
 * @tc.desc: test for DrawTextBlob2
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawTextBlob034, Function | MediumTest | Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "123456";
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobCreateFromString(nullptr,
        font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8));
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobCreateFromString(str,
        nullptr, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8));
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(str,
        font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_NE(textBlob, nullptr);
    OH_Drawing_CanvasDrawTextBlob(canvas_, textBlob, 0, 0);
    OH_Drawing_TextBlobGetBounds(textBlob, nullptr);
    OH_Drawing_TextBlobGetBounds(textBlob, rect);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawTextBlob035
 * @tc.desc: test for DrawTextBlob3
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawTextBlob035, Function | MediumTest | Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromFile(nullptr, 0);
    EXPECT_EQ(nullptr, typeface);
    // sub test 1, OH_Drawing_FontGetTypeface
    OH_Drawing_FontGetTypeface(nullptr);
    EXPECT_EQ(nullptr, typeface);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    EXPECT_NE(nullptr, OH_Drawing_FontGetTypeface(font));
    // sub test 2, OH_Drawing_FontCountText
    const char* str = "123456";
    int count = 0;
    count = OH_Drawing_FontCountText(nullptr, str, strlen(str),
        OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_EQ(0, count);
    count = OH_Drawing_FontCountText(font, nullptr, strlen(str),
        OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_EQ(0, count);
    count = OH_Drawing_FontCountText(font, str, strlen(str),
        OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_EQ(strlen(str), count);
    // sub test 3, OH_Drawing_TextBlobCreateFromText
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobCreateFromText(nullptr, strlen(str),
        font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8));
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobCreateFromText(str, strlen(str),
        nullptr, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8));
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromText(str, strlen(str),
        font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_NE(textBlob, nullptr);
    EXPECT_TRUE(OH_Drawing_TextBlobUniqueID(nullptr) == 0);
    EXPECT_TRUE(OH_Drawing_TextBlobUniqueID(textBlob) > 0);
    // draw textblob
    OH_Drawing_CanvasDrawTextBlob(canvas_, textBlob, 0, 0);

    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawTextBlob036
 * @tc.desc: test for DrawTextBlob4
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawTextBlob036, Function | MediumTest | Level1)
{
    size_t length = 1;
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_MemoryStream* memoryStream = OH_Drawing_MemoryStreamCreate(nullptr,
        length, false);
    OH_Drawing_MemoryStreamDestroy(memoryStream);
    EXPECT_EQ(nullptr, memoryStream);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromStream(
        memoryStream, 0);
    EXPECT_EQ(nullptr, typeface);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    EXPECT_NE(nullptr, OH_Drawing_FontGetTypeface(font));
    const char* str = "123456";
    int count = strlen(str);
    OH_Drawing_Point2D pts[count];
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobCreateFromPosText(nullptr, count, &pts[0],
        font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8));
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobCreateFromPosText(str, count, nullptr,
        font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8));
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobCreateFromPosText(str, count, &pts[0],
        nullptr, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8));
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromPosText(str, count, &pts[0],
        font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    EXPECT_NE(textBlob, nullptr);
    OH_Drawing_CanvasDrawTextBlob(canvas_, textBlob, 0, 0);

    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
}

/*
 * @tc.name: NativeDrawingCanvasTest_SaveLayer037
 * @tc.desc: test for SaveLayer
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_SaveLayer037, Function | MediumTest | Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    // test exception
    OH_Drawing_CanvasSaveLayer(nullptr, rect, brush);
    OH_Drawing_CanvasSaveLayer(canvas_, rect, brush);
    OH_Drawing_CanvasRestore(canvas_);
    OH_Drawing_RectDestroy(rect);
}
/*
 * @tc.name: NativeDrawingTest001
 * @tc.desc: test for fontSetLinearText
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, OH_Drawing_FontSetLinearText_001, Function | MediumTest | Level1)
{
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 20);
    OH_Drawing_FontSetTextSkewX(font, 0.25);
    OH_Drawing_FontSetLinearText(font, true);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: NativeDrawingTest002
 * @tc.desc: test for penSetFilter
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, OH_Drawing_PenSetFilter_001, Function | MediumTest | Level1)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_EQ(canvas == nullptr, false);
    OH_Drawing_ColorFilter* colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff,
        OH_Drawing_BlendMode::BLEND_MODE_SRC);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_PenSetColor(pen, 0xff00ff00);
    OH_Drawing_PenSetFilter(pen, filter);
    OH_Drawing_CanvasAttachPen(canvas, pen);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(100, 400, 200, 500);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.name: NativeDrawingTest003
 * @tc.desc: test for penSetFilter
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, OH_Drawing_PenSetshaderEffect, Function | MediumTest | Level1)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_EQ(canvas == nullptr, false);
    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect* linearGradient = OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt,
        color, pos, 2, OH_Drawing_TileMode::CLAMP);
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_PenSetShaderEffect(pen, linearGradient);
    OH_Drawing_CanvasAttachPen(canvas, pen);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(100, 400, 200, 500);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_CanvasDestroy(canvas);
}
/*
 * @tc.name: NativeDrawingCanvasTest_DrawRegion038
 * @tc.desc: test for DrawRegion
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawRegion038, Function | MediumTest | Level1)
{
    OH_Drawing_Region* region=OH_Drawing_RegionCreate();
    OH_Drawing_Rect* rect=OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_CanvasDrawRegion(canvas_, region);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawBackground039
 * @tc.desc: test for DrawBackground
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawBackground039, Function | MediumTest | Level1)
{
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    OH_Drawing_CanvasDrawBackground(canvas_, brush);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawColor046
 * @tc.desc: test for DrawColor
 * @tc.type: FUNC
 * @tc.require: SR000S9F0C
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawColor046, Function | MediumTest | Level1)
{
    EXPECT_EQ(OH_Drawing_CanvasDrawColor(nullptr, 0xFFFF0000, OH_Drawing_BlendMode::BLEND_MODE_SRC),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_CanvasDrawColor(canvas_, 0xFFFF0000, OH_Drawing_BlendMode::BLEND_MODE_COLOR),
        OH_DRAWING_SUCCESS);
}

/*
 * @tc.name: NativeDrawingCanvasTest_IsClipEmpty042
 * @tc.desc: test for if clip is empty
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_IsClipEmpty042, Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // 720: bitmap's width, 720: bitmap's height
    constexpr uint32_t width = 720;
    constexpr uint32_t height = 720;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);

    // 150.0f: rect's left, 100.0f: rect's top, 500.0f: rect's right, 500.0f: rect's bottom
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(150.0f, 100.0f, 500.f, 500.f);

    OH_Drawing_CanvasClipRect(canvas_, rect, OH_Drawing_CanvasClipOp::INTERSECT, false);

    bool isClipEmpty = false;
    EXPECT_EQ(OH_Drawing_CanvasIsClipEmpty(canvas_, &isClipEmpty), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isClipEmpty, false);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasTest_GetImageInfo043
 * @tc.desc: test for Gets ImageInfo of Canvas.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_GetImageInfo043, Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // 720: bitmap's width, 720: bitmap's height
    constexpr uint32_t width = 720;
    constexpr uint32_t height = 720;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);
    OH_Drawing_Image_Info* imageInfo = new OH_Drawing_Image_Info();
    EXPECT_EQ(OH_Drawing_CanvasGetImageInfo(canvas_, imageInfo), OH_DRAWING_SUCCESS);
    EXPECT_EQ(720, imageInfo->width);
    EXPECT_EQ(720, imageInfo->height);
    EXPECT_EQ(1, imageInfo->alphaType);
    EXPECT_EQ(4, imageInfo->colorType);
    delete imageInfo;
}


/*
 * @tc.name: NativeDrawingCanvasTest_ClipRegion044
 * @tc.desc: test for Drawing Canvas Clip Region.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ClipRegion044, Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 720; // 720: width of canvas
    constexpr uint32_t height = 720; // 720: height of canvas
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);

    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // 0.0f: rect's left, 0.0f: rect's top, 720.0f: rect's right, 720.0f: rect's bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 720.f, 720.f);
    OH_Drawing_RegionSetRect(region, rect);
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(canvas_, region, OH_Drawing_CanvasClipOp::INTERSECT), OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(nullptr, region, OH_Drawing_CanvasClipOp::INTERSECT),
        OH_DRAWING_ERROR_INVALID_PARAMETER);

    EXPECT_EQ(720, OH_Drawing_CanvasGetWidth(canvas_));
    EXPECT_EQ(720, OH_Drawing_CanvasGetHeight(canvas_));

    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BitmapDestroy(bitmap);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS