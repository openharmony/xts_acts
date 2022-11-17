/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "common/native_common.h"
#include "napi/native_api.h"
#include <stdint.h>
#include <string>
#include <stdio.h>
#include <vector>
#include <malloc.h>
#include <time.h>
#include <uv.h>

static bool exceptionWasPending = false;
static napi_ref test_reference = NULL;
static int test_value = 1;
static napi_deferred deferred = NULL;

static void add_returned_status(napi_env env,
                                const char* key,
                                napi_value object,
                                const char* expected_message,
                                napi_status expected_status,
                                napi_status actual_status) {
    char napi_message_string[100] = "";
    napi_value prop_value;

    if (actual_status != expected_status) {
        snprintf(napi_message_string, sizeof(napi_message_string), "Invalid status [%d]", actual_status);
    }

    NAPI_CALL_RETURN_VOID(env,
            napi_create_string_utf8(env,
                    (actual_status == expected_status ?
                    expected_message :
                    napi_message_string),
                    NAPI_AUTO_LENGTH,
                    &prop_value));
    NAPI_CALL_RETURN_VOID(env,
            napi_set_named_property(env,
                    object,
                    key,
                    prop_value));
}

static void add_last_status(napi_env env, const char* key, napi_value return_value) {
    napi_value prop_value;
    const napi_extended_error_info* p_last_error;
    NAPI_CALL_RETURN_VOID(env, napi_get_last_error_info(env, &p_last_error));

    NAPI_CALL_RETURN_VOID(env,
            napi_create_string_utf8(env,
                    (p_last_error->error_message == NULL ?
                    "napi_ok" :
                    p_last_error->error_message),
                    NAPI_AUTO_LENGTH,
                    &prop_value));
    NAPI_CALL_RETURN_VOID(env, napi_set_named_property(env,
            return_value,
            key,
            prop_value));
}

static napi_value getLastErrorInfo(napi_env env, napi_callback_info info) {
    napi_value value;
    NAPI_CALL(env, napi_create_string_utf8(env, "xyz", 3, &value));
    double double_value;
    napi_status status = napi_get_value_double(env, value, &double_value);
    NAPI_ASSERT(env, status != napi_ok, "Failed to produce error condition");
    const napi_extended_error_info * error_info = 0;
    NAPI_CALL(env, napi_get_last_error_info(env, &error_info));

    NAPI_ASSERT(env, error_info->error_code == status,
            "Last error info code should match last status");
    NAPI_ASSERT(env, error_info->error_message,
            "Last error info message should not be null");
    return NULL;
}

static napi_value cleanUpErrorInfo(napi_env env, napi_callback_info info) {
    const napi_extended_error_info * error_info = 0;
    NAPI_CALL(env, napi_get_last_error_info(env, &error_info));

    napi_value result;
    bool is_ok = error_info->error_code == napi_ok;
    NAPI_CALL(env, napi_get_boolean(env, is_ok, &result));

    return result;
}

static napi_value throwExistingError(napi_env env, napi_callback_info info) {
    napi_value message;
    napi_value error;
    NAPI_CALL(env, napi_create_string_utf8(env, "existing error", NAPI_AUTO_LENGTH, &message));
    NAPI_CALL(env, napi_create_error(env, NULL, message, &error));
    NAPI_CALL(env, napi_throw(env, error));
    return NULL;
}

static napi_value throwError(napi_env env, napi_callback_info info) {
    NAPI_CALL(env, napi_throw_error(env, NULL, "error"));
    return NULL;
}

static napi_value throwTypeError(napi_env env, napi_callback_info info) {
    NAPI_CALL(env, napi_throw_type_error(env, NULL, "type error"));
    return NULL;
}

static napi_value throwRangeError(napi_env env, napi_callback_info info) {
    NAPI_CALL(env, napi_throw_range_error(env, NULL, "range error"));
    return NULL;
}

static napi_value isError(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    bool r;
    NAPI_CALL(env, napi_is_error(env, args[0], &r));

    napi_value result;
    NAPI_CALL(env, napi_get_boolean(env, r, &result));

    return result;
}

static napi_value createError(napi_env env, napi_callback_info info) {
    napi_value result;
    napi_value message;
    NAPI_CALL(env, napi_create_string_utf8(env, "error", NAPI_AUTO_LENGTH, &message));
    NAPI_CALL(env, napi_create_error(env, NULL, message, &result));
    return result;
}

static napi_value createTypeError(napi_env env, napi_callback_info info) {
    napi_value result;
    napi_value message;
    NAPI_CALL(env, napi_create_string_utf8(env, "type error", NAPI_AUTO_LENGTH, &message));
    NAPI_CALL(env, napi_create_type_error(env, NULL, message, &result));
    return result;
}

static napi_value createRangeError(napi_env env, napi_callback_info info) {
    napi_value result;
    napi_value message;
    NAPI_CALL(env, napi_create_string_utf8(env, "range error", NAPI_AUTO_LENGTH, &message));
    NAPI_CALL(env, napi_create_range_error(env, NULL, message, &result));
    return result;
}

static napi_value getAndClearLastException(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value global;
    NAPI_CALL(env, napi_get_global(env, &global));

    napi_value result;
    napi_status status = napi_call_function(env, global, args[0], 0, 0, &result);
    if (status == napi_pending_exception) {
        napi_value ex;
        NAPI_CALL(env, napi_get_and_clear_last_exception(env, &ex));
        return ex;
    }
    return NULL;
}

static napi_value isExceptionPending(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value global;
    NAPI_CALL(env, napi_get_global(env, &global));

    napi_value result;
    napi_call_function(env, global, args[0], 0, 0, &result);

    NAPI_CALL(env, napi_is_exception_pending(env, &exceptionWasPending));
    return NULL;
}

static napi_value openAndCloseHandleScope(napi_env env, napi_callback_info info) {
    napi_handle_scope scope;
    napi_value output = NULL;

    NAPI_CALL(env, napi_open_handle_scope(env, &scope));
    NAPI_CALL(env, napi_create_object(env, &output));
    NAPI_CALL(env, napi_close_handle_scope(env, scope));
    return NULL;
}

static napi_value openAndCloseEscapableHandleScope(napi_env env, napi_callback_info info) {
    napi_escapable_handle_scope scope;
    napi_value output = NULL;
    napi_value escapee = NULL;

    NAPI_CALL(env, napi_open_escapable_handle_scope(env, &scope));
    NAPI_CALL(env, napi_create_object(env, &output));
    NAPI_CALL(env, napi_escape_handle(env, scope, output, &escapee));
    NAPI_CALL(env, napi_close_escapable_handle_scope(env, scope));
    return escapee;
}

static napi_value createReference(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, test_reference == NULL,
            "The test allows only one reference at a time.");

    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
    NAPI_ASSERT(env, argc == 2, "Expected two arguments.");

    uint32_t initial_refcount;
    NAPI_CALL(env, napi_get_value_uint32(env, args[1], &initial_refcount));

    NAPI_CALL(env,
            napi_create_reference(env, args[0], initial_refcount, &test_reference));

    NAPI_ASSERT(env, test_reference != NULL,
            "A reference should have been created.");

    return NULL;
}

static napi_value deleteReference(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, test_reference != NULL,
            "A reference must have been created.");

    NAPI_CALL(env, napi_delete_reference(env, test_reference));
    test_reference = NULL;
    return NULL;
}

static napi_value referenceRef(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, test_reference != NULL,
            "A reference must have been created.");

    uint32_t refcount;
    NAPI_CALL(env, napi_reference_ref(env, test_reference, &refcount));

    napi_value result;
    NAPI_CALL(env, napi_create_uint32(env, refcount, &result));
    return result;
}

static napi_value referenceUnref(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, test_reference != NULL,
            "A reference must have been created.");

    uint32_t refcount;
    NAPI_CALL(env, napi_reference_unref(env, test_reference, &refcount));

    napi_value result;
    NAPI_CALL(env, napi_create_uint32(env, refcount, &result));
    return result;
}

static napi_value getReferenceValue(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, test_reference != NULL,
            "A reference must have been created.");

    napi_value result;
    NAPI_CALL(env, napi_get_reference_value(env, test_reference, &result));
    return result;
}

static napi_value createArrayAndGetLength(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects an array as first argument.");

    napi_value ret;
    NAPI_CALL(env, napi_create_array(env, &ret));

    uint32_t i, length;
    NAPI_CALL(env, napi_get_array_length(env, args[0], &length));

    for (i = 0; i < length; i++) {
        napi_value e;
        NAPI_CALL(env, napi_get_element(env, args[0], i, &e));
        NAPI_CALL(env, napi_set_element(env, ret, i, e));
    }

    return ret;
}

static napi_value getArrayWithLength(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_number,
            "Wrong type of arguments. Expects an integer the first argument.");

    int32_t array_length;
    NAPI_CALL(env, napi_get_value_int32(env, args[0], &array_length));

    napi_value ret;
    NAPI_CALL(env, napi_create_array_with_length(env, array_length, &ret));

    return ret;
}

static void finalizer(napi_env env, void * data, void * hint) {
    NAPI_CALL_RETURN_VOID(env,
            napi_throw_error(env, NULL, "Error during Finalize"));
}

static napi_value createExternal(napi_env env, napi_callback_info info) {
    napi_value external;

    NAPI_CALL(env,
            napi_create_external(env, NULL, finalizer, NULL, &external));

    return external;
}

static napi_value createExternalArraybuffer(napi_env env, napi_callback_info info) {
    static void* data = NULL;
    napi_value arraybuffer;
    NAPI_CALL(env,
            napi_create_external_arraybuffer(env, data, 0, NULL, NULL, &arraybuffer));
    return arraybuffer;
}

static napi_value createObject(napi_env env, napi_callback_info info) {
    napi_value ret;
    NAPI_CALL(env, napi_create_object(env, &ret));

    napi_value num;
    NAPI_CALL(env, napi_create_int32(env, 987654321, &num));

    NAPI_CALL(env, napi_set_named_property(env, ret, "test_number", num));

    napi_value str;
    const char* str_val = "test string";
    size_t str_len = strlen(str_val);
    NAPI_CALL(env, napi_create_string_utf8(env, str_val, str_len, &str));

    NAPI_CALL(env, napi_set_named_property(env, ret, "test_string", str));

    return ret;
}

static napi_value createSymbol(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value description = NULL;
    if (argc >= 1) {
        napi_valuetype valuetype;
        NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

        NAPI_ASSERT(env, valuetype == napi_string,
                "Wrong type of arguments. Expects a string.");

        description = args[0];
    }

    napi_value symbol;
    NAPI_CALL(env, napi_create_symbol(env, description, &symbol));

    return symbol;
}

static napi_value createTypeArray(napi_env env, napi_callback_info info) {
    static int8_t externalData[] = { 0, 1, 2 };

    napi_value output_buffer;
    NAPI_CALL(env, napi_create_external_arraybuffer(env,
            externalData,
            sizeof(externalData),
            NULL,  // finalize_callback
            NULL,  // finalize_hint
            &output_buffer));

    napi_value output_array;
    NAPI_CALL(env, napi_create_typedarray(env,
            napi_int8_array,
            sizeof(externalData) / sizeof(int8_t),
            output_buffer,
            0,
            &output_array));

    return output_array;
}

static napi_value createDataView(napi_env env, napi_callback_info info) {
    size_t argc = 3;
    napi_value args [3];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc == 3, "Wrong number of arguments");

    napi_valuetype valuetype0;
    napi_value arraybuffer = args[0];

    NAPI_CALL(env, napi_typeof(env, arraybuffer, &valuetype0));
    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects a ArrayBuffer as the first "
            "argument.");

    bool is_arraybuffer;
    NAPI_CALL(env, napi_is_arraybuffer(env, arraybuffer, &is_arraybuffer));
    NAPI_ASSERT(env, is_arraybuffer,
            "Wrong type of arguments. Expects a ArrayBuffer as the first "
            "argument.");

    napi_valuetype valuetype1;
    NAPI_CALL(env, napi_typeof(env, args[1], &valuetype1));

    NAPI_ASSERT(env, valuetype1 == napi_number,
            "Wrong type of arguments. Expects a number as second argument.");

    size_t byte_offset = 0;
    NAPI_CALL(env, napi_get_value_uint32(env, args[1], (uint32_t*)(&byte_offset)));

    napi_valuetype valuetype2;
    NAPI_CALL(env, napi_typeof(env, args[2], &valuetype2));

    NAPI_ASSERT(env, valuetype2 == napi_number,
            "Wrong type of arguments. Expects a number as third argument.");

    size_t length = 0;
    NAPI_CALL(env, napi_get_value_uint32(env, args[2], (uint32_t*)(&length)));

    napi_value output_dataview;
    NAPI_CALL(env,
            napi_create_dataview(env, length, arraybuffer,
                    byte_offset, &output_dataview));

    return output_dataview;
}

static napi_value createAndGetInt32(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    int32_t value;
    NAPI_CALL(env, napi_get_value_int32(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_int32(env, value, &output));

    return output;
}

static napi_value createAndGetUInt32(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    uint32_t value;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, value, &output));

    return output;
}

static napi_value createAndGetInt64(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    int64_t value;
    NAPI_CALL(env, napi_get_value_int64(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_int64(env, (double)value, &output));

    return output;
}

static napi_value createDouble(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    double value;
    NAPI_CALL(env, napi_get_value_double(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, value, &output));

    return output;
}

static napi_value createAndGetStringLatin1(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t buffer_size = 128;
    size_t copied;

    NAPI_CALL(env,
            napi_get_value_string_latin1(env, args[0], buffer, buffer_size, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_latin1(env, buffer, copied, &output));

    return output;
}

static napi_value createAndGetStringUtf8(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t buffer_size = 128;
    size_t copied;

    NAPI_CALL(env,
            napi_get_value_string_utf8(env, args[0], buffer, buffer_size, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, buffer, copied, &output));

    return output;
}

static napi_value getPrototype(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value result;
    NAPI_CALL(env, napi_get_prototype(env, args[0], &result));

    return result;
}

static napi_value getDataViewInfo(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args [1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc == 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    napi_value input_dataview = args[0];

    NAPI_CALL(env, napi_typeof(env, input_dataview, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_object,
            "Wrong type of arguments. Expects a DataView as the first "
            "argument.");

    bool is_dataview;
    NAPI_CALL(env, napi_is_dataview(env, input_dataview, &is_dataview));
    NAPI_ASSERT(env, is_dataview,
            "Wrong type of arguments. Expects a DataView as the first "
            "argument.");
    size_t byte_offset = 0;
    size_t length = 0;
    napi_value buffer;
    NAPI_CALL(env,
            napi_get_dataview_info(env, input_dataview, &length, NULL,
                    &buffer, &byte_offset));

    napi_value output_dataview;
    NAPI_CALL(env,
            napi_create_dataview(env, length, buffer,
                    byte_offset, &output_dataview));


    return output_dataview;
}

static napi_value getValueBool(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    bool value;
    NAPI_CALL(env, napi_get_value_bool(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_get_boolean(env, value, &output));

    return output;
}

static napi_value getValueDouble(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    double value;
    NAPI_CALL(env, napi_get_value_double(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, value, &output));

    return output;
}

static napi_value getValueExternal(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value arg;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &arg, NULL, NULL));

    NAPI_ASSERT(env, argc == 1, "Expected one argument.");

    napi_valuetype argtype;
    NAPI_CALL(env, napi_typeof(env, arg, &argtype));

    NAPI_ASSERT(env, argtype == napi_external, "Expected an external value.");

    void* data;
    NAPI_CALL(env, napi_get_value_external(env, arg, &data));

    NAPI_ASSERT(env, data != NULL && *(int*)data == test_value,
            "An external data value of 1 was expected.");

    return NULL;
}

static napi_value getNull(napi_env env, napi_callback_info info) {
    napi_value result;
    NAPI_CALL(env, napi_get_null(env, &result));
    return result;
}

static napi_value getUndefined(napi_env env, napi_callback_info info) {
    napi_value result;
    NAPI_CALL(env, napi_get_undefined(env, &result));
    return result;
}

static napi_value coerceToBool(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_bool(env, args[0], &output));

    return output;
}

static napi_value coerceToNumber(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_number(env, args[0], &output));

    return output;
}

static napi_value coerceToObject(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_object(env, args[0], &output));

    return output;
}

static napi_value coerceToString(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_string(env, args[0], &output));

    return output;
}

static napi_value instanceOf(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    bool instanceof;
    NAPI_CALL(env, napi_instanceof(env, args[0], args[1], &instanceof));

    napi_value result;
    NAPI_CALL(env, napi_get_boolean(env, instanceof, &result));

    return result;
}

static napi_value isArray(napi_env env, napi_callback_info info) {
  size_t argc = 2;
  napi_value args[2];
  NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

  NAPI_ASSERT(env, argc >= 2, "Wrong number of arguments");

  napi_valuetype valuetype0;
  NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

  NAPI_ASSERT(env, valuetype0 == napi_object,
      "Wrong type of arguments. Expects an array as first argument.");

  napi_valuetype valuetype1;
  NAPI_CALL(env, napi_typeof(env, args[1], &valuetype1));

  NAPI_ASSERT(env, valuetype1 == napi_number,
      "Wrong type of arguments. Expects an integer as second argument.");

  napi_value array = args[0];
  int32_t index;
  NAPI_CALL(env, napi_get_value_int32(env, args[1], &index));

  NAPI_ASSERT(env, index >= 0, "Invalid index. Expects a positive integer.");

  bool isarray;
  NAPI_CALL(env, napi_is_array(env, array, &isarray));

  if (!isarray) {
    return NULL;
  }

  uint32_t length;
  NAPI_CALL(env, napi_get_array_length(env, array, &length));

  NAPI_ASSERT(env, ((uint32_t)index < length), "Index out of bounds!");

  napi_value ret;
  NAPI_CALL(env, napi_get_element(env, array, index, &ret));

  return ret;
}

static napi_value isDate(napi_env env, napi_callback_info info) {
    napi_value date, result;
    size_t argc = 1;
    bool is_date;

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &date, NULL, NULL));
    NAPI_CALL(env, napi_is_date(env, date, &is_date));
    NAPI_CALL(env, napi_get_boolean(env, is_date, &result));

    return result;
}

static napi_value strictEquals(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    bool bool_result;
    napi_value result;
    NAPI_CALL(env, napi_strict_equals(env, args[0], args[1], &bool_result));
    NAPI_CALL(env, napi_get_boolean(env, bool_result, &result));

    return result;
}

static napi_value getPropertyNames(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));

    NAPI_ASSERT(env, value_type0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_value output;
    NAPI_CALL(env, napi_get_property_names(env, args[0], &output));

    return output;
}

static napi_value setProperty(napi_env env,
                              napi_callback_info info) {
    napi_status status;
    napi_value object, key, value;

    NAPI_CALL(env, napi_create_object(env, &object));

    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));

    NAPI_CALL(env, napi_create_object(env, &value));

    status = napi_set_property(NULL, object, key, value);

    add_returned_status(env,
            "envIsNull",
            object,
            "Invalid argument",
            napi_invalid_arg,
            status);

    napi_set_property(env, NULL, key, value);

    add_last_status(env, "objectIsNull", object);

    napi_set_property(env, object, NULL, value);

    add_last_status(env, "keyIsNull", object);

    napi_set_property(env, object, key, NULL);

    add_last_status(env, "valueIsNull", object);

    return object;
}

static napi_value getProperty(napi_env env,
                              napi_callback_info info) {
    napi_status status;
    napi_value object, key, result;

    NAPI_CALL(env, napi_create_object(env, &object));

    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));

    NAPI_CALL(env, napi_create_object(env, &result));

    status = napi_get_property(NULL, object, key, &result);

    add_returned_status(env,
            "envIsNull",
            object,
            "Invalid argument",
            napi_invalid_arg,
            status);

    napi_get_property(env, NULL, key, &result);

    add_last_status(env, "objectIsNull", object);

    napi_get_property(env, object, NULL, &result);

    add_last_status(env, "keyIsNull", object);

    napi_get_property(env, object, key, NULL);

    add_last_status(env, "resultIsNull", object);

    return object;
}

static napi_value hasProperty(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 2, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype valuetype1;
    NAPI_CALL(env, napi_typeof(env, args[1], &valuetype1));

    NAPI_ASSERT(env, valuetype1 == napi_string || valuetype1 == napi_symbol,
            "Wrong type of arguments. Expects a string or symbol as second.");

    bool has_property;
    NAPI_CALL(env, napi_has_property(env, args[0], args[1], &has_property));

    napi_value ret;
    NAPI_CALL(env, napi_get_boolean(env, has_property, &ret));

    return ret;
}

static napi_value deleteProperty(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2];

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
    NAPI_ASSERT(env, argc == 2, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));
    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype valuetype1;
    NAPI_CALL(env, napi_typeof(env, args[1], &valuetype1));
    NAPI_ASSERT(env, valuetype1 == napi_string || valuetype1 == napi_symbol,
            "Wrong type of arguments. Expects a string or symbol as second.");

    bool result;
    napi_value ret;
    NAPI_CALL(env, napi_delete_property(env, args[0], args[1], &result));
    NAPI_CALL(env, napi_get_boolean(env, result, &ret));

    return ret;
}

static napi_value hasOwnProperty(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc == 2, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    bool has_property;
    NAPI_CALL(env, napi_has_own_property(env, args[0], args[1], &has_property));

    napi_value ret;
    NAPI_CALL(env, napi_get_boolean(env, has_property, &ret));

    return ret;
}

static napi_value setNamedProperty(napi_env env, napi_callback_info info) {
    size_t argc = 3;
    napi_value args[3];
    char key[256] = "";
    size_t key_length;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 3, "Wrong number of arguments");

    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));

    NAPI_ASSERT(env, value_type0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));

    NAPI_ASSERT(env, value_type1 == napi_string,
            "Wrong type of arguments. Expects a string as second.");

    NAPI_CALL(env,
            napi_get_value_string_utf8(env, args[1], key, 255, &key_length));
    key[255] = 0;
    NAPI_ASSERT(env, key_length <= 255,
            "Cannot accommodate keys longer than 255 bytes");

    NAPI_CALL(env, napi_set_named_property(env, args[0], key, args[2]));

    napi_value value_true;
    NAPI_CALL(env, napi_get_boolean(env, true, &value_true));

    return value_true;
}

static napi_value getNamedProperty(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2];
    char key[256] = "";
    size_t key_length;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 2, "Wrong number of arguments");

    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));

    NAPI_ASSERT(env, value_type0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));

    NAPI_ASSERT(env, value_type1 == napi_string,
            "Wrong type of arguments. Expects a string as second.");

    napi_value object = args[0];
    NAPI_CALL(env,
            napi_get_value_string_utf8(env, args[1], key, 255, &key_length));
    key[255] = 0;
    NAPI_ASSERT(env, key_length <= 255,
            "Cannot accommodate keys longer than 255 bytes");
    napi_value output;
    NAPI_CALL(env, napi_get_named_property(env, object, key, &output));

    return output;
}

static napi_value hasNamedProperty(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2];
    char key[256] = "";
    size_t key_length;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 2, "Wrong number of arguments");

    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));

    NAPI_ASSERT(env, value_type0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));

    NAPI_ASSERT(env, value_type1 == napi_string || value_type1 == napi_symbol,
            "Wrong type of arguments. Expects a string as second.");

    NAPI_CALL(env,
            napi_get_value_string_utf8(env, args[1], key, 255, &key_length));
    key[255] = 0;
    NAPI_ASSERT(env, key_length <= 255,
            "Cannot accommodate keys longer than 255 bytes");

    bool has_property;
    NAPI_CALL(env, napi_has_named_property(env, args[0], key, &has_property));

    napi_value ret;
    NAPI_CALL(env, napi_get_boolean(env, has_property, &ret));

    return ret;
}

static napi_value setElement(napi_env env, napi_callback_info info) {
    napi_value return_value, object;

    NAPI_CALL(env, napi_create_object(env, &return_value));
    NAPI_CALL(env, napi_create_object(env, &object));

    add_returned_status(env,
            "envIsNull",
            return_value,
            "Invalid argument",
            napi_invalid_arg,
            napi_set_element(NULL, object, 0, object));

    napi_set_element(env, NULL, 0, object);
    add_last_status(env, "objectIsNull", return_value);


    napi_set_property(env, object, 0, NULL);
    add_last_status(env, "valueIsNull", return_value);

    return return_value;
}

static napi_value getElement(napi_env env, napi_callback_info info) {
    napi_value return_value, object, prop;

    NAPI_CALL(env, napi_create_object(env, &return_value));
    NAPI_CALL(env, napi_create_object(env, &object));

    add_returned_status(env,
            "envIsNull",
            return_value,
            "Invalid argument",
            napi_invalid_arg,
            napi_get_element(NULL, object, 0, &prop));

    napi_get_property(env, NULL, 0, &prop);
    add_last_status(env, "objectIsNull", return_value);

    napi_get_property(env, object, 0, NULL);
    add_last_status(env, "valueIsNull", return_value);

    return return_value;
}

static napi_value TestBoolValuedElementApi(napi_env env,
                                           napi_status (* api)(napi_env, napi_value, uint32_t, bool*)) {
    napi_value return_value, object;
    bool result;

    NAPI_CALL(env, napi_create_object(env, &return_value));
    NAPI_CALL(env, napi_create_object(env, &object));

    add_returned_status(env,
            "envIsNull",
            return_value,
            "Invalid argument",
            napi_invalid_arg,
            api(NULL, object, 0, &result));

    api(env, NULL, 0, &result);
    add_last_status(env, "objectIsNull", return_value);

    api(env, object, 0, NULL);
    add_last_status(env, "valueIsNull", return_value);

    return return_value;
}

static napi_value hasElement(napi_env env, napi_callback_info info) {
    return TestBoolValuedElementApi(env, napi_has_element);
}

static napi_value deleteElement(napi_env env, napi_callback_info info) {
    return TestBoolValuedElementApi(env, napi_delete_element);
}

static napi_value defineProperties(napi_env env, napi_callback_info info) {
    napi_value object, return_value;

    napi_property_descriptor desc = { "prop", NULL, defineProperties, NULL, NULL, NULL, napi_enumerable, NULL };

    NAPI_CALL(env, napi_create_object(env, &object));
    NAPI_CALL(env, napi_create_object(env, &return_value));

    add_returned_status(env,
            "envIsNull",
            return_value,
            "Invalid argument",
            napi_invalid_arg,
            napi_define_properties(NULL, object, 1, &desc));

    napi_define_properties(env, NULL, 1, &desc);
    add_last_status(env, "objectIsNull", return_value);

    napi_define_properties(env, object, 1, NULL);
    add_last_status(env, "descriptorListIsNull", return_value);

    desc.utf8name = NULL;
    napi_define_properties(env, object, 1, NULL);
    add_last_status(env, "utf8nameIsNull", return_value);
    desc.utf8name = "prop";

    desc.method = NULL;
    napi_define_properties(env, object, 1, NULL);
    add_last_status(env, "methodIsNull", return_value);
    desc.method = defineProperties;

    return return_value;
}

static napi_value getNewTarget(napi_env env, napi_callback_info info) {
    napi_value newTargetArg;
    NAPI_CALL(env, napi_get_new_target(env, info, &newTargetArg));
    napi_value thisArg;
    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));
    napi_value undefined;
    NAPI_CALL(env, napi_get_undefined(env, &undefined));

    bool result;
    NAPI_CALL(env, napi_strict_equals(env, newTargetArg, thisArg, &result));
    NAPI_ASSERT(env, !result, "this !== new.target");

    NAPI_ASSERT(env, newTargetArg != NULL, "newTargetArg != NULL");
    NAPI_CALL(env, napi_strict_equals(env, newTargetArg, undefined, &result));
    NAPI_ASSERT(env, !result, "new.target !== undefined");

    return thisArg;
}

static napi_value wrap(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value arg;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &arg, NULL, NULL));

    NAPI_CALL(env, napi_wrap(env, arg, &test_value, NULL, NULL, NULL));
    return NULL;
}

static napi_value unwrap(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value arg;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &arg, NULL, NULL));

    void* data;
    NAPI_CALL(env, napi_unwrap(env, arg, &data));

    bool is_expected = (data != NULL && *(int*)data == 3);
    napi_value result;
    NAPI_CALL(env, napi_get_boolean(env, is_expected, &result));
    return result;
}

static napi_value removeWrap(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value wrapped;
    void* data;

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &wrapped, NULL, NULL));
    NAPI_CALL(env, napi_remove_wrap(env, wrapped, &data));

    return NULL;
}

static napi_value getVersion(napi_env env, napi_callback_info info) {
    uint32_t version;
    napi_value result;
    NAPI_CALL(env, napi_get_version(env, &version));
    NAPI_CALL(env, napi_create_uint32(env, version, &result));
    return result;
}

static napi_value createPromise(napi_env env, napi_callback_info info) {
    napi_value promise;

    // We do not overwrite an existing deferred.
    if (deferred != NULL) {
        return NULL;
    }

    NAPI_CALL(env, napi_create_promise(env, &deferred, &promise));

    return promise;
}

static napi_value resolveAndRejectDeferred(napi_env env, napi_callback_info info) {
    napi_value argv[2];
    size_t argc = 2;
    bool resolution;

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, argv, NULL, NULL));
    NAPI_CALL(env, napi_get_value_bool(env, argv[1], &resolution));
    if (resolution) {
        NAPI_CALL(env, napi_resolve_deferred(env, deferred, argv[0]));
    } else {
        NAPI_CALL(env, napi_reject_deferred(env, deferred, argv[0]));
    }

    deferred = NULL;

    return NULL;
}

static napi_value isPromise(napi_env env, napi_callback_info info) {
    napi_value promise, result;
    size_t argc = 1;
    bool is_promise;

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &promise, NULL, NULL));
    NAPI_CALL(env, napi_is_promise(env, promise, &is_promise));
    NAPI_CALL(env, napi_get_boolean(env, is_promise, &result));

    return result;
}

static napi_value runScript(napi_env env, napi_callback_info info) {
    napi_value script, result;
    size_t argc = 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &script, NULL, NULL));

    NAPI_CALL(env, napi_run_script(env, script, &result));

    return result;
}

static napi_value TestLatin1(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t buffer_size = 128;
    size_t copied;

    NAPI_CALL(env,
            napi_get_value_string_latin1(env, args[0], buffer, buffer_size, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_latin1(env, buffer, copied, &output));

    return output;
}
// test the napi function
static napi_value napCreateArrayBuffer(napi_env env, napi_callback_info info) {
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1024;
    napi_status status = napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_create_arraybuffer");
    NAPI_ASSERT(env, arrayBuffer != nullptr, "success create_arrayBuffer");
    
    return arrayBuffer;
}

static napi_value naiGetArrayBufferInfo(napi_env env, napi_callback_info info) {
    // the value to return
    napi_value arrayBuffer;
    napi_status status;
    void* yourPointer = nullptr;
    size_t arrayBufferSize = 1024;
    status = napi_create_arraybuffer(env, arrayBufferSize, &yourPointer, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_create_arraybuffer");
    
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    status = napi_get_arraybuffer_info(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_get_arraybuffer_info");
  
    napi_value arrayLength;
    // return the length of array js type int
    NAPI_CALL(env, napi_create_int32(env, arrayBufferLength, &arrayLength));
    
    return arrayLength;
}

static napi_value napiNewInstance(napi_env env, napi_callback_info info) {
    // the value to return
    napi_value global, constructor, arg, value;
    napi_status status = napi_get_global(env, &global);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_global success");
    status = napi_get_named_property(env, global, "MyObject", &constructor);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_named_property success");
    status = napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &arg);
    napi_value* argv = &arg;
    size_t argc = 1;
    napi_status _status = napi_new_instance(env, constructor, argc, argv, &value);
    NAPI_ASSERT(env, _status != napi_ok, "fail to napi_new_instance");
    
    return value;
}

static napi_value napiDefineClass(napi_env env, napi_callback_info info) {
    napi_value testWrapClass = nullptr;
    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH, [](napi_env env, napi_callback_info info) -> napi_value {
                  napi_value thisVar = nullptr;
                  napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
                  return thisVar;
              }, nullptr, 0, nullptr, &testWrapClass);
      
    napi_value instanceValue = nullptr;
    napi_new_instance(env, testWrapClass, 0, nullptr, &instanceValue);
    NAPI_ASSERT(env, instanceValue != nullptr, "success napiDefineClass");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    
    return value;
}

static napi_value napiRunScriptPath(napi_env env, napi_callback_info info) {    
    napi_value value; 
    char const* path = "/index/name";  
    napi_status status = napi_run_script_path(env, path, &value);
    NAPI_ASSERT(env, status == napi_ok, "napi_run_script_path ok");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value napiGetNodeVersion(napi_env env, napi_callback_info info) {
    napi_value value;
    const napi_node_version* version;
    napi_get_node_version(env, &version);
    const char* release = version->release;
    napi_status status = napi_create_string_utf8(env, release, strlen(release), &value);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_string_utf8 ok");
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value napiCallThreadsafeFunction(napi_env env, napi_callback_info info) {
    void *data = nullptr;
    napi_threadsafe_function func = (napi_threadsafe_function)data;
    napi_threadsafe_function_call_mode blockMode = napi_tsfn_nonblocking;
    void* context = nullptr;
    napi_status status = napi_get_threadsafe_function_context(func, &context);
    NAPI_ASSERT(env, status != napi_ok, "napi_get_threadsafe_function_context fail");
    static int32_t g_sendData = 0;
    napi_call_threadsafe_function(func, &g_sendData, blockMode);
    status = napi_call_threadsafe_function(func, &g_sendData, blockMode);
    NAPI_ASSERT(env, status != napi_ok, "napi_call_threadsafe_function fail");
    napi_release_threadsafe_function(func, napi_tsfn_release);
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    
    return value;
}

static void TsFuncFinalTotalFour(napi_env env, void* finalizeData, void* hint) {
    static uv_thread_t g_uvThreadTest7;
    uv_thread_join(&g_uvThreadTest7);
}
    
static void TsFuncCallJsFour(napi_env env, napi_value tsfn_cb, void* context, void* data) {
    int* pData = (int32_t*)data;
    printf("TsFuncCallJsFour is %p \n", pData);
}

static napi_value napiCreateThreadsafeFunction(napi_env env, napi_callback_info info) {    
    napi_threadsafe_function tsFunc = nullptr;
    napi_value resourceName = 0;
    napi_create_string_latin1(env, __func__, NAPI_AUTO_LENGTH, &resourceName);
    int32_t  callJstCbDataTestId = 101;
    int32_t  finalCbtDataTestID = 1001;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, resourceName, 
         0, 1, &callJstCbDataTestId, TsFuncFinalTotalFour, &finalCbtDataTestID, TsFuncCallJsFour, &tsFunc);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_threadsafe_function");
    
    napi_acquire_threadsafe_function(tsFunc);  
    status = napi_unref_threadsafe_function(env, tsFunc);
    NAPI_ASSERT(env, status == napi_ok, "napi_unref_threadsafe_function");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value napiCancelAsyncWork(napi_env env, napi_callback_info info) {
    napi_async_work work = nullptr;
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "AsyncWorkTest", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, [](napi_env value, void* data) {},
                                [](napi_env env, napi_status status, void* data) {
                                    napi_async_work workData = (napi_async_work)data;
                                    napi_delete_async_work(env, workData);
                                }, work, &work);
    napi_queue_async_work(env, work);
    napi_cancel_async_work(env, work);
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    
    return value;
}

static napi_value SayHello(napi_env env, napi_callback_info info) {
    printf("Hello\n");
    
    return NULL;
}

static napi_value napiCreateFunction(napi_env env, napi_callback_info info) {
    napi_value funcValue = nullptr;
    napi_status status = napi_create_function(env, NULL, 0, SayHello, NULL, &funcValue);
    NAPI_ASSERT(env, status != napi_ok, "napi_create_function fail");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 1, &value));
    
    return value;
}


static napi_value napiRefthreadSafeFunction(napi_env env, napi_callback_info info) {
    napi_threadsafe_function tsFunc = nullptr;
    napi_value resourceName = 0;
    napi_create_string_latin1(env, __func__, NAPI_AUTO_LENGTH, &resourceName);
    int32_t callJsCbDataTestId = 101;
    int32_t finalCbDataTestId = 1001;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, resourceName, 
       0, 1, &callJsCbDataTestId, TsFuncFinalTotalFour, &finalCbDataTestId, TsFuncCallJsFour, &tsFunc);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_threadsafe_function");
    
    status = napi_ref_threadsafe_function(env, tsFunc);
    NAPI_ASSERT(env, status == napi_ok, "napi_ref_threadsafe_function");
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value napiCreateDate(napi_env env, napi_callback_info info) {
    napi_value createResult = nullptr;
    double time = 202110181203150;
    napi_status status = napi_create_date(env, time, &createResult);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_date success");
    double getTime = false;
    napi_get_date_value(env, createResult, &getTime);
    bool result = false;
    if (time == getTime) {
        result = true;
    }
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, result, &value));
    
    return value;
}

static napi_value napiCreateBigintUint64(napi_env env, napi_callback_info info) {
    uint64_t testValue = UINT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_uint64(env, testValue, &result);
         
    uint64_t resultValue = 0;
    bool flag = false;
    napi_get_value_bigint_uint64(env, result, &resultValue, &flag);
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, flag, &value));
    
    return value;
}

static napi_value napiCreateBigintInt64(napi_env env, napi_callback_info info) {
    
    int64_t testValue = INT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_int64(env, testValue, &result);
    int64_t resultValue = 0;
    bool flag = false;
    napi_get_value_bigint_int64(env, result, &resultValue, &flag);
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, flag, &value));
    
    return value;
}

static napi_value napiCreateBigintWords(napi_env env, napi_callback_info info) {
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = { 0xFFFFFFFFFFFFFFFF, 34ULL, 56ULL, 0xFFFFFFFFFFFFFFFF };
    uint64_t wordsOut[] = { 0ULL, 0ULL, 0ULL, 0ULL };
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_bigint_words(env, signBit, wordCount, words, &result));
    NAPI_CALL(env, napi_get_value_bigint_words(env, result, &signBit, &wordCount, wordsOut));
    bool testResult = false;
    const int word_count = 2;
    if (signBit == 0 && wordCount == word_count && words[0] == wordsOut[0] && words[1] == wordsOut[1]) {
        testResult = true;
    }
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, testResult, &value));
    
    return value;
}

static napi_value napiFatalerror(napi_env env, napi_callback_info info) {
    void *data = nullptr;
    napi_threadsafe_function tsfun = static_cast<napi_threadsafe_function>(data);
    if (napi_release_threadsafe_function(tsfun, napi_tsfn_release) == napi_ok) {
        napi_fatal_error("ReleaseThreadsafeFunction", NAPI_AUTO_LENGTH, "napi_release_threadsafe_function failed", NAPI_AUTO_LENGTH);
    }
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}





EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports) {
    
    napi_property_descriptor properties[] = { DECLARE_NAPI_FUNCTION("getLastErrorInfo", getLastErrorInfo),
    DECLARE_NAPI_FUNCTION("cleanUpErrorInfo", cleanUpErrorInfo),
    DECLARE_NAPI_FUNCTION("throwExistingError", throwExistingError),
    DECLARE_NAPI_FUNCTION("throwError", throwError),
    DECLARE_NAPI_FUNCTION("throwTypeError", throwTypeError),
    DECLARE_NAPI_FUNCTION("throwRangeError", throwRangeError),
    DECLARE_NAPI_FUNCTION("isError", isError),
    DECLARE_NAPI_FUNCTION("createError", createError),
    DECLARE_NAPI_FUNCTION("createTypeError", createTypeError),
    DECLARE_NAPI_FUNCTION("createRangeError", createRangeError),
    DECLARE_NAPI_FUNCTION("getAndClearLastException", getAndClearLastException),
    DECLARE_NAPI_FUNCTION("isExceptionPending", isExceptionPending),
    DECLARE_NAPI_FUNCTION("openAndCloseHandleScope", openAndCloseHandleScope),
    DECLARE_NAPI_FUNCTION("openAndCloseEscapableHandleScope", openAndCloseEscapableHandleScope),
    DECLARE_NAPI_FUNCTION("createReference", createReference),
    DECLARE_NAPI_FUNCTION("deleteReference", deleteReference),
    DECLARE_NAPI_FUNCTION("referenceRef", referenceRef),
    DECLARE_NAPI_FUNCTION("referenceUnref", referenceUnref),
    DECLARE_NAPI_FUNCTION("getReferenceValue", getReferenceValue),
    DECLARE_NAPI_FUNCTION("createArrayAndGetLength", createArrayAndGetLength),
    DECLARE_NAPI_FUNCTION("getArrayWithLength", getArrayWithLength),
    DECLARE_NAPI_FUNCTION("createExternal", createExternal),
    DECLARE_NAPI_FUNCTION("createExternalArraybuffer", createExternalArraybuffer),
    DECLARE_NAPI_FUNCTION("createObject", createObject),
    DECLARE_NAPI_FUNCTION("createSymbol", createSymbol),
    DECLARE_NAPI_FUNCTION("createTypeArray", createTypeArray),
    DECLARE_NAPI_FUNCTION("createDataView", createDataView),
    DECLARE_NAPI_FUNCTION("createAndGetInt32", createAndGetInt32),
    DECLARE_NAPI_FUNCTION("createAndGetUInt32", createAndGetUInt32),
    DECLARE_NAPI_FUNCTION("createAndGetInt64", createAndGetInt64),
    DECLARE_NAPI_FUNCTION("createDouble", createDouble),
    DECLARE_NAPI_FUNCTION("createAndGetStringLatin1", createAndGetStringLatin1),
    DECLARE_NAPI_FUNCTION("createAndGetStringUtf8", createAndGetStringUtf8),
    DECLARE_NAPI_FUNCTION("getPrototype", getPrototype),
    DECLARE_NAPI_FUNCTION("getDataViewInfo", getDataViewInfo),
    DECLARE_NAPI_FUNCTION("getValueBool", getValueBool),
    DECLARE_NAPI_FUNCTION("getValueDouble", getValueDouble),
    DECLARE_NAPI_FUNCTION("getValueExternal", getValueExternal),
    DECLARE_NAPI_FUNCTION("getNull", getNull),
    DECLARE_NAPI_FUNCTION("getUndefined", getUndefined),
    DECLARE_NAPI_FUNCTION("coerceToBool", coerceToBool),
    DECLARE_NAPI_FUNCTION("coerceToNumber", coerceToNumber),
    DECLARE_NAPI_FUNCTION("coerceToObject", coerceToObject),
    DECLARE_NAPI_FUNCTION("coerceToString", coerceToString),
    DECLARE_NAPI_FUNCTION("instanceOf", instanceOf),
    DECLARE_NAPI_FUNCTION("isArray", isArray),
    DECLARE_NAPI_FUNCTION("isDate", isDate),
    DECLARE_NAPI_FUNCTION("strictEquals", strictEquals),
    DECLARE_NAPI_FUNCTION("getPropertyNames", getPropertyNames),
    DECLARE_NAPI_FUNCTION("setProperty", setProperty),
    DECLARE_NAPI_FUNCTION("getProperty", getProperty),
    DECLARE_NAPI_FUNCTION("hasProperty", hasProperty),
    DECLARE_NAPI_FUNCTION("deleteProperty", deleteProperty),
    DECLARE_NAPI_FUNCTION("hasOwnProperty", hasOwnProperty),
    DECLARE_NAPI_FUNCTION("setNamedProperty", setNamedProperty),
    DECLARE_NAPI_FUNCTION("getNamedProperty", getNamedProperty),
    DECLARE_NAPI_FUNCTION("hasNamedProperty", hasNamedProperty),
    DECLARE_NAPI_FUNCTION("setElement", setElement),
    DECLARE_NAPI_FUNCTION("getElement", getElement),
    DECLARE_NAPI_FUNCTION("hasElement", hasElement),
    DECLARE_NAPI_FUNCTION("deleteElement", deleteElement),
    DECLARE_NAPI_FUNCTION("defineProperties", defineProperties),
    DECLARE_NAPI_FUNCTION("getNewTarget", getNewTarget),
    DECLARE_NAPI_FUNCTION("wrap", wrap),
    DECLARE_NAPI_FUNCTION("unwrap", unwrap),
    DECLARE_NAPI_FUNCTION("removeWrap", removeWrap),
    DECLARE_NAPI_FUNCTION("getVersion", getVersion),
    DECLARE_NAPI_FUNCTION("createPromise", createPromise),
    DECLARE_NAPI_FUNCTION("resolveAndRejectDeferred", resolveAndRejectDeferred),
    DECLARE_NAPI_FUNCTION("isPromise", isPromise),
    DECLARE_NAPI_FUNCTION("TestLatin1", TestLatin1),
    DECLARE_NAPI_FUNCTION("runScript", runScript),
    DECLARE_NAPI_FUNCTION("napCreateArrayBuffer", napCreateArrayBuffer),
    DECLARE_NAPI_FUNCTION("naiGetArrayBufferInfo", naiGetArrayBufferInfo),
    DECLARE_NAPI_FUNCTION("napiNewInstance", napiNewInstance),
    DECLARE_NAPI_FUNCTION("napiDefineClass", napiDefineClass),
    DECLARE_NAPI_FUNCTION("napiRunScriptPath", napiRunScriptPath),
    DECLARE_NAPI_FUNCTION("napiGetNodeVersion", napiGetNodeVersion),
    DECLARE_NAPI_FUNCTION("napiCallThreadsafeFunction", napiCallThreadsafeFunction),
    DECLARE_NAPI_FUNCTION("napiCreateThreadsafeFunction", napiCreateThreadsafeFunction),
    DECLARE_NAPI_FUNCTION("napiRefthreadSafeFunction", napiRefthreadSafeFunction),
    DECLARE_NAPI_FUNCTION("napiCreateDate", napiCreateDate),
    DECLARE_NAPI_FUNCTION("napiCreateBigintUint64", napiCreateBigintUint64),
    DECLARE_NAPI_FUNCTION("napiCreateBigintInt64", napiCreateBigintInt64),
    DECLARE_NAPI_FUNCTION("napiCreateBigintWords", napiCreateBigintWords),
    { "napiCancelAsyncWork", nullptr, napiCancelAsyncWork, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "napiCreateFunction", nullptr, napiCreateFunction, nullptr, nullptr, nullptr, napi_default, nullptr },
    DECLARE_NAPI_FUNCTION("napiFatalerror", napiFatalerror), };
    NAPI_CALL(env, napi_define_properties(env, exports, sizeof(properties) / sizeof(properties[0]), properties));
    return exports;
}

EXTERN_C_END

static napi_module
demoModule = {
.nm_version = 1,
.nm_flags = 0,
.nm_filename = nullptr,
.nm_register_func = Init,
.nm_modname = "napitest",
.nm_priv = ((void *)0),
.reserved = {
0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
napi_module_register(& demoModule);
}
