/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import bundle from '@ohos.bundle'
import pkg from '@system.package'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const NUM_TWO = 2;
const NUM_FOUR = 4;
const ERR_CODE = 202;
const ERR_MERSSAGE = 'value is not an available number';
const BUNDLE_NAME1 = 'com.ohos.launcher';
const BUNDLE_NAME2 = 'com.example.third2';
const BUNDLE_NAME3 = 'com.example.third5';
const BUNDLE_NAME4 = 'com.example.js';
const BUNDLE_NAME5 = 'com.example.c';
const ABILITIY_NAME1 = 'com.example.third2.MainAbility';
const ABILITIY_NAME2 = 'com.example.third5.AMainAbility';
const ABILITIY_NAME3 = 'com.example.third5.BMainAbility';
const ABILITIY_NAME4 = 'com.example.js.MainAbility';
const ABILITIY_NAME5 = '.MainAbility';
const ABILITIY_NAME6 = "com.example.third2.MainAbilityA";
const ABILITIY_NAME7 = "com.example.third5.MainAbilityA";
const ABILITIY_NAME8 = "com.example.third5.MainAbilityB";
const BUNDLE_PATH1 = ['/data/test/bmsThirdBundleTest2.hap'];
const BUNDLE_PATH2 = ['/data/test/bmsThirdBundleTest5.hap'];
const BUNDLE_PATH3 = ['/data/test/bmsThirdBundleJs.hap'];
const BUNDLE_PATH4 = ['/data/test/bmsThirdBundleC.hap'];
let installParam = {
    userId: 100,
    installFlag: 1,
    isKeepData: false
};

describe('ActsBmsJsTest', function () {

    /*
    * @tc.number: bms_getJsAbility_0100
    * @tc.name: test the multi js ability
    * @tc.desc: 1.install a js hap which has an ability with full domain name
    *           2.check the ability name by the interface of getBundleInfo
    */
    it('bms_getJsAbility_0100', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH1, installParam, onReceiveInstallEvent);
        async function onReceiveInstallEvent(err, data) {
            checkInstallOrUninstall(err, data);
            let result = await bundle.getBundleInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            expect(result.abilityInfos.length).assertEqual(NUM_TWO);
            if (result.abilityInfos.length == NUM_TWO) {
                let abilityInfo1 = result.abilityInfos[0];
                let abilityInfo2 = result.abilityInfos[1];
                expect(abilityInfo1.name).assertEqual(ABILITIY_NAME1);
                expect(abilityInfo2.name).assertEqual(ABILITIY_NAME6);
                expect(abilityInfo1.srcLanguage).assertEqual('js');
                expect(abilityInfo1.srcPath).assertEqual('');
                expect(abilityInfo1.label).assertEqual("$string:app_name");
                expect(abilityInfo1.description).assertEqual("$string:mainability_description");
                expect(abilityInfo1.icon).assertEqual("$media:icon");
                expect(abilityInfo1.isVisible).assertEqual(true);
                expect(abilityInfo1.permissions.length).assertEqual(0);
                expect(abilityInfo1.deviceTypes[0]).assertEqual('phone');
                expect(abilityInfo1.process).assertEqual("");
                expect(abilityInfo1.uri).assertEqual("");
                expect(abilityInfo1.bundleName).assertEqual(BUNDLE_NAME2);
                expect(abilityInfo1.moduleName).assertEqual("entry");
                expect(Object.keys(abilityInfo1.applicationInfo).length).assertLarger(0);
                expect(abilityInfo1.type).assertEqual(1);
                expect(abilityInfo2.type).assertEqual(2);
                expect(abilityInfo1.orientation).assertEqual(0);
                expect(abilityInfo1.launchMode).assertEqual(1);
                expect(abilityInfo1.backgroundModes).assertEqual(0);
                expect(abilityInfo2.backgroundModes).assertEqual(510);
                expect(abilityInfo1.descriptionId).assertLarger(0);
                expect(abilityInfo1.formEnabled).assertEqual(false);
                expect(abilityInfo1.iconId).assertLarger(0);
                expect(abilityInfo1.labelId).assertLarger(0);
                expect(abilityInfo1.subType).assertEqual(0);
                expect(abilityInfo1.readPermission).assertEqual("");
                expect(abilityInfo1.writePermission).assertEqual("");
                expect(abilityInfo1.targetAbility).assertEqual("");
                expect(abilityInfo1.theme).assertEqual("");
                expect(abilityInfo1.metaData.length).assertEqual(0);
                expect(abilityInfo1.metadata.length).assertEqual(0);
                expect(abilityInfo1.enabled).assertEqual(true);
            }
            installer.uninstall(BUNDLE_NAME2, installParam, (err, data) => {
                checkInstallOrUninstall(err, data);
                done();
            });
        }
    });

    /*
     * @tc.number: bms_getJsAbility_0200
     * @tc.name: test the multi js ability
     * @tc.desc: 1.install a js hap with two ability
     *           2.check the ability name by the interface of getBundleInfo
     */
    it('bms_getJsAbility_0200', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH2, installParam, onReceiveInstallEvent);
        async function onReceiveInstallEvent(err, data) {
            checkInstallOrUninstall(err, data);
            let result = await bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            expect(result.abilityInfos.length).assertEqual(NUM_FOUR);
            if (result.abilityInfos.length == NUM_FOUR) {
                let abilityInfo1 = result.abilityInfos[0];
                let abilityInfo2 = result.abilityInfos[1];
                let abilityInfo3 = result.abilityInfos[2];
                let abilityInfo4 = result.abilityInfos[3];
                checkAbilityInfos(abilityInfo1);
                expect(abilityInfo2.metaData.length).assertEqual(1);
                expect(abilityInfo2.metaData[0].name).assertEqual("Data5B");
                expect(abilityInfo2.metaData[0].value).assertEqual("float");
                expect(abilityInfo2.metaData[0].extra).assertEqual("$string:mainability_description");
                expect(abilityInfo2.name).assertEqual(ABILITIY_NAME3);
                expect(abilityInfo3.name).assertEqual(ABILITIY_NAME7);
                expect(abilityInfo4.name).assertEqual(ABILITIY_NAME8);
                expect(abilityInfo3.type).assertEqual(2);
                expect(abilityInfo4.type).assertEqual(2);
                expect(abilityInfo3.backgroundModes).assertEqual(511);
                expect(abilityInfo4.backgroundModes).assertEqual(129);
            }
            installer.uninstall(BUNDLE_NAME3, installParam, (err, data) => {
                checkInstallOrUninstall(err, data);
                done();
            });
        }
    });

    /*
     * @tc.number: bms_getJsAbility_0300
     * @tc.name: test the multi js ability
     * @tc.desc: 1.install a js hap which has an ability with short domain name
     *           2.check the ability name by the interface of getBundleInfo
     */
    it('bms_getJsAbility_0300', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH3, installParam, onReceiveInstallEvent);
        async function onReceiveInstallEvent(err, data) {
            checkInstallOrUninstall(err, data);
            let result = await bundle.getBundleInfo(BUNDLE_NAME4, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            expect(result.abilityInfos.length).assertEqual(1);
            if (result.abilityInfos.length == 1) {
                let abilityInfo1 = result.abilityInfos[0];
                expect(abilityInfo1.name).assertEqual(ABILITIY_NAME4);
                expect(abilityInfo1.srcLanguage).assertEqual('js');
                expect(abilityInfo1.srcPath).assertEqual('default');
                expect(abilityInfo1.label).assertEqual("$string:app_name");
                expect(abilityInfo1.description).assertEqual("$string:mainability_description");
                expect(abilityInfo1.icon).assertEqual("$media:icon");
                expect(abilityInfo1.isVisible).assertEqual(true);
                expect(abilityInfo1.permissions.length).assertEqual(0);
                expect(abilityInfo1.deviceTypes[0]).assertEqual('phone');
                expect(abilityInfo1.process).assertEqual("");
                expect(abilityInfo1.uri).assertEqual("");
                expect(abilityInfo1.bundleName).assertEqual(BUNDLE_NAME4);
                expect(abilityInfo1.moduleName).assertEqual("entry");
                expect(Object.keys(abilityInfo1.applicationInfo).length).assertLarger(0);
                expect(abilityInfo1.type).assertEqual(1);
                expect(abilityInfo1.orientation).assertEqual(0);
                expect(abilityInfo1.launchMode).assertEqual(1);
                expect(abilityInfo1.backgroundModes).assertEqual(0);
                expect(abilityInfo1.descriptionId).assertLarger(0);
                expect(abilityInfo1.formEnabled).assertEqual(false);
                expect(abilityInfo1.iconId).assertLarger(0);
                expect(abilityInfo1.labelId).assertLarger(0);
                expect(abilityInfo1.subType).assertEqual(0);
                expect(abilityInfo1.readPermission).assertEqual("");
                expect(abilityInfo1.writePermission).assertEqual("");
                expect(abilityInfo1.targetAbility).assertEqual("");
                expect(abilityInfo1.theme).assertEqual("");
                expect(abilityInfo1.metaData.length).assertEqual(0);
                expect(abilityInfo1.metadata.length).assertEqual(0);
                expect(abilityInfo1.enabled).assertEqual(true);
            }
            installer.uninstall(BUNDLE_NAME4, installParam, (err, data) => {
                checkInstallOrUninstall(err, data);
                done();
            });
        }
    });

    /*
    * @tc.number: bms_getJsAbility_0400
    * @tc.name: test the multi js ability
    * @tc.desc: 1.install a c++ hap which has an ability with short domain name
    *           2.check the ability name by the interface of getBundleInfo
    */
    it('bms_getJsAbility_0400', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH4, installParam, onReceiveInstallEvent);
        async function onReceiveInstallEvent(err, data) {
            checkInstallOrUninstall(err, data);
            let result = await bundle.getBundleInfo(BUNDLE_NAME5, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            expect(result.abilityInfos.length).assertEqual(1);
            if (result.abilityInfos.length == 1) {
                let abilityInfo1 = result.abilityInfos[0];
                expect(abilityInfo1.name).assertEqual(ABILITIY_NAME5);
                expect(abilityInfo1.srcLanguage).assertEqual('c++');
                expect(abilityInfo1.srcPath).assertEqual('default/c++/');
                expect(abilityInfo1.label).assertEqual("$string:app_name");
                expect(abilityInfo1.description).assertEqual("$string:mainability_description");
                expect(abilityInfo1.icon).assertEqual("$media:icon");
                expect(abilityInfo1.isVisible).assertEqual(true);
                expect(abilityInfo1.permissions.length).assertEqual(0);
                expect(abilityInfo1.deviceTypes[0]).assertEqual('phone');
                expect(abilityInfo1.process).assertEqual("");
                expect(abilityInfo1.uri).assertEqual("");
                expect(abilityInfo1.bundleName).assertEqual(BUNDLE_NAME5);
                expect(abilityInfo1.moduleName).assertEqual("entry");
                expect(Object.keys(abilityInfo1.applicationInfo).length).assertLarger(0);
                expect(abilityInfo1.type).assertEqual(1);
                expect(abilityInfo1.orientation).assertEqual(0);
                expect(abilityInfo1.launchMode).assertEqual(1);
                expect(abilityInfo1.backgroundModes).assertEqual(0);
                expect(abilityInfo1.descriptionId).assertLarger(0);
                expect(abilityInfo1.formEnabled).assertEqual(false);
                expect(abilityInfo1.iconId).assertLarger(0);
                expect(abilityInfo1.labelId).assertLarger(0);
                expect(abilityInfo1.subType).assertEqual(0);
                expect(abilityInfo1.readPermission).assertEqual("");
                expect(abilityInfo1.writePermission).assertEqual("");
                expect(abilityInfo1.targetAbility).assertEqual("");
                expect(abilityInfo1.theme).assertEqual("");
                expect(abilityInfo1.metaData.length).assertEqual(0);
                expect(abilityInfo1.metadata.length).assertEqual(0);
                expect(abilityInfo1.enabled).assertEqual(true);
            }
            installer.uninstall(BUNDLE_NAME5, installParam, (err, data) => {
                checkInstallOrUninstall(err, data);
                done();
            });
        }
    });

    /**
     * @tc.number getNameForUid_0100
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with hap.
     */
    it('getNameForUid_0100', 0, async function (done) {
        await bundle.getBundleInfo(BUNDLE_NAME1).then(dataInfo => {
            bundle.getNameForUid(dataInfo.uid).then(data => {
                expect(data).assertEqual(BUNDLE_NAME1)
                done();
            })
        })
            .catch(err => {
                console.info("getNameForUid fail:" + JSON.stringify(err))
                expect(err).assertFail()
                done();
            });
    });

    /**
     * @tc.number getNameForUid_0200
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with hap.
     */
    it('getNameForUid_0200', 0, async function (done) {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME1);
        let data = await bundle.getNameForUid(dataInfo.uid);
        expect(data).assertEqual(BUNDLE_NAME1);
        done();
    });

    /**
     * @tc.number hasInstalled_0100
     * @tc.name Package::hasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('hasInstalled_0100', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'com.ohos.launcher',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertTrue();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect().assertFail();
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                expect().assertFail();
            }
        });
        done();
    });

    /**
     * @tc.number hasInstalled_0200
     * @tc.name Package::hasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('hasInstalled_0200', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'wrongName',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertFalse();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect().assertFail();
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                expect().assertFail();
            }
        });
        done();
    });

    /**
     * @tc.number hasInstalled_0300
     * @tc.name Package::hasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('hasInstalled_0300', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'wrongName',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertFalse();
            }
        });
        done();
    });

    /**
     * @tc.number hasInstalled_0400
     * @tc.name Package::hasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('hasInstalled_0400', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: NUM_TWO,
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect().assertFail();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect(data).assertEqual(ERR_MERSSAGE);
                expect(code).assertEqual(ERR_CODE);
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
            }
        });
        done();
    });

    function checkAbilityInfos(info) {
        expect(info.name).assertEqual(ABILITIY_NAME2);
        expect(info.srcLanguage).assertEqual('js');
        expect(info.srcPath).assertEqual('');
        expect(info.label).assertEqual("$string:app_name");
        expect(info.description).assertEqual("$string:mainability_description");
        expect(info.icon).assertEqual("$media:icon");
        expect(info.isVisible).assertEqual(true);
        expect(info.permissions.length).assertEqual(0);
        expect(info.deviceTypes[0]).assertEqual('phone');
        expect(info.process).assertEqual("");
        expect(info.uri).assertEqual("");
        expect(info.bundleName).assertEqual(BUNDLE_NAME3);
        expect(info.moduleName).assertEqual("entry");
        expect(Object.keys(info.applicationInfo).length).assertLarger(0);
        expect(info.type).assertEqual(1);
        expect(info.orientation).assertEqual(0);
        expect(info.launchMode).assertEqual(1);
        expect(info.backgroundModes).assertEqual(0);
        expect(info.descriptionId).assertLarger(0);
        expect(info.formEnabled).assertEqual(false);
        expect(info.iconId).assertLarger(0);
        expect(info.labelId).assertLarger(0);
        expect(info.subType).assertEqual(0);
        expect(info.readPermission).assertEqual("");
        expect(info.writePermission).assertEqual("");
        expect(info.targetAbility).assertEqual("");
        expect(info.theme).assertEqual("");
        expect(info.metaData.length).assertEqual(1);
        expect(info.metaData[0].name).assertEqual("Data5A");
        expect(info.metaData[0].value).assertEqual("float");
        expect(info.metaData[0].extra).assertEqual("$string:mainability_description");
        expect(info.enabled).assertEqual(true);
    }

    function checkInstallOrUninstall(err, data) {
        expect(err.code).assertEqual(0);
        expect(data.status).assertEqual(0);
        expect(data.statusMessage).assertEqual('SUCCESS');
    }
})