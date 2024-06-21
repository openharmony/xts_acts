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

#include "drawing_bitmap.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_error_code.h"
#include "drawing_image.h"
#include "drawing_image_filter.h"
#include "gtest/gtest.h"
#include <iostream>
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeImageFilterTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0100
 * @tc.name: testImageFilterCreateBlurNormal
 * @tc.desc: Test for creating a blur image filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurNormal, TestSize.Level0) {
    // 1、OH_Drawing_ImageFilterCreateBlur枚举值OH_Drawing_TileMode遍历
    OH_Drawing_TileMode modes[] = {CLAMP, REPEAT, MIRROR, DECAL};
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 1.0f, mode, nullptr);
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    // 2、OH_Drawing_ImageFilterCreateBlur接口sigmaX、sigmaY传入小数
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 1.0f, OH_Drawing_TileMode::MIRROR, nullptr);
    // 3、OH_Drawing_ImageFilterCreateBlur接口sigmaX、sigmaY传入整数
    filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
    // 4、OH_Drawing_ImageFilterCreateBlur接口input入参NULL
    filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 1.0f, OH_Drawing_TileMode::MIRROR, nullptr);
    // 5、OH_Drawing_ImageFilterCreateBlur接口input入参非NULL
    filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 1.0f, OH_Drawing_TileMode::MIRROR, filter);
    // 6、释放内存
    OH_Drawing_ImageFilterDestroy(filter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0101
 * @tc.name: testImageFilterCreateBlurNULL
 * @tc.desc: Test for creating a blur image filter with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurNULL, TestSize.Level3) {
    // 1、OH_Drawing_ImageFilterCreateBlur第一个参数为空
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(0, 1.0f, OH_Drawing_TileMode::MIRROR, nullptr);
    // 2、OH_Drawing_ImageFilterCreateBlur第二个参数为空
    filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 0, OH_Drawing_TileMode::MIRROR, nullptr);
    // 3、释放内存
    OH_Drawing_ImageFilterDestroy(filter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0102
 * @tc.name: testImageFilterCreateBlurMultipleCalls
 * @tc.desc: Test for multiple calls of creating a blur image filter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurMultipleCalls, TestSize.Level3) {
    // 1、OH_Drawing_ImageFilterCreateBlur（sigmaX、sigmaY传入随机数，OH_Drawing_TileMode随机枚举值），调用10次
    for (int i = 0; i < 10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<float> dis(0, 10);
        OH_Drawing_ImageFilter *filter =
            OH_Drawing_ImageFilterCreateBlur(dis(gen), dis(gen), OH_Drawing_TileMode::MIRROR, nullptr);
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0103
 * @tc.name: testImageFilterCreateBlurAbnormal
 * @tc.desc: Test for creating a blur image filter with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurAbnormal, TestSize.Level3) {
    // 1、OH_Drawing_ImageFilterCreateBlur接口sigmaX、sigmaY传入负数
    OH_Drawing_ImageFilter *filter =
        OH_Drawing_ImageFilterCreateBlur(-1.0f, -1.0f, OH_Drawing_TileMode::MIRROR, nullptr);
    // 2、释放内存
    OH_Drawing_ImageFilterDestroy(filter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0104
 * @tc.name: testImageFilterCreateBlurMaximum
 * @tc.desc: Test for creating a blur image filter with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurMaximum, TestSize.Level3) {
    // 1、OH_Drawing_ImageFilterCreateBlur接口sigmaX、sigmaY传入极大值
    OH_Drawing_ImageFilter *filter =
        OH_Drawing_ImageFilterCreateBlur(FLT_MAX, FLT_MAX, OH_Drawing_TileMode::MIRROR, nullptr);
    // 2、释放内存
    OH_Drawing_ImageFilterDestroy(filter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0200
 * @tc.name: testImageFilterCreateFromColorFilterNormal
 * @tc.desc: Test for creating an image filter from a color filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateFromColorFilterNormal, TestSize.Level0) {
    // 1、OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
    // 2、OH_Drawing_ColorFilterCreateLinearToSrgbGamma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    // 3、OH_Drawing_ImageFilterCreateFromColorFilter参数input为null
    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
    // 4、OH_Drawing_ImageFilterCreateFromColorFilter参数input不为null
    imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, filter);
    // 5、释放内存
    OH_Drawing_ImageFilterDestroy(imageFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ImageFilterDestroy(filter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0201
 * @tc.name: testImageFilterCreateFromColorFilterNULL
 * @tc.desc: Test for creating an image filter from a color filter with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateFromColorFilterNULL, TestSize.Level3) {
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
    // 1、OH_Drawing_ImageFilterCreateFromColorFilter第一个参数为空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_ImageFilterCreateFromColorFilter(nullptr, filter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2、释放内存
    OH_Drawing_ImageFilterDestroy(filter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0202
 * @tc.name: testImageFilterCreateFromColorFilterMultipleCalls
 * @tc.desc: Test for multiple calls of creating an image filter from a color filter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateFromColorFilterMultipleCalls, TestSize.Level3) {
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0300
 * @tc.name: testImageFilterDestroyNormal
 * @tc.desc: Test for destroying an image filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterDestroyNormal, TestSize.Level0) {
    // 1、OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
    // 2、OH_Drawing_ImageFilterDestroy
    OH_Drawing_ImageFilterDestroy(filter);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0301
 * @tc.name: testImageFilterDestroyNULL
 * @tc.desc: Test for destroying an image filter with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterDestroyNULL, TestSize.Level3) {
    // 1、OH_Drawing_ImageFilterDestroy参数为空
    OH_Drawing_ImageFilterDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0302
 * @tc.name: testImageFilterDestroyMultipleCalls
 * @tc.desc: Test for multiple calls of destroying an image filter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterDestroyMultipleCalls, TestSize.Level3) {
    // 1、OH_Drawing_ImageFilterCreateFromColorFilter，调用10次
    OH_Drawing_ColorFilter *colorFilter;
    OH_Drawing_ImageFilter *filter;
    for (int i = 0; i < 10; i++) {
        colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        filter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
    }
    // 2、OH_Drawing_ImageFilterDestroy，调用10次
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ImageFilterDestroy(filter);
        filter = nullptr;
    }
    // 3、OH_Drawing_ImageFilterCreateBlur-OH_Drawing_ImageFilterDestroy来回调用10次
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    OH_Drawing_ImageFilterDestroy(filter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS