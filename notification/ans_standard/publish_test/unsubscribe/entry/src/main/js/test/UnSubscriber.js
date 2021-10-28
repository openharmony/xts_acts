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
    console.debug("===============ActsAnsUnSubscriberTest=================>");
    function unSubscribeCallbackOne(err) {
        console.debug("===========Ans_UnSubscriber_0100 unSubscribeCallbackOne err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function onConnecteOne(err) {
        expect(err.code).assertEqual(0)
        console.debug("===============Ans_UnSubscriber_0100 onConnecte err.code=================>"+err.code);
    }
    function onDisconnectOne(err) {
        expect(err.code).assertEqual(0)
        console.debug("===============Ans_UnSubscriber_0100 onDisconnect err.code=================>"+err.code);
    }

    /*
     * @tc.number: Ans_UnSubscriber_0100
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the subscription can be successfully unsubscribed(callback)
     */
    it('Ans_UnSubscriber_0100', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0100 start=============>");
        var subscriber ={
            onConnect:onConnecteOne,
            onDisconnect:onDisconnectOne
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0100 subscribe=============>");
        await notify.unsubscribe(subscriber, unSubscribeCallbackOne);
        console.info("===========Ans_UnSubscriber_0100 unsubscribe=============>");
        done();
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0100 done=============>");
        }, time);
    })

    function onConnecteTwo(err) {
        console.debug("============Ans_UnSubscriber_0200 onConnecteTwo err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function onDisconnectTwo(err) {
        console.debug("============Ans_UnSubscriber_0200 onDisconnectTwo err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
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

    function onConnecteThree(err) {
        console.debug("=======Ans_UnSubscriber_0300 onConnecteThree err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function onDisconnectThree(err) {
        console.debug("=======Ans_UnSubscriber_0300 onDisconnectThree err.code=================>"+err.code);
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

    function onConnecteFour(err) {
        console.debug("=======Ans_UnSubscriber_0400 onConnecteFour err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function onDisconnectFour(err) {
        console.debug("=======Ans_UnSubscriber_0400 onDisconnectFour err.code=================>"+err.code);
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
        await notify.unsubscribe(subscriberErr);
        console.info("===========Ans_UnSubscriber_0400 unsubscribe=============>");
        done();
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0400 done=============>");
        }, time);
    })

    function onConnecteFive(err) {
        console.debug("=======Ans_UnSubscriber_0500 onConnecteFive err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function onDisconnectFive(err) {
        console.debug("=======Ans_UnSubscriber_0500 onDisconnectFive err.code=================>"+err.code);
        expect().assertFail();
    }
    function unSubscribeCallbackFive(err){
        console.debug("Ans_UnSubscriber_0500 unSubscribeCallbackFive err.code=================>"+err.code);
        expect(err.code).assertNotEqual(0);
    }
    function onConnecteTest(err) {
        console.debug("=======Ans_UnSubscriber_0500 onConnecteTest err.code=================>"+err.code);
        expect().assertFail();
    }
    function onDisconnectTest(err) {
        console.debug("=======Ans_UnSubscriber_0500 onDisconnectTest err.code=================>"+err.code);
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

    function onConnecteSix(err) {
        console.debug("=======Ans_UnSubscriber_0600 onConnecteSix err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function onDisconnectSix(err) {
        console.debug("=======Ans_UnSubscriber_0600 onDisconnectSix err.code=================>"+err.code);
        expect().assertFail();
    }
    function onConnecteTestTwo(err) {
        console.debug("=======Ans_UnSubscriber_0600 onConnecteTestTwo err.code=================>"+err.code);
        expect().assertFail();
    }
    function onDisconnectTestTwo(err) {
        console.debug("=======Ans_UnSubscriber_0600 onDisconnectTestTwo err.code=================>"+err.code);
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
        await notify.unsubscribe(subscriberTest);
        console.info("===========Ans_UnSubscriber_0600 unsubscribe=============>");
        done();
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0600 done=============>");
        }, time);
    })

    function onConnecteSeven(err) {
        console.debug("=======Ans_UnSubscriber_0700 onConnecteSeven err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    var timesOfOnDis
    function onDisconnectSeven(err) {
        console.debug("=======Ans_UnSubscriber_0700 onDisconnectSeven err.code=================>"+err.code);
        timesOfOnDis ++;
        if (timesOfOnDis == 1){
            expect(err.code).assertEqual(0)
        }else if(timesOfOnDis == 2){
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

    function onConnecteEight(err) {
        console.debug("=======Ans_UnSubscriber_0800 onConnecteEight err.code=================>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function onDisconnectEight(err) {
        console.debug("=======Ans_UnSubscriber_0800 onDisconnectEight err.code=================>"+err.code);
        timesOfOnDis ++;
        if (timesOfOnDis == 1){
            expect(err.code).assertEqual(0)
        }else if(timesOfOnDis == 2){
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
        timesOfOnDis = 0
        var subscriber ={
            onConnect:onConnecteEight,
            onDisconnect:onDisconnectEight
        }
        await notify.subscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0800 subscribe=============>");
        await notify.unsubscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0800 unsubscribe first=============>");
        await notify.unsubscribe(subscriber);
        console.info("===========Ans_UnSubscriber_0800 unsubscribe second=============>");
        done();
        setTimeout(function(){
            console.info("===========Ans_UnSubscriber_0800 done=============>");
        }, time);
    })

    function onDisconnectTestNine(err) {
        console.debug("=======Ans_UnSubscriber_0900 onDisconnectTestNine err.code=================>"+err.code);
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

    function onDisconnectTestTen(err) {
        console.debug("=======Ans_UnSubscriber_1000 onDisconnectTestTen err.code=================>"+err.code);
        expect().assertFail();
    }
    function subscribeCallbackTen(err){
        console.debug("Ans_UnSubscriber_1000 subscribeCallbackNine err.code=================>"+err.code);
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
        await notify.unsubscribe(subscriber);
        done();
        setTimeout(function(){
            console.info("===========Ans_UnSubscriber_1000 done=============>");
        }, time);
    })
})

