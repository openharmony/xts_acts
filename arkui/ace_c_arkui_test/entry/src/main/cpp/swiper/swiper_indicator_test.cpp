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

static napi_value TestSwiperIndicator001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t indicator = 0;
    ArkUI_NumberValue value[] = {{.i32 = indicator}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR)->value[PARAM_0].i32, indicator);
    NAPI_END;
}

static napi_value TestSwiperIndicator002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t indicator = 1;
    ArkUI_NumberValue value[] = {{.i32 = indicator}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR)->value[PARAM_0].i32, indicator);
    NAPI_END;
}

static napi_value TestSwiperIndicator003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t indicator = -1;
    ArkUI_NumberValue value[] = {{.i32 = indicator}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR)->value[PARAM_0].i32, indicator);
    }
    NAPI_END;
}

static napi_value TestSwiperIndicator004(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    OH_ArkUI_SwiperIndicator_SetStartPosition(indicator, 5);
    OH_ArkUI_SwiperIndicator_SetTopPosition(indicator, 5);
    OH_ArkUI_SwiperIndicator_SetEndPosition(indicator, 5);
    OH_ArkUI_SwiperIndicator_SetBottomPosition(indicator, 5);

    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetStartPosition(indicator), 5);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetTopPosition(indicator), 5);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetEndPosition(indicator), 5);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetBottomPosition(indicator), 5);
    
    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

static napi_value TestSwiperIndicator005(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);

    OH_ArkUI_SwiperIndicator_SetItemWidth(indicator, 10);
    OH_ArkUI_SwiperIndicator_SetItemHeight(indicator, 20);

    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetItemWidth(indicator), 10);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetItemHeight(indicator), 20);

    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

static napi_value TestSwiperIndicator006(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    
    OH_ArkUI_SwiperIndicator_SetSelectedItemWidth(indicator, 10);
    OH_ArkUI_SwiperIndicator_SetSelectedItemHeight(indicator, 20);
    
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetSelectedItemWidth(indicator), 10);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetSelectedItemHeight(indicator), 20);

    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

static napi_value TestSwiperIndicator007(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);

    OH_ArkUI_SwiperIndicator_SetMask(indicator, 1);
    OH_ArkUI_SwiperIndicator_SetColor(indicator, 0xFFFFFF00);
    OH_ArkUI_SwiperIndicator_SetSelectedColor(indicator, 0xFF0000FF);

    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetMask(indicator), 1);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetColor(indicator), 0xFFFFFF00);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetSelectedColor(indicator), 0xFF0000FF);
    
    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

} // namespace ArkUICapiTest
