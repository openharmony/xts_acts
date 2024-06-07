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
#include <arkui/native_type.h>

#define NUMBER_0 0
#define VALUE_0 10
#define INVAILE_PARA -1


namespace ArkUICapiTest {

static napi_value TestListChildMainSize001(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_ListChildrenMainSizeOption_Create();
    if(ret == nullptr) {
       NAPI_END;
    }
    napi_value result = nullptr;  
    napi_create_int32(env, 1, &result);                                                                                 
    return result;
    
}

static napi_value TestListChildMainSize002(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(listChildrenMainSize, SIZE_30);
    auto ret = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(listChildrenMainSize);
    ASSERT_EQ(ret, SIZE_30);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static napi_value TestListChildMainSize003(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(listChildrenMainSize,NUMBER_0,VALUE_0);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static napi_value TestListChildMainSize004(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(listChildrenMainSize, INVAILE_PARA);
    ASSERT_EQ(ret, INVAILE_PARA);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static napi_value TestListChildMainSize005(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(listChildrenMainSize, VALUE_0);
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(listChildrenMainSize);
    NAPI_END;
}

static napi_value TestListChildMainSize006(napi_env env, napi_callback_info info)
{
    auto listChildrenMainSize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    int ret = OH_ArkUI_ListChildrenMainSizeOption_Splice(listChildrenMainSize, NUMBER_0, VALUE_0, VALUE_0);
    ASSERT_EQ(ret, NUMBER_0);
    NAPI_END;
}

static napi_value TestListSwipeOption007(napi_env env, napi_callback_info info)
{
    auto listItemSwipeActionOption = OH_ArkUI_ListItemSwipeActionOption_Create();
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionOption_SetStart(listItemSwipeActionOption, listSwipeActionItem);
    OH_ArkUI_ListItemSwipeActionOption_SetEnd(listItemSwipeActionOption, listSwipeActionItem);
    NAPI_END;
}

static napi_value TestListSwipeOption008(napi_env env, napi_callback_info info)
{
    auto listItemSwipeActionOption = OH_ArkUI_ListItemSwipeActionOption_Create();
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    int ret = OH_ArkUI_List_CloseAllSwipeActions(nullptr, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}


} // namespace ArkUICapiTest
