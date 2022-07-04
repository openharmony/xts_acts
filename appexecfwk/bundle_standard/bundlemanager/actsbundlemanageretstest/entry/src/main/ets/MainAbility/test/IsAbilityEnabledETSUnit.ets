/**
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
import { describe, it, expect } from 'deccjsunit/index';
import Utils from './Utils';
import Bundle from '@ohos.bundle';

const BUNDLE_NAME = 'com.open.harmony.packagemag';
const BUNDLE_NAME_ERROR = 'com.ohos.acepackage.error';
const ABILITY_NAME = 'com.open.harmony.packagemag.MainAbility';
const ABILITY_NAME_ERROR = 'com.ohos.acepackage.error.MainAbility';

export default function isAbilityEnabledETSUnit() {

    describe('isAbilityEnabled_test', function () {

        /*
         * @tc.number: isAbilityEnabled_test_0100
         * @tc.name: isAbilityEnabled : Get whether to enable a specified ability
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it('isAbilityEnabled_test_0100', 0, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(BUNDLE_NAME,ABILITY_NAME);
            let timeOldStamp = await Utils.getNowTime();
            let mData;
            await Bundle.isAbilityEnabled(abilityInfo).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[isAbilityEnabled_test_0100]', timeOldStamp, timeNewStamp);
                mData = data;
                console.info('[isAbilityEnabled_test_0100]  promise data is: ' + JSON.stringify(data));
            }).catch((error) => {
                console.info('[isAbilityEnabled_test_0100]  promise error is: ' + error);
                expect(error).assertFail();
            });
            getAbilityEnabledTrue('[isAbilityEnabled_test_0100]', mData);
            done();
        });

        /*
         * @tc.number: isAbilityEnabled_test_0200
         * @tc.name: isAbilityEnabled : Get whether to enable a specified ability
         * @tc.desc: Check the return value of the interface (by callback)
         * @tc.level   0
         */
        it('isAbilityEnabled_test_0200', 0, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(BUNDLE_NAME,ABILITY_NAME);
            let timeOldStamp = await Utils.getNowTime();
            let mData;
            Bundle.isAbilityEnabled(abilityInfo, (error, data) => {
                if (error) {
                    console.error('[isAbilityEnabled_test_0200]Operation failed. Cause: ' + JSON.stringify(error));
                    expect(error).assertFail();
                }
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[isAbilityEnabled_test_0200]', timeOldStamp, timeNewStamp);
                mData = data;
                console.info('[isAbilityEnabled_test_0200]  callBack data is:' + JSON.stringify(data));
            });
            await Utils.sleep(2000);
            getAbilityEnabledTrue('[isAbilityEnabled_test_0200]', mData);
            done();
        });

        /*
         * @tc.number: isAbilityEnabled_test_0300
         * @tc.name: isAbilityEnabled : Get whether to enable a specified ability
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it('isAbilityEnabled_test_0300', 0, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(BUNDLE_NAME_ERROR,ABILITY_NAME_ERROR);
            let timeOldStamp = await Utils.getNowTime();
            let mData;
            await Bundle.isAbilityEnabled(abilityInfo).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[isAbilityEnabled_test_0300]', timeOldStamp, timeNewStamp);
                mData = data;
                console.info('[isAbilityEnabled_test_0300]  promise data is: ' + JSON.stringify(data));
            }).catch((error) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[isAbilityEnabled_test_0300]', timeOldStamp, timeNewStamp);
                console.info('[isAbilityEnabled_test_0300]  promise error is: ' + error);
                expect(error).assertFail();
            });
            getAbilityEnabledFalse('[isAbilityEnabled_test_0300]', mData);
            done();
        });

        /*
         * @tc.number: isAbilityEnabled_test_0400
         * @tc.name: isAbilityEnabled : Get whether to enable a specified ability
         * @tc.desc: Check the return value of the interface (by callback)
         * @tc.level   0
         */
        it('isAbilityEnabled_test_0400', 0, async function (done) {
            let abilityInfo = generateAbilityInfoForTest(BUNDLE_NAME_ERROR,ABILITY_NAME_ERROR);
            let timeOldStamp = await Utils.getNowTime();
            let mData;
            Bundle.isAbilityEnabled(abilityInfo, (error, data) => {
                if (error) {
                    console.error('[isAbilityEnabled_test_0400]Operation failed. Cause: ' + JSON.stringify(error));
                    expect(error).assertFail();
                }
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[isAbilityEnabled_test_0300]', timeOldStamp, timeNewStamp);
                mData = data;
                console.info('[isAbilityEnabled_test_0400]  callBack data is:' + JSON.stringify(data));
            });
            await Utils.sleep(2000);
            console.info('[isAbilityEnabled_test_0400]  Failure ');
            getAbilityEnabledFalse('[isAbilityEnabled_test_0300]', mData);
            done();
        });


        function getAbilityEnabledSuccess(msg, data) {
            console.log(msg + ' start  ' + JSON.stringify(data));
            expect(typeof (data)).assertEqual('boolean');
        }

        function getAbilityEnabledTrue(msg, data) {
            getAbilityEnabledSuccess(msg, data);
            expect(data).assertEqual(true);
        }

        function getAbilityEnabledFalse(msg, data) {
            getAbilityEnabledSuccess(msg, data);
            expect(data).assertEqual(false);
        }

        function generateAbilityInfoForTest(bundleName, name) {
            let map1 = new Map([
                ["", [{
                    "name": "", "value": "", "extra": ""
                }]]
            ]);

            let abilityInfo = {
                bundleName: bundleName,
                name: name,
                label: "",
                description: "",
                icon: "",
                labelId: 0,
                descriptionId: 0,
                iconId: 0,
                moduleName: "",
                process: "",
                targetAbility: "",
                backgroundModes: 0,
                isVisible: true,
                formEnabled: true,
                type: 0,
                subType: 0,
                orientation: 0,
                launchMode: 0,
                permissions: [],
                deviceTypes: [],
                deviceCapabilities: [],
                readPermission: "",
                writePermission: "",
                applicationInfo: {
                    name: "", description: "", descriptionId: 0, systemApp: true, enabled: true, label: "",
                    labelId: "", icon: "", iconId: "", process: "", supportedModes: 0, moduleSourceDirs: [],
                    permissions: [], moduleInfos: [], entryDir: "", codePath: "", metaData: map1,
                    removable: true, accessTokenId: 0, uid: 0, entityType: ""
                },
                uri: "", metaData: [], enabled: true
            };
            return abilityInfo;
        }

    })

}