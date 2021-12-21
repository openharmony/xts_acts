/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <gtest/gtest.h>
#include <securec.h>
#include <cstdbool>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>

#include "hc_alg_test.h"
#include "hc_condition_test.h"
#include "hc_dev_info_test.h"
#include "hc_file_f_test.h"
#include "hc_file_iot_flash_test.h"
#include "hc_file_test.h"
#include "hc_file_utils_test.h"
#include "hc_mutex_test.h"
#include "hc_thread_test.h"
#include "hc_time_test.h"
#include "print_log.h"

using namespace testing::ext;
namespace {
class DeviceAuthTest : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void DeviceAuthTest::SetUpTestCase(void)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

void DeviceAuthTest::TearDownTestCase(void)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

void DeviceAuthTest::SetUp()
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    (void)(srand(time(nullptr)));
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

void DeviceAuthTest::TearDown()
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcMutex
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcMutex, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcMutex();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcThread
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcThread, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcThread();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcGetUdid
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcGetUdid, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcGetUdid();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcFile
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcFile, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcFile();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcFileFApi
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcFileFApi, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcFileFApi();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcFileUtilsFile
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcFileUtilsFile, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcFileUtilsFile();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseSemCondition
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseSemCondition, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcSemCondition();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCasePthreadCondition
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCasePthreadCondition, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcPthreadCondition();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcFileIotFlash
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcFileIotFlash, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcFileIotFlash();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcTime
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcTime, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcTime();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}

/**
 * @tc.name: DeviceAuthTest.TestCaseHcAlg
 * @tc.desc:
 * @tc.type: FUNC
 */
HWTEST_F(DeviceAuthTest, TestCaseHcAlg, TestSize.Level1)
{
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
    TestHcAlg();
    LOGI("++++++++++++++++++++++++++++++++++++++++\n");
}
} // namespace
