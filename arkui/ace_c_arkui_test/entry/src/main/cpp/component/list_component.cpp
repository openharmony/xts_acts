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

#include "list_component.h"

namespace ArkUICapiTest {

void ListItemSwipeActionOption::SetStart(ArkUI_ListItemSwipeActionItem* item)
{
    OH_ArkUI_ListItemSwipeActionOption_SetStart(_option, item);
}

void ListItemSwipeActionOption::SetEnd(ArkUI_ListItemSwipeActionItem* item)
{
    OH_ArkUI_ListItemSwipeActionOption_SetEnd(_option, item);
}

void ListItemSwipeActionOption::SetEdgeEffect(ArkUI_ListItemSwipeEdgeEffect edgeEffect)
{
    OH_ArkUI_ListItemSwipeActionOption_SetEdgeEffect(_option, edgeEffect);
}

int32_t ListItemSwipeActionOption::GetEdgeEffect()
{
    return OH_ArkUI_ListItemSwipeActionOption_GetEdgeEffect(_option);
}

void ListItemSwipeActionOption::SetOnOffsetChange(OnOffsetChangeCallback callback)
{
    OH_ArkUI_ListItemSwipeActionOption_SetOnOffsetChange(_option, callback);
}

void ListItemSwipeActionOption::SetOnOffsetChangWithUserData(
    OnOffsetChangeWithUserDataCallback callback, void* userData)
{
    OH_ArkUI_ListItemSwipeActionOption_SetOnOffsetChangeWithUserData(_option, userData, callback);
}

int32_t ListChildrenMainSizeOption::SetDefaultMainSize(float defaultMainSize)
{
    return OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(_option, defaultMainSize);
}

float ListChildrenMainSizeOption::GetDefaultMainSize()
{
    return OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(_option);
}

void ListChildrenMainSizeOption::Resize(int32_t totalSize)
{
    OH_ArkUI_ListChildrenMainSizeOption_Resize(_option, totalSize);
}

int32_t ListChildrenMainSizeOption::Splice(int32_t index, int32_t deleteCount, int32_t addCount)
{
    return OH_ArkUI_ListChildrenMainSizeOption_Splice(_option, index, deleteCount, addCount);
}

int32_t ListChildrenMainSizeOption::UpdateSize(int32_t index, float mainSize)
{
    return OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(_option, index, mainSize);
}

float ListChildrenMainSizeOption::GetMainSize(int32_t index)
{
    return OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(_option, index);
}

void ListItemComponent::SetListItemSwiperAction(ListItemSwipeActionOption* option)
{
    ArkUI_AttributeItem item = { nullptr, 0, nullptr, option->GetOption() };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_SWIPE_ACTION, &item);
}

void ListComponent::SetListDirection(int32_t direction)
{
    ArkUI_NumberValue value[] = { { .i32 = direction } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_DIRECTION, &item);
}

void ListComponent::SetListSticky(int32_t stickyStyle)
{
    ArkUI_NumberValue value[] = { { .i32 = stickyStyle } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_STICKY, &item);
}

void ListComponent::SetListSpace(float space)
{
    ArkUI_NumberValue value[] = { { .f32 = space } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_SPACE, &item);
}

void ListComponent::SetListCachedCount(int32_t count)
{
    ArkUI_NumberValue value[] = { { .i32 = count } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_CACHED_COUNT, &item);
}

void ListComponent::SetListScrollToIndex(const std::vector<ArkUI_NumberValue>& data)
{
    ArkUI_AttributeItem item = { data.data(), static_cast<int32_t>(data.size()) };
    _nodeAPI->setAttribute(_component, NODE_LIST_SCROLL_TO_INDEX, &item);
}

void ListComponent::SetListAlignListItem(int32_t align)
{
    ArkUI_NumberValue value[] = { { .i32 = align } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_ALIGN_LIST_ITEM, &item);
}

void ListComponent::SetListChildrenMainSize(ListChildrenMainSizeOption* mainSize)
{
    ArkUI_AttributeItem item = { .object = mainSize->GetOption() };
    _nodeAPI->setAttribute(_component, NODE_LIST_CHILDREN_MAIN_SIZE, &item);
    _childrenMainSize.reset(mainSize);
}

void ListComponent::SetListInitialIndex(int32_t index)
{
    ArkUI_NumberValue value[] = { { .i32 = index } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_INITIAL_INDEX, &item);
}

void ListComponent::SetListDivider(uint32_t color, float width, float distanceStart, float distanceEnd)
{
    ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = width }, { .f32 = distanceStart },
        { .f32 = distanceEnd } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_LIST_DIVIDER, &item);
}

void ListItemGroupComponent::SetListItemGroupHeader(Component* node)
{
    ArkUI_AttributeItem item = { nullptr, 0, nullptr, node->GetComponent() };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_GROUP_SET_HEADER, &item);
}

void ListItemGroupComponent::SetListItemGroupFooter(Component* node)
{
    ArkUI_AttributeItem item = { nullptr, 0, nullptr, node->GetComponent() };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_GROUP_SET_FOOTER, &item);
}

void ListItemGroupComponent::SetListItemGroupDivider(
    uint32_t color, float width, float distanceStart, float distanceEnd)
{
    ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = width }, { .f32 = distanceStart },
        { .f32 = distanceEnd } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_GROUP_SET_DIVIDER, &item);
}

void ListItemGroupComponent::SetListItemGroupChildrenMainSize(ListChildrenMainSizeOption* mainSize)
{
    ArkUI_AttributeItem item = { .object = mainSize->GetOption() };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_GROUP_CHILDREN_MAIN_SIZE, &item);
    _childrenMainSize.reset(mainSize);
}
} // namespace ArkUICapiTest