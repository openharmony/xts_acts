/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
const sleep = async delay => {
    return new Promise((resolve, _) => {
        setTimeout(async () => {
            resolve(0);
        }, delay);
    });
};

export default function stageAppContextTest(abilityContext) {
    describe('ActsStageAppContextTest', function () {

        beforeAll(async (done) => {
            console.log("ActsStageContextPropertiesTest afterAll called");
            await abilityContext.startAbility({
                bundleName: "com.example.stageappcontexttest",
                abilityName: "ServiceAbility",
            }).then((data) => {
                console.log('ActsStageContextPropertiesTest - ServiceAbility: ' + JSON.stringify(data));
            }).catch((err) => {
                console.log("ActsStageContextPropertiesTest - ServiceAbility failed: "
                    + JSON.stringify(err));
                done()
            })

            setTimeout(function () {
                console.log("ActsStageContextPropertiesTest afterAll end");
                done();
            }, 1000);
        })

        afterEach(async (done) => {
            await sleep(2000)
            done()
        })

        /**
          * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_0200
          * @tc.name: Validating the context obtained by the AbilityContext call 
          * getApplicationContext can be obtained using getApplicationContext
          * @tc.desc: Function test
          * @tc.level   0
          */
        it('SUB_AA_OpenHarmony_ApplicationContext_0200', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0200";
            console.log(TAG + " --- start");
            let context = abilityContext.getApplicationContext();
            let result = context.getApplicationContext()
            let getCacheDir = result.cacheDir
            console.log(TAG + 'getCacheDir::' + JSON.stringify(getCacheDir));
            expect(getCacheDir).assertEqual('/data/storage/el2/base/cache')
            done();
        });

        /**
          * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_0300
          * @tc.name: Verify that the AbilityContext call getApplicationContext 
          * gets the context using resourceManger
          * @tc.desc: Function test
          * @tc.level   3
          */
        it('SUB_AA_OpenHarmony_ApplicationContext_0300', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0300";
            console.log(TAG + " --- start");
            let context = abilityContext.getApplicationContext();
            let result = await context.resourceManager.getString(16777219);
            console.log(TAG + " result = " + JSON.stringify(result));
            expect(result).assertEqual("entry_MainAbility");
            done();
        });

        /**
          * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_0400
          * @tc.name: Verify that the AbilityContext call getApplicationContext 
          * gets the context using applicationInfo
          * @tc.desc: Function test
          * @tc.level   3
          */
        it('SUB_AA_OpenHarmony_ApplicationContext_0400', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0400";
            console.log(TAG + " --- start");
            let context = abilityContext.getApplicationContext();
            let result = context.applicationInfo.name;
            console.log(TAG + " result = " + JSON.stringify(result));
            expect(result).assertEqual("com.example.stageappcontexttest");
            done();
        });


        /**
          * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_0500
          * @tc.name: Validating the context obtained by the AbilityStageContext call 
          * getApplicationContext can be obtained using getApplicationContext
          * @tc.desc: Function test
          * @tc.level   3
          */
        it('SUB_AA_OpenHarmony_ApplicationContext_0500', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0500";
            console.log(TAG + " --- start");
            let context = globalThis.abilityStageContext.getApplicationContext();
            let result = context.getApplicationContext()
            let getCacheDir = result.cacheDir
            console.log(TAG + 'getCacheDir::' + JSON.stringify(getCacheDir));
            expect(getCacheDir).assertEqual('/data/storage/el2/base/cache')
            done();
        });

        /**
          * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_0600
          * @tc.name: Verify that the AbilityStageContext call getApplicationContext 
          * gets the context using applicationInfo
          * @tc.desc: Function test
          * @tc.level   3
          */
        it('SUB_AA_OpenHarmony_ApplicationContext_0600', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0600";
            console.log(TAG + " --- start");
            let context = globalThis.abilityStageContext.getApplicationContext();
            let result = context.applicationInfo.name;
            console.log(TAG + " result = " + JSON.stringify(result));
            expect(result).assertEqual("com.example.stageappcontexttest");
            done();
        });

        /**
          * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_1200
          * @tc.name: Verify that the app-level context calls the interface 
          * getApplicationContext to get the context using getApplicationContext
          * @tc.desc: Function test
          * @tc.level   3
          */
        it('SUB_AA_OpenHarmony_ApplicationContext_1200', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1200";
            console.log(TAG + " --- start");
            let context = abilityContext.getApplicationContext();
            let context2 = context.getApplicationContext();
            let result = context2.getApplicationContext();
            let dir = result.cacheDir;
            console.log(TAG + " dir = " + dir);
            expect(dir).assertEqual("/data/storage/el2/base/cache");
            done();
        });

        /**
          * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_1300
          * @tc.name: Verify that the context obtained by the application-level 
          * context calling interface getApplicationContext can use resourceManger
          * @tc.desc: Function test
          * @tc.level   3
          */
        it('SUB_AA_OpenHarmony_ApplicationContext_1300', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1300";
            console.log(TAG + " --- start");
            let context = abilityContext.getApplicationContext();
            let context2 = context.getApplicationContext();
            let result = await context2.resourceManager.getString(16777219);
            console.log(TAG + " result = " + result);
            expect(result).assertEqual("entry_MainAbility");
            done();
        });

        /**
           * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_1400
           * @tc.name: Verify that the application-level context calling interface 
           * getApplicationContext gets the context using applicationInfo
           * @tc.desc: Function test
           * @tc.level   3
           */
        it('SUB_AA_OpenHarmony_ApplicationContext_1400', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1400";
            console.log(TAG + " --- start");
            let context = abilityContext.getApplicationContext();
            let context2 = context.getApplicationContext();
            let result = context2.applicationInfo.name;
            console.log(TAG + " result = " + result);
            expect(result).assertEqual("com.example.stageappcontexttest");
            done();
        });

        /**
           * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_1500
           * @tc.name: Verify that the context obtained by the app-level context 
           * calling interface getApplicationContext can be obtained using getApplicationContext
           * @tc.desc: Function test
           * @tc.level   3
           */
        it('SUB_AA_OpenHarmony_ApplicationContext_1500', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1500";
            console.log(TAG + " --- start");
            let context = abilityContext.getApplicationContext();
            let context2 = context.getApplicationContext();
            let result = context2.getApplicationContext();
            console.log(TAG + " result = " + JSON.stringify(result));
            expect(result.tempDir).assertEqual("/data/storage/el2/base/temp");
            expect(result.filesDir).assertEqual("/data/storage/el2/base/files");
            expect(result.distributedFilesDir).assertEqual("/data/storage/el2/distributedfiles");
            expect(result.databaseDir).assertEqual("/data/storage/el2/database");
            expect(result.preferencesDir).assertEqual("/data/storage/el2/base/preferences");
            expect(result.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
            done();
        });

        /**
         * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_1600
         * @tc.name: getProcessRunningInformation test 1
         * getProcessRunningInformation test
         * @tc.desc: Function test
         * @tc.level   3
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1600', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1600";
            console.log(TAG + " --- start");
            let context = globalThis.abilityStageContext.getApplicationContext();
            context.getProcessRunningInformation().then((data) => {
                console.log(TAG + " result = " + JSON.stringify(data));
                expect(data[0].processName).assertEqual("com.example.stageappcontexttest");
            })
            done();
        });

        /**
         * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_1700
         * @tc.name: getProcessRunningInformation test 2
         * getProcessRunningInformation test
         * @tc.desc: Function test
         * @tc.level   3
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1700', 0, async function (done) {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1700";
            console.log(TAG + " --- start");
            let context = globalThis.abilityStageContext.getApplicationContext();
            context.getProcessRunningInformation((err, data) => {
                console.log(TAG + " result = " + JSON.stringify(data));
                expect(data[0].processName).assertEqual("com.example.stageappcontexttest");
            })
            done();
        });

        /**
         * @tc.number: SUB_AA_OpenHarmony_ApplicationContext_1800
         * @tc.name: getProcessRunningInformation test 2
         * getProcessRunningInformation test
         * @tc.desc: Function test
         * @tc.level   3
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1800', 0, async function (done) {
          let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1800";
          console.log(TAG + " --- start");
          let context = globalThis.abilityStageContext.getApplicationContext();
          context.getProcessRunningInformation((err, data) => {
              console.log(TAG + " result = " + JSON.stringify(data));
              expect(data[0].processName).assertEqual("com.example.stageappcontexttest");
              expect(typeof data[0].state).assertEqual("number");
          })
          done();
        });

        /**
         * @tc.number: SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0100
         * @tc.name: Verify that the clearUpApplicationData cleaning application data test 1
         * calling interface clearUpApplicationData can be cleaning application data, run entry applicationData use Promise
         * @tc.desc: Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0100', 0, async function (done) {
            let TAG = "SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0100";
            let startType = "Promise";
            console.log(TAG + " --- start");
            let createFileFlag = false;
            let Subscriber;
            let subscriberInfo_startdebugapp = {
                events: ["clearUpApplicationDataEvent"],
            };
            function SubscribeCallBack(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlag = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + "Subscriber create");
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            await sleep(100);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: true
                }
            })
            await sleep(2000);
            console.log(TAG + "create file status " + createFileFlag);
            expect(createFileFlag).assertTrue();
            abilityDelegator.executeShellCommand('aa start -a MainAbility -b com.example.stageappcontexttest')
                .then((data) => {
                    console.log(TAG + "stdResult : open" + JSON.stringify(data));
                })
            await sleep(2000);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            await sleep(2000);
            console.log(TAG + "delete file status" + createFileFlag);
            expect(createFileFlag).assertFalse();
            console.log(TAG + "Close Subscriber");
            commonEventManager.unsubscribe(Subscriber);
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelp')
            done();
        });

        /**
         * @tc.number: SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0200
         * @tc.name: Verify that the clearUpApplicationData cleaning application data test 2
         * calling interface clearUpApplicationData can be cleaning application data, run entry applicationData use Callback
         * @tc.desc: Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0200', 0, async function (done) {
            let TAG = "SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0200";
            let startType = "Callback";
            console.log(TAG + " --- start");
            let createFileFlag = false;
            let Subscriber;
            let subscriberInfo_startdebugapp = {
                events: ["clearUpApplicationDataEvent"],
            };
            function SubscribeCallBack(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlag = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + "Subscriber create");
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            await sleep(100);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: true
                }
            })
            await sleep(2000);
            console.log(TAG + "create file status " + createFileFlag);
            expect(createFileFlag).assertTrue();
            abilityDelegator.executeShellCommand('aa start -a MainAbility -b com.example.stageappcontexttest')
                .then((data) => {
                    console.log(TAG + "stdResult : open" + JSON.stringify(data));
                })
            await sleep(2000);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            await sleep(2000);
            console.log(TAG + "delete file status" + createFileFlag);
            expect(createFileFlag).assertFalse();
            console.log(TAG + "Close Subscriber");
            commonEventManager.unsubscribe(Subscriber);
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelp')
            done();
        });

        /**
         * @tc.number: SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0300
         * @tc.name: Verify that the clearUpApplicationData cleaning application data test 3
         * calling interface clearUpApplicationData can be cleaning application data, run feature applicationData use Promise
         * @tc.desc: Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0300', 0, async function (done) {
            let TAG = "SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0300";
            let startType = "Promise";
            console.log(TAG + " --- start");
            let createFileFlag = false;
            let Subscriber;
            let subscriberInfo_startdebugapp = {
                events: ["clearUpApplicationDataEventFeature"],
            };
            let runNum = 0;
            function SubscribeCallBack(err, data) {
                console.log(TAG + "Subscriber data" + runNum + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlag = data.parameters.result
                }
                runNum += 1;
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + "clearUpApplicationDataEventFeature create");
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            await sleep(100);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbilityFeature",
                parameters: {
                    startType,
                    createFile: true
                }
            })
            await sleep(2000);
            console.log(TAG + "_runNum" + runNum + '||||' + createFileFlag);
            console.log(TAG + "create file status " + createFileFlag);
            expect(createFileFlag).assertTrue();
            abilityDelegator.executeShellCommand('aa start -a MainAbility -b com.example.stageappcontexttest')
                .then((data) => {
                    console.log(TAG + "stdResult : open" + JSON.stringify(data));
                })
            await sleep(2000);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbilityFeature",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            await sleep(2000);
            console.log(TAG + "delete file status" + createFileFlag);
            expect(createFileFlag).assertFalse();
            console.log(TAG + "Close Subscriber");
            commonEventManager.unsubscribe(Subscriber);
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelp')
            done();
        });

        /**
         * @tc.number: SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0400
         * @tc.name: Verify that the clearUpApplicationData cleaning application data test 4
         * calling interface clearUpApplicationData can be cleaning application data, run feature applicationData use Callback
         * @tc.desc: Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0400', 0, async function (done) {
            let TAG = "SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0400";
            let startType = "Callback";
            console.log(TAG + " --- start");
            let createFileFlag = false;
            let Subscriber;
            let subscriberInfo_startdebugapp = {
                events: ["clearUpApplicationDataEventFeature"],
            };
            function SubscribeCallBack(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlag = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + "clearUpApplicationDataEventFeature  create");
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            await sleep(100);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbilityFeature",
                parameters: {
                    startType,
                    createFile: true
                }
            })
            await sleep(2000);
            console.log(TAG + "create file status " + createFileFlag);
            expect(createFileFlag).assertTrue();
            abilityDelegator.executeShellCommand('aa start -a MainAbility -b com.example.stageappcontexttest')
                .then((data) => {
                    console.log(TAG + "stdResult : open" + JSON.stringify(data));
                })
            await sleep(2000);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbilityFeature",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            await sleep(2000);
            console.log(TAG + "delete file status" + createFileFlag);
            expect(createFileFlag).assertFalse();
            console.log(TAG + "Close Subscriber");
            commonEventManager.unsubscribe(Subscriber);
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelp')
            done();
        });

        /**
      * @tc.number: SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0500
      * @tc.name: Verify that the clearUpApplicationData cleaning application data test 5
      * calling interface clearUpApplicationData can be cleaning application data, run system applicationData use Promise
      * @tc.desc: Function test
      * @tc.level   1
      */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0500', 0, async function (done) {
            let TAG = "SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0500";
            let startType = "Promise";
            console.log(TAG + " --- start");
            let createFileFlag = false;
            let Subscriber;
            let subscriberInfo_startdebugapp = {
                events: ["clearUpApplicationDataEventSystem"],
            };
            function SubscribeCallBack(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlag = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + "Subscriber create");
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            await sleep(100);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelpSystem",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: true
                }
            })
            await sleep(2000);
            console.log(TAG + "create file status " + createFileFlag);
            expect(createFileFlag).assertTrue();
            abilityDelegator.executeShellCommand('aa start -a MainAbility -b com.example.stageappcontexttest')
                .then((data) => {
                    console.log(TAG + "stdResult : open" + JSON.stringify(data));
                })
            await sleep(2000);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelpSystem",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            await sleep(2000);
            console.log(TAG + "delete file status" + createFileFlag);
            expect(createFileFlag).assertFalse();
            console.log(TAG + "Close Subscriber");
            commonEventManager.unsubscribe(Subscriber);
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelpSystem')
            done();
        });
        
        /**
         * @tc.number: SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0600
         * @tc.name: Verify that the clearUpApplicationData cleaning application data test 6
         * calling interface clearUpApplicationData can be cleaning application data, run system applicationData use Callback
         * @tc.desc: Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0600', 0, async function (done) {
            let TAG = "SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0600";
            let startType = "Callback";
            console.log(TAG + " --- start");
            let createFileFlag = false;
            let Subscriber;
            let subscriberInfo_startdebugapp = {
                events: ["clearUpApplicationDataEventSystem"],
            };
            function SubscribeCallBack(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlag = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + "Subscriber create");
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            await sleep(100);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelpSystem",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: true
                }
            })
            await sleep(2000);
            console.log(TAG + "create file status " + createFileFlag);
            expect(createFileFlag).assertTrue();
            abilityDelegator.executeShellCommand('aa start -a MainAbility -b com.example.stageappcontexttest')
                .then((data) => {
                    console.log(TAG + "stdResult : open" + JSON.stringify(data));
                })
            await sleep(2000);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelpSystem",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            await sleep(2000);
            console.log(TAG + "delete file status" + createFileFlag);
            expect(createFileFlag).assertFalse();
            console.log(TAG + "Close Subscriber");
            commonEventManager.unsubscribe(Subscriber);
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelpSystem')
            done();
        });

        /**
         * @tc.number: SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0700
         * @tc.name: Verify that the clearUpApplicationData cleaning application data test 7
         * calling interface clearUpApplicationData can be cleaning application data, run applicationDatas use Promise
         * @tc.desc: Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0700', 0, async function (done) {
            let TAG = "SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0700";
            let startType = "Promise";
            console.log(TAG + " --- start");
            let createFileFlag = false;
            let Subscriber;
            let subscriberInfo_startdebugapp = {
                events: ["clearUpApplicationDataEvent"],
            };
            function SubscribeCallBack(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlag = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + "clearUpApplicationDataEvent create");
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            let createFileFlagSys = false;
            let SubscriberSys;
            let subscriberInfo_startdebugappSys = {
                events: ["clearUpApplicationDataEventSystem"],
            };
            function SubscribeCallBackSys(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlagSys = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugappSys).then(async (data) => {
                    console.log(TAG + "clearUpApplicationDataEventSystem create");
                    SubscriberSys = data;
                    await commonEventManager.subscribe(SubscriberSys, SubscribeCallBackSys);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            await sleep(100);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: true,
                    notClear: true
                }
            })
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelpSystem",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: true
                }
            })
            await sleep(2000);
            console.log(TAG + "create file status  createFileFlag" + createFileFlag + "createFileFlagSys" + createFileFlagSys);
            expect(createFileFlag).assertTrue();
            expect(createFileFlagSys).assertTrue();
            abilityDelegator.executeShellCommand('aa start -a MainAbility -b com.example.stageappcontexttest')
                .then((data) => {
                    console.log(TAG + "stdResult : open" + JSON.stringify(data));
                })
            await sleep(2000);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelpSystem",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            await sleep(2000);
            console.log(TAG + "delete file status createFileFlag" + createFileFlag + "createFileFlagSys" + createFileFlagSys);
            expect(createFileFlag).assertTrue();
            expect(createFileFlagSys).assertFalse();
            console.log(TAG + "Close Subscriber");
            commonEventManager.unsubscribe(Subscriber);
            commonEventManager.unsubscribe(SubscriberSys);
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelp')
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelpSystem')
            done();
        });

        /**
         * @tc.number: SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0800
         * @tc.name: Verify that the clearUpApplicationData cleaning application data test 7
         * calling interface clearUpApplicationData can be cleaning application data, run applicationDatas use Callback
         * @tc.desc: Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0800', 0, async function (done) {
            let TAG = "SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0800";
            let startType = "Callback";
            console.log(TAG + " --- start");
            let createFileFlag = false;
            let Subscriber;
            let subscriberInfo_startdebugapp = {
                events: ["clearUpApplicationDataEvent"],
            };
            function SubscribeCallBack(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlag = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + "clearUpApplicationDataEvent create");
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            let createFileFlagSys = false;
            let SubscriberSys;
            let subscriberInfo_startdebugappSys = {
                events: ["clearUpApplicationDataEventSystem"],
            };
            function SubscribeCallBackSys(err, data) {
                console.log(TAG + "Subscriber data" + JSON.stringify(data));
                if (data?.parameters?.result !== undefined) {
                    createFileFlagSys = data.parameters.result
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugappSys).then(async (data) => {
                    console.log(TAG + "clearUpApplicationDataEventSystem create");
                    SubscriberSys = data;
                    await commonEventManager.subscribe(SubscriberSys, SubscribeCallBackSys);
                })
            } catch (error) {
                console.log(TAG + "Subscriber create fail " + JSON.stringify(error));
            }
            await sleep(100);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: true,
                    notClear: true
                }
            })
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelpSystem",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: true
                }
            })
            await sleep(2000);
            console.log(TAG + "create file status  createFileFlag" + createFileFlag + "createFileFlagSys" + createFileFlagSys);
            expect(createFileFlag).assertTrue();
            expect(createFileFlagSys).assertTrue();
            abilityDelegator.executeShellCommand('aa start -a MainAbility -b com.example.stageappcontexttest')
                .then((data) => {
                    console.log(TAG + "stdResult : open" + JSON.stringify(data));
                })
            await sleep(2000);
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelp",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            abilityDelegator.startAbility({
                bundleName: "com.example.clearUpApplicationDataHelpSystem",
                abilityName: "MainAbility",
                parameters: {
                    startType,
                    createFile: false
                }
            })
            await sleep(2000);
            console.log(TAG + "delete file status createFileFlag" + createFileFlag + "createFileFlagSys" + createFileFlagSys);
            expect(createFileFlag).assertTrue();
            expect(createFileFlagSys).assertFalse();
            console.log(TAG + "Close Subscriber");
            commonEventManager.unsubscribe(Subscriber);
            commonEventManager.unsubscribe(SubscriberSys);
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelp')
            await abilityDelegator.executeShellCommand('aa force-stop com.example.clearUpApplicationDataHelpSystem')
            done();
        });

    })
}