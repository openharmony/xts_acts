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
#include "../manager/plugin_manager.h"
#include <arkui/native_node.h>
#include <string>
#include <cstdint>
#include <cstdio>
#include <vector>

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <hilog/log.h>

#include <arkui/native_node_napi.h>
#include <arkui/styled_string.h>
#define STR_TEXT  "<div ><p style=\"text-align: start;word-break: break_word;text-overflow: clip;\"><span style=\"font-size: 40.00px;font-style: normal;font-weight: normal;color: #0000FFFF;font-family: HarmonyOS Sans;\">hello</span></p></div>"
#define SIZE 10
#define LENGTH 175
#define MAX_RESULT_SIZE 10000

namespace ArkUICapiTest {

napi_value testStyledString001(napi_env env, napi_callback_info info)
{
    uint8_t data_bytes[] = {2,1,0,79,0,5,32,5,104,101,108,108,111,88,36,33,0,0,0,0,0,0,68,64,0,89,34,255,0,0,255,90,38,0,91,47,0,92,46,10,93,37,0,94,41,0,95,48,0,96,34,255,0,0,0,97,49,0,98,50,0,99,36,33,0,0,0,0,0,0,0,0,0,100,36,33,0,0,0,0,0,0,0,0,0,101,36,33,0,0,0,0,0,0,0,0,0,102,36,33,0,0,0,0,0,0,0,0,0,103,36,33,0,0,0,0,0,0,0,0,0,104,51,0,105,36,33,0,0,0,0,0,0,0,0,0,106,52,1,107,53,0,109,255,111,36,33,0,0,0,0,0,0,0,0,0,145,55,2,146,56,0,147,57,2,81,1,32,5,104,101,108,108,111,0};
    
    size_t arraySize = LENGTH / sizeof(uint8_t);
    auto *styledStringDescriber = OH_ArkUI_StyledString_Descriptor_Create(); // ArkUI_StyledString_Descriptor {(C++) 属性字符串，html}
    // 反序列化接口，把data_byte信息写到styledStringDescriber。
    auto status = OH_ArkUI_UnmarshallStyledStringDescriptor(data_bytes, arraySize, styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", "UnmarshallingStyledStringDescriber status is %{public}d",status);
    ASSERT_EQ(status, 0);
    // (c++)属性字符串 -> html
    auto html = OH_ArkUI_ConvertToHtml(styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testStyledString001", "html is: %{public}s", html);
    ASSERT_STREQ(html, STR_TEXT);
    // (c++)属性字符串 -> uint8_t,
    size_t resultSize;
    size_t size = SIZE;
    uint8_t *buffer = (uint8_t *)malloc(size * sizeof(uint8_t));
    if (OH_ArkUI_MarshallStyledStringDescriptor(buffer, size, styledStringDescriber, &resultSize) != 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", "resultSize is :[%{public}zu]", resultSize);
        if(resultSize <= 0 || resultSize >= MAX_RESULT_SIZE) {
            return nullptr; 
        }
        uint8_t *buffer2 = (uint8_t *)malloc(resultSize * sizeof(uint8_t));
        size_t resultSize2;
        OH_ArkUI_MarshallStyledStringDescriptor(buffer2, resultSize, styledStringDescriber, &resultSize2);

        // 验证反序列化后的buffer2是否和data_bytes一致。
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001",
                     "序列化前数组长度:[%{public}zu],序列化后数组长度：[%{public}zu]", arraySize, resultSize2);
        ASSERT_EQ(arraySize, resultSize2);
        if (arraySize == resultSize2) {
            bool isAllEqual = true;
            for (size_t i = 0; i < arraySize; i++) {
                if (data_bytes[i] != buffer2[i]) {
                    isAllEqual = false;
                    break;
                }
            }
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", "序列化前后的数组是否完全一致：[%{public}d]",
                         isAllEqual);
        }

        free(buffer);
        free(buffer2);
    }
    OH_ArkUI_StyledString_Descriptor_Destroy(styledStringDescriber);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testStyledString001", "testStyledString001 end succ");
    napi_value result = nullptr;  
    napi_create_int32(env, 0, &result);                                                                                 
    return result;
}

}
