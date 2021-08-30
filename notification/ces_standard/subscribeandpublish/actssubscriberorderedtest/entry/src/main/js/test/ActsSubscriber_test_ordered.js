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

describe('ActsSubscriberOrderedTest', function () {
    console.info("===========ActsSubscriberOrderedTest start====================>");
    var num = 0, num2 = 0, num3 = 0;
    var CommonEventSubscriber;
    var CommonEventSubscriber0100;
    var CommonEventSubscriber0101;
    var CommonEventSubscriber0200_1;
    var CommonEventSubscriber0200_2;
    var CommonEventSubscriber0300_1;
    var CommonEventSubscriber0300_2;
    var CommonEventSubscriber0400_1;
    var CommonEventSubscriber0400_2;

    function PublishCallback(err) {
        console.info("==========================>PublishCallback=======================>");
    }

    function setCodeCallBack(err) {
        console.info("==========================>setCodeCallBack=======================>");
    }

    function setDataCallBack(err) {
        console.info("==========================>setDataCallBack=======================>");
    }

    function finishCommonEventCallBack(err) {
        console.info("==========================>finishCommonEventCallBack=======================>");
    }

    function abortCommonEventCallback(err) {
        console.info("==========================>abortCommonEventCallback=======================>");
    }

    function clearAbortCommonEventCallback(err) {
        console.info("==========================>clearAbortCommonEventCallback=======================>");
    }

    function getAbortCommonEventCallback(err, data) {
        console.info("==========================>getAbortCommonEventCallback=======================> abort = " + data);
    }

    function setCodeAndDataCallback(err) {
        console.info("==========================>setCodeAndDataCallback=======================>");
    }

    function isOrderedCommonEventCallback(err,data) {
        console.info("==========================>isOrderedCommonEventCallback=======================> isordered = " + data);
        expect(data).assertEqual(1);
    }

    function isStickyCommonEventCallback(err,data) {
        console.info("==========================>isStickyCommonEventCallback=======================> issticky = " + data);
        expect(data).assertEqual(0);
    }

    function unsubscribeCallback(err) {
        console.info("==========================>unsubscribeCallback=======================>");
    }

    async function SubscriberCallBack0100(err, data) {
        console.info("==========================>SubscriberCallBack0100========event===============>" + data.event);
        console.info("==========================>SubscriberCallBack0100========bundleName===============>" + data.bundleName);
        console.info("==========================>SubscriberCallBack0100=========code==============>" + data.code);
        console.info("==========================>SubscriberCallBack0100=========data==============>" + data.data);
        expect(data.event).assertEqual("publish_event0100");
        console.info("==========================>SubscriberCallBack0100=========1==============>");
        expect(data.code).assertEqual(1);
        console.info("==========================>SubscriberCallBack0100=========2==============>");
        expect(data.data).assertEqual("publish_event1001_init");
        console.info("==========================>SubscriberCallBack0100=========3==============>");
        expect(data.bundleName).assertEqual("publish_event0100_bundleName");
        console.info("==========================>SubscriberCallBack0100=========4==============>");
        console.info("==========================>SubscriberCallBack0100=========CommonEventSubscriber0100==============>" + CommonEventSubscriber0100);
        console.info("===============SubscriberCallBack0100=======>before AbortCommonEventCallback============");
        await CommonEventSubscriber0100.abortCommonEvent(abortCommonEventCallback);
        console.info("===============SubscriberCallBack0100=======>after AbortCommonEventCallback============");
        await CommonEventSubscriber0100.setCode(2, setCodeCallBack);
        console.info("==========================>SubscriberCallBack0100=========5==============>");
        await CommonEventSubscriber0100.setData("publish_event1001_change", setDataCallBack);
        await CommonEventSubscriber0100.setCodeAndData(2, "publish_event1001_change", setCodeAndDataCallback);
        console.info("==========================>SubscriberCallBack0100=========6==============>");
        console.info("===============SubscriberCallBack0100=======>before clearabortCommonEvent============");
        await CommonEventSubscriber0100.getAbortCommonEvent(getAbortCommonEventCallback);
        await CommonEventSubscriber0100.clearAbortCommonEvent(clearAbortCommonEventCallback);
        await CommonEventSubscriber0100.getAbortCommonEvent(getAbortCommonEventCallback);
        await CommonEventSubscriber0100.isOrderedCommonEvent(isOrderedCommonEventCallback);
        await CommonEventSubscriber0100.isStickyCommonEvent(isStickyCommonEventCallback);
        await Subscriber.unsubscribe(CommonEventSubscriber0100,unsubscribeCallback);
        await CommonEventSubscriber0100.finishCommonEvent(finishCommonEventCallBack);
        console.info("==========================>SubscriberCallBack0100=========7==============>");
    }

    async function SubscriberCallBack0101(err, data) {
        console.info("==========================>SubscriberCallBack0101========event===============>" + data.event);
        console.info("==========================>SubscriberCallBack0101========bundleName===============>" + data.bundleName);
        console.info("==========================>SubscriberCallBack0101=========code==============>" + data.code);
        console.info("==========================>SubscriberCallBack0101=========data==============>" + data.data);
        expect(data.event).assertEqual("publish_event0100");
        console.info("==========================>SubscriberCallBack0101=========1==============>");
        expect(data.code).assertEqual(2);
        console.info("==========================>SubscriberCallBack0101=========2==============>");
        expect(data.data).assertEqual("publish_event1001_change");
        console.info("==========================>SubscriberCallBack0101=========3==============>");
        expect(data.bundleName).assertEqual("publish_event0100_bundleName");
        console.info("==========================>SubscriberCallBack0101=========4==============>");
        await CommonEventSubscriber0101.finishCommonEvent(finishCommonEventCallBack);
        console.info("==========================>SubscriberCallBack0101=========5==============>");
    }

    async function SubscriberCallBack0200_1(err, data) {
        console.info("==========================>SubscriberCallBack0200_1========event===============>" + data.event);
        console.info("==========================>SubscriberCallBack0200_1========bundleName===============>" + data.bundleName);
        console.info("==========================>SubscriberCallBack0200_1=========code==============>" + data.code);
        console.info("==========================>SubscriberCallBack0200_1=========data==============>" + data.data);
        console.info("==========================>SubscriberCallBack0200_1=========num2==============>" + num2);
        if (num2 == 0) {
            num2++;
            expect(data.event).assertEqual("publish_event0200");
            console.info("==========================>SubscriberCallBack0200_1=========1==============>");
            expect(data.code).assertEqual(1);
            console.info("==========================>SubscriberCallBack0200_1=========2==============>");
            expect(data.data).assertEqual("publish_event0200_init");
            console.info("==========================>SubscriberCallBack0200_1=========3==============>");
            expect(data.bundleName).assertEqual("publish_event0200_bundleName");
            console.info("==========================>SubscriberCallBack0200_1=========4==============>");
            console.info("==========================>SubscriberCallBack0200_1=========CommonEventSubscriber0200_1==============>" + CommonEventSubscriber0200_1);
            console.info("==========================>SubscriberCallBack0200_1=========5==============>");
        }else {
            num2 = 0;
            expect(data.event).assertEqual("publish_event0201");
            console.info("==========================>SubscriberCallBack0200_1=========1==============>");
            expect(data.code).assertEqual(1);
            console.info("==========================>SubscriberCallBack0200_1=========2==============>");
            expect(data.data).assertEqual("publish_event0201_init");
            console.info("==========================>SubscriberCallBack0200_1=========3==============>");
            expect(data.bundleName).assertEqual("publish_event0201_bundleName");
            await CommonEventSubscriber0200_1.finishCommonEvent(finishCommonEventCallBack);
            console.info("==========================>SubscriberCallBack0200_1=========4=============>");
        }
    }

    async function SubscriberCallBack0200_2(err, data) {
        console.info("==========================>SubscriberCallBack0200_2========event===============>" + data.event);
        console.info("==========================>SubscriberCallBack0200_2========bundleName===============>" + data.bundleName);
        console.info("==========================>SubscriberCallBack0200_2=========code==============>" + data.code);
        console.info("==========================>SubscriberCallBack0200_2=========data==============>" + data.data);

        expect(data.event).assertEqual("publish_event0201");
        console.info("==========================>SubscriberCallBack0200_2=========1==============>");
        expect(data.code).assertEqual(1);
        console.info("==========================>SubscriberCallBack0200_2=========2==============>");
        expect(data.data).assertEqual("publish_event0201_init");
        console.info("==========================>SubscriberCallBack0200_2=========3==============>");
        expect(data.bundleName).assertEqual("publish_event0201_bundleName");
        await CommonEventSubscriber0200_2.finishCommonEvent(finishCommonEventCallBack);
        console.info("==========================>SubscriberCallBack0200_2=========4=============>");
    }

    async function SubscriberCallBack0300_1(err, data) {
        console.info("==========================>SubscriberCallBack0300_1========event===============>" + data.event);
        console.info("==========================>SubscriberCallBack0300_1========bundleName===============>" + data.bundleName);
        console.info("==========================>SubscriberCallBack0300_1=========code==============>" + data.code);
        console.info("==========================>SubscriberCallBack0300_1=========data==============>" + data.data);
        console.info("==========================>SubscriberCallBack0300_1=========num3==============>" + num3);
        if (num3 == 0) {
            num3++;
            expect(data.event).assertEqual("publish_event0300");
            console.info("==========================>SubscriberCallBack0300_1=========1==============>");
            expect(data.code).assertEqual(1);
            console.info("==========================>SubscriberCallBack0300_1=========2==============>");
            expect(data.data).assertEqual("publish_event0300_init");
            console.info("==========================>SubscriberCallBack0300_1=========3==============>");
            expect(data.bundleName).assertEqual("publish_event0300_bundleName");
            console.info("==========================>SubscriberCallBack0300_1=========4==============>");
            console.info("==========================>SubscriberCallBack0300_1=========CommonEventSubscriber0300_1==============>" + CommonEventSubscriber0300_1);
            console.info("==========================>SubscriberCallBack0300_1=========5==============>");
        }else {
            num3 = 0;
            expect(data.event).assertEqual("publish_event0301");
            console.info("==========================>SubscriberCallBack0300_1=========1==============>");
            expect(data.code).assertEqual(1);
            console.info("==========================>SubscriberCallBack0300_1=========2==============>");
            expect(data.data).assertEqual("publish_event0301_init");
            console.info("==========================>SubscriberCallBack0300_1=========3==============>");
            expect(data.bundleName).assertEqual("publish_event0301_bundleName");
            await CommonEventSubscriber0300_1.finishCommonEvent(finishCommonEventCallBack);
            console.info("==========================>SubscriberCallBack0300_1=========4=============>");
        }
    }

    async function SubscriberCallBack0300_2(err, data) {
        console.info("==========================>SubscriberCallBack0300_2========event===============>" + data.event);
        console.info("==========================>SubscriberCallBack0300_2========bundleName===============>" + data.bundleName);
        console.info("==========================>SubscriberCallBack0300_2=========code==============>" + data.code);
        console.info("==========================>SubscriberCallBack0300_2=========data==============>" + data.data);

        expect(data.event).assertEqual("publish_event0301");
        console.info("==========================>SubscriberCallBack0300_2=========1==============>");
        expect(data.code).assertEqual(1);
        console.info("==========================>SubscriberCallBack0300_2=========2==============>");
        expect(data.data).assertEqual("publish_event0301_init");
        console.info("==========================>SubscriberCallBack0300_2=========3==============>");
        expect(data.bundleName).assertEqual("publish_event0301_bundleName");
        await CommonEventSubscriber0300_2.finishCommonEvent(finishCommonEventCallBack);
        console.info("==========================>SubscriberCallBack0300_2=========4=============>");
    }

	async function SubscriberCallBack0400_1(err, data) {
        console.info("==========================>SubscriberPromise0400_1========event===============>" + data.event);
		console.info("==========================>SubscriberPromise0400_1========bundleName===============>" + data.bundleName);
		console.info("==========================>SubscriberPromise0400_1=========code==============>" + data.code);
		console.info("==========================>SubscriberPromise0400_1=========data==============>" + data.data);
		expect(data.event).assertEqual("publish_event0400");
		console.info("==========================>SubscriberPromise0400_1=========1==============>");
		expect(data.code).assertEqual(1);
		console.info("==========================>SubscriberPromise0400_1=========2==============>");
		expect(data.data).assertEqual("publish_event0400_init");
		console.info("==========================>SubscriberPromise0400_1=========3==============>");
		expect(data.bundleName).assertEqual("publish_event0400_bundleName");
		console.info("==========================>SubscriberPromise0400_1=========4==============>");
		console.info("==========================>SubscriberPromise0400_1=========CommonEventSubscriber0400_1==============>" + CommonEventSubscriber0400_1);
		console.info("===============SubscriberPromise0400_1=======>before AbortCommonEventPromise============");
		CommonEventSubscriber0400_1.abortCommonEvent().then(() =>{
			console.info("==========================>abortCommonEventPromise0400_1=======================>");
		});
		console.info("==========================>SubscriberCallBack0400_1=========5==============>");
		console.info("==========================>SubscriberPromise0400_1=========6==============>");
		console.info("===============SubscriberPromise0400_1=======>before abortCommonEvent============");
		CommonEventSubscriber0400_1.getAbortCommonEvent().then((data) => {
			console.info("==========================>getAbortCommonEventPromise0400_1=======================> abort = " + data);
			expect(data).assertEqual(1);
		});
		CommonEventSubscriber0400_1.getAbortCommonEvent().then((data) => {
			console.info("==========================>getAbortCommonEventPromise0400_1=======================> abort = " + data);
		});
		CommonEventSubscriber0400_1.isOrderedCommonEvent().then((data) => {
			console.info("==========================>isOrderedCommonEventPromise0400_1=======================> isabort = " + data);
			expect(data).assertEqual(1);
		});
		CommonEventSubscriber0400_1.isStickyCommonEvent().then((data) => {
			console.info("==========================>isStickyCommonEventPromise0400_1=======================> isSticky = " + data);
			expect(data).assertEqual(0);
		});
		Subscriber.unsubscribe(CommonEventSubscriber0400_1,unsubscribeCallback);
		CommonEventSubscriber0400_1.finishCommonEvent().then(() => {
			console.info("==========================>finishCommonEventPromise0400_1=======================>");
		});
		console.info("==========================>SubscriberCallBack0400_1=========7==============>");
    }
	
	async function SubscriberCallBack0400_2(err, data) {
        console.info("==========================>SubscriberPromise0400_2========event===============>" + data.event);
		console.info("==========================>SubscriberPromise0400_2========bundleName===============>" + data.bundleName);
		console.info("==========================>SubscriberPromise0400_2=========code==============>" + data.code);
		console.info("==========================>SubscriberPromise0400_2=========data==============>" + data.data);
		expect(data.event).assertEqual("publish_event0400");
		console.info("==========================>SubscriberPromise0400_2=========1==============>");
		expect(data.code).assertEqual(1);
		console.info("==========================>SubscriberPromise0400_2=========2==============>");
		expect(data.data).assertEqual("publish_event0400_init");
		console.info("==========================>SubscriberPromise0400_2=========3==============>");
		expect(data.bundleName).assertEqual("publish_event0400_bundleName");
		console.info("==========================>SubscriberPromise0400_2=========4==============>");
		console.info("==========================>SubscriberPromise0400_2=========CommonEventSubscriber0400_2==============>" + CommonEventSubscriber0400_2);
		CommonEventSubscriber0400_2.finishCommonEvent().then(() => {
			console.info("==========================>finishCommonEventPromise0400_2=======================>");
		});
		console.info("==========================>SubscriberCallBack0400_2=========5==============>");
    }
	
    async function GetSubscribeInfoCallBack(err, data) {
        console.info("==========================>GetSubscribeInfoCallBack event = " + data.events[0]);
        switch (data.events[0]) {
            case "publish_event0100":
                console.info("=====ActsSubscriber_test_0100====GetSubscribeInfoCallBack===========");
                expect(data.events[0]).assertEqual("publish_event0100");
                if (num == 0) {
                    num = 1;
                    console.info("======GetSubscribeInfoCallBack=====num " + num);
                    console.info("======test_0100====GetSubscribeInfoCallBack=====num " + num);
                    CommonEventSubscriber0100 = CommonEventSubscriber;
                    await Subscriber.subscribe(CommonEventSubscriber, SubscriberCallBack0100);
                    console.info("======test_0100====GetSubscribeInfoCallBack=====after call subscribe");
                } else {
                    console.info("======test_0101====GetSubscribeInfoCallBack=====num " + num);
                    CommonEventSubscriber0101 = CommonEventSubscriber;
                    await Subscriber.subscribe(CommonEventSubscriber, SubscriberCallBack0101);
                    console.info("======test_0101====GetSubscribeInfoCallBack2=====after call subscribe");
                    num = 0;
                }

                break;

            default:
                break;
        }
    }

    async function GetSubscribeInfoCallBack0200_1(err, data) {
        console.info("==========================>GetSubscribeInfoCallBack0200_1 data.events[0] = " + data.events[0]);
        console.info("==========================>GetSubscribeInfoCallBack0200_1 data.events[1] = " + data.events[1]);
        expect(data.events[0]).assertEqual("publish_event0200");
        expect(data.events[1]).assertEqual("publish_event0201");
        await Subscriber.subscribe(CommonEventSubscriber0200_1, SubscriberCallBack0200_1);
        console.info("==========================>GetSubscribeInfoCallBack0200_1 end=========================");
    }

    async function GetSubscribeInfoCallBack0200_2(err, data) {
        console.info("==========================>GetSubscribeInfoCallBack0200_2 data.events[0] = " + data.events[0]);
        expect(data.events[0]).assertEqual("publish_event0201");
        await Subscriber.subscribe(CommonEventSubscriber0200_2, SubscriberCallBack0200_2);
        console.info("==========================>GetSubscribeInfoCallBack0200_2 end=========================");
    }

    async function GetSubscribeInfoCallBack0300_1(err, data) {
        console.info("==========================>GetSubscribeInfoCallBack0300_1 data.events[0] = " + data.events[0]);
        console.info("==========================>GetSubscribeInfoCallBack0300_1 data.events[1] = " + data.events[1]);
        expect(data.events[0]).assertEqual("publish_event0300");
        expect(data.events[1]).assertEqual("publish_event0301");
        await Subscriber.subscribe(CommonEventSubscriber0300_1, SubscriberCallBack0300_1);
        console.info("==========================>GetSubscribeInfoCallBack0300_1 end=========================");
    }

    async function GetSubscribeInfoCallBack0300_2(err, data) {
        console.info("==========================>GetSubscribeInfoCallBack0300_2 data.events[0] = " + data.events[0]);
        expect(data.events[0]).assertEqual("publish_event0301");
        await Subscriber.subscribe(CommonEventSubscriber0300_2, SubscriberCallBack0300_2);
        console.info("==========================>GetSubscribeInfoCallBack0300_2 end=========================");
    }

	async function GetSubscribeInfoCallBack0400_2(err, data) {
        console.info("==========================>GetSubscribeInfoCallBack0400_2 data.events[0] = " + data.events[0]);
        expect(data.events[0]).assertEqual("publish_event0400");
        await Subscriber.subscribe(CommonEventSubscriber0400_2, SubscriberCallBack0400_2);
        console.info("==========================>GetSubscribeInfoCallBack0400_2 end=========================");
    }

    async function CreateSubscriberCallBack(err, data) {
        console.info("==========================>CreateSubscriberCallBack=======================>");
        CommonEventSubscriber = data;
        await data.getSubscribeInfo(GetSubscribeInfoCallBack);
    }

    async function CreateSubscriberCallBack0200_1(err, data) {
        console.info("==========================>CreateSubscriberCallBack0200_1=======================>");
        CommonEventSubscriber0200_1 = data;
        await data.getSubscribeInfo(GetSubscribeInfoCallBack0200_1);
    }

    async function CreateSubscriberCallBack0200_2(err, data) {
        console.info("==========================>CreateSubscriberCallBack0200_2=======================>");
        CommonEventSubscriber0200_2 = data;
        await data.getSubscribeInfo(GetSubscribeInfoCallBack0200_2);
    }

    async function CreateSubscriberCallBack0300_1(err, data) {
        console.info("==========================>CreateSubscriberCallBack0300_1=======================>");
        CommonEventSubscriber0300_1 = data;
        await data.getSubscribeInfo(GetSubscribeInfoCallBack0300_1);
    }

    async function CreateSubscriberCallBack0300_2(err, data) {
        console.info("==========================>CreateSubscriberCallBack0300_2=======================>");
        CommonEventSubscriber0300_2 = data;
        await data.getSubscribeInfo(GetSubscribeInfoCallBack0300_2);
    }

	async function CreateSubscriberCallBack0400_2(err, data) {
        console.info("==========================>createSubscriberPromise0400_2=======================>");
        CommonEventSubscriber0400_2 = data;
        await data.getSubscribeInfo(GetSubscribeInfoCallBack0400_2);
    }
	
    //  @tc.number: ActsSubscriber_test_0100
    //  @tc.name: verify subscribe and publish : Check subscribe same event and publish common ordered event
    //  @tc.desc: Check the subscriber can receive event "publish_event0100" type of the interface (by CallBack)
    it('ActsSubscriber_test_0100', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0100==========================>");

        var CommonEventSubscribeInfo_1 = {
            events: ["publish_event0100"],
            priority: 10
        };

        var CommonEventSubscribeInfo_2 = {
            events: ["publish_event0100"],
            priority: 9
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
            bundleName: "publish_event0100_bundleName",
            code: 1,
            data: "publish_event1001_init",
            isOrdered: true,
            isSticky: false,
        }
        await Subscriber.publish("publish_event0100", CommonEventPublishData, PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_0200
    //  @tc.name: verify subscribe and publish : Check subscribe different event and publish common ordered event
    //  @tc.desc: Check the subscriber can receive event "publish_event0200" type of the interface (by CallBack)
    it('ActsSubscriber_test_0200', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0200==========================>");

        var CommonEventSubscribeInfo_1 = {
            events: ["publish_event0200",
                "publish_event0201"],
            priority: 10
        };

        var CommonEventSubscribeInfo_2 = {
            events: ["publish_event0201"],
            priority: 9
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo_1,
            CreateSubscriberCallBack0200_1
        )

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo_2,
            CreateSubscriberCallBack0200_2
        )

        var CommonEventPublishData1 = {
            bundleName: "publish_event0200_bundleName",
            code: 1,
            data: "publish_event0200_init",
            isOrdered: false,
            isSticky: false,
        }

        var CommonEventPublishData2 = {
            bundleName: "publish_event0201_bundleName",
            code: 1,
            data: "publish_event0201_init",
            isOrdered: true,
            isSticky: false,
        }

        await Subscriber.publish("publish_event0200", CommonEventPublishData1, PublishCallback);
        await Subscriber.publish("publish_event0201", CommonEventPublishData2, PublishCallback);
        done();
    })

    //  @tc.number: ActsSubscriber_test_0300
    //  @tc.name: verify subscribe and publish : Check subscribe different events and publish common ordered events
    //  @tc.desc: Check the subscriber can receive event "publish_event0300" type of the interface (by CallBack)
    it('ActsSubscriber_test_0300', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0300==========================>");

        var CommonEventSubscribeInfo_1 = {
            events: ["publish_event0300",
                "publish_event0301"],
            priority: 10
        };

        var CommonEventSubscribeInfo_2 = {
            events: ["publish_event0301"],
            priority: 9
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo_1,
            CreateSubscriberCallBack0300_1
        )

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo_2,
            CreateSubscriberCallBack0300_2
        )

        var CommonEventPublishData1 = {
            bundleName: "publish_event0300_bundleName",
            code: 1,
            data: "publish_event0300_init",
            isOrdered: false,
            isSticky: false,
        }

        var CommonEventPublishData2 = {
            bundleName: "publish_event0301_bundleName",
            code: 1,
            data: "publish_event0301_init",
            isOrdered: true,
            isSticky: false,
        }
        var numindex = 0;
        for (; numindex < 3; ++numindex) {
            await Subscriber.publish("publish_event0300", CommonEventPublishData1, PublishCallback);
            await Subscriber.publish("publish_event0301", CommonEventPublishData2, PublishCallback);
        }
        done();
    })

    //  @tc.number: ActsSubscriber_test_0400
    //  @tc.name: verify subscribe and publish : Check subscribe same events and publish common ordered events
    //  @tc.desc: Check the subscriber can receive event "publish_event0400" type of the interface (by promise)
    it('ActsSubscriber_test_0400', 0, async function (done) {
        console.info("===============ActsSubscriber_test_0400==========================>");

        var CommonEventSubscribeInfo_1 = {
            events: ["publish_event0400"],
            priority: 10
        };

        var CommonEventSubscribeInfo_2 = {
            events: ["publish_event0400"],
            priority: 9
        };

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo_1
        ).then((data) => {
            console.info("==========================>createSubscriberPromise0400_1=======================>");
            CommonEventSubscriber0400_1 = data;
            data.getSubscribeInfo().then((data)=>{
                console.info("==========================>GetSubscribeInfoPromisek0400_1 data.events[0] = " + data.events[0]);
                expect(data.events[0]).assertEqual("publish_event0400");
                Subscriber.subscribe(CommonEventSubscriber0400_1, SubscriberCallBack0400_1);
            })
        })

        await Subscriber.createSubscriber(
            CommonEventSubscribeInfo_2,
			CreateSubscriberCallBack0400_2
        );

        var CommonEventPublishData = {
            bundleName: "publish_event0400_bundleName",
            code: 1,
            data: "publish_event0400_init",
            isOrdered: true,
            isSticky: false,
        }
        await Subscriber.publish("publish_event0400", CommonEventPublishData, PublishCallback);
        done();
    })
})
