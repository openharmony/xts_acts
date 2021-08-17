
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

#include "Testplayer.h"
#include "parameter.h"

using namespace OHOS;
using namespace OHOS::Media;
using namespace PlayerNameSpace;

namespace PlayerNameSpace {
std::string GetUri()
{
    char path[256] = "/data/1.mp4";
    GetParameter("sys.media.test.stream.path", "/data/1.mp4", &path[0], 256);
    MEDIA_INFO_LOG("PATH : %s", path);
    return path;
}
}
TestPlayer::TestPlayer(PlayerSignal *test)
    : test_(test)
{
}
TestPlayer::~TestPlayer()
{
}
bool TestPlayer::CreatePlayer()
{
    player = PlayerFactory::CreatePlayer();
    if (player == nullptr) {
        return false;
    }
    return true;
}
int32_t TestPlayer::SetSource(const std::string &uri)
{
    return player->SetSource(uri);
}

int32_t TestPlayer::Play()
{
    int32_t ret = player->Play();
    if (test_->mutexFlag_ == true && test_->state_ != PLAYER_STARTED) {
        std::unique_lock<std::mutex> lockPlay(test_->mutexPlay_);
        test_->condVarPlay_.wait_for(lockPlay, std::chrono::seconds(WAITSECOND));
        if (test_->state_ != PLAYER_STARTED) {
            return -1;
        }
    }
    return ret;
}

int32_t TestPlayer::Prepare()
{
    int32_t ret = player->Prepare();
    if (test_->mutexFlag_ == true && test_->state_ != PLAYER_PREPARED) {
        std::unique_lock<std::mutex> lockPrepare(test_->mutexPrepare_);
        test_->condVarPrepare_.wait_for(lockPrepare, std::chrono::seconds(WAITSECOND));
        if (test_->state_ != PLAYER_PREPARED) {
            return -1;
        }
    }
    return ret;
}

int32_t TestPlayer::PrepareAsync()
{
    int32_t ret = player->PrepareAsync();
    if (test_->mutexFlag_ == true && test_->state_ != PLAYER_PREPARED) {
        std::unique_lock<std::mutex> lockPrepare(test_->mutexPrepare_);
        test_->condVarPrepare_.wait_for(lockPrepare, std::chrono::seconds(WAITSECOND));
        if (test_->state_ != PLAYER_PREPARED) {
            return -1;
        }
    }
    return ret;
}

int32_t TestPlayer::Pause()
{
    int32_t ret = player->Pause();
    if (test_->mutexFlag_ == true && test_->state_ != PLAYER_PAUSED) {
        std::unique_lock<std::mutex> lockPause(test_->mutexPause_);
        test_->condVarPause_.wait_for(lockPause, std::chrono::seconds(WAITSECOND));
        if (test_->state_ != PLAYER_PAUSED) {
            return -1;
        }
    }
    return ret;
}

int32_t TestPlayer::Stop()
{
    int32_t ret = player->Stop();
    if (test_->mutexFlag_ == true && test_->state_ != PLAYER_STOPPED) {
        std::unique_lock<std::mutex> lockStop(test_->mutexStop_);
        test_->condVarStop_.wait_for(lockStop, std::chrono::seconds(WAITSECOND));
        if (test_->state_ != PLAYER_STOPPED) {
            return -1;
        }
    }
    return ret;
}

int32_t TestPlayer::Reset()
{
    int32_t ret = player->Reset();
    if (test_->mutexFlag_ == true && test_->state_ != PLAYER_IDLE) {
        std::unique_lock<std::mutex> lockReset(test_->mutexReset_);
        test_->condVarReset_.wait_for(lockReset, std::chrono::seconds(WAITSECOND));
        if (test_->state_ != PLAYER_IDLE) {
            return -1;
        }
    }
    return ret;
}

int32_t TestPlayer::Release()
{
    return player->Release();
}

int32_t TestPlayer::SetVolume(float leftVolume, float rightVolume)
{
    return player->SetVolume(leftVolume, rightVolume);
}

int32_t TestPlayer::Seek(int32_t mseconds, PlayerSeekMode mode)
{
    test_->seekDoneFlag_ = false;
    test_->seekPositon_ = mseconds;
    int32_t ret = player->Seek(mseconds, mode);
    if (test_->mutexFlag_ == true && test_->seekDoneFlag_ == false) {
        std::unique_lock<std::mutex> lockSeek(test_->mutexSeek_);
        test_->condVarSeek_.wait_for(lockSeek, std::chrono::seconds(WAITSECOND));
        if (test_->seekDoneFlag_ != true) {
            return -1;
        }
    }
    return ret;
}

int32_t TestPlayer::GetCurrentTime(int32_t &currentTime)
{
    return player->GetCurrentTime(currentTime);
}

int32_t TestPlayer::GetDuration(int32_t &duration)
{
    return player->GetDuration(duration);
}

int32_t TestPlayer::SetPlaybackSpeed(PlaybackRateMode mode)
{
    return player->SetPlaybackSpeed(mode);
}

int32_t TestPlayer::GetPlaybackSpeed(PlaybackRateMode &mode)
{
    return player->GetPlaybackSpeed(mode);
}
sptr<Surface> TestPlayer::GetVideoSurface(WindowConfig sub_config)
{
    char surface[256] = "null";
    GetParameter("sys.media.test.surface", "null", &surface[0], 256);
    mwindow = WindowManager::GetInstance()->CreateWindow(&g_config);
    if (mwindow  == nullptr) {
        MEDIA_ERROR_LOG("Create mwindow failed!!!");
        return nullptr;
    }
    sptr<Surface>  videoSurface = nullptr;
    if (strcmp(surface, "null") == 0) {
        return videoSurface;
    }
    if (strcmp(surface, "subwindow") == 0) {
        InitSubWindow(sub_config);
        videoSurface = window->GetSurface();
    } else if (strcmp(surface, "window") == 0) {
        videoSurface = mwindow->GetSurface();
        videoSurface->SetUserData(SURFACE_FORMAT, std::to_string(PIXEL_FMT_RGBA_8888));
        std::string format = videoSurface->GetUserData(SURFACE_FORMAT);
        MEDIA_INFO_LOG("SetUserData SURFACE_FORMAT = %s", format.c_str());
    }
    return videoSurface;
}
int32_t TestPlayer::SetVideoSurface(const sptr<Surface> surface)
{
    char parameter[256] = "null";
    GetParameter("sys.media.test.surface", "null", &parameter[0], 256);
    if (strcmp(parameter, "null") == 0) {
        MEDIA_INFO_LOG("sys.media.test.surface null");
        return 0;
    }
    return player->SetVideoSurface(surface);
}

bool TestPlayer::IsPlaying()
{
    return player->IsPlaying();
}

bool TestPlayer::IsLooping()
{
    return player->IsLooping();
}

int32_t TestPlayer::SetLooping(bool loop)
{
    return player->SetLooping(loop);
}

int32_t TestPlayer::SetPlayerCallback(const std::shared_ptr<PlayerCallback> &callback)
{
    return player->SetPlayerCallback(callback);
}

void TestPlayer::InitSubWindow(WindowConfig sub_config)
{
    sptr<SurfaceBuffer> buffer;
    BufferRequestConfig requestConfig;
    int32_t releaseFence;
    mwindow->GetRequestConfig(requestConfig);
    (void)mwindow->GetSurface()->RequestBuffer(buffer, releaseFence, requestConfig);
    uint32_t buffSize = buffer->GetSize();
    void *bufferVirAddr = buffer->GetVirAddr();
    (void)memset_s(bufferVirAddr, buffSize, 0, buffSize);
    BufferFlushConfig flushConfig = {
        .damage = {
            .x = 0,
            .y = 0,
            .w = requestConfig.width,
            .h = requestConfig.height,
            },
        .timestamp = 0,
    };
    if (mwindow->GetSurface()->FlushBuffer(buffer, -1, flushConfig) != 0) {
        MEDIA_ERROR_LOG("FlushBuffer failed");
    }
    window = WindowManager::GetInstance()->CreateSubWindow(mwindow->GetWindowID(), &sub_config);
    ASSERT_NE(nullptr, window);
    if (window  == nullptr) {
        MEDIA_ERROR_LOG("Create window failed!!!");
        return;
    }
    return;
}

TestPlayerCallback::TestPlayerCallback(PlayerSignal *test)
    : test_(test)
{
}
TestPlayerCallback::~TestPlayerCallback()
{
}
void TestPlayerCallback::OnError(PlayerErrorType errorType, int32_t errorCode)
{
    errorNum++;
    errorType_ = errorType;
    errorCode_ = errorCode;
    MEDIA_INFO_LOG("TestPlayerCallback: OnError errorType is %d, errorCode is %d", errorType_, errorCode_);
}
void TestPlayerCallback::OnInfo(PlayerOnInfoType type, int32_t extra, const Format &InfoBody)
{
    switch (type) {
        case INFO_TYPE_SEEKDONE:
            seekDoneFlag = true;
            test_->SetSeekResult(true);
            MEDIA_INFO_LOG("TestPlayerCallback: OnSeekDone currentPositon is %d", extra);
            if (abs(test_->seekPositon_ - extra) <= DELTA_TIME) {
                test_->condVarSeek_.notify_all();
            } else {
                test_->SetSeekResult(false);
            }
            break;
        case INFO_TYPE_EOS:
            MEDIA_INFO_LOG("TestPlayerCallback: OnEndOfStream isLooping is %d", extra);
            break;
        case INFO_TYPE_STATE_CHANGE:
            state_ = static_cast<PlayerStates>(extra);
            test_->SetState(state_);
            PrintState(state_);
            break;
        case INFO_TYPE_POSITION_UPDATE:
            postion_ = extra;
            break;
        case INFO_TYPE_MESSAGE:
            MEDIA_INFO_LOG("TestPlayerCallback: OnMessage type is %d", extra);
            break;
        default:
            break;
    }
}

int TestPlayerCallback::WaitForSeekDone(int32_t currentPositon)
{
    int64_t waitTime = 0;
    seekDoneFlag = false;
    while (seekDoneFlag != true && waitTime < WAITSECOND * 1000) {
        usleep(1000);
        waitTime += 1;
    }
    seekDoneFlag = false;
    if (waitTime >= WAITSECOND * 1000) {
        MEDIA_INFO_LOG("Failed to seek [%d]s ", currentPositon);
        return -1;
    }
    return 0;
}

int TestPlayerCallback::WaitForState(PlayerStates state)
{
    int64_t waitTime = 0;
    while (state_ != state && waitTime < WAITSECOND * 1000) {
        usleep(1000);
        waitTime += 1;
    }
    if (waitTime >= WAITSECOND * 1000) {
        MEDIA_INFO_LOG("Failed to wait for state[%d] down", state);
        return -1;
    }
    return 0;
}
void TestPlayerCallback::PrintState(PlayerStates state)
{
    switch (state) {
        case PLAYER_STATE_ERROR:
            MEDIA_INFO_LOG("State: Error");
            break;
        case PLAYER_IDLE:
            MEDIA_INFO_LOG("State: IDLE");
            test_->condVarReset_.notify_all();
            break;
        case PLAYER_INITIALIZED:
            MEDIA_INFO_LOG("State: Initialized");
            break;
        case PLAYER_PREPARING:
            MEDIA_INFO_LOG("State: Preparing");
            break;
        case PLAYER_PREPARED:
            MEDIA_INFO_LOG("State: Prepared");
            test_->condVarPrepare_.notify_all();
            break;
        case PLAYER_STARTED:
            MEDIA_INFO_LOG("State: Started");
            test_->condVarPlay_.notify_all();
            break;
        case PLAYER_PAUSED:
            MEDIA_INFO_LOG("State: Paused");
            test_->condVarPause_.notify_all();
            break;
        case PLAYER_STOPPED:
            MEDIA_INFO_LOG("State: Stopped");
            test_->condVarStop_.notify_all();
            break;
        case PLAYER_PLAYBACK_COMPLETE:
            MEDIA_INFO_LOG("State: Complete");
            break;
        default:
            MEDIA_INFO_LOG("Invalid state");
            break;
    }
}

void PlayerSignal::SetState(PlayerStates state)
{
    state_ = state;
}
void PlayerSignal::SetSeekResult(bool seekDoneFlag)
{
    seekDoneFlag_ = seekDoneFlag;
}
