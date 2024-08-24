#ifndef JSVM_UTILS_H
#define JSVM_UTILS_H

#include <sstream>

#if defined(OHOS_JSVM_HAP) && !defined(OHOS_JSVM_XTS)
#include "ark_runtime/jsvm.h"
#else
#include "jsvm.h"
#endif

#include <cstdint>
#include <cstdio>
#include <cstring>
#include <iostream>
#include <string>

#include "test_utils.h"

extern JSVM_Env jsvm_env;

[[maybe_unused]] static void PrintException(JSVM_Env env, JSVM_Value exception, const char *call) {
    bool isObject = false;
    JSVM_Status status = OH_JSVM_IsObject(env, exception, &isObject);
    CHECK_FATAL(status == JSVM_OK, "[bug] [%s]", call);
    CHECK_FATAL(isObject, "[bug] exception returned from OH_JSVM_GetAndClearLastException is not a JS object [%s]",
                call);

    JSVM_Value stack;
    status = OH_JSVM_GetNamedProperty(env, exception, "stack", &stack);
    CHECK_FATAL(status == JSVM_OK, "[bug] [%s]", call);
    char stackStr[256];
    OH_JSVM_GetValueStringUtf8(env, stack, stackStr, 256, nullptr);
    std::stringstream ss;
    ss << "[PrintException] exception.stack: " << stackStr;
    print(ss.str().c_str());

    status = OH_JSVM_GetNamedProperty(env, exception, "message", &stack);
    CHECK_FATAL(status == JSVM_OK, "[bug] [%s]", call);
    char messageStr[256];
    OH_JSVM_GetValueStringUtf8(env, stack, messageStr, 256, nullptr);
    std::stringstream ss2;
    ss2 << "[PrintException] exception.message: " << messageStr;
    print(ss2.str().c_str());
}

[[maybe_unused]] static void CheckErrorAndException(JSVM_Env env, JSVM_Status returnStatus, const char *call) {
    const JSVM_ExtendedErrorInfo *errorInfo;
    JSVM_Status status = OH_JSVM_GetLastErrorInfo(env, &errorInfo);
    CHECK_FATAL(status == JSVM_OK, "[bug] [%s]", call);
    CHECK_FATAL(returnStatus == errorInfo->errorCode,
                "[bug] return status (%d) is not equal to errorInfo status (%d) [%s]", returnStatus,
                errorInfo->errorCode, call);
    bool isPending = false;
    status = OH_JSVM_IsExceptionPending(env, &isPending);
    CHECK_FATAL(status == JSVM_OK, "[bug] [%s]", call);
    JSVM_Value exception;
    status = OH_JSVM_GetAndClearLastException(env, &exception);
    CHECK_FATAL(status == JSVM_OK, "[bug] [%s]", call);
    bool isExceptionUndefined = false;
    status = OH_JSVM_IsUndefined(env, exception, &isExceptionUndefined);
    CHECK_FATAL(status == JSVM_OK, "[bug] [%s]", call);
    bool hasException = !isExceptionUndefined;
    if (hasException) {
        CHECK_FATAL(isPending, "[bug] There is exception caught, but pending is not set [%s]", call);
        CHECK_FATAL(returnStatus != JSVM_OK, "[bug] There is exception caught, bug return status is JSVM_OK [%s]",
                    call);
        PrintException(env, exception, call);
        CHECK_FATAL(false, "found exception!! [%s]", call);
    } else {
        // no exception
        CHECK_FATAL(!isPending, "[bug] There is no exception caught, but pending is set [%s]", call);
    }
    CHECK_FATAL(returnStatus == JSVM_OK, "expected return status JSVM_OK, bug get %d [%s]", returnStatus, call);
}

#ifndef OHOS_JSVM_XTS
#define JSVM_CALL(the_call)                                  \
    do {                                                     \
        JSVM_Status status = (the_call);                     \
        CheckErrorAndException(jsvm_env, status, #the_call); \
    } while (0)
#endif
#define JSVMTEST_CALL(the_call)                              \
    do {                                                     \
        JSVM_Status status = (the_call);                     \
        CheckErrorAndException(jsvm_env, status, #the_call); \
    } while (0)

// jsvm utils
namespace jsvm {

class HandleScope {
   public:
    HandleScope(JSVM_Env jsvmEnv) : env(jsvmEnv) {
        OH_JSVM_OpenHandleScope(env, &scope);
    }
    ~HandleScope() {
        OH_JSVM_CloseHandleScope(env, scope);
    }

   private:
    JSVM_Env env;
    JSVM_HandleScope scope;
};

class Value {
   public:
    Value(JSVM_Value value) : value_(value) {}

    operator JSVM_Value() const {
        return value_;
    }

   protected:
    JSVM_Value value_;
};

class Object : Value {
   public:
    explicit Object(JSVM_Value jsvm_value) : Value(jsvm_value) {
        bool isObject = false;
        OH_JSVM_IsObject(jsvm_env, this->value_, &isObject);
        CHECK_FATAL(isObject, "expected a js object");
    }

    JSVM_Value Get(const char *propName) {
        JSVM_Value result;
        OH_JSVM_GetNamedProperty(jsvm_env, this->value_, propName, &result);
        return result;
    }

    void Set(const char *propName, JSVM_Value propValue) {
        OH_JSVM_SetNamedProperty(jsvm_env, this->value_, propName, propValue);
    }
};

// global functions
[[maybe_unused]] [[maybe_unused]] static inline JSVM_Value Str(const char *s) {
    JSVM_Value str;
    JSVMTEST_CALL(OH_JSVM_CreateStringUtf8(jsvm_env, s, JSVM_AUTO_LENGTH, &str));
    return str;
}

[[maybe_unused]] static inline JSVM_Value Str(const std::string &stdString) {
    return Str(stdString.c_str());
}

[[maybe_unused]] static inline JSVM_Script Compile(JSVM_Value js_str, const uint8_t *cache = nullptr,
                                                   size_t size = JSVM_AUTO_LENGTH) {
    JSVM_Script script;
    JSVMTEST_CALL(OH_JSVM_CompileScript(jsvm_env, js_str, cache, size, false, nullptr, &script));
    return script;
}

[[maybe_unused]] static inline JSVM_Script CompileWithName(JSVM_Value js_str, const char *name) {
    JSVM_Script script;
    JSVM_ScriptOrigin origin = {
        .sourceMapUrl = nullptr,
        .resourceName = name,
    };
    JSVMTEST_CALL(
        OH_JSVM_CompileScriptWithOrigin(jsvm_env, js_str, NULL, JSVM_AUTO_LENGTH, false, NULL, &origin, &script));
    return script;
}

[[maybe_unused]] static inline JSVM_Script Compile(const char *s, const uint8_t *cache = nullptr,
                                                   size_t size = JSVM_AUTO_LENGTH) {
    return Compile(Str(s), cache, size);
}

[[maybe_unused]] static inline JSVM_Script CompileWithName(const char *s, const char *name) {
    return CompileWithName(Str(s), name);
}

[[maybe_unused]] static inline JSVM_Value Run(JSVM_Script script) {
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_RunScript(jsvm_env, script, &result));
    return result;
}

[[maybe_unused]] static inline JSVM_Value Run(const char *s) {
    return Run(Compile(s));
}

[[maybe_unused]] static inline bool ToBoolean(JSVM_Value val) {
    JSVM_Value js_boolean;
    JSVMTEST_CALL(OH_JSVM_CoerceToBool(jsvm_env, val, &js_boolean));
    bool res;
    JSVMTEST_CALL(OH_JSVM_GetValueBool(jsvm_env, js_boolean, &res));
    return res;
}

[[maybe_unused]] static inline double ToNumber(JSVM_Value val) {
    JSVM_Value js_number;
    JSVMTEST_CALL(OH_JSVM_CoerceToNumber(jsvm_env, val, &js_number));
    double res;
    JSVMTEST_CALL(OH_JSVM_GetValueDouble(jsvm_env, js_number, &res));
    return res;
}

[[maybe_unused]] static inline std::string ToString(JSVM_Value val) {
    JSVM_Value js_string;
    JSVMTEST_CALL(OH_JSVM_CoerceToString(jsvm_env, val, &js_string));
    size_t length = 0;
    JSVMTEST_CALL(OH_JSVM_GetValueStringUtf8(jsvm_env, js_string, NULL, 0, &length));
    size_t capacity = length + 1;
    char *buffer = new char[capacity];
    size_t copy_length = 0;
    JSVMTEST_CALL(OH_JSVM_GetValueStringUtf8(jsvm_env, js_string, buffer, capacity, &copy_length));
    std::string str(buffer);
    delete[] buffer;
    return str;
}

[[maybe_unused]] static inline JSVM_Value True() {
    JSVM_Value js_true;
    JSVMTEST_CALL(OH_JSVM_GetBoolean(jsvm_env, true, &js_true));
    return js_true;
}

[[maybe_unused]] static inline JSVM_Value False() {
    JSVM_Value js_false;
    JSVMTEST_CALL(OH_JSVM_GetBoolean(jsvm_env, false, &js_false));
    return js_false;
}

[[maybe_unused]] static inline JSVM_Value Undefined() {
    JSVM_Value js_undefined;
    JSVMTEST_CALL(OH_JSVM_GetUndefined(jsvm_env, &js_undefined));
    return js_undefined;
}

[[maybe_unused]] static inline JSVM_Value Null() {
    JSVM_Value js_null;
    JSVMTEST_CALL(OH_JSVM_GetNull(jsvm_env, &js_null));
    return js_null;
}

[[maybe_unused]] static inline JSVM_Value Int32(int32_t v) {
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_CreateInt32(jsvm_env, v, &result));
    return result;
}

[[maybe_unused]] static inline JSVM_Value Int64(int64_t v) {
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_CreateInt64(jsvm_env, v, &result));
    return result;
}

[[maybe_unused]] static inline JSVM_Value Uint32(uint32_t v) {
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_CreateUint32(jsvm_env, v, &result));
    return result;
}

[[maybe_unused]] static inline JSVM_Value Double(double v) {
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_CreateDouble(jsvm_env, v, &result));
    return result;
}

[[maybe_unused]] static inline JSVM_Value Global() {
    JSVM_Value js_global;
    JSVMTEST_CALL(OH_JSVM_GetGlobal(jsvm_env, &js_global));
    return js_global;
}

// object property
[[maybe_unused]] static inline JSVM_Value GetProperty(JSVM_Value object, JSVM_Value key) {
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetProperty(jsvm_env, object, key, &result));
    return result;
}

[[maybe_unused]] static inline JSVM_Value GetProperty(JSVM_Value object, const char *name) {
    return GetProperty(object, Str(name));
}

[[maybe_unused]] static inline void SetProperty(JSVM_Value object, JSVM_Value key, JSVM_Value value) {
    JSVMTEST_CALL(OH_JSVM_SetProperty(jsvm_env, object, key, value));
}

[[maybe_unused]] static inline void SetProperty(JSVM_Value object, const char *name, JSVM_Value value) {
    JSVMTEST_CALL(OH_JSVM_SetProperty(jsvm_env, object, Str(name), value));
}

// Get named property with name `name` from globalThis
[[maybe_unused]] static inline JSVM_Value Global(const char *name) {
    return GetProperty(Global(), Str(name));
}

// Get property with key `key` from globalThis
[[maybe_unused]] static inline JSVM_Value Global(JSVM_Value key) {
    return GetProperty(Global(), key);
}

// Call function with normal function with empty argument list
[[maybe_unused]] static inline JSVM_Value Call(JSVM_Value func) {
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_CallFunction(jsvm_env, Undefined(), func, 0, NULL, &result));
    return result;
}

// Call function with normal function with specified argument list
[[maybe_unused]] static inline JSVM_Value Call(JSVM_Value func, JSVM_Value thisArg,
                                               std::initializer_list<JSVM_Value> args) {
    JSVM_Value result;
    int argc = args.size();
    if (argc == 0) {
        JSVMTEST_CALL(OH_JSVM_CallFunction(jsvm_env, thisArg, func, 0, NULL, &result));
        return result;
    }
    JSVM_Value argv[argc];
    size_t i = 0;
    for (JSVM_Value a : args) {
        argv[i++] = a;
    }
    JSVMTEST_CALL(OH_JSVM_CallFunction(jsvm_env, thisArg, func, argc, argv, &result));
    return result;
}

// Call function as constructor with empty argument list
[[maybe_unused]] static inline JSVM_Value New(JSVM_Value constructor) {
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_NewInstance(jsvm_env, constructor, 0, NULL, &result));
    return result;
}

[[maybe_unused]] static inline bool InstanceOf(JSVM_Value value, JSVM_Value constructor) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_Instanceof(jsvm_env, value, constructor, &result));
    return result;
}

[[maybe_unused]] static inline bool IsNull(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsNull(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsUndefined(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsUndefined(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsNullOrUndefined(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsNullOrUndefined(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsBoolean(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsBoolean(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsTrue(JSVM_Value value) {
    return IsBoolean(value) && ToBoolean(value) == true;
}

[[maybe_unused]] static inline bool IsFalse(JSVM_Value value) {
    return IsBoolean(value) && ToBoolean(value) == false;
}

[[maybe_unused]] static inline bool IsNumber(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsNumber(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsString(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsString(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsObject(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsObject(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsBigInt(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsBigInt(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsSymbol(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsSymbol(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsFunction(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsFunction(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsArray(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsArray(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsArraybuffer(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsArraybuffer(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsPromise(JSVM_Value value) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_IsPromise(jsvm_env, value, &result));
    return result;
}

[[maybe_unused]] static inline bool IsWasmModuleObject(JSVM_Value value) {
    bool result;
#ifdef TEST_WASM
    JSVMTEST_CALL(OH_JSVM_IsWasmModuleObject(jsvm_env, value, &result));
#else
    auto Module = jsvm::GetProperty(jsvm::Global("WebAssembly"), "Module");
    result = jsvm::InstanceOf(value, Module);
#endif
    return result;
}

[[maybe_unused]] static inline bool IsWebAssemblyInstance(JSVM_Value value) {
    auto Instance = jsvm::GetProperty(jsvm::Global("WebAssembly"), "Instance");
    return jsvm::InstanceOf(value, Instance);
}

[[maybe_unused]] static inline bool IsWebAssemblyMemory(JSVM_Value value) {
    auto Memory = jsvm::GetProperty(jsvm::Global("WebAssembly"), "Memory");
    return jsvm::InstanceOf(value, Memory);
}

[[maybe_unused]] static inline bool IsWebAssemblyTable(JSVM_Value value) {
    auto Table = jsvm::GetProperty(jsvm::Global("WebAssembly"), "Table");
    return jsvm::InstanceOf(value, Table);
}

[[maybe_unused]] static inline size_t StringLength(JSVM_Value str) {
    CHECK(IsString(str));
    size_t length;
    JSVMTEST_CALL(OH_JSVM_GetValueStringUtf8(jsvm_env, str, NULL, 0, &length));
    return length;
}

[[maybe_unused]] static inline uint32_t ArrayLength(JSVM_Value array) {
    CHECK(IsArray(array));
    uint32_t length;
    JSVMTEST_CALL(OH_JSVM_GetArrayLength(jsvm_env, array, &length));
    return length;
}

[[maybe_unused]] static inline JSVM_Value ArrayAt(JSVM_Value array, uint32_t index) {
    JSVM_Value element;
    JSVMTEST_CALL(OH_JSVM_GetElement(jsvm_env, array, index, &element));
    return element;
}

[[maybe_unused]] static inline JSVM_Value JsonParse(JSVM_Value str) {
    JSVM_Value obj;
    JSVMTEST_CALL(OH_JSVM_JsonParse(jsvm_env, str, &obj));
    return obj;
}

[[maybe_unused]] static inline JSVM_Value JsonStringify(JSVM_Value obj) {
    JSVM_Value str;
    JSVMTEST_CALL(OH_JSVM_JsonStringify(jsvm_env, obj, &str));
    return str;
}

[[maybe_unused]] static inline bool Equals(JSVM_Value lhs, JSVM_Value rhs) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_Equals(jsvm_env, lhs, rhs, &result));
    return result;
}

[[maybe_unused]] static inline bool StrictEquals(JSVM_Value lhs, JSVM_Value rhs) {
    bool result;
    JSVMTEST_CALL(OH_JSVM_StrictEquals(jsvm_env, lhs, rhs, &result));
    return result;
}

// This is a simple log function
static JSVM_Value MyConsoleLog(JSVM_Env env, JSVM_CallbackInfo info) {
    size_t argc = 1;
    JSVM_Value argv[1];
    JSVMTEST_CALL(OH_JSVM_GetCbInfo(env, info, &argc, argv, NULL, NULL));
    JSVM_Value x = argv[0];
    std::string str = jsvm::ToString(x);
    print(str.c_str());
    return jsvm::Undefined();
}

[[maybe_unused]] static void InstallMyConsoleLog(JSVM_Env env) {
    static JSVM_CallbackStruct cb = {MyConsoleLog, NULL};
    JSVM_Value log;
    JSVMTEST_CALL(OH_JSVM_CreateFunction(env, "log", JSVM_AUTO_LENGTH, &cb, &log));
    CHECK(jsvm::IsFunction(log));
    auto console = jsvm::Global("console");
    if (!jsvm::IsObject(console)) {
        JSVMTEST_CALL(OH_JSVM_CreateObject(env, &console));
        jsvm::SetProperty(jsvm::Global(), "console", console);
    }
    jsvm::SetProperty(console, "log", log);
}

}  // namespace jsvm

#endif  // JSVM_UTILS_H
