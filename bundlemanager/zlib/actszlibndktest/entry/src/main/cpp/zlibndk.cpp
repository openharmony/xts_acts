/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include "native_common.h"
#include "zconf.h"
#include "zlib.h"
#include <cstdlib>
#include <cstring>


/* this structure is at the root of the linked list, and tracks statistics */
struct mem_zone {
    struct mem_item *first;  /* pointer to first item in list, or NULL */
    size_t total, highwater; /* total allocations, and largest total */
    size_t limit;            /* memory allocation limit, or 0 if no limit */
    int notlifo, rogue;      /* counts of non-LIFO frees and rogue frees */
};

static const char DICTIONARY[] = "hello";
static unsigned int CALLOC_SIZE = 1;
static thread_local char HELLO[] = "hello, hello!";
static const char GARBAGE[] = "garbage";
static int GARBAGE_LEN = strlen(GARBAGE) + 1;

static napi_value Crc32(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t bufferType;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &bufferType));

    uLong err = Z_ERRNO;
    if (bufferType == Z_NULL) {
        err = crc32(0L, Z_NULL, 0);
    } else {
        const Bytef *buf = reinterpret_cast<const Bytef *>(DICTIONARY);
        err = crc32(0L, buf, 0);
    }

    NAPI_ASSERT(env, err == Z_OK, "crc32 error");

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Crc32_z(napi_env env, napi_callback_info info)
{
    uLong err = Z_ERRNO;
    const Bytef *buf = reinterpret_cast<const Bytef *>(DICTIONARY);
    err = crc32_z(0L, buf, 0);
    NAPI_ASSERT(env, err == Z_OK, "crc32_z error");

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Crc32Combine(napi_env env, napi_callback_info info)
{
    uLong err = Z_ERRNO;
    err = crc32_combine(0L, 0L, 0);
    NAPI_ASSERT(env, err == Z_OK, "crc32_combine error");

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Adler32(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t bufferType;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &bufferType));

    uLong err = Z_ERRNO;
    if (bufferType == Z_NULL) {
        err = adler32(0L, Z_NULL, 0);
        NAPI_ASSERT(env, err == 1, "adler32 error");
    } else {
        const Bytef *buf = reinterpret_cast<const Bytef *>(DICTIONARY);
        err = adler32(0L, buf, 0);
        NAPI_ASSERT(env, err == Z_OK, "adler32 error");
    }

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Adler32_z(napi_env env, napi_callback_info info)
{
    uLong err = Z_ERRNO;
    const Bytef *buf = reinterpret_cast<const Bytef *>(DICTIONARY);
    err = adler32_z(0L, buf, 0);
    NAPI_ASSERT(env, err == Z_OK, "adler32_z error");

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Adler32Combine(napi_env env, napi_callback_info info)
{
    uLong expect = 65520;
    uLong err = Z_ERRNO;
    err = adler32_combine(0L, 0L, 0);
    NAPI_ASSERT(env, err == expect, "adler32_combine error");

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Deflate(napi_env env, napi_callback_info info)
{
    Byte *comp;
    uLong compLen = 100 * sizeof(int);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != nullptr, "comp is nullptr");

    z_stream c_stream; /* compression stream */
    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    NAPI_ASSERT(env, err == Z_OK, "deflateInit error");

    c_stream.next_in = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.next_out = comp;
    while (c_stream.total_in != len && c_stream.total_out < compLen) {
        c_stream.avail_in = c_stream.avail_out = 1; /* force small buffers */
        err = deflate(&c_stream, Z_NO_FLUSH);
        NAPI_ASSERT(env, err == Z_OK, "deflate Z_NO_FLUSH error");
    }

    for (;;) {
        c_stream.avail_out = 1;
        err = deflate(&c_stream, Z_FINISH);
        if (err == Z_STREAM_END) {
            break;
        }
        NAPI_ASSERT(env, err == Z_OK, "deflate Z_FINISH error");
    }

    err = deflateEnd(&c_stream);
    NAPI_ASSERT(env, err == Z_OK, "deflateEnd error");
    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DeflateFullFlush(napi_env env, napi_callback_info info)
{
    Byte *comp;
    uLong compLen = 100 * sizeof(int);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != nullptr, "comp is nullptr");

    z_stream c_stream; /* compression stream */
    int err = Z_OK;
    uInt len = static_cast<uInt>(strlen(HELLO)) + 1;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    NAPI_ASSERT(env, err == Z_OK, "deflateInit error");

    int changeLen = 3;
    c_stream.next_in = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.next_out = comp;
    c_stream.avail_in = changeLen;
    c_stream.avail_out = static_cast<uInt>(compLen);
    err = deflate(&c_stream, Z_FULL_FLUSH);
    NAPI_ASSERT(env, err == Z_OK, "deflate error");

    comp[changeLen]++; /* force an error in first compressed block */
    c_stream.avail_in = len - changeLen;
    err = deflate(&c_stream, Z_FINISH);
    if (err != Z_STREAM_END) {
        NAPI_ASSERT(env, err == Z_OK, "deflate error");
    }

    err = deflateEnd(&c_stream);
    NAPI_ASSERT(env, err == Z_OK, "deflateEnd error");
    compLen = c_stream.total_out;
    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DeflateBound(napi_env env, napi_callback_info info)
{
    Byte *comp;
    uLong compLen = 100 * sizeof(int);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != nullptr, "comp is nullptr");

    z_stream c_stream; /* compression stream */
    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    NAPI_ASSERT(env, err == Z_OK, "deflateInit error");

    c_stream.next_in = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.next_out = comp;
    while (c_stream.total_in != len && c_stream.total_out < compLen) {
        c_stream.avail_in = c_stream.avail_out = 1; /* force small buffers */
        err = deflate(&c_stream, Z_NO_FLUSH);
        NAPI_ASSERT(env, err == Z_OK, "deflate Z_NO_FLUSH error");
    }

    for (;;) {
        c_stream.avail_out = 1;
        err = deflate(&c_stream, Z_FINISH);
        if (err == Z_STREAM_END) {
            break;
        }
        NAPI_ASSERT(env, err == Z_OK, "deflate Z_FINISH error");
    }

    err = deflateEnd(&c_stream);
    NAPI_ASSERT(env, err == Z_OK, "deflateEnd error");
    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Compress(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t expect;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &expect));

    Byte *comp;
    uLong compLen = expect == Z_OK ? 100 * sizeof(int) : 1;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    err = compress(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len);
    NAPI_ASSERT(env, err == expect, "compress error");

    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value CompressBound(napi_env env, napi_callback_info info)
{
    Byte *comp;

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;

    uLong compLen = compressBound(len);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    err = compress(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len);
    NAPI_ASSERT(env, err == Z_OK, "compress error");

    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Compress2(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t CompressType;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &CompressType));
    uint32_t expect;
    NAPI_CALL(env, napi_get_value_uint32(env, args[1], &expect));

    Byte *comp;
    uLong compLen = expect == Z_OK ? 100 * sizeof(int) : 1;
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    err = compress2(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len, CompressType);
    NAPI_ASSERT(env, err == expect, "compress error");

    free(comp);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value UnCompress(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t expect;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &expect));

    Byte *comp;
    uLong compLen = 100 * sizeof(int);
    comp = static_cast<Byte *>(calloc(static_cast<uInt>(compLen), CALLOC_SIZE));
    NAPI_ASSERT(env, comp != Z_NULL, "comp is Z_NULL");

    int err = Z_OK;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    err = compress(comp, &compLen, reinterpret_cast<const Bytef *>(HELLO), len);
    NAPI_ASSERT(env, err == Z_OK, "compress error");

    Byte *unComp;
    uLong unCompLen = compLen;
    unComp = static_cast<Byte *>(calloc(static_cast<uInt>(unCompLen), CALLOC_SIZE));
    NAPI_ASSERT(env, unComp != Z_NULL, "unComp is Z_NULL");
    strncpy(reinterpret_cast<char *>(unComp), GARBAGE, GARBAGE_LEN);
    if (expect == Z_BUF_ERROR) {
        unCompLen = 1;
        err = uncompress(unComp, &unCompLen, comp, compLen);
    } else if (expect == Z_DATA_ERROR) {
        err = uncompress(unComp, &unCompLen, comp, 1);
    } else {
        err = uncompress(unComp, &unCompLen, comp, compLen);
    }
    NAPI_ASSERT(env, err == expect, "uncompress error");

    free(comp);
    free(unComp);

    napi_value result = nullptr;
    napi_create_int32(env, 1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"compress", nullptr, Compress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"compress2", nullptr, Compress2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"compressBound", nullptr, CompressBound, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crc32", nullptr, Crc32, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crc32_z", nullptr, Crc32_z, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crc32Combine", nullptr, Crc32Combine, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"adler32", nullptr, Adler32, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"adler32_z", nullptr, Adler32_z, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"adler32Combine", nullptr, Adler32Combine, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflate", nullptr, Deflate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateFullFlush", nullptr, DeflateFullFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deflateBound", nullptr, DeflateBound, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unCompress", nullptr, UnCompress, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "zlibndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
