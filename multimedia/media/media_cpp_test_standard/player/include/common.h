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

#include "gtest/gtest.h"
#include "player.h"

namespace PlayerNameSpace {
    static std::string MOUNT_147 = "/data/media/audio/147";
    static std::string MOUNT_189 = "/data/media/audio/189";
    static const int MAX_THREADS = 16;
    static const int32_t PLAYING_TIME = 3;
    static const int32_t PAUSED_TIME = 1;
    static const int32_t SEEK_TIME_5_SEC = 5000;
    static const int32_t SEEK_TIME_2_SEC = 2000;
    static const int DELTA_TIME = 1000;
    static const int WAITSECOND = 2;
    static const int MAXTIME = 1000;
    static const int RET_OK = 0;
    static const int32_t FILE_BEGIN = 0;
    static const int32_t BUF_SIZE = 1024 * 1024;
    static const OHOS::Media::PlayerSeekMode SEEK_MODE = OHOS::Media::PlayerSeekMode::SEEK_PREVIOUS_SYNC;
    std::string GetUri();
}