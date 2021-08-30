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

describe('ActsSubscriberUnorderTest', function () {
    console.info("===========ActsSubscriberUnorderTest start====================>");
    var num = 0;
    var CommonEventSubscriber;
    var CommonEventSubscriber001;
    var CommonEventSubscriber002;
    var CommonEventSubscriber003;
    var CommonEventSubscriber004;
    var CommonEventSubscriber005;
    var CommonEventSubscriber006;
    var CommonEventSubscriber007;
    var CommonEventSubscriber008;
    var CommonEventSubscriber009;
    var CommonEventSubscriber010;
	var CommonEventSubscriber011;
	var CommonEventSubscriber_1;
    var CommonEventSubscriber_2;

    //IsOrderedCommonEventCallback004
    function IsOrderedCommonEventCallback004(err, data) {
        console.info("==========================>IsOrderedCommonEventCallback004=======================>");
        expect(data).assertEqual(false);
    }

    //IsStickyCommonEventCallback004
    function IsStickyCommonEventCallback004(err, data) {
        console.info("==========================>isStickyCommonEventCallback004=======================>");
        expect(data).assertEqual(false);
    }

    //IsOrderedCommonEventCallback005
    function IsOrderedCommonEventCallback005(err, data) {
        console.info("==========================>IsOrderedCommonEventCallback005=======================>");
        expect(data).assertEqual(false);
    }

    //IsStickyCommonEventCallback005
    function IsStickyCommonEventCallback005(err, data) {
        console.info("==========================>isStickyCommonEventCallback005=======================>");
        expect(data).assertEqual(false);
    }

    //IsOrderedCommonEventCallback007
    function IsOrderedCommonEventCallback007(err, data) {
        console.info("==========================>IsOrderedCommonEventCallback007=======================>");
        expect(data).assertEqual(false);
    }

    //IsStickyCommonEventCallback007
    function IsStickyCommonEventCallback007(err, data) {
        console.info("==========================>isStickyCommonEventCallback007=======================>");
        expect(data).assertEqual(false);
    }

    //IsOrderedCommonEventCallback009
    function IsOrderedCommonEventCallback009(err, data) {
        console.info("==========================>IsOrderedCommonEventCallback009=======================>");
        expect(data).assertEqual(false);
    }

    //IsStickyCommonEventCallback009
    function IsStickyCommonEventCallback009(err, data) {
        console.info("==========================>isStickyCommonEventCallback009=======================>");
        expect(data).assertEqual(false);
    }

    //IsOrderedCommonEventCallback010
    function IsOrderedCommonEventCallback010(err, data) {
        console.info("==========================>IsOrderedCommonEventCallback010=======================>");
        expect(data).assertEqual(false);
    }

    //IsStickyCommonEventCallback010
    function IsStickyCommonEventCallback010(err, data) {
        console.info("==========================>isStickyCommonEventCallback010=======================>");
        expect(data).assertEqual(false);
    }

    function PublishCallback(err) {
        console.info("==========================>PublishCallback=======================>");
    }

    function UnsubscriberCallBack(err) {
        console.info("==========================>UnsubscriberCallBack=======================>");
    }

    function SubscriberCallBack001(err, data) {
        console.info("==========================>SubscriberCallBack0100=======================>");
        expect(data.event).assertEqual("publish_event0100");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function SubscriberCallBack002(err, data) {
        console.info("==========================>SubscriberCallBack0200=======================>");
        expect(data.event).assertEqual("publish_event0200");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function SubscriberCallBack003(err, data) {
        console.info("==========================>SubscriberCallBack0300=======================>");
        expect(data.event).assertEqual("publish_event0300");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function SubscriberCallBack004(err, data) {
        console.info("==========================>SubscriberCallBack0400=======================>");
        expect(data.event).assertEqual("publish_event0400");
        expect(data.bundleName).assertEqual("PublishBundleName0400");
        expect(data.code).assertEqual(55);
        expect(data.data).assertEqual("PublishData0700");
        CommonEventSubscriber004.isOrderedCommonEvent(IsOrderedCommonEventCallback004);
        CommonEventSubscriber004.isStickyCommonEvent(IsStickyCommonEventCallback004);
    }

    function SubscriberCallBack005(err, data) {
        console.info("==========================>SubscriberCallBack0500=======================>");
        expect(data.event).assertEqual("publish_event0500");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
        CommonEventSubscriber005.isOrderedCommonEvent(IsOrderedCommonEventCallback005);
        CommonEventSubscriber005.isStickyCommonEvent(IsStickyCommonEventCallback005);
    }

    function SubscriberCallBack006(err, data) {
        console.info("==========================>SubscriberCallBack0600=======================>");
        expect(data.event).assertEqual("publish_event0600");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function SubscriberCallBack007(err, data) {
        console.info("==========================>SubscriberCallBack0700=======================>");
        expect(data.event).assertEqual("publish_event0700");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
        CommonEventSubscriber007.isOrderedCommonEvent(IsOrderedCommonEventCallback007);
        CommonEventSubscriber007.isStickyCommonEvent(IsStickyCommonEventCallback007);
    }

    function SubscriberCallBack008(err, data) {
        console.info("==========================>SubscriberCallBack0800=======================>");
        expect(data.event).assertEqual("publish_event0800");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
    }

    function SubscriberCallBack009(err, data) {
        console.info("==========================>SubscriberCallBack0900=======================>");
        expect(data.event).assertEqual("publish_event0900");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
        CommonEventSubscriber009.isOrderedCommonEvent(IsOrderedCommonEventCallback009);
        CommonEventSubscriber009.isStickyCommonEvent(IsStickyCommonEventCallback009);
    }

    function SubscriberCallBack010(err, data) {
        console.info("==========================>SubscriberCallBack1000=======================>");
        expect(data.event).assertEqual("publish_event1000");
        expect(data.bundleName).assertEqual("");
        expect(data.code).assertEqual(0);
        expect(data.data).assertEqual("");
        CommonEventSubscriber010.isOrderedCommonEvent(IsOrderedCommonEventCallback010);
        CommonEventSubscriber010.isStickyCommonEvent(IsStickyCommonEventCallback010);
    }
	
	function SubscriberCallBack011(err, data) {
        console.info("==========================>SubscriberCallBack1001=======================>");
        expect(data.event).assertEqual("publish_event1001");
        expect(data.bundleName).assertEqual("publish_event1001_bundleName");
		if (num == 0) {
			expect(data.code).assertEqual(3);
			expect(data.data).assertEqual("publish_event1001_data");
			CommonEventSubscriber011.SetCode(11);
			CommonEventSubscriber011.SetData("publish_event_1001_1_data");
			CommonEventSubscriber011.FinishCommonEvent();
		} else {
			expect(data.code).assertEqual(11);
			expect(data.data).assertEqual("publish_event_1001_1_data");
		}
    }

    async function GetSubscribeInfoCallBack(err, data) {
        console.info("==========================>GetSubscribeInfoCallBack event = " + data.events[0]);
        switch (data.events[0]) {
            case "publish_event0100":
                expect(data.events[0]).assertEqual("publish_event0100");
                CommonEventSubscriber001 = CommonEventSubscriber;

                await Subscriber.subscribe(CommonEventSubscriber001, SubscriberCallBack001);
                break;
            case "publish_event0200":
                expect(data.events[0]).assertEqual("publish_event0200");
                CommonEventSubscriber002 = CommonEventSubscriber;
                await Subscriber.subscribe(CommonEventSubscriber002, SubscriberCallBack002);
                break;
            case "publish_event0300":
                expect(data.events[0]).assertEqual("publish_event0300");
                CommonEventSubscriber003 = CommonEventSubscriber;
                await Subscriber.subscribe(CommonEventSubscriber003, SubscriberCallBack003);
                break;
            case "publish_event0400":
                expect(data.events[0]).assertEqual("publish_event0400");
                expect(data.publisherDeviceId).assertEqual("PublishDeviceId0100");
                expect(data.priority).assertEqual(10);
                CommonEventSubscriber004 = CommonEventSubscriber;
                await Subscriber.subscribe(CommonEventSubscriber004, SubscriberCallBack004);
                break;
            case "publish_event0500":
                expect(data.events[0]).assertEqual("publish_event0500");
                CommonEventSubscriber005 = CommonEventSubscriber;
                await Subscriber.subscribe(CommonEventSubscriber005, SubscriberCallBack005);
                break;
            case "publish_event0600":
                console.info("=====ActsSubscriber_test_0600====GetSubscribeInfoCallBack===========");
                expect(data.events[0]).assertEqual("publish_event0600");
                if (num == 0) {
                    console.info("======test_0600====GetSubscribeInfoCallBack=====num " + num);
                    CommonEventSubscriber_1 = CommonEventSubscriber;
                    CommonEventSubscriber006 = CommonEventSubscriber_1;
                    console.info("======test_0600====GetSubscribeInfoCallBack=====CommonEventSubscriber006 " + CommonEventSubscriber006);
                } else {
                    console.info("======test_0600====GetSubscribeInfoCallBack=====num " + num);
                    CommonEventSubscriber_2 = CommonEventSubscriber;
                    CommonEventSubscriber006 = CommonEventSubscriber_2;
                    console.info("======test_0600====GetSubscribeInfoCallBack=====CommonEventSubscriber0062 " + CommonEventSubscriber006);
                }
                num ++;
                console.info("======test_0600====GetSubscribeInfoCallBack=====begin call subscribe num = "+ num);
                await Subscriber.subscribe(CommonEventSubscriber006, SubscriberCallBack006);
                console.info("======test_0600====GetSubscribeInfoCallBack=====after call subscribe");
                break;
            case "publish_event0700":
                expect(data.events[0]).assertEqual("publish_event0700");
                CommonEventSubscriber007 = CommonEventSubscriber;
                await Subscriber.subscribe(CommonEventSubscriber007, SubscriberCallBack007);
                break;
            case "publish_event0800":
                expect(data.events[0]).assertEqual("publish_event0800");
                CommonEventSubscriber008 = CommonEventSubscriber;
                await Subscriber.subscribe(CommonEventSubscriber008, SubscriberCallBack008);
                break;
            case "publish_event0900":
                expect(data.events[0]).assertEqual("publish_event0900");
                CommonEventSubscriber009 = CommonEventSubscriber;
                await Subscriber.subscribe(CommonEventSubscriber009, SubscriberCallBack009);
                break;
            case "publish_event1000":
                expect(data.events[0]).assertEqual("publish_event1000");
                CommonEventSubscriber010 = CommonEventSubscriber;
                await Subscriber.subscribe(CommonEventSubscriber010, SubscriberCallBack010);
                break;
			case "publish_event1001":
				num = 0;
				expect(data.events[0]).assertEqual("publish_event1001");
				CommonEventSubscriber011 = CommonEventSubscriber;
				await Subscriber.subscribe(CommonEventSubscriber011, SubscriberCallBack011);
                break;
            default:
                break;
        }
    }

    async function CreateSubscriberCallBack(err, data) {
        console.info("==========================>CreateSubscriberCallBack=======================>");
        CommonEventSubscriber = data;
        await data.getSubscribeInfo(GetSubscribeInfoCallBack);
    }

    //  @tc.number: ActsSubscriber_test_0100
    //  @tc.name: verify subscribe and publish : Check subscribe and publish common event data
    //  @tc.desc: Check the subscriber can receive event "publish_event0100" type of the interface (by CallBack)
    it('ActsSubscriber_test_0100', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0100==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event0100"],
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo,
            CreateSubscriberCallBack
        )

        Subscriber.publish("publish_event0100", PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_0200
    //  @tc.name: verify subscribe and publish : Check subscribe and publish common event data
    //  @tc.desc: Check the subscriber can receive event "publish_event0200" type of the interface (by CallBack)
    it('ActsSubscriber_test_0200', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0200==========================>");

        var CommonEventSubscribeInfo = {
            events: ["publish_event0200"],
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo,
            CreateSubscriberCallBack
        )

        Subscriber.publish("publish_event0200", PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_0300
    //  @tc.name: verify subscribe and publish : Check subscribe and publish common event data
    //  @tc.desc: Check the subscriberA and subscriberB both can receive event "publish_event0300" type of the interface (by CallBack)
    it('ActsSubscriber_test_0300', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0300==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event0300"]
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo,
            CreateSubscriberCallBack
        )

        Subscriber.publish("publish_event0300", PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_0400
    //  @tc.name: verify subscribe and publish : Check subscribe and publish common event data with commoneventdata
    //  @tc.desc: Check the subscriber can receive event "publish_event0400" type of the interface (by CallBack)
    it('ActsSubscriber_test_0400', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0400==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event0400"],
            publisherDeviceId: "PublishDeviceId0100",
            priority: 10,
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo,
            CreateSubscriberCallBack
        )

        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: false,
            bundleName: "PublishBundleName0400",
            code: 55,
            data: "PublishData0700",
        }

        Subscriber.publish("publish_event0400", CommonEventPublishData, PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_0500
    //  @tc.name: verify subscribe and publish : Check subscribe and publish sticky event
    //  @tc.desc: Check the subscriber can receive event "publish_event0500" type of the interface (by CallBack)
    it('ActsSubscriber_test_0500', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0500==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event0500"]
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo,
            CreateSubscriberCallBack
        )

        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: false,
        }

        Subscriber.publish("publish_event0500", CommonEventPublishData, PublishCallback);
        done();
    })


    //  @tc.number: ActsSubscriber_test_0600
    //  @tc.name: verify subscribe and publish : Check the same subscribe and different callback, and Check publish sticky event
    //  @tc.desc: Check the subscriber can receive event "publish_event0600" type of the interface (by CallBack)
    it('ActsSubscriber_test_0600', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0600==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event0600"]
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo,
            CreateSubscriberCallBack
        )

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo,
            CreateSubscriberCallBack
        )

        await Subscriber.unsubscribe(CommonEventSubscriber_1, UnsubscriberCallBack);
        console.info("===============ActsSubscriber_test_0600  000000000000000=========================>");
        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: false,
        }
        console.info("===============ActsSubscriber_test_0600  11111111111=========================>");

        Subscriber.publish("publish_event0600", CommonEventPublishData, PublishCallback);
        console.info("===============ActsSubscriber_test_0600  22222222=========================>");
        done();
    })

    //  @tc.number: ActsSubscriber_test_0700
    //  @tc.name: verify subscribe and publish : Check subscribe and publish sticky event
    //  @tc.desc: Check the subscriber can receive event "publish_event0700" type of the interface (by CallBack)
    it('ActsSubscriber_test_0700', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0700==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event0700"]
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo,
            CreateSubscriberCallBack
        )

        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: false,
        }

        Subscriber.publish("publish_event0700", CommonEventPublishData, PublishCallback);
        Subscriber.publish("publish_event0700", CommonEventPublishData, PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_0800
    //  @tc.name: verify subscribe and publish : Check subscribe and publish common event
    //  @tc.desc: Check the subscriber can receive event "publish_event0800" type of the interface (by Promise)
    it('ActsSubscriber_test_0800', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0800==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event0800"]
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo
        ).then((data) => {
            console.info("==========================>createSubscriberPromise0800=======================>");
            CommonEventSubscriber = data;
            data.getSubscribeInfo(GetSubscribeInfoCallBack);
        });

        Subscriber.publish("publish_event0800", PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_0900
    //  @tc.name: verify subscribe and publish : Check subscribe and publish common event with common event data
    //  @tc.desc: Check the subscriber can receive event "publish_event0900" type of the interface (by Promise)
    it('ActsSubscriber_test_0900', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0900==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event0900"]
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo
        ).then((data) => {
            console.info("==========================>createSubscriberPromise0900=======================>");
            CommonEventSubscriber = data;
            data.getSubscribeInfo(GetSubscribeInfoCallBack);
        });

        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: false
        }

        Subscriber.publish("publish_event0900", CommonEventPublishData, PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_1000
    //  @tc.name: verify subscribe and publish : Check subscribe and publish event
    //  @tc.desc: Check the subscriber can receive event "publish_event1000" type of the interface (by Promise)
    it('ActsSubscriber_test_1000', 0, async function (done) {
        console.info("===============ActsSubscriber_test_1000==========================>");
        var CommonEventSubscribeInfo = {
            events: ["publish_event1000"]
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo
        ).then((data) => {
            console.info("==========================>createSubscriberPromise1000=======================>");
            CommonEventSubscriber = data;
            data.getSubscribeInfo(GetSubscribeInfoCallBack);
        });

        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: false
        }

        Subscriber.publish("publish_event1000", CommonEventPublishData, PublishCallback);
        done();

    })
	
	//  @tc.number: ActsSubscriber_test_1001
    //  @tc.name: verify subscribe and publish : Check subscribe and publish ordered event
    //  @tc.desc: Check the subscriber can receive event "publish_event1001" type of the interface
    it('ActsSubscriber_test_1001', 0, async function (done) {
		console.info("===============ActsSubscriber_test_1001==========================>");
		
		var CommonEventSubscribeInfo_1 = {
            events: ["publish_event1001"],
			priority: 5
        };
		
		var CommonEventSubscribeInfo_2 = {
            events: ["publish_event1001"],
			priority: 10
        };
		
		await Subscriber.createSubscriber(
            CommonEventSubscribeInfo_1,
            CreateSubscriberCallBack
        )

		await Subscriber.createSubscriber(
            CommonEventSubscribeInfo_2,
            CreateSubscriberCallBack
        )
		
		var CommonEventPublishData = {
			bundleName: "publish_event1001_bundleName",
			code: 3,
			data: "publish_event1001_data",
            isOrdered: true,
            isSticky: false,
        }
		
		await Subscriber.publish("publish_event1001", CommonEventPublishData, PublishCallback);
		done();
	})
})