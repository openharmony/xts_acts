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

#define DEFAULT_TEXT "textinput"
namespace ArkUICapiTest {

static napi_value TestTextInputWordBreak001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_WORD_BREAK_NORMAL } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.string = DEFAULT_TEXT;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK)->value[PARAM_0].i32, ARKUI_WORD_BREAK_NORMAL);
    NAPI_END;
}
static napi_value TestTextInputWordBreak002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_WORD_BREAK_BREAK_ALL } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.string = DEFAULT_TEXT;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK)->value[PARAM_0].i32, ARKUI_WORD_BREAK_BREAK_ALL);
    NAPI_END;
}
static napi_value TestTextInputWordBreak003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_WORD_BREAK_BREAK_WORD } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.string = DEFAULT_TEXT;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK)->value[PARAM_0].i32, ARKUI_WORD_BREAK_BREAK_WORD);
    NAPI_END;
}
static napi_value TestTextInputWordBreak004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = -1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.string = DEFAULT_TEXT;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK)->value[PARAM_0].i32, ARKUI_WORD_BREAK_BREAK_WORD);
    NAPI_END;
}
static napi_value TestTextInputWordBreak005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = 3 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.string = DEFAULT_TEXT;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK)->value[PARAM_0].i32, ARKUI_WORD_BREAK_BREAK_WORD);
    NAPI_END;
}
static napi_value TestTextInputWordBreak006(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_WORD_BREAK_BREAK_ALL } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.string = DEFAULT_TEXT;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    nodeAPI->resetAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_WORD_BREAK)->value[PARAM_0].i32, ARKUI_WORD_BREAK_BREAK_WORD);
    NAPI_END;
}
} // namespace ArkUICapiTest