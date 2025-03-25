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
class DrawingNativeImageFilterTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeImageFilterTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeImageFilterTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeImageFilterTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeImageFilterTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0100
 * @tc.name: testImageFilterCreateBlurNormal
 * @tc.desc: Test for creating a blur image filter with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurNormal, Function | SmallTest | Level0) {
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_TileMode modes[] = {CLAMP, REPEAT, MIRROR, DECAL};
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 1.0f, mode, nullptr);
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    // 2. Pass decimal values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 1.0f, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Pass integer values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 4. Pass NULL for input parameter in OH_Drawing_ImageFilterCreateBlur
    filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 1.0f, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 5. Pass non-NULL for input parameter in OH_Drawing_ImageFilterCreateBlur
    filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 1.0f, OH_Drawing_TileMode::MIRROR, filter);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 6. Destroy the filter object
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurNULL, Function | SmallTest | Level3) {
    // 1. OH_Drawing_ImageFilterCreateBlur with the first parameter being null
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(0, 1.0f, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. OH_Drawing_ImageFilterCreateBlur with the second parameter being null
    filter = OH_Drawing_ImageFilterCreateBlur(1.0f, 0, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Destroy the filter object
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_ImageFilterCreateBlur (pass random values for sigmaX and sigmaY, random enum value for
    // OH_Drawing_TileMode), call 10 times
    for (int i = 0; i < 10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<float> dis(0, 10);
        std::uniform_int_distribution<int> enum_dis(0, 3);
        OH_Drawing_TileMode tileMode = static_cast<OH_Drawing_TileMode>(enum_dis(gen));
        OH_Drawing_ImageFilter *filter =
            OH_Drawing_ImageFilterCreateBlur(dis(gen), dis(gen), tileMode, nullptr);
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurAbnormal, Function | SmallTest | Level3) {
    // 1. Pass negative values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter =
        OH_Drawing_ImageFilterCreateBlur(-1.0f, -1.0f, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. Destroy the filter object
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateBlurMaximum, Function | SmallTest | Level3) {
    // 1. Create a blur image filter with maximum values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter =
        OH_Drawing_ImageFilterCreateBlur(FLT_MAX, FLT_MAX, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. Destroy the filter object
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateFromColorFilterNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. OH_Drawing_ColorFilterCreateLinearToSrgbGamma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 3. OH_Drawing_ImageFilterCreateFromColorFilter with null input parameter
    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
    // add assert
    EXPECT_NE(imageFilter, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ImageFilterCreateFromColorFilter with non-null input parameter
    imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, filter);
    // add assert
    EXPECT_NE(imageFilter, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateFromColorFilterNULL, Function | SmallTest | Level3) {
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 1. OH_Drawing_ImageFilterCreateFromColorFilter with the first parameter being null, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageFilterCreateFromColorFilter(nullptr, filter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterCreateFromColorFilterMultipleCalls, Function | SmallTest | Level3) {
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        // add assert
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
        EXPECT_NE(filter, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterDestroyNormal, Function | SmallTest | Level0) {
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
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
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterDestroyNULL, Function | SmallTest | Level3) {
    OH_Drawing_ImageFilterDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_FILTER_0302
 * @tc.name: testImageFilterDestroyMultipleCalls
 * @tc.desc: Test for multiple calls of destroying an image filter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageFilterTest, testImageFilterDestroyMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_ImageFilterCreateFromColorFilter 10 times
    OH_Drawing_ColorFilter *colorFilters[10];
    OH_Drawing_ImageFilter *filters[10];
    for (int i = 0; i < 10; i++) {
        colorFilters[i] = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        // add assert
        EXPECT_NE(colorFilters[i], nullptr);
        filters[i] = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilters[i], nullptr);
        // add assert
        EXPECT_NE(filters[i], nullptr);
    }
    // 2. Call OH_Drawing_ImageFilterDestroy 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ImageFilterDestroy(filters[i]);
        OH_Drawing_ColorFilterDestroy(colorFilters[i]);
    }
    // 3. Call OH_Drawing_ImageFilterCreateBlur and OH_Drawing_ImageFilterDestroy alternately 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(1, 1, OH_Drawing_TileMode::MIRROR, nullptr);
        // add assert
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS