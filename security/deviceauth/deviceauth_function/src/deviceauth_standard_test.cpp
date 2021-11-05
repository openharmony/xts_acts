/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

#include <ctime>
#include <gtest/gtest.h>
#include "deviceauth_test_mock.h"
#include "deviceauth_standard_test.h"
extern "C" {
#include "common_defs.h"
#include "json_utils.h"
#include "device_auth.h"
#include "device_auth_defines.h"
#include "database_manager.h"
#include "hc_condition.h"
#include "hc_mutex.h"
#include "hc_types.h"
}

using namespace std;
using namespace testing::ext;

namespace
{
    static bool g_isNeedContinue = false;
    static int64_t g_requestId = 0L;
    static int g_operationCode = -1;
    static int g_errorCode = 1;
    static char *g_tempStr = nullptr;
    static int g_messageCode = -1;

void ClearTempValue()
{
    g_isNeedContinue = false;
    g_requestId = 0L;
    g_operationCode = -1;
    g_errorCode = 1;
    g_tempStr = nullptr;
    g_messageCode = -1;
}

enum {
    GROUP_CREATED = 0,
    GROUP_DELETED,
    DEVICE_BOUND,
    DEVICE_UNBOUND,
    DEVICE_NOT_TRUSTED,
    LAST_GROUP_DELETED,
    TRUSTED_DEVICE_NUM_CHANGED
};

/* test suit - GET_INSTANCE */
class GET_INSTANCE : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void GET_INSTANCE::SetUpTestCase()
{
    int32_t ret = InitDeviceAuthService();
    ASSERT_EQ(ret == HC_SUCCESS, true);
}

void GET_INSTANCE::TearDownTestCase()
{
    DestroyDeviceAuthService();
    ClearTempValue();
}

void GET_INSTANCE::SetUp()
{
}

void GET_INSTANCE::TearDown()
{
}



class REGISTER_CALLBACK : public testing::Test {
public:
    const DeviceGroupManager *gm = GetGmInstance();
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};


/* start cases */
/**
 * @tc.name: GET_INSTANCE.TC_GET_GM_INSTANCE
 * @tc.desc: Test GetGmInstance interface function;
 * @tc.type: FUNC
 */
HWTEST_F(GET_INSTANCE, TC_GET_GM_INSTANCE, TestSize.Level1)
{
    const DeviceGroupManager *gm = GetGmInstance();
    ASSERT_NE(gm, nullptr);
}
}