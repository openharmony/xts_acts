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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

var WeightReasonCode = {
    REASON_UNKNOWN: 0,
    WEIGHT_FOREGROUND: 100,
    WEIGHT_FOREGROUND_SERVICE: 125,
    WEIGHT_VISIBLE: 200,
    WEIGHT_PERCEPTIBLE: 230,
    WEIGHT_SERVICE: 300,
    WEIGHT_TOP_SLEEPING: 325,
    WEIGHT_CANT_SAVE_STATE: 350,
    WEIGHT_CACHED: 400,
    WEIGHT_GONE: 1000
}

var abilityNameList = [
    "com.ohos.launcher.MainAbility",
    "com.example.SimulateFeatureAbilityFir",
    "com.example.VerifyIoThirdAbility",
    "com.example.SimulateFeatureAbilitySed",
    "com.example.actsamscallbackfifthscene.MainAbility"
]

var bundleNameList = [
    "com.ohos.launcher",
    "com.ohos.systemui",
    "com.ix.simulate.feature",
    "com.ix.verify.io",
    "com.example.actsamscallbackfifthscene"
]

describe('ActsAmsCallBackFifthScene', function () {
    console.info('----ActsAmsCallBackFifthScene----');
    beforeAll(async function (done) {
        featureAbility.startAbility(
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
        );
        var maxnum = 10, flag = 1;
        var data = await abilitymanager.queryRecentAbilityMissionInfos(maxnum, flag);
        console.log('queryRecentAbilityMissionInfos data  ' + JSON.stringify(data));
        for (var i = 0; i < data.length; i++) {
            if (data[i].baseAbility.bundleName != 'com.example.actsamscallbackfifthscene' &&
                data[i].topAbility.bundleName != 'com.example.actsamscallbackfifthscene') {
                var info = abilitymanager.removeMission(data[i].id);
                console.log(' removeMission data  [' + info + ']');
            }
        };
        featureAbility.startAbility(
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
        );
        featureAbility.startAbility(
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
        );
        featureAbility.startAbility(
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
        );
        setTimeout(done(), 5000);
    });
    
    function timeout() {
        expect().assertFail();
        console.debug('Acts_Ams_test=========timeout========');
        done();
    }

    /*
     * @tc.number    : Acts_Ams_test_6600
     * @tc.name      : getAllRunningProcesses : Get All Running Processes Info
     * @tc.desc      : Get All Running Processes Info(by CallBack)
     */
    it('Acts_Ams_test_6600', 0, async function (done) {
        abilitymanager.getAllRunningProcesses(
            (error, info) => {
                console.info('getAllRunningProcesses error.code \
                ' + error.code + ', data length [' + info.length + ']');
                console.info('Acts_Ams_test_6600 getAllRunningProcesses JSON String: ' + JSON.stringify(info));
                expect(Array.isArray(info)).assertEqual(true);
                expect(info.length).assertEqual(5);
                for (var i = 0; i < info.length; i++) {
                    expect(typeof (info[i].pid)).assertEqual("number");
                    expect(info[i].pid).assertLarger(0);

                    expect(typeof (info[i].processName)).assertEqual("string");
                    expect(info[i].processName.length).assertLarger(0);
                    expect(bundleNameList.indexOf(info[i].processName)).assertLarger(-1);

                    expect(Array.isArray(info[i].pkgList)).assertEqual(true);
                    expect(info[i].pkgList.length).assertEqual(0);

                    expect(typeof (info[i].uid)).assertEqual("number");
                    expect(info[i].uid).assertLarger(0);

                    expect(typeof (info[i].lastMemoryLevel)).assertEqual("number");
                    expect(info[i].lastMemoryLevel).assertEqual(-1);

                    expect(typeof (info[i].weight)).assertEqual("number");
                    expect(info[i].weight).assertEqual(-1);

                    expect(typeof (info[i].weightReasonCode)).assertEqual("number");
                    expect(info[i].weightReasonCode).assertEqual(WeightReasonCode.REASON_UNKNOWN);
                }
                done();
            });
        setTimeout(timeout, 5000);
    })

    /*
     * @tc.number    : Acts_Ams_test_7000
     * @tc.name      : queryRecentAbilityMissionInfos : Query Recent Ability Mission Infos
     * @tc.desc      : Query Recent Ability Mission Infos(by CallBack)
     */
    it('Acts_Ams_test_7000', 0, async function (done) {
        var maxnum = 10, flag = 1;
        abilitymanager.queryRecentAbilityMissionInfos(maxnum, flag,
            (error, data) => {
                console.info('queryRecentAbilityMissionInfos error.code : \
                ' + error.code + ',data length [' + data.length + ']');
                console.info('Acts_Ams_test_7000 queryRecentAbilityMissionInfos data ' + JSON.stringify(data));
                expect(Array.isArray(data)).assertEqual(true);
                expect(data.length).assertEqual(3);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i].id)).assertEqual("number");
                    expect(data[i].id).assertLarger(0);

                    expect(typeof (data[i].baseAbility)).assertEqual("object");
                    expect(typeof (data[i].baseAbility.deviceId)).assertEqual("string");
                    expect(data[i].baseAbility.deviceId.length).assertEqual(0);
                    expect(typeof (data[i].baseAbility.bundleName)).assertEqual("string");
                    expect(data[i].baseAbility.bundleName.length).assertLarger(0);
                    expect(bundleNameList.indexOf(data[i].baseAbility.bundleName)).assertLarger(-1);
                    expect(typeof (data[i].baseAbility.abilityName)).assertEqual("string");
                    expect(data[i].baseAbility.abilityName.length).assertLarger(0);
                    expect(abilityNameList.indexOf(data[i].baseAbility.abilityName)).assertLarger(-1);

                    expect(typeof (data[i].topAbility)).assertEqual("object");
                    expect(typeof (data[i].topAbility.deviceId)).assertEqual("string");
                    expect(data[i].topAbility.deviceId.length).assertEqual(0);
                    expect(typeof (data[i].topAbility.bundleName)).assertEqual("string");
                    expect(data[i].topAbility.bundleName.length).assertLarger(0);
                    expect(bundleNameList.indexOf(data[i].topAbility.bundleName)).assertLarger(-1);
                    expect(typeof (data[i].topAbility.abilityName)).assertEqual("string");
                    expect(data[i].topAbility.abilityName.length).assertLarger(0);
                    expect(abilityNameList.indexOf(data[i].topAbility.abilityName)).assertLarger(-1);

                    expect(typeof (data[i].missionDescription)).assertEqual("object");
                    expect(typeof (data[i].missionDescription.label)).assertEqual("string");
                    expect(typeof (data[i].missionDescription.iconPath)).assertEqual("string");
                }
                done();
            });
        setTimeout(timeout, 5000);
    })

    /*
     * @tc.number    : Acts_Ams_test_6800
     * @tc.name      : queryRunningAbilityMissionInfos : Query Running Ability Mission Infos
     * @tc.desc      : Query Running Ability Mission Infos(by CallBack)
     */
    it('Acts_Ams_test_6800', 0, async function (done) {
        var maxnum = 10;
        abilitymanager.queryRunningAbilityMissionInfos(maxnum,
            (error, data) => {
                console.info('queryRunningAbilityMissionInfos error.code : \
                ' + error.code + ',data length [' + data.length + ']');
                console.info('Acts_Ams_test_6800 queryRunningAbilityMissionInfos data ' + JSON.stringify(data));
                expect(Array.isArray(data)).assertEqual(true);
                expect(data.length).assertEqual(3);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i].id)).assertEqual("number");
                    expect(data[i].id).assertLarger(0);

                    expect(typeof (data[i].baseAbility)).assertEqual("object");
                    expect(typeof (data[i].baseAbility.deviceId)).assertEqual("string");
                    expect(data[i].baseAbility.deviceId.length).assertEqual(0);
                    expect(typeof (data[i].baseAbility.bundleName)).assertEqual("string");
                    expect(data[i].baseAbility.bundleName.length).assertLarger(0);
                    expect(bundleNameList.indexOf(data[i].baseAbility.bundleName)).assertLarger(-1);
                    expect(typeof (data[i].baseAbility.abilityName)).assertEqual("string");
                    expect(data[i].baseAbility.abilityName.length).assertLarger(0);
                    expect(abilityNameList.indexOf(data[i].baseAbility.abilityName)).assertLarger(-1);

                    expect(typeof (data[i].topAbility)).assertEqual("object");
                    expect(typeof (data[i].topAbility.deviceId)).assertEqual("string");
                    expect(data[i].topAbility.deviceId.length).assertEqual(0);
                    expect(typeof (data[i].topAbility.bundleName)).assertEqual("string");
                    expect(data[i].topAbility.bundleName.length).assertLarger(0);
                    expect(bundleNameList.indexOf(data[i].topAbility.bundleName)).assertLarger(-1);
                    expect(typeof (data[i].topAbility.abilityName)).assertEqual("string");
                    expect(data[i].topAbility.abilityName.length).assertLarger(0);
                    expect(abilityNameList.indexOf(data[i].topAbility.abilityName)).assertLarger(-1);

                    expect(typeof (data[i].missionDescription)).assertEqual("object");
                    expect(typeof (data[i].missionDescription.label)).assertEqual("string");
                    expect(typeof (data[i].missionDescription.iconPath)).assertEqual("string");
                }
                done();
            });
        setTimeout(timeout, 5000);
    })

    /*
     * @tc.number    : Acts_Ams_test_7200
     * @tc.name      : removeMission : Remove Mission
     * @tc.desc      : Remove Mission(by CallBack)
     */
    it('Acts_Ams_test_7200', 0, async function (done) {
        var maxnum = 10;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.removeMission(result[1].id,
            (error, info) => {
                console.info('Acts_Ams_test_7200 removeMission error.code \
                ' + error.code + ',data  [' + info + ']');
                expect(typeof (info)).assertEqual("number");
                expect(info).assertEqual(0);
                done();
            });
        setTimeout(timeout, 5000);
    })

    /*
     * @tc.number    : Acts_Ams_test_7600
     * @tc.name      : moveMissionToTop : Move Mission To Top
     * @tc.desc      : Move Mission To Top(by CallBack)
     */
    it('Acts_Ams_test_7600', 0, async function (done) {
        var maxnum = 10;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.moveMissionToTop(result[0].id,
            (error, info) => {
                console.info('Acts_Ams_test_7600 moveMissionToTop error.code \
                ' + error.code + ',data  [' + info + ']');
                expect(typeof (info)).assertEqual("number");
                expect(info).assertEqual(0);
                done();
            });
        setTimeout(timeout, 5000);
    })

    /*
     * @tc.number    : Acts_Ams_test_7800
     * @tc.name      : removeMissions : Remove Missions
     * @tc.desc      : Remove Missions(by CallBack)
     */
    it('Acts_Ams_test_7800', 0, async function (done) {
        var maxnum = 10;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.removeMissions([result[0].id],
            (error, info) => {
                console.info('Acts_Ams_test_7800 removeMissions error.code \
                ' + error.code + ',data  [' + info + ']');
                expect(typeof (info)).assertEqual("number");
                expect(info).assertLarger(0);
                done();
            });
        setTimeout(timeout, 5000);
    })

    /*
     * @tc.number    : Acts_Ams_test_7400
     * @tc.name      : clearMissions : Clear Missions
     * @tc.desc      : Clear Missions(by CallBack)
     */
    it('Acts_Ams_test_7400', 0, async function (done) {
        abilitymanager.clearMissions(
            (error, info) => {
                console.info('Acts_Ams_test_7400 clearMissions error.code \
                ' + error.code + ',data  [' + info + ']');
                expect(typeof (info)).assertEqual("number");
                expect(info).assertLarger(0);
                done();
            });
        setTimeout(timeout, 5000);
    })

    /*
     * @tc.number    : Acts_Ams_test_8000
     * @tc.name      : killProcessesByBundleName : Kill Processes By BundleName
     * @tc.desc      : Kill Processes By BundleName(by CallBack)
     */
    it('Acts_Ams_test_8000', 0, async function (done) {
        abilitymanager.killProcessesByBundleName('com.ix.verify.io',
            (error, info) => {
                console.info('Acts_Ams_test_8000 killProcessesByBundleName error.code: \
                ' + error.code + ',data  [' + info + ']');
                expect(typeof (info)).assertEqual("number");
                expect(info).assertEqual(0);
                done();
            });
        setTimeout(timeout, 5000);
    })
})
