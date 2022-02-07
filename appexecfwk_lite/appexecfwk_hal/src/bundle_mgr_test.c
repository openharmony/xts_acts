/**
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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

#include <string.h>
#include <unistd.h>

#include "hctest.h"
#include "securec.h"
#include "bundle_info.h"
#include "bundle_manager.h"
#include "want.h"

/**
* @brief  register a test suit named BundleMgrTestSuite
* @param  subsystem name is appexecfwk
* @param  module name is  bundlemgr
* @param  test suit name is BundleMgrTestSuite
*/
LITE_TEST_SUIT(appexecfwk, bundlemgr, BundleMgrTestSuite);

static BOOL BundleMgrTestSuiteSetUp(void)
{
    printf("----------test case with BundleMgrTest start-------------\n");
    return TRUE;
}

static BOOL BundleMgrTestSuiteTearDown(void)
{
    printf("----------test case with BundleMgrTest end-------------\n");
    return TRUE;
}

/**
 * @tc.number    : SUB_APPEXECFWK_0001
 * @tc.name      : testClearAbilityInfo parameter illegal test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(BundleMgrTestSuite, testClearAbilityInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testClearAbilityInfoIllegal------\n");
    AbilityInfo abilityInfo = { 0 };
    memset_s(&abilityInfo, sizeof(abilityInfo), 0, sizeof(abilityInfo));
    abilityInfo.bundleName = "com.openharmony.testjsdemo";
    ClearAbilityInfo(NULL);
    TEST_ASSERT_EQUAL_STRING(abilityInfo.bundleName, "com.openharmony.testjsdemo");
    printf("------end testClearAbilityInfoIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0002
 * @tc.name      : testClearBundleInfo parameter legal test with bundle name
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(BundleMgrTestSuite, testClearBundleInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testClearBundleInfoIllegal------\n");
    BundleInfo bundleInfo = { 0 };
    memset_s(&bundleInfo, sizeof(bundleInfo), 0, sizeof(bundleInfo));
    bundleInfo.bundleName = "com.openharmony.testjsdemo";
    ClearBundleInfo(NULL);
    TEST_ASSERT_EQUAL_STRING(bundleInfo.bundleName, "com.openharmony.testjsdemo");
    printf("------end testClearBundleInfoIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0003
 * @tc.name      : testSetElementAbilityName parameter legal test
 * @tc.desc      : [C- SOFTWARE -0100]
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementAbilityName, Function | MediumTest | Level0)
{
    printf("------start testSetElementAbilityName------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementAbilityName(&element, "SecondAbility");
    SetWantElement(&want, element);
    char *aName = "SecondAbility";
    TEST_ASSERT_EQUAL_STRING(want.element->abilityName, aName);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementAbilityName------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0004
 * @tc.name      : testSetElementAbilityName parameter illegal test
 * @tc.desc      : [C- SOFTWARE -0100]
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementAbilityNameIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetElementAbilityNameIllegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    char *aName = "";
    SetElementAbilityName(&element, aName);
    SetWantElement(&want, element);
    TEST_ASSERT_EQUAL_STRING(want.element->abilityName, "");
    SetElementAbilityName(&element, NULL);
    SetWantElement(&want, element);
    TEST_ASSERT_EQUAL_STRING(want.element->abilityName, NULL);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementAbilityNameIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0005
 * @tc.name      : testSetElementBundleName parameter legal test
 * @tc.desc      : [C- SOFTWARE -0100]
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementBundleName, Function | MediumTest | Level0)
{
    printf("------start testSetElementBundleName------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementBundleName(&element, "com.openharmony.testjsdemo");
    SetWantElement(&want, element);
    char *bName = "com.openharmony.testjsdemo";
    TEST_ASSERT_EQUAL_STRING(want.element->bundleName, bName);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementBundleName------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0006
 * @tc.name      : testSetElementBundleName parameter illegal test
 * @tc.desc      : [C- SOFTWARE -0100]
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementBundleNameIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetElementBundleNameIllegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementBundleName(&element, "");
    SetWantElement(&want, element);
    char *bName = "";
    TEST_ASSERT_EQUAL_STRING(want.element->bundleName, bName);
    SetElementBundleName(&element, NULL);
    SetWantElement(&want, element);
    TEST_ASSERT_EQUAL_STRING(want.element->bundleName, NULL);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementBundleNameIllegal------\n");
}
/**
 * @tc.number    : SUB_APPEXECFWK_0007
 * @tc.name      : testSetElementDeviceID parameter legal test
 * @tc.desc      : [C- SOFTWARE -0100]
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementDeviceID, Function | MediumTest | Level0)
{
    printf("------start testSetElementDeviceID------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementDeviceID(&element, "0001000");
    SetWantElement(&want, element);
    char *dID = "0001000";
    TEST_ASSERT_EQUAL_STRING(want.element->deviceId, dID);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementDeviceID------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0008
 * @tc.name      : testSetElementDeviceID parameter illegal test
 * @tc.desc      : [C- SOFTWARE -0100]
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementDeviceIDIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetElementDeviceIDIllegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementDeviceID(&element, "");
    SetWantElement(&want, element);
    char *dID = "";
    TEST_ASSERT_EQUAL_STRING(want.element->deviceId, dID);
    SetElementDeviceID(&element, NULL);
    SetWantElement(&want, element);
    TEST_ASSERT_EQUAL_STRING(want.element->deviceId, NULL);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementDeviceIDIllegal------\n");
}

RUN_TEST_SUITE(BundleMgrTestSuite);
