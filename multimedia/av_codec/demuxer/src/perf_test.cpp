/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include "gtest/gtest.h"

#include "native_avcodec_base.h"
#include "native_avdemuxer.h"
#include "native_avformat.h"
#include "native_avsource.h"

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>
namespace OHOS {
namespace Media {
class DemuxerPerfNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);
};

static OH_AVMemory *memory = nullptr;
static int32_t g_width = 3840;
static int32_t g_height = 2160;

void DemuxerPerfNdkTest::SetUpTestCase()
{
    OH_AVMemory_Create(g_width * g_height);
}
void DemuxerPerfNdkTest::TearDownTestCase()
{
    if (memory != nullptr) {
        OH_AVMemory_Destroy(memory);
    }
}
void DemuxerPerfNdkTest::SetUp() {}
void DemuxerPerfNdkTest::TearDown() {}
} // namespace Media
} // namespace OHOS

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace {
/**
 * @tc.number    : DEMUXER_MEMORY_0100
 * @tc.name      : demux memory 1280x720 30fps 10M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_MEMORY_0100, TestSize.Level3)
{
    const char *file = "/data/test/media/1280x720_30.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t trackIndex = 0;
    OH_AVCodecBufferAttr attr;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    while ((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) {
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_MEMORY_0200
 * @tc.name      : demux memory 1920x1080 30fps 20M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_MEMORY_0200, TestSize.Level3)
{
    const char *file = "/data/test/media/1920x1080_30.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    int fd = open(file, O_RDONLY);
    uint32_t trackIndex = 0;
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    while ((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) {
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_MEMORY_0300
 * @tc.name      : demux memory 1280x720 30fps 50M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_MEMORY_0300, TestSize.Level3)
{
    const char *file = "/data/test/media/3840x2160_30.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    while ((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) {
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0100
 * @tc.name      : demux memory 1280x720 30fps 10M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0100, TestSize.Level3)
{
    const char *file = "/data/test/media/1280x720_30.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    srand(time(nullptr));
    for (int i = 0; i < 20; i++) {
        int pos_to = rand() % (30 * 3600);
        int64_t toMs = pos_to * 33333;
        ret = OH_AVDemuxer_SeekToTime(demuxer, toMs, SEEK_NEXT_SYNC);
        ASSERT_EQ(ret, AV_ERR_OK);
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0200
 * @tc.name      : demux memory 1280x720 60fps 10M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0200, TestSize.Level3)
{
    const char *file = "/data/test/media/1280x720_60.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    int fd = open(file, O_RDONLY);
    uint32_t trackIndex = 0;
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    srand(time(nullptr));
    for (int i = 0; i < 20; i++) {
        int pos_to = rand() % (60 * 3600);
        int64_t toMs = pos_to * 16666;
        ret = OH_AVDemuxer_SeekToTime(demuxer, toMs, SEEK_NEXT_SYNC);
        ASSERT_EQ(ret, AV_ERR_OK);
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0300
 * @tc.name      : demux memory 1920x1080 30fps 20M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0300, TestSize.Level3)
{
    const char *file = "/data/test/media/1920x1080_30.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    srand(time(nullptr));
    for (int i = 0; i < 20; i++) {
        int pos_to = rand() % (30 * 3600);
        int64_t toMs = pos_to * 33333;
        ret = OH_AVDemuxer_SeekToTime(demuxer, toMs, SEEK_NEXT_SYNC);
        ASSERT_EQ(ret, AV_ERR_OK);
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0400
 * @tc.name      : demux memory 1920x1080 60fps 20M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0400, TestSize.Level3)
{
    const char *file = "/data/test/media/1920x1080_60.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    srand(time(nullptr));
    for (int i = 0; i < 20; i++) {
        int pos_to = rand() % (60 * 3600);
        int64_t toMs = pos_to * 16666;
        ret = OH_AVDemuxer_SeekToTime(demuxer, toMs, SEEK_NEXT_SYNC);
        ASSERT_EQ(ret, AV_ERR_OK);
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0500
 * @tc.name      : demux memory 3840x2160 30fps 50M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0500, TestSize.Level3)
{
    const char *file = "/data/test/media/3840x2160_30.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    srand(time(nullptr));
    for (int i = 0; i < 20; i++) {
        int pos_to = rand() % (30 * 3600);
        int64_t toMs = pos_to * 33333;
        ret = OH_AVDemuxer_SeekToTime(demuxer, toMs, SEEK_NEXT_SYNC);
        ASSERT_EQ(ret, AV_ERR_OK);
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0600
 * @tc.name      : demux memory 3840x2160 60fps 50M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0600, TestSize.Level3)
{
    const char *file = "/data/test/media/3840x2160_60.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    srand(time(nullptr));
    for (int i = 0; i < 20; i++) {
        int pos_to = rand() % (60 * 3600);
        int64_t toMs = pos_to * 16666;
        ret = OH_AVDemuxer_SeekToTime(demuxer, toMs, SEEK_NEXT_SYNC);
        ASSERT_EQ(ret, AV_ERR_OK);
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0700
 * @tc.name      : test CopyNextSample time 1280x720 30fps 10M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0700, TestSize.Level3)
{
    const char *file = "/data/test/media/1280x720_30_10M.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    while ((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) {
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0800
 * @tc.name      : test CopyNextSample time 1920x1080 30fps 20M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0800, TestSize.Level3)
{
    const char *file = "/data/test/media/1920x1080_30.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    while ((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) {
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}

/**
 * @tc.number    : DEMUXER_PERFORMANCE_0900
 * @tc.name      : test CopyNextSample time 3840x2160 30fps 50M
 * @tc.desc      : performance test
 */
HWTEST_F(DemuxerPerfNdkTest, DEMUXER_PERFORMANCE_0900, TestSize.Level3)
{
    const char *file = "/data/test/media/3840x2160_30.mp4";
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCodecBufferAttr attr;
    uint32_t trackIndex = 0;
    int fd = open(file, O_RDONLY);
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, 0);
    ASSERT_NE(source, nullptr);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    ret = OH_AVDemuxer_SelectTrackByID(demuxer, 0);
    ASSERT_EQ(ret, AV_ERR_OK);
    while ((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) {
        ret = OH_AVDemuxer_ReadSample(demuxer, trackIndex, memory, &attr);
        ASSERT_EQ(ret, AV_ERR_OK);
    }
    OH_AVSource_Destroy(source);
    close(fd);
}
}