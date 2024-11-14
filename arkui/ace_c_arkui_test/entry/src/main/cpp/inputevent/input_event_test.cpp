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
#include "input_event_test.h"

#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <cstdint>
#include <string>

#include "../manager/plugin_manager.h"
#include "button_component.h"
#include "column_component.h"
#include "row_component.h"
#include "text_component.h"

#define COLUMN_ID 2020
#define TEXT_ID 2121
namespace ArkUICapiTest {
constexpr int32_t LEFT_MOUSE_BUTTON = 1;
constexpr int32_t RIGHT_MOUSE_BUTTON = 2;
constexpr int32_t MIDDLE_MOUSE_BUTTON = 3;
constexpr int32_t MOUSE_PRESSED = 1;
constexpr int32_t MOUSE_RELEASE = 2;
constexpr int32_t MOUSE_MOVEMENT = 3;
constexpr int32_t SOURCETYPE_NONE = 0;
constexpr int32_t SOURCETYPE_MOUSE = 1;
constexpr int32_t SOURCETYPE_TOUCH = 2;
constexpr int32_t SOURCETOLL_UNKNOWN = 0;
constexpr int32_t SOURCETOLL_FINGER = 1;
constexpr int32_t SOURCETOLL_MOUSE = 7;
static std::vector<int32_t> MouseActionVector;

void PrintHistoryPointEventLogByPointIndex(
    const ArkUI_UIInputEvent* inputEvent, uint32_t pointerIndex, uint32_t historyIndex)
{
    auto getHistorySize = OH_ArkUI_PointerEvent_GetHistorySize(inputEvent);
    auto getHistoryEventTime = OH_ArkUI_PointerEvent_GetHistoryEventTime(inputEvent, historyIndex);
    auto getHistoryPointerCount = OH_ArkUI_PointerEvent_GetHistoryPointerCount(inputEvent, historyIndex);
    auto getHistoryPointerId = OH_ArkUI_PointerEvent_GetHistoryPointerId(inputEvent, pointerIndex, historyIndex);
    auto getHistoryX = OH_ArkUI_PointerEvent_GetHistoryX(inputEvent, pointerIndex, historyIndex);
    auto getHistoryY = OH_ArkUI_PointerEvent_GetHistoryY(inputEvent, pointerIndex, historyIndex);

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
        "HistoryPointEventLogByPointIndex %{public}d, pointIndex=%{public}u, "
        "historyIndex=%{public}u",
        !!inputEvent, pointerIndex, historyIndex);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistorySize %{public}d", getHistorySize);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryEventTime %{public}ld", getHistoryEventTime);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryPointerCount %{public}u",
        getHistoryPointerCount);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryPointerId %{public}d", getHistoryPointerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryX %{public}f", getHistoryX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryY %{public}f", getHistoryY);
}

void PrintHistoryPointEventLogByPointIndex1(
    const ArkUI_UIInputEvent* inputEvent, uint32_t pointerIndex, uint32_t historyIndex)
{
    auto getHistoryWindowX = OH_ArkUI_PointerEvent_GetHistoryWindowX(inputEvent, pointerIndex, historyIndex);
    auto getHistoryWindowY = OH_ArkUI_PointerEvent_GetHistoryWindowY(inputEvent, pointerIndex, historyIndex);
    auto getHistoryDisplayX = OH_ArkUI_PointerEvent_GetHistoryDisplayX(inputEvent, pointerIndex, historyIndex);
    auto getHistoryDisplayY = OH_ArkUI_PointerEvent_GetHistoryDisplayY(inputEvent, pointerIndex, historyIndex);
    auto getHistoryPressure = OH_ArkUI_PointerEvent_GetHistoryPressure(inputEvent, pointerIndex, historyIndex);
    auto getHistoryTiltX = OH_ArkUI_PointerEvent_GetHistoryTiltX(inputEvent, pointerIndex, historyIndex);
    auto getHistoryTiltY = OH_ArkUI_PointerEvent_GetHistoryTiltY(inputEvent, pointerIndex, historyIndex);
    auto getHistoryTouchAreaWidth =
        OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth(inputEvent, pointerIndex, historyIndex);
    auto getHistoryTouchAreaHeight =
        OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight(inputEvent, pointerIndex, historyIndex);

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
        "PrintHistoryPointEventLogByPointIndex1 %{public}d, pointIndex=%{public}u, "
        "historyIndex=%{public}u",
        !!inputEvent, pointerIndex, historyIndex);

    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryWindowX %{public}f", getHistoryWindowX);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryWindowY %{public}f", getHistoryWindowY);

    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryDisplayX %{public}f", getHistoryDisplayX);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryDisplayY %{public}f", getHistoryDisplayY);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryPressure %{public}f", getHistoryPressure);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryTiltX %{public}f", getHistoryTiltX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryTiltY %{public}f", getHistoryTiltY);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryTouchAreaWidth %{public}f",
        getHistoryTouchAreaWidth);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getHistoryTouchAreaHeight %{public}f",
        getHistoryTouchAreaHeight);
}

void PrintPointEventLogByPointIndex(const ArkUI_UIInputEvent* uiInputEvent, int32_t pointIndex)
{
    auto getPointerCount = OH_ArkUI_PointerEvent_GetPointerCount(uiInputEvent);
    auto getPintId = OH_ArkUI_PointerEvent_GetPointerId(uiInputEvent, pointIndex);
    auto getX = OH_ArkUI_PointerEvent_GetX(uiInputEvent);
    auto getY = OH_ArkUI_PointerEvent_GetY(uiInputEvent);
    auto getXByIndex = OH_ArkUI_PointerEvent_GetXByIndex(uiInputEvent, pointIndex);
    auto getYByIndex = OH_ArkUI_PointerEvent_GetYByIndex(uiInputEvent, pointIndex);
    auto getWindowX = OH_ArkUI_PointerEvent_GetWindowX(uiInputEvent);
    auto getWindowY = OH_ArkUI_PointerEvent_GetWindowY(uiInputEvent);
    auto getWindowXByIndex = OH_ArkUI_PointerEvent_GetWindowXByIndex(uiInputEvent, pointIndex);
    auto getWindowYByIndex = OH_ArkUI_PointerEvent_GetWindowYByIndex(uiInputEvent, pointIndex);
    auto getDisplayX = OH_ArkUI_PointerEvent_GetDisplayX(uiInputEvent);
    auto getDisplayY = OH_ArkUI_PointerEvent_GetDisplayY(uiInputEvent);
    auto getDisplayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(uiInputEvent, pointIndex);
    auto getDisplayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(uiInputEvent, pointIndex);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "inputEvent %{public}d, pointIndex=%{public}d",
        !!uiInputEvent, pointIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getPointerCount %{public}d", getPointerCount);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getPintId %{public}d", getPintId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getX %{public}f", getX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getY %{public}f", getY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getXByIndex %{public}f", getXByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getYByIndex %{public}f", getYByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getWindowX %{public}f", getWindowX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getWindowY %{public}f", getWindowY);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getWindowXByIndex %{public}f", getWindowXByIndex);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getWindowYByIndex %{public}f", getWindowYByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getDisplayX %{public}f", getDisplayX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getDisplayY %{public}f", getDisplayY);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getDisplayXByIndex %{public}f", getDisplayXByIndex);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getDisplayYByIndex %{public}f", getDisplayYByIndex);
}

