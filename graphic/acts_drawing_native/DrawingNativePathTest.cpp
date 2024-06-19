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
#include "utils/scalar.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativePathTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100
 * @tc.name: testPathCreateNormal
 * @tc.desc: Test for creating a path object with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathCreateNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200
 * @tc.name: testPathCopyNormal
 * @tc.desc: Test for copying a path with normal parameters and checking the copied path length.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathCopyNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象1
    OH_Drawing_Path *path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path1, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path1, 100, 100);
    // 4、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path1, 200, 200);
    // 5、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path1, 300, 300);
    // 6、调用OH_Drawing_PathClose闭合路径
    OH_Drawing_PathClose(path1);
    // 7、调用OH_Drawing_PathCopy复制出路径1的副本路径2
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(path1);
    // 8、调用OH_Drawing_PathGetLength获取路径2的长度, 8、返回值和路径1的长度一致
    bool isEqual = IsScalarAlmostEqual(OH_Drawing_PathGetLength(path1, false), OH_Drawing_PathGetLength(path2, false));
    EXPECT_TRUE(isEqual);
    // 9、释放内存
    OH_Drawing_PathDestroy(path1);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0201
 * @tc.name: testPathCopyNull
 * @tc.desc: Test for copying a path with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCopyNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathCopy参数为空, 2、返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、释放内存
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0202
 * @tc.name: testPathCopyInputDestroyed
 * @tc.desc: Test for copying a path and checking if the copied path is affected after the original path is destroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCopyInputDestroyed, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象1
    OH_Drawing_Path *path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path1, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path1, 100, 100);
    // 4、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path1, 200, 200);
    // 5、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path1, 300, 300);
    // 6、调用OH_Drawing_PathClose闭合路径
    OH_Drawing_PathClose(path1);
    // 7、调用OH_Drawing_PathCopy复制出路径1的副本路径2
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(path1);
    // 8、调用OH_Drawing_PathDestroy销毁路径1
    OH_Drawing_PathDestroy(path1);
    // 9、调用OH_Drawing_PathGetLength获取路径2的长度, 9、返回值正常说明销毁路径1不影响路径2
    EXPECT_NE(OH_Drawing_PathGetLength(path2, false), 0);
    // 10、释放内存
    OH_Drawing_PathDestroy(path2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300
 * @tc.name: testPathDestroyNormal
 * @tc.desc: Test for creating and destroying a path object with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathDestroyNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathDestroy销毁路径
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0301
 * @tc.name: testPathDestroyNull
 * @tc.desc: Test for destroying a path object with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathDestroyNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathDestroy参数为空, 2、返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathDestroy(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400
 * @tc.name: testPathMoveToNormal
 * @tc.desc: Test for moving a path to a normal position with valid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathMoveToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径起始点
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0401
 * @tc.name: testPathMoveToNull
 * @tc.desc: Test for moving a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathMoveToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo第一个参数为空, 2、返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathMoveTo(nullptr, 1, 1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathMoveTo第二个参数为0.00
    OH_Drawing_PathMoveTo(path, 0.00, 1);
    // 4、调用OH_Drawing_PathMoveTo第三个参数为0.00
    OH_Drawing_PathMoveTo(path, 1, 0.00);
    // 5、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0402
 * @tc.name: testPathMoveToAbnormal
 * @tc.desc: Test for moving a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathMoveToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo第二个参数传入整型或者字符型
    OH_Drawing_PathMoveTo(path, 2, 1.0f);
    // 3、调用OH_Drawing_PathMoveTo第三个参数传入整型或者字符型
    OH_Drawing_PathMoveTo(path, 1.0f, 2);
    // 4、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0403
 * @tc.name: testPathMoveToMaximal
 * @tc.desc: Test for moving a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathMoveToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo第二个参数传入极大值0x7FFFFFFF+1, 2、调用失败，无crash
    OH_Drawing_PathMoveTo(path, FLT_MAX + 1, 1.0);
    // 3、调用OH_Drawing_PathMoveTo第三个参数传入极大值0x7FFFFFFF+1, 3、调用失败，无crash
    OH_Drawing_PathMoveTo(path, 1.0, FLT_MAX + 1);
    // 4、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500
 * @tc.name: testPathLineToNormal
 * @tc.desc: Test for adding a line to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathLineToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径起始点
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0501
 * @tc.name: testPathLineToNull
 * @tc.desc: Test for adding a line to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathLineToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathLineTo第一个参数为空, 返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathLineTo(nullptr, 1, 1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathLineTo第二个参数为0.00, 调用失败，无crash
    OH_Drawing_PathLineTo(path, 0.00, 1);
    // 4、调用OH_Drawing_PathLineTo第三个参数为0.00, 调用失败，无crash
    OH_Drawing_PathLineTo(path, 1, 0.00);
    // 5、释放内存
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0502
 * @tc.name: testPathLineToAbnormal
 * @tc.desc: Test for moving a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathLineToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径起始点
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo第二个参数传入整型或者字符型
    OH_Drawing_PathLineTo(path, 2, 1.0f);
    // 4、调用OH_Drawing_PathLineTo第三个参数传入整型或者字符型
    OH_Drawing_PathLineTo(path, 1.0f, 2);
    // 5、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0503
 * @tc.name: testPathLineToMaximal
 * @tc.desc: Test for moving a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathLineToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径起始点
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo第二个参数传入极大值0x7FFFFFFF+1
    OH_Drawing_PathLineTo(path, FLT_MAX + 1, 1.0);
    // 4、调用OH_Drawing_PathLineTo第三个参数传入极大值0x7FFFFFFF+1
    OH_Drawing_PathLineTo(path, 1.0, FLT_MAX + 1);
    // 5、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600
 * @tc.name: testPathArcToNormal
 * @tc.desc: Test for adding an arc to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathArcToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 200, 200);
    // 5、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 300, 300);
    // 6、调用OH_Drawing_PathClose闭合路径
    OH_Drawing_PathClose(path);
    // 7、调用OH_Drawing_PathArcTo用于给路径添加一段弧线
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0, 90);
    // 8、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0601
 * @tc.name: testPathArcToNull
 * @tc.desc: Test for adding an arc to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathArcToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathArcTo第一个参数为空, 2、返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathArcTo(nullptr, 10, 10, 20, 0, 0, 90);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathArcTo第二个参数为0.00, 3、调用失败，无crash
    OH_Drawing_PathArcTo(path, 0.00, 10, 20, 0, 0, 90);
    // 4、调用OH_Drawing_PathArcTo第三个参数为0.00, 4、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 0.00, 20, 0, 0, 90);
    // 5、调用OH_Drawing_PathArcTo第四个参数为0.00, 5、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 10, 0.00, 0, 0, 90);
    // 6、调用OH_Drawing_PathArcTo第五个参数为0.00, 6、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0.00, 0, 90);
    // 7、调用OH_Drawing_PathArcTo第六个参数为0.00, 7、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0.00, 90);
    // 8、调用OH_Drawing_PathArcTo第七个参数为0.00, 8、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0, 0.00);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0602
 * @tc.name: testPathArcToAbnormal
 * @tc.desc: Test for adding an arc to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathArcToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 200, 200);
    // 5、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 300, 300);
    // 6、调用OH_Drawing_PathClose闭合路径
    OH_Drawing_PathClose(path);
    // 7、调用OH_Drawing_PathArcTo参数传入整型
    OH_Drawing_PathArcTo(path, 10, 10, 20, 20, 20, 90);
    // 8、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0603
 * @tc.name: testPathArcToMaximal
 * @tc.desc: Test for adding an arc to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathArcToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 200, 200);
    // 5、调用OH_Drawing_PathLineTo添加一条从路径的最后点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 300, 300);
    // 6、调用OH_Drawing_PathClose闭合路径
    OH_Drawing_PathClose(path);
    // 7、调用OH_Drawing_PathArcTo第二个参数传入极大值0x7FFFFFFF+1, 7、调用失败，无crash
    OH_Drawing_PathArcTo(path, FLT_MAX + 1, 10, 20, 0, 0, 90);
    // 8、调用OH_Drawing_PathArcTo第三个参数传入极大值0x7FFFFFFF+1, 8、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, FLT_MAX + 1, 20, 0, 0, 90);
    // 9、调用OH_Drawing_PathArcTo第四个参数传入极大值0x7FFFFFFF+1, 9、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 10, FLT_MAX + 1, 0, 0, 90);
    // 10、调用OH_Drawing_PathArcTo第五个参数传入极大值0x7FFFFFFF+1, 10、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, FLT_MAX + 1, 0, 90);
    // 11、调用OH_Drawing_PathArcTo第六个参数传入极大值0x7FFFFFFF+1, 11、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, FLT_MAX + 1, 90);
    // 12、调用OH_Drawing_PathArcTo第七个参数传入极大值0x7FFFFFFF+1, 12、调用失败，无crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0, FLT_MAX + 1);
    // 13、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700
 * @tc.name: testPathQuadToNormal
 * @tc.desc: Test for adding a quadratic Bezier curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathQuadToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径起始点
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathQuadTo添加一条从路径最后点位置到目标点位置的二阶贝塞尔圆滑曲线
    OH_Drawing_PathQuadTo(path, 100, 100, 200, 200);
    // 4、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0701
 * @tc.name: testPathQuadToNull
 * @tc.desc: Test for adding a quadratic Bezier curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathQuadToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathQuadTo第一个参数为空, 2、返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathQuadTo(nullptr, 100, 100, 200, 200);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathQuadTo第二个参数为0.00, 3、调用失败，无crash
    OH_Drawing_PathQuadTo(path, 0.00, 100, 200, 200);
    // 4、调用OH_Drawing_PathQuadTo第三个参数为0.00, 4、调用失败，无crash
    OH_Drawing_PathQuadTo(path, 100, 0.00, 200, 200);
    // 5、调用OH_Drawing_PathQuadTo第四个参数为0.00, 5、调用失败，无crash
    OH_Drawing_PathQuadTo(path, 100, 100, 0.00, 200);
    // 6、调用OH_Drawing_PathQuadTo第五个参数为0.00, 6、调用失败，无crash
    OH_Drawing_PathQuadTo(path, 100, 100, 200, 0.00);
    // 7、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0702
 * @tc.name: testPathQuadToAbnormal
 * @tc.desc: Test for adding a quadratic Bezier curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathQuadToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径起始点
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathQuadTo第二个参数传入整型或者字符型
    OH_Drawing_PathQuadTo(path, 100, 100.0f, 200.0f, 200.0f);
    // 4、调用OH_Drawing_PathQuadTo第三个参数传入整型或者字符型
    OH_Drawing_PathQuadTo(path, 100.0f, 100, 200.0f, 200.0f);
    // 5、调用OH_Drawing_PathQuadTo第四个参数传入整型或者字符型
    OH_Drawing_PathQuadTo(path, 100.0f, 100.0f, 200, 200.0f);
    // 6、调用OH_Drawing_PathQuadTo第五个参数传入整型或者字符型
    OH_Drawing_PathQuadTo(path, 100.0f, 100.0f, 200.0f, 200);
    // 7、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0703
 * @tc.name: testPathQuadToMaximal
 * @tc.desc: Test for adding a quadratic Bezier curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathQuadToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径起始点
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathQuadTo第二个参数传入极大值0x7FFFFFFF+1, 3、调用失败，无crash
    OH_Drawing_PathQuadTo(path, FLT_MAX + 1, 100, 200, 200);
    // 4、调用OH_Drawing_PathQuadTo第三个参数传入极大值0x7FFFFFFF+1, 4、调用失败，无crash
    OH_Drawing_PathQuadTo(path, 100, FLT_MAX + 1, 200, 200);
    // 5、调用OH_Drawing_PathQuadTo第四个参数传入极大值0x7FFFFFFF+1, 5、调用失败，无crash
    OH_Drawing_PathQuadTo(path, 100, 100, FLT_MAX + 1, 200);
    // 6、调用OH_Drawing_PathQuadTo第五个参数传入极大值0x7FFFFFFF+1, 6、调用失败，无crash
    OH_Drawing_PathQuadTo(path, 100, 100, 200, FLT_MAX + 1);
    // 7、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800
 * @tc.name: testPathConicToNormal
 * @tc.desc: Test for adding a conic curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathConicToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathConicTo在当前路径上添加一个二次贝塞尔曲线段
    OH_Drawing_PathConicTo(path, 50, 50, 100, 100, 0.5);
    // 5、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0801
 * @tc.name: testPathConicToNull
 * @tc.desc: Test for adding a conic curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathConicToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathConicTo第一个参数为空, 返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathConicTo(nullptr, 50, 50, 100, 100, 0.5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathConicTo第二个参数为0.00
    OH_Drawing_PathConicTo(path, 0.00, 50, 100, 100, 0.5);
    // 4、调用OH_Drawing_PathConicTo第三个参数为0.00
    OH_Drawing_PathConicTo(path, 50, 0.00, 100, 100, 0.5);
    // 5、调用OH_Drawing_PathConicTo第四个参数为0.00
    OH_Drawing_PathConicTo(path, 50, 50, 0.00, 100, 0.5);
    // 6、调用OH_Drawing_PathConicTo第五个参数为0.00
    OH_Drawing_PathConicTo(path, 50, 50, 100, 0.00, 0.5);
    // 7、调用OH_Drawing_PathConicTo第六个参数为0.00
    OH_Drawing_PathConicTo(path, 50, 50, 100, 100, 0.00);
    // 8、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0802
 * @tc.name: testPathConicToAbnormal
 * @tc.desc: Test for adding a conic curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathConicToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4、调用OH_Drawing_PathConicTo第二个参数传入整型或者字符型
    OH_Drawing_PathConicTo(path, 50, 50.0f, 100.0f, 100.0f, 0.5f);
    // 5、调用OH_Drawing_PathConicTo第三个参数传入整型或者字符型
    OH_Drawing_PathConicTo(path, 50.0f, 50, 100.0f, 100.0f, 0.5f);
    // 6、调用OH_Drawing_PathConicTo第四个参数传入整型或者字符型
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100, 100.0f, 0.5f);
    // 7、调用OH_Drawing_PathConicTo第五个参数传入整型或者字符型
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100, 0.5f);
    // 8、调用OH_Drawing_PathConicTo第六个参数传入整型或者字符型
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 1);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0803
 * @tc.name: testPathConicToMaximal
 * @tc.desc: Test for adding a conic curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathConicToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathConicTo第二个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathConicTo(path, FLT_MAX + 1, 50, 100, 100, 0.5);
    // 5、调用OH_Drawing_PathConicTo第三个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathConicTo(path, 50, FLT_MAX + 1, 100, 100, 0.5);
    // 6、调用OH_Drawing_PathConicTo第四个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathConicTo(path, 50, 50, FLT_MAX + 1, 100, 0.5);
    // 7、调用OH_Drawing_PathConicTo第五个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathConicTo(path, 50, 50, 100, FLT_MAX + 1, 0.5);
    // 8、调用OH_Drawing_PathConicTo第六个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathConicTo(path, 50, 50, 100, 100, FLT_MAX + 1);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900
 * @tc.name: testPathCubicToNormal
 * @tc.desc: Test for adding a cubic Bezier curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathCubicToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathCubicTo添加一条从路径最后点位置到目标点位置的三阶贝塞尔圆滑曲线
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, 300, 300);
    // 4、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0901
 * @tc.name: testPathCubicToNull
 * @tc.desc: Test for adding a cubic Bezier curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCubicToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathCubicTo第一个参数为空, 返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathCubicTo(nullptr, 100, 100, 200, 200, 300, 300);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathCubicTo第二个参数为0.00, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 0.00, 100, 200, 200, 300, 300);
    // 4、调用OH_Drawing_PathCubicTo第三个参数为0.00, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 0.00, 200, 200, 300, 300);
    // 5、调用OH_Drawing_PathCubicTo第四个参数为0.00, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 100, 0.00, 200, 300, 300);
    // 6、调用OH_Drawing_PathCubicTo第五个参数为0.00, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 0.00, 300, 300);
    // 7、调用OH_Drawing_PathCubicTo第六个参数为0.00, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, 0.00, 300);
    // 8、调用OH_Drawing_PathCubicTo第七个参数为0.00, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, 300, 0.00);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0902
 * @tc.name: testPathCubicToAbnormal
 * @tc.desc: Test for adding a cubic Bezier curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCubicToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathCubicTo第二个参数传入整型或者字符型
    OH_Drawing_PathCubicTo(path, 100, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    // 4、调用OH_Drawing_PathCubicTo第三个参数传入整型或者字符型
    OH_Drawing_PathCubicTo(path, 100.0f, 100, 200.0f, 200.0f, 300.0f, 300.0f);
    // 5、调用OH_Drawing_PathCubicTo第四个参数传入整型或者字符型
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200, 200.0f, 300.0f, 300.0f);
    // 6、调用OH_Drawing_PathCubicTo第五个参数传入整型或者字符型
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200, 300.0f, 300.0f);
    // 7、调用OH_Drawing_PathCubicTo第六个参数传入整型或者字符型
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300, 300.0f);
    // 8、调用OH_Drawing_PathCubicTo第七个参数传入整型或者字符型
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, 300);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0903
 * @tc.name: testPathCubicToMaximal
 * @tc.desc: Test for adding a cubic Bezier curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCubicToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathCubicTo第二个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, FLT_MAX + 1, 100, 200, 200, 300, 300);
    // 4、调用OH_Drawing_PathCubicTo第三个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, FLT_MAX + 1, 200, 200, 300, 300);
    // 5、调用OH_Drawing_PathCubicTo第四个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 100, FLT_MAX + 1, 200, 300, 300);
    // 6、调用OH_Drawing_PathCubicTo第五个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, FLT_MAX + 1, 300, 300);
    // 7、调用OH_Drawing_PathCubicTo第六个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, FLT_MAX + 1, 300);
    // 8、调用OH_Drawing_PathCubicTo第七个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, 300, FLT_MAX + 1);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1000
 * @tc.name: testPathRMoveToNormal
 * @tc.desc: Test for setting a relative move to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRMoveToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1001
 * @tc.name: testPathRMoveToNull
 * @tc.desc: Test for setting a relative move to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRMoveToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathRMoveTo第一个参数为空, 返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathRMoveTo(nullptr, 100, 100);
    // 3、调用OH_Drawing_PathRMoveTo第二个参数为0.00, 调用失败，无crash
    OH_Drawing_PathRMoveTo(path, 0.00, 100);
    // 4、调用OH_Drawing_PathRMoveTo第三个参数为0.00, 调用失败，无crash
    OH_Drawing_PathRMoveTo(path, 100, 0.00);
    // 5、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1002
 * @tc.name: testPathRMoveToAbnormal
 * @tc.desc: Test for setting a relative move to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRMoveToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4、调用OH_Drawing_PathRMoveTo第二个参数传入整型或者字符型
    OH_Drawing_PathRMoveTo(path, 100, 100.0f);
    // 5、调用OH_Drawing_PathRMoveTo第三个参数传入整型或者字符型
    OH_Drawing_PathRMoveTo(path, 100.0f, 100);
    // 6、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1003
 * @tc.name: testPathRMoveToMaximal
 * @tc.desc: Test for setting a relative move to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRMoveToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo第二个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathRMoveTo(path, FLT_MAX + 1, 100);
    // 5、调用OH_Drawing_PathRMoveTo第三个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathRMoveTo(path, 100, FLT_MAX + 1);
    // 6、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1100
 * @tc.name: testPathRLineToNormal
 * @tc.desc: Test for adding a relative line to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRLineToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRLineTo使用相对位置在当前路径上添加一条当前路径终点到目标点位置的线段
    OH_Drawing_PathRLineTo(path, 100, 100);
    // 6、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1101
 * @tc.name: testPathRLineToNull
 * @tc.desc: Test for adding a relative line to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRLineToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathRLineTo第一个参数为空, 返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathRLineTo(nullptr, 100, 100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathRLineTo第二个参数为0.00, 调用失败，无crash
    OH_Drawing_PathRLineTo(path, 0.00, 100);
    // 4、调用OH_Drawing_PathRLineTo第三个参数为0.00, 调用失败，无crash
    OH_Drawing_PathRLineTo(path, 100, 0.00);
    // 5、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1102
 * @tc.name: testPathRLineToAbnormal
 * @tc.desc: Test for adding a relative line to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRLineToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRLineTo第二个参数传入整型或者字符型
    OH_Drawing_PathRLineTo(path, 100.0f, 100);
    // 6、调用OH_Drawing_PathRLineTo第三个参数传入整型或者字符型
    OH_Drawing_PathRLineTo(path, 100, 100.0f);
    // 7、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1103
 * @tc.name: testPathRLineToMaximal
 * @tc.desc: Test for adding a relative line to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRLineToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRLineTo第二个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathRLineTo(path, FLT_MAX + 1, 100);
    // 6、调用OH_Drawing_PathRLineTo第三个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathRLineTo(path, 100, FLT_MAX + 1);
    // 7、释放内存
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1200
 * @tc.name: testPathRQuadToNormal
 * @tc.desc: Test for adding a relative quadratic Bezier curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRQuadToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRQuadTo使用相对位置在当前路径上添加一条当前路径终点到目标点位置的二阶贝塞尔圆滑曲线
    OH_Drawing_PathRQuadTo(path, 100, 100, 200, 200);
    // 6、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1201
 * @tc.name: testPathRQuadToNull
 * @tc.desc: Test for adding a relative quadratic Bezier curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRQuadToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathRQuadTo第一个参数为空, 2、返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathRQuadTo(nullptr, 0, 0, 0, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathRQuadTo第二个参数为0.00, 3、调用失败，无crash
    OH_Drawing_PathRQuadTo(path, 0.00, 100, 100, 300);
    // 4、调用OH_Drawing_PathRQuadTo第三个参数为0.00, 4、调用失败，无crash
    OH_Drawing_PathRQuadTo(path, 100, 0.00, 100, 300);
    // 5、调用OH_Drawing_PathRQuadTo第四个参数为0.00, 5、调用失败，无crash
    OH_Drawing_PathRQuadTo(path, 100, 100, 0.00, 300);
    // 6、调用OH_Drawing_PathRQuadTo第五个参数为0.00, 6、调用失败，无crash
    OH_Drawing_PathRQuadTo(path, 100, 100, 100, 0.00);
    // 7、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1202
 * @tc.name: testPathRQuadToAbnormal
 * @tc.desc: Test for adding a relative quadratic Bezier curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRQuadToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRQuadTo第二个参数传入整型或者字符型
    OH_Drawing_PathRQuadTo(path, 100, 100.0f, 100.0f, 300.0f);
    // 6、调用OH_Drawing_PathRQuadTo第三个参数传入整型或者字符型
    OH_Drawing_PathRQuadTo(path, 100.0f, 100, 100.0f, 300.0f);
    // 7、调用OH_Drawing_PathRQuadTo第四个参数传入整型或者字符型
    OH_Drawing_PathRQuadTo(path, 100.0f, 100.0f, 100, 300.0f);
    // 8、调用OH_Drawing_PathRQuadTo第五个参数传入整型或者字符型
    OH_Drawing_PathRQuadTo(path, 100.0f, 100.0f, 100.0f, 300);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1203
 * @tc.name: testPathRQuadToMaximal
 * @tc.desc: Test for adding a relative quadratic Bezier curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRQuadToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRQuadTo第二个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathRQuadTo(path, FLT_MAX + 1, 100, 100, 300);
    // 6、调用OH_Drawing_PathRQuadTo第三个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathRQuadTo(path, 100, FLT_MAX + 1, 100, 300);
    // 7、调用OH_Drawing_PathRQuadTo第四个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathRQuadTo(path, 100, 100, FLT_MAX + 1, 300);
    // 8、调用OH_Drawing_PathRQuadTo第五个参数传入极大值0x7FFFFFFF+1, 调用失败，无crash
    OH_Drawing_PathRQuadTo(path, 100, 100, 100, FLT_MAX + 1);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1300
 * @tc.name: testPathRConicToNormal
 * @tc.desc: Test for adding a relative conic curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRConicToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRConicTo使用相对位置在当前路径上添加一条当前路径终点到目标点位置的圆锥曲线
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 300, 5);
    // 6、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1301
 * @tc.name: testPathRConicToNull
 * @tc.desc: Test for adding a relative conic curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRConicToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathRConicTo第一个参数为空, 返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathRConicTo(nullptr, 100, 100, 100, 300, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathRConicTo第二个参数为0.00, 无crash
    OH_Drawing_PathRConicTo(path, 0.00, 100, 100, 300, 5);
    // 4、调用OH_Drawing_PathRConicTo第三个参数为0.00, 无crash
    OH_Drawing_PathRConicTo(path, 100, 0.00, 100, 300, 5);
    // 5、调用OH_Drawing_PathRConicTo第四个参数为0.00, 无crash
    OH_Drawing_PathRConicTo(path, 100, 100, 0.00, 300, 5);
    // 6、调用OH_Drawing_PathRConicTo第五个参数为0.00, 无crash
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 0.00, 5);
    // 7、调用OH_Drawing_PathRConicTo第六个参数为0.00, 无crash
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 300, 0.00);
    // 8、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1302
 * @tc.name: testPathRConicToAbnormal
 * @tc.desc: Test for adding a relative conic curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRConicToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRConicTo第二个参数传入整型或者字符型
    OH_Drawing_PathRConicTo(path, 100, 100.0f, 100.0f, 300.0f, 5.0f);
    // 6、调用OH_Drawing_PathRConicTo第三个参数传入整型或者字符型
    OH_Drawing_PathRConicTo(path, 100.0f, 100, 100.0f, 300.0f, 5.0f);
    // 7、调用OH_Drawing_PathRConicTo第四个参数传入整型或者字符型
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, 100, 300.0f, 5.0f);
    // 8、调用OH_Drawing_PathRConicTo第五个参数传入整型或者字符型
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, 100.0f, 300, 5.0f);
    // 9、调用OH_Drawing_PathRConicTo第六个参数传入整型或者字符型
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, 100.0f, 300.0f, 5);
    // 10、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1303
 * @tc.name: testPathRConicToMaximal
 * @tc.desc: Test for adding a relative conic curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRConicToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRConicTo第二个参数传入极大值0x7FFFFFFF+1, 5、调用失败，无crash
    OH_Drawing_PathRConicTo(path, FLT_MAX + 1, 100, 100, 300, 5);
    // 6、调用OH_Drawing_PathRConicTo第三个参数传入极大值0x7FFFFFFF+1, 6、调用失败，无crash
    OH_Drawing_PathRConicTo(path, 100, FLT_MAX + 1, 100, 300, 5);
    // 7、调用OH_Drawing_PathRConicTo第四个参数传入极大值0x7FFFFFFF+1, 7、调用失败，无crash
    OH_Drawing_PathRConicTo(path, 100, 100, FLT_MAX + 1, 300, 5);
    // 8、调用OH_Drawing_PathRConicTo第五个参数传入极大值0x7FFFFFFF+1, 8、调用失败，无crash
    OH_Drawing_PathRConicTo(path, 100, 100, 100, FLT_MAX + 1, 5);
    // 9、调用OH_Drawing_PathRConicTo第六个参数传入极大值0x7FFFFFFF+1, 9、调用失败，无crash
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 300, FLT_MAX + 1);
    // 10、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1400
 * @tc.name: testPathRCubicToNormal
 * @tc.desc: Test for adding a relative cubic Bezier curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRCubicToNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRCubicTo使用相对位置在当前路径上添加一条当前路径终点到目标点位置的三阶贝塞尔圆滑曲线
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, 300, 300);
    // 6、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1401
 * @tc.name: testPathRCubicToNull
 * @tc.desc: Test for adding a relative cubic Bezier curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRCubicToNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathRCubicTo第一个参数为空, 2、返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathRCubicTo(nullptr, 100, 100, 200, 200, 300, 300);
    // 3、调用OH_Drawing_PathRCubicTo第二个参数为0.00, 无crash
    OH_Drawing_PathRCubicTo(path, 0.00, 100, 200, 200, 300, 300);
    // 4、调用OH_Drawing_PathRCubicTo第三个参数为0.00, 无crash
    OH_Drawing_PathRCubicTo(path, 100, 0.00, 200, 200, 300, 300);
    // 5、调用OH_Drawing_PathRCubicTo第四个参数为0.00, 无crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 0.00, 200, 300, 300);
    // 6、调用OH_Drawing_PathRCubicTo第五个参数为0.00, 无crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 0.00, 300, 300);
    // 7、调用OH_Drawing_PathRCubicTo第六个参数为0.00, 无crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, 0.00, 300);
    // 8、调用OH_Drawing_PathRCubicTo第七个参数为0.00, 无crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, 300, 0.00);
    // 9、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1402
 * @tc.name: testPathRCubicToAbnormal
 * @tc.desc: Test for adding a relative cubic Bezier curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRCubicToAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRCubicTo第二个参数传入整型或者字符型
    OH_Drawing_PathRCubicTo(path, 100, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    // 6、调用OH_Drawing_PathRCubicTo第三个参数传入整型或者字符型
    OH_Drawing_PathRCubicTo(path, 100.0f, 100, 200.0f, 200.0f, 300.0f, 300.0f);
    // 7、调用OH_Drawing_PathRCubicTo第四个参数传入整型或者字符型
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200, 200.0f, 300.0f, 300.0f);
    // 8、调用OH_Drawing_PathRCubicTo第五个参数传入整型或者字符型
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, 200, 300.0f, 300.0f);
    // 9、调用OH_Drawing_PathRCubicTo第六个参数传入整型或者字符型
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300, 300.0f);
    // 10、调用OH_Drawing_PathRCubicTo第七个参数传入整型或者字符型
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, 300);
    // 11、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1403
 * @tc.name: testPathRCubicToMaximal
 * @tc.desc: Test for adding a relative cubic Bezier curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRCubicToMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathRMoveTo设置一个相对于当前路径终点的路径起始点位置
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5、调用OH_Drawing_PathRCubicTo第二个参数传入极大值0x7FFFFFFF+1, 无crash
    OH_Drawing_PathRCubicTo(path, FLT_MAX + 1, 100, 200, 200, 300, 300);
    // 6、调用OH_Drawing_PathRCubicTo第三个参数传入极大值0x7FFFFFFF+1, 无crash
    OH_Drawing_PathRCubicTo(path, 100, FLT_MAX + 1, 200, 200, 300, 300);
    // 7、调用OH_Drawing_PathRCubicTo第四个参数传入极大值0x7FFFFFFF+1, 无crash
    OH_Drawing_PathRCubicTo(path, 100, 100, FLT_MAX + 1, 200, 300, 300);
    // 8、调用OH_Drawing_PathRCubicTo第五个参数传入极大值0x7FFFFFFF+1, 无crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, FLT_MAX + 1, 300, 300);
    // 9、调用OH_Drawing_PathRCubicTo第六个参数传入极大值0x7FFFFFFF+1, 无crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, FLT_MAX + 1, 300);
    // 10、调用OH_Drawing_PathRCubicTo第七个参数传入极大值0x7FFFFFFF+1, 1无crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, 300, FLT_MAX + 1);
    // 11、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1500
 * @tc.name: testPathAddRectNormal
 * @tc.desc: Test for adding a rectangle to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectNormal, TestSize.Level0) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathAddRect按指定方向，向路径添加矩形轮廓。第六个参数遍历枚举调用该接口
    OH_Drawing_PathAddRect(path, 100, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1501
 * @tc.name: testPathAddRectNull
 * @tc.desc: Test for adding a rectangle to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectNull, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathAddRect第一个参数为空, 返回错误码OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRect(nullptr, 100, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3、调用OH_Drawing_PathAddRect第二个参数为0.00, 调用失败，无crash
    OH_Drawing_PathAddRect(path, 0.00, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 4、调用OH_Drawing_PathAddRect第三个参数为0.00, 调用失败，无crash
    OH_Drawing_PathAddRect(path, 100, 0.00, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5、调用OH_Drawing_PathAddRect第四个参数为0.00, 调用失败，无crash
    OH_Drawing_PathAddRect(path, 100, 100, 0.00, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6、调用OH_Drawing_PathAddRect第五个参数为0.00, 调用失败，无crash
    OH_Drawing_PathAddRect(path, 100, 100, 200, 0.00, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1502
 * @tc.name: testPathAddRectAbnormal
 * @tc.desc: Test for adding a rectangle to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectAbnormal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4、调用OH_Drawing_PathAddRect第二个参数传入整型或者字符型
    OH_Drawing_PathAddRect(path, 100, 100.0f, 200.0f, 200.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5、调用OH_Drawing_PathAddRect第三个参数传入整型或者字符型
    OH_Drawing_PathAddRect(path, 100.0f, 100, 200.0f, 200.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6、调用OH_Drawing_PathAddRect第四个参数传入整型或者字符型
    OH_Drawing_PathAddRect(path, 100.0f, 100.0f, 200, 200.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7、调用OH_Drawing_PathAddRect第五个参数传入整型或者字符型
    OH_Drawing_PathAddRect(path, 100.0f, 100.0f, 200.0f, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 8、释放内存
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1503
 * @tc.name: testPathAddRectMaximal
 * @tc.desc: Test for adding a rectangle to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectMaximal, TestSize.Level3) {
    // 1、调用OH_Drawing_PathCreate创建一个路径对象
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2、调用OH_Drawing_PathMoveTo设置路径的起始点位置
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3、调用OH_Drawing_PathLineTo添加一条从路径的起点位置到目标点位置的线段
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4、调用OH_Drawing_PathAddRect第二个参数传入极大值0x7FFFFFFF+1, 4、调用失败，无crash
    OH_Drawing_PathAddRect(path, FLT_MAX + 1, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5、调用OH_Drawing_PathAddRect第三个参数传入极大值0x7FFFFFFF+1, 5、调用失败，无crash
    OH_Drawing_PathAddRect(path, 100, FLT_MAX + 1, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6、调用OH_Drawing_PathAddRect第四个参数传入极大值0x7FFFFFFF+1, 6、调用失败，无crash
    OH_Drawing_PathAddRect(path, 100, 100, FLT_MAX + 1, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7、调用OH_Drawing_PathAddRect第五个参数传入极大值0x7FFFFFFF+1, 7、调用失败，无crash
    OH_Drawing_PathAddRect(path, 100, 100, 200, FLT_MAX + 1, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 8、释放内存
    OH_Drawing_PathDestroy(path);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS