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
    * @tc.number    : SUB_MEDIA_PLAYER_API_Seek_1500
    * @tc.name      : 15.GET操作在每个可进行的操作后都调用一次
    * @tc.desc      : test Seek
*/
HWTEST_F(ActsPlayerAPITest, SUB_MEDIA_PLAYER_API_GetParameter_0100, Reliability | MediumTest | Level2)
{
    PlayerSignal testObj;
    std::shared_ptr<TestPlayer> player = std::make_shared<TestPlayer>(&testObj);
    ASSERT_NE(nullptr, player);
    ASSERT_EQ(true, player->CreatePlayer());
    std::string uri = GetUri();
    int32_t time;
    int32_t duration;
    int32_t defaultDuration;
    EXPECT_NE(RET_OK, player->GetCurrentTime(time));
    EXPECT_EQ(0, time);
    EXPECT_FALSE(player->IsPlaying());
    ASSERT_EQ(RET_OK, player->SetSource(uri));
    EXPECT_NE(RET_OK, player->GetCurrentTime(time));
    EXPECT_NE(RET_OK, player->GetDuration(duration));
    EXPECT_FALSE(player->IsPlaying());
    sptr<Surface> videoSurface = player->GetVideoSurface(g_sub_config);
    EXPECT_EQ(RET_OK, player->SetVideoSurface(videoSurface));
    EXPECT_NE(RET_OK, player->GetCurrentTime(time));
    EXPECT_NE(RET_OK, player->GetDuration(duration));
    EXPECT_FALSE(player->IsPlaying());
    std::shared_ptr<TestPlayerCallback> testCallback = std::make_shared<TestPlayerCallback>(&testObj);
    EXPECT_EQ(RET_OK, player->SetPlayerCallback(testCallback));
    EXPECT_NE(RET_OK, player->GetCurrentTime(time));
    EXPECT_NE(RET_OK, player->GetDuration(duration));
    EXPECT_FALSE(player->IsPlaying());
    // prepare
    ASSERT_EQ(RET_OK, player->PrepareAsync());
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_EQ(FILE_BEGIN, time);
    EXPECT_EQ(RET_OK, player->GetDuration(defaultDuration));
    EXPECT_FALSE(player->IsPlaying());
    // play
    EXPECT_EQ(RET_OK, player->Play());
    EXPECT_TRUE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(FILE_BEGIN, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->GetDuration(duration));
    EXPECT_EQ(defaultDuration, duration);
    EXPECT_TRUE(player->IsPlaying());
    // seek
    EXPECT_EQ(RET_OK, player->Seek(SEEK_TIME_2_SEC, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(SEEK_TIME_2_SEC, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->GetDuration(duration));
    EXPECT_EQ(defaultDuration, duration);
    // pause
    EXPECT_EQ(RET_OK, player->Pause());
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(SEEK_TIME_2_SEC, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->GetDuration(duration));
    EXPECT_EQ(defaultDuration, duration);
    // seek duration
    EXPECT_EQ(RET_OK, player->Seek(defaultDuration + 1, SEEK_PREVIOUS_SYNC));
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_EQ(defaultDuration, time);
    EXPECT_EQ(RET_OK, player->GetDuration(duration));
    EXPECT_EQ(defaultDuration, duration);
    // stop
    EXPECT_EQ(RET_OK, player->Stop());
    EXPECT_EQ(RET_OK, player->GetCurrentTime(time));
    EXPECT_NEAR(FILE_BEGIN, time, DELTA_TIME);
    EXPECT_EQ(RET_OK, player->GetDuration(duration));
    EXPECT_EQ(defaultDuration, duration);
    EXPECT_FALSE(player->IsPlaying());
    // reset
    EXPECT_EQ(RET_OK, player->Reset());
    EXPECT_NE(RET_OK, player->GetCurrentTime(time));
    EXPECT_NE(RET_OK, player->GetDuration(duration));
    EXPECT_FALSE(player->IsPlaying());
    EXPECT_EQ(RET_OK, testCallback->errorNum);
}
