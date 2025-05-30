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
#include <semaphore.h>

#include "adapter.h"
#include "hctest.h"
#include "securec.h"
#include "bundle_info.h"
#include "bundle_manager.h"
#include "want.h"

#define nullptr NULL
#define DIR_PATH_MAX 256
#define PREPARED_APP_BUNDLE_NAME  "com.example.testdemo1"
#define PREPARED_APP_ABILITY_NAME "entry_MainAbility"
#define INSTALL_APP_BUNDLE_NAME   "com.example.testdemo2"
#define PREPARED_APP_BIN_NAME     "/user/testdemo1.bin"
#define INSTALL_APP_BIN_NAME      "/user/testdemo2.bin"

const uint8_t OPERATION_DOING = 200;
static uint8_t g_errCode = 0;
static sem_t g_sem;

/* *
 * @brief  install/uninstall callback function
 * @param  resultCode - install/unsintall result code
 * @param  resultMessage - install/unsintall result message
 */
static void TestInstallerCallback(const uint8_t resultCode, const void *resultMessage)
{
    printf("----TestInstallerCallback resultCode: %u\n", (uint32_t)resultCode);

    if (resultCode == OPERATION_DOING) {
        return;
    }
    g_errCode = resultCode;
    sem_post(&g_sem);
}

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

    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    sem_init(&g_sem, 0, 0);
    bool ret = Install(PREPARED_APP_BIN_NAME, &installParam, TestInstallerCallback);
    sem_wait(&g_sem);
    printf("install testdemo1 result is %d err %u\n", ret, g_errCode);

    return TRUE;
}

static BOOL BundleMgrTestSuiteTearDown(void)
{
    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    sem_init(&g_sem, 0, 0);
    bool ret = Uninstall(PREPARED_APP_BUNDLE_NAME, &installParam, TestInstallerCallback);
    sem_wait(&g_sem);
    printf("uninstall testdemo1 result is %d err %u\n", ret, g_errCode);

    printf("----------test case with BundleMgrTest end-------------\n");
    return TRUE;
}

/**
 * @tc.number    : SUB_APPEXECFWK_0001
 * @tc.name      : testClearAbilityInfoLegal
 * @tc.desc      : testClearAbilityInfo parameter legal test with bundle name
 */
LITE_TEST_CASE(BundleMgrTestSuite, testClearAbilityInfoLegal, Function | MediumTest | Level2)
{
    printf("------start testClearAbilityInfoLegal------\n");
    AbilityInfo abilityInfo;
    int result = memset_s(&abilityInfo, sizeof(abilityInfo), 0, sizeof(abilityInfo));
    TEST_ASSERT_TRUE(result == 0);
    char *name = "com.openharmony.testjsdemo";
    size_t len = strlen(name);
    abilityInfo.bundleName = (char *)(AdapterMalloc(len + 1));
    TEST_ASSERT_NOT_NULL(abilityInfo.bundleName);
    errno_t err = strncpy_s(abilityInfo.bundleName, len + 1, name, len);
    TEST_ASSERT_EQUAL(err, EOK);
    TEST_ASSERT_EQUAL_STRING(abilityInfo.bundleName, name);
    ClearAbilityInfo(&abilityInfo);
    TEST_ASSERT_EQUAL_STRING(abilityInfo.bundleName, NULL);
    printf("------end testClearAbilityInfoLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0002
 * @tc.name      : testClearAbilityInfoIllegal
 * @tc.desc      : testClearAbilityInfo parameter illegal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testClearAbilityInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testClearAbilityInfoIllegal------\n");
    AbilityInfo abilityInfo = { 0 };
    int result = memset_s(&abilityInfo, sizeof(abilityInfo), 0, sizeof(abilityInfo));
    TEST_ASSERT_TRUE(result == 0);
    char *name = "com.openharmony.testjsdemo";
    size_t len = strlen(name);
    abilityInfo.bundleName = (char *)(AdapterMalloc(len + 1));
    TEST_ASSERT_NOT_NULL(abilityInfo.bundleName);
    errno_t err = strncpy_s(abilityInfo.bundleName, len + 1, name, len);
    TEST_ASSERT_EQUAL(err, EOK);
    ClearAbilityInfo(NULL);
    TEST_ASSERT_EQUAL_STRING(abilityInfo.bundleName, name);
    AdapterFree(abilityInfo.bundleName);
    printf("------end testClearAbilityInfoIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0003
 * @tc.name      : testClearBundleInfoLegal
 * @tc.desc      : testClearBundleInfo parameter legal test with bundle name
 */
LITE_TEST_CASE(BundleMgrTestSuite, testClearBundleInfoLegal, Function | MediumTest | Level2)
{
    printf("------start testClearBundleInfoLegal------\n");
    BundleInfo bundleInfo = { 0 };
    int result = memset_s(&bundleInfo, sizeof(bundleInfo), 0, sizeof(bundleInfo));
    TEST_ASSERT_TRUE(result == 0);
    char *name = "com.openharmony.testjsdemo";
    size_t len = strlen(name);
    bundleInfo.bundleName = (char *)(AdapterMalloc(len + 1));
    TEST_ASSERT_NOT_NULL(bundleInfo.bundleName);
    errno_t err = strncpy_s(bundleInfo.bundleName, len + 1, name, len);
    TEST_ASSERT_EQUAL(err, EOK);
    TEST_ASSERT_EQUAL_STRING(bundleInfo.bundleName, name);
    ClearBundleInfo(&bundleInfo);
    TEST_ASSERT_EQUAL_STRING(bundleInfo.bundleName, NULL);
    printf("------end testClearBundleInfoLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0004
 * @tc.name      : testClearBundleInfoIllegal
 * @tc.desc      : testClearBundleInfo parameter illegal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testClearBundleInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testClearBundleInfoIllegal------\n");
    BundleInfo bundleInfo;
    int result = memset_s(&bundleInfo, sizeof(bundleInfo), 0, sizeof(bundleInfo));
    TEST_ASSERT_TRUE(result == 0);
    char *name = "com.openharmony.testjsdemo";
    size_t len = strlen(name);
    bundleInfo.bundleName = (char *)(AdapterMalloc(len + 1));
    TEST_ASSERT_NOT_NULL(bundleInfo.bundleName);
    errno_t err = strncpy_s(bundleInfo.bundleName, len + 1, name, len);
    TEST_ASSERT_EQUAL(err, EOK);
    ClearBundleInfo(NULL);
    TEST_ASSERT_EQUAL_STRING(bundleInfo.bundleName, name);
    AdapterFree(bundleInfo.bundleName);
    printf("------end testClearBundleInfoIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0005
 * @tc.name      : testClearModuleInfoLegal
 * @tc.desc      : ClearAbilityInfo parameter legal test with module info
 */
LITE_TEST_CASE(BundleMgrTestSuite, testClearModuleInfoLegal, Function | MediumTest | Level1)
{
    printf("------start testClearModuleInfoLegal------\n");
    ModuleInfo moduleInfo = { 0 };
    int result = memset_s(&moduleInfo, sizeof(moduleInfo), 0, sizeof(moduleInfo));
    TEST_ASSERT_TRUE(result == 0);
    char *name = "test";
    size_t len = strlen(name);
    moduleInfo.moduleName = (char *)(AdapterMalloc(len + 1));
    TEST_ASSERT_NOT_NULL(moduleInfo.moduleName);
    errno_t err = strncpy_s(moduleInfo.moduleName, len + 1, name, len);
    TEST_ASSERT_EQUAL(err, EOK);
    TEST_ASSERT_EQUAL_STRING(moduleInfo.moduleName, name);
    ClearModuleInfo(&moduleInfo);
    TEST_ASSERT_EQUAL_STRING(moduleInfo.moduleName, NULL);
    printf("------end testClearModuleInfoLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0006
 * @tc.name      : testClearModuleInfoIllegal
 * @tc.desc      : ClearAbilityInfo parameter illegal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testClearModuleInfoIllegal, Function | MediumTest | Level1)
{
    printf("------start testClearModuleInfoIllegal------\n");
    ModuleInfo moduleInfo = { 0 };
    int result = memset_s(&moduleInfo, sizeof(moduleInfo), 0, sizeof(moduleInfo));
    TEST_ASSERT_TRUE(result == 0);
    char *name = "test";
    size_t len = strlen(name);
    moduleInfo.moduleName = (char *)(AdapterMalloc(len + 1));
    TEST_ASSERT_NOT_NULL(moduleInfo.moduleName);
    errno_t err = strncpy_s(moduleInfo.moduleName, len + 1, name, len);
    TEST_ASSERT_EQUAL(err, EOK);
    ClearModuleInfo(NULL);
    TEST_ASSERT_EQUAL_STRING(moduleInfo.moduleName, name);
    AdapterFree(moduleInfo.moduleName);
    printf("------end testClearModuleInfoIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0007
 * @tc.name      : testSetElementAbilityNameLegal
 * @tc.desc      : testSetElementAbilityName parameter legal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementAbilityNameLegal, Function | MediumTest | Level0)
{
    printf("------start testSetElementAbilityNameLegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementAbilityName(&element, "SecondAbility");
    SetWantElement(&want, element);
    char *aName = "SecondAbility";
    TEST_ASSERT_EQUAL_STRING(want.element->abilityName, aName);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementAbilityNameLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0008
 * @tc.name      : testSetElementAbilityNameIllegal
 * @tc.desc      : testSetElementAbilityName parameter illegal test
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
    int ret = SetElementAbilityName(NULL, aName);
    TEST_ASSERT_FALSE(ret);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementAbilityNameIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0009
 * @tc.name      : testSetElementBundleNameLegal
 * @tc.desc      : testSetElementBundleName parameter legal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementBundleNameLegal, Function | MediumTest | Level0)
{
    printf("------start testSetElementBundleNameLegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementBundleName(&element, "com.openharmony.testjsdemo");
    SetWantElement(&want, element);
    char *bName = "com.openharmony.testjsdemo";
    TEST_ASSERT_EQUAL_STRING(want.element->bundleName, bName);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementBundleNameLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0010
 * @tc.name      : testSetElementBundleNameIllegal
 * @tc.desc      : testSetElementBundleName parameter illegal test
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
    bool ret = SetElementBundleName(NULL, bName);
    TEST_ASSERT_FALSE(ret);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementBundleNameIllegal------\n");
}
/**
 * @tc.number    : SUB_APPEXECFWK_0011
 * @tc.name      : testSetElementDeviceIDLegal
 * @tc.desc      : testSetElementDeviceID parameter legal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testSetElementDeviceIDLegal, Function | MediumTest | Level0)
{
    printf("------start testSetElementDeviceIDLegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementDeviceID(&element, "0001000");
    SetWantElement(&want, element);
    char *dID = "0001000";
    TEST_ASSERT_EQUAL_STRING(want.element->deviceId, dID);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementDeviceIDLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0012
 * @tc.name      : testSetElementDeviceIDIllegal
 * @tc.desc      : testSetElementDeviceID parameter illegal test
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
    int ret = SetElementDeviceID(NULL, "0001000");
    TEST_ASSERT_FALSE(ret);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementDeviceIDIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0013
 * @tc.name      : testGetBundleInfoIllegal
 * @tc.desc      : GetBundleInfo parameter illegal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testGetBundleInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testGetBundleInfoIllegal------\n");
    BundleInfo bundleInfo;
    int result = memset_s(&bundleInfo, sizeof(bundleInfo), 0, sizeof(bundleInfo));
    TEST_ASSERT_TRUE(result == 0);
    const char *bundleName = "com.openharmony.nothishap";
    int flags = 0;
    uint8_t ret = GetBundleInfo(bundleName, flags, &bundleInfo);
    TEST_ASSERT_TRUE(ret == 2);
    ret = GetBundleInfo(NULL, flags, &bundleInfo);
    printf("abilityInfo2 is %d \n", ret);
    TEST_ASSERT_TRUE(ret == 1);
    ret = GetBundleInfo("", flags, &bundleInfo);
    TEST_ASSERT_TRUE(ret == 2);
    ret = GetBundleInfo("com.openharmony.testjsdemo", 2, &bundleInfo);
    TEST_ASSERT_TRUE(ret == 2);
    printf("------end testGetBundleInfoIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0014
 * @tc.name      : testGetBundleInfosIllegal
 * @tc.desc      : GetBundleInfos parameter illegal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testGetBundleInfosIllegal, Function | MediumTest | Level2)
{
    printf("------start testGetBundleInfosIllegal------\n");
    BundleInfo *bundleInfos = {NULL};
    int *length = NULL;
    int flags = 0;
    uint8_t ret = GetBundleInfos(flags, NULL, length);
    TEST_ASSERT_TRUE(ret == 1);
    ret = GetBundleInfos(flags, &bundleInfos, NULL);
    printf("ret is %d \n", ret);
    TEST_ASSERT_TRUE(ret == 2);
    ret = GetBundleInfos(2, &bundleInfos, length);
    printf("ret is %d \n", ret);
    TEST_ASSERT_TRUE(ret == 2);
    printf("------end testGetBundleInfosIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0015
 * @tc.name      : testGetBundleInfoLegal
 * @tc.desc      : GetBundleInfo parameter legal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testGetBundleInfoLegal, Function | MediumTest | Level2)
{
    printf("------start testGetBundleInfoLegal------\n");
    BundleInfo bundleInfo;
    int result = memset_s(&bundleInfo, sizeof(bundleInfo), 0, sizeof(bundleInfo));
    TEST_ASSERT_TRUE(result == 0);

    int flags = 0;
    const char *bundleName = PREPARED_APP_BUNDLE_NAME;
    uint8_t ret = GetBundleInfo(PREPARED_APP_BUNDLE_NAME, flags, &bundleInfo);
    TEST_ASSERT_TRUE(ret == 0);
    TEST_ASSERT_EQUAL_STRING(bundleInfo.bundleName, bundleName);

    printf("------end testGetBundleInfoLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0016
 * @tc.name      : testQueryAbilityInfoLegal
 * @tc.desc      : QueryAbilityInfo parameter legal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testQueryAbilityInfoLegal, Function | MediumTest | Level0)
{
    printf("------start testQueryAbilityInfoLegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementAbilityName(&element, PREPARED_APP_ABILITY_NAME);
    SetElementBundleName(&element, PREPARED_APP_BUNDLE_NAME);
    SetWantElement(&want, element);

    AbilityInfo abilityInfo;
    int32_t ret = memset_s(&abilityInfo, sizeof(abilityInfo), 0, sizeof(abilityInfo));
    TEST_ASSERT_TRUE(ret == 0);
    uint8_t result = QueryAbilityInfo(&want, &abilityInfo);
    printf("QueryAbilityInfo result is %d \n", result);
    printf("abilityInfo.bundleName is %s \n", abilityInfo.bundleName);
    TEST_ASSERT_TRUE(result == 1);

    ClearAbilityInfo(&abilityInfo);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testQueryAbilityInfoLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0017
 * @tc.name      : testQueryAbilityInfoWithNullptr
 * @tc.desc      : QueryAbilityInfo parameter nullptr test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testQueryAbilityInfoWithNullptr, Function | MediumTest | Level2)
{
    printf("------start testQueryAbilityInfoWithNullptr------\n");

    AbilityInfo abilityInfo;
    int32_t ret = memset_s(&abilityInfo, sizeof(abilityInfo), 0, sizeof(abilityInfo));
    TEST_ASSERT_TRUE(ret == 0);

    // want is nullptr
    uint8_t result = QueryAbilityInfo(nullptr, &abilityInfo);
    printf("when want is null, query ability info result is %u\n", (uint32_t)result);
    TEST_ASSERT_TRUE(result == 1);

    Want want = { 0 };
    ElementName element = {0};
    SetElementAbilityName(&element, PREPARED_APP_ABILITY_NAME);
    SetElementBundleName(&element, PREPARED_APP_BUNDLE_NAME);
    SetWantElement(&want, element);
    SetWantData(&want, "test", 4);

    // abilityInfo is nullptr
    result = QueryAbilityInfo(&want, nullptr);
    printf("when abilityInfo is null, query ability info result is %u\n", (uint32_t)result);
    TEST_ASSERT_TRUE(result == 1);

    ClearElement(&element);
    ClearWant(&want);
    printf("------end testQueryAbilityInfoWithNullptr------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0018
 * @tc.name      : testQueryAbilityInfoIllegal
 * @tc.desc      : QueryAbilityInfo parameter illegal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testQueryAbilityInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testQueryAbilityInfoIllegal------\n");

    // content of want is null string
    Want want = {0};
    ElementName element = {0};
    SetElementBundleName(&element, "");
    SetElementAbilityName(&element, "");
    SetWantElement(&want, element);

    AbilityInfo abilityInfo;
    uint8_t result = QueryAbilityInfo(&want, &abilityInfo);
    printf("query ability info result is %u\n", (uint32_t)result);
    TEST_ASSERT_TRUE(result == 0);

    ClearElement(&element);
    ClearWant(&want);
    printf("------end testQueryAbilityInfoIllegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0019
 * @tc.name      : testInstallWithNullptr
 * @tc.desc      : Install parameter nullptr test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testInstallWithNullptr, Function | MediumTest | Level2)
{
    printf("------start testInstallWithNullptr------\n");

    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    bool isInstallSuccess = Install(nullptr, &installParam, TestInstallerCallback);
    TEST_ASSERT_FALSE(isInstallSuccess);
    printf("install result is %d\n", isInstallSuccess);

    printf("------end testInstallWithNullptr------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0020
 * @tc.name      : testInstallWithErrorPath
 * @tc.desc      : Install parameter illegal path test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testInstallWithErrorPath, Function | MediumTest | Level2)
{
    printf("------start testInstallWithErrorPath------\n");

    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    sem_init(&g_sem, 0, 0);
    bool ret = Install("/user/nothishap.bin", &installParam, TestInstallerCallback);
    sem_wait(&g_sem);

    bool isInstallSuccess = (g_errCode == 0) ? true : false;
    TEST_ASSERT_FALSE(isInstallSuccess);
    printf("install nothishap result is %d err %u\n", ret, g_errCode);

    printf("------end testInstallWithErrorPath------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0021
 * @tc.name      : testInstallWithEmptyPath
 * @tc.desc      : Install parameter illegal path test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testInstallWithEmptyPath, Function | MediumTest | Level2)
{
    printf("------start testInstallWithEmptyPath------\n");

    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    sem_init(&g_sem, 0, 0);
    bool ret = Install("", &installParam, TestInstallerCallback);
    sem_wait(&g_sem);

    bool isInstallSuccess = (g_errCode == 0) ? true : false;
    TEST_ASSERT_FALSE(isInstallSuccess);
    printf("install result is %d err %u\n", ret, g_errCode);

    printf("------end testInstallWithEmptyPath------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0022
 * @tc.name      : testInstallLegal
 * @tc.desc      : Install parameter legal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testInstallLegal, Function | MediumTest | Level0)
{
    printf("------start testInstallLegal------\n");

    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    sem_init(&g_sem, 0, 0);
    bool ret = Install(INSTALL_APP_BIN_NAME, &installParam, TestInstallerCallback);
    sem_wait(&g_sem);

    bool isInstallSuccess = (g_errCode == 0) ? true : false;
    TEST_ASSERT_TRUE(isInstallSuccess);
    printf("install testdemo2 result is %d err %u\n", ret, g_errCode);

    sleep(1);
    sem_init(&g_sem, 0, 0);
    ret = Uninstall(INSTALL_APP_BUNDLE_NAME, &installParam, TestInstallerCallback);
    sem_wait(&g_sem);
    printf("uninstall testdemo2 result is %d err %u\n", ret, g_errCode);

    printf("------end testInstallLegal------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0023
 * @tc.name      : testUninstallNullBundleName
 * @tc.desc      : Uninstall parameter illegal test that bundleName is null
 */
LITE_TEST_CASE(BundleMgrTestSuite, testUninstallNullBundleName, Function | MediumTest | Level2)
{
    printf("------start testUninstallNullBundleName------\n");

    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    bool isSuccess = Uninstall(nullptr, &installParam, TestInstallerCallback);
    TEST_ASSERT_FALSE(isSuccess);
    printf("uninstall result is %d err %u\n", isSuccess, g_errCode);

    printf("------end testUninstallNullBundleName------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0024
 * @tc.name      : testUninstallErrBundleName
 * @tc.desc      : Uninstall parameter illegal test that bundleName is wrong
 */
LITE_TEST_CASE(BundleMgrTestSuite, testUninstallErrBundleName, Function | MediumTest | Level2)
{
    printf("------start testUninstallErrBundleName------\n");

    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    sem_init(&g_sem, 0, 0);
    bool ret = Uninstall("com.openharmony.nothisBundleName", &installParam, TestInstallerCallback);
    sem_wait(&g_sem);

    bool isUninstallSuccess = (g_errCode == 0) ? true : false;
    TEST_ASSERT_FALSE(isUninstallSuccess);
    printf("uninstall nothisBundleName result is %d err %u\n", ret, g_errCode);

    printf("------end testUninstallErrBundleName------\n");
}

/**
 * @tc.number    : SUB_APPEXECFWK_0025
 * @tc.name      : testUninstallLegal
 * @tc.desc      : Uninstall parameter legal test
 */
LITE_TEST_CASE(BundleMgrTestSuite, testUninstallLegal, Function | MediumTest | Level0)
{
    printf("------start testUninstallLegal------\n");

    InstallParam installParam = {
        .installLocation = 1,
        .keepData = false
    };
    sem_init(&g_sem, 0, 0);
    bool ret = Install(INSTALL_APP_BIN_NAME, &installParam, TestInstallerCallback);
    sem_wait(&g_sem);

    bool isInstallSuccess = (g_errCode == 0) ? true : false;
    TEST_ASSERT_TRUE(isInstallSuccess);
    printf("install testdemo2 result is %d err %u\n", ret, g_errCode);

    sleep(1);
    sem_init(&g_sem, 0, 0);
    ret = Uninstall(INSTALL_APP_BUNDLE_NAME, &installParam, TestInstallerCallback);
    sem_wait(&g_sem);

    bool isUninstallSuccess = (g_errCode == 0) ? true : false;
    TEST_ASSERT_TRUE(isUninstallSuccess);
    printf("uninstall testdemo2 result is %d err %u\n", ret, g_errCode);

    printf("------end testUninstallLegal------\n");
}

RUN_TEST_SUITE(BundleMgrTestSuite);
