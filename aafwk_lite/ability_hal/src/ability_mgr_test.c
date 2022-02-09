/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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
#include <stdlib.h>

#include "hctest.h"
#include "ohos_types.h"

#include "ability_manager.h"
#include "want.h"


/**
* @brief  register a test suit named AbilityMgrTestSuite
* @param  subsystem name is aafwk
* @param  module name is  abilitymgr
* @param  test suit name is AbilityMgrTestSuite
*/
LITE_TEST_SUIT(aafwk, abilitymgr, AbilityMgrTestSuite);

static BOOL AbilityMgrTestSuiteSetUp(void)
{
    printf("----------test case with AbilityMgrTest start-------------\n");
    return TRUE;
}

static BOOL AbilityMgrTestSuiteTearDown(void)
{
    printf("----------test case with AbilityMgrTest end-------------\n");
    return TRUE;
}

/**
 * @tc.number    : SUB_AAFWK_ABILITY_0001
 * @tc.name      : testClearElement parameter legal test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testClearElement, Function | MediumTest | Level0)
{
    printf("------start testClearElement------\n");
    ElementName element = { 0 };
    bool ret = SetElementAbilityName(&element, "SecondAbility");
    if (ret) {
        char aName[] = "SecondAbility";
        TEST_ASSERT_EQUAL_STRING(element.abilityName, aName);
        ClearElement(&element);
        TEST_ASSERT_EQUAL_STRING(element.abilityName, NULL);
    }
    printf("------end testClearElement------\n");
}

/**
 * @tc.number    : SUB_AAFWK_ABILITY_0002
 * @tc.name      : testClearElement parameter illegal test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testClearElementIllegal, Function | MediumTest | Level0)
{
    printf("------start testClearElementIllegal------\n");
    ElementName element = { 0 };
    bool ret = SetElementAbilityName(&element, "SecondAbility");
    if (ret) {
        char aName[] = "SecondAbility";
        TEST_ASSERT_EQUAL_STRING(element.abilityName, aName);
        ClearElement(NULL);
        TEST_ASSERT_EQUAL_STRING(element.abilityName, aName);
    }
    printf("------end testClearElementIllegal------\n");
}

/**
 * @tc.number    : SUB_AAFWK_ABILITY_0003
 * @tc.name      : testSetWantElement parameter legal test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetWantElement, Function | MediumTest | Level0)
{
    printf("------start testSetWantElement------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementDeviceID(&element, "0001000");
    SetElementBundleName(&element, "com.openharmony.testnative");
    SetElementAbilityName(&element, "SecondAbility");
    if (element.abilityName != NULL) {
        bool ret = SetWantElement(&want, element);
        if (ret) {
            TEST_ASSERT_EQUAL_STRING(want.element->deviceId, "0001000");
            TEST_ASSERT_EQUAL_STRING(want.element->abilityName, "SecondAbility");
            TEST_ASSERT_EQUAL_STRING(want.element->bundleName, "com.openharmony.testnative");
        }
    }
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetWantElement------\n");
}

/**
 * @tc.number    : SUB_AAFWK_ABILITY_0004
 * @tc.name      : testSetWantElement parameter illegal test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetWantElementIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetWantElementIllegal------\n");
    Want want= { 0 };
    ElementName element = { 0 };
    bool ret = SetWantElement(&want, element);
    if (ret) {
        TEST_ASSERT_EQUAL_STRING(want.element->deviceId, NULL);
        TEST_ASSERT_EQUAL_STRING(want.element->abilityName, NULL);
        TEST_ASSERT_EQUAL_STRING(want.element->bundleName, NULL);
    }
    ClearElement(&element);
    TEST_ASSERT_EQUAL_STRING(element.abilityName, NULL);
    ClearWant(&want);
    TEST_ASSERT_EQUAL_STRING(want.element, NULL);
    printf("------end testSetWantElementIllegal------\n");
}

/**
 * @tc.number    : SUB_AAFWK_ABILITY_0005
 * @tc.name      : testClearWant parameter illegal test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testClearWantIllegal, Function | MediumTest | Level2)
{
    printf("------start testClearWantIllegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    bool ret = SetElementAbilityName(&element, "SecondAbility");
    if (ret) {
        ret = SetWantElement(&want, element);
        if (ret) {
            char aName[] = "SecondAbility";
            TEST_ASSERT_EQUAL_STRING(want.element->abilityName, aName);
            ClearWant(NULL);
            TEST_ASSERT_EQUAL_STRING(want.element->abilityName, aName);
        }
    }
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testClearWantIllegal------\n");
}

/**
 * @tc.number    : SUB_AAFWK_ABILITY_0006
 * @tc.name      : testSetWantDate parameter legal test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetWantDate, Function | MediumTest | Level0)
{
    printf("------start testSetWantDate------\n");
    Want want = { 0 };
    SetWantData(&want, "test", 5);
    if (want.data != NULL) {
        TEST_ASSERT_EQUAL_STRING((char*)(want.data), "test");
        TEST_ASSERT_TRUE(want.dataLength == 5);
    }
    ClearWant(&want);
    printf("------end testSetWantDate------\n");
}

/**
 * @tc.number    : SUB_AAFWK_ABILITY_0007
 * @tc.name      : testSetWantDate parameter illegal test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetWantDateIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetWantDateIllegal------\n");
    Want want = { 0 };
    SetWantData(&want, "test", -1);
    TEST_ASSERT_EQUAL_STRING((char*)(want.data), NULL);
    TEST_ASSERT_FALSE(want.dataLength);
    SetWantData(&want, NULL, 0);
    TEST_ASSERT_EQUAL_STRING((char*)(want.data), NULL);
    TEST_ASSERT_FALSE(want.dataLength);
    printf("------end testSetWantDateIllegal------\n");
}

RUN_TEST_SUITE(AbilityMgrTestSuite);
