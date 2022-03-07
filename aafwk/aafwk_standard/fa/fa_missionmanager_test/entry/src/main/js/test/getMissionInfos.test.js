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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import featureAbility from '@ohos.ability.featureAbility';
import missionManager from "@ohos.application.missionManager";
describe('missionManager', function () {
    console.info("------------------logMessage SUB_AA_OpenHarmony_MissionManager_6400-------------------");


    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_6400
     * @tc.name    Verify the continuable information in the missionInfo of the ability obtained by getMissionInfos
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_6400', 0, async function (done) {
        console.log("------------start SUB_AA_OpenHarmony_MissionManager_6400-------------");
        var TAG = "SUB_AA_OpenHarmony_MissionManager_6400";
        var missionInfo = ["","","","","","","","","",""];
        setTimeout(function () {
            featureAbility.startAbility(
                { want: {
                    bundleName: "com.example.myapplication3",
                    abilityName: "com.example.entry2.MainAbility1"
                } }, (error, data) => {
                console.log('SUB_AA_OpenHarmony_MissionManager_6400 - startAbility: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            });
        }, 1000)
        console.log("------------end start SUB_AA_OpenHarmony_MissionManager_6400-------------");
        setTimeout(()=>{
            missionManager.getMissionInfos('', 10, (err, data) => {
                console.log("SUB_AA_OpenHarmony_MissionManager_6400, twosgetMissionInfos:" + JSON.stringify(data));
                for (var i = 0;i < data.length; i++) {
                    missionInfo[i] = data[i];
                    console.log('qweqweqweqweqwe' + JSON.stringify(missionInfo[i].continuable));
                    if(missionInfo[i].want.abilityName == "com.example.entry2.MainAbility1"){
                        expect(missionInfo[i].continuable == false).assertTrue();
                    };
                }
            })
        },1000)
        done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_MissionManager_6300
     * @tc.name    Verify the want information in the missionInfo of the ability obtained by getMissionInfos
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_MissionManager_6300', 0, async function (done) {
        console.log("------------start SUB_AA_OpenHarmony_MissionManager_6300-------------");
        var TAG = "SUB_AA_OpenHarmony_MissionManager_6300";
        var missionInfo = ["","","","","","","","","",""];
        setTimeout(function () {
            featureAbility.startAbility(
                { want: {
                    bundleName: "com.example.myapplication3",
                    abilityName: "com.example.entry2.MainAbility1"
                } }, (error, data) => {
                console.log('SUB_AA_OpenHarmony_MissionManager_6300 - startAbility: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            });
        }, 1000)
        console.log("------------end start SUB_AA_OpenHarmony_MissionManager_6300-------------");
        setTimeout(()=>{
            missionManager.getMissionInfos('', 10, (err, data) => {
                console.log("SUB_AA_OpenHarmony_MissionManager_6300, twosgetMissionInfos:" + JSON.stringify(data));
                for (var i = 0;i < data.length; i++) {
                    missionInfo[i] = data[i];
                    console.log('qweqweqweqweqwe' + JSON.stringify(missionInfo[i].want));
                    if(missionInfo[i].want.abilityName == "com.example.entry2.MainAbility1"){
                        if(missionInfo[i].want.bundleName == "com.example.myapplication3"){
                            console.log('weweqqq');
                            expect(missionInfo[i].want.bundleName == "com.example.myapplication3").assertTrue();
                        }
                    };
                }
            })
        },1000)
        done();
    })
})
