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

#include "drawing_matrix.h"
#include "drawing_rect.h"
#include "utils/scalar.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeMatrixTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_MatrixCreateRotation
 * @tc.desc: test for OH_Drawing_MatrixCreateRotation.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixCreateRotation, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(180, 1, 1);
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixCreateScale
 * @tc.desc: test for OH_Drawing_MatrixCreateScale.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixCreateScale, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(10, 10, 10, 10);
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixCreateTranslation
 * @tc.desc: test for OH_Drawing_MatrixCreateTranslation.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixCreateTranslation, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(100, 200);
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixSetMatrix
 * @tc.desc: test for OH_Drawing_MatrixSetMatrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixSetMatrix, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixRotate
 * @tc.desc: test for OH_Drawing_MatrixRotate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixRotate, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixRotate(matrix, 180, 1, 1);
    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixTranslate
 * @tc.desc: test for OH_Drawing_MatrixTranslate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixTranslate, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixTranslate(matrix, 100, 200);
    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixScale
 * @tc.desc: test for OH_Drawing_MatrixScale.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixScale, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixScale(matrix, 10, 10, 10, 10);
    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixSetPolyToPoly
 * @tc.desc: test for OH_Drawing_MatrixSetPolyToPoly.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixSetPolyToPoly, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);

    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    EXPECT_TRUE(OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 0));

    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixSetRectToRect
 * @tc.desc: test for OH_Drawing_MatrixSetRectToRect.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixSetRectToRect, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);

    OH_Drawing_Rect *rectSrcOne = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_Rect *rectDstOne = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_Matrix *matrixOne = OH_Drawing_MatrixCreate();
    bool isSuccess =
        OH_Drawing_MatrixSetRectToRect(matrixOne, rectSrcOne, rectDstOne, OH_Drawing_ScaleToFit::SCALE_TO_FIT_FILL);
    EXPECT_EQ(isSuccess, false);
    isSuccess =
        OH_Drawing_MatrixSetRectToRect(nullptr, rectSrcOne, rectDstOne, OH_Drawing_ScaleToFit::SCALE_TO_FIT_FILL);
    EXPECT_EQ(isSuccess, false);
    isSuccess =
        OH_Drawing_MatrixSetRectToRect(matrixOne, nullptr, rectDstOne, OH_Drawing_ScaleToFit::SCALE_TO_FIT_FILL);
    EXPECT_EQ(isSuccess, false);
    isSuccess =
        OH_Drawing_MatrixSetRectToRect(matrixOne, rectSrcOne, nullptr, OH_Drawing_ScaleToFit::SCALE_TO_FIT_FILL);
    EXPECT_EQ(isSuccess, false);
    isSuccess = OH_Drawing_MatrixSetRectToRect(nullptr, nullptr, nullptr, OH_Drawing_ScaleToFit::SCALE_TO_FIT_FILL);
    EXPECT_EQ(isSuccess, false);

    OH_Drawing_Rect *rectSrcTwo = OH_Drawing_RectCreate(1, 2, 3, 4);
    OH_Drawing_Rect *rectDstTwo = OH_Drawing_RectCreate(5, 6, 8, 9);
    OH_Drawing_Matrix *matrixTwo = OH_Drawing_MatrixCreate();
    bool isSuccessTwo =
        OH_Drawing_MatrixSetRectToRect(matrixTwo, rectSrcTwo, rectDstTwo, OH_Drawing_ScaleToFit::SCALE_TO_FIT_FILL);
    EXPECT_EQ(isSuccessTwo, true);

    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MatrixPreScale
 * @tc.desc: test for OH_Drawing_MatrixPreScale.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixPreScale, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixPreScale(nullptr, 10, 10, 10, 10);
    OH_Drawing_MatrixPreScale(matrix, 10, 10, 10, 10);
    float value;
    value = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_TRUE(IsScalarAlmostEqual(value, 10));

    OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
    OH_Drawing_MatrixPreScale(matrix, 4, 6, 5, 7);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix2, 8, 6, -62, 4, 12, -83, 12, 6, -79);
    bool ret = false;
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}
/*
 * @tc.name: OH_Drawing_MatrixPreTranslate
 * @tc.desc: test for OH_Drawing_MatrixPreTranslate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixPreTranslate, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixPreTranslate(nullptr, 10, 10);
    OH_Drawing_MatrixPreTranslate(matrix, 10, 10);
    float value;
    value = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_TRUE(IsScalarAlmostEqual(value, 1));

    OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
    OH_Drawing_MatrixPreTranslate(matrix, 2, 4);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix2, 2, 1, 11, 1, 2, 12, 3, 1, 11);
    bool ret = false;
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}
/*
 * @tc.name: OH_Drawing_MatrixPreRotate
 * @tc.desc: test for OH_Drawing_MatrixPreRotate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixPreRotate, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 2, 0, 0, 0, 1, 2, 0, 0, 1);
    OH_Drawing_MatrixPreRotate(matrix, 5, 10, 20);
    OH_Drawing_MatrixPreRotate(nullptr, 5, 10, 20);

    OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    OH_Drawing_MatrixPreRotate(matrix, 90, 1, 0);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix2, 2, -1, 2, 5, -4, 5, 8, -7, 8);
    bool ret = false;
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.name: OH_Drawing_MatrixPostScale
 * @tc.desc: test for OH_Drawing_MatrixPostScale.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixPostScale, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixPostScale(nullptr, 10, 10, 10, 10);
    OH_Drawing_MatrixPostScale(matrix, 10, 10, 10, 10);
    float value;
    value = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_TRUE(IsScalarAlmostEqual(value, 10));

    OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
    OH_Drawing_MatrixPostScale(matrix, 4, 6, 5, 7);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix2, -37, -11, -3, -99, -23, -23, 3, 1, 1);
    bool ret = false;
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.name: OH_Drawing_MatrixPostTranslate
 * @tc.desc: test for OH_Drawing_MatrixPostTranslate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixPostTranslate, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixPostTranslate(nullptr, 10, 10);
    OH_Drawing_MatrixPostTranslate(matrix, 10, 10);
    float value;
    value = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_TRUE(IsScalarAlmostEqual(value, 1));

    OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
    OH_Drawing_MatrixPostTranslate(matrix, 2, 4);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix2, 8, 3, 5, 13, 6, 6, 3, 1, 1);
    bool ret = false;
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}
/*
 * @tc.name: OH_Drawing_MatrixPostRotate
 * @tc.desc: test for OH_Drawing_MatrixPostRotate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixPostRotate, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 2, 0, 0, 0, 1, 2, 0, 0, 1);
    OH_Drawing_MatrixPostRotate(matrix, 5, 10, 20);
    OH_Drawing_MatrixPostRotate(nullptr, 5, 10, 20);

    OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    OH_Drawing_MatrixPostRotate(matrix, 90, 1, 0);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix2, 3, 3, 3, -6, -6, -6, 7, 8, 9);
    bool ret = false;
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}
/*
 * @tc.name: OH_Drawing_MatrixReset
 * @tc.desc: test for OH_Drawing_MatrixReset.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixReset, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 2, 0, 0, 0, 1, 2, 0, 0, 1);
    OH_Drawing_MatrixReset(matrix);
    bool isIdentity = OH_Drawing_MatrixIsIdentity(matrix);
    EXPECT_EQ(isIdentity, true);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.name: OH_Drawing_MatrixMapPoints
 * @tc.desc: test for OH_Drawing_MatrixMapPoints.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixMapPoints, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);

    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    OH_Drawing_MatrixMapPoints(matrix, src, dst, 2);

    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}
/*
 * @tc.name: OH_Drawing_MatrixMapRect
 * @tc.desc: test for OH_Drawing_MatrixMapRect.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMatrixTest, OH_Drawing_MatrixMapRect, TestSize.Level1) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);

    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_MatrixMapRect(matrix, src, dst);

    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS