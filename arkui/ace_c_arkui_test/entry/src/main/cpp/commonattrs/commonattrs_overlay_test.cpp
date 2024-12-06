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

static napi_value TestCommonAttrsOverlay001(napi_env env, napi_callback_info info)
{
    const char* text = "Thisisafloatinglayertesttext";
    int32_t alignment = ARKUI_ALIGNMENT_TOP_START;
    float offsetx = 0.0;
    float offsety = PARAM_NEGATIVE_15;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = alignment}, {.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    item.string = text;
    auto ret = nodeAPI->setAttribute(column, NODE_OVERLAY, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_0].i32, alignment);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_1].f32, offsetx);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_2].f32, offsety);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->string, text);
    NAPI_END;
}

static napi_value TestCommonAttrsOverlay002(napi_env env, napi_callback_info info)
{
    const char* text = "Thisisafloatinglayertesttext";
    int32_t alignment = ARKUI_ALIGNMENT_TOP;
    float offsetx = PARAM_30;
    float offsety = PARAM_15;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = alignment}, {.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    item.string = text;
    auto ret = nodeAPI->setAttribute(column, NODE_OVERLAY, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_0].i32, alignment);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_1].f32, offsetx);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_2].f32, offsety);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->string, text);
    NAPI_END;
}

static napi_value TestCommonAttrsOverlay003(napi_env env, napi_callback_info info)
{
    const char* text = "Thisisafloatinglayertesttext";
    int32_t alignment = ARKUI_ALIGNMENT_TOP_END;
    float offsetx = PARAM_30;
    float offsety = PARAM_15;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = alignment}, {.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    item.string = text;
    auto ret = nodeAPI->setAttribute(column, NODE_OVERLAY, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_0].i32, alignment);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_1].f32, offsetx);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_2].f32, offsety);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->string, text);
    NAPI_END;
}

static napi_value TestCommonAttrsOverlay004(napi_env env, napi_callback_info info)
{
    const char* text = "Thisisafloatinglayertesttext";
    int32_t alignment = ARKUI_ALIGNMENT_CENTER;
    float offsetx = PARAM_30;
    float offsety = PARAM_15;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = alignment}, {.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    item.string = text;
    auto ret = nodeAPI->setAttribute(column, NODE_OVERLAY, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_0].i32, alignment);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_1].f32, offsetx);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_2].f32, offsety);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->string, text);
    NAPI_END;
}

static napi_value TestCommonAttrsOverlay005(napi_env env, napi_callback_info info)
{
    const char* text = "Thisisafloatinglayertesttext";
    int32_t alignment = PARAM_NEGATIVE_1;
    float offsetx = PARAM_30;
    float offsety = PARAM_15;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = alignment}, {.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    item.string = text;
    auto ret = nodeAPI->setAttribute(column, NODE_OVERLAY, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsOverlay006(napi_env env, napi_callback_info info)
{
    const char* text = "Thisisafloatinglayertesttext";
    int32_t alignment = PARAM_9;
    float offsetx = PARAM_30;
    float offsety = PARAM_15;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = alignment}, {.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    item.string = text;
    auto ret = nodeAPI->setAttribute(column, NODE_OVERLAY, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsOverlay007(napi_env env, napi_callback_info info)
{
    const char* text = "Thisisafloatinglayertesttext";
    int32_t alignment = ARKUI_ALIGNMENT_TOP;
    float offsetx = PARAM_30;
    float offsety = PARAM_15;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = alignment}, {.f32 = offsetx}, {.f32 = offsety}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    item.string = text;
    nodeAPI->setAttribute(column, NODE_OVERLAY, &item);
    auto ret = nodeAPI->resetAttribute(column, NODE_OVERLAY);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_START);
    NAPI_END;
}

} // namespace ArkUICapiTest