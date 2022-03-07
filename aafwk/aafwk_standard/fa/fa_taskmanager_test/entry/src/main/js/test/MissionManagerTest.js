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

import commonEvent from '@ohos.commonevent'
import abilityFeatureAbility from '@ohos.ability.featureAbility';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import missionManager  from '@ohos.application.missionManager';
import appManager from '@ohos.application.appManager';


describe('ShiAbilityDisableTest', function () {
    console.log("ShiAbilityDisableTest --- start");
    
    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_6300
     * @tc.name    Unregistermissionlistener input parameter listenerid is null
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_6300', 0, async function (done) {
        missionManager.unregisterMissionListener(null, (err, data) => {
            console.log('SUB_AA_OpenHarmony_MissionManager_6300 AsyncCallback errCode : '
            + JSON.stringify(err) + " data: " + JSON.stringify(data));
            expect(err.code != 0).assertTrue();
            done();
        })
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_5900
     * @tc.name    Unregistermissionlistener input parameter listenerid is an ID that does not exist
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_5900', 0, async function (done) {
        console.log("---------start SUB_AA_OpenHarmony_MissionManager_5900------------")
        var id = 44642;
        missionManager.unregisterMissionListener(id, (err, data) => {
            console.log('SUB_AA_OpenHarmony_MissionManager_5900 AsyncCallback errCode : '
            + JSON.stringify(err) + " data: " + JSON.stringify(data));
            expect(err.code == 0).assertTrue();
            done();
        })
        console.log("---------start SUB_AA_OpenHarmony_MissionManager_5900------------")
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_5300
     * @tc.name    Getmissioninfo input parameter deviceid is null and missionid is null
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_5300', 0, async function (done) {
        missionManager.getMissionInfo('', '', (err, data) => {
            console.log('SUB_AA_OpenHarmony_MissionManager_5300 AsyncCallback errCode ##: '
            + JSON.stringify(err) + " data: " + JSON.stringify(data));
            expect(err.code != 0).assertTrue();
            done();
        })
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_5400
     * @tc.name    Getmissioninfo input parameter deviceid is null and missionid is of string type
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_5400', 0, async function (done) {
        missionManager.getMissionInfo('', "aa", (err, data) => {
            console.log('SUB_AA_OpenHarmony_MissionManager_5400 AsyncCallback errCode ##: '
            + JSON.stringify(err) + " data: " + JSON.stringify(data));
            expect(err.code != 0).assertTrue();
            done();
        })
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_5600
     * @tc.name    registerMissionListener input parameter is undefined
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_5600', 0, async function (done) {
        var result = missionManager.registerMissionListener(undefined);
        console.log('SUB_AA_OpenHarmony_MissionManager_5600 result ###' + JSON.stringify(result));
        expect(result != undefined).assertTrue();
        done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_5700
     * @tc.name    registerMissionListener input parameter is {}
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_5700', 0, async function (done) {
        var result = missionManager.registerMissionListener('');
        console.log('SUB_AA_OpenHarmony_MissionManager_5700 result ### ' + JSON.stringify(result));
        expect(result != undefined).assertTrue();
        done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_4100
     * @tc.name    Getmissioninfos input parameter deviceid does not exist, nummax is 1
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_4100', 0, async function (done) {
        missionManager.getMissionInfos("aaaaaa", 1, (err, data) => {
            console.log('SUB_AA_OpenHarmony_MissionManager_4100 AsyncCallback errCode : '
            + JSON.stringify(err) + " data: " + JSON.stringify(data));
            expect(err.code != 0).assertTrue();
            done();
        })
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_4200
     * @tc.name    Getmissioninfos input parameter deviceid is null and nummax is 1
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_4200', 0, async function (done) {
        missionManager.getMissionInfos("", 1, (err, data) => {
            console.log('SUB_AA_OpenHarmony_MissionManager_4200 AsyncCallback errCode : '
            + JSON.stringify(err) + " data: " + JSON.stringify(data));
            expect(err.code == 0).assertTrue();
            done();
        })
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_4300
     * @tc.name    Getmissioninfos input parameter deviceid is null and nummax is 10
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_4300', 0, async function (done) {
        missionManager.getMissionInfos("", 10, (err, data) => {
            console.log('SUB_AA_OpenHarmony_MissionManager_4300 AsyncCallback errCode : '
            + JSON.stringify(err) + " data: " + JSON.stringify(data));
            expect(err.code == 0).assertTrue();
            done();
        })
    })

})
