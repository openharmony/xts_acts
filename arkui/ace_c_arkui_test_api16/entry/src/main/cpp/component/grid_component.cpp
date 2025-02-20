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

#include "grid_component.h"

namespace ArkUICapiTest {
void GridComponent::SetGridColumnsTemplate(const std::string& str)
{
    ArkUI_AttributeItem item = { .string = str.c_str() };
    _nodeAPI->setAttribute(_component, NODE_GRID_COLUMN_TEMPLATE, &item);
}
void GridComponent::SetGridRowsTemplate(const std::string& str)
{
    ArkUI_AttributeItem item = { .string = str.c_str() };
    _nodeAPI->setAttribute(_component, NODE_GRID_ROW_TEMPLATE, &item);
}
void GridComponent::SetGridColumnsGap(float val)
{
    ArkUI_NumberValue value[] = { { .f32 = val } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_GRID_COLUMN_GAP, &item);
}
void GridComponent::SetGridRowsGap(float val)
{
    ArkUI_NumberValue value[] = { { .f32 = val } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_GRID_ROW_GAP, &item);
}
void GridComponent::SetGridCachedCount(int32_t cachedCount)
{
    ArkUI_NumberValue value[] = { { .i32 = cachedCount } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_GRID_CACHED_COUNT, &item);
}
void GridComponent::SetOnDidScroll(OnDidScroll onDidScroll)
{
    auto onDidScrollCallback = [onDidScroll](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onDidScroll) {
            float offset = result->data[PARAM_0].f32;
            int32_t state = result->data[PARAM_1].i32;
            onDidScroll(offset, state);
        }
    };
    eventMap_[NODE_WATER_FLOW_ON_DID_SCROLL] = onDidScrollCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_WATER_FLOW_ON_DID_SCROLL, PARAM_0, nullptr);
}
void GridComponent::SetOnReachStart(OnReachStart onReachStart)
{
    auto onReachStartCallback = [onReachStart](ArkUI_NodeEvent*) {
        if (onReachStart) {
            onReachStart();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_REACH_START] = onReachStartCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_REACH_START, PARAM_0, nullptr);
}
void GridComponent::SetScrollTo(float hOffset, float vOffset, const std::vector<int32_t>& optionalParams)
{
    auto value = new ArkUI_NumberValue[2 + static_cast<int32_t>(optionalParams.size())];
    value[0] = { .f32 = hOffset };
    value[1] = { .f32 = vOffset };
    for (int32_t i = 0; i < optionalParams.size(); i++) {
        value[2 + i] = { .i32 = optionalParams[i] };
    }
    ArkUI_AttributeItem item = { value, 2 + static_cast<int32_t>(optionalParams.size()) };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_OFFSET, &item);
}
void GridComponent::SetBackToTop(int32_t isBackToTop)
{
    ArkUI_NumberValue value[] = { { .i32 = isBackToTop } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BACK_TO_TOP, &item);
}
} // namespace ArkUICapiTest