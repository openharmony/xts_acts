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

#include "napi/native_api.h"
#include "udmf.h"
#include "udmf_err_code.h"
#include <bits/alltypes.h>
#include <iostream>
#include <string>
#include "udmf_meta.h"
#include "uds.h"
#include "utd.h"
#define LOG_TAG "UDMFUtdTest"
#define PARAM_0 0
#define PARAM_1 1

static napi_value OH_Utd_Create_0001(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ENTITY);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.entity") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0002(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OBJECT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.object") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0003(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_COMPOSITE_OBJECT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.composite-object") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0004(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TEXT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.text") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0005(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.plain-text") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0006(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_HTML);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.html") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0007(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_HYPERLINK);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.hyperlink")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0008(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_XML);
    const char*  result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.xml") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0009(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SOURCE_CODE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.source-code") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0010(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0011(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SHELL_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.shell-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0012(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_CSH_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.csh-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0013(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PERL_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.perl-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0014(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PHP_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.php-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0015(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PYTHON_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.python-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0017(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_RUBY_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.ruby-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0018(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TYPE_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.type-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0019(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_JAVA_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.java-script")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0020(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_C_HEADER);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.c-header")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0021(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_C_SOURCE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.c-source") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0022(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_C_PLUS_PLUS_HEADER);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.c-plus-plus-header") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0023(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_C_PLUS_PLUS_SOURCE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.c-plus-plus-source")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0024(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_JAVA_SOURCE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.java-source") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0025(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_EBOOK);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.ebook")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0026(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_EPUB);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.epub")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0027(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AZW);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.amazon.azw")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0030(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AZW3);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.amazon.azw3")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0031(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_KFX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.amazon.kfx") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0032(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MOBI);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.amazon.mobi")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0033(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MEDIA);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.media") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0034(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.image")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0035(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_JPEG);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.jpeg") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0036(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PNG);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.png") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0037(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_RAW_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.raw-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0038(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TIFF);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.tiff") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0039(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_BMP);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.bmp") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0040(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ICO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.ico") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0041(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PHOTOSHOP_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.photoshop-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0042(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AI_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.illustrator.ai-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0043(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WORD_DOC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.word.doc") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0044(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_EXCEL);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.excel.xls") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0045(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.powerpoint.ppt") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0046(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PDF);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.pdf") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0047(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_POSTSCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.postscript") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0048(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ENCAPSULATED_POSTSCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.encapsulated-postscript") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0049(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_VIDEO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.video") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0050(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AVI);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.avi") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0051(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MPEG);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.mpeg") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0052(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MPEG4);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.mpeg-4") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0053(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_VIDEO_3GPP);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.3gpp")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0055(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_VIDEO_3GPP2);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.3gpp2") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0056(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WM);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wm") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0057(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WMV);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wmv") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0058(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WMP);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wmp") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0059(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AUDIO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.audio") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0060(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AAC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.aac") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0061(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AIFF);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.aiff") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0062(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ALAC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.alac") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0063(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_FLAC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.flac") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0064(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MP3);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.mp3") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0065(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OGG);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.ogg") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0066(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PCM);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.pcm") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0067(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WMA);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wma") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0068(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WAVEFORM_AUDIO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.waveform-audio") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0069(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WMX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wmx") == PARAM_0,  &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0070(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WVX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wvx") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0071(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WAX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wax") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0072(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_GENERAL_FILE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.file") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0073(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_DIRECTORY);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.directory") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0074(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_FOLDER);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.folder") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0075(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SYMLINK);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.symlink") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0076(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.archive")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0077(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_BZ2_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.bz2-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0078(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_DISK_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.disk-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0079(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TAR_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.tar-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0080(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ZIP_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.zip-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0081(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_JAVA_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.sun.java-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0082(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_GNU_TAR_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.gnu.gnu-tar-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0083(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_GNU_ZIP_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.gnu.gnu-zip-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0084(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_GNU_ZIP_TAR_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.gnu.gnu-zip-tar-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0085(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_CALENDAR);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.calendar") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Utd_Create_0001", nullptr, OH_Utd_Create_0001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0002", nullptr, OH_Utd_Create_0002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0003", nullptr, OH_Utd_Create_0003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0004", nullptr, OH_Utd_Create_0004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0005", nullptr, OH_Utd_Create_0005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0006", nullptr, OH_Utd_Create_0006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0007", nullptr, OH_Utd_Create_0007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0008", nullptr, OH_Utd_Create_0008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0009", nullptr, OH_Utd_Create_0009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0010", nullptr, OH_Utd_Create_0010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0011", nullptr, OH_Utd_Create_0011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0012", nullptr, OH_Utd_Create_0012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0013", nullptr, OH_Utd_Create_0013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0014", nullptr, OH_Utd_Create_0014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0015", nullptr, OH_Utd_Create_0015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0017", nullptr, OH_Utd_Create_0017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0018", nullptr, OH_Utd_Create_0018, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0019", nullptr, OH_Utd_Create_0019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0020", nullptr, OH_Utd_Create_0020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0021", nullptr, OH_Utd_Create_0021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0022", nullptr, OH_Utd_Create_0022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0023", nullptr, OH_Utd_Create_0023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0024", nullptr, OH_Utd_Create_0024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0025", nullptr, OH_Utd_Create_0025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0026", nullptr, OH_Utd_Create_0026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0027", nullptr, OH_Utd_Create_0027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0030", nullptr, OH_Utd_Create_0030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0031", nullptr, OH_Utd_Create_0031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0032", nullptr, OH_Utd_Create_0032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0033", nullptr, OH_Utd_Create_0033, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0034", nullptr, OH_Utd_Create_0034, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0035", nullptr, OH_Utd_Create_0035, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0036", nullptr, OH_Utd_Create_0036, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0037", nullptr, OH_Utd_Create_0037, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0038", nullptr, OH_Utd_Create_0038, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0039", nullptr, OH_Utd_Create_0039, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0040", nullptr, OH_Utd_Create_0040, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0041", nullptr, OH_Utd_Create_0041, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0042", nullptr, OH_Utd_Create_0042, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0043", nullptr, OH_Utd_Create_0043, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0044", nullptr, OH_Utd_Create_0044, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0045", nullptr, OH_Utd_Create_0045, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0046", nullptr, OH_Utd_Create_0046, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0047", nullptr, OH_Utd_Create_0047, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0048", nullptr, OH_Utd_Create_0048, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0049", nullptr, OH_Utd_Create_0049, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0050", nullptr, OH_Utd_Create_0050, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0051", nullptr, OH_Utd_Create_0051, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0052", nullptr, OH_Utd_Create_0052, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0053", nullptr, OH_Utd_Create_0053, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0055", nullptr, OH_Utd_Create_0055, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0056", nullptr, OH_Utd_Create_0056, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0057", nullptr, OH_Utd_Create_0057, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0058", nullptr, OH_Utd_Create_0058, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0059", nullptr, OH_Utd_Create_0059, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0060", nullptr, OH_Utd_Create_0060, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0061", nullptr, OH_Utd_Create_0061, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0062", nullptr, OH_Utd_Create_0062, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0063", nullptr, OH_Utd_Create_0063, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0064", nullptr, OH_Utd_Create_0064, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0065", nullptr, OH_Utd_Create_0065, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0066", nullptr, OH_Utd_Create_0066, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0067", nullptr, OH_Utd_Create_0067, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0068", nullptr, OH_Utd_Create_0068, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0069", nullptr, OH_Utd_Create_0069, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0070", nullptr, OH_Utd_Create_0070, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0071", nullptr, OH_Utd_Create_0071, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0072", nullptr, OH_Utd_Create_0072, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0073", nullptr, OH_Utd_Create_0073, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0074", nullptr, OH_Utd_Create_0074, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0075", nullptr, OH_Utd_Create_0075, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0076", nullptr, OH_Utd_Create_0076, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0077", nullptr, OH_Utd_Create_0077, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0078", nullptr, OH_Utd_Create_0078, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0079", nullptr, OH_Utd_Create_0079, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0080", nullptr, OH_Utd_Create_0080, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0081", nullptr, OH_Utd_Create_0081, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0082", nullptr, OH_Utd_Create_0082, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0083", nullptr, OH_Utd_Create_0083, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0084", nullptr, OH_Utd_Create_0084, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0085", nullptr, OH_Utd_Create_0085, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "UtdNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};
extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
