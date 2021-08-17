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

describe('ActsSubscriberTest', function () {

	var CommonEventSubscriber0400;

	function PublishCallBack0400() {
		console.info("==========================>PublishCallBack0400=======================>");
	}

    function CommonEventSubscribeInfoCallBack0400(data) {
        console.info("==========================>CommonEventSubscribeInfoCallBack0400=======================>");
		expect(Array.isArray(data.events)).assertEqual(true);
		expect(data.events[0]).assertEqual("PublishData0700");
	}

	function SubscriberCallBack0400(data) {
		console.info("==========================>SubscriberCallBack0400=======================>");
        expect(data.event).assertEqual("publish_event0400");
		console.info("==========================>SubscriberCallBack0400  event = "+ data.event);
		expect(data.bundleName).assertEqual("PublishBundleName0400");
		console.info("==========================>SubscriberCallBack0400  bundleName = "+ data.bundleName);
		expect(data.code).assertEqual(55);
		console.info("==========================>SubscriberCallBack0400  code = "+ data.code);
		expect(data.data).assertEqual("PublishBundleName0400");
		console.info("==========================>SubscriberCallBack0100  data = " + data.data);
		CommonEventSubscriber0400.getSubscribeInfo(CommonEventSubscribeInfoCallBack0400);
		console.info("==========================>after call getSubscribeInfo=======================>");
	}

	function CreateSubscriberCallBack0400(data) {
		console.info("==========================>CreateSubscriberCallBack0400=======================>");
		CommonEventSubscriber0400 = data;
	}

	//  @tc.number: ActsSubscriber_test_0400
    //  @tc.name: verify subscribe and publish : Check subscribe and publish common event data with commoneventdata
    //  @tc.desc: Check the subscriber can receive event "publish_event0400" type of the interface (by CallBack)
	it('ActsSubscriber_test_0400', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["publish_event0400"],
			publisherDeviceId: "PublishDeviceId0100",
			priority: 10,
    	};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo,
	 		CreateSubscriberCallBack0400
		)

		await Subscriber.subscribe(CommonEventSubscriber0400, SubscriberCallBack0400);

        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: false,
			bundleName: "PublishBundleName0400",
			code: 55,
			data: "PublishData0700",
		}

		Subscriber.publish("publish_event0400", CommonEventPublishData, PublishCallBack0400);
		done();
	})
})

