/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ARKUI_CAPI_DEMO_LAZYFOREACH_TEST_H
#define ARKUI_CAPI_DEMO_LAZYFOREACH_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "../common/common.h"
#include "../component/column_component.h"
#include "../component/grid_component.h"
#include "../component/text_component.h"
#include "../component/button_component.h"

namespace ArkUICapiTest {

class LazyForEachTest {
public:
    static napi_value CreateNativeNodeNodeId(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeDispose(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeHostNode(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeGetRemovedNode(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeReloadAllItems(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeGetAllItems(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeReloadItem(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeInsertItem(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeMoveItem(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeRemoveItem(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeGetUserData(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeGetType(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeItemIndex(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeSetItem(napi_env env, napi_callback_info info);

private:
    static void UpdateGridProperty(std::shared_ptr<GridComponent> grid, int32_t size)
    {
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<GridItemComponent>>(input);
        grid->SetWidth(PARAM_325);
        grid->SetHeight(SIZE_200);
        grid->SetBackgroundColor(COLOR_GRAY);
        grid->SetBorderWidth(PARAM_1, PARAM_1, PARAM_1, PARAM_1);
        grid->SetGridColumnsTemplate("1fr 1fr 1fr");
        grid->SetGridRowsGap(PARAM_4);
        grid->SetGridColumnsGap(PARAM_4);
        grid->SetLazyAdapter(adapter);
        grid->SetId("grid");

        for (int i = PARAM_0; i < size; i++) {
            auto col = std::make_shared<ColumnComponent>();
            col->SetWidth(PARAM_100);
            col->SetHeight(PARAM_80);
            col->SetBackgroundColor(COLOR_WHITE);
            col->SetBorderRadius(PARAM_10, PARAM_10, PARAM_10, PARAM_10);
            col->SetBorderWidth(PARAM_1, PARAM_1, PARAM_1, PARAM_1);
            col->SetBorderColor(COLOR_BLACK, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK);
            col->SetId("colItem" + std::to_string(i));
            adapter->InsertItem(i, col);
        }
    }

    template<int32_t size = PARAM_15>
    static std::shared_ptr<ColumnComponent> CreateGrid(std::function<void(std::shared_ptr<GridComponent>)> change)
    {
        auto column = std::make_shared<ColumnComponent>();
        auto grid = std::make_shared<GridComponent>();
        UpdateGridProperty(grid, size);
        column->AddChild(grid);
        if (change) {
            change(grid);
        }
        return column;
    }

    template<int32_t size = PARAM_15, typename... Args>
    static std::shared_ptr<ColumnComponent> CreateGrid(
        std::function<void(std::shared_ptr<GridComponent>, Args...)> change, Args... args)
    {
        auto column = std::make_shared<ColumnComponent>();
        auto grid = std::make_shared<GridComponent>();
        UpdateGridProperty(grid, size);
        column->AddChild(grid);
        if (change) {
            change(grid, args...);
        }
        return column;
    }
};
} // namespace ArkUICApiDemo
#endif // ARKUI_CAPI_DEMO_LAZYFOREACH_TEST_H