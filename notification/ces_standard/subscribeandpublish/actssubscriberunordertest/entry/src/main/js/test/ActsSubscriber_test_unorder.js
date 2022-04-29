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
import Subscriber from '@ohos.commonevent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsSubscriberTestUnorder', async function (done) {
    console.info("===========ActsSubscriberTestUnorder start====================>");
    var commonEventSubscriber001;
    var commonEventSubscriber002;
    var commonEventSubscriber003;
    var commonEventSubscriber004;
    var commonEventSubscriber0051;
    var commonEventSubscriber0052;
    var commonEventSubscriber006;
    var commonEventSubscriber008;
    var commonEventSubscriber0101;
    var commonEventSubscriber0102;
    var commonEventSubscriber011;
    var commonEventSubscriber012;

    function publishCallback(err) {
        console.info("==========================>publishCallback");
    }

    function publishCallback10001(err) {
        console.info("==========================>publishCallback");
    }

    function publishCallback10002(err) {
        console.info("==========================>publishCallback");
    }

    function unsubscriberCallBack(err) {
        console.info("==========================>unsubscriberCallBack");
    }

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0100
     * @tc.name      : verify subscribe and publish : Check subscribe and publish common event data
     * @tc.desc      : Check the subscriber can receive event "publish_event0100" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0100', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0100=============================>");
        function subscriberCallBack001(err, data) {
            console.info("==========================>subscriberCallBack001");
            expect(data.event).assertEqual("publish_event0100");
            expect(data.bundleName).assertEqual("");
            expect(data.code).assertEqual(0);
            expect(data.data).assertEqual("");
            done();
        }

        var commonEventSubscribeInfo = {
            events: ["publish_event0100"],
        };

        Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then((data)=>{
            console.info("===============ActsSubscriberTestUnorder_0100=========createSubscriber promise");
            commonEventSubscriber001 = data;
            data.getSubscribeInfo().then(()=>{
                console.info("===============ActsSubscriberTestUnorder_0100=========getSubscribeInfo promise");
                Subscriber.subscribe(commonEventSubscriber001, subscriberCallBack001);
                setTimeout(function (){
                    console.info("==========ActsSubscriberTestUnorder_0100 publish start============");
                    Subscriber.publish("publish_event0100", publishCallback);
                }, 1000);
            });
        })
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0200
     * @tc.name      : verify subscribe and publish : Check subscribe and publish common event data
     *                 of containing special characters
     * @tc.desc      : Check the subscriber can receive event "@#￥#3243adsafdf_" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0200', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0200==========================>");

        function subscriberCallBack002(err, data) {
            console.info("==========================>subscriberCallBack002");
            expect(data.event).assertEqual("@#￥#3243adsafdf_");
            expect(data.bundleName).assertEqual("");
            expect(data.code).assertEqual(0);
            expect(data.data).assertEqual("");
            done();
        }

        var commonEventSubscribeInfo = {
            events: ["@#￥#3243adsafdf_"],
        };

        Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then((data)=>{
            console.info("===============ActsSubscriberTestUnorder_0200=========createSubscriber promise");
            commonEventSubscriber002 = data;
            data.getSubscribeInfo().then(()=>{
                console.info("===============ActsSubscriberTestUnorder_0200=========getSubscribeInfo promise");
                Subscriber.subscribe(commonEventSubscriber002, subscriberCallBack002);
                setTimeout(function (){
                    console.info("==========ActsSubscriberTestUnorder_0200 publish start============");
                    Subscriber.publish("@#￥#3243adsafdf_", publishCallback);
                }, 1000);
            });
        })
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0300
     * @tc.name      : verify subscribe and publish : Check subscribe and publish common event data
     *                 with publishInfo data
     * @tc.desc      : Check the subscriber can receive event "publish_event0300" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0300', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0300==========================>");
        var commonEventSubscribeInfo = {
            events: ["publish_event0300"],
            publisherDeviceId: "PublishDeviceId0300",
            priority: 10,
        };

        var commonEventPublishData = {
            isOrdered: false,
            bundleName: "PublishBundleName0300",
            code: 55,
            data: "PublishData0300",
        }

        function isOrderedCommonEventCallback003(err, data) {
            console.info("==========================>isOrderedCommonEventCallback003");
            expect(data).assertEqual(false);
            done();
        }

        function subscriberCallBack003(err, data) {
            console.info("==========================>subscriberCallBack003");
            expect(data.event).assertEqual("publish_event0300");
            expect(data.bundleName).assertEqual("PublishBundleName0300");
            expect(data.code).assertEqual(55);
            expect(data.data).assertEqual("PublishData0300");
            commonEventSubscriber003.isOrderedCommonEvent(isOrderedCommonEventCallback003);
        }

        Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then((data)=>{
            console.info("===============ActsSubscriberTestUnorder_0300=========createSubscriber promise");
            commonEventSubscriber003 = data;
            data.getSubscribeInfo().then(()=>{
                console.info("===============ActsSubscriberTestUnorder_0300=========getSubscribeInfo promise");
                Subscriber.subscribe(commonEventSubscriber003, subscriberCallBack003);
                setTimeout(function (){
                    console.info("==========ActsSubscriberTestUnorder_0300 publish start============");
                    Subscriber.publish("publish_event0300", commonEventPublishData, publishCallback);
                }, 1000);
            });
        })
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0500
     * @tc.name      : verify subscribe and publish : Check the two different subscribe and one publish,
     *                 and check unsubscribe event
     * @tc.desc      : Check the subscriber can receive event "publish_event0500" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0500', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0500==========================>");
        var commonEventSubscribeInfo = {
            events: ["publish_event0500"]
        };

        var commonEventPublishData = {
            isOrdered: false,
            isSticky: false,
        }

        function subscriberCallBack005(err, data) {
            console.info("==========================>subscriberCallBack0500");
            expect(data.event).assertEqual("publish_event0500");
            expect(data.bundleName).assertEqual("");
            expect(data.code).assertEqual(0);
            expect(data.data).assertEqual("");
            done();
        }

        Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then((data)=>{
            console.info("===============ActsSubscriberTestUnorder_0500_1=========createSubscriber promise");
            commonEventSubscriber0051 = data;
            data.getSubscribeInfo().then(()=>{
                console.info("===============ActsSubscriberTestUnorder_0500_1=========getSubscribeInfo promise");
                Subscriber.subscribe(commonEventSubscriber0051, subscriberCallBack005);
            });
        })

        Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then((data)=>{
            console.info("===============ActsSubscriberTestUnorder_0500_2=========createSubscriber promise");
            commonEventSubscriber0052 = data;
            data.getSubscribeInfo().then(()=>{
                console.info("===============ActsSubscriberTestUnorder_0500_2=========getSubscribeInfo promise");
                Subscriber.subscribe(commonEventSubscriber0052, subscriberCallBack005);
                Subscriber.unsubscribe(commonEventSubscriber0051, unsubscriberCallBack);
                setTimeout(function (){
                    console.info("==========ActsSubscriberTestUnorder_0500 publish start============");
                    Subscriber.publish("publish_event0500", commonEventPublishData, publishCallback);
                }, 1000);
            });
        })
    })
})

