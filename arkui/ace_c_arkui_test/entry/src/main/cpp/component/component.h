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

#ifndef ARKUI_CAPI_DEMO_COMPONENT_H
#define ARKUI_CAPI_DEMO_COMPONENT_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <cassert>
#include <cstdint>
#include <list>

#include "common/common.h"

namespace ArkUICapiTest {

class Component {
public:
    explicit Component(ArkUI_NodeType type);
    explicit Component(ArkUI_NodeHandle handle);
    virtual ~Component() = default;

    int32_t setAttribute(ArkUI_NodeAttributeType attribute, const ArkUI_AttributeItem* item);
    const ArkUI_AttributeItem* getAttribute(ArkUI_NodeAttributeType attribute);
    int32_t resetAttribute(ArkUI_NodeAttributeType attribute);

    void SetWidth(float width);
    void SetPercentWidth(float percent);
    void SetHeight(float height);
    void SetPercentHeight(float percent);
    void SetBackgroundColor(uint32_t color);
    void SetBackgroundImage(const std::string& backgroundImage);
    void SetBackgroundImageSizeWithStyle(int32_t imageSize);
    void SetBorderRadius(float topLeft, float topRight, float bottomLeft, float bottomRight);
    void SetPadding(float top, float right, float bottom, float left);
    void SetPaddingPercent(float top, float right, float bottom, float left);
    void SetMargin(float top, float right, float bottom, float left);
    void SetMargin(float margin);
    void SetMarginPercent(float top, float right, float bottom, float left);
    void SetEnabled(int32_t enable);
    void SetAlign(int32_t align);
    void SetAlignRules(ArkUI_AlignmentRuleOption* option);
    void SetAlignSelf(int32_t value);
    void SetOpacity(float opacity);
    void SetBorderWidth(float top, float right, float bottom, float left);
    void SetBorderWidth(float borderWidth);
    void SetBorderColor(uint32_t top, uint32_t right, uint32_t bottom, uint32_t left);
    void SetBorderStyle(int32_t top, int32_t right, int32_t bottom, int32_t left);
    void SetVisibility(int32_t visibility);
    virtual void SetFontSize(float fontSize);
    void SetId(const std::string& id);
    void AddChild(const std::shared_ptr<Component>& child);
    void RemoveChild(const std::shared_ptr<Component>& child);
    void RemoveAll();
    void InsertChild(const std::shared_ptr<Component>& child, int32_t index);
    std::list<std::shared_ptr<Component>> GetChildren()
    {
        return children_;
    }
    std::shared_ptr<Component> GetPreviousSibling();
    std::shared_ptr<Component> GetNextSibling();

    ArkUI_NodeHandle GetComponent()
    {
        return _component;
    }

    void RegisterOnClick(const std::function<void()>& onClick)
    {
        onClick_ = onClick;
        _nodeAPI->registerNodeEvent(_component, NODE_ON_CLICK, 0, nullptr);
    }

    void RegisterOnTouch(const std::function<void(ArkUI_NodeEvent* event)>& onTouch)
    {
        onTouch_ = onTouch;
        _nodeAPI->registerNodeEvent(_component, NODE_TOUCH_EVENT, 0, nullptr);
    }

    void RegisterOnDisappear(const std::function<void()>& onDisappear)
    {
        onDisappear_ = onDisappear;
        _nodeAPI->registerNodeEvent(_component, NODE_EVENT_ON_DISAPPEAR, 0, nullptr);
    }

    void RegisterOnAppear(const std::function<void()>& onAppear)
    {
        onAppear_ = onAppear;
        _nodeAPI->registerNodeEvent(_component, NODE_EVENT_ON_APPEAR, 0, nullptr);
    }
    void RegisterOnHover(const std::function<void(bool isHover)>& onHover)
    {
        onHover_ = onHover;
        _nodeAPI->registerNodeEvent(_component, NODE_ON_HOVER, 0, nullptr);
    }
    void RegisterOnMouse(const std::function<void(ArkUI_NodeEvent* event)>& onMouse)
    {
        onMouse_ = onMouse;
        _nodeAPI->registerNodeEvent(_component, NODE_ON_MOUSE, 0, nullptr);
    }
    void RegisterOnTouchIntercept(const std::function<void(ArkUI_NodeEvent* event)>& onTouchIntercept)
    {
        onTouchIntercept_ = onTouchIntercept;
        _nodeAPI->registerNodeEvent(_component, NODE_ON_TOUCH_INTERCEPT, 0, nullptr);
    }
    void RegisterOnFocus(const std::function<void()>& onFocus)
    {
        onFocus_ = onFocus;
        _nodeAPI->registerNodeEvent(_component, NODE_ON_FOCUS, 0, nullptr);
    }
    void RegisterOnVisibleAreaChange(
        const std::function<void(bool isVisible, float ratio)>& onVisibleAreaChange, std::vector<float> ratioArray);

    static void NodeEventReceiver(ArkUI_NodeEvent* event);
    void ProcessNodeEvent(ArkUI_NodeEvent* event);
    void ProcessNodeEventByType(ArkUI_NodeEventType eventType);
    virtual void OnNodeEvent(ArkUI_NodeEvent* event) {}

protected:
    void OnAddChild(const std::shared_ptr<Component>& child)
    {
        _nodeAPI->addChild(_component, child->GetComponent());
    }
    void OnRemoveChild(const std::shared_ptr<Component>& child)
    {
        _nodeAPI->removeChild(_component, child->GetComponent());
    }
    void OnRemoveAll()
    {
        _nodeAPI->removeAllChildren(_component);
    }
    void OnInsertChild(const std::shared_ptr<Component>& child, int32_t index)
    {
        _nodeAPI->insertChildAt(_component, child->GetComponent(), index);
    }

protected:
    std::list<std::shared_ptr<Component>> children_;
    ArkUI_NodeHandle _component { nullptr };
    ArkUI_NativeNodeAPI_1* _nodeAPI { nullptr };

private:
    std::function<void()> onClick_;
    std::function<void()> onDisappear_;
    std::function<void()> onAppear_;
    std::function<void(ArkUI_NodeEvent* event)> onTouch_;
    std::function<void(bool isHover)> onHover_;
    std::function<void(bool isVisible, float ratio)> onVisibleAreaChange_;
    std::function<void(ArkUI_NodeEvent* event)> onMouse_;
    std::function<void(ArkUI_NodeEvent* event)> onTouchIntercept_;
    std::function<void()> onFocus_;
};
} // namespace ArkUICapiTest

#endif // ARKUI_CAPI_DEMO_COMPONENT_H
