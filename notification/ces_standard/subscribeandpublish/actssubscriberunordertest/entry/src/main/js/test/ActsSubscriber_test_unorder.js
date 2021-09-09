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

describe('ActsSubscriberTestUnorder', function () {
    console.info("===========ActsSubscriberTestUnorder start====================>");
    var num = 0;
    var commonEventSubscriber;
    var commonEventSubscriber001;
    var commonEventSubscriber002;
    var commonEventSubscriber003;
    var commonEventSubscriber004;
    var commonEventSubscriber005;
    var commonEventSubscriber006;
    var commonEventSubscriber007;
    var commonEventSubscriber008;
    var commonEventSubscriber009;
    var commonEventSubscriber010;
    var commonEventSubscriber011;
    var commonEventSubscriber_1;
    var commonEventSubscriber_2;
    var commonEventSubscribeInfo;
    var commonEventPublishData_1;
    var commonEventPublishData_2;

    async function unsubscriber_()
    {
        await Subscriber.unsubscribe(commonEventSubscriber_1, unsubscriberCallBack);
    }

    //isOrderedCommonEventCallback004
    function isOrderedCommonEventCallback004(err, data) {
        console.info("==========================>isOrderedCommonEventCallback004");
        expect(data).assertEqual(false);
    }

    //isStickyCommonEventCallback005
    function isStickyCommonEventCallback005(err, data) {
        console.info("==========================>isStickyCommonEventCallback005 isSticky:"+ data);
        expect(data).assertEqual(true);
    }

    //isOrderedCommonEventCallback009
    function isOrderedCommonEventCallback009(err, data) {
        console.info("==========================>isOrderedCommonEventCallback009");
        expect(data).assertEqual(false);
    }

    //isStickyCommonEventCallback010
    function isStickyCommonEventCallback010(err, data) {
        console.info("==========================>isStickyCommonEventCallback010");
        expect(data).assertEqual(true);
    }

    function publishCallback(err) {
        console.info("==========================>publishCallback");
    }

    function publishCallback1100_1(err) {
        console.info("==========================>publishCallback");
    }

    function publishCallback1100_2(err) {
        console.info("==========================>publishCallback");
    }

    function unsubscriberCallBack(err) {
        console.info("==========================>unsubscriberCallBack");
    }

    function subscriberCallBack001(err, data) {
        console.info("==========================>subscriberCallBack001");
        expect(data.event).assertEqual("publish_event0100");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function subscriberCallBack002(err, data) {
        console.info("==========================>subscriberCallBack002");
        expect(data.event).assertEqual("@#￥#3243adsafdf_");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function subscriberCallBack003(err, data) {
        console.info("==========================>subscriberCallBack003");
        expect(data.event).assertEqual(Subscriber.Support.COMMON_EVENT_BATTERY_CHANGED);
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function subscriberCallBack004(err, data) {
        console.info("==========================>subscriberCallBack004");
        expect(data.event).assertEqual("publish_event0400");
        expect(data.bundleName).assertEqual("PublishBundleName0400");
        expect(data.code).assertEqual(55);
        expect(data.data).assertEqual("PublishData0400");
        commonEventSubscriber004.isOrderedCommonEvent(isOrderedCommonEventCallback004);
    }

    function subscriberCallBack005(err, data) {
        console.info("==========================>subscriberCallBack0500");
        expect(data.event).assertEqual("publish_event0500");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
        commonEventSubscriber005.isStickyCommonEvent(isStickyCommonEventCallback005);
    }

    function subscriberCallBack006(err, data) {
        console.info("==========================>subscriberCallBack0600");
        expect(data.event).assertEqual("publish_event0600");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function subscriberCallBack007(err, data) {
        console.info("==========================>subscriberCallBack0700");
        expect(data.event).assertEqual("publish_event0700");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function subscriberCallBack008(err, data) {
        console.info("==========================>subscriberCallBack0800");
        expect(data.event).assertEqual("publish_event0800");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function subscriberCallBack009(err, data) {
        console.info("==========================>subscriberCallBack0900");
        expect(data.event).assertEqual("publish_event0900");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
        commonEventSubscriber009.isOrderedCommonEvent(isOrderedCommonEventCallback009);
    }

    function subscriberCallBack010(err, data) {
        console.info("==========================>subscriberCallBack1000");
        expect(data.event).assertEqual("publish_event1000");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
        commonEventSubscriber010.isStickyCommonEvent(isStickyCommonEventCallback010);
    }

    async function subscriberCallBack011_1(err, data) {
        console.info("==========================>subscriberCallBack011_1");
        console.info("==========================>subscriberCallBack011_1 event:"+data.event);
        console.info("==========================>subscriberCallBack011_1 bundleName:"+data.bundleName);
        expect(data.event).assertEqual("publish_event1100_1");
        expect(data.bundleName).assertEqual("publish_event1100_bundleName1");
        expect(data.code).assertEqual(3);
        expect(data.data).assertEqual("publish_event1100_data");
        await commonEventSubscriber011.FinishCommonEvent();
    }

    function subscriberCallBack011_2(err, data) {
        console.info("==========================>subscriberCallBack011_2");
        console.info("==========================>subscriberCallBack011_2 event:"+data.event);
        console.info("==========================>subscriberCallBack011_2 bundleName:"+data.bundleName);
        expect(data.event).assertEqual("publish_event1100_2");
        expect(data.bundleName).assertEqual("publish_event1100_bundleName2");
        expect(data.code).assertEqual(5);
        expect(data.data).assertEqual("publish_event1100_data");
    }

    async function getSubscribeInfoCallBack(data) {
        console.info("==========================>getSubscribeInfoCallBack event = " + data.events[0]);
        switch (data.events[0]) {
            case "publish_event0100":
                expect(data.events[0]).assertEqual("publish_event0100");
                commonEventSubscriber001 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber001, subscriberCallBack001);
                break;
            case "@#￥#3243adsafdf_":
                expect(data.events[0]).assertEqual("@#￥#3243adsafdf_");
                commonEventSubscriber002 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber002, subscriberCallBack002);
                break;
            case Subscriber.Support.COMMON_EVENT_BATTERY_CHANGED:
                expect(data.events[0]).assertEqual("usual.event.BATTERY_CHANGED");
                commonEventSubscriber003 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber003, subscriberCallBack003);
                break;
            case "publish_event0400":
                expect(data.events[0]).assertEqual("publish_event0400");
                expect(data.publisherDeviceId).assertEqual("PublishDeviceId0400");
                expect(data.priority).assertEqual(10);
                commonEventSubscriber004 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber004, subscriberCallBack004);
                break;
            case "publish_event0500":
                expect(data.events[0]).assertEqual("publish_event0500");
                commonEventSubscriber005 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber005, subscriberCallBack005);
                break;
            case "publish_event0600":
                console.info("=====ActsSubscriberTestUnorder_0600====getSubscribeInfoCallBack");
                expect(data.events[0]).assertEqual("publish_event0600");
                if (num == 0) {
                    console.info("======test_0600====getSubscribeInfoCallBack=====num : " + num);
                    commonEventSubscriber_1 = commonEventSubscriber;
                    commonEventSubscriber006 = commonEventSubscriber_1;
                } else {
                    console.info("======test_0600====getSubscribeInfoCallBack=====num : " + num);
                    commonEventSubscriber_2 = commonEventSubscriber;
                    commonEventSubscriber006 = commonEventSubscriber_2;
                }
                num ++;
                console.info("======test_0600====getSubscribeInfoCallBack=====begin call subscribe num : "+ num);
                await Subscriber.subscribe(commonEventSubscriber006, subscriberCallBack006);
                console.info("======test_0600====getSubscribeInfoCallBack=====after call subscribe");
                break;
            case "publish_event0700":
                expect(data.events[0]).assertEqual("publish_event0700");
                commonEventSubscriber007 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber007, subscriberCallBack007);
                break;
            case "publish_event0800":
                expect(data.events[0]).assertEqual("publish_event0800");
                commonEventSubscriber008 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber008, subscriberCallBack008);
                break;
            case "publish_event0900":
                expect(data.events[0]).assertEqual("publish_event0900");
                commonEventSubscriber009 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber009, subscriberCallBack009);
                break;
            case "publish_event1000":
                expect(data.events[0]).assertEqual("publish_event1000");
                commonEventSubscriber010 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber010, subscriberCallBack010);
                break;
            case "publish_event1100_1":
                expect(data.events[0]).assertEqual("publish_event1100_1");
                commonEventSubscriber011 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber011, subscriberCallBack011_1);
                break;
            case "publish_event1100_2":
                expect(data.events[0]).assertEqual("publish_event1100_2");
                commonEventSubscriber011 = commonEventSubscriber;
                await Subscriber.subscribe(commonEventSubscriber011, subscriberCallBack011_2);
                break;
            default:
                break;
        }
    }

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0100
     * @tc.name      : verify subscribe and publish : Check subscribe and publish common event data
     * @tc.desc      : Check the subscriber can receive event "publish_event0100" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0100', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0100=============================>");
        commonEventSubscribeInfo = {
            events: ["publish_event0100"],
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) =>{
            console.info("===============ActsSubscriberTestUnorder_0100=========createSubscriber promise");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0100=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        })
        console.info("===============ActsSubscriberTestUnorder_0100==============================>");
        await Subscriber.publish("publish_event0100", publishCallback);
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0200
     * @tc.name      : verify subscribe and publish : Check subscribe and publish common event data 
     *                 of containing special characters
     * @tc.desc      : Check the subscriber can receive event "@#￥#3243adsafdf_" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0200', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0200==========================>");

        var commonEventSubscribeInfo = {
            events: ["@#￥#3243adsafdf_"],
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) =>{
            console.info("===============ActsSubscriberTestUnorder_0200=========createSubscriber promise");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0200=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        })

        Subscriber.publish("@#￥#3243adsafdf_", publishCallback);
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0300
     * @tc.name      : verify subscribe and publish : Check subscribe and publish system event data
     * @tc.desc      : Check the subscriberA and subscriberB both can receive event "usual.event.BATTERY_CHANGED"
     *                 type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0300', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0300==========================>");
        var commonEventSubscribeInfo = {
            events: [Subscriber.Support.COMMON_EVENT_BATTERY_CHANGED]
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) =>{
            console.info("===============ActsSubscriberTestUnorder_0300=========createSubscriber promise");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0300=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        })

        Subscriber.publish(Subscriber.Support.COMMON_EVENT_BATTERY_CHANGED, publishCallback);
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0400
     * @tc.name      : verify subscribe and publish : Check subscribe and publish common event data 
     *                 with publishInfo data
     * @tc.desc      : Check the subscriber can receive event "publish_event0400" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0400', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0400==========================>");
        var commonEventSubscribeInfo = {
            events: ["publish_event0400"],
            publisherDeviceId: "PublishDeviceId0400",
            priority: 10,
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) =>{
            console.info("===============ActsSubscriberTestUnorder_0400=========createSubscriber promise");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0400=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        })

        var commonEventPublishData = {
            isOrdered: false,
            bundleName: "PublishBundleName0400",
            code: 55,
            data: "PublishData0400",
        }

        Subscriber.publish("publish_event0400", commonEventPublishData, publishCallback);
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0500
     * @tc.name      : verify subscribe and publish : Check subscribe and publish sticky event
     * @tc.desc      : Check the subscriber can receive event "publish_event0500" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0500', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0500==========================>");
        commonEventSubscribeInfo = {
            events: ["publish_event0500"]
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) =>{
            console.info("===============ActsSubscriberTestUnorder_0500=========createSubscriber promise");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0500=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        })

        var commonEventPublishData = {
            isOrdered: false,
            isSticky: true,
        }

        Subscriber.publish("publish_event0500", commonEventPublishData, publishCallback);
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0600
     * @tc.name      : verify subscribe and publish : Check the two different subscribe and one publish, 
     *                 and check unsubscribe event
     * @tc.desc      : Check the subscriber can receive event "publish_event0600" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0600', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0600==========================>");
        var commonEventSubscribeInfo = {
            events: ["publish_event0600"]
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) =>{
            console.info("===============ActsSubscriberTestUnorder_0600_1=========createSubscriber promise");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0600_1=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        })

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) =>{
            console.info("===============ActsSubscriberTestUnorder_0600_2=========createSubscriber promise");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0600_2=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        })

        await unsubscriber_();
        var commonEventPublishData = {
            isOrdered: false,
            isSticky: false,
        }

        Subscriber.publish("publish_event0600", commonEventPublishData, publishCallback);
        console.info("===============ActsSubscriberTestUnorder_0600 end=========================>");
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0700
     * @tc.name      : verify subscribe and publish : Check one subscribe and twice publish common events
     * @tc.desc      : Check the subscriber can receive event "publish_event0700" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0700', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0700==========================>");
        var commonEventSubscribeInfo = {
            events: ["publish_event0700"]
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) =>{
            console.info("===============ActsSubscriberTestUnorder_0700=========createSubscriber promise");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0700=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        })

        var commonEventPublishData = {
            isOrdered: false,
            isSticky: false,
        }

        Subscriber.publish("publish_event0700", commonEventPublishData, publishCallback);
        Subscriber.publish("publish_event0700", commonEventPublishData, publishCallback);
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0800
     * @tc.name      : verify subscribe and publish : Check subscribe and publish common event with permission
     * @tc.desc      : Check the subscriber can receive event "publish_event0800" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0800', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0800==========================>");
        var commonEventSubscribeInfo = {
            events: ["publish_event0800"],
            publisherPermission:"publish_event0800_permission"
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) => {
            console.info("=================ActsSubscriberTestUnorder_0800=========createSubscriberPromise0800");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0800=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        });

        var commonEventPublishData = {
            subscriberPermissions:["publish_event0800_permission"],
            isOrdered: false,
            isSticky: false,
        }

        Subscriber.publish("publish_event0800", commonEventPublishData, publishCallback);
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_0900
     * @tc.name      : verify subscribe and publish : Check subscribe and publish common event 
     *                 with permission and check IsOrderedCommonEvent
     * @tc.desc      : Check the subscriber can receive event "publish_event0900" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_0900', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_0900==========================>");
        var commonEventSubscribeInfo = {
            events: ["publish_event0900"],
            publisherPermission:"publish_event0900_publisherPermission"
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) => {
            console.info("==========================>createSubscriberPromise0900=======================>");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_0900=========getSubscribeInfo promise");
                await getSubscribeInfoCallBack(data);
            });
        });

        var commonEventPublishData = {
            subscriberPermissions:["publish_event0900_subscriberPermissions"],
            isOrdered: false,
            isSticky: false
        }

        Subscriber.publish("publish_event0900", commonEventPublishData, publishCallback);
        done();
    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_1000
     * @tc.name      : verify subscribe and publish : Check subscribe and publish sticky event 
     *                 with publishpermission and check IsStickyCommonEvent
     * @tc.desc      : Check the subscriber can receive event "publish_event1000" type of the interface (by Promise)
     */
    it('ActsSubscriberTestUnorder_1000', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_1000==========================>");
        var commonEventSubscribeInfo = {
            events: ["publish_event1000"]
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo
        ).then(async (data) => {
            console.info("==========================>createSubscriberPromise1000=======================>");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_1000=========getSubscribeInfo promise=");
                await getSubscribeInfoCallBack(data);
            });
        });

        var commonEventPublishData = {
            subscriberPermissions:["publish_event1000_permission"],
            isOrdered: false,
            isSticky: true
        }

        Subscriber.publish("publish_event1000", commonEventPublishData, publishCallback);
        done();

    })

    /*
     * @tc.number    : ActsSubscriberTestUnorder_1100
     * @tc.name      : verify subscribe and publish : Check different subscribes and publish different common event
     * @tc.desc      : Check the subscriber can receive event "publish_event1100" type of the interface
     */
    it('ActsSubscriberTestUnorder_1100', 0, async function (done) {
        console.info("===============ActsSubscriberTestUnorder_1100==========================>");

        var commonEventSubscribeInfo_1 = {
            events: ["publish_event1100_1"],
            priority: 5
        };

        var commonEventSubscribeInfo_2 = {
            events: ["publish_event1100_2"],
            priority: 10
        };

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo_1
        ).then(async (data) => {
            console.info("=================ActsSubscriberTestUnorder_1100=========>createSubscriber Promise1100_1");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_1100=========getSubscribeInfo promise1100_1");
                await getSubscribeInfoCallBack(data);
            });
        });

        await Subscriber.createSubscriber(
            commonEventSubscribeInfo_2
        ).then(async (data) => {
            console.info("=================ActsSubscriberTestUnorder_1100=========>createSubscriber Promise1100_2");
            commonEventSubscriber = data;
            await data.getSubscribeInfo().then(async (data)=>{
                console.info("===============ActsSubscriberTestUnorder_1100=========getSubscribeInfo promise1100_2");
                await getSubscribeInfoCallBack(data);
            });
        });

        commonEventPublishData_1 = {
            bundleName: "publish_event1100_bundleName1",
            code: 3,
            data: "publish_event1100_data",
            isOrdered: false,
            isSticky: false,
        }

        commonEventPublishData_2 = {
            bundleName: "publish_event1100_bundleName2",
            code: 5,
            data: "publish_event1100_data",
            isOrdered: false,
            isSticky: false,
        }

        Subscriber.publish("publish_event1100_1", commonEventPublishData_1, publishCallback1100_1);
        Subscriber.publish("publish_event1100_2", commonEventPublishData_2, publishCallback1100_2);

        done();
    })
})
