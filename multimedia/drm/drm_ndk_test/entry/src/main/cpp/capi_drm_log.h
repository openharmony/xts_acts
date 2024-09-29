/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#ifndef CAPI_DRM_LOG_H
#define CAPI_DRM_LOG_H

#include <hilog/log.h>
#include <cinttypes>

#undef LOG_DOMAIN
#define LOG_DOMAIN 0x0002B66

#define CAPI_DRM_LOG_FREQ_LIMIT(frequency)                                                                             \
    if (1) {                                                                                                           \
        thread_local uint64_t currentTimes = 0;                                                                        \
        if (currentTimes++ % ((uint64_t)(frequency)) != 0) {                                                           \
            break;                                                                                                     \
        }                                                                                                              \
    }

#define CAPI_DRM_LOG(func, fmt, args...)                                                                               \
    do {                                                                                                               \
        (void)func(LOG_APP, "{%{public}s():%{public}d} " fmt, __FUNCTION__, __LINE__, ##args);                         \
    } while (0)

#define CAPI_DRM_LOGF(fmt, ...) CAPI_DRM_LOG(OH_LOG_FATAL, fmt, ##__VA_ARGS__)
#define CAPI_DRM_LOGE(fmt, ...) CAPI_DRM_LOG(OH_LOG_ERROR, fmt, ##__VA_ARGS__)
#define CAPI_DRM_LOGW(fmt, ...) CAPI_DRM_LOG(OH_LOG_WARN, fmt, ##__VA_ARGS__)
#define CAPI_DRM_LOGI(fmt, ...) CAPI_DRM_LOG(OH_LOG_INFO, fmt, ##__VA_ARGS__)
#define CAPI_DRM_LOGD(fmt, ...) CAPI_DRM_LOG(OH_LOG_DEBUG, fmt, ##__VA_ARGS__)
#define CAPI_DRM_LOGD_LIMIT(frequency, fmt, ...)                                                                       \
    do {                                                                                                               \
        CAPI_DRM_LOG_FREQ_LIMIT(frequency);                                                                            \
        CAPI_DRM_LOGD(fmt, ##__VA_ARGS__);                                                                             \
    } while (0)

#define CHECK_AND_RETURN_RET_LOG(cond, ret, fmt, ...)                                                                  \
    do {                                                                                                               \
        if (!(cond)) {                                                                                                 \
            CAPI_DRM_LOGE(fmt, ##__VA_ARGS__);                                                                         \
            return ret;                                                                                                \
        }                                                                                                              \
    } while (0)

#define CHECK_AND_RETURN_LOG(cond, fmt, ...)                                                                           \
    do {                                                                                                               \
        if (!(cond)) {                                                                                                 \
            CAPI_DRM_LOGE(fmt, ##__VA_ARGS__);                                                                         \
            return;                                                                                                    \
        }                                                                                                              \
    } while (0)

#define CHECK_AND_BREAK_LOG(cond, fmt, ...)                                                                            \
    if (1) {                                                                                                           \
        if (!(cond)) {                                                                                                 \
            CAPI_DRM_LOGW(fmt, ##__VA_ARGS__);                                                                         \
            break;                                                                                                     \
        }                                                                                                              \
    } else                                                                                                             \
        void(0)

#define CHECK_AND_CONTINUE_LOG(cond, fmt, ...)                                                                         \
    if (1) {                                                                                                           \
        if (!(cond)) {                                                                                                 \
            CAPI_DRM_LOGW(fmt, ##__VA_ARGS__);                                                                         \
            continue;                                                                                                  \
        }                                                                                                              \
    } else                                                                                                             \
        void(0)

#endif // CAPI_DRM_LOG_H