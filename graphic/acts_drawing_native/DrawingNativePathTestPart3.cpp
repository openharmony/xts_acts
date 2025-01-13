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

#include "DrawingNativePathCommon.h"
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
#include "utils/scalar.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativePathPart3Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativePathPart3Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePathPart3Test errorCodeReset before each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3700
 * @tc.name: testPathIsClosedNormal
 * @tc.desc: Test for checking if a path is closed using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsClosedNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 0, 100);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Check if the path is closed using OH_Drawing_PathIsClosed
    bool isClosed = OH_Drawing_PathIsClosed(path, false);
    EXPECT_EQ(isClosed, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free the memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3701
 * @tc.name: testPathIsClosedNormal2
 * @tc.desc: Test for checking if a path is closed without closing it.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsClosedNormal2, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Check if the path is closed using OH_Drawing_PathIsClosed
    bool isClosed = OH_Drawing_PathIsClosed(path, false);
    EXPECT_EQ(isClosed, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3702
 * @tc.name: testPathIsClosedNull
 * @tc.desc: Test for checking if a path is closed with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsClosedNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Check if the path is closed using OH_Drawing_PathIsClosed with nullptr as the parameter, should return
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathIsClosed(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3800
 * @tc.name: testPathGetPositionTangentNormal
 * @tc.desc: Test for getting position and tangent of a path using normal parameters with tangent flag set to true.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // second parameter to true.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3801
 * @tc.name: testPathGetPositionTangentNormal2
 * @tc.desc: Test for getting position and tangent of a path using normal parameters with tangent flag set to false.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentNormal2, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // second parameter to false.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, false, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3802
 * @tc.name: testPathGetPositionTangentNull
 * @tc.desc: Test for getting position and tangent of a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathGetPositionTangent with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(nullptr, true, 50, nullptr, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathGetPositionTangent with the third parameter as 0.00, no crash
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, true, 0.00, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, false);
    // 4. Call OH_Drawing_PathGetPositionTangent with the fourth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(path, true, 50, nullptr, &tangent);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathGetPositionTangent with the fifth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(path, true, 50, &position, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3803
 * @tc.name: testPathGetPositionTangentAbnormal
 * @tc.desc: Test for getting position and tangent of a path with abnormal parameters (non-float values).
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentAbnormal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Call OH_Drawing_PathGetPositionTangent with the third parameter as an integer or character type
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess1 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess1, true);
    // 5. Call OH_Drawing_PathGetPositionTangent with the x coordinate of the fourth parameter as an integer or
    // character type
    position = {10, 10.0f};
    bool isSuccess2 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess2, true);
    // 6. Call OH_Drawing_PathGetPositionTangent with the y coordinate of the fourth parameter as an integer or
    // character type
    position = {10.0f, 10};
    bool isSuccess3 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess3, true);
    // 7. Call OH_Drawing_PathGetPositionTangent with the x coordinate of the fifth parameter as an integer or character
    // type
    tangent = {10, 10.0f};
    bool isSuccess4 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess4, true);
    // 8. Call OH_Drawing_PathGetPositionTangent with the y coordinate of the fifth parameter as an integer or character
    // type
    tangent = {10.0f, 10};
    bool isSuccess5 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess5, true);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3804
 * @tc.name: testPathGetPositionTangentMaximal
 * @tc.desc: Test for getting position and tangent of a path with maximal values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentMaximal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // third parameter to a large value FLT_MAX + 1.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess1 = OH_Drawing_PathGetPositionTangent(path, true, FLT_MAX + 1, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess1, true);
    // 5. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the x
    // coordinate of the fourth parameter to a large value FLT_MAX + 1.
    position = {FLT_MAX + 1, 0.0f};
    bool isSuccess2 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess2, true);
    // 6. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the y
    // coordinate of the fourth parameter to a large value FLT_MAX + 1.
    position = {0.0f, FLT_MAX + 1};
    bool isSuccess3 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess3, true);
    // 7. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the x
    // coordinate of the fifth parameter to a large value FLT_MAX + 1.
    tangent = {FLT_MAX + 1, 0.0f};
    bool isSuccess4 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess4, true);
    // 8. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the y
    // coordinate of the fifth parameter to a large value FLT_MAX + 1.
    tangent = {0.0f, FLT_MAX + 1};
    bool isSuccess5 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess5, true);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3900
 * @tc.name: testPathOpNormal
 * @tc.desc: Test for performing path operations using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathOpNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(src, 100, 100);
    // 7. Perform a path operation on the two paths according to the specified path operation mode. The third parameter
    // enumerates the possible path operation modes.
    bool pathOp1 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(pathOp1, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    bool pathOp2 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_DIFFERENCE);
    // add assert
    EXPECT_EQ(pathOp2, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    bool pathOp3 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_UNION);
    // add assert
    EXPECT_EQ(pathOp3, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    bool pathOp4 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_XOR);
    // add assert
    EXPECT_EQ(pathOp4, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    bool pathOp5 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_REVERSE_DIFFERENCE);
    // add assert
    EXPECT_EQ(pathOp5, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3901
 * @tc.name: testPathOpNull
 * @tc.desc: Test for performing path operations with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathOpNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathOp with the first parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathOp(nullptr, src, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathOp with the second parameter as nullptr, expect OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE
    OH_Drawing_PathOp(path, nullptr, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4000
 * @tc.name: testPathGetMatrixNormal
 * @tc.desc: Test for getting transformation matrix of a path using normal parameters with matrix flag set to true.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // second parameter to true. Enumerate the possible values of the fifth parameter to call the interface.
    OH_Drawing_PathMeasureMatrixFlags flags[] = {
        GET_POSITION_MATRIX,
        GET_TANGENT_MATRIX,
        GET_POSITION_AND_TANGENT_MATRIX,
    };
    for (int i = 0; i < 3; i++) {
        OH_Drawing_ErrorCodeReset();
        bool getMatrix = OH_Drawing_PathGetMatrix(path, true, 50, matrix, flags[i]);
        // add assert
        EXPECT_EQ(getMatrix, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4001
 * @tc.name: testPathGetMatrixNormal2
 * @tc.desc: Test for getting transformation matrix of a path using normal parameters with matrix flag set to false.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixNormal2, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // second parameter to false. Enumerate the possible values of the fifth parameter to call the interface.
    OH_Drawing_PathMeasureMatrixFlags flags[] = {
        GET_POSITION_MATRIX,
        GET_TANGENT_MATRIX,
        GET_POSITION_AND_TANGENT_MATRIX,
    };
    for (int i = 0; i < 3; i++) {
        OH_Drawing_ErrorCodeReset();
        bool getMatrix = OH_Drawing_PathGetMatrix(path, false, 50, matrix, flags[i]);
        // add assert
        EXPECT_EQ(getMatrix, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4002
 * @tc.name: testPathGetMatrixNull
 * @tc.desc: Test for getting transformation matrix of a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_PathGetMatrix with the first parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetMatrix(nullptr, true, 50, matrix, GET_POSITION_MATRIX);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathGetMatrix with the third parameter as 0.00, the call should fail without crashing
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, 0.00, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, false);
    // 5. Call OH_Drawing_PathGetMatrix with the fourth parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetMatrix(path, true, 50, nullptr, GET_POSITION_MATRIX);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4003
 * @tc.name: testPathGetMatrixAbnormal
 * @tc.desc: Test for getting transformation matrix of a path with abnormal parameters (non-float values).
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixAbnormal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // third parameter to an integer value.
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, 50, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4004
 * @tc.name: testPathGetMatrixMaximal
 * @tc.desc: Test for getting transformation matrix of a path with maximal values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixMaximal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // third parameter to a large value FLT_MAX + 1.
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, FLT_MAX + 1, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS