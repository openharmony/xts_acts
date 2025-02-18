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
#ifndef PROGRESS_LINEAR_STYLE_TEST_H
#define PROGRESS_LINEAR_STYLE_TEST_H

#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class ProgressLinearStyleTest {
public:
    ~ProgressLinearStyleTest();
    static napi_value ProgressLinearStyleTest001(napi_env env, napi_callback_info info);
private:
    static ProgressLinearStyleTest progressLinearStyleTest_;
};
} // namespace ArkUICapiTest
#endif // PROGRESS_LINEAR_STYLE_TEST_H