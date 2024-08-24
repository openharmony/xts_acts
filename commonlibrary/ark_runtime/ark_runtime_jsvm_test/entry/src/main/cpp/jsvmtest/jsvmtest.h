#ifndef __JSVMTEST_H__
#define __JSVMTEST_H__

#include <sstream>

#if defined(OHOS_JSVM_HAP) && !defined(OHOS_JSVM_XTS)
#include "ark_runtime/jsvm.h"
#else
#include "jsvm.h"
#endif

#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

#include "jsvm_utils.h"
#include "test_entry.h"

class TestRunner {
   public:
    static std::vector<TestRunner *> &GetTestVec() {
        static std::vector<TestRunner *> testVec;
        return testVec;
    };
    static std::unordered_map<std::string, TestRunner *> &GetTestMap() {
        static std::unordered_map<std::string, TestRunner *> testMap;
        return testMap;
    }
    static bool g_init;
    static size_t Register(const char *name, TestRunner *test) {
        GetTestVec().push_back(test);
        GetTestMap().emplace(name, test);
        return GetTestVec().size();
    }

    virtual const char *GetName() const {
        CHECK_FATAL(false, "should not be here");
        return NULL;
    }

    virtual bool IsFromScratch() const {
        return false;
    }

    void TestBegin() const {
        std::stringstream ss;
        ss << "[ RUN      ] " << GetName();
        print(ss.str().c_str());
    }

    void TestEnd() const {
        std::stringstream ss;
        ss << "[       OK ] " << GetName();
        print(ss.str().c_str());
    }

    void Run(size_t index = 0) {
        if (IsFromScratch()) {
            TestBegin();
            DoRun();
            TestEnd();
            return;
        }
        if (!g_init) {
            JSVM_InitOptions init_options{};
            memset(&init_options, 0, sizeof(init_options));
            OH_JSVM_Init(&init_options);
            g_init = true;
        }
        OH_JSVM_CreateVM(nullptr, &vm);
        JSVM_VMScope vm_scope;
        OH_JSVM_OpenVMScope(vm, &vm_scope);

        OH_JSVM_CreateEnv(vm, 0, NULL, &env);
        jsvm_env = env;
        JSVM_EnvScope env_scope;
        OH_JSVM_OpenEnvScope(env, &env_scope);

        {
            jsvm::HandleScope handle_scope(env);
            TestBegin();
            DoRun();
            TestEnd();
        }

        OH_JSVM_CloseEnvScope(env, env_scope);
        OH_JSVM_DestroyEnv(env);
        OH_JSVM_CloseVMScope(vm, vm_scope);
        OH_JSVM_DestroyVM(vm);
    }

    virtual void DoRun() {
        CHECK_FATAL(false, "should not be here");
    }

   protected:
    JSVM_VM vm;
    JSVM_Env env;
};

// Any fields defined in TestRunner can be accessd in TEST() {}, such as `vm`, `env`
// GetName returned string must be same with register name
#ifndef TEST
#define TEST(Name)                                                                                 \
    class Test##Name : public TestRunner {                                                         \
       public:                                                                                     \
        const char *GetName() const override { return __FILE_NAME__ "/" #Name; }                   \
        void DoRun() override;                                                                     \
    };                                                                                             \
    static size_t testId_##Name = TestRunner::Register(__FILE_NAME__ "/" #Name, new Test##Name()); \
    inline void Test##Name::DoRun()
#endif

#ifndef TEST_FROM_SCRATCH
#define TEST_FROM_SCRATCH(Name)                                                                    \
    class Test##Name : public TestRunner {                                                         \
       public:                                                                                     \
        const char *GetName() const override { return __FILE_NAME__ "/" #Name; }                   \
        bool IsFromScratch() const override { return true; }                                       \
        void DoRun() override;                                                                     \
    };                                                                                             \
    static size_t testId_##Name = TestRunner::Register(__FILE_NAME__ "/" #Name, new Test##Name()); \
    inline void Test##Name::DoRun()
#endif

#ifndef TEST_DISABLE
#define TEST_DISABLE(Name) inline void TestDisable##Name(JSVM_Env env)
#endif

#endif  // __JSVMTEST_H__
