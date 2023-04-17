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


#include <stdio.h>
#include "gtest/gtest.h"

#include "devattest_interface.h"

#define ATTEST_SOFTWARE_RESULT_SIZE 5

using namespace std;
using namespace testing::ext;

class DeviceAttestQuerryTest : public testing::Test {
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown() {}
};

/**
 * @tc.number    : Sub_Device_Attest_Test_0200
 * @tc.name      : HiLog::Warn parameter legal test (Cortex-A, C)
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(DeviceAttestQuerryTest, subDeviceAttestTest0200, Function | MediumTest | Level1)
{
    int32_t ret = DEVATTEST_SUCCESS;
    AttestResultInfo attestResultInfo = { 0 };
    attestResultInfo.ticket = NULL;
    printf("[CLIENT MAIN] query.\n");
    ret = GetAttestStatus(&attestResultInfo);
    EXPECT_EQ(ret, DEVATTEST_SUCCESS);
    printf("[CLIENT MAIN] auth:%d, software:%d\n",
        attestResultInfo.authResult, attestResultInfo.softwareResult);
    for (int32_t i = 0; i < ATTEST_SOFTWARE_RESULT_SIZE; i++) {
        printf("[CLIENT MAIN] softwareResultDetail[%d]:%d\n", i, attestResultInfo.softwareResultDetail[i]);
    }

    printf("[CLIENT MAIN] ticketLength:%d, ticket:%s\n",
        attestResultInfo.ticketLength, attestResultInfo.ticket);
    if (attestResultInfo.ticketLength != 0) {
        free(attestResultInfo.ticket);
        attestResultInfo.ticket = NULL;
    }
        
}

/**
 * @tc.number    : Sub_Device_Attest_Test_0300
 * @tc.name      : HiLog::Warn parameter legal test (Cortex-A, C)
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(DeviceAttestQuerryTest, subDeviceAttestTest0300, Function | MediumTest | Level1)
{
    int32_t ret = DEVATTEST_SUCCESS;
    ret = StartDevAttestTask();
    printf("[CLIENT MAIN] StartDevAttestTask ret:%d.\n", ret);
    EXPECT_EQ(ret, DEVATTEST_SUCCESS);
    AttestResultInfo attestResultInfo = { 0 };
    attestResultInfo.ticket = NULL;
    printf("[CLIENT MAIN] query.\n");
    ret = GetAttestStatus(&attestResultInfo);
    printf("[CLIENT MAIN] wrong. ret:%d\n", ret);
    EXPECT_FALSE(ret == DEVATTEST_SUCCESS);
}
