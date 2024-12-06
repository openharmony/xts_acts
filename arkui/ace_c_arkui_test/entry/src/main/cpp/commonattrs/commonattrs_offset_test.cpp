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

static napi_value TestCommonAttrsOffset001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float offsetx = 20.0;
    float offsety = 20.0;
    ArkUI_NumberValue value[] = {{.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OFFSET, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_0].f32, offsetx);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_1].f32, offsety);
    NAPI_END;
}

static napi_value TestCommonAttrsOffset002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float offsetx = PARAM_NEGATIVE_20;
    float offsety = PARAM_NEGATIVE_20;
    ArkUI_NumberValue value[] = {{.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OFFSET, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_0].f32, offsetx);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_1].f32, offsety);
    NAPI_END;
}

static napi_value TestCommonAttrsOffset003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float offsetx = PARAM_0;
    float offsety = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OFFSET, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_0].f32, offsetx);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_1].f32, offsety);
    NAPI_END;
}

static napi_value TestCommonAttrsOffset004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float offsetx = PARAM_300;
    float offsety = PARAM_800;
    ArkUI_NumberValue value[] = {{.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OFFSET, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_0].f32, offsetx);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_1].f32, offsety);
    NAPI_END;
}

static napi_value TestCommonAttrsOffset005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float offsetx = PARAM_NEGATIVE_50_POINT_5;
    float offsety = PARAM_NEGATIVE_50_POINT_5;
    ArkUI_NumberValue value[] = {{}, {}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OFFSET, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_1].f32, PARAM_0);
    NAPI_END;
}

static napi_value TestCommonAttrsOffset006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float offsetx = PARAM_300;
    float offsety = PARAM_800;
    ArkUI_NumberValue value[] = {{.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_OFFSET, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_OFFSET);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OFFSET)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUICapiTest
