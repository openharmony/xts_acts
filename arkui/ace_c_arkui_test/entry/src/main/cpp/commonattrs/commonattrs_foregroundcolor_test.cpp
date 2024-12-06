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

static napi_value TestCommonAttrsForegroundColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    uint32_t color = COLOR_RED;
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_FOREGROUND_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_FOREGROUND_COLOR)->value[PARAM_0].u32, color);
    NAPI_END;
}

static napi_value TestCommonAttrsForegroundColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    uint32_t color = COLOR_WHITE + PARAM_1;
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_FOREGROUND_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsForegroundColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t strategy = ARKUI_COLOR_STRATEGY_INVERT;
    ArkUI_NumberValue value[] = {{.i32 = strategy}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_FOREGROUND_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsForegroundColor004(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t strategy = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = strategy}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_FOREGROUND_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsForegroundColor005(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    uint32_t color = COLOR_RED;
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_FOREGROUND_COLOR, &value_item);
    auto ret = nodeAPI->resetAttribute(button, NODE_FOREGROUND_COLOR);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
