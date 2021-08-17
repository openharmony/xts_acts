
/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "media_log.h"

#define MEDIA_DEBUG_LOG(fmt, ...) \
do { \
    printf(fmt, ##__VA_ARGS__); \
    printf("\n"); \
    __MEDIA_LOG(::OHOS::HiviewDFX::HiLog::Debug, fmt, ##__VA_ARGS__); \
} while (0) \

#define MEDIA_INFO_LOG(fmt, ...) \
do { \
    printf(fmt, ##__VA_ARGS__); \
    printf("\n"); \
    __MEDIA_LOG(::OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__); \
} while (0) \

#define MEDIA_ERROR_LOG(fmt, ...) \
do { \
    printf(fmt, ##__VA_ARGS__); \
    printf("\n"); \
    __MEDIA_LOG(::OHOS::HiviewDFX::HiLog::Error, fmt, ##__VA_ARGS__); \
} while (0) \

namespace {
    constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, LOG_DOMAIN, "MediaTest"};
}

namespace MediaTest {
    constexpr int SURFACE_QUEUE_SIZE = 5;
    const float VOLUME = 0.5f;
    const int FIRST_ARG_IDX = 1;
    const int SECOND_ARG_IDX = 2;
    const int THIRD_ARG = 3;
    const int HEIGHT = 720;
    const int WIDTH = 1280;
}