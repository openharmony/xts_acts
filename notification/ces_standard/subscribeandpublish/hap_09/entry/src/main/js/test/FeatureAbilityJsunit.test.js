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

	var CommonEventSubscriber0900;

	function PublishCallBack0900() {
		console.info("==========================>PublishCallBack0900=======================>");
	}

	function SubscriberCallBack0900(data) {
		console.info("==========================>SubscriberCallBack0900=======================>");
		expect(data.event).assertEqual("publish_event0900");
		CommonEventSubscriber0900.isStickyCommonEvent().then((data) => {
			console.info("==========================>StickyCommonEventPromise0900=======================>");
			expect(data).assertEqual(false);
		});
	}

	//  @tc.number: ActsSubscriber_test_0900
	//  @tc.name: verify subscribe and publish : Check subscribe and publish common event with common event data
	//  @tc.desc: Check the subscriber can receive event "publish_event0900" type of the interface (by Promise)
	it('ActsSubscriber_test_0900', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["publish_event0900"]
		};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo
		).then((data) => {
			console.info("==========================>createSubscriberPromise0900=======================>");
			CommonEventSubscriber0900 = data;
		});

		await Subscriber.subscribe(CommonEventSubscriber0900, SubscriberCallBack0900);

		var CommonEventPublishData = {
			isOrdered: false,
			isSticky: false
		}

		Subscriber.publish("publish_event0900", CommonEventPublishData, PublishCallBack0900);
		done();
	})
})