std::shared_ptr<ColumnComponent> CreateMouseButton()
{
    auto columnMouse = std::make_shared<ColumnComponent>();
    columnMouse->SetWidth(SIZE_400);
    columnMouse->SetHeight(SIZE_300);
    columnMouse->SetBorderWidth(SIZE_5);
    auto buttonMouse = new ButtonComponent();
    buttonMouse->SetWidth(SIZE_200);
    buttonMouse->SetHeight(SIZE_100);
    buttonMouse->SetLable("click");
    buttonMouse->SetMargin(SIZE_10);
    buttonMouse->SetId("buttonMouse");
    auto textShow = new TextComponent();
    textShow->SetWidth(SIZE_300);
    textShow->SetHeight(SIZE_150);
    textShow->SetBackgroundColor(COLOR_PINK);
    buttonMouse->RegisterOnMouse([textShow, buttonMouse](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        // ARKUI_UIINPUTEVENT_TYPE_UNKNOWN = 0,
        // ARKUI_UIINPUTEVENT_TYPE_TOUCH = 1,
        // ARKUI_UIINPUTEVENT_TYPE_AXIS = 2,
        // ARKUI_UIINPUTEVENT_TYPE_MOUSE = 3,
        auto type = OH_ArkUI_UIInputEvent_GetType(uiInputEvent);
        auto action = OH_ArkUI_UIInputEvent_GetAction(uiInputEvent);
        // NONE = 0, MOUSE = 1,TOUCH = 2, TOUCH_PAD = 3, KEYBOARD = 4
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(uiInputEvent);
        auto toolType = OH_ArkUI_UIInputEvent_GetToolType(uiInputEvent);
        auto eventTime = OH_ArkUI_UIInputEvent_GetEventTime(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "type=%{public}d, action=%{public}d,sourceType=%{public}d, toolType=%{public}d,eventTime=%{public}ld", type,
            action, sourceType, toolType, eventTime);

        std::string str = "type:" + std::to_string(type) + "\n" + "action:" + std::to_string(action) + "\n" +
                          "sourceType:" + std::to_string(sourceType) + "\n" + "toolType:" + std::to_string(toolType) +
                          "\n" + "eventTime:" + std::to_string(eventTime) + "\n";
        textShow->SetFontSize(SIZE_20);
        textShow->SetTextContent(str);

        PrintPointEventLogByPointIndex(uiInputEvent, 0);
        PrintPointEventLogByPointIndex(uiInputEvent, PARAM_NEGATIVE_1);
        PrintPointEventLogByPointIndex(uiInputEvent, PARAM_2);

        PrintHistoryPointEventLogByPointIndex(uiInputEvent, 0, 0);
        PrintHistoryPointEventLogByPointIndex1(uiInputEvent, 0, 0);
        PrintHistoryPointEventLogByPointIndex(uiInputEvent, 0, PARAM_NEGATIVE_1);
        PrintHistoryPointEventLogByPointIndex1(uiInputEvent, 0, PARAM_NEGATIVE_1);
        PrintHistoryPointEventLogByPointIndex(uiInputEvent, 0, PARAM_2);
        PrintHistoryPointEventLogByPointIndex1(uiInputEvent, 0, PARAM_2);

        if (type == ArkUI_UIInputEvent_Type::ARKUI_UIINPUTEVENT_TYPE_MOUSE && sourceType == SOURCETYPE_NONE &&
            toolType == OH_NATIVEXCOMPONENT_SOURCETOOL_UNKNOWN) {
            buttonMouse->SetBackgroundColor(COLOR_GREEN);
        }
    });
    columnMouse->AddChild(std::shared_ptr<ButtonComponent>(buttonMouse));
    columnMouse->AddChild(std::shared_ptr<TextComponent>(textShow));
    return columnMouse;
}

std::shared_ptr<ColumnComponent> CreateTouchButton()
{
    auto columnTouch = std::make_shared<ColumnComponent>();
    columnTouch->SetWidth(SIZE_400);
    columnTouch->SetHeight(SIZE_300);
    columnTouch->SetBorderWidth(SIZE_5);
    columnTouch->SetMargin(SIZE_10);
    auto textTouch = new TextComponent();
    textTouch->SetWidth(SIZE_300);
    textTouch->SetHeight(SIZE_200);
    textTouch->SetBackgroundColor(COLOR_PINK);
    textTouch->SetMargin(SIZE_10);
    textTouch->SetId("textTouch");
    textTouch->RegisterOnTouch([textTouch](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto type = OH_ArkUI_UIInputEvent_GetType(uiInputEvent);
        auto action = OH_ArkUI_UIInputEvent_GetAction(uiInputEvent);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(uiInputEvent);
        auto toolType = OH_ArkUI_UIInputEvent_GetToolType(uiInputEvent);
        auto eventTime = OH_ArkUI_UIInputEvent_GetEventTime(uiInputEvent);
        eventTime = eventTime == 0 ? 0 : 1;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "type=%{public}d, action=%{public}d,type=%{public}d, action=%{public}d,eventTime=%{public}ld", type, action,
            sourceType, toolType, eventTime);

        std::string str = "type:" + std::to_string(type) + "\n" + "action:" + std::to_string(action) + "\n" +
                          "sourceType:" + std::to_string(sourceType) + "\n" + "toolType:" + std::to_string(toolType) +
                          "\n" + "eventTime:" + std::to_string(eventTime) + "\n";

        textTouch->SetFontSize(SIZE_20);
        textTouch->SetTextContent(str);

        PrintPointEventLogByPointIndex(uiInputEvent, 0);
        PrintPointEventLogByPointIndex(uiInputEvent, PARAM_NEGATIVE_1);
        PrintPointEventLogByPointIndex(uiInputEvent, PARAM_1);

        PrintHistoryPointEventLogByPointIndex(uiInputEvent, 0, 0);
        PrintHistoryPointEventLogByPointIndex1(uiInputEvent, 0, 0);
        PrintHistoryPointEventLogByPointIndex(uiInputEvent, 0, PARAM_NEGATIVE_1);
        PrintHistoryPointEventLogByPointIndex1(uiInputEvent, 0, PARAM_NEGATIVE_1);
        PrintHistoryPointEventLogByPointIndex(uiInputEvent, 0, PARAM_2);
        PrintHistoryPointEventLogByPointIndex1(uiInputEvent, 0, PARAM_2);

        if (type == ArkUI_UIInputEvent_Type::ARKUI_UIINPUTEVENT_TYPE_TOUCH && sourceType == SOURCETYPE_TOUCH &&
            toolType == SOURCETOLL_FINGER) {
            textTouch->SetBackgroundColor(COLOR_GRAY);
        }
    });
    columnTouch->AddChild(std::shared_ptr<TextComponent>(textTouch));
    return columnTouch;
}

napi_value InputEventTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto parentColumn = new ColumnComponent();
    auto columnMouse = CreateMouseButton();
    auto columnTouch = CreateTouchButton();
    parentColumn->AddChild(columnMouse);
    parentColumn->AddChild(columnTouch);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

std::shared_ptr<ButtonComponent> CreateButtonExample()
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_200);
    button->SetHeight(SIZE_100);
    button->SetMargin(SIZE_10);
    button->SetBackgroundColor(COLOR_BLUE);
    button->SetFontSize(SIZE_20);
    button->SetId("onMouseRightTest");
    button->RegisterOnMouse([button](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto mouseAction = OH_ArkUI_MouseEvent_GetMouseAction(uiInputEvent);
        auto mouseButton = OH_ArkUI_MouseEvent_GetMouseButton(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "button mouseAction=%{public}d,mouseButton=%{public}d", mouseAction, mouseButton);
        // MOUSE_PRESSED first, then MOUSE_RELEASE.
        if (mouseButton == RIGHT_MOUSE_BUTTON) {
            if (mouseAction == MOUSE_PRESSED) {
                MouseActionVector.push_back(MOUSE_PRESSED);
            }
            if (mouseAction == MOUSE_RELEASE && MouseActionVector.size() == PARAM_1 &&
                MouseActionVector[0] == MOUSE_PRESSED) {
                button->SetBackgroundColor(COLOR_YELLOW);
            }
        }
    });
    return button;
}

std::shared_ptr<ButtonComponent> CreateButtonExample1()
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_200);
    button->SetHeight(SIZE_100);
    button->SetMargin(SIZE_10);
    button->SetBackgroundColor(COLOR_BLUE);
    button->SetFontSize(SIZE_20);
    button->SetId("onMouseLeftTest");
    button->RegisterOnMouse([button](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto mouseAction = OH_ArkUI_MouseEvent_GetMouseAction(uiInputEvent);
        auto mouseButton = OH_ArkUI_MouseEvent_GetMouseButton(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "button mouseAction=%{public}d,mouseButton=%{public}d", mouseAction, mouseButton);

        if (mouseButton == LEFT_MOUSE_BUTTON && mouseAction == MOUSE_PRESSED) {
            button->SetBackgroundColor(COLOR_PURPLE);
        }
    });
    return button;
}

