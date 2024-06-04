/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
const int64_t SOURCE_OFFSET = 0;
static std::shared_ptr<AVSource> source = nullptr;
static std::shared_ptr<AVDemuxer> demuxer = nullptr;
static const string TEST_FILE_PATH = "/data/test/media/";
string g_doubleHevcPath = TEST_FILE_PATH + string("double_hevc.mp4");
string g_singleHevcPath = TEST_FILE_PATH + string("single_60.mp4");
string g_singleRkPath = TEST_FILE_PATH + string("single_rk.mp4");
string g_xmPath = TEST_FILE_PATH + string("xm.mp4");
string g_doubleVividPath = TEST_FILE_PATH + string("double_vivid.mp4");
} // namespace

namespace {
class DemuxerInnerFuncNdkTest : public testing::Test {
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
    int32_t fd_ = -1;
    int64_t size;
};

void DemuxerInnerFuncNdkTest::SetUpTestCase() {}
void DemuxerInnerFuncNdkTest::TearDownTestCase() {}
void DemuxerInnerFuncNdkTest::SetUp() {}
void DemuxerInnerFuncNdkTest::TearDown()
{
    if (fd_ > 0) {
        close(fd_);
        fd_ = -1;
    }

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
 * @tc.number    : DEMUXER_ILLEGAL_FUNC_0100
 * @tc.name      : check video format from double
 * @tc.desc      : func test
 */
HWTEST_F(DemuxerInnerFuncNdkTest, DEMUXER_ILLEGAL_FUNC_0100, TestSize.Level0)
{
    fd_ = open(g_doubleHevcPath.c_str(), O_RDONLY);
    struct stat fileStatus {};
    if (stat(g_doubleHevcPath.c_str(), &fileStatus) == 0) {
        size = static_cast<int64_t>(fileStatus.st_size);
    }
    source = AVSourceFactory::CreateWithFD(fd_, SOURCE_OFFSET, size);

    ASSERT_NE(nullptr, source);
    Format format_;
    int32_t ret = source->GetSourceFormat(format_);
    ASSERT_EQ(AVCS_ERR_OK, ret);

    float longitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LONGITUDE, longitude));
    ASSERT_EQ(longitude, float(120.201302));

    float latitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LATITUDE, latitude));
    ASSERT_EQ(latitude, float(30.188101));

    string genre;
    ASSERT_TRUE(format_.GetStringValue(Media::Tag::MEDIA_GENRE, genre));
    ASSERT_EQ(genre, "AAAAAA{marketing-name:\"AABBAABBAABBAABBAA\",param-hw-ext"\
    ":{camera-position-tag:2},param-use-tag:TypeNormalVideo}");

    Format metaFormat_;
    ret = source->GetUserMeta(metaFormat_);
    ASSERT_EQ(AVCS_ERR_OK, ret);

    std::string manufacturer;
    ASSERT_TRUE(metaFormat_.GetStringValue("com.abababa.manufacturer", manufacturer));
    ASSERT_EQ(manufacturer, "ABCDEF");
    std::string marketingName;
    ASSERT_TRUE(metaFormat_.GetStringValue("com.abababa.marketing_name", marketingName));
    ASSERT_EQ(marketingName, "AABBAABBAABBAABBAA");
    std::string model;
    ASSERT_TRUE(metaFormat_.GetStringValue("com.abababa.model", model));
    ASSERT_EQ(model, "ABABABAB");
    std::string version;
    ASSERT_TRUE(metaFormat_.GetStringValue("com.abababa.version", version));
    ASSERT_EQ(version, "12");
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_FUNC_0200
 * @tc.name      : check video format from single
 * @tc.desc      : func test
 */
