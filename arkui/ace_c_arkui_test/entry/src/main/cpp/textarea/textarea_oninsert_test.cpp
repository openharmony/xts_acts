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

#include "textarea_oninsert_test.h"

#include <string>

#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

static ArkUI_NodeHandle textArea = nullptr;
std::vector<int32_t> TextAreaOnInsertTest::insertOffset = {};
static napi_value SetArrayNapiDataWithInsert(const std::vector<int32_t>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_int32(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};
static void PushBackIntToData(std::vector<int32_t>& data, int32_t value)
{
    data.push_back(value);
}
static auto createChildNode(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue width_value[] = { { .f32 = SIZE_100 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = { { .f32 = DEFAULT_MARGIN } };
    ArkUI_AttributeItem margin_item = { margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_RED } };
    ArkUI_AttributeItem background_color_item = { background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);
    return nodeHandle;
}
static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnInsertTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnInsertTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnInsertTest", "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NumberValue return_value[] = { { .i32 = 1 } };
    OH_ArkUI_NodeEvent_SetReturnNumberValue(event, return_value, 1);
    switch (eventId) {
        case ON_TEXT_AREA_DID_INSERT_ID: {
            ArkUI_NumberValue insertValue[] = { { .f32 = 0 } };
            OH_ArkUI_NodeEvent_GetNumberValue(event, 0, insertValue);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnInsertTest",
                "TextAreaOnInsertTest ON_TEXT_AREA_DID_INSERT_ID insertValue: %{public}f", insertValue[PARAM_0].f32);
            PushBackIntToData(TextAreaOnInsertTest::insertOffset, insertValue[PARAM_0].f32);
            ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_GREEN } };
            ArkUI_AttributeItem background_color_item = { background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
            return;
        }
        case ON_TEXT_AREA_WILL_INSERT_ID: {
            ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_BLUE } };
            ArkUI_AttributeItem background_color_item = { background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
            return;
        }
        default:
            break;
    }
}

napi_value TextAreaOnInsertTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnInsertTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnInsertTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textArea = createChildNode(nodeAPI);

    nodeAPI->registerNodeEvent(textArea, NODE_TEXT_AREA_ON_WILL_INSERT, ON_TEXT_AREA_WILL_INSERT_ID, nullptr);
    nodeAPI->registerNodeEvent(textArea, NODE_TEXT_AREA_ON_DID_INSERT, ON_TEXT_AREA_DID_INSERT_ID, nullptr);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnInsertTestTextArea";
    nodeAPI->setAttribute(textArea, NODE_ID, &id_item);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "textArea";
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &content_item);
    nodeAPI->addChild(column, textArea);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnInsertTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "TextAreaOnInsertTest napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value TextAreaOnInsertTest::GetTextAreaInsertData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnInsertTest", "GetTextAreaInsertData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiDataWithInsert(TextAreaOnInsertTest::insertOffset, env));
    TextAreaOnInsertTest::insertOffset.clear();
    return result;
}
} // namespace ArkUICapiTest