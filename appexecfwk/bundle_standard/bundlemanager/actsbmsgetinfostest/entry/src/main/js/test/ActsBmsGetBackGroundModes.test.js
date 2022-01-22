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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit'

const BUNDLE_PATH1 = '/data/test/bmsThirdBundleTest1.hap';
const BUNDLE_PATH2 = '/data/test/bmsThirdBundleTest2.hap';
const BUNDLE_PATH3 = '/data/test/bmsThirdBundleTest3.hap';
const BUNDLE_PATH4 = '/data/test/bmsThirdBundleTest4.hap';
const BUNDLE_PATH5 = '/data/test/bmsThirdBundleTest5.hap';
const BUNDLE_PATH6 = '/data/test/bmsThirdBundleTest6.hap';
const BUNDLE_PATHUPDATE = '/data/test/bmsThirdBundleTestA1.hap';
const SYSTEM_PATH = '/data/test/bmsSystemBundleTest2.hap';
const SYSTEM_FEATURE_PATH = '/data/test/bmsSystemBundleTest2Feature.hap';
const SYSTEM_UPDATE_PATH = '/data/test/bmsSystemBundleTest2Update.hap';
const BUNDLE_NAME1 = 'com.example.third1';
const BUNDLE_NAME2 = 'com.example.third2';
const BUNDLE_NAME4 = 'com.example.third4';
const BUNDLE_NAME5 = 'com.example.third5';
const BUNDLE_NAME6 = 'com.example.third6';
const SYSTEM_NAME = 'com.example.system2';
const NUM_ONE = 1;
const NUM_TWO = 2;
const NUM_THREE = 3;
const NUM_FOUR = 4;
const NUM_NINE = 9;
let dataTransfer = 1;
let audioPlayback = 2;
let audioRecording = 4;
let location = 8;
let bluetoothInteraction = 16;
let multiDeviceConnection = 32;
let wifiInteraction = 64;
let voip = 128;
let taskKeeping = 256;

describe('ActsBmsGetBackGroundModes', function () {

    /*
    * @tc.number: bms_backGroundModes_0100
    * @tc.name: Get the backgroundModes information of the application through queryAbilityByWant
    * @tc.desc: Get the information of the background modes from multi-ability application
    */
    it('bms_backGroundModes_0100', 0, async function (done) {
        console.info('=====================bms_backGroundModes_0100==================');
        var bundlePath = [BUNDLE_PATH5]
        var installer = await bundle.getBundleInstaller();
        installer.install(bundlePath, {
            userId: 0,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var dataInfos = await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME5,
                action: 'action.system.home',
                entities: ['entity.system.home'],
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0)
            let queryResult = 0
            for (let infoCount = 0; infoCount < dataInfos.length; infoCount++){
                if(dataInfos[infoCount].name == "com.example.third5.MainAbilityA"){
                    expect(dataInfos[infoCount].backgroundModes).assertEqual(dataTransfer + audioPlayback + audioRecording +
                        location + bluetoothInteraction + multiDeviceConnection + wifiInteraction + voip + taskKeeping);
                    queryResult++
                }
                if(dataInfos[infoCount].name == "com.example.third5.MainAbilityB"){
                    expect(dataInfos[infoCount].backgroundModes).assertEqual(dataTransfer + voip);
                    queryResult++
                }
            }
            expect(queryResult).assertEqual(NUM_TWO);
            installer.uninstall(BUNDLE_NAME5, {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }, (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                done();
            });
        })
    })

    /*
    * @tc.number: bms_backGroundModes_0200
    * @tc.name: Get the backgroundModes information of the application through queryAbilityByWant 
    * @tc.desc: Get all background modes information, and each ability of the application
    *               contains one of the background mode
    */
    it('bms_backGroundModes_0200', 0, async function (done) {
        console.info('=====================bms_backGroundModes_0200==================');
        var bundlePath = [BUNDLE_PATH6]
        var installer = await bundle.getBundleInstaller();
        installer.install(bundlePath, {
            userId: 0,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var dataInfos = await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME6,
                abilityName: '',
                action: 'action.system.home',
                entities: ['entity.system.home']
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0)
            expect(dataInfos.length).assertEqual(NUM_NINE);
            for (let i = 0, len = dataInfos.length; i < len; i++) {
                expect(dataInfos[i].backgroundModes).assertEqual(1 << i);
                console.info("==========dataInfos[i].backgroundModes=========" + dataInfos[i].backgroundModes);
                console.info("==========dataInfos[1].name=========" + dataInfos[i].name);
            }
            installer.uninstall(BUNDLE_NAME6, {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }, (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                done();
            });
        })
    })

    /*
    * @tc.number: bms_backGroundModes_0300
    * @tc.name: Get the backgroundModes information of the application through queryAbilityByWant 
    * @tc.desc: Read the backgroundModes information of the app's ability and replace invalid attributes 
    */
    it('bms_backGroundModes_0300', 0, async function (done) {
        console.info('=====================bms_backGroundModes_0300==================');
        var bundlePath = [BUNDLE_PATH2]
        var installer = await bundle.getBundleInstaller();
        installer.install(bundlePath, {
            userId: 0,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var dataInfos = await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME2,
                abilityName: 'com.example.third2.MainAbilityA',
                action: 'action.system.home',
                entities: ['entity.system.home']
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0)
            expect(dataInfos.length).assertEqual(NUM_ONE);
            expect(dataInfos[0].name).assertEqual("com.example.third2.MainAbilityA")
            expect(dataInfos[0].backgroundModes).assertEqual(audioPlayback + audioRecording + location
                + bluetoothInteraction + multiDeviceConnection + wifiInteraction + voip + taskKeeping)
            installer.uninstall(BUNDLE_NAME2, {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }, (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                done();
            });
        })
    })

    /*
    * @tc.number: bms_backGroundModes_0400
    * @tc.name: Get the backgroundModes information of the application through queryAbilityByWant 
    * @tc.desc: Read the backgroundModes information of the app's ability and replace invalid attributes 
    */
    it('bms_backGroundModes_0400', 0, async function (done) {
        console.info('=====================bms_backGroundModes_0400==================');
        var bundlePath1 = [BUNDLE_PATH4]
        var installer = await bundle.getBundleInstaller();
        installer.install(bundlePath1, {
            userId: 0,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var dataInfos = await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME4,
                abilityName: 'com.example.third4.MainAbility',
                action: 'action.system.home',
                entities: ['entity.system.home']
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0)
            expect(dataInfos.length).assertEqual(NUM_ONE);
            if (dataInfos.length == 1) {
                expect(dataInfos[0].name).assertEqual("com.example.third4.MainAbility")
                expect(dataInfos[0].backgroundModes).assertEqual(0)
            }
            installer.uninstall(BUNDLE_NAME4, {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }, (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                done();
            });
        })
    })

    /*
    * @tc.number: bms_backGroundModes_0500
    * @tc.name: Get the backgroundModes information of the application through queryAbilityByWant 
    * @tc.desc: Get the backgroundModes information of the multi-hap package of the application 
    */
    it('bms_backGroundModes_0500', 0, async function (done) {
        console.info('=====================bms_backGroundModes_0500==================');
        var bundlePath = [BUNDLE_PATH1, BUNDLE_PATH3];
        var installer = await bundle.getBundleInstaller();
        installer.install(bundlePath, {
            userId: 0,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var dataInfos = await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME1,
                abilityName: 'com.example.third1.MainAbilityA',
                action: 'action.system.home',
                entities: ['entity.system.home']
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0)
            expect(dataInfos.length).assertEqual(NUM_ONE);
            expect(dataInfos[0].name).assertEqual("com.example.third1.MainAbilityA")
            expect(dataInfos[0].backgroundModes).assertEqual(dataTransfer + audioPlayback + audioRecording +
                location + bluetoothInteraction + multiDeviceConnection + wifiInteraction + voip + taskKeeping)
            console.info("========dataInfos[0].backgroundModes=======>" + dataInfos[0].backgroundModes)
            installer.uninstall(BUNDLE_NAME1, {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }, (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                done();
            });
        })
    })

    /*
    * @tc.number: bms_backGroundModes_0600
    * @tc.name: Get the backgroundModes information of the application through queryAbilityByWant
    * @tc.desc: Get the backgroundModes information of the upgraded application's ability 
    */
    it('bms_backGroundModes_0600', 0, async function (done) {
        console.info('=====================bms_backGroundModes_0600==================');
        var bundlePath1 = [BUNDLE_PATH1]
        var bundlePath2 = [BUNDLE_PATHUPDATE]
        var installer = await bundle.getBundleInstaller();
        installer.install(bundlePath1, {
            userId: 0,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var dataInfos = await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME1,
                abilityName: 'com.example.third1.MainAbilityA',
                action: 'action.system.home',
                entities: ['entity.system.home']
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0)
            expect(dataInfos.length).assertEqual(NUM_ONE);
            expect(dataInfos[0].name).assertEqual("com.example.third1.MainAbilityA")
            expect(dataInfos[0].backgroundModes).assertEqual(dataTransfer + audioPlayback + audioRecording +
                location + bluetoothInteraction + multiDeviceConnection + wifiInteraction + voip + taskKeeping)
            installer.install(bundlePath2, {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }, async (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                var dataInfos = await bundle.queryAbilityByWant({
                    bundleName: BUNDLE_NAME1,
                    abilityName: 'com.example.third1.AMainAbilityA',
                    action: 'action.system.home',
                    entities: ['entity.system.home']
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0)
                expect(dataInfos.length).assertEqual(NUM_ONE);
                expect(dataInfos[0].name).assertEqual("com.example.third1.AMainAbilityA");
                expect(dataInfos[0].backgroundModes).assertEqual(audioRecording + location + bluetoothInteraction +
                    multiDeviceConnection + wifiInteraction + voip + taskKeeping);
                installer.uninstall(BUNDLE_NAME1, {
                    userId: 0,
                    installFlag: 1,
                    isKeepData: false
                }, (err, data) => {
                    expect(err.code).assertEqual(0);
                    expect(data.status).assertEqual(0);
                    expect(data.statusMessage).assertEqual('SUCCESS');
                    done();
                });
            })
        })
    })

    /*
    * @tc.number: bms_backGroundModes_0700
    * @tc.name: Get the backgroundModes information of the application through queryAbilityByWant
    * @tc.desc: Uninstall the application, get the backgroundModes information of the upgraded application's ability 
    */
    it('bms_backGroundModes_0700', 0, async function (done) {
        console.info('=====================bms_backGroundModes_0700==================');
        var bundlePath = [BUNDLE_PATH1]
        var installer = await bundle.getBundleInstaller();
        installer.install(bundlePath, {
            userId: 0,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var dataInfos = await bundle.queryAbilityByWant({
                bundleName: BUNDLE_NAME1,
                abilityName: 'com.example.third1.MainAbilityA',
                action: 'action.system.home',
                entities: ['entity.system.home']
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0)
            expect(dataInfos.length).assertEqual(NUM_ONE);
            expect(dataInfos[0].name).assertEqual("com.example.third1.MainAbilityA")
            expect(dataInfos[0].backgroundModes).assertEqual(dataTransfer + audioPlayback + audioRecording +
                location + bluetoothInteraction + multiDeviceConnection + wifiInteraction + voip + taskKeeping)
            installer.uninstall(BUNDLE_NAME1, {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }, async (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                await bundle.queryAbilityByWant({
                    bundleName: BUNDLE_NAME1,
                    abilityName: 'com.example.third1.MainAbility',
                    action: 'action.system.home',
                    entities: ['entity.system.home'],
                }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, 0).then(dataInfo => {
                    expect(dataInfo).assertFail();
                    done();
                }).catch(error => {
                    expect(error).assertEqual(1);
                    done();
                })
            });
        })
    })

    /*
    * @tc.number: bms_getIsKeepAliveAndSingleUser_0100
    * @tc.name: Get the isKeepAlive and singleUser information of the third-party application
    * @tc.desc: Get the isKeepAlive and singleUser information of the third-party application by getBundleInfo
    */
    it('bms_getIsKeepAliveAndSingleUser_0100', 0, async function (done) {
        console.info('===========begin bms_getIsKeepAliveAndSingleUser_0100===========');
        var installer = await bundle.getBundleInstaller();
        installer.install([BUNDLE_PATH1], {
            param: {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            bundle.getBundleInfo(BUNDLE_NAME1, 1, (err, bundleInfo) => {
                expect(err.code).assertEqual(0);
                expect(bundleInfo.isKeepAlive).assertFalse();
                expect(bundleInfo.singleUser).assertFalse();
                installer.uninstall(BUNDLE_NAME1, {
                    param: {
                        userId: 0,
                        installFlag: 1,
                        isKeepData: false
                    }
                }, (err, data) => {
                    expect(err.code).assertEqual(0);
                    expect(data.status).assertEqual(0);
                    expect(data.statusMessage).assertEqual('SUCCESS');
                    done();
                });
            });
        })
    })

    /*
    * @tc.number: bms_getIsKeepAliveAndSingleUser_0200
    * @tc.name: Get the isKeepAlive and singleUser information of the application which doesn't config those fields
    * @tc.desc: Get the isKeepAlive and singleUser information of the application which doesn't config those fields
    *               by getBundleInfo(application is system)
    */
    it('bms_getIsKeepAliveAndSingleUser_0200', 0, async function (done) {
        console.info('=====================bms_getIsKeepAliveAndSingleUser_0200==================');
        var bundleInfo = await bundle.getBundleInfo('com.example.system1', 1);
        console.info('========bundleInfo is=====' + JSON.stringify(bundleInfo));
        expect(bundleInfo.isKeepAlive).assertFalse();
        expect(bundleInfo.singleUser).assertFalse();
        done();
    })

    /*
    * @tc.number: bms_getIsKeepAliveAndSingleUser_0300
    * @tc.name: Get the isKeepAlive and singleUser information of the application includes two haps
    * @tc.desc: Get the isKeepAlive and singleUser information of the application includes two haps, the attribute value
    *               will remain the same as the attribute value of the first installed hap(application is system)
    */
    it('bms_getIsKeepAliveAndSingleUser_0300', 0, async function (done) {
        console.info('===========begin bms_getIsKeepAliveAndSingleUser_0300===========');
        let installer = await bundle.getBundleInstaller()
        installer.install([SYSTEM_PATH, SYSTEM_FEATURE_PATH], {
            param: {
                userId: 0,
                isKeepData: false
            }
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var bundleInfo = await bundle.getBundleInfo(SYSTEM_NAME, 1);
            expect(bundleInfo.singleUser).assertTrue();
            expect(bundleInfo.isKeepAlive).assertFalse();
            installer.uninstall(SYSTEM_NAME, {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                done();
            });
        });
    })

    /*
    * @tc.number: bms_getIsKeepAliveAndSingleUser_0400
    * @tc.name: Update application, get the isKeepAlive and singleUser information of the application
    * @tc.desc: Update application, get the isKeepAlive and singleUser information of the application whether update
    *               (application is system)
    */
    it('bms_getIsKeepAliveAndSingleUser_0400', 0, async function (done) {
        console.info('=====================bms_getIsKeepAliveAndSingleUser_0400==================');
        var installer = await bundle.getBundleInstaller();
        installer.install([SYSTEM_PATH], {
            param: {
                userId: 0,
                installFlag: 1,
                isKeepData: false
            }
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var bundleInfo = await bundle.getBundleInfo(SYSTEM_NAME, 1);
            expect(bundleInfo.singleUser).assertTrue();
            expect(bundleInfo.isKeepAlive).assertFalse();
            installer.install([SYSTEM_UPDATE_PATH], {
                param: {
                    userId: 0,
                    installFlag: 1,
                    isKeepData: false
                }
            }, async (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                var bundleInfo = await bundle.getBundleInfo(SYSTEM_NAME, 1);
                console.info('========bundleInfo is=====' + JSON.stringify(bundleInfo));
                expect(bundleInfo.name).assertEqual(SYSTEM_NAME);
                expect(bundleInfo.isKeepAlive).assertTrue();
                expect(bundleInfo.singleUser).assertTrue();
                installer.uninstall(SYSTEM_NAME, {
                    param: {
                        userId: 0,
                        installFlag: 1,
                        isKeepData: false
                    }
                }, (err, data) => {
                    expect(err.code).assertEqual(0);
                    expect(data.status).assertEqual(0);
                    expect(data.statusMessage).assertEqual('SUCCESS');
                    done();
                });
            })
        })
    })
})