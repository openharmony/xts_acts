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

 #include "button_gettype_test.h"
 #include "../manager/plugin_manager.h"
 #include <string>
 
 namespace ArkUICapiTest
 {
     ArkUI_NodeHandle text1 = nullptr;
     static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
     {
         auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);
 
         ArkUI_NumberValue enable_value[] = {{.i32 = enabled}};
         ArkUI_AttributeItem enable_item = {enable_value, sizeof(enable_value) / sizeof(ArkUI_NumberValue)};
         nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enable_item);
 
         ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
         ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
         nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
         nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);
 
         ArkUI_AttributeItem LABEL_Item = {.string = "gettype"};
         nodeAPI->setAttribute(nodeHandle, NODE_BUTTON_LABEL, &LABEL_Item);
 
         ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
         ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
         nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);
 
         nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_KEY_EVENT, 1, nullptr);
 
         return nodeHandle;
     }
 
     static void OnEventReceive(ArkUI_NodeEvent *event)
     {
         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive");
         if (event == nullptr)
         {
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive: event is null");
             return;
         }
 
         int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive eventId: %{public}d",
                      eventId);
 
         ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
         OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
         auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
         auto uiEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
         int32_t type = OH_ArkUI_UIInputEvent_GetType(uiEvent);

         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OH_ArkUI_UIInputEvent_GetType: %{public}d",
                      type);
 
         if (eventId == 1 && type == 4)
         {
         auto isText_ = "successed";
         ArkUI_AttributeItem item1 = {.string = isText_};
         nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &item1);
         }
     }
 
     napi_value ButtonGetTypeTest::CreateNativeNode(napi_env env, napi_callback_info info)
     {
         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverEventTest", "CreateNativeNode");
 
         size_t argc = PARAM_1;
         napi_value args[PARAM_1] = {nullptr};
         napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
         size_t length = PARAM_64;
         size_t strLength = PARAM_0;
         char xComponentID[PARAM_64] = {PARAM_0};
         napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
 
         if ((env == nullptr) || (info == nullptr))
         {
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverEventTest",
                          "GetContext env or info is null");
             return nullptr;
         }
 
         ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
         OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
         auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
         auto button = createChildNode(nodeAPI, true);
         text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);

         ArkUI_AttributeItem item1 = {.string = "gettype"};
         nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &item1);
     
         ArkUI_AttributeItem id_item = {};
         id_item.string = "gettype";
         nodeAPI->setAttribute(text1, NODE_ID, &id_item);
 
         nodeAPI->addChild(column, button);
         nodeAPI->addChild(column, text1);
 
         nodeAPI->registerNodeEventReceiver(&OnEventReceive);
 
         std::string id(xComponentID);
         if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) == INVALID_PARAM)
         {
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverEventTest",
                          "OH_NativeXComponent_AttachNativeRootNode failed");
         }
 
         napi_value exports;
         if (napi_create_object(env, &exports) != napi_ok)
         {
             napi_throw_type_error(env, nullptr, "napi_create_object failed");
             return nullptr;
         }
 
         return exports;
     }
 } // namespace ArkUICapiTest