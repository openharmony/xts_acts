﻿/*
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

#include "calendarpicker_enabled_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int enabled)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CALENDAR_PICKER);

    if (enabled != SIZE_100) {
        ArkUI_NumberValue enabled_value[] = {{.i32 = enabled}};
        ArkUI_AttributeItem enabled_item = {enabled_value, sizeof(enabled_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enabled_item);
    }

    // set background color
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    // set selected date
    ArkUI_NumberValue calendar_picker_value[] = {{.u32 = YEAR}, {.u32 = MONTH}, {.u32 = DATE}};
    ArkUI_AttributeItem calendar_picker_value_item = {calendar_picker_value,
                                                      sizeof(calendar_picker_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_CALENDAR_PICKER_SELECTED_DATE, &calendar_picker_value_item);

    // set focusable
    ArkUI_NumberValue focusable_value[] = {{.i32 = FOCUSABLE_TRUE}};
    ArkUI_AttributeItem focusable_item = {focusable_value, sizeof(focusable_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_FOCUSABLE, &focusable_item);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CalendarPickerEnabledTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerEnabledTest",
                     "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    uint32_t color = COLOR_PURPLE;
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CalendarPickerEnabledTest", "OnEventReceive eventId: %{public}d",
                 eventId);
    switch (eventId) {
        case ON_CLICK_EVENT_ID:
            color = COLOR_GREEN;
            break;
        case ON_FOCUS_EVENT_ID:
            color = COLOR_BLUE;
            break;
        case ON_BLUR_EVENT_ID:
            color = COLOR_YELLOW;
            break;
        default:
            break;
    }

    ArkUI_NumberValue background_color_value[] = {{.u32 = color}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
}

napi_value CalendarPickerEnabledTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerEnabledTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerEnabledTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    // parent column
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue height_column_value[] = {{.f32 = SIZE_600}};
    ArkUI_AttributeItem height_column_item = {height_column_value,
                                              sizeof(height_column_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &height_column_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_50}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};

    ArkUI_NumberValue height_value[] = {{.f32 = SIZE_50}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};

    ArkUI_AttributeItem id_item_text = {};
    id_item_text.string = "TextClick";

    ArkUI_NumberValue focusable_value[] = {{.i32 = FOCUSABLE_TRUE}};
    ArkUI_AttributeItem focusable_item = {focusable_value, sizeof(focusable_value) / sizeof(ArkUI_NumberValue)};

    // first text
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue position_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem position_item = {position_value, sizeof(position_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_POSITION, &position_item);
    nodeAPI->setAttribute(text, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(text, NODE_HEIGHT, &height_item);
    nodeAPI->setAttribute(text, NODE_ID, &id_item_text);
    nodeAPI->setAttribute(text, NODE_FOCUSABLE, &focusable_item);

    // first calendarPicker
    auto calendarPicker = createChildNode(nodeAPI, PARAM_1);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "EnabledCalendarPicker";
    nodeAPI->setAttribute(calendarPicker, NODE_ID, &id_item);
    nodeAPI->registerNodeEvent(calendarPicker, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(calendarPicker, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    // second calendarPicker
    auto calendarPickerDisabled = createChildNode(nodeAPI, PARAM_0);
    ArkUI_AttributeItem id_second_item = {};
    id_second_item.string = "DisabledCalendarPicker";
    nodeAPI->setAttribute(calendarPickerDisabled, NODE_ID, &id_second_item);
    nodeAPI->registerNodeEvent(calendarPickerDisabled, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(calendarPickerDisabled, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    // third calendarPicker
    auto calendarPickerAbnormal = createChildNode(nodeAPI, PARAM_NEGATIVE_1);
    ArkUI_AttributeItem id_third_item = {};
    id_third_item.string = "AbnormalCalendarPicker";
    nodeAPI->setAttribute(calendarPickerAbnormal, NODE_ID, &id_third_item);
    nodeAPI->registerNodeEvent(calendarPickerAbnormal, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(calendarPickerAbnormal, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    // calendarPicker for click
    auto calendarPickerClick = createChildNode(nodeAPI, PARAM_1);
    ArkUI_AttributeItem id_item_click = {};
    id_item_click.string = "OnClickEnabledCalendarPicker";
    nodeAPI->setAttribute(calendarPickerClick, NODE_ID, &id_item_click);
    nodeAPI->registerNodeEvent(calendarPickerClick, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    // calendarPicker for click
    auto calendarPickerDisabledClick = createChildNode(nodeAPI, PARAM_0);
    ArkUI_AttributeItem id_second_item_click = {};
    id_second_item_click.string = "OnClickDisabledCalendarPicker";
    nodeAPI->setAttribute(calendarPickerDisabledClick, NODE_ID, &id_second_item_click);
    nodeAPI->registerNodeEvent(calendarPickerDisabledClick, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    // calendarPicker for click
    auto calendarPickerAbnormalClick = createChildNode(nodeAPI, PARAM_NEGATIVE_1);
    ArkUI_AttributeItem id_third_item_click = {};
    id_third_item_click.string = "OnClickAbnormalCalendarPicker";
    nodeAPI->setAttribute(calendarPickerAbnormalClick, NODE_ID, &id_third_item_click);
    nodeAPI->registerNodeEvent(calendarPickerAbnormalClick, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    // row
    auto rowFirst = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto rowSecond = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto rowThird = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(rowFirst, calendarPicker);
    nodeAPI->addChild(rowFirst, calendarPickerClick);
    nodeAPI->addChild(rowSecond, calendarPickerDisabled);
    nodeAPI->addChild(rowSecond, calendarPickerDisabledClick);
    nodeAPI->addChild(rowThird, calendarPickerAbnormal);
    nodeAPI->addChild(rowThird, calendarPickerAbnormalClick);

    nodeAPI->addChild(column, text);
    nodeAPI->addChild(column, rowFirst);
    nodeAPI->addChild(column, rowSecond);
    nodeAPI->addChild(column, rowThird);

    // Bind click event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerEnabledTest",
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