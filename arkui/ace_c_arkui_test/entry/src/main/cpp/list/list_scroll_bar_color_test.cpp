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
#include <arkui/native_interface.h>

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"

namespace ArkUICapiTest {
static napi_value TestListScrollBarColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    uint32_t color = COLOR_YELLOW;

    ArkUI_NumberValue value[] = { { .u32 = color } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_BAR_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_COLOR)->value[PARAM_0].u32, COLOR_YELLOW);
    NAPI_END;
}

static napi_value TestListScrollBarColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    uint32_t color = COLOR_RED;

    ArkUI_NumberValue value[] = { { .u32 = color } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_BAR_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_COLOR)->value[PARAM_0].u32, COLOR_RED);
    NAPI_END;
}

static napi_value TestListScrollBarColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);

    auto ret = nodeAPI->resetAttribute(list, NODE_SCROLL_BAR_COLOR);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_COLOR)->value[PARAM_0].u32, COLOR_BLACK);
    NAPI_END;
}
} // namespace ArkUICapiTest