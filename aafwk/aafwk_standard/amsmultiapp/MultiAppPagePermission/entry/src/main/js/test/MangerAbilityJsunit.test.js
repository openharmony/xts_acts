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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import commonEvent from '@ohos.commonEvent'

var subscriberInfoStartAbility = {
    events: ["ACTS_StartAbility_CommonEvent"],
};

describe('ActsAmsMultiAppPermission', function () {
    console.info('----ActsAmsMultiAppPermission----');
    
    /*
     * @tc.number    : AMS_MultiApp_Permission_Verification_0100
     * @tc.name      : startAbility : start pageAbility 
     * @tc.desc      : pageAbility start pageAbility without permission
     */
    it('AMS_MultiApp_Permission_Verification_0100', 0, async function (done) {  
        var subscriber;
        commonEvent.createSubscriber(subscriberInfoStartAbility).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            subscriber = data;
            console.debug("====>Create Subscriber====> subscriber" + subscriber);
            await commonEvent.subscribe(subscriber, subscribeCallBack);
            
        })   
        await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.example.actsamsmultiapppagepermission",
                    abilityName: "com.example.actsamsmultiapppagepermission.MainAbility",
                },
            },
        );
        function subscribeCallBack(err, data) {
            console.debug("====>subscribeCallBack====> data.event " + data.event);
            expect(data.event).assertEqual("ACTS_StartAbility_CommonEvent error");
            done();
        }
        setTimeout(()=>{
            unsubscribe("subscribe", subscriber);
            expect("true").assertEqual("true");           
        }, 5000);
        function unsubscribe(caller, subscriber) {
            commonEvent.unsubscribe(subscriber, (err, data) => {
                console.debug("=ACTS_AmsMultiAppPermission_unsubscribe (err,data)=======>"
                    + (caller)
                    + (" , json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                    done();
            });
        }
    })
})
