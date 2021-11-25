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
        console.debug("====>ActsAccountChangeOnOff_0100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add account ActsAccountChangeOnOff_0100 start");
        await appAccountManager.addAccount("changeonoff_extra");
        console.debug("====>enableAppAccess ActsAccountChangeOnOff_0100 start");
        await appAccountManager.enableAppAccess("changeonoff_extra", "com.example.actsaccountsceneonoff");
        function unSubscriberCallback(err){
            console.debug("====>`unsubscribe` 0100 err:" + JSON.stringify(err));
        }
        function deleteAccountCallback(err){
            console.debug("====>delete account 0100 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            done();
        }
        function disCallback(err){
            console.debug("====>delete account 0100 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.deleteAccount("changeonoff_extra", deleteAccountCallback);
        }
        function subscriberCallback(err, data){
            console.debug("====>subscriberCallback 0100 data:" + JSON.stringify(data));
            expect(data.event).assertEqual("account_on_change_extra");
            expect(data.data).assertEqual("SUCCESS");
            commonevent.unsubscribe(subscriber, unSubscriberCallback);
            appAccountManager.disableAppAccess("changeonoff_extra", "com.example.actsaccountsceneonoff", disCallback);
        }
        function publishCallback(err){
            console.debug("====>publish call back err:" + JSON.stringify(err));
            setTimeout(async function (){
                console.debug("====>setAccountExtraInfo start====");
                try{
                    await appAccountManager.setAccountExtraInfo("changeonoff_extra", "change_extra");
                }
                catch(err){
                    console.error("====>setAccountExtraInfo fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.debug("====>setAccountExtraInfo finish====");
            }, 500)
        }
        var commonEventSubscribeInfo = {
            events: ["account_on_change_extra"]
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
            console.debug("====>time out ActsAccountChangeOnOff_0100====");
        }, TIMEOUT);
    });

    /*
     * @tc.number    : ActsAccountChangeOnOff_0200
     * @tc.name      : Subscribe/unsubscribe to the change event of the specified application
     * @tc.desc      : Received the account information change to the authorized account of the subscription to change
     *                 the associatal data
     */
    it('ActsAccountChangeOnOff_0200', 0, async function (done) {
        console.debug("====>ActsAccountChangeOnOff_0200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add account ActsAccountChangeOnOff_0200 start");
        await appAccountManager.addAccount("onoff_associatedata");
        console.debug("====>enableAppAccess ActsAccountChangeOnOff_0200 start");
        await appAccountManager.enableAppAccess("onoff_associatedata", "com.example.actsaccountsceneonoff");
        function unSubscriberCallback(err){
            console.debug("====>unsubscribe 0200 err:" + JSON.stringify(err));
        }
        function deleteAccountCallback(err){
            console.debug("====>delete account 0200 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            done();
        }
        function subscriberCallback(err, data){
            console.debug("====>subscriberCallback 0200 data:" + JSON.stringify(data));
            expect(data.event).assertEqual("account_on_change_associatedata");
            expect(data.data).assertEqual("SUCCESS");
            commonevent.unsubscribe(subscriber, unSubscriberCallback);
            appAccountManager.deleteAccount("onoff_associatedata", deleteAccountCallback);
        }
        function publishCallback(err){
            console.debug("====>publish call back err:" + JSON.stringify(err));
            setTimeout(async function (){
                console.debug("====>setAssociatedData start====");
                try{
                    await appAccountManager.setAssociatedData("onoff_associatedata", "change_key", "change_value");
                }
                catch(err){
                    console.error("====>setAssociatedData fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.debug("====>setAssociatedData finish====");
            }, 500)
        }
        var commonEventSubscribeInfo = {
            events: ["account_on_change_associatedata"]
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.debug("====>subscribe ActsAccountChangeOnOff_0200 finish====")
        });

        var commonEventPublishData = {
            code: 2
        }
        setTimeout(function (){
            console.debug("====>publish event account_on_change 0200====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        }, 1000)

        setTimeout(function(){
            console.debug("====>time out ActsAccountChangeOnOff_0200====");
        }, TIMEOUT);
    });

    /*
     * @tc.number    : ActsAccountChangeOnOff_0300
     * @tc.name      : Subscribe/unsubscribe to the change event of the specified application
     * @tc.desc      : Received the account information change to the authorized account of the subscription to change
     *                 the credential
     */
    it('ActsAccountChangeOnOff_0300', 0, async function (done) {
        console.debug("====>ActsAccountChangeOnOff_0300 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add account ActsAccountChangeOnOff_0300 start");
        await appAccountManager.addAccount("onoff_credential");
        console.debug("====>enableAppAccess ActsAccountChangeOnOff_0300 start");
        await appAccountManager.enableAppAccess("onoff_credential", "com.example.actsaccountsceneonoff");
        function unSubscriberCallback(err){
            console.debug("====>unsubscribe 0300 err:" + JSON.stringify(err));
        }
        function deleteAccountCallback(err){
            console.debug("====>delete account 0300 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            done();
        }
        function subscriberCallback(err, data){
            console.debug("====>subscriberCallback 0300 data:" + JSON.stringify(data));
            expect(data.event).assertEqual("account_on_change_credential");
            expect(data.data).assertEqual("SUCCESS");
            commonevent.unsubscribe(subscriber, unSubscriberCallback);
            appAccountManager.deleteAccount("onoff_credential", deleteAccountCallback);
        }
        function publishCallback(err){
            console.debug("====>publish call back err:" + JSON.stringify(err));
            setTimeout(async function (){
                console.debug("====>setAccountCredential start====");
                try{
                    await appAccountManager.setAccountCredential("onoff_credential", "credentialType", "credential");
                }
                catch(err){
                    console.error("====>setAccountCredential fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.debug("====>setAccountCredential finish====");
            }, 500)
        }
        var commonEventSubscribeInfo = {
            events: ["account_on_change_credential"]
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.debug("====>subscribe ActsAccountChangeOnOff_0300 finish====")
        });

        var commonEventPublishData = {
            code: 3
        }
        setTimeout(function (){
            console.debug("====>publish event account_on_change 0300====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        }, 1000)

        setTimeout(function(){
            console.debug("====>time out ActsAccountChangeOnOff_0300====");
        }, TIMEOUT);
    });

    /*
     * @tc.number    : ActsAccountChangeOnOff_0400
     * @tc.name      : Subscribe/unsubscribe to the change event of the specified application
     * @tc.desc      : Received the account information change to the authorized account of the subscription to delete
     *                 authorized account
     */
    it('ActsAccountChangeOnOff_0400', 0, async function (done) {
        console.debug("====>ActsAccountChangeOnOff_0400 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add first account ActsAccountChangeOnOff_0400 start");
        await appAccountManager.addAccount("onoff_deleteFir");
        console.debug("====>add second account ActsAccountChangeOnOff_0400 start");
        await appAccountManager.addAccount("onoff_deleteSec");
        console.debug("====>enableAppAccess first ActsAccountChangeOnOff_0400 start");
        await appAccountManager.enableAppAccess("onoff_deleteFir", "com.example.actsaccountsceneonoff");
        console.debug("====>enableAppAccess second ActsAccountChangeOnOff_0400 start");
        await appAccountManager.enableAppAccess("onoff_deleteSec", "com.example.actsaccountsceneonoff");
        function unSubscriberCallback(err){
            console.debug("====>unsubscribe 0400 err:" + JSON.stringify(err));
        }
        function deleteAccountCallback(err){
            console.debug("====>delete account 0400 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            done();
        }
        function subscriberCallback(err, data){
            console.debug("====>subscriberCallback 0400 data:" + JSON.stringify(data));
            expect(data.event).assertEqual("account_on_delete_another");
            expect(data.data).assertEqual("SUCCESS");
            commonevent.unsubscribe(subscriber, unSubscriberCallback);
            appAccountManager.deleteAccount("onoff_deleteFir", deleteAccountCallback);
        }
        function publishCallback(err){
            console.debug("====>publish call back err:" + JSON.stringify(err));
            setTimeout(async function (){
                console.debug("====>deleteAccount start====");
                try{
                    await appAccountManager.deleteAccount("onoff_deleteSec");
                }
                catch(err){
                    console.error("====>deleteAccount fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.debug("====>deleteAccount finish====");
            }, 500)
        }
        var commonEventSubscribeInfo = {
            events: ["account_on_delete_another"]
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.debug("====>subscribe ActsAccountChangeOnOff_0400 finish====")
        });

        var commonEventPublishData = {
            code: 4
        }
        setTimeout(function (){
            console.debug("====>publish event account_on_change 0400====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        }, 1000)

        setTimeout(function(){
            console.debug("====>time out ActsAccountChangeOnOff_0400====");
        }, TIMEOUT);
    });

    /*
     * @tc.number    : ActsAccountChangeOnOff_0500
     * @tc.name      : Subscribe/unsubscribe to the change event of the specified application
     * @tc.desc      : Received the account information change to the authorized account of the subscription to delete
     *                 the only authorized account
     */
    it('ActsAccountChangeOnOff_0500', 0, async function (done) {
        console.debug("====>ActsAccountChangeOnOff_0500 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add account ActsAccountChangeOnOff_0500 start");
        await appAccountManager.addAccount("onoff_delete");
        console.debug("====>enableAppAccess ActsAccountChangeOnOff_0500 start");
        await appAccountManager.enableAppAccess("onoff_delete", "com.example.actsaccountsceneonoff");
        function unSubscriberCallback(err){
            console.debug("====>unsubscribe 0500 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            done();
        }
        function subscriberCallback(err, data){
            console.debug("====>subscriberCallback 0500 data:" + JSON.stringify(data));
            expect(data.event).assertEqual("account_on_change_delete");
            expect(data.data).assertEqual("SUCCESS");
            commonevent.unsubscribe(subscriber, unSubscriberCallback);
        }
        function publishCallback(err){
            console.debug("====>publish call back err:" + JSON.stringify(err));
            setTimeout(async function (){
                console.debug("====>deleteAccount start====");
                try{
                    await appAccountManager.deleteAccount("onoff_delete");
                }
                catch(err){
                    console.error("====>deleteAccount fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.debug("====>deleteAccount finish====");
            }, 500)
        }
        var commonEventSubscribeInfo = {
            events: ["account_on_change_delete"]
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.debug("====>subscribe ActsAccountChangeOnOff_0500 finish====")
        });

        var commonEventPublishData = {
            code: 5
        }
        setTimeout(function (){
            console.debug("====>publish event account_on_change 0500====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        }, 1000)

        setTimeout(function(){
            console.debug("====>time out ActsAccountChangeOnOff_0500====");
        }, TIMEOUT);
    });

    /*
     * @tc.number    : ActsAccountChangeOnOff_0600
     * @tc.name      : Subscribe/unsubscribe to the change event of the specified application
     * @tc.desc      : Received the account information change to the authorized account of the subscription to cancel
     *                 authorized account   
     */
    it('ActsAccountChangeOnOff_0600', 0, async function (done) {
        console.debug("====>ActsAccountChangeOnOff_0600 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add first account ActsAccountChangeOnOff_0600 start");
        await appAccountManager.addAccount("onoff_enableFir");
        console.debug("====>add second account ActsAccountChangeOnOff_0600 start");
        await appAccountManager.addAccount("onoff_enableSec");
        console.debug("====>enableAppAccess first ActsAccountChangeOnOff_0600 start");
        await appAccountManager.enableAppAccess("onoff_enableFir", "com.example.actsaccountsceneonoff");
        console.debug("====>enableAppAccess second ActsAccountChangeOnOff_0600 start");
        await appAccountManager.enableAppAccess("onoff_enableSec", "com.example.actsaccountsceneonoff");
        function unSubscriberCallback(err){
            console.debug("====>unsubscribe 0600 err:" + JSON.stringify(err));
        }
        function deleteAccountCallback(err){
            console.debug("====>delete first account 0600 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.deleteAccount("onoff_enableSec", (err)=>{
                console.debug("====>delete second account 0600 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                done();
            });
        }
        function subscriberCallback(err, data){
            console.debug("====>subscriberCallback 0600 data:" + JSON.stringify(data));
            expect(data.event).assertEqual("account_on_disable_another");
            expect(data.data).assertEqual("SUCCESS");
            commonevent.unsubscribe(subscriber, unSubscriberCallback);
            appAccountManager.deleteAccount("onoff_enableFir", deleteAccountCallback);
        }
        function publishCallback(err){
            console.debug("====>publish call back err:" + JSON.stringify(err));
            setTimeout(async function (){
                console.debug("====>disableAppAccess start====");
                try{
                    await appAccountManager.disableAppAccess("onoff_enableSec", "com.example.actsaccountsceneonoff");
                }
                catch(err){
                    console.error("====>disableAppAccess fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.debug("====>disableAppAccess finish====");
            }, 500)
        }
        var commonEventSubscribeInfo = {
            events: ["account_on_disable_another"]
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.debug("====>subscribe ActsAccountChangeOnOff_0600 finish====")
        });

        var commonEventPublishData = {
            code: 6
        }
        setTimeout(function (){
            console.debug("====>publish event account_on_change 0600====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        }, 1000)

        setTimeout(function(){
            console.debug("====>time out ActsAccountChangeOnOff_0600====");
        }, TIMEOUT);
    });

    /*
     * @tc.number    : ActsAccountChangeOnOff_0700
     * @tc.name      : Subscribe/unsubscribe to the change event of the specified application
     * @tc.desc      : Received the account information change to the authorized account of the subscription to cancel
     *                 the only authorized account
     */
    it('ActsAccountChangeOnOff_0700', 0, async function (done) {
        console.debug("====>ActsAccountChangeOnOff_0700 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add account ActsAccountChangeOnOff_0700 start");
        await appAccountManager.addAccount("onoff_disable");
        console.debug("====>enableAppAccess ActsAccountChangeOnOff_0700 start");
        await appAccountManager.enableAppAccess("onoff_disable", "com.example.actsaccountsceneonoff");
        function unSubscriberCallback(err){
            console.debug("====>unsubscribe 0700 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            done();
        }
        function subscriberCallback(err, data){
            console.debug("====>subscriberCallback 0700 data:" + JSON.stringify(data));
            expect(data.event).assertEqual("account_on_change_disable");
            expect(data.data).assertEqual("SUCCESS");
            commonevent.unsubscribe(subscriber, unSubscriberCallback);
        }
        function publishCallback(err){
            console.debug("====>publish call back err:" + JSON.stringify(err));
            setTimeout(async function (){
                console.debug("====>disableAppAccess start====");
                try{
                    await appAccountManager.disableAppAccess("onoff_disable", "com.example.actsaccountsceneonoff");
                }
                catch(err){
                    console.error("====>disableAppAccess fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.debug("====>disableAppAccess finish====");
            }, 500)
        }
        var commonEventSubscribeInfo = {
            events: ["account_on_change_disable"]
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.debug("====>subscribe ActsAccountChangeOnOff_0700 finish====")
        });

        var commonEventPublishData = {
            code: 7
        }
        setTimeout(function (){
            console.debug("====>publish event account_on_change 0700====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        }, 1000)

        setTimeout(function(){
            console.debug("====>time out ActsAccountChangeOnOff_0700====");
        }, TIMEOUT);
    });
})