std::shared_ptr<ButtonComponent> CreateButtonExample2()
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_200);
    button->SetHeight(SIZE_100);
    button->SetMargin(SIZE_10);
    button->SetBackgroundColor(COLOR_BLUE);
    button->SetFontSize(SIZE_20);
    button->SetId("onMouseMiddleTest");
    button->RegisterOnMouse([button](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto mouseAction = OH_ArkUI_MouseEvent_GetMouseAction(uiInputEvent);
        auto mouseButton = OH_ArkUI_MouseEvent_GetMouseButton(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "button mouseAction=%{public}d,mouseButton=%{public}d", mouseAction, mouseButton);
        if (mouseButton == MIDDLE_MOUSE_BUTTON && mouseAction == MOUSE_PRESSED) {
            button->SetBackgroundColor(COLOR_PINK);
        }
    });
    return button;
}

std::shared_ptr<ButtonComponent> CreateButtonExample3()
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_200);
    button->SetHeight(SIZE_100);
    button->SetMargin(SIZE_10);
    button->SetBackgroundColor(COLOR_BLUE);
    button->SetFontSize(SIZE_20);
    button->SetId("onMouseMoveTest");
    button->RegisterOnMouse([button](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto mouseAction = OH_ArkUI_MouseEvent_GetMouseAction(uiInputEvent);
        auto mouseButton = OH_ArkUI_MouseEvent_GetMouseButton(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "button mouseAction=%{public}d,mouseButton=%{public}d", mouseAction, mouseButton);
        if (mouseAction == MOUSE_MOVEMENT) {
            button->SetBackgroundColor(COLOR_BLACK);
        }
    });
    return button;
}

napi_value InputEventTest::CreateNativeNodeForMouse(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "CreateNativeNodeForMouse");
    MouseActionVector.clear();

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto parentColumn = new ColumnComponent();
    auto button = CreateButtonExample();
    parentColumn->AddChild(button);

    auto button1 = CreateButtonExample1();
    parentColumn->AddChild(button1);

    auto button2 = CreateButtonExample2();
    parentColumn->AddChild(button2);

    auto button3 = CreateButtonExample3();
    parentColumn->AddChild(button3);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

ColumnComponent* axisColumn;
void OnActionCallBackAxis(ArkUI_GestureEvent* event, void* extraparam)
{
    auto uiInputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
    PrintPointEventLogByPointIndex(uiInputEvent, 0);
    PrintPointEventLogByPointIndex(uiInputEvent, PARAM_NEGATIVE_1);
    PrintPointEventLogByPointIndex(uiInputEvent, PARAM_2);

    // ARKUI_UIINPUTEVENT_TYPE_AXIS = 2,
    auto type = OH_ArkUI_UIInputEvent_GetType(uiInputEvent);
    auto action = OH_ArkUI_UIInputEvent_GetAction(uiInputEvent);
    // NONE = 0, MOUSE = 1,TOUCH = 2, TOUCH_PAD = 3, KEYBOARD = 4
    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(uiInputEvent);
    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(uiInputEvent);
    auto eventTime = OH_ArkUI_UIInputEvent_GetEventTime(uiInputEvent);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
        "Axis type=%{public}d, action=%{public}d,sourceType=%{public}d, "
        "toolType=%{public}d,eventTime=%{public}ld",
        type, action, sourceType, toolType, eventTime);
    if (type == ArkUI_UIInputEvent_Type::ARKUI_UIINPUTEVENT_TYPE_AXIS && sourceType == SOURCETYPE_MOUSE && axisColumn) {
        axisColumn->SetBackgroundColor(COLOR_GREEN);
    }
}
napi_value InputEventTest::CreateNativeNodeForAxis(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "CreateNativeNodeForAxis");
    MouseActionVector.clear();

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto parentColumn = new ColumnComponent();
    axisColumn = new ColumnComponent();
    axisColumn->SetWidth(SIZE_500);
    axisColumn->SetHeight(SIZE_500);
    axisColumn->SetBackgroundColor(COLOR_RED);
    axisColumn->SetId("AxisID");

    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto swipeGuesture = guestureAPI->createSwipeGesture(1, GESTURE_DIRECTION_ALL, PARAM_10);
    guestureAPI->setGestureEventTarget(
        swipeGuesture, GESTURE_EVENT_ACTION_ACCEPT, axisColumn->GetComponent(), &OnActionCallBackAxis);
    guestureAPI->addGestureToNode(axisColumn->GetComponent(), swipeGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    parentColumn->AddChild(std::shared_ptr<ColumnComponent>(axisColumn));

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest
