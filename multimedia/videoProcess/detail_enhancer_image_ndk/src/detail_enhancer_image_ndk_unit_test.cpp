/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include <gtest/gtest.h>
#include <fstream>

#include "image_processing.h"
#include "image_processing_types.h"
#include "image_processing_impl.h"
#include "image_processing_capi_capability.h"
#include "native_avformat.h"
#include "pixelmap_native.h"
#include "surface/native_buffer.h"

using namespace std;
using namespace testing::ext;

const int32_t IMAGE_PROCESSING_TYPE_COLOR_SPACE_CONVERSION = 0x1;
const int32_t IMAGE_PROCESSING_TYPE_COMPOSITION = 0x2;
const int32_t IMAGE_PROCESSING_TYPE_DECOMPOSITION = 0x4;
const int32_t IMAGE_PROCESSING_TYPE_METADATA_GENERATION = 0x8;
const int32_t IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER = 0x10;
const char* IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL = "QualityLevel";

namespace OHOS {
namespace Media {
namespace VideoProcessingEngine {

const ImageProcessing_ColorSpaceInfo param_srgb = {
    0,
    OH_COLORSPACE_SRGB_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_p3 = {
    0,
    OH_COLORSPACE_P3_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_bt709 = {
    0,
    OH_COLORSPACE_BT709_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_not_support = {
    0,
    OH_COLORSPACE_BT601_EBU_FULL,
    NATIVEBUFFER_PIXEL_FMT_BGRX_8888,
};

const ImageProcessing_ColorSpaceInfo param5 = {
    0,
    OH_COLORSPACE_BT2020_PQ_LIMIT,
    NATIVEBUFFER_PIXEL_FMT_RGBA_1010102,
};

class DetailEnhancerImageNdkUnitTest : public testing::Test {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp();
    void TearDown();
};

void DetailEnhancerImageNdkUnitTest::SetUpTestCase(void)
{
}

void DetailEnhancerImageNdkUnitTest::TearDownTestCase(void)
{
}

void DetailEnhancerImageNdkUnitTest::SetUp(void)
{
}

void DetailEnhancerImageNdkUnitTest::TearDown(void)
{
}

void CreateEmptyPixelmap(OH_PixelmapNative** pixelMap, int32_t width, int32_t height, int format)
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&options);
    (void)OH_PixelmapInitializationOptions_SetWidth(options, width);
    (void)OH_PixelmapInitializationOptions_SetHeight(options, height);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(options, format);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(options, pixelMap);
}

bool IsSupportImageSR()
{
    if (!access("/sys_prod/lib64/VideoProcessingEngine/libdisplay_aipq_imagesr.so", 0)) {
        return true;
    }
    return false;
}

// initialize environment
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_01, TestSize.Level1)
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_InitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// initialize and de-initialize
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_02, TestSize.Level1)
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_InitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    ret = OH_ImageProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
}

// de-initialize without initialize
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_03, TestSize.Level1)
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_DeinitializeEnvironment();
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
}

// create instance
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_04, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
}

// create instance impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_04_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
}

// create instance with wrong type
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_05, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, 11);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
}

// create instance with wrong type impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_05_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing::Create(&instance, 11,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
}

// destroy instance
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_06, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Destroy(instance);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
}

// destroy instance impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_06_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = OH_ImageProcessing::Destroy(instance);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
}

// destroy null instance
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_07, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Destroy(instance);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
}

// destroy null instance impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_07_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing::Destroy(instance);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
}

// set parameter normally
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_08, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, 10);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
}

// set parameter normally impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_08_1, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, 10);
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->SetParameter(parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
}

// set parameter with null
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_09, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
}

// set parameter with null impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_09_1, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->SetParameter(parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
}

// set parameter but instance is null
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_10, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
}

// get parameter after set parameter
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_11, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
}

// get parameter after set parameter impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_11_1, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    instance->GetImageProcessing()->SetParameter(parameter);
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->GetParameter(parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
}

// get parameter but parameter is null
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_12, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
}

// get parameter but parameter is null impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_12_1, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->GetParameter(parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
}

// get parameter but instance is null set
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_13, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
}

// get parameter but parameter is not null
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_14, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
}

// get parameter but parameter is not null impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_14_1, TestSize.Level1)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    OH_AVFormat* parameter = OH_AVFormat_Create();
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->GetParameter(parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
}

// colorspaceconversion support check 1
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_15, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_srgb, &param_p3);
    ASSERT_FALSE(ret);
}

// colorspaceconversion support check 2
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_16, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_p3, &param_bt709);
    ASSERT_FALSE(ret);
}

// colorspaceconversion support check 3
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_17, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_bt709, &param_not_support);
    ASSERT_FALSE(ret);
}

// colorspaceconversion support check 4
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_18, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_p3, &param_srgb);
    ASSERT_FALSE(ret);
}

// conposition support check 1
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_19, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_srgb, &param_srgb, &param_p3);
    ASSERT_FALSE(ret);
}

// conposition support check 2
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_20, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_not_support, &param_not_support, &param_not_support);
    ASSERT_FALSE(ret);
}

// conposition support check 3
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_21, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_srgb, &param_srgb, &param_srgb);
    ASSERT_FALSE(ret);
}

// deconposition support check 1
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_22, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_srgb, &param_p3, &param_bt709);
    ASSERT_FALSE(ret);
}

// deconposition support check 2
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_23, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_not_support, &param_not_support, &param_not_support);
    ASSERT_FALSE(ret);
}

// deconposition support check 3
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_24, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_srgb, &param_srgb, &param_srgb);
    ASSERT_FALSE(ret);
}

// metadata generation support check 1
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_25, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param5);
    ASSERT_FALSE(ret);
}

// metadata generation support check 2
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_26, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_p3);
    ASSERT_FALSE(ret);
}

// metadata generation support check 3
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_27, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_bt709);
    ASSERT_FALSE(ret);
}

// metadata generation support check 4
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_28, TestSize.Level1)
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_not_support);
    ASSERT_FALSE(ret);
}

// convert color space RGBA to BGRA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_29, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_ConvertColorSpace(instance2, srcImg, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->ConvertColorSpace(srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// convert color space BGRA to RGBA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_30, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_ConvertColorSpace(instance2, srcImg, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->ConvertColorSpace(srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// convert color space nullptr
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_31, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// convert color space nullptr impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_31_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->ConvertColorSpace(srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// compose RGBA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_32, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&gainmap, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Compose(instance2, srcImg, gainmap, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->Compose(srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// compose BGRA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_33, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&gainmap, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Compose(instance2, srcImg, gainmap, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->Compose(srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// compose nullptr
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_34, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Compose(instance, srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// compose nullptr impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_34_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->Compose(srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// decompose RGBA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_35, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&gainmap, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Decompose(instance2, srcImg, dstImg, gainmap);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->Decompose(srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// decompose BGRA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_36, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&gainmap, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Decompose(instance2, srcImg, dstImg, gainmap);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->Decompose(srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// decompose nullptr
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_37, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Decompose(instance, srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// compose nullptr impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_37_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->Decompose(srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// generate metadata RGBA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_38, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_GenerateMetadata(instance2, srcImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->GenerateMetadata(srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// generate metadata BGRA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_39, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_GenerateMetadata(instance2, srcImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->GenerateMetadata(srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// generate metadata nullptr
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_40, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// generate metadata nullptr impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_40_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->GenerateMetadata(srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// detail enhance RGBA
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_41, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 1440, 1920, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    if (IsSupportImageSR()) {
        EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    } else {
#ifdef SKIA_ENABLE
        EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
#else
        EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
#endif
    }
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// detail enhance RGBA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_41_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, 1440, 1920, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->EnhanceDetail(srcImg, dstImg);
#ifdef SKIA_ENABLE
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
#else
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
#endif
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// detail enhance BGRA
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_42, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 1440, 1920, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    if (IsSupportImageSR()) {
        EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    } else {
#ifdef SKIA_ENABLE
        EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
#else
        EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
#endif
    }
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// detail enhance BGRA impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_42_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, 720, 960, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, 1440, 1920, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->EnhanceDetail(srcImg, dstImg);
#ifdef SKIA_ENABLE
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
#else
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
#endif
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// detail enhance nullptr
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_43, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

// detail enhance nullptr impl
HWTEST_F(DetailEnhancerImageNdkUnitTest, vpeImageNdk_43_1, TestSize.Level1)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing::Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        ImageProcessingCapiCapability::Get().GetOpenGLContext(),
        ImageProcessingCapiCapability::Get().GetClContext());
    ImageProcessing_ErrorCode ret = instance->GetImageProcessing()->EnhanceDetail(srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing::Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
}

}
} // namespace Media
} // namespace OHOS