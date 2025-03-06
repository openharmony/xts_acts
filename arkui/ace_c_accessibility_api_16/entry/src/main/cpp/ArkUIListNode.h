/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef MYAPPLICATION_ARKUILISTNODE_H
#define MYAPPLICATION_ARKUILISTNODE_H

#include "ArkUINode.h"

namespace NativeModule {
class ArkUIListNode : public ArkUINode {
public:
    ArkUIListNode()
        : ArkUINode((NativeModuleInstance::GetInstance()->GetNativeNodeAPI())->createNode(ARKUI_NODE_LIST)) {} // 创建ArkUI的列表组件。

    ~ArkUIListNode() override {} 
    // List组件的属性NDK接口封装。
    void SetScrollBarState(bool isShow) {
        assert(handle_);
        ArkUI_ScrollBarDisplayMode displayMode =
            isShow ? ARKUI_SCROLL_BAR_DISPLAY_MODE_ON : ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF;
        ArkUI_NumberValue value[] = {{.i32 = displayMode}};
        ArkUI_AttributeItem item = {value, 1};
        nativeModule_->setAttribute(handle_, NODE_SCROLL_BAR_DISPLAY_MODE, &item);
    }
};
} // namespace NativeModule

#endif // MYAPPLICATION_ARKUILISTNODE_H