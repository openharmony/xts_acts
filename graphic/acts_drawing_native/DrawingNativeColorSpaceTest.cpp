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
#include "drawing_color_space.h"
#include "drawing_error_code.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeColorSpaceTest : public testing::Test {};

/*
* @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0100
* @tc.name: testColorSpaceCreateDestroySrgbNormal
* @tc.desc: test for testColorSpaceCreateDestroySrgbNormal.
* @tc.size  : SmallTest
* @tc.type  : Function
* @tc.level : Level 0
*/
HWTEST_F(DrawingNativeColorSpaceTest, testColorSpaceCreateDestroySrgbNormal, TestSize.Level0) {
    const float matrix[20] = {
        1, 0, 0, 0, 0,
        0, 1, 0, 0, 0,
        0, 0, 1, 0, 0,
        0, 0, 0, 0.5f, 0
    };
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    EXPECT_NE(colorFilter, nullptr);

    OH_Drawing_ColorFilterDestroy(colorFilter);
}

/*
* @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0101
* @tc.name: testColorSpaceCreateDestroySrgbNULL
* @tc.desc: test for testColorSpaceCreateDestroySrgbNULL.
* @tc.size  : SmallTest
* @tc.type  : Function
* @tc.level : Level 3
*/
HWTEST_F(DrawingNativeColorSpaceTest, testColorSpaceCreateDestroySrgbNULL, TestSize.Level3) {
    OH_Drawing_ColorFilterDestroy(nullptr);
}

/*
* @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0102
* @tc.name: testColorSpaceCreateDestroySrgbMultipleCalls
* @tc.desc: test for testColorSpaceCreateDestroySrgbMultipleCalls.
* @tc.size  : SmallTest
* @tc.type  : Function
* @tc.level : Level 3
*/
HWTEST_F(DrawingNativeColorSpaceTest, testColorSpaceCreateDestroySrgbMultipleCalls, TestSize.Level3) {
    for (int i = 0; i < 10; i++) {
        const float matrix[20] = {
            1, 0, 0, 0, 0,
            0, 1, 0, 0, 0,
            0, 0, 1, 0, 0,
            0, 0, 0, 0.5f, 0
        };
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
        EXPECT_NE(colorFilter, nullptr);
    }
    
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorFilterDestroy(nullptr);
    }
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS