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
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0100
    * @tc.name      : 01.set loop true操作在createAudioPlayer之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0100, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    EXPECT_NE(RET_OK, player->SetLooping(true));
    EXPECT_FALSE(player->IsLooping());
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0200
    * @tc.name      : 02.set loop true操作在play之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0200, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0300
    * @tc.name      : 03.set loop true操作在pause之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0300, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
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
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0400
    * @tc.name      : 04.set loop true操作在stop之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0400, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
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
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0500
    * @tc.name      : 05.set loop true操作在seek之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0500, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
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
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0600
    * @tc.name      : 06.set loop true操作在set loop true之后的每个可进行的操作后都调用一次
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0600, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    EXPECT_NE(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(SEEK_TIME_2_SEC, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->Pause());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->Stop());
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->Reset());
    EXPECT_NE(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0700
    * @tc.name      : 07.set loop true操作调用3次
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0700, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
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
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->Pause());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->SetLooping(true));
    EXPECT_TRUE(player->IsLooping());
    EXPECT_EQ(RET_OK, player->Stop());
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->Reset());
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0800
    * @tc.name      : 08.set loop false操作在play之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0800, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_0900
    * @tc.name      : 09.set loop false操作在pause之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_0900, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
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
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_1000
    * @tc.name      : 010.set loop false操作在stop之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_1000, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
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
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_1100
    * @tc.name      : 011.set loop false操作在seek之后
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_1100, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
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
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_1200
    * @tc.name      : 012.set loop false操作在set loop false之后的每个可进行的操作后都调用一次
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_1200, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
    ASSERT_EQ(RET_OK, player->SetSource(uri));

    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    EXPECT_NE(RET_OK, player->SetLooping(false));
    ASSERT_EQ(RET_OK, player->Prepare());
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(SEEK_TIME_2_SEC, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->Pause());
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->Stop());
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->Reset());
    EXPECT_NE(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

/**
    * @tc.number    : SUB_MEDIA_PLAYER_API_SetLooping_1300
    * @tc.name      : 013.set loop false操作调用3次
    * @tc.desc      :
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_SetLooping_1300, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
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
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->Pause());
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->SetLooping(false));
    EXPECT_EQ(RET_OK, player->Stop());
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->Reset());
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}

