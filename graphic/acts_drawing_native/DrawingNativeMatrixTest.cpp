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
class DrawingNativeMatrixTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0100
 * @tc.name: testMatrixCreateDestroyNormal
 * @tc.desc: Test for creating and destroying a matrix with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateDestroyNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixDestroy
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0101
 * @tc.name: testMatrixCreateDestroyNULL
 * @tc.desc: Test for creating and destroying a matrix with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateDestroyNULL, TestSize.Level3) {
    // 1. OH_Drawing_MatrixDestroy with nullptr parameter
    OH_Drawing_MatrixDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0102
 * @tc.name: testMatrixCreateDestroyMultipleCalls
 * @tc.desc: Test for multiple calls of creating and destroying a matrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateDestroyMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MatrixCreate 10 times
    OH_Drawing_Matrix *matrices[10];
    for (int i = 0; i < 10; i++) {
        matrices[i] = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrices[i], nullptr);
    }
    // 2. Call OH_Drawing_MatrixDestroy 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixDestroy(matrices[i]);
    }
    // 3. Call OH_Drawing_MatrixCreate and OH_Drawing_MatrixDestroy alternately 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0200
 * @tc.name: testMatrixCreateRotationNormal
 * @tc.desc: Test for creating a rotation matrix with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreateRotation, rotate angles deg traverse 0 degrees, 180 degrees, 360 degrees, -90 degrees, -180 degrees, -360 degrees, 45.5 degrees, x\y cover decimals and integers
    float degs[] = {0, 180, 360, -90, -180, -360, 45.5};
    float x[] = {0, 10, 10.0f, 20, 20.0f, 30, 30.0f};
    float y[] = {0, 10, 10.0f, 20, 20.0f, 30, 30.0f};
    for (int i = 0; i < 7; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degs[i], x[i], y[i]);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0201
 * @tc.name: testMatrixCreateRotationNull
 * @tc.desc: Test for creating a rotation matrix with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateRotation with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(0, 10.0f, 10.0f);
    // 2. OH_Drawing_MatrixCreateRotation with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, 0, 10.0f);
    // 3. OH_Drawing_MatrixCreateRotation with the third parameter as null
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(360, 10.0f, 0);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0202
 * @tc.name: testMatrixCreateRotationAbnormal
 * @tc.desc: Test for creating a rotation matrix with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateRotation with an input angle greater than 360 degrees
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(361, 10.0f, 10.0f);
    // 2. OH_Drawing_MatrixCreateRotation with a negative value for the x parameter
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, -10.0f, 10.0f);
    // 3. OH_Drawing_MatrixCreateRotation with a negative value for the y parameter
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(180, 10.0f, -10.0f);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0203
 * @tc.name: testMatrixCreateRotationMaximum
 * @tc.desc: Test for creating a rotation matrix with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateRotation with the maximum value of the rotation angle parameter deg
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(FLT_MAX, 10.0f, 10.0f);
    // 2. OH_Drawing_MatrixCreateRotation with the maximum value of the x parameter
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, FLT_MAX, 10.0f);
    // 3. OH_Drawing_MatrixCreateRotation with the maximum value of the y parameter
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(180, 10.0f, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0205
 * @tc.name: testMatrixCreateRotationMultipleCalls
 * @tc.desc: Test for multiple calls of creating a rotation matrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MatrixCreateRotation 10 times, each time with different rotation angles and coordinate points
    float degs[] = {0, 180, 360, -90, -180, -360, 45.5};
    float x[] = {0, 10, 10.0f, 20, 20.0f, 30, 30.0f};
    float y[] = {0, 10, 10.0f, 20, 20.0f, 30, 30.0f};
    for (int i = 0; i < 7; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degs[i], x[i], y[i]);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0300
 * @tc.name: testMatrixCreateTranslationNormal
 * @tc.desc: Test for creating a translation matrix with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreateTranslation, passing in a decimal number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(10.0f, 10.0f);
    // 2. OH_Drawing_MatrixCreateTranslation, passing in an integer
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(20, 20);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0301
 * @tc.name: testMatrixCreateTranslationNull
 * @tc.desc: Test for creating a translation matrix with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(0, 10.0f);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, 0);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0302
 * @tc.name: testMatrixCreateTranslationAbnormal
 * @tc.desc: Test for creating a translation matrix with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as a negative number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(-10.0f, 10.0f);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as a negative number
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, -10.0f);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0303
 * @tc.name: testMatrixCreateTranslationMaximum
 * @tc.desc: Test for creating a translation matrix with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as the maximum value
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(FLT_MAX, 10.0f);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as the maximum value
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, FLT_MAX);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0304
 * @tc.name: testMatrixCreateTranslationMultipleCalls
 * @tc.desc: Test for multiple calls of creating a translation matrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationMultipleCalls, TestSize.Level3) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    // 1. Call OH_Drawing_MatrixCreateTranslation 10 times, each time with different random values for dx and dy
    for (int i = 0; i < 10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(dx, dy);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0400
 * @tc.name: testMatrixMatrixSetGetMatrixNormal
 * @tc.desc: Test for setting and getting matrix values with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with integer parameters, calling OH_Drawing_MatrixGetAll and OH_Drawing_MatrixGetValue interfaces
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    float value[9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixSetMatrix with floating-point parameters, calling OH_Drawing_MatrixGetAll and OH_Drawing_MatrixGetValue interfaces
    OH_Drawing_MatrixSetMatrix(matrix, 1.1, 0, 0, 0, -1.1, 0, 0, 0, 1.1);
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0401
 * @tc.name: testMatrixMatrixSetGetMatrixNull
 * @tc.desc: Test for setting and getting matrix values with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetMatrix(nullptr, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as null
    OH_Drawing_MatrixSetMatrix(matrix, 0, 1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 0, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 0, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 0, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 0, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 0, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 0, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 1, 0);
    // 4. OH_Drawing_MatrixGetAll with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    float value[9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(nullptr, value);
    EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_MatrixGetAll with the second parameter as an empty array, check the error code with OH_Drawing_ErrorCodeGet
    float value2[0];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. OH_Drawing_MatrixGetAll with the second parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ErrorCode code3 = OH_Drawing_MatrixGetAll(matrix, nullptr);
    EXPECT_EQ(code3, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. OH_Drawing_MatrixGetValue with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 8. OH_Drawing_MatrixGetValue with the second parameter as null
    OH_Drawing_MatrixGetValue(matrix, 0);
    // 9. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0402
 * @tc.name: testMatrixMatrixSetGetMatrixAbnormal
 * @tc.desc: Test for setting and getting matrix values with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as negative numbers
    OH_Drawing_MatrixSetMatrix(matrix, -1, 1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, -1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, -1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, -1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, -1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, -1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, -1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, -1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 1, -1);
    // 3. OH_Drawing_MatrixGetAll with an array 'value' of length less than 9
    float value[8];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_MatrixGetAll with an array 'value2' of length greater than 9
    float value2[10];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. OH_Drawing_MatrixGetValue with the parameter 'index' as -1, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(matrix, -1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6. OH_Drawing_MatrixGetValue with the parameter 'index' as 9, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(matrix, 9);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0403
 * @tc.name: testMatrixMatrixSetGetMatrixMaximum
 * @tc.desc: Test for setting and getting matrix values with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as maximum values
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, FLT_MAX, 1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, FLT_MAX, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, FLT_MAX, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, FLT_MAX, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, FLT_MAX, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, FLT_MAX, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, FLT_MAX, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, FLT_MAX, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 1, FLT_MAX);
    // 2. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0404
 * @tc.name: testMatrixMatrixSetGetMatrixMultipleCalls
 * @tc.desc: Test for multiple calls of setting and getting matrix values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2. OH_Drawing_MatrixSetMatrix with random parameters, calling the interface 10 times, corresponding to calling OH_Drawing_MatrixGetAll and OH_Drawing_MatrixGetValue interfaces
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float value[9];
        float v0 = dis(gen);
        float v1 = dis(gen);
        float v2 = dis(gen);
        float v3 = dis(gen);
        float v4 = dis(gen);
        float v5 = dis(gen);
        float v6 = dis(gen);
        float v7 = dis(gen);
        float v8 = dis(gen);
        OH_Drawing_MatrixSetMatrix(matrix, v0, v1, v2, v3, v4, v5, v6, v7, v8);
        OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
        EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), v0);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 1), v1);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 2), v2);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 3), v3);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 4), v4);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 5), v5);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 6), v6);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 7), v7);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 8), v8);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0500
 * @tc.name: testMatrixTranslateNormal
 * @tc.desc: Test for translating a matrix with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate, passing in floating point numbers
    OH_Drawing_MatrixTranslate(matrix, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixTranslate, passing in integers
    OH_Drawing_MatrixTranslate(matrix, 20, 20);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0501
 * @tc.name: testMatrixTranslateNull
 * @tc.desc: Test for translating a matrix with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixTranslate(nullptr, 10.0f, 10.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixTranslate with the second parameter as null
    OH_Drawing_MatrixTranslate(matrix, 0, 10.0f);
    // 4. OH_Drawing_MatrixTranslate with the third parameter as null
    OH_Drawing_MatrixTranslate(matrix, 10.0f, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0502
 * @tc.name: testMatrixTranslateAbnormal
 * @tc.desc: Test for translating a matrix with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the second parameter as a negative number
    OH_Drawing_MatrixTranslate(matrix, -10.0f, 10.0f);
    // 3. OH_Drawing_MatrixTranslate with the third parameter as a negative number
    OH_Drawing_MatrixTranslate(matrix, 10.0f, -10.0f);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0503
 * @tc.name: testMatrixTranslateMaximum
 * @tc.desc: Test for translating a matrix with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixTranslate(matrix, FLT_MAX, 10.0f);
    // 3. OH_Drawing_MatrixTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixTranslate(matrix, 10.0f, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0504
 * @tc.name: testMatrixTranslateMultipleCalls
 * @tc.desc: Test for multiple calls of translating a matrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate, passing in random numbers for dx and dy
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_MatrixTranslate(matrix, dx, dy);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS