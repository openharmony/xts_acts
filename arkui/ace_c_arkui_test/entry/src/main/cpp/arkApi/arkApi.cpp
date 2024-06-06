/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <ace/xcomponent/native_interface_xcomponent.h>
#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestArkUIAddApi001(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterBlurEventCallback(nullptr, nullptr);
    NAPI_END;
}

static napi_value TestArkUIAddApi002(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetType(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetEventTime(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi004(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetX(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi005(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetY(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi006(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetWindowX(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

}
