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

static napi_value TestTextInputUnderlineColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .u32 = COLOR_GREEN }, { .u32 = COLOR_BLUE }, { .u32 = COLOR_RED },
        { .u32 = COLOR_GRAY } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_UNDERLINE_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_UNDERLINE_COLOR)->value[PARAM_0].u32, COLOR_GREEN);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_UNDERLINE_COLOR)->value[PARAM_1].u32, COLOR_BLUE);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_UNDERLINE_COLOR)->value[PARAM_2].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_UNDERLINE_COLOR)->value[PARAM_3].u32, COLOR_GRAY);
    NAPI_END;
}
static napi_value TestTextInputUnderlineColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .u32 = COLOR_GREEN } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_UNDERLINE_COLOR, &value_item);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest