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

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "commonattrs_focusontouch_test.h"

namespace ArkUICapiTest {

static auto CreateChildNodeFocusOnTouch(ArkUI_NativeNodeAPI_1 *nodeAPI, int32_t focusOnTouch)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue value[] = {{.i32 = focusOnTouch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(nodeHandle, NODE_FOCUS_ON_TOUCH, &valueItem);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_AttributeItem label_item = {.string = ""};
    nodeAPI->setAttribute(nodeHandle, NODE_BUTTON_LABEL, &label_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);

    return nodeHandle;
}

static void OnEventReceiveFocusOnTouch(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest",
        "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_FOCUS_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem background_color_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

napi_value CommonAttrsFocusOnTouchTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = CreateChildNodeFocusOnTouch(nodeAPI, PARAM_1);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "btnFocusOnTouch";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveFocusOnTouch);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest