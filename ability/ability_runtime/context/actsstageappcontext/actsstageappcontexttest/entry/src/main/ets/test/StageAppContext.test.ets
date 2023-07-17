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

import { describe, it, expect, beforeAll } from '@ohos/hypium'

let TAG;

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
          })
          done();
      });
    })
}