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

#include <gtest/gtest.h>
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xD003e00

using namespace std;
using namespace testing::ext;

class hilogndktest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
};

void hilogndktest::SetUp()
{
}
void hilogndktest::TearDown()
{
}
void hilogndktest::SetUpTestCase()
{
}
void hilogndktest::TearDownTestCase()
{
}

/**
 * @tc.number    : DFX_DFT_HILOGNDK_0100
 * @tc.name      : HILOGNDK_TEST
 * @tc.desc      : HILOGNDK_TEST
 */
HWTEST_F(hilogndktest, OH_LOG_Print_CHECK, Function | MediumTest | Level1)
{
    LogType type = LOG_APP;
    LogLevel level = LOG_ERROR;
    int ret = OH_LOG_Print(type, level, 0xD003e00, "testtag0testtag1testtag2", "string:for hilog test %{private}s", "name");
    ASSERT_TRUE(ret == 85);
}

/**
 * @tc.number    : DFX_DFT_HILOGNDK_0200
 * @tc.name      : HILOGNDK_TEST
 * @tc.desc      : HILOGNDK_TEST
 */
HWTEST_F(hilogndktest, OH_LOG_IsLoggable_CHECK, Function | MediumTest | Level1)
{
    LogLevel level = LOG_DEBUG;
    const char *LOG_TAG = "testtag0testtag0testtag0testta";
    bool res = OH_LOG_IsLoggable(0xD003e00, LOG_TAG, level);
    ASSERT_TRUE(res == false);
}

