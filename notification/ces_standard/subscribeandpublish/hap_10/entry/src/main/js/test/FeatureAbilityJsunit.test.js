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

	var CommonEventSubscriber1000;

	function PublishCallBack1000() {
		console.info("==========================>PublishCallBack1000=======================>");
	}

	function SubscriberCallBack1000(data) {
		console.info("==========================>SubscriberCallBack1000=======================>");
		expect(data.event).assertEqual("publish_event1000");
		CommonEventSubscriber1000.isOrderedCommonEvent().then((data) => {
			console.info("==========================>OrderedCommonEventCallBack0900=======================>");
			expect(data).assertEqual(false);
		});
	}

	//  @tc.number: ActsSubscriber_test_1000
	//  @tc.name: verify subscribe and publish : Check subscribe and publish sticky event
	//  @tc.desc: Check the subscriber can receive event "publish_event1000" type of the interface (by Promise)
	it('ActsSubscriber_test_1000', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["publish_event1000"]
		};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo
		).then((data) => {
			console.info("==========================>createSubscriberPromise1000=======================>");
			CommonEventSubscriber1000 = data;
		});

		Subscriber.subscribe(CommonEventSubscriber1000, SubscriberCallBack1000);

		var CommonEventPublishData = {
			isOrdered: false,
			isSticky: true
		}

		Subscriber.publish("publish_event1000", CommonEventPublishData, PublishCallBack1000);
		done();
	})
})

