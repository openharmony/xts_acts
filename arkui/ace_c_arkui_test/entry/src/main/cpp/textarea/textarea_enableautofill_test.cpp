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

    static napi_value TestTextAreaEnableAutoFill001(napi_env env, napi_callback_info info)
    {
        NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
        ArkUI_NumberValue value[] = {{.i32 = true}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_ENABLE_AUTO_FILL, &value_item);
        ASSERT_EQ(ret, SUCCESS);
        ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_ENABLE_AUTO_FILL)->value[PARAM_0].i32, true);
        NAPI_END;
    }
    static napi_value TestTextAreaEnableAutoFill002(napi_env env, napi_callback_info info)
    {
        NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
        ArkUI_NumberValue value[] = {{.i32 = false}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_ENABLE_AUTO_FILL, &value_item);
        ASSERT_EQ(ret, SUCCESS);
        ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_ENABLE_AUTO_FILL)->value[PARAM_0].i32, false);
        NAPI_END;
    }
    static napi_value TestTextAreaEnableAutoFill003(napi_env env, napi_callback_info info)
    {
        NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
        ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_ENABLE_AUTO_FILL)->value[PARAM_0].i32, true);
        NAPI_END;
    }
    static napi_value TestTextAreaEnableAutoFill004(napi_env env, napi_callback_info info)
    {
        NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
        ArkUI_NumberValue value[] = { { .i32 = false } };
        ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
        auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_ENABLE_AUTO_FILL, &value_item);
        ASSERT_EQ(ret, SUCCESS);
        nodeAPI->resetAttribute(textArea, NODE_TEXT_AREA_ENABLE_AUTO_FILL);
        ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_ENABLE_AUTO_FILL)->value[PARAM_0].i32, true);
        NAPI_END;
    }
}