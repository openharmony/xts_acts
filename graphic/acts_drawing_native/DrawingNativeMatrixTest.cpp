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
    // 1、OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2、OH_Drawing_MatrixDestroy
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
    // 1、OH_Drawing_MatrixDestroy入参空
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
    // 1、OH_Drawing_MatrixCreate调用10次
    OH_Drawing_Matrix *matrices[10];
    for (int i = 0; i < 10; i++) {
        matrices[i] = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrices[i], nullptr);
    }
    // 2、OH_Drawing_MatrixDestroy调用10次
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixDestroy(matrices[i]);
    }
    // 3、OH_Drawing_MatrixCreate-OH_Drawing_MatrixDestroy来回调用10次
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
    // 1、OH_Drawing_MatrixCreateRotation，旋转角度deg遍历0度、180度、360度、-90度、-180度、-360度、45.5度，x\y覆盖小数和整数
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
    // 1、OH_Drawing_MatrixCreateRotation第一个参数为空
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(0, 10.0f, 10.0f);
    // 2、OH_Drawing_MatrixCreateRotation第二个参数为空
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, 0, 10.0f);
    // 3、OH_Drawing_MatrixCreateRotation第三个参数为空
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(360, 10.0f, 0);
    // 4、释放内存
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
    // 1、OH_Drawing_MatrixCreateRotation入参大于360度
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(361, 10.0f, 10.0f);
    // 2、OH_Drawing_MatrixCreateRotation接口参数x为负数
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, -10.0f, 10.0f);
    // 3、OH_Drawing_MatrixCreateRotation接口参数y为负数
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(180, 10.0f, -10.0f);
    // 4、释放内存
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
    // 1、OH_Drawing_MatrixCreateRotation旋转角度deg入参极大值
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(FLT_MAX, 10.0f, 10.0f);
    // 2、OH_Drawing_MatrixCreateRotation接口参数x入参极大值
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, FLT_MAX, 10.0f);
    // 3、OH_Drawing_MatrixCreateRotation接口参数y入参极大值
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(180, 10.0f, FLT_MAX);
    // 4、释放内存
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
    // 1、调用10次OH_Drawing_MatrixCreateRotation，每次传入不同的旋转角度和坐标点
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
    // 1、OH_Drawing_MatrixCreateTranslation，传入小数
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(10.0f, 10.0f);
    // 2、OH_Drawing_MatrixCreateTranslation，传入整数
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(20, 20);
    // 3、释放内存
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
    // 1、OH_Drawing_MatrixCreateTranslation第一个参数为空
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(0, 10.0f);
    // 2、OH_Drawing_MatrixCreateTranslation第二个参数为空
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, 0);
    // 3、释放内存
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
    // 1、OH_Drawing_MatrixCreateTranslation第一个参数为负数
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(-10.0f, 10.0f);
    // 2、OH_Drawing_MatrixCreateTranslation第二个参数为负数
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, -10.0f);
    // 3、释放内存
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
    // 1、OH_Drawing_MatrixCreateTranslation第一个参数为极大值
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(FLT_MAX, 10.0f);
    // 2、OH_Drawing_MatrixCreateTranslation第二个参数为极大值
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, FLT_MAX);
    // 3、释放内存
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
    // 1、调用10次OH_Drawing_MatrixCreateTranslation，dx和dy传入随机数
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
    // 1、OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2、OH_Drawing_MatrixSetMatrix入参整数，对应调用OH_Drawing_MatrixGetAll和OH_Drawing_MatrixGetValue接口
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    float value[9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3、OH_Drawing_MatrixSetMatrix入参浮点数，对应调用OH_Drawing_MatrixGetAll和OH_Drawing_MatrixGetValue接口
    OH_Drawing_MatrixSetMatrix(matrix, 1.1, 0, 0, 0, -1.1, 0, 0, 0, 1.1);
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4、释放内存
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
    // 1、OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2、OH_Drawing_MatrixSetMatrix第一个参数为空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_MatrixSetMatrix(nullptr, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、OH_Drawing_MatrixSetMatrix第二个到第十个参数分别为空
    OH_Drawing_MatrixSetMatrix(matrix, 0, 1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 0, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 0, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 0, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 0, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 0, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 0, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 1, 0);
    // 4、OH_Drawing_MatrixGetAll第一个参数传空，通过OH_Drawing_ErrorCodeGet查看错误码
    float value[9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(nullptr, value);
    EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5、OH_Drawing_MatrixGetAll第二个参数传空数组，通过OH_Drawing_ErrorCodeGet查看错误码
    float value2[0];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6、OH_Drawing_MatrixGetAll第二个参数传空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_ErrorCode code3 = OH_Drawing_MatrixGetAll(matrix, nullptr);
    EXPECT_EQ(code3, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7、OH_Drawing_MatrixGetValue 第一个参数传空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_MatrixGetValue(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 8、OH_Drawing_MatrixGetValue 第二个参数传空
    OH_Drawing_MatrixGetValue(matrix, 0);
    // 9、释放内存
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
    // 1、OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2、OH_Drawing_MatrixSetMatrix第二个到第十个参数分别为负数
    OH_Drawing_MatrixSetMatrix(matrix, -1, 1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, -1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, -1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, -1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, -1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, -1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, -1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, -1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 1, -1);
    // 3、OH_Drawing_MatrixGetAll接口value传入长度小于9的数组
    float value[8];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4、OH_Drawing_MatrixGetAll接口value传入长度大于9的数组
    float value2[10];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5、OH_Drawing_MatrixGetValue接口index入参-1，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_MatrixGetValue(matrix, -1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6、OH_Drawing_MatrixGetValue接口index入参9，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_MatrixGetValue(matrix, 9);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 7、释放内存
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
    // 1、OH_Drawing_MatrixSetMatrix第二个到第十个参数分别为极大值
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
    // 2、释放内存
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
    // 1、OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 2、OH_Drawing_MatrixSetMatrix入参随机数，调用接口10次，对应调用OH_Drawing_MatrixGetAll和OH_Drawing_MatrixGetValue接口
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
    // 3、释放内存
    OH_Drawing_MatrixDestroy(matrix);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS