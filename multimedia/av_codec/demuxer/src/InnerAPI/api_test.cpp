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

#include "gtest/gtest.h"

#include "avdemuxer.h"
#include "avsource.h"
#include "meta/format.h"
#include "avcodec_errors.h"
#include "avcodec_common.h"
#include "buffer/avsharedmemory.h"
#include "buffer/avsharedmemorybase.h"
#include "securec.h"

#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>

using namespace std;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::Media;
using namespace testing::ext;

namespace {
static int32_t g_width = 3840;
static int32_t g_height = 2160;
static std::shared_ptr<AVSource> source = nullptr;
static std::shared_ptr<AVDemuxer> demuxer = nullptr;
const char *g_file1 = "/data/test/media/01_video_audio.mp4";
const char *g_file2 = "/data/test/media/avcc_10sec.mp4";
} // namespace

namespace {
class DemuxerInnerApiNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);

public:
    int fd1;
    int64_t size;
};

void DemuxerInnerApiNdkTest::SetUpTestCase() {}
void DemuxerInnerApiNdkTest::TearDownTestCase() {}

void DemuxerInnerApiNdkTest::SetUp()
{
    fd1 = open(g_file1, O_RDONLY);
    struct stat fileStatus {};
    if (stat(g_file1, &fileStatus) == 0) {
        size = static_cast<int64_t>(fileStatus.st_size);
    }

    std::cout << fd1 << "----------" << g_file1 << "=====" << size << std::endl;
}

void DemuxerInnerApiNdkTest::TearDown()
{
    close(fd1);
    fd1 = 0;

    if (source != nullptr) {
        source = nullptr;
    }

    if (demuxer != nullptr) {
        demuxer = nullptr;
    }
}
} // namespace

namespace {
/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0100
 * @tc.name      : CreateWithURI para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0100, TestSize.Level2)
{
    source = AVSourceFactory::CreateWithURI("");
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0200
 * @tc.name      : CreateWithFD para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0200, TestSize.Level2)
{
    // fd must bigger than 2
    source = AVSourceFactory::CreateWithFD(2, 0, 0);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0300
 * @tc.name      : CreateWithFD para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0300, TestSize.Level2)
{
    // fd must bigger than 2
    source = AVSourceFactory::CreateWithFD(3, 0, -1);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0400
 * @tc.name      : CreateWithFD para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0400, TestSize.Level2)
{
    // fd must bigger than
    source = AVSourceFactory::CreateWithFD(3, -1, 1);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0500
 * @tc.name      : GetTrackFormat para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0500, TestSize.Level2)
{
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);

    Format format;
    int32_t ret = source->GetTrackFormat(format, -1);
    ASSERT_EQ(AVCS_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0600
 * @tc.name      : CreateWithFD para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0600, TestSize.Level2)
{
    source = AVSourceFactory::CreateWithFD(fd1, 0, 0);
    ASSERT_EQ(nullptr, source);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0700
 * @tc.name      : CreateWithSource para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0700, TestSize.Level2)
{
    demuxer = AVDemuxerFactory::CreateWithSource(nullptr);
    ASSERT_EQ(nullptr, demuxer);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0800
 * @tc.name      : SelectTrackByID para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0800, TestSize.Level2)
{
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AVCS_ERR_INVALID_VAL, demuxer->SelectTrackByID(-1));
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_0900
 * @tc.name      : UnselectTrackByID para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_0900, TestSize.Level2)
{
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AVCS_ERR_OK, demuxer->UnselectTrackByID(-1));
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_1000
 * @tc.name      : ReadSample para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_1000, TestSize.Level2)
{
    int32_t size = g_width * g_height;
    uint32_t trackIndex = -1;
    uint8_t data[size];
    std::shared_ptr<AVSharedMemoryBase> avMemBuffer = std::make_shared<AVSharedMemoryBase>
    (size, AVSharedMemory::FLAGS_READ_WRITE, "userBuffer");
    avMemBuffer->Init();
    (void)memcpy_s(avMemBuffer->GetBase(), avMemBuffer->GetSize(), data, size);

    AVCodecBufferInfo info;
    uint32_t flag;
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AVCS_ERR_INVALID_OPERATION, demuxer->ReadSample(trackIndex, avMemBuffer, info, flag));
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_1100
 * @tc.name      : ReadSample para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_1100, TestSize.Level2)
{
    uint8_t data[100];
    std::shared_ptr<AVSharedMemoryBase> avMemBuffer = std::make_shared<AVSharedMemoryBase>(2,
		AVSharedMemory::FLAGS_READ_WRITE, "userBuffer");
    avMemBuffer->Init();
    (void)memcpy_s(avMemBuffer->GetBase(), avMemBuffer->GetSize(), data, 2);

    uint32_t trackIndex = 0;
    AVCodecBufferInfo info;
    uint32_t flag;
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AVCS_ERR_OK, demuxer->SelectTrackByID(0));
    ASSERT_EQ(AVCS_ERR_NO_MEMORY, demuxer->ReadSample(trackIndex, avMemBuffer, info, flag));
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_1200
 * @tc.name      : ReadSample para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_1200, TestSize.Level2)
{
    uint8_t data[100];
    std::shared_ptr<AVSharedMemoryBase> avMemBuffer = std::make_shared<AVSharedMemoryBase>(2,
		AVSharedMemory::FLAGS_READ_WRITE, "userBuffer");
    avMemBuffer->Init();
    (void)memcpy_s(avMemBuffer->GetBase(), avMemBuffer->GetSize(), data, 2);

    uint32_t trackIndex = 0;
    AVCodecBufferInfo info;
    uint32_t flag;
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AVCS_ERR_INVALID_OPERATION, demuxer->ReadSample(trackIndex, avMemBuffer, info, flag));
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_1300
 * @tc.name      : ReadSample para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_1300, TestSize.Level2)
{
    uint32_t trackIndex = 0;
    AVCodecBufferInfo info;
    uint32_t flag;
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);
    ASSERT_EQ(AVCS_ERR_INVALID_VAL, demuxer->ReadSample(trackIndex, nullptr, info, flag));
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_PARA_1400
 * @tc.name      : Memory_Create para error
 * @tc.desc      : param test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_ILLEGAL_PARA_1400, TestSize.Level2)
{
    int32_t size = g_width * g_height;
    uint8_t data[size];
    std::shared_ptr<AVSharedMemoryBase> avMemBuffer = std::make_shared<AVSharedMemoryBase>
    (size, AVSharedMemory::FLAGS_READ_WRITE, "userBuffer");
    avMemBuffer->Init();
    (void)memcpy_s(avMemBuffer->GetBase(), avMemBuffer->GetSize(), data, size);

    ASSERT_NE(nullptr, avMemBuffer);
}

