/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <GLES2/gl2.h>
#include <IPCKit/ipc_cparcel.h>
#include <ctime>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include "nativewindow.h"
#include "hilog/log.h"

#define SUCCESS 0
#define FAIL (-1)

napi_property_descriptor desc[] = {
    // native window test
    {"testNativeWindowCreateNativeWindowNullptr", nullptr, testNativeWindowCreateNativeWindowNullptr, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowDestroyNativeWindowNullptr", nullptr, testNativeWindowDestroyNativeWindowNullptr, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetSurfaceIdNullptr", nullptr, testNativeWindowGetSurfaceIdNullptr, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowCreateNativeWindowFromSurfaceIdNullptr", nullptr,
        testNativeWindowCreateNativeWindowFromSurfaceIdNullptr, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowCreateNativeWindowFromSurfaceIdNormal", nullptr,
        testNativeWindowCreateNativeWindowFromSurfaceIdNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId", nullptr,
        testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId, nullptr, nullptr, nullptr, napi_default, nullptr},

    {"testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr", nullptr,
        testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr", nullptr,
        testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowDestroyNativeWindowBufferNullptr", nullptr, testNativeWindowDestroyNativeWindowBufferNullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetBufferHandleFromNativeNullptr", nullptr, testNativeWindowGetBufferHandleFromNativeNullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal", nullptr,
        testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch", nullptr,
        testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch, nullptr, nullptr, nullptr, napi_default,
        nullptr},

    {"testNativeWindowNativeWindowRequestBufferNullptr", nullptr, testNativeWindowNativeWindowRequestBufferNullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowAbortBufferNullptr", nullptr, testNativeWindowNativeWindowAbortBufferNullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowRequestAbortBufferNormal", nullptr,
        testNativeWindowNativeWindowRequestAbortBufferNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowRequestAbortBufferAbnormal", nullptr,
        testNativeWindowNativeWindowRequestAbortBufferAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowRequestBufferFenceFdNormal", nullptr,
        testNativeWindowNativeWindowRequestBufferFenceFdNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowRequestBufferFenceFdAbnormal", nullptr,
        testNativeWindowNativeWindowRequestBufferFenceFdAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowRequestAbortBufferMax", nullptr,
        testNativeWindowNativeWindowRequestAbortBufferMax, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowRequestAbortBufferErrorCode", nullptr,
        testNativeWindowNativeWindowRequestAbortBufferErrorCode, nullptr, nullptr, nullptr, napi_default, nullptr},

    {"testNativeWindowWriteToParcelErrptr", nullptr, testNativeWindowWriteToParcelErrptr, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowReadFromParcelErrptr", nullptr, testNativeWindowReadFromParcelErrptr, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowWRParcelNormal", nullptr, testNativeWindowWRParcelNormal, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowWriteToParcelAbNormal", nullptr, testNativeWindowWriteToParcelAbNormal, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowReadFromParcelAbNormal", nullptr, testNativeWindowReadFromParcelAbNormal, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowWRParcelDifferent", nullptr, testNativeWindowWRParcelDifferent, nullptr, nullptr, nullptr,
        napi_default, nullptr},

    {"testNativeWindowNativeWindowFlushBufferNullptr", nullptr, testNativeWindowNativeWindowFlushBufferNullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowFlushBufferNormal", nullptr, testNativeWindowNativeWindowFlushBufferNormal,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowFlushBufferAbnormal", nullptr, testNativeWindowNativeWindowFlushBufferAbnormal,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetLastFlushedBufferV2Nullptr", nullptr, testNativeWindowGetLastFlushedBufferV2Nullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetLastFlushedBufferNullptr", nullptr, testNativeWindowGetLastFlushedBufferNullptr, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetLastFlushedBufferV2Normal", nullptr, testNativeWindowGetLastFlushedBufferV2Normal, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetLastFlushedBufferNormal", nullptr, testNativeWindowGetLastFlushedBufferNormal, nullptr,
        nullptr, nullptr, napi_default, nullptr},

    {"testNativeWindowSetBufferHold", nullptr, testNativeWindowSetBufferHold, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowGetNativeObjectMagicNullptr", nullptr, testNativeWindowGetNativeObjectMagicNullptr, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetNativeObjectMagicNormal", nullptr, testNativeWindowGetNativeObjectMagicNormal, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeObjectReferenceNullptr", nullptr, testNativeWindowNativeObjectReferenceNullptr, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeObjectReferenceNormal", nullptr, testNativeWindowNativeObjectReferenceNormal, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeObjectUnreferenceNullptr", nullptr, testNativeWindowNativeObjectUnreferenceNullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeObjectUnreferenceNormal", nullptr, testNativeWindowNativeObjectUnreferenceNormal,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowAttachBufferNullptr", nullptr, testNativeWindowNativeWindowAttachBufferNullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowDetachBufferNullptr", nullptr, testNativeWindowNativeWindowDetachBufferNullptr,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowDetachBufferNormal", nullptr, testNativeWindowNativeWindowDetachBufferNormal,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowAttachBufferErrorCode", nullptr,
        testNativeWindowNativeWindowAttachBufferErrorCode, nullptr, nullptr, nullptr, napi_default, nullptr},

    {"testNativeWindowNativeWindowAttachBufferNormal", nullptr, testNativeWindowNativeWindowAttachBufferNormal,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowDetachBufferErrorCode", nullptr,
        testNativeWindowNativeWindowDetachBufferErrorCode, nullptr, nullptr, nullptr, napi_default, nullptr},

    {"testNativeWindowNativeWindowAtDetachDifferentBufferNormal", nullptr,
        testNativeWindowNativeWindowAtDetachDifferentBufferNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal", nullptr,
        testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptNullptr", nullptr, testNativeWindowNativeWindowHandleOptNullptr, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetFormatNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetFormatNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetUsageNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetUsageNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetStrideNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetStrideNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetTransformNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetTransformNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptGetBufferQueueSize", nullptr,
        testNativeWindowNativeWindowHandleOptGetBufferQueueSize, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal", nullptr,
        testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal, nullptr, nullptr, nullptr, napi_default,
        nullptr},
    {"testNativeWindowNativeWindowSetSetScalingModeV2Nullptr", nullptr,
        testNativeWindowNativeWindowSetSetScalingModeV2Nullptr, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowSetScalingModeV2ScalingMode", nullptr,
        testNativeWindowNativeWindowSetScalingModeV2ScalingMode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetColorSpaceFirst", nullptr, testNativeWindowGetColorSpaceFirst, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowSetColorSpaceNormal", nullptr, testNativeWindowSetColorSpaceNormal, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowSetColorSpaceNullptr", nullptr, testNativeWindowSetColorSpaceNullptr, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowSetColorSpaceAbnormal", nullptr, testNativeWindowSetColorSpaceAbnormal, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowGetMetadataValueFirst", nullptr, testNativeWindowGetMetadataValueFirst, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowSetDynamicMetadataValue", nullptr, testNativeWindowSetDynamicMetadataValue, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowSetMetadataValueTimes", nullptr, testNativeWindowSetMetadataValueTimes, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowSetStaticMetadataValue", nullptr, testNativeWindowSetStaticMetadataValue, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowSetMetadataValue", nullptr, testNativeWindowSetMetadataValue, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"testNativeWindowSetNullMetadataValue", nullptr, testNativeWindowSetNullMetadataValue, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowSetMetadataValueNullptr", nullptr, testNativeWindowSetMetadataValueNullptr, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowGetMetadataValueAbnormal", nullptr, testNativeWindowGetMetadataValueAbnormal, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetMetadataValueNullptr", nullptr, testNativeWindowGetMetadataValueNullptr, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    {"testNativeWindowNativeWindowFlushBufferErrorCode", nullptr, testNativeWindowNativeWindowFlushBufferErrorCode,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"testNativeWindowGetColorSpaceNullptr", nullptr, testNativeWindowGetColorSpaceNullptr, nullptr, nullptr,
        nullptr, napi_default, nullptr}
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativewindow",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); };
