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
import featureAbility from '@ohos.ability.featureability'
import abilitymanager from '@ohos.app.abilitymanager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

var WeightReasonCode =  {
    REASON_UNKNOWN : 0,
    WEIGHT_FOREGROUND : 100,
    WEIGHT_FOREGROUND_SERVICE : 125,
    WEIGHT_VISIBLE : 200,
    WEIGHT_PERCEPTIBLE : 230,
    WEIGHT_SERVICE : 300,
    WEIGHT_TOP_SLEEPING : 325,
    WEIGHT_CANT_SAVE_STATE : 350,
    WEIGHT_CACHED : 400,
    WEIGHT_GONE : 1000
}

describe('ActsAmsCallBackFifthScene', function () {
    console.info('----ActsAmsCallBackFifthScene----');

    it('startlauncher_callbackscene5_01', 0, async function (done) {
        var callback = featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ohos.launcher",
                    abilityName: "com.ohos.launcher.MainAbility",
                    action: "action1",
                    parameters:
                    {},
                },
            },
            (err, data) => {
                done();
            }
        );
    })

    it('removeMission_callback_05', 0, async function (done) {
        var maxnum = 10,flag = 1;
        abilitymanager.queryRecentAbilityMissionInfos(maxnum,flag,
            (info) => {
                console.info('==================== queryRecentAbilityMissionInfos data  ' + JSON.stringify(info) );
                for (var i = 0; i < info.length; i++) {
                    if(info[i].baseAbility.bundleName != 'com.example.callbackscene005'&& info[i].topAbility.bundleName != 'com.example.callbackscene005'){
                        abilitymanager.removeMission(info[i].id,
                            (info) => {
                                console.info('============== removeMission data  [' + info + ']' );
                            });
                    }
                }
                done();
            })
    })

    it('startAbility_callbackscene5_01', 0, async function (done) {
        var callback = featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ix.simulate.feature",
                    abilityName: "com.example.SimulateFeatureAbilityFir",
                    action: "action1",
                    parameters:
                    {},
                },
            },
            (err, data) => {
                done();
            }
        );
    })

    it('startAbility_callbackscene5_02', 0, async function (done) {
        var callback = featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ix.verify.io",
                    abilityName: "com.example.VerifyIoThirdAbility",
                    action: "action1",
                    parameters:
                    {},
                },
            },
            (err, data) => {
                done();
            }
        );
    })

    it('startAbility_callbackscene5_03', 0, async function (done) {
        var callback = featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ix.simulate.feature",
                    abilityName: "com.example.SimulateFeatureAbilitySed",
                    action: "action1",
                    parameters:
                    {},
                },
            },
            (err, data) => {
                done();
            }
        );
    })

    it('Acts_Ams_test_6600', 0, async function (done) {
        abilitymanager.getAllRunningProcesses(
            (error,info) => {
                console.info('getAllRunningProcesses error.code ' + error.code + ', data length [' + info.length + ']' );
                console.info('==================== getAllRunningProcesses JSON String:  ' + JSON.stringify(info) );
                expect(Array.isArray(info)).assertEqual(true);
                for (var i = 0; i < info.length; i++) {
                    expect(typeof(info[i].pid)).assertEqual("number");
                    expect(info[i].pid).assertLarger(0);

                    expect(typeof(info[i].processName)).assertEqual("string");
                    expect(info[i].processName.length).assertLarger(0);

                    expect(Array.isArray(info[i].pkgList)).assertEqual(true);
                    expect(info[i].pkgList.length).assertEqual(0);

                    expect(typeof(info[i].uid)).assertEqual("number");
                    expect(info[i].uid).assertLarger(0);

                    expect(typeof(info[i].lastMemoryLevel)).assertEqual("number");
                    expect(info[i].lastMemoryLevel).assertEqual(-1);

                    expect(typeof(info[i].weight)).assertEqual("number");
                    expect(info[i].weight).assertEqual(-1);

                    expect(typeof(info[i].weightReasonCode)).assertEqual("number");
                    expect(info[i].weightReasonCode).assertEqual(WeightReasonCode.REASON_UNKNOWN);
                }
            });
        done();
    })

    it('Acts_Ams_test_7000', 0, async function (done) {
        var maxnum = 10,flag = 1;
        abilitymanager.queryRecentAbilityMissionInfos(maxnum, flag,
            (error,data) => {
                console.info('queryRecentAbilityMissionInfos error.code :' + error.code + ',data length [' + data.length + ']' );
                console.info('==================== queryRecentAbilityMissionInfos data  ' + JSON.stringify(data) );
                expect(Array.isArray(data)).assertEqual(true);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i].id)).assertEqual("number");
                    expect(data[i].id).assertLarger(0);

                    expect(typeof (data[i].baseAbility)).assertEqual("object");
                    expect(typeof (data[i].baseAbility.deviceId)).assertEqual("string");
                    expect(typeof (data[i].baseAbility.bundleName)).assertEqual("string");
                    expect(data[i].baseAbility.bundleName.length).assertLarger(0);
                    expect(typeof (data[i].baseAbility.abilityName)).assertEqual("string");
                    expect(data[i].baseAbility.abilityName.length).assertLarger(0);

                    expect(typeof (data[i].topAbility)).assertEqual("object");
                    expect(typeof (data[i].topAbility.deviceId)).assertEqual("string");
                    expect(typeof (data[i].topAbility.bundleName)).assertEqual("string");
                    expect(data[i].topAbility.bundleName.length).assertLarger(0);
                    expect(typeof (data[i].topAbility.abilityName)).assertEqual("string");
                    expect(data[i].topAbility.abilityName.length).assertLarger(0);

                    expect(typeof (data[i].missionDescription)).assertEqual("object");
                    expect(typeof (data[i].missionDescription.label)).assertEqual("string");
                    expect(typeof (data[i].missionDescription.iconPath)).assertEqual("string");
                }
            });
        done();
    })

    it('Acts_Ams_test_6800', 0, async function (done) {
        var maxnum = 10;
        abilitymanager.queryRunningAbilityMissionInfos(maxnum,
            (error,data) => {
                console.info('queryRunningAbilityMissionInfos error.code :' + error.code + ',data length [' + data.length + ']' );
                console.info('==================== queryRunningAbilityMissionInfos data  ' + JSON.stringify(data) );
                expect(Array.isArray(data)).assertEqual(true);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i].id)).assertEqual("number");
                    expect(data[i].id).assertLarger(0);

                    expect(typeof (data[i].baseAbility)).assertEqual("object");
                    expect(typeof (data[i].baseAbility.deviceId)).assertEqual("string");
                    expect(typeof (data[i].baseAbility.bundleName)).assertEqual("string");
                    expect(data[i].baseAbility.bundleName.length).assertLarger(0);
                    expect(typeof (data[i].baseAbility.abilityName)).assertEqual("string");
                    expect(data[i].baseAbility.abilityName.length).assertLarger(0);

                    expect(typeof (data[i].topAbility)).assertEqual("object");
                    expect(typeof (data[i].topAbility.deviceId)).assertEqual("string");
                    expect(typeof (data[i].topAbility.bundleName)).assertEqual("string");
                    expect(data[i].topAbility.bundleName.length).assertLarger(0);
                    expect(typeof (data[i].topAbility.abilityName)).assertEqual("string");
                    expect(data[i].topAbility.abilityName.length).assertLarger(0);

                    expect(typeof (data[i].missionDescription)).assertEqual("object");
                    expect(typeof (data[i].missionDescription.label)).assertEqual("string");
                    expect(typeof (data[i].missionDescription.iconPath)).assertEqual("string");
                }
            });
        done();
    })

    it('Acts_Ams_test_7200', 0, async function (done) {
        var maxnum = 10;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.removeMission(result[1].id,
            (error,info) => {
                console.info('============== removeMission error.code:' + error.code +', data  [' + info + ']' );
                expect(typeof(info)).assertEqual("number");
                expect(info).assertEqual(0);
            });
        done();
    })

    it('Acts_Ams_test_7600', 0, async function (done) {
        var maxnum = 10;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.moveMissionToTop(result[0].id,
            (error,info) => {
                console.info('============== moveMissionToTop error.code:' + error.code + ',data  [' + info + ']' );
                expect(typeof(info)).assertEqual("number");
                expect(info).assertEqual(0);
            });
        done();
    })

    it('Acts_Ams_test_7800', 0, async function (done) {
        var maxnum = 10;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.removeMissions([result[0].id],
            (error,info) => {
                console.info('============== removeMissions error.code :' + error.code + ',data  [' + info + ']' );
                expect(typeof(info)).assertEqual("number");
                expect(info).assertLarger(0);
            });
        done();
    })

    it('Acts_Ams_test_7400', 0, async function (done) {
        abilitymanager.clearMissions(
            (error,info) => {
                console.info('============== clearMissions error.code ' + error.code + ',data  [' + info + ']' );
                expect(typeof(info)).assertEqual("number");
                expect(info).assertLarger(0);
            });
        done();
    })

    it('Acts_Ams_test_8000', 0, async function (done) {
        abilitymanager.killProcessesByBundleName('com.ix.verify.io',
            (error,info) => {
                console.info('============== killProcessesByBundleName error.code: ' + error.code + ',data  [' + info + ']' );
                expect(typeof(info)).assertEqual("number");
                expect(info).assertEqual(0);
            });
        done();
    })

    it('startlauncher_callbackscene5_02', 0, async function (done) {
        var callback = featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ohos.launcher",
                    abilityName: "com.ohos.launcher.MainAbility",
                    action: "action1",
                    parameters:
                    {},
                },
            },
            (err, data) => {
                done();
            }
        );
    })
})
