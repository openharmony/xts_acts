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
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_image.h"
#include "drawing_image_filter.h"
#include "drawing_mask_filter.h"
#include "effect/color_filter.h"
#include "effect/filter.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingMaskFilterTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_MaskFilterCreateBlur
 * @tc.desc: test for OH_Drawing_MaskFilterCreateBlur.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingMaskFilterTest, OH_Drawing_MaskFilterCreateBlur, TestSize.Level1) {
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, 10, true);
    EXPECT_NE(maskFilter, nullptr);
    OH_Drawing_MaskFilterDestroy(maskFilter);
}

/*
 * @tc.name: OH_Drawing_MaskFilterDestroy
 * @tc.desc: test for OH_Drawing_MaskFilterDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingMaskFilterTest, OH_Drawing_MaskFilterDestroy, TestSize.Level1) {
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, 10, true);
    EXPECT_NE(maskFilter, nullptr);
    OH_Drawing_MaskFilterDestroy(maskFilter);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS