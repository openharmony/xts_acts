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
#include "scroll_hittestbehavior_test.h"

#include <string>

#define SCROLL_ON_TOUCH_EVENT_ID 7001
#define SCROLL_BROTHER_ON_TOUCH_EVENT_ID 7002

namespace ArkUICapiTest {

void ScrollHitTestBehaviorTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    uint32_t backgroundColor = 0xFF0000FF;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollEventOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollEventOnClickTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == SCROLL_ON_TOUCH_EVENT_ID) {
        backgroundColor = 0xFF0000FF;
    } else {
        backgroundColor = 0xFF000000;
    }

    if ((eventId == SCROLL_ON_TOUCH_EVENT_ID) || (eventId == SCROLL_BROTHER_ON_TOUCH_EVENT_ID)) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

ArkUI_NodeHandle ScrollHitTestBehaviorTest::CreateSubScrollNode(ArkUI_NativeNodeAPI_1 *node_api,
                                                                int32_t hitTestBehavior, const char *onTouchTestStack,
                                                                const char *onTouchTestScroll,
                                                                const char *onTouchTestScrollBrother)
{
    float stackWidth = 80;
    float stackHeight = 80;
    float scrollWidth = 60;
    float scrollHeight = 60;
    float scrollBrotherWidth = 40;
    float scrollBrotherHeight = 40;
    uint32_t stackBackgroundColor = 0xFF888888;
    uint32_t scrollBackgroundColor = 0xFFFF0000;
    uint32_t scrollBrotherBackgroundColor = 0xFF00FF00;

    auto stack = node_api->createNode(ARKUI_NODE_STACK);
    auto scroll = node_api->createNode(ARKUI_NODE_SCROLL);
    auto scrollBrother = node_api->createNode(ARKUI_NODE_SCROLL);

    ArkUI_AttributeItem id_item = {};
    id_item.string = onTouchTestStack;
    node_api->setAttribute(stack, NODE_ID, &id_item);

    ArkUI_NumberValue stack_width_value[] = {{.f32 = stackWidth}};
    ArkUI_AttributeItem stack_width_item = {stack_width_value, sizeof(stack_width_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_WIDTH, &stack_width_item);

    ArkUI_NumberValue stack_height_value[] = {{.f32 = stackHeight}};
    ArkUI_AttributeItem stack_height_item = {stack_height_value,
                                             sizeof(stack_height_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_HEIGHT, &stack_height_item);

    ArkUI_NumberValue stack_background_color_value[] = {{.u32 = stackBackgroundColor}};
    ArkUI_AttributeItem stack_background_color_item = {
        stack_background_color_value, sizeof(stack_background_color_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_BACKGROUND_COLOR, &stack_background_color_item);

    ArkUI_AttributeItem scroll_id_item = {};
    scroll_id_item.string = onTouchTestScroll;
    node_api->setAttribute(scroll, NODE_ID, &scroll_id_item);

    ArkUI_NumberValue scroll_width_value[] = {{.f32 = scrollWidth}};
    ArkUI_AttributeItem scroll_width_item = {scroll_width_value,
                                             sizeof(scroll_width_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(scroll, NODE_WIDTH, &scroll_width_item);

    ArkUI_NumberValue scroll_height_value[] = {{.f32 = scrollHeight}};
    ArkUI_AttributeItem scroll_height_item = {scroll_height_value,
                                              sizeof(scroll_height_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(scroll, NODE_HEIGHT, &scroll_height_item);

    ArkUI_NumberValue scroll_background_color_value[] = {{.u32 = scrollBackgroundColor}};
    ArkUI_AttributeItem scroll_background_color_item = {
        scroll_background_color_value, sizeof(scroll_background_color_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(scroll, NODE_BACKGROUND_COLOR, &scroll_background_color_item);

    node_api->registerNodeEvent(scroll, NODE_TOUCH_EVENT, SCROLL_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SCROLL_ON_TOUCH_EVENT_ID", "SCROLL_ON_TOUCH_EVENT_ID");

    node_api->addChild(stack, scroll);

    ArkUI_AttributeItem scroll_brother_id_item = {};
    scroll_brother_id_item.string = onTouchTestScrollBrother;
    node_api->setAttribute(scrollBrother, NODE_ID, &scroll_brother_id_item);

    ArkUI_NumberValue scroll_brother_width_value[] = {{.f32 = scrollBrotherWidth}};
    ArkUI_AttributeItem scroll_brother_width_item = {scroll_brother_width_value,
                                                     sizeof(scroll_brother_width_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(scrollBrother, NODE_WIDTH, &scroll_brother_width_item);

    ArkUI_NumberValue scroll_brother_height_value[] = {{.f32 = scrollBrotherHeight}};
    ArkUI_AttributeItem scroll_brother_height_item = {scroll_brother_height_value,
                                                      sizeof(scroll_brother_height_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(scrollBrother, NODE_HEIGHT, &scroll_brother_height_item);

    ArkUI_NumberValue scroll_brother_background_color_value[] = {{.u32 = scrollBrotherBackgroundColor}};
    ArkUI_AttributeItem scroll_brother_background_color_item = {scroll_brother_background_color_value,
                                                                sizeof(scroll_brother_background_color_value) /
                                                                    sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(scrollBrother, NODE_BACKGROUND_COLOR, &scroll_brother_background_color_item);

    ArkUI_NumberValue scroll_brother_hittestbehavior_value[] = {{.i32 = hitTestBehavior}};
    ArkUI_AttributeItem scroll_brother_hittestbehavior_item = {
        scroll_brother_hittestbehavior_value, sizeof(scroll_brother_hittestbehavior_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(scrollBrother, NODE_HIT_TEST_BEHAVIOR, &scroll_brother_hittestbehavior_item);

    node_api->registerNodeEvent(scrollBrother, NODE_TOUCH_EVENT, SCROLL_BROTHER_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SCROLL_BROTHER_ON_TOUCH_EVENT_ID",
                 "SCROLL_BROTHER_ON_TOUCH_EVENT_ID");

    node_api->addChild(stack, scrollBrother);

    return stack;
}

napi_value ScrollHitTestBehaviorTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hitTestBehavior = PARAM_0;
    string onTouchTestStack = "OnTouchTestStackDefault";
    string onTouchTestScroll = "OnTouchTestScrollDefault";
    string onTouchTestScrollBrother = "OnTouchTestScrollBrotherDefault";
    auto stack = CreateSubScrollNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestScroll.c_str(),
                                     onTouchTestScrollBrother.c_str());
    nodeAPI->addChild(column, stack);

    hitTestBehavior = PARAM_1;
    onTouchTestStack = "OnTouchTestStackBlock";
    onTouchTestScroll = "OnTouchTestScrollBlock";
    onTouchTestScrollBrother = "OnTouchTestScrollBrotherBlock";
    stack = CreateSubScrollNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestScroll.c_str(),
                                onTouchTestScrollBrother.c_str());
    nodeAPI->addChild(column, stack);

    hitTestBehavior = PARAM_2;
    onTouchTestStack = "OnTouchTestStackTransparent";
    onTouchTestScroll = "OnTouchTestScrollTransparent";
    onTouchTestScrollBrother = "OnTouchTestScrollBrotherTransparent";
    stack = CreateSubScrollNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestScroll.c_str(),
                                onTouchTestScrollBrother.c_str());
    nodeAPI->addChild(column, stack);

    hitTestBehavior = PARAM_3;
    onTouchTestStack = "OnTouchTestStackNone";
    onTouchTestScroll = "OnTouchTestScrollNone";
    onTouchTestScrollBrother = "OnTouchTestScrollBrotherNone";
    stack = CreateSubScrollNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestScroll.c_str(),
                                onTouchTestScrollBrother.c_str());
    nodeAPI->addChild(column, stack);

    hitTestBehavior = -1;
    onTouchTestStack = "OnTouchTestStackExceptBelow";
    onTouchTestScroll = "OnTouchTestScrollExceptBelow";
    onTouchTestScrollBrother = "OnTouchTestScrollBrotherExceptBelow";
    stack = CreateSubScrollNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestScroll.c_str(),
                                onTouchTestScrollBrother.c_str());
    nodeAPI->addChild(column, stack);

    hitTestBehavior = PARAM_4;
    onTouchTestStack = "OnTouchTestStackExceptAbove";
    onTouchTestScroll = "OnTouchTestScrollExceptAbove";
    onTouchTestScrollBrother = "OnTouchTestScrollBrotherExceptAbove";
    stack = CreateSubScrollNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestScroll.c_str(),
                                onTouchTestScrollBrother.c_str());
    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollHitTestBehaviorTest",
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