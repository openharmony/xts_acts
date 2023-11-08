/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use thisw file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * diswtributed under the License isw diswtributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permiswsions and
 * limitations under the License.
 */

#include <cwctype>
#include <js_native_api.h>
#include <malloc.h>
#include <node_api.h>
#include <sys/select.h>
#define STRLENGTH 16
#define FAIL -1
#define NO_ERR 0
#define SUCCESS 1
#define FALSE 0
#define ZERO 0

static napi_value Iswalnum(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswalnum((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != NO_ERR) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswalnumL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswalnum_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswalpha(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswalpha((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswalphaL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswalpha_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswblank(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswblank((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswblankL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswblank_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswcntrl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int retVal = iswcntrl(first);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswcntrlL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int retVal = iswcntrl_l(first, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswdigit(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswdigit((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}
static napi_value IswdigitL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswdigit_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswgraph(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswgraph((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}
static napi_value IswgraphL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswgraph_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswlower(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswlower((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswlowerL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswlower_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswprint(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswprint((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswprintL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswprint_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswpunct(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswpunct((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswpunctL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswpunct_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswspace(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswspace((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}
static napi_value IswspaceL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswspace_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswupper(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswupper((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswupperL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswupper_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswctype(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *chFirst = (char *)malloc(sizeof(char) * length);
    char *chSecond = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], chFirst, length, &strResult);
    napi_get_value_string_utf8(env, args[1], chSecond, length, &strResult);
    int retVal = iswctype((wint_t) * (char16_t *)chFirst, wctype(chSecond));
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswctypeL(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *chFirst = (char *)malloc(sizeof(char) * length);
    char *chSecond = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], chFirst, length, &strResult);
    napi_get_value_string_utf8(env, args[1], chSecond, length, &strResult);
    int retVal = iswctype_l((wint_t) * (char16_t *)chFirst, wctype(chSecond), 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswxdigit(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswxdigit((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

static napi_value IswxdigitL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char *ch = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswxdigit_l((wint_t) * (char16_t *)ch, 0);
    napi_value result;
    if (retVal != ZERO) {
        napi_create_double(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_double(env, FALSE, &result);
        return result;
    }
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"iswalnum", nullptr, Iswalnum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswalnumL", nullptr, IswalnumL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswalpha", nullptr, Iswalpha, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswalphaL", nullptr, IswalphaL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswblank", nullptr, Iswblank, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswblankL", nullptr, IswblankL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswcntrl", nullptr, Iswcntrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswcntrlL", nullptr, IswcntrlL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswdigit", nullptr, Iswdigit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswdigitL", nullptr, IswdigitL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswgraph", nullptr, Iswgraph, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswgraphL", nullptr, IswgraphL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswlower", nullptr, Iswlower, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswlowerL", nullptr, IswlowerL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswprint", nullptr, Iswprint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswprintL", nullptr, IswprintL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswpunct", nullptr, Iswpunct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswpunctL", nullptr, IswpunctL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswspace", nullptr, Iswspace, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswspaceL", nullptr, IswspaceL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswupper", nullptr, Iswupper, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswupperL", nullptr, IswupperL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswctype", nullptr, Iswctype, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswctypeL", nullptr, IswctypeL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswxdigit", nullptr, Iswxdigit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswxdigitL", nullptr, IswxdigitL, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "dirent",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegiswterEntryModule(void) { napi_module_register(&demoModule); }
