/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

export default function ApplicationContext() {
  describe("ApplicationContext", () => {
    let bundleName: string;

    beforeAll(async () => {
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number    : ABILITY_TEST_GETRUNNINGPROCESSINFORMATION_PROMISE_0100
     * @tc.name      : testGetRunningProcessInformationPromise001
     * @tc.desc      : test getRunningProcessInformation(promise)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetRunningProcessInformationPromise001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let appContext: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(appContext != null).assertTrue();

        appContext.getRunningProcessInformation().then((data) => {
          expect(data != undefined).assertTrue();
          console.log(`testGetRunningProcessInformationPromise001 pid:` + data[0].pid);
          expect(data[0].pid > 0).assertTrue();
          console.log(`testGetRunningProcessInformationPromise001 processName:` + data[0].processName);
          expect(data[0].processName == "com.example.contexttest").assertTrue();
          console.log(`testGetRunningProcessInformationPromise001 bundleNames:` + data[0].bundleNames);
          expect(data[0].bundleNames[0] == "com.example.contexttest").assertTrue();
          console.log(`testGetRunningProcessInformationPromise001 success`);
          done();
        }).catch((err: BusinessError) => {
          console.log(`testGetRunningProcessInformationPromise001 fail ` + err.message);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(`testGetRunningProcessInformationPromise001 fail ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_NATIVE_LIBRARY_PATH_0100
     * @tc.name      : testNativeLibraryPath001
     * @tc.desc      : test nativeLibraryPath
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testNativeLibraryPath001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        let moduleContextNativeLibraryPath = abilityContext.currentHapModuleInfo.nativeLibraryPath;
        expect(moduleContextNativeLibraryPath)
        expect(typeof (moduleContextNativeLibraryPath) == 'string').assertTrue();
        let applicationInfoNativeLibraryPath = abilityContext.applicationInfo.nativeLibraryPath;
        expect(typeof (applicationInfoNativeLibraryPath) == 'string').assertTrue();
        done();
      } catch (err) {
        console.log(`testNativeLibraryPath001 fail ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_NATIVE_LIBRARY_PATH_0200
     * @tc.name      : testNativeLibraryPath002
     * @tc.desc      : test nativeLibraryPath
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testNativeLibraryPath002', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        let moduleContextNativeLibraryPath = abilityContext.currentHapModuleInfo.nativeLibraryPath;
         if (moduleContextNativeLibraryPath != '') {
            fs.access(moduleContextNativeLibraryPath, (err,res) => {
            if (err == undefined) {
              if (res) {
                expect(true).assertTrue;
              } else {
                expect(false).assertTrue;
              }
            }
            });
         }

        let applicationInfoNativeLibraryPath = abilityContext.applicationInfo.nativeLibraryPath;
         if (applicationInfoNativeLibraryPath != '') {
            fs.access(applicationInfoNativeLibraryPath, (err,res) => {
            if (err == undefined) {
              if (res) {
                expect(true).assertTrue;
              } else {
                expect(false).assertTrue;
              }
            }
            });
         }
         done();
      } catch (err) {
        console.log(`testNativeLibraryPath002 fail ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_GETRUNNINGPROCESSINFORMATION_CALLBACK_0100
     * @tc.name      : testGetRunningProcessInformationCb001
     * @tc.desc      : test getRunningProcessInformation(callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetRunningProcessInformationCb001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let appContext: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(appContext != null).assertTrue();

        appContext.getRunningProcessInformation((err, data) => {
          expect(data != undefined).assertTrue();
          console.log(`testGetRunningProcessInformationCb001 pid:` + data[0].pid);
          expect(data[0].pid > 0).assertTrue();
          console.log(`testGetRunningProcessInformationCb001 processName:` + data[0].processName);
          expect(data[0].processName == "com.example.contexttest").assertTrue();
          console.log(`testGetRunningProcessInformationCb001 bundleNames:` + data[0].bundleNames);
          expect(data[0].bundleNames[0] == "com.example.contexttest").assertTrue();
          console.log(`testGetRunningProcessInformationCb001 success`);
          done();
        })
      } catch (err) {
        console.log(`testGetRunningProcessInformationCb001 fail ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STAGEMODE_0100
     * @tc.name      : testStageMode001
     * @tc.desc      : test filed of stageMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testStageMode001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(context.stageMode).assertTrue();
        console.log(`testStageMode001 success`);
        done();
      } catch (err) {
        console.log(`testStageMode001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_RESOURCEMANAGER_0100
     * @tc.name      : testResourceManager001
     * @tc.desc      : test filed of resourceManager
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testResourceManager001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(context.resourceManager != null).assertTrue();
        console.log(`testResourceManager001 success`);
        done();
      } catch (err) {
        console.log(`testResourceManager001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_APPLICATIONINFO_0100
     * @tc.name      : testApplicationInfo001
     * @tc.desc      : test filed of applicationInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testApplicationInfo001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(context != null).assertTrue();
        let applicationInfo = context.applicationInfo;
        expect(applicationInfo != null).assertTrue();

        console.log(`testApplicationInfo001 applicationInfo.name: ` + applicationInfo.name);
        expect(applicationInfo.name == 'com.example.contexttest').assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.description: ` + applicationInfo.description.length);
        expect(applicationInfo.description.length >= 0).assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.descriptionId: ` + applicationInfo.descriptionId);
        expect(applicationInfo.descriptionId == 0).assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.label: ` + applicationInfo.label);
        expect(applicationInfo.label == '$string:app_name').assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.labelId: ` + applicationInfo.labelId);
        expect(applicationInfo.labelId != null).assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.icon: ` + applicationInfo.icon);
        expect(applicationInfo.icon == '$media:app_icon').assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.iconId: ` + applicationInfo.iconId);
        expect(applicationInfo.iconId != null).assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.codePath: ` + applicationInfo.codePath);
        expect(typeof (applicationInfo.codePath) == 'string').assertTrue();

        console.log(`testApplicationInfo001 success`);
        done();
      } catch (err) {
        console.log(`testApplicationInfo001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CACHEDIR_0100
     * @tc.name      : testCacheDir001
     * @tc.desc      : test filed of cacheDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCacheDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        console.log(`testCacheDir001 cacheDir:` + context.cacheDir);
        expect(typeof (context.cacheDir) == 'string').assertTrue();
        console.log(`testCacheDir001 success`);
        done();
      } catch (err) {
        console.log(`testCacheDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_TEMPDIR_0100
     * @tc.name      : testTempDir001
     * @tc.desc      : test filed of tempDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTempDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        console.log(`testTempDir001 tempDir:` + context.tempDir);
        expect(typeof (context.tempDir) == 'string').assertTrue();
        console.log(`testTempDir001 success`);
        done();
      } catch (err) {
        console.log(`testTempDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_RESOURCE_DIR_0100
     * @tc.name      : testTempDir001
     * @tc.desc      : test filed of tempDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testResourceDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        console.log(`testResourceDir001 resourceDir:` + context.resourceDir);
        expect(typeof (context.resourceDir) == 'string').assertTrue();
        console.log(`testResourceDir001 success`);
        done();
      } catch (err) {
        console.log(`testResourceDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_FILESDIR_0100
     * @tc.name      : testFilesDir001
     * @tc.desc      : test filed of filesDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testFilesDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        console.log(`testFilesDir001 filesDir:` + context.filesDir);
        expect(typeof (context.filesDir) == 'string').assertTrue();
        console.log(`testFilesDir001 success`);
        done();
      } catch (err) {
        console.log(`testFilesDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_DATABASEDIR_0100
     * @tc.name      : testDatabaseDir001
     * @tc.desc      : test filed of databaseDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDatabaseDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        console.log(`testDatabaseDir001 databaseDir:` + context.databaseDir);
        expect(typeof (context.databaseDir) == 'string').assertTrue();
        console.log(`testDatabaseDir001 success`);
        done();
      } catch (err) {
        console.log(`testDatabaseDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_PREFERENCESDIR_0100
     * @tc.name      : testPreferencesDir001
     * @tc.desc      : test filed of preferencesDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPreferencesDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        console.log(`testPreferencesDir001 preferencesDir:` + context.preferencesDir);
        expect(typeof (context.preferencesDir) == 'string').assertTrue();
        console.log(`testPreferencesDir001 success`);
        done();
      } catch (err) {
        console.log(`testPreferencesDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_BUNDLECODEDIR_0100
     * @tc.name      : testBundleCodeDir001
     * @tc.desc      : test filed of bundleCodeDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testBundleCodeDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        console.log(`testBundleCodeDir001 bundleCodeDir:` + context.bundleCodeDir);
        expect(typeof (context.bundleCodeDir) == 'string').assertTrue();
        console.log(`testBundleCodeDir001 success`);
        done();
      } catch (err) {
        console.log(`testBundleCodeDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0100
     * @tc.name      : testCreateModuleContext001
     * @tc.desc      : Context calls createModuleContext, passing in the moduleName of the current application hap1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testCreateModuleContext001 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(context != null).assertTrue();
        let moduleContext = context.createModuleContext("entry");
        expect(moduleContext != null).assertTrue();
        bundleName = moduleContext.applicationInfo.name;
        console.info("testCreateModuleContext001 bundleName: " + bundleName);
        expect(bundleName).assertEqual("com.example.contexttest");
        done();
      } catch (err) {
        console.info("testCreateModuleContext001 err: " + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0200
     * @tc.name      : testCreateModuleContext002
     * @tc.desc      : Context calls createModuleContext, passing in the moduleName of the current application hap2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext002", Level.LEVEL0, async (done: Function) => {
      try {
        console.log("testCreateModuleContext002 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(context != null).assertTrue();
        let moduleContext = context.createModuleContext("entryTest");
        expect(moduleContext != null).assertTrue();
        bundleName = moduleContext.applicationInfo.name;
        console.info("testCreateModuleContext002 bundleName: " + bundleName);
        expect(bundleName).assertEqual("com.example.contexttest");
        done();
      } catch (err) {
        console.info("testCreateModuleContext002 err: " + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0300
     * @tc.name      : testCreateModuleContext003
     * @tc.desc      : Context calls createModuleContext, passing in the moduleName of the cross-application hap1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testCreateModuleContext003 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        let moduleContext = context.createModuleContext("entry_assist");
        expect(!moduleContext).assertTrue();
        done();
      } catch (err) {
        let errLog = "Invalid input parameter"
        console.debug("testCreateModuleContext003 ====>e====>" + err.toString());
        expect(err.toString().indexOf(errLog) >= 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0400
     * @tc.name      : testCreateModuleContext004
     * @tc.desc      : Context calls createModuleContext, passing in a non-existing moduleName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testCreateModuleContext004 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        let moduleContext = context.createModuleContext("abc");
        expect(!moduleContext).assertTrue();
        done();
      } catch (err) {
        let errLog = "Invalid input parameter"
        console.debug("testCreateModuleContext004 ====>e====>" + err.toString());
        expect(err.toString().indexOf(errLog) >= 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0500
     * @tc.name      : testCreateModuleContext005
     * @tc.desc      : Context calls createModuleContext, and the incoming moduleName is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testCreateModuleContext005 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        let moduleContext = context.createModuleContext(undefined);
        expect(moduleContext != null).assertTrue();
        done();
      } catch (err) {
        let errLog = "Parse param moduleName failed, moduleName must be string."
        console.debug("testCreateModuleContext005 ====>e====>" + err.toString());
        expect(err.toString().indexOf(errLog) >= 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_GETAPPLICATIONCONTEXT_0100
     * @tc.name      : testGetApplicationContext001
     * @tc.desc      : test getApplicationContext return not empty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testGetApplicationContext001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testGetApplicationContext001 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();
        let context: common.ApplicationContext = abilityContext.getApplicationContext();
        let applicationContext = context.getApplicationContext();
        expect(applicationContext != null).assertTrue();
        console.info("testGetApplicationContext001 success");
        done();
      } catch (err) {
        console.log(`testGetApplicationContext001 fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0100
     * @tc.name      : SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0100
     * @tc.desc      : test createSystemHspModuleResourceManager failed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0100", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0100 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();

        abilityContext.createSystemHspModuleResourceManager("bundleName", "module");
      } catch (err) {
        console.log(`SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0100 fail: ` + err);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0200
     * @tc.name      : SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0200
     * @tc.desc      : test createSystemHspModuleResourceManager failed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0200", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0200 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();

        abilityContext.createSystemHspModuleResourceManager("", "module");
      } catch (err) {
        console.log(`SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0200 fail: ` + err);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0300
     * @tc.name      : SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0300
     * @tc.desc      : test createSystemHspModuleResourceManager failed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0300", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0300 begin");
        let abilityContext: common.UIAbilityContext = globalThis.abilityContext;
        expect(abilityContext != null).assertTrue();

        abilityContext.createSystemHspModuleResourceManager("bundleName", "");
      } catch (err) {
        console.log(`SUB_Ability_AbilityRuntime_Create_CreateSystemHspModuleResourceManager_0300 fail: ` + err);
        expect(err.code === 401).assertTrue();
        done();
      }
    });
  })
}
