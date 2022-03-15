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
import featureAbility from '@ohos.ability.featureAbility'
import commonEvent from "@ohos.commonEvent"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

var subscriberInfoStartAbility = {
    events: ["ACTS_StartAbility_CommonEvent", "ACTS_StartAbility_FinishEvent", "DISCONNECT"],
};
const MIN_CLONEUID = 20000000;

describe('ActsAmsMultiAppSimultaneousOnline', function () {
    console.info('----ActsAmsMultiAppSimultaneousOnline----');
    
    /*
     * @tc.number    : AMS_MultiApp_Simultaneous_Online_0100
     * @tc.name      : startAbility : start pageAbility
     * @tc.desc      : Ontology application and clone application are online at the same time 
     */
    it('AMS_MultiApp_Simultaneous_Online_0100', 0, async function (done) {  
        var subscriber;
        commonEvent.createSubscriber(subscriberInfoStartAbility).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            subscriber = data;
            console.debug("====>subscriber====>"  + JSON.stringify(subscriber));
            await commonEvent.subscribe(subscriber, subscribeCallBack);
        })   

        await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.example.actsamsmultiapppageclone",
                    abilityName: "com.example.actsamsmultiapppageclone.MainAbility",
                },
            },
        );

        async function subscribeCallBack(err, data) {
            console.debug("====>ActsAmsMultiAppSimultaneousOnline CallBack data:====>" 
            + JSON.stringify(data));
            console.debug("====>ActsAmsMultiAppSimultaneousOnline CallBack data.event:====>" 
            + JSON.stringify(data.event));
            if(data.event == "ACTS_StartAbility_CommonEvent"){
                console.debug("====> if data.event====>");
                await featureAbility.startAbility(
                    {
                        want:
                        {
                            bundleName: "com.example.actsamsmultiapppageclone",
                            abilityName: "com.example.actsamsmultiapppageclone.MainAbility",
                        },
                    },
                );
            }
            if(data.event == "ACTS_StartAbility_FinishEvent") {
                function unSubscribeCallback() {
                    console.debug("====>UnSubscribe CallBack====>");
                    done();
                }
                commonEvent.unsubscribe(subscriber, unSubscribeCallback)
            }
        }
        var processInfos = await abilityManager.getActiveProcessInfos();
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
        expect(cloneFlag).assertEqual(1);
        expect(selfFlag).assertEqual(1);
    })
})
