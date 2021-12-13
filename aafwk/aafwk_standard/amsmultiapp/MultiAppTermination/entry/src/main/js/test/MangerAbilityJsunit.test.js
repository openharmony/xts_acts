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
import commonEvent from "@ohos.commonevent"
import abilitymanager from '@ohos.app.abilitymanager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

var subscriberInfoStartAbility = {
    events: ["ACTS_StartAbility_CommonEvent", "ACTS_StartAbility_Terminate", "DISCONNECT"],
};
const MIN_CLONEUID = 20000000;

function sleep(delay) {
    var start = (new Date()).getTime();
    while ((new Date()).getTime() - start < delay) {
        continue;
    }
}

describe('ActsAmsMultiAppTermination', function () {
    console.info('----ActsAmsMultiAppTermination----');
    
    /*
     * @tc.number    : AMS_MultiApp_Termination_Ontology_0100
     * @tc.name      : startAbility : start pageAbility
     * @tc.desc      : The Ontology application and the clone application are online at the same time,
     *                 and the Ontology application is terminated 
     */
    it('AMS_MultiApp_Termination_Ontology_0100', 0, async function (done) {  
        var subscriber;
        commonEvent.createSubscriber(subscriberInfoStartAbility).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            subscriber = data;
            await commonEvent.subscribe(subscriber, subscribeCallBack);
            
        })   

        await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.example.actsamsmultiapppageclonetermination",
                    abilityName: "com.example.actsamsmultiapppageclonetermination.MainAbility",
                },
            },
        );
        async function subscribeCallBack(err, data) {
            if(data.event == "ACTS_StartAbility_CommonEvent"){
                console.debug("====> if data.event====>");
                await featureAbility.startAbility(
                    {
                        want:
                        {
                            bundleName: "com.example.actsamsmultiapppageclonetermination",
                            abilityName: "com.example.actsamsmultiapppageclonetermination.MainAbility",
                        },
                    },
                );
            }
            if(data.event == "ACTS_StartAbility_Terminate") {
                async function unSubscribeCallback() {
                    console.info('ActsAmsMultiAppTermination unSubscribe');
                }
                commonEvent.unsubscribe(subscriber, unSubscribeCallback)
                console.debug("====>ActsAmsMultiAppTermination unSubscribeCallback====>" );
            }
        }
        sleep(3000);
        var processInfos = await abilitymanager.getActiveProcessInfos();
        var cloneFlag = 0;
        var selfFlag = 0;
        for (var i = 0; i < processInfos.length; i++) {
            console.info('ActsAmsMultiAppTermination  process name ' + processInfos[i].processName);
            if (processInfos[i].processName == "com.example.actsamsmultiapppageclonetermination") {
                console.info('process uid =  ' + processInfos[i].uid);
                if (processInfos[i].uid >= MIN_CLONEUID) {
                    cloneFlag = 1;
                } else {
                    selfFlag = 1;
                }
            }
        }
        console.info('ActsAmsMultiAppTermination  cloneFlag ' + cloneFlag);
        console.info('ActsAmsMultiAppTermination  selfFlag ' + selfFlag);
        expect(cloneFlag).assertEqual(1);
        expect(selfFlag).assertEqual(0);
        done();
    })
})
