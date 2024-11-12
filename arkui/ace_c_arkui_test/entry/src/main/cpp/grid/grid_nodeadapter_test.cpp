/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance rotate the License.
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

static napi_value TestGridNodeAdapter001(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    OH_ArkUI_NodeAdapter_SetTotalNodeCount(adapter, PARAM_1000);
    auto res = OH_ArkUI_NodeAdapter_GetTotalNodeCount(adapter);
    ASSERT_EQ(res, PARAM_1000);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    ASSERT_EQ(res, PARAM_1000);

    NAPI_END;
}

static napi_value TestGridNodeAdapter002(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    auto ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nullptr, [](ArkUI_NodeAdapterEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestGridNodeAdapter", "nodeadapter event callback func");
    });
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NodeAdapter_UnregisterEventReceiver(adapter);
    OH_ArkUI_NodeAdapter_Dispose(adapter);

    NAPI_END;
}

struct UserCallback1 {
    std::function<void(void *event)> callback;
};

napi_value static TestGridNodeAdapter003(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    struct UserCallback1* adapterCallback = new UserCallback1();
    adapterCallback->callback = [&](void* event) {
        auto* adapterEvent = reinterpret_cast<ArkUI_NodeAdapterEvent*>(event);
        auto type = OH_ArkUI_NodeAdapterEvent_GetType(adapterEvent);
        switch (type) {
            case NODE_ADAPTER_EVENT_WILL_ATTACH_TO_NODE: {
                int32_t retInner =
                    OH_ArkUI_NodeAdapter_InsertItem(adapter, PARAM_0, PARAM_10);
                retInner = OH_ArkUI_NodeAdapter_MoveItem(adapter, PARAM_1, PARAM_2);
                retInner = OH_ArkUI_NodeAdapter_ReloadAllItems(adapter);
                retInner = OH_ArkUI_NodeAdapter_ReloadItem(adapter, PARAM_0, PARAM_10);
                retInner = OH_ArkUI_NodeAdapter_RemoveItem(adapter, PARAM_0, PARAM_10);
                ArkUI_NodeHandle** items = nullptr;
                uint32_t retSize;
                retInner = OH_ArkUI_NodeAdapter_GetAllItems(adapter, items, &retSize);
                break;}
            default:
                break;
        }
    };
    int32_t ret =
        OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, adapterCallback, [](ArkUI_NodeAdapterEvent* event) {
            OH_LOG_Print(
                LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestGridNodeAdapter", "nodeadapter event callback func");
            auto* userData = reinterpret_cast<UserCallback1*>(OH_ArkUI_NodeAdapterEvent_GetUserData(event));
            userData->callback(event);
        });
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_AttributeItem item { nullptr, 0, nullptr, adapter };
    ret = nodeAPI->setAttribute(grid, NODE_GRID_NODE_ADAPTER, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

}  // namespace ArkUICapiTest
