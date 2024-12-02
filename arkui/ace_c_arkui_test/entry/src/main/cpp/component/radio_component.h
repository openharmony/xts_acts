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

#ifndef ARKUI_CAPI_DEMO_RADIO_COMPONENT_H
#define ARKUI_CAPI_DEMO_RADIO_COMPONENT_H

#include <cassert>
#include <cstdint>
#include <string>

#include "component.h"

namespace ArkUICapiTest {
class RadioComponent : public Component {
public:
    explicit RadioComponent() : Component(ARKUI_NODE_RADIO) {}
    explicit RadioComponent(ArkUI_NodeHandle handle) : Component(handle) {}

    void SetChecked(const bool& isChecked);
    void SetGroup(const std::string& group);
    void SetStyled(const uint32_t* colorArray, size_t size);
    void SetValue(const std::string& value);
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_DEMO_RADIO_COMPONENT_H