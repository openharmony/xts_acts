//
// Created on 2024/12/3.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef OH_ACCESSIBILITYDEMO_ACCESSIBILITYMANAGER_H
#define OH_ACCESSIBILITYDEMO_ACCESSIBILITYMANAGER_H

#include <ace/xcomponent/native_interface_xcomponent.h>

namespace NativeXComponentSample 
{

class AccessibilityManager {
public:
    AccessibilityManager();
    void Initialize(const std::string &id, OH_NativeXComponent* nativeXComponent);
    
public:
    static int32_t FindAccessibilityNodeInfosById(const char* instanceId, int64_t elementId, ArkUI_AccessibilitySearchMode mode,
        int32_t requestId, ArkUI_AccessibilityElementInfoList* elementList);
    
    static int32_t FindAccessibilityNodeInfosByText(const char* instanceId, int64_t elementId, const char* text, int32_t requestId,
        ArkUI_AccessibilityElementInfoList* elementList);
    
    static int32_t FindFocusedAccessibilityNode(const char* instanceId, int64_t elementId, ArkUI_AccessibilityFocusType focusType,
        int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo);
    
    static int32_t FindNextFocusAccessibilityNode(const char* instanceId, int64_t elementId, ArkUI_AccessibilityFocusMoveDirection direction,
        int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo);
    
    static int32_t ExecuteAccessibilityAction(const char* instanceId, int64_t elementId, ArkUI_Accessibility_ActionType action,
        ArkUI_AccessibilityActionArguments *actionArguments, int32_t requestId);
    
    static int32_t ClearFocusedFocusAccessibilityNode(const char* instanceId);
    
    static int32_t GetAccessibilityNodeCursorPosition(const char* instanceId, int64_t elementId, int32_t requestId, int32_t* index);
   
private:
    static void SendAccessibilityAsyncEvent(ArkUI_AccessibilityElementInfo *elementInfo, ArkUI_AccessibilityEventType eventType);
private:
    ArkUI_AccessibilityProvider* provider = nullptr;
    ArkUI_AccessibilityProviderCallbacks accessibilityProviderCallbacks_;
    ArkUI_AccessibilityProviderCallbacksWithInstance accessibilityProviderCallbacksWithInstance_;
};
}
#endif //OH_ACCESSIBILITYDEMO_ACCESSIBILITYMANAGER_H