/**
 * @tc.number    : DEMUXER_API_0100
 * @tc.name      : CreateWithFD Repeat Call
 * @tc.desc      : api test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_API_0100, TestSize.Level2)
{
    std::shared_ptr<AVSource> source1 = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source1);

    int fd2 = open(g_file2, O_RDONLY);
    int64_t size2 = 0;

    struct stat fileStatus {};
    if (stat(g_file2, &fileStatus) == 0) {
        size2 = static_cast<int64_t>(fileStatus.st_size);
    }
    std::shared_ptr<AVSource> source2 = AVSourceFactory::CreateWithFD(fd2, 0, size2);
    ASSERT_NE(nullptr, source2);
    close(fd2);
}

/**
 * @tc.number    : DEMUXER_API_0200
 * @tc.name      : GetSourceFormat Repeat Call
 * @tc.desc      : api test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_API_0200, TestSize.Level2)
{
    Format format;
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);

    int32_t ret = source->GetSourceFormat(format);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = source->GetSourceFormat(format);
    ASSERT_EQ(AVCS_ERR_OK, ret);
}

/**
 * @tc.number    : DEMUXER_API_0300
 * @tc.name      : GetTrackFormat Repeat Call
 * @tc.desc      : api test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_API_0300, TestSize.Level2)
{
    Format format;
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);

    int32_t ret = source->GetTrackFormat(format, 0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = source->GetTrackFormat(format, 0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
}

/**
 * @tc.number    : DEMUXER_API_0400
 * @tc.name      : SelectTrackByID Repeat Call
 * @tc.desc      : api test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_API_0400, TestSize.Level2)
{
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);

    int32_t ret = demuxer->SelectTrackByID(0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = demuxer->SelectTrackByID(0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
}

/**
 * @tc.number    : DEMUXER_API_0500
 * @tc.name      : UnselectTrackByID Repeat Call
 * @tc.desc      : api test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_API_0500, TestSize.Level2)
{
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);

    int32_t ret = demuxer->SelectTrackByID(0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = demuxer->UnselectTrackByID(0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = demuxer->UnselectTrackByID(0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
}

/**
 * @tc.number    : DEMUXER_API_0600
 * @tc.name      : ReadSample Repeat Call
 * @tc.desc      : api test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_API_0600, TestSize.Level2)
{
    int32_t size = g_width * g_height;
    uint8_t data[size];
    std::shared_ptr<AVSharedMemoryBase> avMemBuffer = std::make_shared<AVSharedMemoryBase>
    (size, AVSharedMemory::FLAGS_READ_WRITE, "userBuffer");
    avMemBuffer->Init();
    (void)memcpy_s(avMemBuffer->GetBase(), avMemBuffer->GetSize(), data, size);

    AVCodecBufferInfo info;
    uint32_t flag;
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);

    int32_t ret = demuxer->SelectTrackByID(0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = demuxer->ReadSample(0, avMemBuffer, info, flag);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = demuxer->ReadSample(0, avMemBuffer, info, flag);
    ASSERT_EQ(AVCS_ERR_OK, ret);
}

/**
 * @tc.number    : DEMUXER_API_0700
 * @tc.name      : SeekToTime Repeat Call
 * @tc.desc      : api test
 */
HWTEST_F(DemuxerInnerApiNdkTest, DEMUXER_API_0700, TestSize.Level2)
{
    uint32_t ms = 1000;
    source = AVSourceFactory::CreateWithFD(fd1, 0, size);
    ASSERT_NE(nullptr, source);
    demuxer = AVDemuxerFactory::CreateWithSource(source);
    ASSERT_NE(nullptr, demuxer);

    int32_t ret = demuxer->SelectTrackByID(0);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = demuxer->SeekToTime(ms, SeekMode::SEEK_NEXT_SYNC);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    ret = demuxer->SeekToTime(ms, SeekMode::SEEK_NEXT_SYNC);
    ASSERT_EQ(AVCS_ERR_OK, ret);
}
} // namespace
