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
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_shadow_layer.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeColorTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_ColorSetArgb
 * @tc.desc: test for OH_Drawing_ColorSetArgb.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeColorTest, OH_Drawing_ColorSetArgb, TestSize.Level1) {
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush1, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush1), 0xFFFF0000);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS