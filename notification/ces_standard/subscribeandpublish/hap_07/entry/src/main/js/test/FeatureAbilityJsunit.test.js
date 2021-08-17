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

	var CommonEventSubscriber0700;

	function PublishCallBack0700() {
		console.info("==========================>PublishCallBack0700=======================>");
	}

	function SubscriberCallBack0700(data) {
		console.info("==========================>SubscriberCallBack0700=======================>");
		expect(data.event).assertEqual("@#￥#3243adsafdf_中文");
	}

	//  @tc.number: ActsSubscriber_test_0700
	//  @tc.name: verify subscribe and publish : Check subscribe and publish sticky event
	//  @tc.desc: Check the subscriber can receive event "@#￥#3243adsafdf_中文" type of the interface (by CallBack)
	function CreateSubscriberCallBack0700(data) {
		console.info("==========================>CreateSubscriberCallBack0700=======================>");
		CommonEventSubscriber0700 = data;
	}

	it('ActsSubscriber_test_0700', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["@#￥#3243adsafdf_中文"]
		};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo,
			CreateSubscriberCallBack0700
		)

		await Subscriber.subscribe(CommonEventSubscriber0700, SubscriberCallBack0700);

		var CommonEventPublishData = {
			isOrdered: false,
			isSticky: true,
		}

		Subscriber.publish("@#￥#3243adsafdf_中文", CommonEventPublishData, PublishCallBack0700);
		Subscriber.publish("@#￥#3243adsafdf_中文", CommonEventPublishData, PublishCallBack0700);
		done();
	})
})

