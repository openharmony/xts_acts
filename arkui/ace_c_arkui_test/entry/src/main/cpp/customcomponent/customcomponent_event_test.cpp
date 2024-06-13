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
#include "customcomponent_event_test.h"
namespace ArkUICapiTest {

uint32_t actionedColor = 0xff00ff00;
namespace {
    constexpr int32_t EVENT_ID = 3;
}
napi_value CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }
   auto customNode = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
   ArkUI_NumberValue widthValue[] = { {.f32 = 500} };
   ArkUI_AttributeItem widthItem = { .value = widthValue, .size = sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
   nodeAPI->setAttribute(customNode, NODE_WIDTH, &widthItem);
   ArkUI_NumberValue heightValue[] = { {.f32 = 500} };
   ArkUI_AttributeItem heightItem = { .value = heightValue, .size = sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
   nodeAPI->setAttribute(customNode, NODE_HEIGHT, &heightItem);
   ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
   ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
   nodeAPI->setAttribute(nativeNode, NODE_BACKGROUND_COLOR, &value_item);
   ArkUI_AttributeItem id_item = {};
   id_item.string = "customEventComponentID";
   nodeAPI->setAttribute(nativeNode, NODE_ID, &id_item);
   nodeAPI->registerNodeCustomEvent(customNode, ARKUI_NODE_CUSTOM_EVENT_ON_DRAW, EVENT_ID, nullptr);
   nodeAPI->registerNodeCustomEventReceiver([] (ArkUI_NodeCustomEvent* event) {
       auto targetId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
       auto userData = OH_ArkUI_NodeCustomEvent_GetUserData(event);
       auto nodeHandle = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
       auto type = OH_ArkUI_NodeCustomEvent_GetEventType(event);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "NodeCustomEvent targetId %{public}d", targetId);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "NodeCustomEvent  userData %{public}d", !!userData);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "NodeCustomEvent  nodeHandle %{public}d", !!nodeHandle);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "NodeCustomEvent type  %{public}d", type);
        if (type == ARKUI_NODE_CUSTOM_EVENT_ON_DRAW) {
            auto constrait = OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure(event);
            auto minWidth = OH_ArkUI_LayoutConstraint_GetMinWidth(constrait);
            auto minHeight = OH_ArkUI_LayoutConstraint_GetMinHeight(constrait);
            auto maxWidth = OH_ArkUI_LayoutConstraint_GetMaxWidth(constrait);
            auto maxHeight = OH_ArkUI_LayoutConstraint_GetMaxHeight(constrait);
            auto percentReferenceWidth = OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth(constrait);
            auto percentReferenceHeight = OH_ArkUI_LayoutConstraint_GetPercentReferenceHeight(constrait);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "NodeCustomEvent constrait  %{public}d", !!constrait);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "LayoutConstraint minWidth  %{public}f", minWidth);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "LayoutConstraint minWidth  %{public}f", minWidth);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "LayoutConstraint maxWidth  %{public}f", maxWidth);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "LayoutConstraint maxHeight  %{public}f", maxHeight);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "LayoutConstraint percentReferenceWidth  %{public}f", percentReferenceWidth);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "LayoutConstraint percentReferenceHeight  %{public}f", percentReferenceHeight);
        }
    })
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), longpressNode) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest
