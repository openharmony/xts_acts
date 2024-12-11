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

#include "../manager/plugin_manager.h"
#include "scroll_page_test.h"
#include <string>

#define ON_SCROLLPAGE_EVENT_ID 6050
#define ON_CLICK_UP_EVENT_ID 6051
#define ON_CLICK_DOWN_EVENT_ID 6052
#define SIZE_320 320

namespace ArkUICapiTest {

static ArkUI_NodeHandle CreateChildNodeUp(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "scrollPageTestButtonUp";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_START, ON_SCROLLPAGE_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CLICK_UP_EVENT_ID, nullptr);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    return scroll;
}

static ArkUI_NodeHandle CreateChildNodeDown(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "scrollPageTestButtonDown";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_END, ON_SCROLLPAGE_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CLICK_DOWN_EVENT_ID, nullptr);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    return scroll;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollPageTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollPageTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CLICK_DOWN_EVENT_ID) {
        ArkUI_NumberValue value1[] = {{.i32 = PARAM_0}, {.i32 = PARAM_0}};
        ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeAPI->getParent(nodeAPI->getParent(nodeHandler)), NODE_SCROLL_PAGE, &value_item1);
    }

    if (eventId == ON_CLICK_UP_EVENT_ID) {
        ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_200}};
        ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeAPI->getParent(nodeAPI->getParent(nodeHandler)), NODE_SCROLL_BY, &scroll_item);
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeAPI->getParent(nodeAPI->getParent(nodeHandler)),
                              NODE_BACKGROUND_COLOR, &background_color_item);
        ArkUI_NumberValue value1[] = {{.i32 = PARAM_1}, {.i32 = PARAM_1}};
        ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeAPI->getParent(nodeAPI->getParent(nodeHandler)), NODE_SCROLL_PAGE, &value_item1);
    }

    if (eventId == ON_SCROLLPAGE_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

napi_value ScrollPageTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollPageTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollPageTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollPageUp = CreateChildNodeUp(nodeAPI);
    auto scrollPageDown = CreateChildNodeDown(nodeAPI);

    ArkUI_AttributeItem id_item0 = {};
    id_item0.string = "scrollPageUp";
    nodeAPI->setAttribute(scrollPageUp, NODE_ID, &id_item0);
    ArkUI_AttributeItem id_item1 = {};
    id_item1.string = "scrollPageDown";
    nodeAPI->setAttribute(scrollPageDown, NODE_ID, &id_item1);

    nodeAPI->addChild(rootColumn, scrollPageUp);
    nodeAPI->addChild(rootColumn, scrollPageDown);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollPageTest",
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
