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

namespace ArkUICapiTest {

static napi_value TestCalendarPickerHintRadius001(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hint_radius = 12;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hint_radius}};
    ArkUI_AttributeItem calendarPicker_item = {calendarPicker_value, sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32, hint_radius);
    NAPI_END;
}

static napi_value TestCalendarPickerHintRadius002(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hint_radius = -10;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hint_radius}};
    ArkUI_AttributeItem calendarPicker_item = {calendarPicker_value, sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32, hint_radius);
    }
    NAPI_END;
}

static napi_value TestCalendarPickerHintRadius003(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hint_radius = 16.5;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hint_radius}};
    ArkUI_AttributeItem calendarPicker_item = {calendarPicker_value, sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32, hint_radius);
    NAPI_END;
}

} // namespace ArkUICapiTest