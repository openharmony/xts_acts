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

#ifndef ARKUI_CAPI_DEMO_GUESTURE_CREATE_GESTURE_TEST_H
#define ARKUI_CAPI_DEMO_GUESTURE_CREATE_GESTURE_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <string>
#include <unordered_map>

#include "../common/common.h"
#include "../manager/plugin_manager.h"
#include "component/button_component.h"
#include "component/column_component.h"

namespace ArkUICapiTest {

class GestureCreateGestureTest {
public:
    ~GestureCreateGestureTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNode1(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNode2(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNode3(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNode4(napi_env env, napi_callback_info info);
    static ArkUI_NativeNodeAPI_1* nodeAPI;
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_DEMO_GUESTURE_CREATE_GESTURE_TEST_H