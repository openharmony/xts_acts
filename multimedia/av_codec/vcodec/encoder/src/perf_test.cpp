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
#include "videoenc_ndk_sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"

#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace OHOS {
namespace Media {
class HwEncPerfNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();

protected:
    OH_AVCapability *cap = nullptr;
    OH_AVCapability *cap_hevc = nullptr;
    const string codecName;
    const string codecNameHEVC;
    const char *inpDir720 = "/data/test/media/1280_720_nv.yuv";
    const char *inpDir1080 = "/data/test/media/1920_1080_nv.yuv";
    const char *inpDir2160 = "/data/test/media/3840_2160_nv.yuv";
};
} // namespace Media
} // namespace OHOS

void HwEncPerfNdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    codecName = OH_AVCapability_GetName(cap);
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
}
void HwEncPerfNdkTest::TearDownTestCase() {}
void HwEncPerfNdkTest::SetUp() {}
void HwEncPerfNdkTest::TearDown() {}

namespace {
/**
 * @tc.number    : VIDEO_ENCODE_PERF_0100
 * @tc.name      : OH_VideoEncoder_CreateByMime
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0100, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->OUT_DIR = "/data/test/media/1280_720_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0200
 * @tc.name      : perf time,1080P buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0200, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir1080;
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1088;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->OUT_DIR = "/data/test/media/1920_1080_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0300
 * @tc.name      : perf time,4K buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0300, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir2160;
    vEncSample->DEFAULT_WIDTH = 3840;
    vEncSample->DEFAULT_HEIGHT = 2160;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 30000000;
    vEncSample->OUT_DIR = "/data/test/media/3840_2160_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0400
 * @tc.name      : perf time,720P buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0400, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->OUT_DIR = "/data/test/media/1280_720_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0500
 * @tc.name      : perf mmeory,1080P buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0500, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir1080;
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1088;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->OUT_DIR = "/data/test/media/1920_1080_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0600
 * @tc.name      : perf memory,4K buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0600, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir2160;
    vEncSample->DEFAULT_WIDTH = 3840;
    vEncSample->DEFAULT_HEIGHT = 2160;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 30000000;
    vEncSample->OUT_DIR = "/data/test/media/3840_2160_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0700
 * @tc.name      : perf memory,720P buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0700, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->OUT_DIR = "/data/test/media/1280_720_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0700
 * @tc.name      : perf memory,720P buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0800, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir1080;
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1088;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->OUT_DIR = "/data/test/media/1920_1080_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0900
 * @tc.name      : perf memory,4K buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_0900, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir2160;
    vEncSample->DEFAULT_WIDTH = 3840;
    vEncSample->DEFAULT_HEIGHT = 2160;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 30000000;
    vEncSample->OUT_DIR = "/data/test/media/3840_2160_buffer.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_0700
 * @tc.name      : perf time,720P buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_1000, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->OUT_DIR = "/data/test/media/1280_720_buffer.h265";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_1100
 * @tc.name      : perf time,1080P buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_1100, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir1080;
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1088;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->OUT_DIR = "/data/test/media/1920_1080_buffer.h265";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_BUFFER_1200
 * @tc.name      : perf time,4K buffer
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_BUFFER_1200, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir2160;
    vEncSample->DEFAULT_WIDTH = 3840;
    vEncSample->DEFAULT_HEIGHT = 2160;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 30000000;
    vEncSample->OUT_DIR = "/data/test/media/3840_2160_buffer.h265";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0100
 * @tc.name      : perf time,720P surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0100, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/1280_720.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0200
 * @tc.name      : perf time,1080P surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0200, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir1080;
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1088;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/1920_1080.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0300
 * @tc.name      : perf time,4K surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0300, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir2160;
    vEncSample->DEFAULT_WIDTH = 3840;
    vEncSample->DEFAULT_HEIGHT = 2160;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 30000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/3840_2160.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0400
 * @tc.name      : perf time,720P surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0400, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/1280_720.h265";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0500
 * @tc.name      : perf time,1080P surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0500, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir1080;
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1088;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/1920_1080.h265";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0600
 * @tc.name      : perf time,4K surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0600, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir2160;
    vEncSample->DEFAULT_WIDTH = 3840;
    vEncSample->DEFAULT_HEIGHT = 2160;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 30000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/3840_2160.h265";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME_AVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0700
 * @tc.name      : perf time,720P surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0700, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/1280_720.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0800
 * @tc.name      : perf time,1080P surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0800, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir1080;
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1088;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/1920_1080.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_0900
 * @tc.name      : perf time,4K surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_0900, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir2160;
    vEncSample->DEFAULT_WIDTH = 3840;
    vEncSample->DEFAULT_HEIGHT = 2160;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_BITRATE = 30000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/3840_2160.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_1000
 * @tc.name      : perf memory,720p surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_1000, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/1280_720.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_1100
 * @tc.name      : perf memory,1080P surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_1100, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir1080;
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1088;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/1920_1080.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_SURFACE_1200
 * @tc.name      : perf memory,4K surface
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_SURFACE_1200, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = inpDir2160;
    vEncSample->DEFAULT_WIDTH = 3840;
    vEncSample->DEFAULT_HEIGHT = 2160;
    vEncSample->DEFAULT_FRAME_RATE = 60;
    vEncSample->DEFAULT_BITRATE = 30000000;
    vEncSample->SURFACE_INPUT = true;
    vEncSample->OUT_DIR = "/data/test/media/3840_2160.h264";
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_0100
 * @tc.name      : OH_VideoEncoder_CreateByMime
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_0100, TestSize.Level1)
{
    for (int i = 0; i < 2000; i++) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_PERF_FUNCTION_2200
 * @tc.name      : api test 2000 time
 * @tc.desc      : performance test
 */
HWTEST_F(HwEncPerfNdkTest, VIDEO_ENCODE_PERF_FUNCTION_2200, TestSize.Level1)
{
    for (int i = 0; i < 2000; i++) {
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = inpDir1080;
        vEncSample->DEFAULT_WIDTH = 1920;
        vEncSample->DEFAULT_HEIGHT = 1080;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->CreateVideoEncoder(CODEC_NAME_AVC);
        vEncSample->SetVideoEncoderCallback();
        vEncSample->ConfigureVideoEncoder();
        vEncSample->testApi();
        delete vEncSample;
        cout << i << " ";
    }
}
} // namespace