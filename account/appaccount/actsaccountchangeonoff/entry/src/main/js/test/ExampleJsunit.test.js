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
import account from '@ohos.account.appAccount'
import commonevent from '@ohos.commonevent'
import featureAbility from '@ohos.ability.featureability'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

const TIMEOUT = 5000;
describe('ActsAccountChangeOnOff', async function () {

    beforeAll(async function (done) {
        console.debug("====>startAbility start====");
        await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.example.actsaccountsceneonoff",
                    abilityName: "com.example.actsaccountsceneonoff.MainAbility",
                    action: "action1",
                    parameters:
                    {},
                },
            },
        );
        setTimeout(done(), TIMEOUT);
    });

    /*
     * @tc.number    : ActsAccountChangeOnOff_0100
     * @tc.name      : Subscribe/unsubscribe to the change event of the specified application
     * @tc.desc      : Received the account information change to the authorized account of the subscription to change
     *                 the additional information
     */
    it('ActsAccountChangeOnOff_0100', 0, async function (done) {
        console.debug("====>ActsAccountChangeOnOff_0100 start====>");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add account ActsAccountChangeOnOff_0100 start");
        await appAccountManager.addAccount("changeonoff_first");
        console.debug("====>enableAppAccess ActsAccountChangeOnOff_0100 start");
        await appAccountManager.enableAppAccess("changeonoff_first", "com.example.actsaccountsceneonoff");
        function unSubscriberCallback(err){
            console.debug("====>unsubscribe 0100 err:" + JSON.stringify(err));
        }
        function subscriberCallback(err, data){
            console.debug("====>subscriberCallback 0100 data:" + JSON.stringify(data));
            expect(data.event).assertEqual("account_on_change_first");
            expect(data.data).assertEqual("SUCCESS");
            commonevent.unsubscribe(subscriber, unSubscriberCallback);
            done();
        }
        function publishCallback(err){
            console.debug("====>publish call back err:" + JSON.stringify(err));
            setTimeout(async function (){
                console.debug("====>setAccountExtraInfo start====");
                console.debug("====>setAccountExtraInfo ActsAccountChangeOnOff_0100 start");
                try{
                    await appAccountManager.setAccountExtraInfo("changeonoff_first", "change_extra");
                }
                catch(err){
                    console.error("====>setAccountExtraInfo fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }   
            }, 500)
        }
        var commonEventSubscribeInfo = {
            events: ["account_on_change_first"]
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.debug("====>subscribe ActsAccountChangeOnOff_0100 finish====")
        });

        var commonEventPublishData = {
            code: 1
        }
        setTimeout(function (){
            console.debug("====>publish event account_on_change 0100====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        }, 1000)

        setTimeout(function(){
            console.debug("====>time out ActsAccountChangeOnOff_0100====>");
        }, TIMEOUT);
    });
})