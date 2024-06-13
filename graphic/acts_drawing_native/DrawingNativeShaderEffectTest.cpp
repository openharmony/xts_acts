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
#include "drawing_filter.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_round_rect.h"
#include "drawing_shader_effect.h"
#include "drawing_error_code.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeShaderEffectTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix
 * @tc.desc: test for OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeShaderEffectTest, OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix,
         TestSize.Level1) {
    OH_Drawing_Point2D startPt = {100, 400};
    OH_Drawing_Point2D endPt = {200, 500};

    uint32_t colors[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};

    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);

    OH_Drawing_ShaderEffect *linearGradient = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(
        &startPt, &endPt, colors, pos, 2, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(linearGradient, nullptr);

    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(linearGradient);
}

/*
 * @tc.name: OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix
 * @tc.desc: test for OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeShaderEffectTest, OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix,
         TestSize.Level1) {
    OH_Drawing_Point2D centerPt = {100, 100};
    float radius = 10.0;
    uint32_t colors[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};

    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);

    OH_Drawing_ShaderEffect *radialGradient = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
        &centerPt, radius, colors, pos, 2, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(radialGradient, nullptr);

    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(radialGradient);
}

/*
 * @tc.name: OH_Drawing_ShaderEffectCreateColorShader
 * @tc.desc: test for OH_Drawing_ShaderEffectCreateColorShader.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeShaderEffectTest, OH_Drawing_ShaderEffectCreateColorShader, TestSize.Level1) {
    uint32_t color = 0xff00ff00;
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateColorShader(color);
    EXPECT_NE(effect, nullptr);
    OH_Drawing_ShaderEffectDestroy(effect);
}
/*
 * @tc.name: testShaderEffectCreateTwoPointConicalGradientNormal
 * @tc.desc: test for OH_Drawing_ShaderEffectCreateTwoPointConicalGradient.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateTwoPointConicalGradientNormal, TestSize.Level1) {
    OH_Drawing_Point2D startPt = {100, 100};
    OH_Drawing_Point2D endPt = {500, 500};
    uint32_t colors[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0, 1.0};
    uint32_t size = 3;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 0, 1, 0, 1, -1, 0, -1, 0, 1);
    OH_Drawing_ShaderEffect *PointConicalGradient = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, 20, &endPt, 40, colors, pos, size, OH_Drawing_TileMode::DECAL, matrix);
    EXPECT_NE(PointConicalGradient, nullptr);
}
/*
 * @tc.name: testErrorCodeGet
 * @tc.desc: test for OH_Drawing_ErrorCodeGet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeShaderEffectTest, testErrorCodeGet, TestSize.Level1) {
    EXPECT_NE(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS