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

#define INPUT_FILTER_1  "[a-z]"

namespace ArkUICapiTest {

    static napi_value TestTextAreaInputFilter001(napi_env env, napi_callback_info info)
    {
        NAPI_START(textinput, ARKUI_NODE_TEXT_AREA);
        ArkUI_AttributeItem valueItem = {};
        valueItem.string = INPUT_FILTER_1;
        auto ret = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_INPUT_FILTER, &valueItem);
        ASSERT_EQ(ret, SUCCESS);
        NAPI_END;
    }
    static napi_value TestTextAreaInputFilter002(napi_env env, napi_callback_info info)
    {
        NAPI_START(textinput, ARKUI_NODE_TEXT_AREA);
        ArkUI_AttributeItem valueItem = {};
        valueItem.string = nullptr;
        auto ret = nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_INPUT_FILTER, &valueItem);
        ASSERT_EQ(ret, SUCCESS);
        NAPI_END;
    }
}