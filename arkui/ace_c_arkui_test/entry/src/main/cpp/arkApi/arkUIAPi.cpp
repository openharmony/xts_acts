/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_type.h>
#define res ((int)-2)
#define res2 ((int)-1)
#define res3 ((int)401)


namespace ArkUICapiTest {

static napi_value testArkUI001(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_SetNeedSoftKeyboard(nullptr, false);
    ASSERT_EQ(ret, res);
    NAPI_END;
}

static napi_value testArkUI002(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterSurfaceShowCallback(nullptr, nullptr);
    ASSERT_EQ(ret, res);
    NAPI_END;
}

static napi_value testArkUI003(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterSurfaceHideCallback(nullptr, nullptr);
    ASSERT_EQ(ret, res);
    NAPI_END;
}

static napi_value testArkUI004(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterOnTouchInterceptCallback (nullptr, nullptr);
    ASSERT_EQ(ret, res3);
    NAPI_END;
}

static napi_value testArkUI005(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_GetTouchEventSourceType (nullptr, -1, nullptr);
    ASSERT_EQ(ret, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);
    NAPI_END;
}


static napi_value testArkUI006(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_LayoutConstraint_Copy(nullptr);
    if (ret == nullptr) {
        NAPI_END;
    }
}

static napi_value testArkUI007(napi_env env, napi_callback_info info) {
    auto layoutContraint = OH_ArkUI_LayoutConstraint_Create();
    auto disposeValue = OH_ArkUI_LayoutConstraint_Dispose(layoutContraint);
    auto copyValue = OH_ArkUI_LayoutConstraint_Copy(nullptr);
    if (copyValue == nullptr) {
        NAPI_END;
    }
}

static napi_value testArkUI008(napi_env env, napi_callback_info info) {
    auto layoutContraint = OH_ArkUI_LayoutConstraint_Create();
    auto copyValue = OH_ArkUI_LayoutConstraint_Copy(layoutContraint);
    auto disposeValue = OH_ArkUI_LayoutConstraint_Dispose(nullptr);
    if (disposeValue == nullptr) {
        NAPI_END;
    }
}

static napi_value testArkUI009(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure(nullptr);
    if (ret == nullptr) {
        NAPI_END;
    } else {
        return nullptr;
    }
}

static napi_value testArkUI010(napi_env env, napi_callback_info info) {
    auto getPosition = OH_ArkUI_NodeCustomEvent_GetPositionInLayout(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","CreateNativeNode yc-state %{public}f", getPosition);
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);                                                                                 
    return result;
}

static napi_value testArkUI011(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw(nullptr);
    if (ret == nullptr) {
        NAPI_END;
    } else {
        return nullptr;
    }
}

static napi_value testArkUI012(napi_env env, napi_callback_info info) {
    auto guide = OH_ArkUI_GuidelineOption_Create(0);
    OH_ArkUI_GuidelineOption_SetId(guide, "guide", 0);
    auto getId = OH_ArkUI_GuidelineOption_GetId(guide, 0);
    if (getId == nullptr) {
        NAPI_END;
    }
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value testArkUI013(napi_env env, napi_callback_info info) {
    auto guide = OH_ArkUI_GuidelineOption_Create(0);
    OH_ArkUI_GuidelineOption_SetDirection(guide, ARKUI_AXIS_HORIZONTAL, 0);
    auto getDirection =  OH_ArkUI_GuidelineOption_GetDirection(guide, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","CreateNativeNode yc-state %{public}f", getDirection);
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    ASSERT_EQ(getDirection, res2);
    NAPI_END;
}

static napi_value testArkUI014(napi_env env, napi_callback_info info) {
    auto guide = OH_ArkUI_GuidelineOption_Create(0);
    OH_ArkUI_GuidelineOption_SetPositionStart(guide, 0.0f, 0);
    auto getPositionStart = OH_ArkUI_GuidelineOption_GetPositionStart(guide, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","CreateNativeNode yc-state %{public}f", getPositionStart);
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    ASSERT_EQ(getPositionStart, 0.0f);
    NAPI_END;
}

static napi_value testArkUI015(napi_env env, napi_callback_info info) {
    auto guide = OH_ArkUI_GuidelineOption_Create(0);
    OH_ArkUI_GuidelineOption_SetPositionEnd(guide, 0.0f, 0);
    auto getPositionEnd = OH_ArkUI_GuidelineOption_GetPositionEnd(guide, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","CreateNativeNode yc-state %{public}f", getPositionEnd);
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    ASSERT_EQ(getPositionEnd, 0.0f);
    OH_ArkUI_GuidelineOption_Dispose(guide);
    NAPI_END;
}

} // namespace ArkUICapiTest
