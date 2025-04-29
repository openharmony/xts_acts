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

static napi_value TestXComponentHeight001(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    float height = 200;

    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xComponent, NODE_HEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(xComponent, NODE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}

static napi_value TestXComponentHeight002(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    float height = -50;

    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xComponent, NODE_HEIGHT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(xComponent, NODE_HEIGHT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(xComponent, NODE_HEIGHT)->value[PARAM_0].f32, height);
    }
    auto code = OH_ArkUI_XComponent_StartImageAnalyzer(xComponent, nullptr, nullptr);
    auto code_ = OH_ArkUI_XComponent_StopImageAnalyzer(xComponent);
    NAPI_END;
}

static napi_value TestXComponentHeight003(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    float height = 500;

    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xComponent, NODE_HEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(xComponent, NODE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}

} // namespace ArkUICapiTest
