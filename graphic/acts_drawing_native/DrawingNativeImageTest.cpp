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
#include "drawing_error_code.h"
#include "drawing_image.h"
#include "gtest/gtest.h"
#include <cstdlib>
#include <ctime>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeImageTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0100
 * @tc.name: testImageCreateDestroyNormal
 * @tc.desc: Test for creating and destroying an image object with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeImageTest, testImageCreateDestroyNormal, TestSize.Level0) {
    // 1、OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // 2、OH_Drawing_ImageDestroy
    OH_Drawing_ImageDestroy(image);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0101
 * @tc.name: testImageCreateDestroyNULL
 * @tc.desc: Test for destroying an image object with a NULL parameter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageCreateDestroyNULL, TestSize.Level3) {
    // 1、OH_Drawing_ImageDestroy第一个参数传空
    OH_Drawing_ImageDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0102
 * @tc.name: testImageCreateDestroyMultipleCalls
 * @tc.desc: Test for multiple calls of creating and destroying an image object.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageCreateDestroyMultipleCalls, TestSize.Level3) {
    // 1、OH_Drawing_ImageCreate-OH_Drawing_ImageDestroy来回调用10次
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        OH_Drawing_ImageDestroy(image);
    }
    // 2、OH_Drawing_ImageCreate连续调用10次
    OH_Drawing_Image *image;
    for (int i = 0; i < 10; i++) {
        image = OH_Drawing_ImageCreate();
    }
    // 3、OH_Drawing_ImageDestroy连续调用10次
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ImageDestroy(image);
        image = nullptr;
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0200
 * @tc.name: testImageBuildFromBitmapNormal
 * @tc.desc: Test for building an image from a bitmap with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeImageTest, testImageBuildFromBitmapNormal, TestSize.Level0) {
    // 1、OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // 2、OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 3、OH_Drawing_ImageBuildFromBitmap构造图片内容成功
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    EXPECT_NE(bitmap, nullptr);
    // 4、OH_Drawing_ImageBuildFromBitmap构造图片内容失败
    OH_Drawing_ImageBuildFromBitmap(image, nullptr);
    // 5、释放内存
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0201
 * @tc.name: testImageBuildFromBitmapNULL
 * @tc.desc: Test for building an image from a bitmap with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageBuildFromBitmapNULL, TestSize.Level3) {
    // 1、OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // 2、OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 3、OH_Drawing_ImageBuildFromBitmap第一个参数传空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_ImageBuildFromBitmap(nullptr, bitmap);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4、OH_Drawing_ImageBuildFromBitmap第二个参数传空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_ImageBuildFromBitmap(image, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5、释放内存
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0202
 * @tc.name: testImageBuildFromBitmapMultipleCalls
 * @tc.desc: Test for multiple calls of building an image from a bitmap.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageBuildFromBitmapMultipleCalls, TestSize.Level3) {
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0300
 * @tc.name: testImageGetWidthHeightNormal
 * @tc.desc: Test for getting width and height of an image with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeImageTest, testImageGetWidthHeightNormal, TestSize.Level0) {
    // 1、OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    // 2、OH_Drawing_ImageGetWidth
    int32_t width_ = OH_Drawing_ImageGetWidth(image);
    EXPECT_EQ(width_, 200);
    // 3、OH_Drawing_ImageGetHeight
    int32_t height_ = OH_Drawing_ImageGetHeight(image);
    EXPECT_EQ(height_, 200);
    // 4、释放内存
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0301
 * @tc.name: testImageGetWidthHeightNULL
 * @tc.desc: Test for getting width and height of an image with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageGetWidthHeightNULL, TestSize.Level3) {
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 200;
    uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    // 1、OH_Drawing_ImageGetWidth参数传空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_ImageGetWidth(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2、OH_Drawing_ImageGetHeight参数传空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_ImageGetHeight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0302
 * @tc.name: testImageGetWidthHeightMultipleCalls
 * @tc.desc: Test for multiple calls of getting width and height of an image.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageGetWidthHeightMultipleCalls, TestSize.Level3) {
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        int32_t width_ = OH_Drawing_ImageGetWidth(image);
        EXPECT_EQ(width_, 200 + i * 10);
        int32_t height_ = OH_Drawing_ImageGetHeight(image);
        EXPECT_EQ(height_, 200 + i * 10);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0400
 * @tc.name: testImageGetImageInfoNormal
 * @tc.desc: Test for getting image info with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeImageTest, testImageGetImageInfoNormal, TestSize.Level0) {
    OH_Drawing_ColorFormat cfs[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat afs[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    for (OH_Drawing_ColorFormat cf : cfs) {
        for (OH_Drawing_AlphaFormat af : afs) {
            OH_Drawing_Image *image = OH_Drawing_ImageCreate();
            OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
            OH_Drawing_BitmapFormat cFormat{cf, af};
            uint32_t width = 400;
            uint32_t height = 400;
            OH_Drawing_Image_Info imageInfo;
            OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
            OH_Drawing_ImageGetImageInfo(image, &imageInfo);
            OH_Drawing_ImageDestroy(image);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0401
 * @tc.name: testImageGetImageInfoNULL
 * @tc.desc: Test for getting image info with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageGetImageInfoNULL, TestSize.Level3) {
    // 1、OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 2、OH_Drawing_Image_Info
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 400;
    uint32_t height = 400;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3、OH_Drawing_ImageGetImageInfo参数传空，通过OH_Drawing_ErrorCodeGet查看错误码
    OH_Drawing_ImageGetImageInfo(nullptr, &imageInfo);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4、释放内存
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0402
 * @tc.name: testImageGetImageInfoMultipleCalls
 * @tc.desc: Test for multiple calls of getting image info.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageGetImageInfoMultipleCalls, TestSize.Level3) {
    OH_Drawing_ColorFormat cf[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat af[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        srand(static_cast<unsigned int>(time(0)));
        OH_Drawing_BitmapFormat cFormat{cf[rand() % 5 + 1], af[rand() % 3 + 1]};
        uint32_t width = rand() % 100 + 1;
        uint32_t height = rand() % 100 + 1;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_Image_Info imageInfo;
        OH_Drawing_ImageGetImageInfo(image, &imageInfo);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0403
 * @tc.name: testImageGetImageInfoAbnormal
 * @tc.desc: Test for getting image info with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageGetImageInfoAbnormal, TestSize.Level3) {
    // 1、OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 2、OH_Drawing_ImageGetImageInfo调用OH_Drawing_Image_Info创建时width=-400，Height=-400
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = -400;
    uint32_t height = -400;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3、释放内存
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_IMAGE_0404
 * @tc.name: testImageGetImageInfoMaximum
 * @tc.desc: Test for getting image info with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeImageTest, testImageGetImageInfoMaximum, TestSize.Level3) {
    // 1、OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // 2、OH_Drawing_ImageGetImageInfo调用OH_Drawing_Image_Info创建时width=极大值，Height=极大值
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = UINT32_MAX;
    uint32_t height = UINT32_MAX;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3、释放内存
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS