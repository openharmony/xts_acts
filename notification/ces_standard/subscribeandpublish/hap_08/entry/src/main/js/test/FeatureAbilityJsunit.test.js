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

	var CommonEventSubscriber0800;

	function PublishCallBack0800() {
		console.info("==========================>PublishCallBack0800=======================>");
	}

	function SubscriberCallBack0800(data) {
		console.info("==========================>SubscriberCallBack0800=======================>");
		expect(data.event).assertEqual("publish_event0800");
		CommonEventSubscriber0800.getSubscribeInfo().then((data) => {
			console.info("==========================>getSubscribeInfoPromise0900=======================>");
			expect(Array.isArray(data.events)).assertEqual(true);
			expect(data.events[0]).assertEqual("publish_event0900");
		});
	}

	//  @tc.number: ActsSubscriber_test_0800
	//  @tc.name: verify subscribe and publish : Check subscribe and publish common event
	//  @tc.desc: Check the subscriber can receive event "publish_event0800" type of the interface (by Promise)
	it('ActsSubscriber_test_0800', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["publish_event0800"]
		};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo
		).then((data) => {
			console.info("==========================>createSubscriberPromise0800=======================>");
			CommonEventSubscriber0800 = data;
		});

		await Subscriber.subscribe(CommonEventSubscriber0800, SubscriberCallBack0800);

		Subscriber.publish("publish_event0800", PublishCallBack0800);
		done();
	})
})

