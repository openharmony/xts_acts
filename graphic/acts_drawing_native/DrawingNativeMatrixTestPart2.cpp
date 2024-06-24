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

#include "DrawingNativeMatrixCommon.h"
#include "drawing_error_code.h"
#include "drawing_matrix.h"
#include "drawing_rect.h"
#include "utils/scalar.h"
#include "gtest/gtest.h"
#include <iostream>
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1500
 * @tc.name: testMatrixPostTranslateNormal
 * @tc.desc: test for testMatrixPostTranslateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostTranslateNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate, passing decimal numbers
    OH_Drawing_MatrixPostTranslate(matrix, 1.5, 2.5);
    // 3. OH_Drawing_MatrixPostTranslate, passing integers
    OH_Drawing_MatrixPostTranslate(matrix, 3, 4);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1501
 * @tc.name: testMatrixPostTranslateNull
 * @tc.desc: test for testMatrixPostTranslateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostTranslateNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate, passing nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet, no crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPostTranslate(nullptr, 1.5, 2.5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostTranslate, passing 0 as the second parameter
    OH_Drawing_MatrixPostTranslate(matrix, 0, 2.5);
    // 4. OH_Drawing_MatrixPostTranslate, passing 0 as the third parameter
    OH_Drawing_MatrixPostTranslate(matrix, 1.5, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1502
 * @tc.name: testMatrixPostTranslateAbnormal
 * @tc.desc: test for testMatrixPostTranslateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostTranslateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate with a negative value as the second parameter
    OH_Drawing_MatrixPostTranslate(matrix, -1.5, 2.5);
    // 3. OH_Drawing_MatrixPostTranslate with a negative value as the third parameter
    OH_Drawing_MatrixPostTranslate(matrix, 1.5, -2.5);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1503
 * @tc.name: testMatrixPostTranslateMaximum
 * @tc.desc: test for testMatrixPostTranslateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostTranslateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixPostTranslate(matrix, FLT_MAX, 2.5);
    // 3. OH_Drawing_MatrixPostTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixPostTranslate(matrix, 1.5, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1504
 * @tc.name: testMatrixPostTranslateMultipleCalls
 * @tc.desc: test for testMatrixPostTranslateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostTranslateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixPostTranslate 10 times, with dx and dy as random numbers
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(-100, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixPostTranslate(matrix, dis(gen), dis(gen));
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1600
 * @tc.name: testMatrixResetNormal
 * @tc.desc: test for testMatrixResetNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixResetNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. OH_Drawing_MatrixReset with the identity matrix
    OH_Drawing_MatrixReset(matrix);
    // 3. OH_Drawing_MatrixReset with a non-identity matrix
    OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
    OH_Drawing_MatrixReset(matrix);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1601
 * @tc.name: testMatrixResetNull
 * @tc.desc: test for testMatrixResetNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixResetNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixReset with nullptr as the parameter, check the error code with OH_Drawing_ErrorCodeGet, no
    // crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixReset(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1602
 * @tc.name: testMatrixResetMultipleCalls
 * @tc.desc: test for testMatrixResetMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixResetMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. Call OH_Drawing_MatrixSetMatrix 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
    }
    // 3. Call OH_Drawing_MatrixReset 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixReset(matrix);
    }
    // 4. Call OH_Drawing_MatrixSetMatrix and OH_Drawing_MatrixReset alternately 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
        OH_Drawing_MatrixReset(matrix);
    }
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1700
 * @tc.name: testMatrixConcatNormal
 * @tc.desc: test for testMatrixConcatNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixConcatNormal, TestSize.Level0) {
    // Define matrices a and b
    OH_Drawing_Matrix *a = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(a, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_Matrix *b = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(b, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    OH_Drawing_Matrix *c = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_MatrixConcat with matrices a and b of different sizes,
    // and use OH_Drawing_MatrixGetAll to get the result of matrix a multiplied by matrix b
    OH_Drawing_MatrixConcat(c, b, a);
    float values[9];
    OH_Drawing_MatrixGetAll(c, values);
    EXPECT_EQ(values[0], 1);
    // 2. Free memory
    OH_Drawing_MatrixDestroy(a);
    OH_Drawing_MatrixDestroy(b);
    OH_Drawing_MatrixDestroy(c);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1701
 * @tc.name: testMatrixConcatNull
 * @tc.desc: test for testMatrixConcatNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixConcatNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. OH_Drawing_MatrixConcat, passing nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(nullptr, matrix, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixConcat, passing nullptr as the second parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(matrix, nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. OH_Drawing_MatrixConcat, passing nullptr as the third parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(matrix, matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1702
 * @tc.name: testMatrixConcatMultipleCalls
 * @tc.desc: test for testMatrixConcatMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixConcatMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MatrixConcat 10 times with matrices a and b of different sizes,
    // and use OH_Drawing_MatrixGetAll to get the result of matrix a multiplied by matrix b
    OH_Drawing_Matrix *a = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(a, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_Matrix *b = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(b, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    OH_Drawing_Matrix *c = OH_Drawing_MatrixCreate();
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixConcat(c, b, a);
        float values[9];
        OH_Drawing_MatrixGetAll(c, values);
        EXPECT_EQ(values[0], 1);
        EXPECT_EQ(values[1], 0);
        EXPECT_EQ(values[2], 0);
        EXPECT_EQ(values[3], 0);
        EXPECT_EQ(values[4], -1);
        EXPECT_EQ(values[5], 0);
        EXPECT_EQ(values[6], 0);
        EXPECT_EQ(values[7], 0);
        EXPECT_EQ(values[8], 1);
    }
    // 2. Free memory
    OH_Drawing_MatrixDestroy(a);
    OH_Drawing_MatrixDestroy(b);
    OH_Drawing_MatrixDestroy(c);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1800
 * @tc.name: testMatrixInvertNormal
 * @tc.desc: test for testMatrixInvertNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixInvertNormal, TestSize.Level0) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *inverse = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixInvert(matrix, inverse);
    OH_Drawing_MatrixInvert(inverse, matrix);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(inverse);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1801
 * @tc.name: testMatrixInvertNull
 * @tc.desc: test for testMatrixInvertNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixInvertNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. OH_Drawing_MatrixInvert with the first parameter as nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixInvert(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixInvert with the second parameter as nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixInvert(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1802
 * @tc.name: testMatrixInvertMultipleCalls
 * @tc.desc: test for testMatrixInvertMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixInvertMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MatrixInvert 10 times with matrices of different sizes
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *inverse = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixInvert(matrix, inverse);
        OH_Drawing_MatrixInvert(inverse, matrix);
        float values[9];
        OH_Drawing_MatrixGetAll(matrix, values);
        EXPECT_EQ(values[0], 1);
        EXPECT_EQ(values[1], 0);
        EXPECT_EQ(values[2], 0);
        EXPECT_EQ(values[3], 0);
        EXPECT_EQ(values[4], -1);
        EXPECT_EQ(values[5], 0);
        EXPECT_EQ(values[6], 0);
        EXPECT_EQ(values[7], 0);
        EXPECT_EQ(values[8], 1);
    }
    // 2. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(inverse);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1900
 * @tc.name: testMatrixSetPolyToPolyNormal
 * @tc.desc: test for testMatrixSetPolyToPolyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixSetPolyToPolyNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 1);
    // 3. OH_Drawing_MatrixSetPolyToPoly, iterate count from 0 to 4, keeping the length of the array consistent with
    // count
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 5; i++) {
        OH_Drawing_Point2D src[i];
        OH_Drawing_Point2D dst[i];
        for (int j = 0; j < i; j++) {
            // Generate random numbers
            src[j] = {dis(gen), dis(gen)};
            dst[j] = {dis(gen), dis(gen)};
        }
        OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, i);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1901
 * @tc.name: testMatrixSetPolyToPolyNull
 * @tc.desc: test for testMatrixSetPolyToPolyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixSetPolyToPolyNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. OH_Drawing_MatrixSetPolyToPoly, the first parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    OH_Drawing_MatrixSetPolyToPoly(nullptr, src, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixSetPolyToPoly, the second parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetPolyToPoly(matrix, nullptr, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 4. OH_Drawing_MatrixSetPolyToPoly, the third parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, nullptr, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1902
 * @tc.name: testMatrixSetPolyToPolyAbnormal
 * @tc.desc: test for testMatrixSetPolyToPolyAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixSetPolyToPolyAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. OH_Drawing_MatrixSetPolyToPoly, pass -1 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}};
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, -1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 3. OH_Drawing_MatrixSetPolyToPoly, pass 5 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1904
 * @tc.name: testMatrixSetPolyToPolyMultipleCalls
 * @tc.desc: test for testMatrixSetPolyToPolyMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixSetPolyToPolyMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. Call OH_Drawing_MatrixSetPolyToPoly 10 times
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Point2D src[2] = {{dis(gen), dis(gen)}, {dis(gen), dis(gen)}};
        OH_Drawing_Point2D dst[2] = {{dis(gen), dis(gen)}, {dis(gen), dis(gen)}};
        OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 2);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2000
 * @tc.name: testMatrixMapPointsNormal
 * @tc.desc: test for testMatrixMapPointsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMapPointsNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    // 2. OH_Drawing_MatrixMapPoints, pass integer 5 as count
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 5);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2001
 * @tc.name: testMatrixMapPointsNull
 * @tc.desc: test for testMatrixMapPointsNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMapPointsNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    // 2. OH_Drawing_MatrixMapPoints, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(nullptr, src, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixMapPoints, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, nullptr, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. OH_Drawing_MatrixMapPoints, the third parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, nullptr, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_MatrixMapPoints, the fourth parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, dst, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2002
 * @tc.name: testMatrixMapPointsAbnormal
 * @tc.desc: test for testMatrixMapPointsAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMapPointsAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    // 2. OH_Drawing_MatrixMapPoints, pass -1 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, dst, -1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2003
 * @tc.name: testMatrixMapPointsMultipleCalls
 * @tc.desc: test for testMatrixMapPointsMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMapPointsMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    // 2. Call OH_Drawing_MatrixMapPoints 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixMapPoints(matrix, src, dst, 5);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS