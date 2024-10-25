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
#include <cstddef>
#include <cstdlib>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <csignal>
#include <sys/wait.h>
#include <unistd.h>

void SignalHandlerAbort(int signum)
{
    kill(getpid(), SIGSTOP);
}

// To detect reads from, or writes to, a misaligned pointer,
// or when you create a misaligned reference.
// A pointer misaligns if its address isn’t a multiple of its type’s alignment.
static napi_value MisAlign(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            // deliberately convert in C-style cast to trigger UBSan check
            signed short int *buffer = (signed short int *)malloc(64);
            signed long int *pointer = (signed long int *)(buffer + 1);
            *pointer = 42; // 42 is an arbitrary number to deliberately trigger UBSan check
            res = *pointer;
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To access indexes that exceed the array’s bounds.
static napi_value Bounds(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            int param;
            napi_get_value_int32(env, args[0], &param);
            int array[5] = {0};
            res = array[param];
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect integer and float division where the divisor is zero.
static napi_value IntegerDivBy0(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            int param;
            napi_get_value_int32(env, args[0], &param);
            res = 2 / param; // deliberately assign divisor to 0 to trigger UBSan check
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect accesses of an enumeration variable
// when its value isn’t within the valid range for the type.
// This can occur for uninitialized enumeration values,
// or when using an integer as an enumeration value without an appropriate cast.
enum E {
    A = 1,
    B = 2
};

static napi_value EnumSan(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            int param;
            napi_get_value_int32(env, args[0], &param);
            // deliberately convert from integer to enum to trigger the undefined behavior of enum
            enum E *e = (enum E *)&param;
            if (*e == A) {
                res = 1;
            }
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect out-of-range casts to, from, or between floating-point types.
static napi_value FloatCastOverflow(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            // deliberately convert from double to integer
            // to trigger the undefined behavior of float-cast-overflow
            double n = 10e50;
            res = (int)n;
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect signed integer overflows in addition, subtraction, multiplication, and division.
static napi_value SignedIntegerOverflow(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            int param;
            napi_get_value_int32(env, args[0], &param);
            res = param * 42; // 42 is an arbitrary number to deliberately trigger UBSan check
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

struct Animal {
    virtual const char* Speak() = 0;
};

struct Cat: public Animal {
    const char* Speak() override
    {
        return "meow";
    }
};

struct Dog: public Animal {
    const char* Speak() override
    {
        return "woof";
    }
};

const char* Vptr(Animal* obj)
{
    auto *dog = reinterpret_cast<Dog*>(obj);
    return dog->Speak();
}

// To detect when an object has the wrong dynamic type.
static napi_value VptrCheck(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            Vptr(new Cat);
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect when a function that has an argument with the nonnull attribute receives a null value.
int Foo0(__attribute__((nonnull)) void *p)
{
    return 1;
}

static napi_value NonnullAttribute(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            void* arr[3] = {nullptr, malloc(4), nullptr};
            int param;
            napi_get_value_int32(env, args[0], &param);
            res = Foo0(arr[param]);
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect the creation of null references and null pointer dereferences.
// If the compiler finds a pointer dereference, it treats that pointer as nonnull.
// As a result, the optimizer may remove null equality checks for dereferenced pointers.
int& Foo1(int *x)
{
    return *(int *)x; // deliberately use of a null pointer to trigger the undefined behavior of null
}

static napi_value NullSanitize(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            // deliberately convert in C-style cast to trigger UBSan check
            int* arr[3] = {nullptr, (int *)malloc(4), nullptr};
            int param;
            napi_get_value_int32(env, args[0], &param);
            res = Foo1(arr[param]);
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect pointer casts when the size of the source type
// is less than the size of the destination type.
class Base {
};
class Derived : public Base {
    public:
    int pad2;
    Derived() : pad2(1) {}
};

// To detect the pointer arithmetic which overflows,
// or where either the old or new pointer value is a null pointer
int* Foo2(int i)
{
    int *p = (int *)UINTPTR_MAX;
    return p + i;
}

static napi_value PointerOverflow(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            int param;
            napi_get_value_int32(env, args[0], &param);
            res = *(Foo2(param));
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect when a function with the returns_nonnull attribute returns null.
__attribute__((nonnull)) int *Foo3(int *p)
{
    return p;
}

static napi_value ReturnNonnullAttribute(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            // deliberately convert in C-style cast to trigger UBSan check
            int* arr[3] = {nullptr, (int *)malloc(sizeof(int)), nullptr};
            int param;
            napi_get_value_int32(env, args[0], &param);
            Foo3(arr[param]);
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect bitwise shifts with invalid shift amounts and shifts that might overflow
// shift-base is to check only left-hand side of shift operation
static napi_value ShiftBase(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            int param;
            napi_get_value_int32(env, args[0], &param);
            int x = 1;
            res = x << param;
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// shift-exponent is to check only right-hand side of shift operation
static napi_value ShiftExponent(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            int param;
            napi_get_value_int32(env, args[0], &param);
            int x = -1;
            res = x >> param;
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect accesses to a Boolean variable when its value isn’t true or false.
// This problem can occur when using an integer or pointer without an appropriate cast.
static napi_value UndefinedBool(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            // deliberately convert from integer to bool
            // to trigger the undefined behavior of float-cast-overflow
            int x = 42;
            bool *predicate = (bool *)(&x);
            if (*predicate) {
                res = 1;
            } else {
                res = 0;
            }
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

// To detect negative array bounds.
static napi_value VlaBound(napi_env env, napi_callback_info info)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandlerAbort,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int res = -1;
    switch (pid) {
        case -1: {
            break;
        }
        case 0: {
            int param;
            napi_get_value_int32(env, args[0], &param);
            int vla[param];
            res = sizeof(vla);
            exit(0);
        }
        default: {
            waitpid(pid, &status, WUNTRACED);
            res = WSTOPSIG(status);
            kill(pid, SIGCONT);
            break;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "misAlign", nullptr, MisAlign, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "bounds", nullptr, Bounds, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "integerDivBy0", nullptr, IntegerDivBy0, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "enumSan", nullptr, EnumSan, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "floatCastOverflow", nullptr, FloatCastOverflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "signedIntegerOverflow", nullptr, SignedIntegerOverflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "vptrCheck", nullptr, VptrCheck, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nonnullAttribute", nullptr, NonnullAttribute, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nullSanitize", nullptr, NullSanitize, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "pointerOverflow", nullptr, PointerOverflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "returnNonnullAttribute", nullptr, ReturnNonnullAttribute, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftBase", nullptr, ShiftBase, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftExponent", nullptr, ShiftExponent, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "undefinedBool", nullptr, UndefinedBool, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "vlaBound", nullptr, VlaBound, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
