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
describe('scene_callback_test_2', function () {
    console.info('----scene_callback_test_2----');

    it('startlauncher_callbackscene2_01', 0, async function (done) {
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

    it('removeMission_callback_02', 0, async function (done) {
        var maxnum = 20,flag = 1;
        abilitymanager.queryRecentAbilityMissionInfos(maxnum,flag,
            (info) => {
                console.info('==================== queryRecentAbilityMissionInfos data  ' + JSON.stringify(info) );
                for (var i = 0; i < info.length; i++) {
                    if(info[i].baseAbility.bundleName != 'com.example.callbackscene002'&& info[i].topAbility.bundleName != 'com.example.callbackscene002'){
                        abilitymanager.removeMission(info[i].id,
                            (info) => {
                                console.info('============== removeMission data  [' + info + ']' );
                            });
                    }
                }
                done();
            })
    })

    it('startability_callback2_01', 0, async function (done) {
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

    it('startability_callback2_02', 0, async function (done) {
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

    it('Acts_Ams_test_1800', 0, async function (done) {
        abilitymanager.getAllRunningProcesses(
            (error,info) => {
                console.info('getAllRunningProcesses error.code ' + error.code + ', data length [' + info.length + ']' );
                console.info('==================== getAllRunningProcesses data  ' + JSON.stringify(info) );
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
            });
        done();
    })

    it('Acts_Ams_test_2000', 0, async function (done) {
        var maxnum = 20;
        abilitymanager.queryRunningAbilityMissionInfos(maxnum,
            (error,info) => {
                console.info('queryRunningAbilityMissionInfos error.code :' + error.code + ',data length [' + info.length + ']' );
                console.info('==================== queryRunningAbilityMissionInfos info  ' + JSON.stringify(info) );
                expect(Array.isArray(info)).assertEqual(true);
                for (var i = 0; i < info.length; i++) {
                    expect(typeof (info[i].id)).assertEqual("number");
                    expect(info[i].id).assertLarger(0);

                    expect(typeof (info[i].baseAbility)).assertEqual("object");
                    expect(typeof (info[i].baseAbility.deviceId)).assertEqual("string");
                    expect(typeof (info[i].baseAbility.bundleName)).assertEqual("string");
                    expect(info[i].baseAbility.bundleName.length).assertLarger(0);
                    expect(typeof (info[i].baseAbility.abilityName)).assertEqual("string");
                    expect(info[i].baseAbility.abilityName.length).assertLarger(0);

                    expect(typeof (info[i].topAbility)).assertEqual("object");
                    expect(typeof (info[i].topAbility.deviceId)).assertEqual("string");
                    expect(typeof (info[i].topAbility.bundleName)).assertEqual("string");
                    expect(info[i].topAbility.bundleName.length).assertLarger(0);
                    expect(typeof (info[i].topAbility.abilityName)).assertEqual("string");
                    expect(info[i].topAbility.abilityName.length).assertLarger(0);

                    expect(typeof (info[i].missionDescription)).assertEqual("object");
                    expect(typeof (info[i].missionDescription.label)).assertEqual("string");
                    expect(typeof (info[i].missionDescription.iconPath)).assertEqual("string");
                }
            });
        done();
    })
    it('Acts_Ams_test_2200', 0, async function (done) {
        var maxnum = 20,flag = 1;
        abilitymanager.queryRecentAbilityMissionInfos(maxnum,flag,
            (error,info) => {
                console.info('queryRecentAbilityMissionInfos error.code :' + error.code + ',data length [' + info.length + ']' );
                console.info('==================== queryRecentAbilityMissionInfos info  ' + JSON.stringify(info) );
                expect(Array.isArray(info)).assertEqual(true);
                for (var i = 0; i < info.length; i++) {
                    expect(typeof (info[i].id)).assertEqual("number");
                    expect(info[i].id).assertLarger(0);

                    expect(typeof (info[i].baseAbility)).assertEqual("object");
                    expect(typeof (info[i].baseAbility.deviceId)).assertEqual("string");
                    expect(typeof (info[i].baseAbility.bundleName)).assertEqual("string");
                    expect(info[i].baseAbility.bundleName.length).assertLarger(0);
                    expect(typeof (info[i].baseAbility.abilityName)).assertEqual("string");
                    expect(info[i].baseAbility.abilityName.length).assertLarger(0);

                    expect(typeof (info[i].topAbility)).assertEqual("object");
                    expect(typeof (info[i].topAbility.deviceId)).assertEqual("string");
                    expect(typeof (info[i].topAbility.bundleName)).assertEqual("string");
                    expect(info[i].topAbility.bundleName.length).assertLarger(0);
                    expect(typeof (info[i].topAbility.abilityName)).assertEqual("string");
                    expect(info[i].topAbility.abilityName.length).assertLarger(0);

                    expect(typeof (info[i].missionDescription)).assertEqual("object");
                    expect(typeof (info[i].missionDescription.label)).assertEqual("string");
                    expect(typeof (info[i].missionDescription.iconPath)).assertEqual("string");
                }
            });
        done();
    })

    it('Acts_Ams_test_2400', 0, async function (done) {
        var maxnum = 20;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.removeMission(result[1].id,
            (error,info) => {
                console.info('============== removeMission error.code:' + error.code +', data  [' + info + ']' );
                expect(info).assertEqual(0);
            });
        done();
    })

    it('Acts_Ams_test_2800', 0, async function (done) {
        var maxnum = 20;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.moveMissionToTop(result[0].id,
            (error,info) => {
                console.info('============== moveMissionToTop error.code:' + error.code + ',data  [' + info + ']' );
                expect(info).assertEqual(0);
            });
        done();
    })

    it('Acts_Ams_test_3000', 0, async function (done) {
        var maxnum = 20;
        var result = await abilitymanager.queryRunningAbilityMissionInfos(maxnum);
        abilitymanager.removeMissions([result[0].id],
            (error,info) => {
                console.info('============== removeMissions error.code :' + error.code + ',data  [' + info + ']' );
                expect(info).assertLarger(0);
            });
        done();
    })

    it('Acts_Ams_test_2600', 0, async function (done) {
        abilitymanager.clearMissions(
            (error,info) => {
                console.info('============== clearMissions error.code ' + error.code + ',data  [' + info + ']' );
                expect(info).assertLarger(0);
            });
        done();
    })

    it('Acts_Ams_test_3200', 0, async function (done) {
        abilitymanager.killProcessesByBundleName('XXXXXXXXXXXX',
            (error,info) => {
                console.info('============== killProcessesByBundleName error.code: ' + error.code + ',data  [' + info + ']' );
                expect(info).assertEqual(0);
            });
        done();

    })

    it('startlauncher_callbackscene2_02', 0, async function (done) {
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

    it('clearMissions_callback_02', 0, async function (done) {
        abilitymanager.clearMissions(
            (info) => {
                console.info('============== clearMissions data  [' + info + ']' );
            });
        done();
    })
})


