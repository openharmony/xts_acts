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

#include "response_configupdate_test.h"

#include <string>

#include "../manager/plugin_manager.h"
static ArkUI_NodeHandle button = nullptr;
namespace ArkUICapiTest {
static void onColorModeChange(ArkUI_SystemColorMode colorMode, void* userData)
{
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ResponseConfigUpdateTest", "ResponseConfigUpdateTest onColorModeChange");
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (colorMode == ARKUI_SYSTEM_COLOR_MODE_DARK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ResponseConfigUpdateTest",
            "ResponseConfigUpdateTest ARKUI_SYSTEM_COLOR_MODE_DARK");
        ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &color_item);
    }
}
static auto CreateChildWithBlurStyle(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    float width = 200;
    float height = 200;
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue widthValue[] = { { .f32 = width } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = { { .f32 = height } };
    ArkUI_AttributeItem heightItem = { heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_HEIGHT, &heightItem);

    ArkUI_AttributeItem item = {};
    item.string = "resource://media/icon.png";
    nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &item);

    ArkUI_NumberValue styleValue[] = { { .i32 = ARKUI_IMAGE_SIZE_COVER } };
    ArkUI_AttributeItem styleItem = { styleValue, sizeof(styleValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &styleItem);

    ArkUI_NumberValue blurStyleValue[] = { { .i32 = ARKUI_BLUR_STYLE_THIN }, { .i32 = ARKUI_SYSTEM_COLOR_MODE_LIGHT },
        { .i32 = ARKUI_COLOR_MODE_SYSTEM }, { .i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT }, { .f32 = 0.8 }, { .f32 = 0 },
        { .f32 = 127 } };
    ArkUI_AttributeItem blurStyleItem = { blurStyleValue, sizeof(blurStyleValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &blurStyleItem);

    return column;
}
static auto CreateButton(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue widthValue[] = { { .f32 = 100 } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = { { .f32 = 100 } };
    ArkUI_AttributeItem heightItem = { heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button, NODE_HEIGHT, &heightItem);

    ArkUI_NumberValue marginValue[] = { { .f32 = 20 } };
    ArkUI_AttributeItem marginItem = { marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button, NODE_MARGIN, &marginItem);

    ArkUI_NumberValue colorValue[] = { { .u32 = COLOR_YELLOW } };
    ArkUI_AttributeItem colorItem = { colorValue, sizeof(colorValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &colorItem);

    ArkUI_AttributeItem idItem = {};
    idItem.string = "ResponseConfigUpdateButton";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    return button;
}
napi_value ResponseConfigUpdateTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ResponseConfigUpdateTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ResponseConfigUpdateTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto parentColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto column = CreateChildWithBlurStyle(nodeAPI);
    nodeAPI->addChild(parentColumn, column);
    button = CreateButton(nodeAPI);
    nodeAPI->addChild(parentColumn, button);

    OH_ArkUI_RegisterSystemColorModeChangeEvent(column, nullptr, &onColorModeChange);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ResponseConfigUpdateTest",
            "OH_NativeXComponent_AttachNativeRootNode failed ");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest