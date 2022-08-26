/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
 
#ifndef ACTSVIDEODECENC_NDK_FUNC_TEST_H
#define ACTSVIDEODECENC_NDK_FUNC_TEST_H

#include "gtest/gtest.h"
#include "VDecEncNdkSample.h"

namespace OHOS {
namespace Media {
class ActsVideoDecEncNdkTest : public testing::Test {
public:
    // Preset action of the test suite, which is executed before the first test case
    static void SetUpTestCase(void)
    {
        printf("ActsVideoDecEncNdkTest::SetUpTestCase");
    }
    // Test suite cleanup action, which is executed after the last test case
    static void TearDownTestCase(void)
    {
        printf("ActsVideoDecEncNdkTest::TearDownTestCase");
    }
    // Preset action of the test case
    void SetUp(void)
    {
        printf("ActsVideoDecEncNdkTest::SetUp");
    }
    // Cleanup action of the test case
    virtual void TearDown(void)
    {
        printf("ActsVideoDecEncNdkTest::TearDown");
    }
};
}
}
#endif // ACTSVIDEODECENC_NDK_FUNC_TEST_H