HWTEST_F(DemuxerInnerFuncNdkTest, DEMUXER_ILLEGAL_FUNC_0200, TestSize.Level0)
{
    fd_ = open(g_singleHevcPath.c_str(), O_RDONLY);
    struct stat fileStatus {};
    if (stat(g_singleHevcPath.c_str(), &fileStatus) == 0) {
        size = static_cast<int64_t>(fileStatus.st_size);
    }
    source = AVSourceFactory::CreateWithFD(fd_, SOURCE_OFFSET, size);

    ASSERT_NE(nullptr, source);
    Format format_;
    int32_t ret = source->GetSourceFormat(format_);
    ASSERT_EQ(AVCS_ERR_OK, ret);

    float longitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LONGITUDE, longitude));
    ASSERT_EQ(longitude, float(120.000000));

    float latitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LATITUDE, latitude));
    ASSERT_EQ(latitude, float(30.000000));

    Format metaFormat_;
    ret = source->GetUserMeta(metaFormat_);
    ASSERT_EQ(AVCS_ERR_OK, ret);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_FUNC_0300
 * @tc.name      : check video format from rk
 * @tc.desc      : func test
 */
HWTEST_F(DemuxerInnerFuncNdkTest, DEMUXER_ILLEGAL_FUNC_0300, TestSize.Level2)
{
    fd_ = open(g_singleRkPath.c_str(), O_RDONLY);
    struct stat fileStatus {};
    if (stat(g_singleRkPath.c_str(), &fileStatus) == 0) {
        size = static_cast<int64_t>(fileStatus.st_size);
    }
    source = AVSourceFactory::CreateWithFD(fd_, SOURCE_OFFSET, size);
    ASSERT_NE(nullptr, source);
    Format format_;
    int32_t ret = source->GetSourceFormat(format_);
    ASSERT_EQ(AVCS_ERR_OK, ret);

    float longitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LONGITUDE, longitude));
    ASSERT_EQ(longitude, float(0.000000));

    float latitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LATITUDE, latitude));
    ASSERT_EQ(latitude, float(0.000000));
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_FUNC_0400
 * @tc.name      : check video format from xm
 * @tc.desc      : func test
 */
HWTEST_F(DemuxerInnerFuncNdkTest, DEMUXER_ILLEGAL_FUNC_0400, TestSize.Level2)
{
    fd_ = open(g_xmPath.c_str(), O_RDONLY);
    struct stat fileStatus {};
    if (stat(g_xmPath.c_str(), &fileStatus) == 0) {
        size = static_cast<int64_t>(fileStatus.st_size);
    }
    source = AVSourceFactory::CreateWithFD(fd_, SOURCE_OFFSET, size);
    ASSERT_NE(nullptr, source);
    Format format_;
    int32_t ret = source->GetSourceFormat(format_);
    ASSERT_EQ(AVCS_ERR_OK, ret);
    float longitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LONGITUDE, longitude));
    ASSERT_EQ(longitude, float(120.201302));
    float latitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LATITUDE, latitude));
    ASSERT_EQ(latitude, float(30.188101));
    Format metaFormat_;
    ret = source->GetUserMeta(metaFormat_);
    ASSERT_EQ(AVCS_ERR_OK, ret);
}

/**
 * @tc.number    : DEMUXER_ILLEGAL_FUNC_0500
 * @tc.name      : check video format from double vivid
 * @tc.desc      : func test
 */
HWTEST_F(DemuxerInnerFuncNdkTest, DEMUXER_ILLEGAL_FUNC_0500, TestSize.Level2)
{
    fd_ = open(g_doubleVividPath.c_str(), O_RDONLY);
    struct stat fileStatus {};
    if (stat(g_doubleVividPath.c_str(), &fileStatus) == 0) {
        size = static_cast<int64_t>(fileStatus.st_size);
    }
    source = AVSourceFactory::CreateWithFD(fd_, SOURCE_OFFSET, size);

    ASSERT_NE(nullptr, source);
    Format format_;
    int32_t ret = source->GetSourceFormat(format_);
    ASSERT_EQ(AVCS_ERR_OK, ret);

    float longitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LONGITUDE, longitude));
    ASSERT_EQ(longitude, float(120.201401));

    float latitude = 0.0;
    ASSERT_TRUE(format_.GetFloatValue(Media::Tag::MEDIA_LATITUDE, latitude));
    ASSERT_EQ(latitude, float(30.188101));

    string genre;
    ASSERT_TRUE(format_.GetStringValue(Media::Tag::MEDIA_GENRE, genre));
    ASSERT_EQ(genre, "AABBAA{marketing-name:\"AABBAABBAABBAABABA\",param-AA-ext"\
    ":{camera-position-tag:2},param-use-tag:TypeNormalVideo}");
}

} // namespace