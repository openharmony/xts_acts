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

#include <arkui/native_interface.h>

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"

namespace ArkUICapiTest {
using namespace std;
#define SIZE_1000 1000

static auto SetFooter(ArkUI_NodeHandle list, ArkUI_NodeHandle footer)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_AttributeItem item = {};
    item.object = footer;
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_ITEM_GROUP_SET_FOOTER, &item);
    return ret;
}

static auto CreateGroupWithFooter(ArkUI_NodeHandle list)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto group = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM_GROUP);
    auto item1 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item2 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item3 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item4 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item5 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    nodeAPI->addChild(list, group);
    nodeAPI->addChild(group, item1);
    nodeAPI->addChild(group, item2);
    nodeAPI->addChild(group, item3);
    nodeAPI->addChild(group, item4);
    nodeAPI->addChild(group, item5);
    return group;
}

static napi_value TestListItemGroupSetFooter001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto group = CreateGroupWithFooter(list);
    auto footer = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto ret = SetFooter(group, footer);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestListItemGroupSetFooter002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto group = CreateGroupWithFooter(list);
    auto footer = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    footer = nullptr;
    auto ret = SetFooter(group, footer);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestListItemGroupSetFooter003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto group = CreateGroupWithFooter(list);
    auto ret = nodeAPI->resetAttribute(group, NODE_LIST_ITEM_GROUP_SET_FOOTER);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUICapiTest