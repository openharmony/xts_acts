/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef ARKUI_CAPI_XTS_ANIMATION_EVENT_TEST_H
#define ARKUI_CAPI_XTS_ANIMATION_EVENT_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>

#include "../common/common.h"
#include "column_component.h"
#include "component.h"

namespace ArkUICapiTest {

class AnimationEventTest {
public:
    ~AnimationEventTest();
    static napi_value TestAnimateOption001(napi_env env, napi_callback_info info);
    static napi_value TestKeyframeAnimateOption012(napi_env env, napi_callback_info info);
    static napi_value TestKeyframeAnimateOption023(napi_env env, napi_callback_info info);
    static napi_value TestAnimatorOption047(napi_env env, napi_callback_info info);
    static napi_value TestAnimatorOption050(napi_env env, napi_callback_info info);
    static napi_value TestAnimatorOption053(napi_env env, napi_callback_info info);
    static napi_value TestAnimatorOption056(napi_env env, napi_callback_info info);
    static napi_value TestAnimatorOption062(napi_env env, napi_callback_info info);
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_ANIMATION_EVENT_TEST_H