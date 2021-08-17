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
	var CommonEventSubscriber0100;

	function PublishCallBack0100() {
		console.info("==========================>PublishCallBack0100=======================>");
	}

	function CommonEventSubscribeInfoCallBack0100(data) {
		console.info("==========================>CommonEventSubscribeInfoCallBack0100=======================>");
		expect(Array.isArray(data.events)).assertEqual(true);
		expect(data.events[0]).assertEqual("publish_event0100");
		console.info("===============CommonEventSubscribeInfoCallBack0100  data.events[0] = " + data.events[0]);
	}

	function SubscriberCallBack0100(data) {
		console.info("==========================>SubscriberCallBack0100=======================>");
		expect(data.event).assertEqual("publish_event0100");
		console.info("==========================>SubscriberCallBack0100  event = " + data.event);
		CommonEventSubscriber0100.getSubscribeInfo(CommonEventSubscribeInfoCallBack0100);
	}

	function CreateSubscriberCallBack0100(data) {
		console.info("==========================>CreateSubscriberCallBack0100=======================>");
		CommonEventSubscriber0100 = data;
	}

	//  @tc.number: ActsSubscriber_test_0100
	//  @tc.name: verify subscribe and publish : Check subscribe and publish common event data
	//  @tc.desc: Check the subscriber can receive event "publish_event0100" type of the interface (by CallBack)
	it('ActsSubscriber_test_0100', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["publish_event0100"],
		};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo,
			CreateSubscriberCallBack0100
		)

		await Subscriber.subscribe(CommonEventSubscriber0100, SubscriberCallBack0100);

		Subscriber.publish("publish_event0100", PublishCallBack0100);
		done();
	})
})

