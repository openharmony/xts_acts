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
describe('ActsAnsSubscriberTest', function () {
    console.info("==ActsAnsSubscriberTest start==>");
    //ActsSubscriber_test_0100
    var subInfoa ={
        onConsume:consumeCallbackc,
        onConnect:connectCallbacka,
    }
    function consumeCallbackc(err,data) {
        console.debug("==>consumeCallbackc data : ==>" +err+ JSON.stringify(data));
        checkConsumeData(data)
        notify.unsubscribe(subInfoa, unSubscribeCallbacka);
    }
    function connectCallbacka(err) {
        console.debug("==>connectCallbacka code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbacka(err) {
        console.debug("==>subscribeCallbacka code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbacka(err){
        console.debug("==>unSubscribeCallbacka code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_0200
    function connectCallbackb(err) {
        console.debug("==>connectCallbackb code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackb(err) {
        console.debug("==>subscribeCallbackb code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackc(err) {
        console.debug("==>subscribeCallbackc code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackb(err){
        console.debug("==>unSubscribeCallbackb code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_0300
    function connectCallbackc(err) {
        console.debug("==>connectCallbackc code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function connectCallbackd(err) {
        console.debug("==>connectCallbackd code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackd(err) {
        console.debug("==>subscribeCallbackd code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbacke(err) {
        console.debug("==>subscribeCallbacke code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackc(err){
        console.debug("==>unSubscribeCallbackc code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackd(err){
        console.debug("==>unSubscribeCallbackd code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_0400
    function connectCallbacke(err) {
        console.debug("==>connectCallbacke code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackf(err) {
        console.debug("==>subscribeCallbackf code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbacke(err){
        console.debug("==>unSubscribeCallbacke code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_0500
    function connectCallbackf(err) {
        console.debug("==>connectCallbackf code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function connectCallbackg(err) {
        console.debug("==>connectCallbackg code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function connectCallbackh(err) {
        console.debug("==>connectCallbackh code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackg(err) {
        console.debug("==>subscribeCallbackg code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackh(err) {
        console.debug("==>subscribeCallbackh code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbacki(err) {
        console.debug("==>subscribeCallbacki code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackj(err) {
        console.debug("==>subscribeCallbackj code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackf(err){
        console.debug("==>unSubscribeCallbackf code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackg(err){
        console.debug("==>unSubscribeCallbackg code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackh(err){
        console.debug("==>unSubscribeCallbackh code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_0600
    var subInfob = {
        onConsume:consumeCallbacka,
        onConnect:connectCallbacki,
    }
    function consumeCallbacka(err,data) {
        console.debug("==>consumeCallbacka data : ==>" +err+ JSON.stringify(data));
        checkConsumeData(data)
        notify.unsubscribe(subInfob, unSubscribeCallbacki);
    }
    function connectCallbacki(err) {
        console.debug("==>connectCallbacki code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackl(err) {
        console.debug("==>subscribeCallbackl code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbacki(err){
        console.debug("==>unSubscribeCallbacki code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_0700
    var subInfoc ={
        onConsume:consumeCallbackb,
        onConnecte:connectCallbackj,
    }
    function consumeCallbackb(err,data) {
        console.debug("==>consumeCallbackb data : ==>" +err+ JSON.stringify(data));
        checkConsumeData(data)
        notify.unsubscribe(subInfoc, unSubscribeCallbackj);
    }
    function connectCallbackj(err) {
        console.debug("==>connectCallbackj code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackj(err){
        console.debug("==>unSubscribeCallbackj code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_0800
    var subInfod ={
        onConsume:consumeCallbackd,
        onConnect:connectCallbackm,
    }
    function consumeCallbackd(err,data) {
        console.debug("==>consumeCallbackd data : ==>" +err+ JSON.stringify(data));
        checkConsumeData(data)
        notify.unsubscribe(subInfod, unSubscribeCallbackl);
    }
    function connectCallbackm(err) {
        console.debug("==>connectCallbackm code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbackn(err) {
        console.debug("==>subscribeCallbackn code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackl(err){
        console.debug("==>unSubscribeCallbackl code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_0900
    var subInfoe ={
        onConsume:consumeCallbacke,
        onConnect:connectCallbackn,
    }
    function consumeCallbacke(err,data) {
        console.debug("==>consumeCallbacke data : ==>" +err+ JSON.stringify(data));
        checkConsumeData(data)
        notify.unsubscribe(subInfoe, unSubscribeCallbackm);
    }
    function connectCallbackn(err) {
        console.debug("==>connectCallbackn code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackm(err){
        console.debug("==>unSubscribeCallbackm code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    //ActsSubscriber_test_1400
    function connectCallbackl(err){
        console.debug("==>connectCallbackl code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function subscribeCallbacko(err){
        console.debug("==>subscribeCallbacko code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackn(err){
        console.debug("==>unSubscribeCallbackn code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function checkConsumeData(data){
        expect(data.request.id).assertEqual(1);
        expect(data.request.content.contentType).assertEqual(0);
        expect(data.request.content.normal.title).assertEqual("test1_title");
        expect(data.request.content.normal.text).assertEqual("test1_text");
        expect(data.request.content.normal.additionalText).assertEqual("test1_additionalText");
        expect(data.request.slotType).assertEqual(65535);
        expect(data.request.isOngoing).assertEqual(true);
        expect(data.request.isUnremovable).assertEqual(false);
        expect(data.request.deliveryTime).assertEqual(1624950453);
        expect(data.request.tapDismissed).assertEqual(true);
        expect(data.request.autoDeletedTime).assertEqual(1625036817);
        expect(data.request.color).assertEqual(2);
        expect(data.request.colorEnabled).assertEqual(true);
        expect(data.request.isAlertOnce).assertEqual(true);
        expect(data.request.isStopwatch).assertEqual(true);
        expect(data.request.isCountDown).assertEqual(true);
        expect(data.request.progressValue).assertEqual(12);
        expect(data.request.progressMaxValue).assertEqual(100);
        expect(data.request.isIndeterminate).assertEqual(true);
        expect(data.request.statusBarText).assertEqual("statusBarText");
        expect(data.request.isFloatingIcon).assertEqual(true);
        expect(data.request.label).assertEqual("0100_1");
        expect(data.request.badgeIconStyle).assertEqual(1);
        expect(data.request.showDeliveryTime).assertEqual(true);
    }

    /*
     * @tc.number: ActsSubscriber_test_0100
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0100', 0, async function (done) {
        console.debug("==ActsSubscriber_test_0100==begin==>");
        await notify.subscribe(subInfoa, subscribeCallbacka);
        console.debug("==ActsSubscriber_test_0100==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_0100====>");
        }, time);
    })

    /*
     * @tc.number: ActsSubscriber_test_0200
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0200', 0, async function (done) {
        console.debug("==ActsSubscriber_test_0200==begin==>");
        var subInfo ={
            onConnect:connectCallbackb,
        }
        await notify.subscribe(subInfo,subscribeCallbackb);
        await notify.subscribe(subInfo,subscribeCallbackc);
        await notify.unsubscribe(subInfo, unSubscribeCallbackb);
        console.debug("==ActsSubscriber_test_0200==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_0200====>");
        }, time);
    })

    /*
     * @tc.number: ActsSubscriber_test_0300
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0300', 0, async function (done) {
        console.debug("==ActsSubscriber_test_0300==begin==>");

        var subInfo ={
            onConnect:connectCallbackc,
        }
        var subInfo2 ={
            onConnect:connectCallbackd,
        }
        await notify.subscribe(subInfo,subscribeCallbackd);
        await notify.subscribe(subInfo2,subscribeCallbacke);
        await notify.unsubscribe(subInfo, unSubscribeCallbackc);
        await notify.unsubscribe(subInfo2, unSubscribeCallbackd);
        console.debug("==ActsSubscriber_test_0300==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_0300====>");
        }, time);
    })

    /*
     * @tc.number: ActsSubscriber_test_0400
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0400', 0, async function (done) {
        console.debug("==ActsSubscriber_test_0400==begin==>");
        await notify.subscribe({
                onConnect:connectCallbacke,
            },subscribeCallbackf);
        await notify.unsubscribe({
            onConnect:connectCallbacke,
        }, unSubscribeCallbacke);
        console.debug("==ActsSubscriber_test_0400==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_0400====>");
        }, time);
    })

    /*
     * @tc.number: ActsSubscriber_test_0500
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0500', 0, async function (done) {
        console.debug("==ActsSubscriber_test_0500==begin==>");

        var subInfo ={
            onConnect:connectCallbackf,
        }
        var subInfo2 ={
            onConnect:connectCallbackg,
        }
            await notify.subscribe(subInfo,subscribeCallbackg);
            await notify.subscribe(subInfo,subscribeCallbackh);
            await notify.subscribe(subInfo2,subscribeCallbacki);
            await notify.subscribe({
                onConnect:connectCallbackh,
            },subscribeCallbackj);

        await notify.unsubscribe(subInfo, unSubscribeCallbackf);
        await notify.unsubscribe(subInfo2, unSubscribeCallbackg);
        await notify.unsubscribe({
            onConnect:connectCallbackh,
        }, unSubscribeCallbackh);
        console.debug("==ActsSubscriber_test_0500==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_0500====>");
        }, time);
    })

    /*
     * @tc.number: ActsSubscriber_test_0600
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0600', 0, async function (done) {
        console.debug("==ActsSubscriber_test_0600==begin==>");
        await notify.subscribe(subInfob, {bundleNames:["com.example.actsanspublishtest"]},subscribeCallbackl);
        console.debug("==ActsSubscriber_test_0600==end3==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_0600====>");
        }, time);
    })

    /*
     * @tc.number: ActsSubscriber_test_0700
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0700', 0, async function (done) {
        console.debug("==ActsSubscriber_test_0700==begin==>");
        await notify.subscribe(subInfoc, {bundleNames:["com.example.actsanspublishtest"]}).then(
                console.log("ActsSubscriber_test_0700=======promise")
            );
        console.debug("==ActsSubscriber_test_0700==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_0700====>");
        }, time);
    })

    /*
     * @tc.number: ActsSubscriber_test_0800
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0800', 0, async function (done) {
        console.debug("==ActsSubscriber_test_1000==begin==>");
        await notify.subscribe(subInfod, {bundleNames:["com.example.actsanspublishtest","com.example.actsanspublishtest"]},subscribeCallbackn);
        console.debug("==ActsSubscriber_test_9000==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_9000====>");
        }, time);
    })

    /*
     * @tc.number: ActsSubscriber_test_0900
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_0900', 0, async function (done) {
        console.debug("==ActsSubscriber_test_1000==begin==>");
        await notify.subscribe(subInfoe, {bundleNames:["com.example.actsanspublishtest","com.example.actsanspublishtest"]}).then(
                console.log("ActsSubscriber_test_1100=======promise")
            );
        console.debug("==ActsSubscriber_test_1000==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_1000====>");
        }, time);
    })
    /*
     * @tc.number: ActsSubscriber_test_1000
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_1000', 0, async function (done) {
        console.debug("==ActsSubscriber_test_1100==begin==>");
        var promise = notify.subscribe(100,{bundleNames:["com.example.actsanspublishtest"]});
        expect(promise).assertEqual(undefined);
        console.debug("==ActsSubscriber_test_1100==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_1100====>");
        }, time);
    })
    /*
     * @tc.number: ActsSubscriber_test_1100
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_1100', 0, async function (done) {
        console.debug("==ActsSubscriber_test_1200==begin==>");
        var subInfo = null
        var promise = await notify.subscribe(subInfo,{bundleNames:["com.example.actsanspublishtest"]});
        expect(promise).assertEqual(undefined);
        console.debug("==ActsSubscriber_test_1200==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_1200====>");
        }, time);
    })
    /*
     * @tc.number: ActsSubscriber_test_1200
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_1200', 0, async function (done) {
        console.debug("==ActsSubscriber_test_1300==begin==>");
        var subInfo = "#$#%$%$^&%^%"
        var promise = notify.subscribe(subInfo,{bundleNames:["com.example.actsanspublishtest"]});
        expect(promise).assertEqual(undefined);
        console.debug("==ActsSubscriber_test_1300==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_1300====>");
        }, time);
    })
    /*
     * @tc.number: ActsSubscriber_test_1300
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_1300', 0, async function (done) {
        console.debug("==ActsSubscriber_test_1100==begin==>");
        var subInfo = ""
        var promise = await notify.subscribe(subInfo,{bundleNames:["com.example.actsanspublishtest"]});
        expect(promise).assertEqual(undefined);
        console.debug("==ActsSubscriber_test_1400==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_1400====>");
        }, time);
    })
    /*
     * @tc.number: ActsSubscriber_test_1400
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsSubscriber_test_1400', 0, async function (done) {
        console.debug("==ActsSubscriber_test_1100==begin==>");
        var subInfo ={
            onConnect:connectCallbackl,
        }
        await notify.subscribe(subInfo,{bundleNames:["wrongBudleName"]},subscribeCallbacko);
        await notify.unsubscribe(subInfo, unSubscribeCallbackn);
        console.debug("==ActsSubscriber_test_1400==end==>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsSubscriber_test_1400====>");
        }, time);
    })
})

