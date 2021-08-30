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
describe('ActsAmsTestSecondScene', function () {
    console.info('----ActsAmsTestSecondScene----');

    it('startlauncher_scene2_01', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ohos.launcher",
                    abilityName: "com.ohos.launcher.MainAbility",
                    action: "action1",
                    entities: ["entity1"],
                    type: "MIMETYPE",
                    uri: "key={true,true,false}",
                    options:
                    {},
                    parameters:
                    {},
                },
            },
        );
        done();
    })

    it('removeMission_02', 0, async function (done) {
        var maxnum = 20,flag = 1;
        var data = await abilitymanager.queryRecentAbilityMissionInfos(maxnum, flag);
        console.info('==================== queryRecentAbilityMissionInfos data  ' + JSON.stringify(data) );
        for (var i = 0; i < data.length; i++) {
            if(data[i].baseAbility.bundleName != 'com.example.actsamstestsecondscene'&& data[i].topAbility.bundleName != 'com.example.actsamstestsecondscene'){
                var info = abilitymanager.removeMission(data[i].id);
                console.info('============== removeMission data  [' + info + ']' );
            }
        }
        done();
    })

    it('startAbility_scene2_01', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ix.verify.io",
                    abilityName: "com.example.VerifyIoThirdAbility",
                    action: "action1",
                    entities: ["entity1"],
                    type: "MIMETYPE",
                    uri: "key={true,true,false}",
                    options:
                    {},
                    parameters:
                    {},
                },
            },
        );
        done();
    })

    it('startAbility_scene2_02', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ix.simulate.feature",
                    abilityName: "com.example.SimulateFeatureAbilityFir",
                    action: "action1",
                    entities: ["entity1"],
                    type: "MIMETYPE",
                    uri: "key={true,true,false}",
                    options:
                    {},
                    parameters:
                    {},
                },
            },
        );
        done();
    })

    it('Acts_Ams_test_1700', 0, async function (done) {
        var info = await abilitymanager.getAllRunningProcesses();
        console.info('getAllRunningProcesses data length [' + info.length + ']' );
        console.info('Acts_Ams_test_1700==================== getAllRunningProcesses JSON String:  ' + JSON.stringify(info) );
        expect(Array.isArray(info)).assertEqual(true);
        for (var i = 0; i < info.length; i++) {
            expect(typeof(info[i].pid)).assertEqual("number");
            expect(info[i].pid).assertLarger(0);

            expect(typeof(info[i].processName)).assertEqual("string");
            expect(info[i].processName.length).assertLarger(0);

            expect(Array.isArray(info[i].pkgList)).assertEqual(true);

            expect(typeof(info[i].uid)).assertEqual("number");
            expect(info[i].uid).assertLarger(0);

            expect(typeof(info[i].lastMemoryLevel)).assertEqual("number");
            expect(info[i].lastMemoryLevel).assertEqual(-1);

            expect(typeof(info[i].weight)).assertEqual("number");
            expect(info[i].weight).assertEqual(-1);

            expect(typeof(info[i].weightReasonCode)).assertEqual("number");
            expect(info[i].weightReasonCode).assertEqual(WeightReasonCode.REASON_UNKNOWN);
        }
        done();
    })

    it('Acts_Ams_test_1900', 0, async function (done) {
        var maxnum = 20;
        var data = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        console.info('queryRunningAbilityMissionInfos data length [' + data.length + ']' );
        console.info('Acts_Ams_test_1900==================== queryRunningAbilityMissionInfos data  ' + JSON.stringify(data) );
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
        done();
    })

    it('Acts_Ams_test_2100', 0, async function (done) {
        var maxnum = 20,flag = 1;
        var data = await abilitymanager.queryRecentAbilityMissionInfos(maxnum,flag);
        console.info(' queryRecentAbilityMissionInfos data length [' + data.length + ']' );
        console.info('Acts_Ams_test_2100==================== queryRecentAbilityMissionInfos data  ' + JSON.stringify(data) );
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
        done();
    })

    it('Acts_Ams_test_2300', 0, async function (done) {
        var maxnum = 20;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        var info = await abilitymanager.removeMission(result[1].id);
        console.info('Acts_Ams_test_2300============== removeMission data  [' + info + ']' );
        expect(info).assertEqual(0);
        done();
    })

    it('Acts_Ams_test_2700', 0, async function (done) {
        var maxnum = 20;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        var info = await abilitymanager.moveMissionToTop(result[0].id);
        console.info('Acts_Ams_test_2700============== moveMissionToTop data  [' + info + ']' );
        expect(info).assertEqual(0);
        done();
    })

    it('Acts_Ams_test_2900', 0, async function (done) {
        var maxnum = 20;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        var info = await abilitymanager.removeMissions([result[0].id]);
        console.info('Acts_Ams_test_2900============== removeMissions data  [' + info + ']' );
        expect(info).assertLarger(0);
        done();
    })


    it('Acts_Ams_test_2500', 0, async function (done) {
        var info = await abilitymanager.clearMissions();
        console.info('Acts_Ams_test_2500============== clearMissions data  [' + info + ']' );
        expect(info).assertLarger(0);
        done();
    })

    it('Acts_Ams_test_3100', 0, async function (done) {
        var info = await abilitymanager.killProcessesByBundleName('XXXXXXXXXXXX');
        console.info('Acts_Ams_test_3100============== killProcessesByBundleName data  [' + info + ']' );
        expect(info).assertEqual(0);
        done();
    })

    it('startlauncher_scene2_02', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.ohos.launcher",
                    abilityName: "com.ohos.launcher.MainAbility",
                    action: "action1",
                    entities: ["entity1"],
                    type: "MIMETYPE",
                    uri: "key={true,true,false}",
                    options:
                    {},
                    parameters:
                    {},
                },
            },
        );
        done();
    })
})

