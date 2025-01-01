/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import Utils from './utils'
import { application, common, sendableContextManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { preferences, relationalStore } from '@kit.ArkData';
import { resourceManager } from '@kit.LocalizationKit';
import { display, screen } from '@kit.ArkUI';

const TAG: string = 'DisplayContextTest';
const DOMAIN_NUMBER: number = 0x0000;
let allDisplayId: Array<number>;
let densityDPI_before: number = 0;
let densityDpi: number = 160;

export default function abilityTest() {

  const CACHE_DIR = "/data/storage/el2/base/haps/entry_test/cache"
  const FILE_DIR = "/data/storage/el2/base/haps/entry_test/files"
  const TEMP_DIR = "/data/storage/el2/base/haps/entry_test/temp"
  const DATABASE_DIR = "/data/storage/el2/database/entry_test"
  const preferences_DIR = "/data/storage/el2/base/haps/entry_test/preferences"
  const BUNDLE_DIR = "/data/storage/el1/bundle"
  const distributedFilesDir_DIR = "/data/storage/el2/distributedfiles"
  const resourceDir_DIR = ""
  const cloudFile_Dir = "/data/storage/el2/cloud"

  const CACHE_DIR_app = "/data/storage/el2/base/cache"
  const FILE_DIR_app = "/data/storage/el2/base/files"
  const TEMP_DIR_app = "/data/storage/el2/base/temp"
  const DATABASE_DIR_app = "/data/storage/el2/database"
  const preferences_DIR_app = "/data/storage/el2/base/preferences"
  const BUNDLE_DIR_app = "/data/storage/el1/bundle"
  const distributedFilesDir_DIR_app = "/data/storage/el2/distributedfiles"
  const resourceDir_DIR_app = ""
  const cloudFile_Dir_app = "/data/storage/el2/cloud"

  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      allDisplayId = await getDisplayIDs();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_dir_0100
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_dir_0100
     * @tc.desc: Retrieve the path property from the displayContext created by uiAbilityContext
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_dir_0100', 0, async (done: Function) => {
      console.log("[UIAbilityContext_dir_0100]: start");
      try {
        console.log("[UIAbilityContext_dir_0100]: try");
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        console.log("[UIAbilityContext_dir_0100]: uiAbilityContext" + JSON.stringify(uiAbilityContext));
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIAbilityContext_dir_0100]: uiAbilityContext" + JSON.stringify(displayContext));
        expect(displayContext.cacheDir).assertEqual(CACHE_DIR);
        expect(displayContext.filesDir).assertEqual(FILE_DIR);
        expect(displayContext.tempDir).assertEqual(TEMP_DIR);
        expect(displayContext.databaseDir).assertEqual(DATABASE_DIR);
        expect(displayContext.preferencesDir).assertEqual(preferences_DIR);
        expect(displayContext.bundleCodeDir).assertEqual(BUNDLE_DIR);
        expect(displayContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR);
        expect(displayContext.resourceDir).assertEqual(resourceDir_DIR);
        expect(displayContext.cloudFileDir).assertEqual(cloudFile_Dir);
      } catch (err) {
        console.error("[UIAbilityContext_dir_0100]: " + err);
      }
      console.log("[UIAbilityContext_dir_0100]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_resourceManager_0200
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_resourceManager_0200
     * @tc.desc: Retrieve the resourceManager property from the displayContext created by UIAbilityContext
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_resourceManager_0200', 0, async (done: Function) => {
      console.log("[UIAbilityContext_resourceManager_0200]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIAbilityContext_resourceManager_0200]: uiAbilityContext" + JSON.stringify(displayContext));
        await resourceManagerTest(displayContext).then((data) => {
          console.log("[UIAbilityContext_resourceManager_0200] data : " + data);
          expect(true).assertEqual(data);
        })
      } catch (err) {
        console.error("[UIAbilityContext_resourceManager_0200]: " + err);
      }
      console.log("[UIAbilityContext_resourceManager_0200]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIContext_resourceManagerChange_0300
     * @tc.name: SUB_Ability_AbilityRuntime_UIContext_resourceManagerChange_0300
     * @tc.desc: Create a display context using UIContext to obtain the current screen density and screen orientation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_resourceManagerChange_0300', 0, async (done: Function) => {
      console.log("[UIAbilityContext_resourceManagerChange_0300]: start");
      try {
        console.log("[UIAbilityContext_resourceManagerChange_0300]: try");
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        console.log("[UIAbilityContext_resourceManagerChange_0300]: uiAbilityContext" +
        JSON.stringify(uiAbilityContext));
        let screenClass: screen.Screen | null = null;
        screen.getAllScreens().then(async data => {
          screenClass = data[0];
          await display.getAllDisplays((err: BusinessError, data: Array<display.Display>) => {
            const errCode: number = err.code;
            if (errCode) {
              hilog.error(DOMAIN_NUMBER, TAG, 'Failed to obtain all the display objects. error: %{public}s',
                JSON.stringify(err));
            }
            densityDPI_before = data[0].densityDPI;
          });
          await sleep(1000);
          await screenClass.setDensityDpi(densityDpi);
          console.log("setDensityDpi success:" + densityDpi);
          await screen.getAllScreens().then(data => {
            hilog.info(DOMAIN_NUMBER, TAG,
              'DisplayContextTest Succeeded in getting all screens. Data: ' + JSON.stringify(data));
            let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
            displayContext.resourceManager.getConfiguration((error: BusinessError,
              value: resourceManager.Configuration) => {
              console.log(TAG + value.screenDensity);
              expect(value.screenDensity).assertEqual(densityDpi);
            });
          });
          await sleep(1000);
          console.log(TAG + " densityDPI_before = " + densityDPI_before);
          await screenClass.setDensityDpi(densityDPI_before);
          console.log("setDensityDpi success densityDPI_before:" + densityDPI_before);
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN_NUMBER, TAG, 'Failed to get all screens. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (err) {
        console.error("[UIAbilityContext_resourceManagerChange_0300]: " + err);
      }
      await sleep(3000);
      console.log("[UIAbilityContext_resourceManagerChange_0300]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_applicationInfo_0400
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_applicationInfo_0400
     * @tc.desc: Create a display context through UIContext to obtain applicationInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_applicationInfo_0400', 0, async (done: Function) => {
      console.log("[UIAbilityContext_applicationInfo_0400]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIAbilityContext_applicationInfo_0400]: uiAbilityContext" + JSON.stringify(displayContext));
        let appInfo: string = JSON.stringify(uiAbilityContext.applicationInfo);
        let appDisplayInfo: string = JSON.stringify(displayContext.applicationInfo);
        expect(appInfo).assertEqual(appDisplayInfo);
      } catch (err) {
        console.error("[UIAbilityContext_applicationInfo_0400]: " + err);
      }
      console.log("[UIAbilityContext_applicationInfo_0400]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_processName_0500
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_processName_0500
     * @tc.desc: Retrieve the processName property from the showContext created by UIAbilityContext
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_processName_0500', 0, async (done: Function) => {
      console.log("[UIAbilityContext_processName_0500]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIAbilityContext_processName_0500]: uiAbilityContext" + JSON.stringify(displayContext));
        let displayProName = displayContext.processName;
        let proName = uiAbilityContext.processName;
        console.log("[UIAbilityContext_processName_0500]: areaProName" + displayProName);
        console.log("[UIAbilityContext_processName_0500]: proName" + proName);
        expect(displayProName).assertContain(proName);
      } catch (err) {
        console.error("[UIAbilityContext_processName_0500]: " + err);
      }
      console.log("[UIAbilityContext_processName_0500]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_createModuleContext_0600
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_createModuleContext_0600
     * @tc.desc: Create a display context through UIContext to obtain default values for screen density and screen orientation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_createModuleContext_0600', 0, async (done: Function) => {
      console.log("[UIAbilityContext_createModuleContext_0600]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIAbilityContext_createModuleContext_0600]: uiAbilityContext" + JSON.stringify(displayContext));
        let screenDisplayInfo: boolean = await createModuleContextTest(displayContext);
        console.log("[UIAbilityContext_createModuleContext_0600]: screenDisplayInfo" + screenDisplayInfo);

        expect(true).assertEqual(screenDisplayInfo);
      } catch (err) {
        console.error("[UIAbilityContext_createModuleContext_0600]: " + err);
      }
      console.log("[UIAbilityContext_createModuleContext_0600]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_sendable_0700
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_sendable_0700
     * @tc.desc: Using sendable to convert Context in the Display Context created by UIAbilityContext
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_sendable_0700', 0, async (done: Function) => {
      console.log("[UIAbilityContext_sendable_0700]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIAbilityContext_sendable_0700]: uiAbilityContext" + JSON.stringify(displayContext));
        let result = sendableContext(displayContext);
        expect(true).assertEqual(result);
      } catch (err) {
        console.error("[UIAbilityContext_sendable_0700]: " + err);
      }
      console.log("[UIAbilityContext_sendable_0700]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_getRdbStore_0800
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_getRdbStore_0800
     * @tc.desc: The display Context created using UIAbilityContext is passed as a parameter to rdbStore
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_getRdbStore_0800', 0, async (done: Function) => {
      console.log("[UIAbilityContext_getRdbStore_0800]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIAbilityContext_getRdbStore_0800]: uiAbilityContext" + JSON.stringify(displayContext));
        await getRdbStore(displayContext).then((data: relationalStore.RdbStore) => {
          console.log("[UIAbilityContext_getRdbStore_0800]: store: " + data + JSON.stringify(data));
          expect("{}").assertEqual(JSON.stringify(data));
        })
      } catch (err) {
        console.error("[UIAbilityContext_getRdbStore_0800]: " + err);
      }
      console.log("[UIAbilityContext_getRdbStore_0800]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_nullAndUndefinedDisplay_0900
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_nullAndUndefinedDisplay_0900
     * @tc.desc: The display Context created by UIAbilityContext is passed in null/undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_nullAndUndefinedDisplay_0900', 0, async (done: Function) => {
      console.log("[UIAbilityContext_nullAndUndefinedDisplay_0900]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let errCode: number = -1;
        try {
          let displayContext = uiAbilityContext.createDisplayContext(null);
          console.log("[UIAbilityContext_nullAndUndefinedDisplay_0900]: uiAbilityContext" +
          JSON.stringify(displayContext));
        } catch (err) {
          let code = (err as BusinessError).code;
          errCode = code;
        }
        expect(401).assertEqual(errCode);
      } catch (err) {
        console.error("[UIAbilityContext_nullAndUndefinedDisplay_0900]: " + err);
      }
      console.log("[UIAbilityContext_nullAndUndefinedDisplay_0900]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_appContextSetLanguage_1000
     * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_appContextSetLanguage_1000
     * @tc.desc: Call setLanguage after creating ApplicationContext through the displayContext created by UIAbilityContext
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIAbilityContext_appContextSetLanguage_1000', 0, async (done: Function) => {
      console.log("[UIAbilityContext_appContextSetLanguage_1000]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        let appContext = displayContext.getApplicationContext();
        console.log("[UIAbilityContext_appContextSetLanguage_1000]: uiAbilityContext" + JSON.stringify(appContext));
        appContext.setLanguage('us');
        expect(true).assertTrue();
      } catch (err) {
        console.error("[UIAbilityContext_appContextSetLanguage_1000]: " + err);
      }
      console.log("[UIAbilityContext_appContextSetLanguage_1000]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_createModuleContext_displayDir_1100
     * @tc.name: SUB_Ability_AbilityRuntime_createModuleContext_displayDir_1100
     * @tc.desc: Create a Context through the application, then create an Application Context and then create a Display Context to obtain the path properties
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('createModuleContext_displayDir_1100', 0, async (done: Function) => {
      console.log("[createModuleContext_displayDir_1100]: start");
      await Utils.sleep(500);
      try {
        let displayContext: common.Context;
        let appContext: common.ApplicationContext;
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let context = await application.createModuleContext(uiAbilityContext, "entry_test");
        displayContext = context.createDisplayContext(allDisplayId[0]);
        appContext = displayContext.getApplicationContext();
        console.log("[createModuleContext_displayDir_1100]: uiAbilityContext" + JSON.stringify(appContext));
        expect(displayContext.cacheDir).assertEqual(CACHE_DIR_app);
        expect(displayContext.filesDir).assertEqual(FILE_DIR_app);
        expect(displayContext.tempDir).assertEqual(TEMP_DIR_app);
        expect(displayContext.databaseDir).assertEqual(DATABASE_DIR_app);
        expect(displayContext.preferencesDir).assertEqual(preferences_DIR_app);
        expect(displayContext.bundleCodeDir).assertEqual(BUNDLE_DIR_app);
        expect(displayContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR_app);
        expect(displayContext.resourceDir).assertEqual(resourceDir_DIR_app);
        expect(displayContext.cloudFileDir).assertEqual(cloudFile_Dir_app);
      } catch (err) {
        console.error("[createModuleContext_displayDir_1100]: " + err);
      }
      console.log("[createModuleContext_displayDir_1100]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_createModuleContext_ResourceManager_1200
     * @tc.name: SUB_Ability_AbilityRuntime_createModuleContext_ResourceManager_1200
     * @tc.desc: Create a Context through the application, then create an Application Context and then create a DisplayContext to obtain the Resource Manager
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('createModuleContext_ResourceManager_1200', 0, async (done: Function) => {
      console.log("[createModuleContext_ResourceManager_1200]: start");
      await Utils.sleep(500);
      try {
        let displayContext: common.Context;
        let appContext: common.ApplicationContext;
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let context = await application.createModuleContext(uiAbilityContext, "entry_test")
        displayContext = context.createDisplayContext(allDisplayId[0]);
        appContext = displayContext.getApplicationContext();
        console.log("[createModuleContext_ResourceManager_1200]: uiAbilityContext" + JSON.stringify(appContext));
        resourceManagerTest(displayContext).then((data) => {
          console.log("[createModuleContext_ResourceManager_1200] data : " + data);
          expect(true).assertEqual(data);
        })
      } catch (err) {
        console.error("[createModuleContext_ResourceManager_1200]: " + err);
      }
      console.log("[createModuleContext_ResourceManager_1200]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_createModuleContext_applicationInfo_1300
     * @tc.name: SUB_Ability_AbilityRuntime_createModuleContext_applicationInfo_1300
     * @tc.desc: Create a Context through the application, then create an Application Context and create a Display Context to obtain the Application Info
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('createModuleContext_applicationInfo_1300', 0, async (done: Function) => {
      console.log("[createModuleContext_applicationInfo_1300]: start");
      await Utils.sleep(500);
      try {
        let displayContext: common.Context;
        let appContext: common.ApplicationContext;
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let context = await application.createModuleContext(uiAbilityContext, "entry_test");
        displayContext = context.createDisplayContext(allDisplayId[0]);
        console.log("[createModuleContext_applicationInfo_1300]: uiAbilityContext" + JSON.stringify(displayContext));
        let appAreaInfo: string = JSON.stringify(displayContext.applicationInfo);
        let appInfo: string = JSON.stringify(uiAbilityContext.applicationInfo);
        expect(appInfo).assertEqual(appAreaInfo);
      } catch (err) {
        console.error("[createModuleContext_applicationInfo_1300]: " + err);
      }
      console.log("[createModuleContext_applicationInfo_1300]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_createModuleContext_ProcessName_1400
     * @tc.name: SUB_Ability_AbilityRuntime_createModuleContext_ProcessName_1400
     * @tc.desc: Create a Context through the application, then create an Application Context and then create a Display Context to obtain the processName
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('createModuleContext_ProcessName_1400', 0, async (done: Function) => {
      console.log("[createModuleContext_ProcessName_1400]: start");
      await Utils.sleep(500);
      try {
        let displayContext: common.Context;
        let appContext: common.ApplicationContext;
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let context = await application.createModuleContext(uiAbilityContext, "entry_test");
        displayContext = context.createDisplayContext(allDisplayId[0]);
        appContext = displayContext.getApplicationContext();
        console.log("[createModuleContext_ProcessName_1400]: uiAbilityContext" + JSON.stringify(appContext));
        let areaProName = displayContext.processName;
        let proName = uiAbilityContext.processName;
        console.log("[createModuleContext_ProcessName_1400]: areaProName" + areaProName);
        console.log("[createModuleContext_ProcessName_1400]: proName" + proName);
        expect(areaProName).assertContain(proName);
      } catch (err) {
        console.error("[createModuleContext_ProcessName_1400]: " + err);
      }
      console.log("[createModuleContext_ProcessName_1400]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_createModuleContext_sendable_1500
     * @tc.name: SUB_Ability_AbilityRuntime_createModuleContext_sendable_1500
     * @tc.desc: Create Context through Application, then create an Application Context and create a Display Context. Use Sendable to convert the context
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('createModuleContext_sendable_1500', 0, async (done: Function) => {
      console.log("[createModuleContext_sendable_1500]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        let appContext = displayContext.getApplicationContext();
        console.log("[createModuleContext_sendable_1500]: uiAbilityContext" + JSON.stringify(appContext));
        let result = sendableContext(appContext);
        expect(true).assertEqual(result);
      } catch (err) {
        console.error("[createModuleContext_sendable_1500]: " + err);
      }
      console.log("[context_sendable_0700]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_createBundleContext_RbgStore_1600
     * @tc.name: SUB_Ability_AbilityRuntime_createBundleContext_RbgStore_1600
     * @tc.desc: Create a Context using an application, then create an Application Context and create a Display Context, passing it as a parameter to RdbStore
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('createBundleContext_RbgStore_1600', 0, async (done: Function) => {
      console.log("[createBundleContext_RbgStore_1600]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let context = await application.createModuleContext(uiAbilityContext, "entry_test");
        let displayContext = context.createDisplayContext(allDisplayId[0]);
        let appContext = displayContext.getApplicationContext();
        await getRdbStore(appContext).then((data: relationalStore.RdbStore) => {
          console.log("[createBundleContext_RbgStore_1600]: store: " + data + JSON.stringify(data));
          expect("{}").assertEqual(JSON.stringify(data));
        })
      } catch (err) {
        console.error("[createBundleContext_RbgStore_1600]: " + err);
      }
      console.log("[createBundleContext_RbgStore_1600]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_dir_1700
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_dir_1700
     * @tc.desc: Create a display context using UIExtensionContext to obtain path properties
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_dir_1700', 0, async (done: Function) => {
      console.log("[UIExtensionContext_dir_1700]: start")
      try {
        console.log("[UIExtensionContext_dir_1700]: try");
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        console.log("[UIExtensionContext_dir_1700]: UIExtensionContext" + JSON.stringify(UIExtensionContext));
        let displayContext = UIExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIExtensionContext_dir_1700]: UIExtensionContext" + JSON.stringify(displayContext));
        expect(displayContext.cacheDir).assertEqual(CACHE_DIR);
        expect(displayContext.filesDir).assertEqual(FILE_DIR);
        expect(displayContext.tempDir).assertEqual(TEMP_DIR);
        expect(displayContext.databaseDir).assertEqual(DATABASE_DIR);
        expect(displayContext.preferencesDir).assertEqual(preferences_DIR);
        expect(displayContext.bundleCodeDir).assertEqual(BUNDLE_DIR);
        expect(displayContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR);
        expect(displayContext.resourceDir).assertEqual(resourceDir_DIR);
        expect(displayContext.cloudFileDir).assertEqual(cloudFile_Dir);
      } catch (err) {
        console.error("[UIExtensionContext_dir_1700]: " + err);
      }
      console.log("[UIExtensionContext_dir_1700]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_resourceManager_1800
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_resourceManager_1800
     * @tc.desc: Create a Display Context using UIExtensionContext to obtain the ResourceManager
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_resourceManager_1800', 0, async (done: Function) => {
      console.log("[UIExtensionContext_resourceManager_1800]: start");
      await Utils.sleep(500);
      try {
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        let displayContext = UIExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIExtensionContext_resourceManager_1800]: UIExtensionContext" + JSON.stringify(displayContext));
        await resourceManagerTest(displayContext).then((data) => {
          console.log("[UIExtensionContext_resourceManager_1800] data : " + data);
          expect(true).assertEqual(data);
        })
      } catch (err) {
        console.error("[UIExtensionContext_resourceManager_1800]: " + err);
      }
      console.log("[UIExtensionContext_resourceManager_1800]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_resourceManagerChange_1900
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_resourceManagerChange_1900
     * @tc.desc: Create a display context using UIExtensionContext to obtain the current screen density and screen orientation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_resourceManagerChange_1900', 0, async (done: Function) => {
      console.log("[UIExtensionContext_resourceManagerChange_1900]: start")
      try {
        console.log("[UIExtensionContext_resourceManagerChange_1900]: try")
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        console.log("[UIExtensionContext_resourceManagerChange_1900]: UIExtensionContext" +
        JSON.stringify(UIExtensionContext));
        let screenClass: screen.Screen | null = null;
        screen.getAllScreens().then(async data => {
          screenClass = data[0];
          await display.getAllDisplays((err: BusinessError, data: Array<display.Display>) => {
            const errCode: number = err.code;
            if (errCode) {
              hilog.error(DOMAIN_NUMBER, TAG, 'Failed to obtain all the display objects. error: %{public}s',
                JSON.stringify(err));
            }
            densityDPI_before = data[0].densityDPI;
          });
          await sleep(1000);
          await screenClass.setDensityDpi(densityDpi);
          await screen.getAllScreens().then(data => {
            hilog.info(DOMAIN_NUMBER, TAG,
              'DisplayContextTest Succeeded in getting all screens. Data: ' + JSON.stringify(data));
            let displayContext = UIExtensionContext.createDisplayContext(allDisplayId[0]);
            displayContext.resourceManager.getConfiguration((error: BusinessError,
              value: resourceManager.Configuration) => {
              console.log(TAG + value.screenDensity);
              expect(value.screenDensity).assertEqual(densityDpi);
            });
          });
          await sleep(1000);
          console.log(TAG + " densityDPI_before = " + densityDPI_before);
          await screenClass.setDensityDpi(densityDPI_before);
          console.log("setDensityDpi success densityDPI_before:" + densityDPI_before);
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN_NUMBER, TAG, 'Failed to get all screens. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (err) {
        console.error("[UIExtensionContext_resourceManagerChange_1900]: " + err);
      }
      await sleep(3000);
      console.log("[UIExtensionContext_resourceManagerChange_1900]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_applicationInfo_2000
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_applicationInfo_2000
     * @tc.desc: Create a display context using UIExtensionContext to obtain applicationInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_applicationInfo_2000', 0, async (done: Function) => {
      console.log("[UIExtensionContext_applicationInfo_2000]: start");
      await Utils.sleep(500);
      try {
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        let displayContext = UIExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIExtensionContext_applicationInfo_2000]: UIExtensionContext" + JSON.stringify(displayContext));
        let appInfo: string = JSON.stringify(UIExtensionContext.applicationInfo);
        let appDisplayInfo: string = JSON.stringify(displayContext.applicationInfo);
        expect(appInfo).assertEqual(appDisplayInfo);
      } catch (err) {
        console.error("[UIExtensionContext_applicationInfo_2000]: " + err);
      }
      console.log("[UIExtensionContext_applicationInfo_2000]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_processName_2100
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_processName_2100
     * @tc.desc: Create a display context using UIExtensionContext to obtain the processName property
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_processName_2100', 0, async (done: Function) => {
      console.log("[UIExtensionContext_processName_2100]: start");
      await Utils.sleep(500);
      try {
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        let displayContext = UIExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIExtensionContext_processName_2100]: UIExtensionContext" + JSON.stringify(displayContext));
        let displayProName = displayContext.processName;
        let proName = UIExtensionContext.processName;
        console.log("[UIExtensionContext_processName_2100]: areaProName" + displayProName);
        console.log("[UIExtensionContext_processName_2100]: proName" + proName);
        expect(displayProName).assertContain(proName);
      } catch (err) {
        console.error("[UIExtensionContext_processName_2100]: " + err);
      }
      console.log("[UIExtensionContext_processName_2100]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_createModuleContext_2200
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_createModuleContext_2200
     * @tc.desc: Create a display context using UIExtensionContext to obtain default values for screen orientation and screen density
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_createModuleContext_2200', 0, async (done: Function) => {
      console.log("[UIExtensionContext_createModuleContext_2200]: start");
      await Utils.sleep(500);
      try {
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        let displayContext = UIExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIExtensionContext_createModuleContext_2200]: UIExtensionContext" +
        JSON.stringify(displayContext));
        let screenDisplayInfo: boolean = await createModuleContextTest(displayContext);
        console.log("[UIExtensionContext_createModuleContext_2200]: screenDisplayInfo" + screenDisplayInfo);
        expect(true).assertEqual(screenDisplayInfo);
      } catch (err) {
        console.error("[UIExtensionContext_createModuleContext_2200]: " + err);
      }
      console.log("[UIExtensionContext_createModuleContext_2200]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_sendable_2300
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_sendable_2300
     * @tc.desc: Create a display context using UIExtensionContext and convert the context through sendable
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_sendable_2300', 0, async (done: Function) => {
      console.log("[UIExtensionContext_sendable_2300]: start");
      await Utils.sleep(500);
      try {
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        let displayContext = UIExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIExtensionContext_sendable_2300]: UIExtensionContext" + JSON.stringify(displayContext));
        let result = sendableContext(displayContext);
        expect(true).assertEqual(result);
      } catch (err) {
        console.error("[UIExtensionContext_sendable_2300]: " + err);
      }
      console.log("[UIExtensionContext_sendable_2300]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_getRdbStore_2400
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_getRdbStore_2400
     * @tc.desc: UIExtensionContext creates a display Context and passes it as a parameter to RdbStore
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_getRdbStore_2400', 0, async (done: Function) => {
      console.log("[UIExtensionContext_getRdbStore_2400]: start");
      await Utils.sleep(500);
      try {
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        let displayContext = UIExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIExtensionContext_getRdbStore_2400]: UIExtensionContext" + JSON.stringify(displayContext));
        await getRdbStore(displayContext).then((data: relationalStore.RdbStore) => {
          console.log("[UIExtensionContext_getRdbStore_2400]: store: " + data + JSON.stringify(data));
          expect("{}").assertEqual(JSON.stringify(data));
        })
      } catch (err) {
        console.error("[UIExtensionContext_getRdbStore_2400]: " + err);
      }
      console.log("[UIExtensionContext_getRdbStore_2400]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_nullAndUndefinedDisplay_2500
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionContext_nullAndUndefinedDisplay_2500
     * @tc.desc: UIExtensionContext creates a display Context parameter and passes it null/undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIExtensionContext_nullAndUndefinedDisplay_2500', 0, async (done: Function) => {
      console.log("[UIExtensionContext_nullAndUndefinedDisplay_2500]: start");
      await Utils.sleep(500);
      try {
        let UIExtensionContext = globalThis.UIContext as common.UIExtensionContext;
        let errCode: number = -1;
        try {
          let displayContext = UIExtensionContext.createDisplayContext(null);
          console.log("[UIExtensionContext_nullAndUndefinedDisplay_2500]: UIExtensionContext" +
          JSON.stringify(displayContext));
        } catch (err) {
          let code = (err as BusinessError).code;
          errCode = code;
        }
        expect(401).assertEqual(errCode);
      } catch (err) {
        console.error("[UIExtensionContext_nullAndUndefinedDisplay_2500]: " + err);
      }
      console.log("[UIExtensionContext_nullAndUndefinedDisplay_2500]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_dir_2600
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_dir_2600
     * @tc.desc: Create a display context using UI Service ExtensionContext to obtain path properties
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_dir_2600', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_dir_2600]: start");
      try {
        console.log("[UIServiceExtensionContext_dir_2600]: try");
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        console.log("[UIServiceExtensionContext_dir_2600]: UIServiceExtensionContext" +
        JSON.stringify(UIServiceExtensionContext));
        let displayContext = UIServiceExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIServiceExtensionContext_dir_2600]: UIServiceExtensionContext" + JSON.stringify(displayContext));
        expect(displayContext.cacheDir).assertEqual(CACHE_DIR);
        expect(displayContext.filesDir).assertEqual(FILE_DIR);
        expect(displayContext.tempDir).assertEqual(TEMP_DIR);
        expect(displayContext.databaseDir).assertEqual(DATABASE_DIR);
        expect(displayContext.preferencesDir).assertEqual(preferences_DIR);
        expect(displayContext.bundleCodeDir).assertEqual(BUNDLE_DIR);
        expect(displayContext.distributedFilesDir).assertEqual(distributedFilesDir_DIR);
        expect(displayContext.resourceDir).assertEqual(resourceDir_DIR);
        expect(displayContext.cloudFileDir).assertEqual(cloudFile_Dir);
      } catch (err) {
        console.error("[UIServiceExtensionContext_dir_2600]: " + err);
      }
      console.log("[UIServiceExtensionContext_dir_2600]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_resourceManager_2700
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_resourceManager_2700
     * @tc.desc: Create a display context using UIService ExtensionContext to obtain the resourceManager property
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_resourceManager_2700', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_resourceManager_2700]: start");
      await Utils.sleep(500);
      try {
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        let displayContext = UIServiceExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIServiceExtensionContext_resourceManager_2700]: UIServiceExtensionContext" +
        JSON.stringify(displayContext));
        await resourceManagerTest(displayContext).then((data) => {
          console.log("[UIServiceExtensionContext_resourceManager_2700] data : " + data);
          expect(true).assertEqual(data);
        })
      } catch (err) {
        console.error("[UIServiceExtensionContext_resourceManager_2700]: " + err);
      }
      console.log("[UIServiceExtensionContext_resourceManager_2700]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_resourceManagerChange_2800
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_resourceManagerChange_2800
     * @tc.desc: Create a display context using UI Service ExtensionContext to obtain the current screen density and screen orientation in the resource manager
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_resourceManagerChange_2800', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_resourceManagerChange_2800]: start");
      try {
        console.log("[UIServiceExtensionContext_resourceManagerChange_2800]: try");
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        console.log("[UIServiceExtensionContext_resourceManagerChange_2800]: UIServiceExtensionContext" +
        JSON.stringify(UIServiceExtensionContext));
        let screenClass: screen.Screen | null = null;
        screen.getAllScreens().then(async data => {
          screenClass = data[0];
          await display.getAllDisplays((err: BusinessError, data: Array<display.Display>) => {
            const errCode: number = err.code;
            if (errCode) {
              hilog.error(DOMAIN_NUMBER, TAG, 'Failed to obtain all the display objects. error: %{public}s',
                JSON.stringify(err));
            }
            densityDPI_before = data[0].densityDPI;
          });
          await sleep(1000);
          await screenClass.setDensityDpi(densityDpi);
          console.log("setDensityDpi success:" + densityDpi);
          await screen.getAllScreens().then(data => {
            hilog.info(DOMAIN_NUMBER, TAG,
              'DisplayContextTest Succeeded in getting all screens. Data: ' + JSON.stringify(data));
            let displayContext = UIServiceExtensionContext.createDisplayContext(allDisplayId[0]);
            displayContext.resourceManager.getConfiguration((error: BusinessError,
              value: resourceManager.Configuration) => {
              console.log(TAG + value.screenDensity);
              expect(value.screenDensity).assertEqual(densityDpi);
            });
          });
          await sleep(1000);
          console.log(TAG + " densityDPI_before = " + densityDPI_before);
          await screenClass.setDensityDpi(densityDPI_before);
          console.log("setDensityDpi success densityDPI_before:" + densityDPI_before);
        }).catch((err: BusinessError) => {
          hilog.info(DOMAIN_NUMBER, TAG, 'Failed to get all screens. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (err) {
        console.error("[UIServiceExtensionContext_resourceManagerChange_2800]: " + err);
      }
      await sleep(3000);
      console.log("[UIServiceExtensionContext_resourceManagerChange_2800]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_applicationInfo_2900
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_applicationInfo_2900
     * @tc.desc: Create a display context using UI Service ExtensionContext to obtain the applicationInfo property
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_applicationInfo_2900', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_applicationInfo_2900]: start");
      await Utils.sleep(500);
      try {
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        let displayContext = UIServiceExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIServiceExtensionContext_applicationInfo_2900]: UIServiceExtensionContext" +
        JSON.stringify(displayContext));
        let appInfo: string = JSON.stringify(UIServiceExtensionContext.applicationInfo);
        let appDisplayInfo: string = JSON.stringify(displayContext.applicationInfo);
        expect(appInfo).assertEqual(appDisplayInfo);
      } catch (err) {
        console.error("[UIServiceExtensionContext_applicationInfo_2900]: " + err);
      }
      console.log("[UIServiceExtensionContext_applicationInfo_2900]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_processName_3000
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_processName_3000
     * @tc.desc: Create a showContext using UIService ExtensionContext to retrieve the processName property
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_processName_3000', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_processName_3000]: start");
      await Utils.sleep(500);
      try {
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        let displayContext = UIServiceExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIServiceExtensionContext_processName_3000]: UIServiceExtensionContext" +
        JSON.stringify(displayContext));
        let displayProName = displayContext.processName;
        let proName = UIServiceExtensionContext.processName;
        console.log("[UIServiceExtensionContext_processName_3000]: areaProName" + displayProName);
        console.log("[UIServiceExtensionContext_processName_3000]: proName" + proName);
        expect(displayProName).assertContain(proName);
      } catch (err) {
        console.error("[UIServiceExtensionContext_processName_3000]: " + err);
      }
      console.log("[UIServiceExtensionContext_processName_3000]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_createModuleContext_3100
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_createModuleContext_3100
     * @tc.desc: Create a display context using UI Service ExtensionContext to obtain default values for screen orientation and screen density
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_createModuleContext_3100', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_createModuleContext_3100]: start");
      await Utils.sleep(500);
      try {
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        let displayContext = UIServiceExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIServiceExtensionContext_createModuleContext_3100]: UIServiceExtensionContext" +
        JSON.stringify(displayContext));
        let screenDisplayInfo: boolean = await createModuleContextTest(displayContext);
        console.log("[UIServiceExtensionContext_createModuleContext_3100]: screenDisplayInfo" + screenDisplayInfo);
        expect(true).assertEqual(screenDisplayInfo);
      } catch (err) {
        console.error("[UIServiceExtensionContext_createModuleContext_3100]: " + err);
      }
      console.log("[UIServiceExtensionContext_createModuleContext_3100]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_sendable_3200
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_sendable_3200
     * @tc.desc: Create a display context using UIService ExtensionContext and convert the context using sendable
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_sendable_3200', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_sendable_3200]: start");
      await Utils.sleep(500);
      try {
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        let displayContext = UIServiceExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIServiceExtensionContext_sendable_3200]: UIServiceExtensionContext" +
        JSON.stringify(displayContext));
        let result = sendableContext(displayContext);
        expect(true).assertEqual(result);
      } catch (err) {
        console.error("[UIServiceExtensionContext_sendable_3200]: " + err);
      }
      console.log("[UIServiceExtensionContext_sendable_3200]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_getRdbStore_3300
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_getRdbStore_3300
     * @tc.desc: UIServiceExtensionContext creates a display Context and passes it as a parameter to RdbStore
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_getRdbStore_3300', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_getRdbStore_3300]: start");
      await Utils.sleep(500);
      try {
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        let displayContext = UIServiceExtensionContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIServiceExtensionContext_getRdbStore_3300]: UIServiceExtensionContext" +
        JSON.stringify(displayContext));
        await getRdbStore(displayContext).then((data: relationalStore.RdbStore) => {
          console.log("[UIServiceExtensionContext_getRdbStore_3300]: store: " + data + JSON.stringify(data));
          expect("{}").assertEqual(JSON.stringify(data));
        })
      } catch (err) {
        console.error("[UIServiceExtensionContext_getRdbStore_3300]: " + err);
      }
      console.log("[UIServiceExtensionContext_getRdbStore_3300]: end");
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_nullAndUndefinedDisplay_3400
     * @tc.name: SUB_Ability_AbilityRuntime_UIServiceExtensionContext_nullAndUndefinedDisplay_3400
     * @tc.desc: The parameter for creating a display context using UIService ExtensionContext is passed as null/undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('UIServiceExtensionContext_nullAndUndefinedDisplay_3400', 0, async (done: Function) => {
      console.log("[UIServiceExtensionContext_nullAndUndefinedDisplay_3400]: start")
      await Utils.sleep(500);
      try {
        let UIServiceExtensionContext = globalThis.UIContext as common.UIServiceExtensionContext;
        let errCode: number = -1;
        try {
          let displayContext = UIServiceExtensionContext.createDisplayContext(null);
          console.log("[UIServiceExtensionContext_nullAndUndefinedDisplay_3400]: UIServiceExtensionContext" +
          JSON.stringify(displayContext));
        } catch (err) {
          let code = (err as BusinessError).code;
          errCode = code;
        }
        expect(401).assertEqual(errCode);
      } catch (err) {
        console.error("[UIServiceExtensionContext_nullAndUndefinedDisplay_3400]: " + err);
      }
      console.log("[UIServiceExtensionContext_nullAndUndefinedDisplay_3400]: end");
      done();
    })

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIAbilityContext_createModuleResourceManagerTest_3500
    * @tc.name: SUB_Ability_AbilityRuntime_UIAbilityContext_createModuleResourceManagerTest_3500
    * @tc.desc: Create resource management object through displayContext to obtain screen density and screen orientation
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level Level 1
    */
    it('UIAbilityContext_createModuleResourceManagerTest_3500', 0, async (done: Function) => {
      console.log("[UIAbilityContext_createModuleResourceManagerTest_3500]: start");
      await Utils.sleep(500);
      try {
        let uiAbilityContext = globalThis.UIContext as common.UIAbilityContext;
        let displayContext = uiAbilityContext.createDisplayContext(allDisplayId[0]);
        console.log("[UIAbilityContext_createModuleResourceManagerTest_3500]: uiAbilityContext" +
          JSON.stringify(displayContext));
        let screenDisplayInfo: boolean = await createModuleResourceManagerTest(displayContext);
        console.log("[UIAbilityContext_createModuleResourceManagerTest_3500]: screenDisplayInfo" + screenDisplayInfo);
        expect(true).assertEqual(screenDisplayInfo);
      } catch (err) {
        console.error("[UIAbilityContext_createModuleResourceManagerTest_3500]: " + err);
      }
      console.log("[UIAbilityContext_createModuleResourceManagerTest_3500]: end");
      done();
    })

  })
}

export function sendableContext(context: Context): boolean | undefined {
  let dataPreferences: preferences.Preferences;
  let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
  let contextAfter: common.Context = sendableContextManager.convertToContext(sendableContext);
  hilog.info(0x0000, 'sendableContext', 'Ability context after convert: %{public}s', JSON.stringify(context));
  let options: preferences.Options = { name: 'myStore' };
  dataPreferences = preferences.getPreferencesSync(contextAfter, options);
  hilog.info(0x0000, 'sendableContext', 'getPreferencesSync success: %{public}s', JSON.stringify(dataPreferences));
  if (dataPreferences != undefined) {
    return true
  } else {
    return;
  }
}

export async function getRdbStore(context: Context): Promise<relationalStore.RdbStore> {
  let store: relationalStore.RdbStore | undefined = undefined;
  const STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'RdbTest.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };
  store = await relationalStore.getRdbStore(context, STORE_CONFIG);
  return store;
}

export function createModuleContextTest(displayContext: Context): Promise<boolean> {
  let UIAbilityContext = getContext() as common.UIAbilityContext;
  return new Promise((resolve, reject) => {
    displayContext.createModuleContext("entry")
      .resourceManager
      .getConfiguration((error: BusinessError, value: resourceManager.Configuration) => {
        if (error != null) {
          console.error("getConfiguration callback error is " + error);
          resolve(false);
        } else {
          const direction_display = value.direction;
          const screenDensity_display = value.screenDensity;
          const innerPromise: Promise<boolean> = new Promise((innerResolve, innerReject) => {
            UIAbilityContext.createModuleContext("entry")
              .resourceManager
              .getConfiguration((error: BusinessError, value: resourceManager.Configuration) => {
                if (error != null) {
                  console.error("getConfiguration callback error is " + error);
                  innerReject(error);
                } else {
                  const direction_UI = value.direction;
                  const screenDensity_UI = value.screenDensity;
                  hilog.info(DOMAIN_NUMBER, TAG,
                    'displayContext | direction_UI: %{public}s | screenDensity_UI: %{public}s',
                    JSON.stringify(direction_UI), JSON.stringify(screenDensity_UI));
                  hilog.info(DOMAIN_NUMBER, TAG, 'displayContext | direction: %{public}s | screenDensity: %{public}s',
                    JSON.stringify(direction_display), JSON.stringify(screenDensity_display));
                  if ("" + direction_display == "" + direction_UI &&
                    "" + screenDensity_display == "" + screenDensity_UI) {
                    innerResolve(true);
                  } else {
                    innerResolve(false);
                  }
                }
              });
          });
          innerPromise.then((result) => {
            resolve(result);
          }).catch((error: BusinessError) => {
            console.error("Inner async error: ", error);
            resolve(false);
          });
        }
      });
  });
}

export async function resourceManagerTest(displayContext: Context): Promise<boolean> {
  let result: boolean = true;
  await displayContext.resourceManager.getString($r('app.string.ServiceExtAbility_label').id)
    .then((data) => {
      result &&= (data === 'label');
      console.log(`DisplayContextTest resourceManager.getString, data: ${data}, result: ${result}`);
    }).catch((error: Error) => {
      console.error("DisplayContextTest resourceManager.getString fail" + error.name + error.message);
    })
  await displayContext.resourceManager.getStringValue($r('app.string.ServiceExtAbility_label'))
    .then((data) => {
      result &&= (data === 'label');
      console.log(`DisplayContextTest resourceManager.getStringValue, data: ${data}, result: ${result}`);
    }).catch((error: Error) => {
      console.error("DisplayContextTest resourceManager.getString fail" + error.name + error.message);
    })
  await displayContext.resourceManager.getMedia($r('app.media.background').id)
    .then((data) => {
      result &&= (data.length > 0);
      console.log(`DisplayContextTest resourceManager.getMedia, data: ${data}, result: ${result}`);
    }).catch((error: Error) => {
      console.error("DisplayContextTest resourceManager.getString fail" + error.name + error.message);
    })
  await displayContext.resourceManager.getMediaContent($r('app.media.background'))
    .then((data) => {
      result &&= (data.length > 0);
      console.log(`DisplayContextTest resourceManager.getMediaContent, data: ${data}, result: ${result}`);
    }).catch((error: Error) => {
      console.error("DisplayContextTest resourceManager.getString fail" + error.name + error.message);
    })
  await displayContext.resourceManager.getColor($r('app.color.start_window_background').id)
    .then((data) => {
      result &&= (data > 0);
      console.log(`DisplayContextTest resourceManager.getColor(resId), data: ${data}, result: ${result}`);
    }).catch((error: Error) => {
      console.error("DisplayContextTest resourceManager.getString fail" + error.name + error.message);
    })
  await displayContext.resourceManager.getColor($r('app.color.start_window_background'))
    .then((data) => {
      result &&= (data > 0);
      console.log(`DisplayContextTest resourceManager.getColor(res), data: ${data}, result: ${result}`);
    }).catch((error: Error) => {
      console.error("DisplayContextTest resourceManager.getString fail" + error.name + error.message);
    })
  console.log(`DisplayContextTest resourceManagerTest end, result: ${result}`);
  return result;
}

async function getDisplayIDs(): Promise<Array<number>> {
  return new Promise((resolve) => {
    let displayInfoArray: Array<display.Display> = [];
    let displayIds: Array<number> = [];

    display.getAllDisplays((err: BusinessError, data: Array<display.Display>) => {
      displayInfoArray = data;
      const errCode: number = err.code;

      if (errCode) {
        hilog.error(DOMAIN_NUMBER, TAG, 'Failed to obtain all the display objects. error: %{public}s',
          JSON.stringify(err));
      }

      hilog.info(DOMAIN_NUMBER, TAG, 'display objects: %{public}s', JSON.stringify(displayInfoArray));

      for (let displayInfo of displayInfoArray) {
        displayIds.push(displayInfo.id);
        hilog.info(DOMAIN_NUMBER, TAG, 'displayId: %{public}s', JSON.stringify(displayInfo.id));
      }
      setTimeout(() => {
        resolve(displayIds);
      }, 1000);
    });
  });
}

export function createModuleResourceManagerTest(displayContext: Context): Promise<boolean> {
  return new Promise((resolve, reject) => {
    displayContext.createModuleResourceManager('com.acts.createdisplaycontext', 'entry')
      .getConfiguration((error: BusinessError, value: resourceManager.Configuration) => {
        if (error != null) {
          console.error("getConfiguration callback error is " + error);
          resolve(false);
        } else {
          const direction_createModuleResourceManager = value.direction;
          const screenDensity_createModuleResourceManager = value.screenDensity;
          const innerPromise: Promise<boolean> = new Promise((innerResolve, innerReject) => {
            displayContext.resourceManager
              .getConfiguration((error: BusinessError, value: resourceManager.Configuration) => {
                if (error != null) {
                  console.error("getConfiguration callback error is " + error);
                  innerReject(error);
                } else {
                  const direction_display = value.direction;
                  const screenDensity_display = value.screenDensity;
                  hilog.info(DOMAIN_NUMBER, TAG,
                    'displayContext | direction_display: %{public}s | screenDensity_display: %{public}s',
                    JSON.stringify(direction_display), JSON.stringify(screenDensity_display));
                  hilog.info(DOMAIN_NUMBER, TAG, 'displayContext | direction_createModuleResourceManager: %{public}s | ' +
                    'screenDensity_createModuleResourceManager: %{public}s',
                    JSON.stringify(direction_createModuleResourceManager),
                    JSON.stringify(screenDensity_createModuleResourceManager));
                  if ("" + direction_createModuleResourceManager == "" + direction_display &&
                    "" + screenDensity_createModuleResourceManager == "" + screenDensity_display) {
                    innerResolve(true);
                  } else {
                    innerResolve(false);
                  }
                }
              });
          });
          innerPromise.then((result) => {
            resolve(result);
          }).catch((error: BusinessError) => {
            console.error("Inner async error: ", error);
            resolve(false);
          });
        }
      });
  });
}

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time);
  });
}