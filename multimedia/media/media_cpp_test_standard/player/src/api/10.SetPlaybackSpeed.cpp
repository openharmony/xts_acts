/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

#include "ActsPlayerAPITest.h"
#include "player.h"
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
using namespace PlayerNameSpace;

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0100
    * @tc.name      : 01.SetPlaybackSpeed操作在createAudioPlayer之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0100, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    PlaybackRateMode mode;
    EXPECT_NE(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_NE(RET_OK, player->GetPlaybackSpeed(mode));
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0200
    * @tc.name      : 02.SetPlaybackSpeed操作在play之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0200, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    ASSERT_EQ(RET_OK, player->SetSource(uri));
    PlaybackRateMode mode;
    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
}
/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0300
    * @tc.name      : 03.SetPlaybackSpeed操作在pause之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0300, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
    PlaybackRateMode mode;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(SEEK_TIME_2_SEC, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->Pause());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
}
/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0400
    * @tc.name      : 04.SetPlaybackSpeed操作在stop之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0400, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
    PlaybackRateMode mode;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(SEEK_TIME_2_SEC, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->Pause());
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->Stop());
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_NE(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
}
/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0500
    * @tc.name      : 05.SetPlaybackSpeed操作在seek之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0500, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
    PlaybackRateMode mode;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(SEEK_TIME_2_SEC, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0600
    * @tc.name      : 06.SetPlaybackSpeed操作在SetPlaybackSpeed之后的每个可进行的操作后都调用一次
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0600, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
    PlaybackRateMode mode;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(SEEK_TIME_2_SEC, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
    EXPECT_EQ(RET_OK, player->Pause());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
    EXPECT_EQ(RET_OK, player->Stop());
    EXPECT_NE(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->Reset());
    EXPECT_NE(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0700
    * @tc.name      : 07.SetPlaybackSpeed操作调用3次
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0700, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    PlaybackRateMode mode;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_1_25_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_1_25_X, mode);
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_1_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_1_75_X, mode);
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_2_00_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_2_00_X, mode);
    EXPECT_EQ(RET_OK, player->Stop());
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->Reset());
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0800
    * @tc.name      : 08.SetPlaybackSpeed操作在Prepare之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0800, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    PlaybackRateMode mode;
    std::string uri = GetUri();
    ASSERT_EQ(RET_OK, player->SetSource(uri));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
}
/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0900
    * @tc.name      : 08.SetPlaybackSpeed操作在PrepareAsync之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_0900, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    PlaybackRateMode mode;
    std::string uri = GetUri();
    ASSERT_EQ(RET_OK, player->SetSource(uri));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    ASSERT_EQ(RET_OK, player->PrepareAsync());
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
}
/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_1000
    * @tc.name      : 10.SetPlaybackSpeed操作在SetSource之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_1000, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    PlaybackRateMode mode;
    std::string uri = GetUri();
    ASSERT_EQ(RET_OK, player->SetSource(uri));
    EXPECT_NE(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_NE(RET_OK, player->GetPlaybackSpeed(mode));
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_1100
    * @tc.name      : 10.SetPlaybackSpeed操作在PLAYER_PLAYBACK_COMPLETE之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_1100, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    PlaybackRateMode mode;
    int32_t durationTime;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->GetDuration(durationTime));
    EXPECT_EQ(RET_OK, player->Seek(durationTime, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, testCallback->WaitForState(PLAYER_PLAYBACK_COMPLETE));
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
}
/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_1200
    * @tc.name      : 10.SetPlaybackSpeed操作在PLAYER_PLAYBACK_COMPLETE之后,loop=1
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetPlaybackSpeed_1200, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    PlaybackRateMode mode;
    int32_t durationTime;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->GetDuration(durationTime));
    EXPECT_EQ(RET_OK, player->Seek(durationTime, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, testCallback->WaitForState(PLAYER_PLAYBACK_COMPLETE));
    EXPECT_EQ(RET_OK, player->SetPlaybackSpeed(SPEED_FORWARD_0_75_X));
    EXPECT_EQ(RET_OK, player->GetPlaybackSpeed(mode));
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
    sleep(PLAYING_TIME);
    EXPECT_EQ(SPEED_FORWARD_0_75_X, mode);
}