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
import notify from '@ohos.notification'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
var time = 1000
describe('ActsAnsUnSubscriberTest', function () {
    console.debug("===============ActsAnsUnSubscriberTest start=================>");
    function onConnecteOne() {
        console.debug("===============Ans_UnSubscriber_0100 onConnecte=================>");
    }
    function onDisconnectOne() {
        console.debug("===============Ans_UnSubscriber_0100 onDisconnect=================>");
    }

    /*
     * @tc.number: Ans_UnSubscriber_0100
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the subscription can be successfully unsubscribed(callback)
     */
    it('Ans_UnSubscriber_0100', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0100 start=============>");
        function unSubscribeCallbackOne(err) {
            console.debug("===========Ans_UnSubscriber_0100 unSubscribeCallbackOne err.code=================>"+err.code);
            expect(err.code).assertEqual(0)
            done();
        }
        var subscriber ={
            onConnect:onConnecteOne,
            onDisconnect:onDisconnectOne
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0100 subscribe=============>");
        await notify.unsubscribe(subscriber, unSubscribeCallbackOne);
        console.info("===========Ans_UnSubscriber_0100 unsubscribe=============>");

        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0100 done=============>");
        }, time);
    })

    function onConnecteTwo() {
        console.debug("============Ans_UnSubscriber_0200 onConnecteTwo=================>");
    }
    function onDisconnectTwo() {
        console.debug("============Ans_UnSubscriber_0200 onDisconnectTwo=================>");
    }

    /*
     * @tc.number: Ans_UnSubscriber_0200
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber): Promise<void>;
     * @tc.desc: Verify that the subscription can be successfully unsubscribed(promise)
     */
    it('Ans_UnSubscriber_0200', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0200 start=============>");
        var subscriber ={
            onConnect:onConnecteTwo,
            onDisconnect:onDisconnectTwo
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0200 subscribe=============>");
        await notify.unsubscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0200 unsubscribe=============>");
        done();
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0200 done=============>");
        }, time);
    })

    function onConnecteThree() {
        console.debug("=======Ans_UnSubscriber_0300 onConnecteThree=================>");
    }
    function onDisconnectThree() {
        console.debug("=======Ans_UnSubscriber_0300 onDisconnectThree=================>");
        expect().assertFail();
    }
    function unSubscribeCallbackThree(err){
        console.debug("Ans_UnSubscriber_0300 unSubscribeCallbackThree err.code=================>"+err.code);
        expect(err.code).assertNotEqual(0);
    }

    /*
     * @tc.number: Ans_UnSubscriber_0300
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify the use of the wrong subscriber to unsubscribe(callback)
     */
    it('Ans_UnSubscriber_0300', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0300 start=============>");
        var subscriber ={
            onConnect:onConnecteThree,
            onDisconnect:onDisconnectThree
        }
        var subscriberErr ={
            onConnect:"",
            onDisconnect:""
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0300 subscribe=============>");
        await notify.unsubscribe(subscriberErr,unSubscribeCallbackThree);
        console.info("===========Ans_UnSubscriber_0300 unsubscribe=============>");
        done();
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0300 done=============>");
        }, time);
    })

    function onConnecteFour() {
        console.debug("=======Ans_UnSubscriber_0400 onConnecteFour=================>");
    }
    function onDisconnectFour() {
        console.debug("=======Ans_UnSubscriber_0400 onDisconnectFour=================>");
        expect().assertFail();
    }

    /*
     * @tc.number: Ans_UnSubscriber_0400
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber): Promise<void>;
     * @tc.desc: Verify the use of the wrong subscriber to unsubscribe(promise)
     */
    it('Ans_UnSubscriber_0400', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0400 start=============>");
        var subscriber ={
            onConnect:onConnecteFour,
            onDisconnect:onDisconnectFour
        }
        var subscriberErr ={
            onConnect:"",
            onDisconnect:""
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0400 subscribe=============>");
        notify.unsubscribe(subscriberErr).then().catch((err)=>{
            console.debug("=======Ans_UnSubscriber_0400 subscribe catch err=================>"+err.code);
            expect(err.code).assertEqual(67108867)
        });
        done();
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0400 done=============>");
        }, time);
    })

    function onConnecteFive() {
        console.debug("=======Ans_UnSubscriber_0500 onConnecteFive=================>");
    }
    function onDisconnectFive() {
        console.debug("=======Ans_UnSubscriber_0500 onDisconnectFive=================>");
        expect().assertFail();
    }
    function unSubscribeCallbackFive(err){
        console.debug("Ans_UnSubscriber_0500 unSubscribeCallbackFive err.code=================>"+err.code);
        expect(err.code).assertNotEqual(0);
    }
    function onConnecteTest() {
        console.debug("=======Ans_UnSubscriber_0500 onConnecteTest=================>");
        expect().assertFail();
    }
    function onDisconnectTest() {
        console.debug("=======Ans_UnSubscriber_0500 onDisconnectTest=================>");
        expect().assertFail();
    }

    /*
     * @tc.number: Ans_UnSubscriber_0500
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that inconsistent subscriber is used to unsubscribe(callback)
     */
    it('Ans_UnSubscriber_0500', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0500 start=============>");
        var subscriber ={
            onConnect:onConnecteFive,
            onDisconnect:onDisconnectFive
        }
        var subscriberTest ={
            onConnect:onConnecteTest,
            onDisconnect:onDisconnectTest
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0500 subscribe=============>");
        await notify.unsubscribe(subscriberTest,unSubscribeCallbackFive);
        console.info("===========Ans_UnSubscriber_0500 unsubscribe=============>");
        done();
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0500 done=============>");
        }, time);
    })

    function onConnecteSix() {
        console.debug("=======Ans_UnSubscriber_0600 onConnecteSix =================>");
    }
    function onDisconnectSix() {
        console.debug("=======Ans_UnSubscriber_0600 onDisconnectSix=================>");
        expect().assertFail();
    }
    function onConnecteTestTwo() {
        console.debug("=======Ans_UnSubscriber_0600 onConnecteTestTwo=================>");
        expect().assertFail();
    }
    function onDisconnectTestTwo() {
        console.debug("=======Ans_UnSubscriber_0600 onDisconnectTestTwo=================>");
        expect().assertFail();
    }

    /*
     * @tc.number: Ans_UnSubscriber_0600
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber): Promise<void>;
     * @tc.desc: Verify that inconsistent subscriber is used to unsubscribe(promise)
     */
    it('Ans_UnSubscriber_0600', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0600 start=============>");
        var subscriber ={
            onConnect:onConnecteSix,
            onDisconnect:onDisconnectSix
        }
        var subscriberTest ={
            onConnect:onConnecteTestTwo,
            onDisconnect:onDisconnectTestTwo
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0600 subscribe=============>");
        notify.unsubscribe(subscriberTest).then().catch((err)=>{
            console.debug("=======Ans_UnSubscriber_0600 unsubscribe catch err=================>"+err.code);
            expect(err.code).assertNotEqual(0)
        });
        done();
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0600 done=============>");
        }, time);
    })

    function onConnecteSeven() {
        console.debug("=======Ans_UnSubscriber_0700 onConnecteSeven=================>");
    }
    var timesOfOnDis
    function onDisconnectSeven() {
        console.debug("=======Ans_UnSubscriber_0700 onDisconnectSeven=================>");
        timesOfOnDis ++;
        if(timesOfOnDis == 2){
            expect().assertFail();
        }
    }
    function unSubscribeCallbackSevenFirst(err){
        console.debug("Ans_UnSubscriber_0700 unSubscribeCallbackSevenFirst err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function unSubscribeCallbackSevenSecond(err){
        console.debug("Ans_UnSubscriber_0700 unSubscribeCallbackSevenSecond err.code=================>"+err.code);
        expect(err.code).assertNotEqual(0);
    }

    /*
     * @tc.number: Ans_UnSubscriber_0700
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber, callback: AsyncCallback<void>): void;
     * @tc.desc:Verification: After the subscription is successful, unsubscribe twice in a row.(callback)
     */
    it('Ans_UnSubscriber_0700', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0700 start=============>");

        timesOfOnDis = 0
        var subscriber ={
            onConnect:onConnecteSeven,
            onDisconnect:onDisconnectSeven
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0700 subscribe=============>");
        await notify.unsubscribe(subscriber, unSubscribeCallbackSevenFirst);
        console.info("===========Ans_UnSubscriber_0700 unsubscribe first end=============>");
        await notify.unsubscribe(subscriber, unSubscribeCallbackSevenSecond);
        console.info("===========Ans_UnSubscriber_0700 unsubscribe second end=============>");
        done();
        setTimeout(function(){
            console.info("===========Ans_UnSubscriber_0700 done=============>");
        }, time);
    })

    function onConnecteEight() {
        console.debug("=======Ans_UnSubscriber_0800 onConnecteEight=================>");
    }
    var timesOfOnDisTwo
    function onDisconnectEight() {
        console.debug("=======Ans_UnSubscriber_0800 onDisconnectEight err.code=================>");
        timesOfOnDisTwo ++;
        if(timesOfOnDisTwo == 2){
            expect().assertFail();
        }
    }

    /*
     * @tc.number: Ans_UnSubscriber_0800
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber): Promise<void>;
     * @tc.desc: Verification: After the subscription is successful, unsubscribe twice in a row.(promise)
     */
    it('Ans_UnSubscriber_0800', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0800 start=============>");
        timesOfOnDisTwo = 0
        var subscriber ={
            onConnect:onConnecteEight,
            onDisconnect:onDisconnectEight
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0800 subscribe=============>");
        notify.unsubscribe(subscriber).then((err)=>{
            console.debug("=======Ans_UnSubscriber_0800 subscribe first then err=================>"+err.code);
        }).catch((err)=>{
            console.debug("=======Ans_UnSubscriber_0800 subscribe first catch err=================>"+err.code);
        });
        notify.unsubscribe(subscriber).then((err)=>{
            console.debug("=======Ans_UnSubscriber_0800 subscribe second then err=================>"+err.code);
        }).catch((err)=>{
            console.debug("=======Ans_UnSubscriber_0800 subscribe second catch err=================>"+err.code);
            expect(err.code).assertNotEqual(0)
        });
        done();
        setTimeout(function(){
            console.info("===========Ans_UnSubscriber_0800 done=============>");
        }, time);
    })

    function onDisconnectTestNine() {
        console.debug("=======Ans_UnSubscriber_0900 onDisconnectTestNine =================>");
        expect().assertFail();
    }
    function subscribeCallbackNine(err){
        console.debug("Ans_UnSubscriber_0900 subscribeCallbackNine err.code=================>"+err.code);
        expect(err.code).assertNotEqual(0);
    }
    function unSubscribeCallbackNine(err){
        console.debug("Ans_UnSubscriber_0900 unSubscribeCallbackNine err.code=================>"+err.code);
        expect(err.code).assertNotEqual(0);
    }

    /*
     * @tc.number: Ans_UnSubscriber_0900
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that after the subscribe fails, the unsubscribe fails(callback)
     */
    it('Ans_UnSubscriber_0900', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0900 start=============>");
        var subscriber ={
            onConnect:"",
            onDisconnect:onDisconnectTestNine
        }
        await notify.subscribe(subscriber, subscribeCallbackNine);
        notify.unsubscribe(subscriber, unSubscribeCallbackNine);
        done();
        setTimeout(function(){
            console.info("===========Ans_UnSubscriber_0900 done=============>");
        }, time);
    })

    function onDisconnectTestTen() {
        console.debug("=======Ans_UnSubscriber_1000 onDisconnectTestTen =================>");
        expect().assertFail();
    }
    function subscribeCallbackTen(err){
        console.debug("Ans_UnSubscriber_1000 subscribeCallbackTen err.code=================>"+err.code);
        expect(err.code).assertNotEqual(0);
    }
    /*
     * @tc.number: Ans_UnSubscriber_1000
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber): Promise<void>;
     * @tc.desc: Verify that after the subscribe fails, the unsubscribe fails(promise)
     */
    it('Ans_UnSubscriber_1000', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_1000 start=============>");
        var subscriber = {
            onConnect:"",
            onDisconnect:onDisconnectTestTen
        }
        await notify.subscribe(subscriber, subscribeCallbackTen);
        console.info("===========Ans_UnSubscriber_1000 subscribe end=============>");
        notify.unsubscribe(subscriber).then((err)=>{
            console.debug("=======Ans_UnSubscriber_1000 subscribe then err=================>"+err.code);
        }).catch((err)=>{
            console.debug("=======Ans_UnSubscriber_1000 subscribe catch err=================>"+err.code);
            expect(err.code).assertNotEqual(0)
        });
        done();
        setTimeout(function(){
            console.info("===========Ans_UnSubscriber_1000 done=============>");
        }, time);
    })

    function onConnecteEleven() {
        console.debug("============Ans_UnSubscriber_1100 onConnecteEleven=================>");
    }
    function onDisconnectEleven() {
        console.debug("============Ans_UnSubscriber_1100 onDisconnectEleven=================>");
        expect().assertFail();
    }
    function unSubscribeCallbackEleven(err){
        console.debug("Ans_UnSubscriber_1100 unSubscribeCallbackEleven err.code=================>"+err.code);
        expect(err.code).assertNotEqual(0);
    }

    /*
     * @tc.number: Ans_UnSubscriber_1100
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify: After the subscription with anonymous Subscribers is successful,
                 unsubscribing with anonymous subscribers will fail(callback)
     */
    it('Ans_UnSubscriber_1100', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_1100 start=============>");
        await notify.subscribe({
            onConnect:onConnecteEleven,
            onDisconnect:onDisconnectEleven
        });
        notify.unsubscribe(
            {
                onConnect:onConnecteOne,
                onDisconnect:onDisconnectOne
            },
            (err)=>{
                console.debug("Ans_UnSubscriber_1100 unSubscribeCallbackEleven err.code=================>"+err.code);
                expect(err.code).assertNotEqual(0);
            });
        done();
        setTimeout(function(){
            console.info("===========Ans_UnSubscriber_1100 done=============>");
        }, time);
    })

    function onConnecteTwelve() {
        console.debug("============Ans_UnSubscriber_1200 onConnecteTwelve=================>");
    }
    function onDisconnectTwelve() {
        console.debug("============Ans_UnSubscriber_1200 onDisconnectTwelve=================>");
        expect().assertFail();
    }

    /*
     * @tc.number: Ans_UnSubscriber_1200
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber): Promise<void>;
     * @tc.desc: Verify: After the subscription with anonymous Subscribers is successful,
                 unsubscribing with anonymous subscribers will fail(promise)
     */
    it('Ans_UnSubscriber_1200', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_1200 start=============>");
        await notify.subscribe({
            onConnect:onConnecteTwelve,
            onDisconnect:onConnecteTwelve
        });
        notify.unsubscribe({
                onConnect:onConnecteTwelve,
                onDisconnect:onDisconnectTwelve
        }).then((err)=>{
            console.info("===========Ans_UnSubscriber_1200 unsubscribe then err=============>"+err);
        }).catch((err)=>{
            console.info("===========Ans_UnSubscriber_1200 unsubscribe catch err=============>"+err);
            expect(err.code).assertNotEqual(0)
        });
        done();
        setTimeout(function(){
            console.info("===========Ans_UnSubscriber_1200 done=============>");
        }, time);
    });
})

