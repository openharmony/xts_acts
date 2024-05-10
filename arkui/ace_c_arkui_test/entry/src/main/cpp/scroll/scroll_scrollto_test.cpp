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

#define SUCCESS 0
#define TIME 1000
#define OFFSET 10
#define ABNORMAL_PARAM 1000
#define DEFAULT 0

namespace ArkUICapiTest {

static napi_value TestScrollScrollTo001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_LINEAR}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_LINEAR);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_EASE}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_EASE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_EASE_IN}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_EASE_IN);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo004(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_EASE_OUT}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_EASE_OUT);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo005(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_EASE_IN_OUT}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_EASE_IN_OUT);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo006(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_FAST_OUT_SLOW_IN}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_FAST_OUT_SLOW_IN);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo007(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_LINEAR_OUT_SLOW_IN}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_LINEAR_OUT_SLOW_IN);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo008(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_FAST_OUT_LINEAR_IN}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_FAST_OUT_LINEAR_IN);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo009(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_EXTREME_DECELERATION}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_EXTREME_DECELERATION);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo010(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_SHARP}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_SHARP);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo011(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_RHYTHM}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_RHYTHM);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo012(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_SMOOTH}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_SMOOTH);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}

static napi_value TestScrollScrollTo013(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.f32 = OFFSET}, {.f32 = OFFSET}, {.i32 = TIME}, {.i32 = ARKUI_CURVE_FRICTION}, {.i32 = DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_3].i32, TIME);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_4].i32, ARKUI_CURVE_FRICTION);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_5].i32, DEFAULT);
    NAPI_END;
}
} // namespace ArkUICapiTest
