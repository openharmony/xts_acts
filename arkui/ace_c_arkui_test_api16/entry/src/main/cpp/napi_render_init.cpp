/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

#include "common/common.h"
#include "manager/plugin_manager.h"
#include "postFrame/post_frame_callback_test.h"
#include "swiper/swiper_test.h"
#include "textArea/textArea_letter_spacing.h"
#include "textpicker/textpicker_columnwidths_test.h"
#include "drag/drag_test.h"
#include "calendarPicker/calendarPicker_date_test.h"
#include "ExpectedFrameRateRange/ExpectedFrameRateRange_callback_test.h"
#include "move/node_util_move_test.h"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"getContext", nullptr, PluginManager::GetContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testPostFrameCallback", nullptr, PostFrameCallbackTest::testPostFrameCallback001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"swiperAutoPlayTest", nullptr, SwiperTest::swiperAutoPlayTest,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textAreaLetterSpacing001", nullptr, TextAreaLetterSpacing::textAreaLetterSpacing001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCalendarPickerDate", nullptr, CalendarPickerStartEndTest::CalendarPickerDateTest,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textInputLetterSpacing002", nullptr, TextAreaLetterSpacing::textInputLetterSpacing002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textPickerColumnWidths", nullptr, TextPickerTest::TextPickerColumnWidths,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDragStartDataLoading001", nullptr, DragTest::TestDragStartDataLoading001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TestDragDisableDropDataPrefetch002", nullptr, DragTest::TestDragDisableDropDataPrefetch002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TestDragCancelDataLoading003", nullptr, DragTest::TestDragCancelDataLoading003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetResult", nullptr, DragTest::GetResult, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testExpectedFrameRateRangeCallback", nullptr, ExpectedFrameRateRangeCallbackTest::testExpectedFrameRateRangeCallback001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testNodeUtilMove001", nullptr, NodeUtilMoveTest::testNodeUtilMove001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }

    PluginManager::GetInstance()->Export(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module nativerenderModule = {.nm_version = 1,
                                         .nm_flags = 0,
                                         .nm_filename = nullptr,
                                         .nm_register_func = Init,
                                         .nm_modname = "nativerender",
                                         .nm_priv = ((void *)0),
                                         .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativerenderModule); }
} // namespace ArkUICapiTest
