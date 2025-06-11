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
#ifndef ACE_C_ARKUI_TEST_API20_EMBEDDEDCOMPONENTOPTIONTEST_H
#define ACE_C_ARKUI_TEST_API20_EMBEDDEDCOMPONENTOPTIONTEST_H

#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class EmbeddedComponentOptionTest {
public:
    ~EmbeddedComponentOptionTest();
    static napi_value testEmbeddedComponentOption001(napi_env env, napi_callback_info info);
};
} // namespace ArkUICapiTest
#endif //ACE_C_ARKUI_TEST_API20_EMBEDDEDCOMPONENTOPTIONTEST_H