/**
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#include <chrono>
#include <fstream>
#include <gtest/gtest.h>

#include "native_interface_bundle.h"

using namespace testing::ext;
class ActsBundleNativeTest : public testing::Test {
protected:
    ActsBundleNativeTest();
    ~ActsBundleNativeTest();
    static void SetUpTestCase();
    static void TearDownTestCase();
};

ActsBundleNativeTest::ActsBundleNativeTest()
{}

ActsBundleNativeTest::~ActsBundleNativeTest()
{}

void ActsBundleNativeTest::SetUpTestCase()
{}

void ActsBundleNativeTest::TearDownTestCase()
{}

/**
 * @tc.number    : ActsBundleNativeTest_0100
 * @tc.name      : Test GetAppIdByBundleName test, right bundleName
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ActsBundleNativeTest, ActsBundleNativeTest_0100, Function | MediumTest | Level2)
{
    char* appId = OH_NativeBundle_GetAppIdByBundleName("com.ohos.photos");
    printf("AppID: %s\n", appId);
    ASSERT_TRUE(appId != nullptr);
    free(appId);
}

/**
 * @tc.number    : ActsBundleNativeTest_0200
 * @tc.name      : Test GetAppIdByBundleName test, wrong bundleName
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ActsBundleNativeTest, ActsBundleNativeTest_0200, Function | MediumTest | Level2)
{
    char* appId = OH_NativeBundle_GetAppIdByBundleName("wrong name");
    ASSERT_TRUE(appId == nullptr);
}

/**
 * @tc.number    : ActsBundleNativeTest_0300
 * @tc.name      : Test GetAppIdByBundleName test, bundleName is empty
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ActsBundleNativeTest, ActsBundleNativeTest_0300, Function | MediumTest | Level2)
{
    char* appId = OH_NativeBundle_GetAppIdByBundleName("");
    ASSERT_TRUE(appId == nullptr);
}

/**
 * @tc.number    : ActsBundleNativeTest_0400
 * @tc.name      : Test GetAppIdByBundleName test, bundleName is nullptr
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ActsBundleNativeTest, ActsBundleNativeTest_0400, Function | MediumTest | Level2)
{
    char* appId = OH_NativeBundle_GetAppIdByBundleName(nullptr);
    ASSERT_TRUE(appId == nullptr);
}
