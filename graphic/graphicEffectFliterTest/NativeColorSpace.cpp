/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "image/pixelmap_native.h"
#include "napi/native_api.h"
#include "native_color_space_manager.h"
#include "render/rs_image.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace {
    constexpr float RED_X = 1.1f;
    constexpr float RED_Y = 1.2f;
    constexpr float GREEN_X = 1.3f;
    constexpr float GREEN_Y = 1.4f;
    constexpr float BLUE_X = 1.5f;
    constexpr float BLUE_Y = 1.6f;
    constexpr float WHITE_X = 1.7f;
    constexpr float WHITE_Y = 1.8f;
}

class NativeColorSpaceManagerTest : public testing::Test {
};

/*
 * @tc.name: ColorSpace_CreateFromName
 * @tc.desc: Test ColorSpace_CreateFromName, test getColorSpaceName
 * @tc.type: FUNC
 * @tc.require: issueIALHL4
 */
HWTEST_F(NativeColorSpaceManagerTest, ColorSpace_CreateFromName, TestSize.Level1)
{
    OH_NativeColorSpaceManager* nativeColorSpaceManager = nullptr;
    ColorSpaceName colorSpaceName = static_cast<ColorSpaceName>(
        OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpaceManager));
    ASSERT_TRUE(colorSpaceName == ColorSpaceName::NONE);
    colorSpaceName = ColorSpaceName::SRGB;
    nativeColorSpaceManager = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    ASSERT_TRUE(nativeColorSpaceManager != nullptr);
    colorSpaceName = static_cast<ColorSpaceName>(
        OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpaceManager));
    ASSERT_TRUE(colorSpaceName == ColorSpaceName::SRGB);
}

/*
 * @tc.name: ColorSpace_CreateFromPrimariesAndGamma
 * @tc.desc: Test ColorSpace_CreateFromPrimariesAndGamma, test true primaries and gamma
 * @tc.type: FUNC
 * @tc.require: issueIALHL4
 */
HWTEST_F(NativeColorSpaceManagerTest, ColorSpace_CreateFromPrimariesAndGamma, TestSize.Level1)
{
    ColorSpacePrimaries colorSpacePrimaries = {RED_X, RED_Y, GREEN_X, GREEN_Y, BLUE_X, BLUE_Y, WHITE_X, WHITE_Y};
    float gamma = 1.f;
    OH_NativeColorSpaceManager* nativeColorSpaceManager = OH_NativeColorSpaceManager_CreateFromPrimariesAndGamma(
        colorSpacePrimaries, gamma);
    WhitePointArray array = OH_NativeColorSpaceManager_GetWhitePoint(nativeColorSpaceManager);
    ASSERT_TRUE(OHOS::Rosen::ROSEN_EQ(array.arr[0], WHITE_X));
    ASSERT_TRUE(OHOS::Rosen::ROSEN_EQ(array.arr[1], WHITE_Y));
    ASSERT_TRUE(OHOS::Rosen::ROSEN_EQ(OH_NativeColorSpaceManager_GetGamma(nativeColorSpaceManager), 1.f));
}

/*
 * @tc.name: ColorSpace_GetColorSpaceName
 * @tc.desc: Test ColorSpace_GetColorSpaceName, test getColorSpaceName
 * @tc.type: FUNC
 * @tc.require: issueIALHL4
 */
HWTEST_F(NativeColorSpaceManagerTest, ColorSpace_GetColorSpaceName, TestSize.Level1)
{
    OH_NativeColorSpaceManager* nativeColorSpaceManager = nullptr;
    ColorSpaceName colorSpaceName = static_cast<ColorSpaceName>(
        OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpaceManager));
    ASSERT_TRUE(colorSpaceName == ColorSpaceName::NONE);
    colorSpaceName = ColorSpaceName::SRGB;
    nativeColorSpaceManager = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    ASSERT_TRUE(nativeColorSpaceManager != nullptr);
    colorSpaceName = static_cast<ColorSpaceName>(
        OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpaceManager));
    ASSERT_TRUE(colorSpaceName == ColorSpaceName::SRGB);
}

/*
 * @tc.name: ColorSpace_GetWhitePoint
 * @tc.desc: Test ColorSpace_GetWhitePoint, test nativeColorSpaceManager is nullptr
 * @tc.type: FUNC
 * @tc.require: issueIALHL4
 */
HWTEST_F(NativeColorSpaceManagerTest, ColorSpace_GetWhitePoint, TestSize.Level1)
{
    OH_NativeColorSpaceManager* nativeColorSpaceManager = nullptr;
    WhitePointArray array = OH_NativeColorSpaceManager_GetWhitePoint(nativeColorSpaceManager);
    ASSERT_TRUE(OHOS::Rosen::ROSEN_EQ(array.arr[0], 0.f));
    ASSERT_TRUE(OHOS::Rosen::ROSEN_EQ(array.arr[1], 0.f));
}

/*
 * @tc.name: ColorSpace_GetGamma
 * @tc.desc: Test ColorSpace_GetGamma, test nativeColorSpaceManager is nullptr
 * @tc.type: FUNC
 * @tc.require: issueIALHL4
 */
HWTEST_F(NativeColorSpaceManagerTest, ColorSpace_GetGamma, TestSize.Level1)
{
    OH_NativeColorSpaceManager* nativeColorSpaceManager = nullptr;
    float gamma = OH_NativeColorSpaceManager_GetGamma(nativeColorSpaceManager);
    ASSERT_TRUE(OHOS::Rosen::ROSEN_EQ(gamma, 0.f));
}

/*
 * @tc.name: ColorSpace_Destroy
 * @tc.desc: ColorSpace_Destroy.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeColorSpaceManagerTest, ColorSpace_Destroy, TestSize.Level1)
{
    OH_NativeColorSpaceManager* nativeColorSpaceManager = nullptr;
    ColorSpaceName colorSpaceName = static_cast<ColorSpaceName>(
        OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpaceManager));
    ASSERT_TRUE(colorSpaceName == ColorSpaceName::NONE);
    colorSpaceName = ColorSpaceName::SRGB;
    nativeColorSpaceManager = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    ASSERT_TRUE(nativeColorSpaceManager != nullptr);
    colorSpaceName = static_cast<ColorSpaceName>(
        OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpaceManager));
    ASSERT_TRUE(colorSpaceName == ColorSpaceName::SRGB);
    OH_NativeColorSpaceManager_Destroy(nativeColorSpaceManager);
}
} // namespace Rosen
} // namespace OHOS
