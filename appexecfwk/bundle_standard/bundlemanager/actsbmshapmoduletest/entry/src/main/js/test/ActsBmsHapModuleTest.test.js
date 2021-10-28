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

const TIMEOUT = 2000;

describe('ActsBmsHapModuleTest', function () {

    /*
     * @tc.number: bms_getHapModuleInfo_0100
     * @tc.name: get hapModuleInfo from one app by getBundleInfo
     * @tc.desc: get the module information of the hap with type of entry
     */
    it('bms_getHapModuleInfo_0100', 0, async function (done) {
        console.debug('===========begin bms_getHapModuleInfo_0100===========')
        await install(['/data/test/bmsMainAbilityFirstScene.hap']);
        let bundleName = 'com.example.bmsmainabilityfirstscene';
        let ret = false
        bundle.getBundleInfo(bundleName, 1, callback);
        async function callback(err, data) {
            console.debug('=======get bundle========' + JSON.stringify(data));
            expect(data.hapModuleInfo.length).assertEqual(1);
            if (data.hapModuleInfo.length > 0) {
                let hapModuleInfo = data.hapModuleInfo[0];
                console.debug('=======get hapModule========' + JSON.stringify(hapModuleInfo))
                console.debug('=======get hapModule mainAbilityName========' + hapModuleInfo.mainAbilityName)
                expect(hapModuleInfo.moduleName).assertEqual('entry');
                expect(hapModuleInfo.mainAbilityName).assertEqual('com.example.bmsmainabilityfirstscene.MainAbility');
                expect(hapModuleInfo.name).assertEqual('com.example.bmsmainabilityfirstscene');
                expect(hapModuleInfo.description).assertEqual('');
                expect(hapModuleInfo.descriptionId).assertEqual(0);
                expect(hapModuleInfo.icon).assertEqual('');
                expect(hapModuleInfo.label).assertEqual('$string:app_name');
                expect(hapModuleInfo.labelId).assertEqual(0);
                expect(hapModuleInfo.iconId).assertEqual(0);
                expect(hapModuleInfo.backgroundImg).assertEqual('');
                expect(hapModuleInfo.supportedModes).assertEqual(0);
                console.info('===============hapModuleInfo.reqCapabilities==========' + JSON.stringify(hapModuleInfo.reqCapabilities))
                expect(typeof hapModuleInfo.reqCapabilities).assertEqual('object');
                expect(hapModuleInfo.deviceTypes).assertEqual('phone');
                console.info('===============hapModuleInfo.abilityInfo==========' + JSON.stringify(hapModuleInfo.abilityInfo))
                expect(typeof hapModuleInfo.abilityInfo).assertEqual('object');
                expect(hapModuleInfo.moduleName).assertEqual('entry');
                expect(hapModuleInfo.mainAbilityName).assertEqual('com.example.bmsmainabilityfirstscene.MainAbility');
                expect(hapModuleInfo.installationFree).assertEqual(false);
                for (let i = 0, len = hapModuleInfo.reqCapabilities.length; i < len; i++) {
                    console.debug('=======get reqCapabilities========' + JSON.stringify(hapModuleInfo.reqCapabilities[i]));
                    expect(hapModuleInfo.reqCapabilities[i]).assertEqual('');
                }
                for (let j = 0, len = hapModuleInfo.abilityInfo.length; j < len; j++) {
                    console.debug('=======get abilityInfo========' + JSON.stringify(hapModuleInfo.abilityInfo[j]))
                    expect(hapModuleInfo.abilityInfo[j].name).assertEqual('com.example.bmsmainabilityfirstscene.MainAbility');
                }
                ret = true;
            }
            await uninstall(bundleName);
            done();
        }
        setTimeout(function () {
            expect(ret).assertTrue();
        }, TIMEOUT);
    });

    /*
     * @tc.number: bms_getHapModuleInfo_0200
     * @tc.name: get hapModuleInfo from two modules by getBundleInfo
     * @tc.desc: get the module information of the hap with type of feature
     */
    it('bms_getHapModuleInfo_0200', 0, async function (done) {
        console.debug('===========begin bms_getHapModuleInfo_0200===========')
        await install(['/data/test/bmsMainAbilityFirstScene.hap']);
        await install(['/data/test/bmsMainAbilitySecondScene.hap']);
        let ret = false
        let bundleName = 'com.example.bmsmainabilityfirstscene';
        let firstMainAbility = 'com.example.bmsmainabilityfirstscene.MainAbility';
        let secondMainAbility = 'com.example.bmsmainabilitysecondscene.MainAbility';
        bundle.getBundleInfo(bundleName, 1, async (err, data) => {
            console.debug('=======hapModule length========' + data.hapModuleInfo.length);
            expect(data.hapModuleInfo.length).assertEqual(2);
            for (let i = 0, len = data.hapModuleInfo.length; i < len; i++) {
                console.debug('=======get hapModule========' + JSON.stringify(data.hapModuleInfo[i]))
                console.debug('=======get hapModule mainAbilityName========' + data.hapModuleInfo[i].mainAbilityName);
                checkHapModuleInfo(data.hapModuleInfo[i]);
            }
            if (data.hapModuleInfo.length == 2) {
                expect(data.hapModuleInfo[0].mainAbilityName).assertEqual(firstMainAbility);
                expect(data.hapModuleInfo[0].moduleName).assertEqual('entry');
                expect(data.hapModuleInfo[1].mainAbilityName).assertEqual(secondMainAbility);
                expect(data.hapModuleInfo[1].moduleName).assertEqual('bmsmainabilitysecondscene');
            }
            await uninstall(bundleName);
            ret = true;
            done();
        })
        setTimeout(function () {
            expect(ret).assertTrue();
        }, TIMEOUT);
    })

    /*
     * @tc.number: bms_getHapModuleInfo_0300
     * @tc.name: get hapModuleInfo one app without mainAbility by getBundleInfo
     * @tc.desc: get the module information of the hap without mainAbility
     */
    it('bms_getHapModuleInfo_0300', 0, async function (done) {
        console.debug('===========begin bms_getHapModuleInfo_0300===========')
        await install(['/data/test/bmsThirdBundleTest2.hap']);
        let bundleName = 'com.example.third2';
        let ret = false;
        bundle.getBundleInfo(bundleName, 1,).then(async (data) => {
            console.debug('=======get hapModule========' + JSON.stringify(data))
            expect(data.hapModuleInfo.length).assertEqual(1);
            if (data.hapModuleInfo.length > 0) {
                console.debug('=======get hapModule mainAbilityName========' + data.hapModuleInfo[0].mainAbilityName)
                expect(data.hapModuleInfo[0].mainAbilityName).assertEqual('');
                expect(data.hapModuleInfo[0].moduleName).assertEqual('entry');
                checkHapModuleInfo(data.hapModuleInfo[0]);
                ret = true;
            }
            await uninstall(bundleName);
            done();
        })
        setTimeout(function () {
            expect(ret).assertTrue();
        }, TIMEOUT);
    })

    it('bms_getHapModuleInfo_0400', 0, async function (done) {
        console.debug('===========begin bms_getHapModuleInfo_0400===========')
        await install(['/data/test/bmsThirdBundleTest5.hap']);
        let bundleName = 'com.example.third5';
        let ret = true;
        bundle.getBundleInfo(bundleName, 1, async (err, data) => {
            console.debug('=======get hapModule========' + JSON.stringify(data))
            expect(data.hapModuleInfo.length).assertEqual(1);
            if (data.hapModuleInfo.length == 1) {
                console.debug('=======get hapModule mainAbilityName========' + data.hapModuleInfo[0].mainAbilityName)
                expect(data.hapModuleInfo[0].mainAbilityName).assertEqual('com.example.third5.AMainAbility');
                expect(data.hapModuleInfo[0].moduleName).assertEqual('entry');
                checkHapModuleInfo(data.hapModuleInfo[0]);
                ret = true;
            }
            await uninstall(bundleName);
            done();
        })
        setTimeout(function () {
            expect(ret).assertTrue();
        }, TIMEOUT);
    })

    it('bms_getHapModuleInfo_0500', 0, async function (done) {
        console.debug('===========begin bms_getHapModuleInfo_0500===========')
        await install(['/data/test/bmsThirdBundleTest1.hap']);
        await install(['/data/test/bmsThirdBundleTestA1.hap']);
        let bundleName = 'com.example.third1';
        let ret = false
        bundle.getBundleInfo(bundleName, 1, callback);
        async function callback(err, data) {
            console.debug('=======get bundle========' + JSON.stringify(data));
            expect(data.hapModuleInfo.length).assertEqual(1);
            if (data.hapModuleInfo.length == 1) {
                let hapModuleInfo = data.hapModuleInfo[0];
                console.debug('=======get hapModule========' + JSON.stringify(hapModuleInfo))
                console.debug('=======get hapModule mainAbilityName========' + hapModuleInfo.mainAbilityName)
                expect(hapModuleInfo.moduleName).assertEqual('entry');
                expect(hapModuleInfo.mainAbilityName).assertEqual('com.example.third1.AMainAbility');
                checkHapModuleInfo(hapModuleInfo);
            }
            await uninstall(bundleName);
            ret = true;
            done();
        }
        setTimeout(function () {
            expect(ret).assertTrue();
        }, TIMEOUT);
    });

    it('bms_getHapModuleInfo_0600', 0, async function (done) {
        console.debug('===========begin bms_getHapModuleInfo_0600===========')
        let bundleName = 'com.example.system1';
        let ret = false
        bundle.getBundleInfo(bundleName, 1, callback);
        function callback(err, data) {
            console.debug('=======get bundle========' + JSON.stringify(data));
            console.debug('=======data.hapModuleInfo.length========' + data.hapModuleInfo.length);
            expect(data.hapModuleInfo.length).assertEqual(1);
            if (data.hapModuleInfo.length == 1) {
                let hapModuleInfo = data.hapModuleInfo[0];
                console.debug('=======get hapModule========' + JSON.stringify(hapModuleInfo))
                console.debug('=======get hapModule mainAbilityName========' + hapModuleInfo.mainAbilityName)
                expect(hapModuleInfo.moduleName).assertEqual('entry');
                expect(hapModuleInfo.mainAbilityName).assertEqual('com.example.system1.MainAbility');
                checkHapModuleInfo(hapModuleInfo);
                ret = true;
            }
            done();
        }
        setTimeout(function () {
            expect(ret).assertTrue();
        }, TIMEOUT);
    });

    function checkHapModuleInfo(dataInfo) {
        console.debug('========begin check hapModuleInfo========')
        expect(typeof dataInfo.name).assertEqual('string');
        expect(typeof dataInfo.description).assertEqual('string');
        expect(typeof dataInfo.descriptionId).assertEqual('number');
        expect(typeof dataInfo.icon).assertEqual('string');
        expect(typeof dataInfo.label).assertEqual('string');
        expect(typeof dataInfo.labelId).assertEqual('number');
        expect(typeof dataInfo.iconId).assertEqual('number');
        expect(typeof dataInfo.backgroundImg).assertEqual('string');
        expect(typeof dataInfo.supportedModes).assertEqual('number');
        expect(typeof dataInfo.reqCapabilities).assertEqual('object');
        expect(typeof dataInfo.deviceTypes).assertEqual('object');
        expect(typeof dataInfo.abilityInfo).assertEqual('object');
        expect(typeof dataInfo.moduleName).assertEqual('string');
        expect(typeof dataInfo.mainAbilityName).assertEqual('string');
        expect(typeof dataInfo.installationFree).assertEqual('boolean');
    }

    async function install(bundlePath) {
        var installer = await bundle.getBundleInstaller();
        console.log('========install========' + typeof installer);
        installer.install(bundlePath, {
            param: {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }
        }, onReceiveInstallEvent);
        function onReceiveInstallEvent(err, data) {
            console.info('========install Finish========');
            expect(typeof err).assertEqual('object');
            expect(err.code).assertEqual(0);
            expect(typeof data).assertEqual('object');
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
        }
    }

    async function uninstall(bundleName) {
        var installer = await bundle.getBundleInstaller();
        installer.uninstall(bundleName, {
            param: {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }
        }, onReceiveUninstallEvent);

        function onReceiveUninstallEvent(err, data) {
            console.info('========uninstall Finish========');
            expect(typeof err).assertEqual('object');
            expect(err.code).assertEqual(0);
            expect(typeof data).assertEqual('object');
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
        }
    }
})