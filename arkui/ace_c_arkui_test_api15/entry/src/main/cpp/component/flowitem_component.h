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

#ifndef ARKUI_CAPI_DEMO_FLOWITEM_COMPONENT_H
#define ARKUI_CAPI_DEMO_FLOWITEM_COMPONENT_H

#include <arkui/native_node.h>
#include <cassert>
#include <stack>
#include <string>
#include <unordered_set>

#include "component.h"

namespace ArkUICapiTest {

class FlowItemComponent : public Component {
public:
    explicit FlowItemComponent() : Component(ARKUI_NODE_FLOW_ITEM) {}
    explicit FlowItemComponent(ArkUI_NodeHandle handle) : Component(handle) {}
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_DEMO_FLOWITEM_COMPONENT_H
