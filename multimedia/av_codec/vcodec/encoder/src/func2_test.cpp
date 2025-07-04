/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <string>

#include "gtest/gtest.h"
#include "native_avcodec_videoencoder.h"
#include "native_averrors.h"
#include "videoenc_sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"

namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t DEFAULT_QUALITY = 30;
constexpr uint32_t MAX_PROFILE_NUM = 3;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format;
const char *INP_DIR_720 = "/data/test/media/1280_720_nv.yuv";
constexpr uint32_t SECOND = 1000;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr uint32_t MAX_QUALITY = 100;
constexpr uint32_t NO_SUPPORT_MODE = 100;
} // namespace
namespace OHOS {
namespace Media {
class HwEncFunc2NdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
};
} // namespace Media
} // namespace OHOS

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

void HwEncFunc2NdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (memcpy_s(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != 0)
        cout << "memcpy failed" << endl;
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (memcpy_s(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc)) != 0)
        cout << "memcpy failed" << endl;
    cout << "codecname_hevc: " << g_codecNameHEVC << endl;
}
void HwEncFunc2NdkTest::TearDownTestCase() {}
void HwEncFunc2NdkTest::SetUp() {}
void HwEncFunc2NdkTest::TearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}
namespace {
/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3100
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3100, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GT(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3200
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3200, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3300
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3300, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 0, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3400
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3400, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, 0, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3500
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3500, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GT(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3600
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3600, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, 0, DEFAULT_HEIGHT, 30));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3700
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3700, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, 0, 30));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3800
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3800, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3900
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3900, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 30));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4000
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4000, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t pixelFormatNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, nullptr, &pixelFormatNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4100
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4100, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4200
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4200, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        uint32_t pixelFormatNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
        ASSERT_NE(nullptr, pixelFormat);
        ASSERT_GT(pixelFormatNum, 0);
        ASSERT_EQ(AV_ERR_OK, ret);
        for (int i = 0; i < pixelFormatNum; i++) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            ASSERT_GE(pixelFormat[i], 0);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
            EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            OH_AVFormat_Destroy(format);
            OH_VideoEncoder_Destroy(venc_);
        }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
        EXPECT_EQ(AV_ERR_UNSUPPORT, OH_VideoEncoder_Configure(venc_, format));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4300
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4300, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t profileNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, nullptr, &profileNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4400
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4400, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4500
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4500, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        uint32_t profileNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, profiles);
        ASSERT_GT(profileNum, 0);
        for (int i = 0; i < profileNum; i++) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            EXPECT_GE(profiles[i], 0);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profiles[i]);
            ret = OH_VideoEncoder_Configure(venc_, format);
            if (ret != AV_ERR_OK) {
                cout << profiles[i] << " profile cant configure" << endl;
            }
            EXPECT_EQ(AV_ERR_OK, ret);
            OH_AVFormat_Destroy(format);
            OH_VideoEncoder_Destroy(venc_);
        }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        int32_t illegalProfile = HEVC_PROFILE_MAIN_10_HDR10_PLUS + HEVC_PROFILE_MAIN_10_HDR10_PLUS;
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, illegalProfile);
        ret = OH_VideoEncoder_Configure(venc_, format);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4600
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4600, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t **levels = nullptr;
        uint32_t levelNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, 1, levels, &levelNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4700
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4700, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t levelNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, nullptr, &levelNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4800
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4800, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, &levels, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4900
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4900, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        uint32_t levelNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, &levels, &levelNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, levels);
        ASSERT_GT(levelNum, 0);
        for (int i = 0; i < levelNum; i++) {
            ASSERT_GE(levels[i], 0);
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5000
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5000, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        int32_t profile = HEVC_PROFILE_MAIN_10_HDR10_PLUS + 1;
        int32_t level = HEVC_LEVEL_62 + 1;
        ASSERT_NE(true, OH_AVCapability_AreProfileAndLevelSupported(capability, profile, level));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5100
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5100, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC,
            true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, HEVC_PROFILE_MAIN, 1));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8700
 * @tc.name      :  AV_PIXEL_FORMAT_RGBA param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_CAPABILITY_8700, TestSize.Level2)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8800
 * @tc.name      :  AV_PIXEL_FORMAT_NV21 param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_CAPABILITY_8800, TestSize.Level2)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8900
 * @tc.name      :  OH_MD_KEY_BITRATE param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_CAPABILITY_8900, TestSize.Level2)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            int64_t min = 1;
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, min);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_9000
 * @tc.name      :  OH_MD_KEY_BITRATE param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_CAPABILITY_9000, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        int64_t max = 100000001;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, max);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5500
 * @tc.name      :  AV_PIXEL_FORMAT_NV21 param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5500, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV21);
        if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
            EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }else {
            ASSERT_EQ(AV_ERR_UNSUPPORT, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5600
 * @tc.name      :  AV_PIXEL_FORMAT_YUVI420 param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5600, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5700
 * @tc.name      :  AV_PIXEL_FORMAT_RGBA param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5700, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA);
            EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5800
 * @tc.name      :  OH_MD_KEY_BITRATE param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5800, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        int64_t min = 1;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, min);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
            EXPECT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
        }else {
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5900
 * @tc.name      :  OH_MD_KEY_BITRATE param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5900, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        int64_t max = 100000001;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, max);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
    } else {
        return;
    }
}
} // namespace
