/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index";
import commonEvent from '@ohos.commonevent';
import bundle from '@ohos.bundle';
import missionManager from '@ohos.application.missionManager';

const BUNDLE_PATH = ['/data/ActsAmsStaticARelyHap.hap','/data/ActsAmsStaticBRelyHap.hap'];
const BUNDLE_NAME = ['com.example.staticinformationmultihappackage'];
const PATHS_COUNT = 1;
const BUNDLE_COUNT = 1;
const MAX_MISSION_NUM = 1024;
var subscriberInfo = {
    events: ['MainAbility_Start_CommonEvent_multi_hap_entry', 'MainAbility_Start_CommonEvent_multi_hap_feature'],
};

function getMissionId() {
    return new Promise(async (resolve, reject) => {
        var missionId = -1;
        var missionInfos = await missionManager.getMissionInfos('', MAX_MISSION_NUM);
        console.log('======>ACTS_getAbilityInfo_0400 getMissionId missionInfos<=======' + missionInfos);
        for (let i = 0; i < missionInfos.length; i++) {
            console.log('getMissionId result: ' + i + '= ' + JSON.stringify(missionInfos[i]))
            if ((missionInfos[i].want.abilityName == "com.example.staticinformationmultihap.MainAbility") &&
            (missionInfos[i].runningState == 0)) {
                missionId = missionInfos[i].missionId;
                break;
            }
        }
        console.log('======>ACTS_getAbilityInfo_0400 getMissionId resolve missionId<=======' + missionId);
        resolve(missionId);
    })
}

export default function abilityTest(abilityContext) {
    describe('ActsAbilityTest', function () {

        beforeEach(async (done) => {
            let installer = await bundle.getBundleInstaller();
            var count = 0;
            installer.install(BUNDLE_PATH, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, (err, data) => {
                count++;
                console.log('======>ACTS_getAbilityInfo_0400 beforeEach install finish<=======' + err.code);
                console.log('======>ACTS_getAbilityInfo_0400 beforeEach install finish<=======' + data.status);
                console.log('======>ACTS_getAbilityInfo_0400 beforeEach install finish<======='
                + data.statusMessage);
                if(count == PATHS_COUNT){
                    done();
                }
            })
        })

        afterEach(async (done) => {
            let installer = await bundle.getBundleInstaller();
            var count = 0;
            var testMissionId;

            testMissionId = await getMissionId();
            console.log('======>ACTS_getAbilityInfo_0400 afterEach test missionId<=======' + testMissionId);
            await missionManager.moveMissionToFront(testMissionId);
            console.log('======>ACTS_getAbilityInfo_0400 afterEach test move<=======');
            installer.uninstall(BUNDLE_NAME, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, (err, data) => {
                count++;
                console.log('======>ACTS_getAbilityInfo_0400 afterEach uninstall finish<=======' + err.code);
                console.log('======>ACTS_getAbilityInfo_0400 afterEach uninstall finish<=======' + data.status);
                console.log('======>ACTS_getAbilityInfo_0400 afterEach uninstall finish<======='
                + data.statusMessage);
                if(count == BUNDLE_COUNT){
                    done();
                }
            })
        })

        /**
         * @tc.number: ACTS_getAbilityInfo_0400
         * @tc.name: Starting singleton ability the second time does triggers onNewWant.
         * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
         */
        it('ACTS_getAbilityInfo_0400', 0, async function (done) {
            console.log("ACTS_getAbilityInfo_0400 --- start")
            var Subscriber;
            var EntryHap = false;
            var FeatureHap = false;

            abilityContext.startAbility({
                bundleName: "com.example.staticinformationmultihappackage",
                abilityName: "com.example.staticinformationmultihappackage.MainAbility",
                action:"startHapA"
            }, (error, data) => {
                console.log('ACTS_getAbilityInfo_0400 - startAbility start HapA: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            })

            commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
                console.debug("ACTS_getAbilityInfo_0400====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, SubscribeCallBack);
            })

            function SubscribeCallBack(err, data) {
                console.debug("ACTS_getAbilityInfo_0400====>Subscribe CallBack data:====>"
                + JSON.stringify(data));
                console.debug("ACTS_getAbilityInfo_0400====>Subscribe CallBack data.event:====>"
                + JSON.stringify(data.event));
                if (data.event == 'MainAbility_Start_CommonEvent_multi_hap_entry') {
                    EntryHap = true;
                    console.log("ACTS_getAbilityInfo_0400====> MainAbility_Start_CommonEvent_multi_hap_entry")
                    let abilityInfo = JSON.parse(data.parameters['abilityInfo'])
                    let hapModuleInfo = JSON.parse(data.parameters['hapModuleInfo'])
                    let applicationInfo =JSON.parse(data.parameters['applicationInfo'])
                    console.log("ACTS_getAbilityInfo_0400_entry_abilityInfo" + abilityInfo.name)
                    console.log("ACTS_getAbilityInfo_0400_entry_applicationInfo" + applicationInfo.name)
                    console.log("ACTS_getAbilityInfo_0400_entry_hapModuleInfo" + hapModuleInfo.name)
                    expect(abilityInfo.name).assertEqual("com.example.staticinformationmultihappackage.MainAbility");
                    expect(applicationInfo.name).assertEqual("com.example.staticinformationmultihappackage");
                    expect(hapModuleInfo.name).assertEqual("com.example.staticinformationmultihappackage");
                } else if (data.event == 'MainAbility_Start_CommonEvent_multi_hap_feature'){
                    FeatureHap = true;
                    console.log("ACTS_getAbilityInfo_0400====> MainAbility_Start_CommonEvent_multi_hap_feature")
                    let abilityInfo1 = JSON.parse(data.parameters['abilityInfo'])
                    let hapModuleInfo1 = JSON.parse(data.parameters['hapModuleInfo'])
                    let applicationInfo1 =JSON.parse(data.parameters['applicationInfo'])
                    console.log("ACTS_getAbilityInfo_0400_feature_abilityInfo" + abilityInfo1.name)
                    console.log("ACTS_getAbilityInfo_0400_feature_applicationInfo" + applicationInfo1.name)
                    console.log("ACTS_getAbilityInfo_0400_feature_hapModuleInfo" + hapModuleInfo1.name)
                    expect(abilityInfo1.name).assertEqual("com.example.feature.MainAbility");
                    expect(applicationInfo1.name).assertEqual("com.example.staticinformationmultihappackage");
                    expect(hapModuleInfo1.name).assertEqual("com.example.feature");
                }
                if(EntryHap && FeatureHap){
                    commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
                }
            }
            function UnSubscribeCallback() {
                console.debug("ACTS_getAbilityInfo_0400====>UnSubscribe CallBack====>");
                done();
            }
        })

    })
}