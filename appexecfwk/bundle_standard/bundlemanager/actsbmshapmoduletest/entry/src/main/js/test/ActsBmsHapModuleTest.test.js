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

import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const BUNDLE_PATH1 = ['/data/test/bmsMainAbilityFirstScene.hap'];
const BUNDLE_PATH2 = ['/data/test/bmsMainAbilityFirstScene.hap', '/data/test/bmsMainAbilitySecondScene.hap'];
const BUNDLE_PATH3 = ['/data/test/bmsThirdBundleTest2.hap'];
const BUNDLE_PATH4 = ['/data/test/bmsThirdBundleTest5.hap'];
const BUNDLE_PATH5 = ['/data/test/bmsThirdBundleTest1.hap'];
const BUNDLE_PATH6 = ['/data/test/bmsThirdBundleTestA1.hap'];
const BUNDLE_NAME1 = 'com.example.bmsmainabilityfirstscene';
const BUNDLE_NAME2 = 'com.example.third2';
const BUNDLE_NAME3 = 'com.example.third5';
const BUNDLE_NAME4 = 'com.example.third1';
const BUNDLE_NAME5 = 'com.example.system1';
const BUNDLE_NAME6 = "com.example.bmsmainabilitysecondscene";
const FIRSTMAINABILITY = 'com.example.bmsmainabilityfirstscene.MainAbility';
const SECONDMAINABILITY = 'com.example.bmsmainabilitysecondscene.MainAbility';
let installParam = {
    userId: 100,
    installFlag: 1,
    isKeepData: false
};

describe('ActsBmsHapModuleTest', function () {

    /*
     * @tc.number: bms_getHapModuleInfo_0100
     * @tc.name: get hapModuleInfo from one app by getBundleInfo
     * @tc.desc: get the module information of the hap with type of entry
     */
    it('bms_getHapModuleInfo_0100', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH1, installParam, onReceiveInstallEvent);
        function onReceiveInstallEvent(err, data) {
            checkInstallOrUninstall(err, data);
            bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, callback);
            async function callback(err, result) {
                expect(result.hapModuleInfos.length).assertEqual(1);
                if (result.hapModuleInfos.length > 0) {
                    let hapModuleInfo = result.hapModuleInfos[0];
                    expect(hapModuleInfo.name).assertEqual(BUNDLE_NAME1);
                    expect(hapModuleInfo.moduleName).assertEqual('entry');
                    expect(hapModuleInfo.description).assertEqual('');
                    expect(hapModuleInfo.descriptionId).assertEqual(0);
                    expect(hapModuleInfo.iconPath).assertEqual("$media:icon");
                    expect(hapModuleInfo.icon).assertEqual('');
                    expect(hapModuleInfo.label).assertEqual('$string:app_name');
                    expect(hapModuleInfo.labelId).assertEqual(0);
                    expect(hapModuleInfo.iconId).assertEqual(0);
                    expect(hapModuleInfo.backgroundImg).assertEqual("");
                    expect(hapModuleInfo.supportedModes).assertEqual(0);
                    expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                    expect(hapModuleInfo.deviceTypes[0]).assertEqual('phone');
                    expect(hapModuleInfo.mainAbilityName).assertEqual(FIRSTMAINABILITY);
                    expect(hapModuleInfo.mainElementName).assertEqual(FIRSTMAINABILITY);
                    expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                    expect(hapModuleInfo.colorMode).assertEqual(-1);
                    expect(hapModuleInfo.extensionAbilityInfo.length).assertEqual(0);
                    expect(hapModuleInfo.metadata.length).assertEqual(0);
                    expect(hapModuleInfo.installationFree).assertEqual(false);
                }
                installer.uninstall(BUNDLE_NAME1, installParam, (err, data) => {
                    checkInstallOrUninstall(err, data);
                    done();
                });
            }
        }
    });

    /*
     * @tc.number: bms_getHapModuleInfo_0200
     * @tc.name: get hapModuleInfo from two modules by getBundleInfo
     * @tc.desc: get the module information of the hap with type of feature
     */
    it('bms_getHapModuleInfo_0200', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH2, installParam, async (err, data) => {
            checkInstallOrUninstall(err, data);
            bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, async (err, result) => {
                expect(result.hapModuleInfos.length).assertEqual(2);
                if (result.hapModuleInfos.length == 2) {
                    let hapModuleInfo = result.hapModuleInfos[0];
                    let hapModuleInfo1 = result.hapModuleInfos[1];
                    expect(hapModuleInfo.name).assertEqual(BUNDLE_NAME1);
                    expect(hapModuleInfo1.name).assertEqual(BUNDLE_NAME6);
                    expect(hapModuleInfo.moduleName).assertEqual('entry');
                    expect(hapModuleInfo.description).assertEqual('');
                    expect(hapModuleInfo.descriptionId).assertEqual(0);
                    expect(hapModuleInfo.iconPath).assertEqual("$media:icon");
                    expect(hapModuleInfo.icon).assertEqual('');
                    expect(hapModuleInfo.label).assertEqual('$string:app_name');
                    expect(hapModuleInfo.labelId).assertEqual(0);
                    expect(hapModuleInfo.iconId).assertEqual(0);
                    expect(hapModuleInfo.backgroundImg).assertEqual("");
                    expect(hapModuleInfo.supportedModes).assertEqual(0);
                    expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                    expect(hapModuleInfo.deviceTypes[0]).assertEqual('phone');
                    expect(hapModuleInfo.mainAbilityName).assertEqual(FIRSTMAINABILITY);
                    expect(hapModuleInfo.mainElementName).assertEqual(FIRSTMAINABILITY);
                    expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                    expect(hapModuleInfo.colorMode).assertEqual(-1);
                    expect(hapModuleInfo.extensionAbilityInfo.length).assertEqual(0);
                    expect(hapModuleInfo.metadata.length).assertEqual(0);
                    expect(hapModuleInfo.installationFree).assertEqual(false);
                    expect(hapModuleInfo1.name).assertEqual(BUNDLE_NAME6);
                    expect(hapModuleInfo1.moduleName).assertEqual('bmsmainabilitysecondscene');
                    expect(hapModuleInfo1.description).assertEqual('');
                    expect(hapModuleInfo1.descriptionId).assertEqual(0);
                    expect(hapModuleInfo1.iconPath).assertEqual("$media:icon");
                    expect(hapModuleInfo1.icon).assertEqual('');
                    expect(hapModuleInfo1.label).assertEqual('$string:app_name');
                    expect(hapModuleInfo1.labelId).assertEqual(0);
                    expect(hapModuleInfo1.iconId).assertEqual(0);
                    expect(hapModuleInfo1.backgroundImg).assertEqual("");
                    expect(hapModuleInfo1.supportedModes).assertEqual(0);
                    expect(hapModuleInfo1.reqCapabilities.length).assertEqual(0);
                    expect(hapModuleInfo1.deviceTypes[0]).assertEqual('phone');
                    expect(hapModuleInfo1.mainAbilityName).assertEqual(SECONDMAINABILITY);
                    expect(hapModuleInfo1.mainElementName).assertEqual(SECONDMAINABILITY);
                    expect(hapModuleInfo1.abilityInfo.length).assertLarger(0);
                    expect(hapModuleInfo1.colorMode).assertEqual(-1);
                    expect(hapModuleInfo1.extensionAbilityInfo.length).assertEqual(0);
                    expect(hapModuleInfo1.metadata.length).assertEqual(0);
                    expect(hapModuleInfo1.installationFree).assertEqual(false);
                }
                installer.uninstall(BUNDLE_NAME1, installParam, (err, data) => {
                    checkInstallOrUninstall(err, data);
                    done();
                });
            });
        });
    });

    /*
     * @tc.number: bms_getHapModuleInfo_0300
     * @tc.name: get hapModuleInfo one app without mainAbility by getBundleInfo
     * @tc.desc: get the module information of the hap without mainAbility
     */
    it('bms_getHapModuleInfo_0300', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH3, installParam, onReceiveInstallEvent);
        async function onReceiveInstallEvent(err, data) {
            checkInstallOrUninstall(err, data);
            await bundle.getBundleInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(async (result) => {
                expect(result.hapModuleInfos.length).assertEqual(1);
                if (result.hapModuleInfos.length > 0) {
                    let hapModuleInfo = result.hapModuleInfos[0];
                    expect(hapModuleInfo.name).assertEqual(BUNDLE_NAME2);
                    expect(hapModuleInfo.moduleName).assertEqual('entry');
                    expect(hapModuleInfo.description).assertEqual('');
                    expect(hapModuleInfo.descriptionId).assertEqual(0);
                    expect(hapModuleInfo.iconPath).assertEqual("$media:icon");
                    expect(hapModuleInfo.icon).assertEqual('');
                    expect(hapModuleInfo.label).assertEqual('$string:app_name');
                    expect(hapModuleInfo.labelId).assertEqual(0);
                    expect(hapModuleInfo.iconId).assertEqual(0);
                    expect(hapModuleInfo.backgroundImg).assertEqual("");
                    expect(hapModuleInfo.supportedModes).assertEqual(0);
                    expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                    expect(hapModuleInfo.deviceTypes[0]).assertEqual('phone');
                    expect(hapModuleInfo.mainAbilityName).assertEqual("");
                    expect(hapModuleInfo.mainElementName).assertEqual("");
                    expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                    expect(hapModuleInfo.colorMode).assertEqual(-1);
                    expect(hapModuleInfo.extensionAbilityInfo.length).assertEqual(0);
                    expect(hapModuleInfo.metadata.length).assertEqual(0);
                    expect(hapModuleInfo.installationFree).assertEqual(false);
                }
                installer.uninstall(BUNDLE_NAME2, installParam, (err, data) => {
                    checkInstallOrUninstall(err, data);
                    done();
                });
            });
        }
    });

    /*
     * @tc.number: bms_getHapModuleInfo_0400
     * @tc.name: get hapModuleInfo through getBundleInfo, an application that adds mainAbility
     * @tc.desc: get the module information of the hap with the added field mainAbility
     */
    it('bms_getHapModuleInfo_0400', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH4, installParam, (err, data) => {
            checkInstallOrUninstall(err, data);
            bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, async (err, result) => {
                expect(result.hapModuleInfos.length).assertEqual(1);
                if (result.hapModuleInfos.length == 1) {
                    let hapModuleInfo = result.hapModuleInfos[0];
                    expect(hapModuleInfo.name).assertEqual(BUNDLE_NAME3);
                    expect(hapModuleInfo.moduleName).assertEqual('entry');
                    expect(hapModuleInfo.description).assertEqual('');
                    expect(hapModuleInfo.descriptionId).assertEqual(0);
                    expect(hapModuleInfo.iconPath).assertEqual("$media:icon");
                    expect(hapModuleInfo.icon).assertEqual('');
                    expect(hapModuleInfo.label).assertEqual('$string:app_name');
                    expect(hapModuleInfo.labelId).assertEqual(0);
                    expect(hapModuleInfo.iconId).assertEqual(0);
                    expect(hapModuleInfo.backgroundImg).assertEqual("");
                    expect(hapModuleInfo.supportedModes).assertEqual(0);
                    expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                    expect(hapModuleInfo.deviceTypes[0]).assertEqual('phone');
                    expect(hapModuleInfo.mainAbilityName).assertEqual("com.example.third5.AMainAbility");
                    expect(hapModuleInfo.mainElementName).assertEqual("com.example.third5.AMainAbility");
                    expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                    expect(hapModuleInfo.colorMode).assertEqual(-1);
                    expect(hapModuleInfo.extensionAbilityInfo.length).assertEqual(0);
                    expect(hapModuleInfo.metadata.length).assertEqual(0);
                    expect(hapModuleInfo.installationFree).assertEqual(false);
                }
                installer.uninstall(BUNDLE_NAME3, installParam, (err, data) => {
                    checkInstallOrUninstall(err, data);
                    done();
                });
            });
        });
    });

    /*
     * @tc.number: bms_getHapModuleInfo_0500
     * @tc.name: get the hapModuleInfo of the upgraded hap package from an application through getBundleInfo
     * @tc.desc: get the module information of the mainAbility upgrade hap
     */
    it('bms_getHapModuleInfo_0500', 0, async function (done) {
        let installer = await bundle.getBundleInstaller();
        installer.install(BUNDLE_PATH5, installParam, async (err, data) => {
            checkInstallOrUninstall(err, data);
            installer.install(BUNDLE_PATH6, installParam, (err, data) => {
                checkInstallOrUninstall(err, data);
                bundle.getBundleInfo(BUNDLE_NAME4, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, callback);
            })
        });
        function callback(err, result) {
            expect(result.hapModuleInfos.length).assertEqual(1);
            if (result.hapModuleInfos.length == 1) {
                let hapModuleInfo = result.hapModuleInfos[0];
                expect(hapModuleInfo.name).assertEqual("com.example.third1.entry");
                expect(hapModuleInfo.moduleName).assertEqual('entry');
                expect(hapModuleInfo.description).assertEqual('');
                expect(hapModuleInfo.descriptionId).assertEqual(0);
                expect(hapModuleInfo.iconPath).assertEqual("$media:icon");
                expect(hapModuleInfo.icon).assertEqual('');
                expect(hapModuleInfo.label).assertEqual('$string:app_name');
                expect(hapModuleInfo.labelId).assertEqual(0);
                expect(hapModuleInfo.iconId).assertEqual(0);
                expect(hapModuleInfo.backgroundImg).assertEqual("");
                expect(hapModuleInfo.supportedModes).assertEqual(0);
                expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                expect(hapModuleInfo.deviceTypes[0]).assertEqual('phone');
                expect(hapModuleInfo.mainAbilityName).assertEqual("com.example.third1.AMainAbility");
                expect(hapModuleInfo.mainElementName).assertEqual("com.example.third1.AMainAbility");
                expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                expect(hapModuleInfo.colorMode).assertEqual(0);
                expect(hapModuleInfo.extensionAbilityInfo.length).assertEqual(0);
                expect(hapModuleInfo.metadata.length).assertEqual(0);
                expect(hapModuleInfo.installationFree).assertEqual(false);
            }
            installer.uninstall(BUNDLE_NAME4, installParam, (err, data) => {
                checkInstallOrUninstall(err, data);
                done();
            });
        }
    });

    /*
     * @tc.number: bms_getHapModuleInfo_0600
     * @tc.name: get hapModuleInfo from the system through getBundleInfo 
     * @tc.desc: get module information of mainAbility system application 
     */
    it('bms_getHapModuleInfo_0600', 0, async function (done) {
        bundle.getBundleInfo(BUNDLE_NAME5, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, callback);
        function callback(err, data) {
            expect(data.hapModuleInfos.length).assertEqual(1);
            if (data.hapModuleInfos.length == 1) {
                let hapModuleInfo = data.hapModuleInfos[0];
                expect(hapModuleInfo.name).assertEqual(BUNDLE_NAME5);
                expect(hapModuleInfo.moduleName).assertEqual('entry');
                expect(hapModuleInfo.description).assertEqual('');
                expect(hapModuleInfo.descriptionId).assertEqual(0);
                expect(hapModuleInfo.iconPath).assertEqual("$media:icon");
                expect(hapModuleInfo.icon).assertEqual('');
                expect(hapModuleInfo.label).assertEqual('$string:app_name');
                expect(hapModuleInfo.labelId).assertEqual(0);
                expect(hapModuleInfo.iconId).assertEqual(0);
                expect(hapModuleInfo.backgroundImg).assertEqual("");
                expect(hapModuleInfo.supportedModes).assertEqual(0);
                expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                expect(hapModuleInfo.deviceTypes[0]).assertEqual('phone');
                expect(hapModuleInfo.mainAbilityName).assertEqual("com.example.system1.MainAbility");
                expect(hapModuleInfo.mainElementName).assertEqual("com.example.system1.MainAbility");
                expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                expect(hapModuleInfo.colorMode).assertEqual(-1);
                expect(hapModuleInfo.extensionAbilityInfo.length).assertEqual(0);
                expect(hapModuleInfo.metadata.length).assertEqual(0);
                expect(hapModuleInfo.installationFree).assertEqual(false);
            }
            done();
        }
    });

    function checkInstallOrUninstall(err, data) {
        expect(err.code).assertEqual(0);
        expect(data.status).assertEqual(0);
        expect(data.statusMessage).assertEqual('SUCCESS');
    }
})