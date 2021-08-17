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

	var CommonEventSubscriber0200;

	function PublishCallBack0200() {
		console.info("==========================>PublishCallBack0200=======================>");
	}

	function CommonEventSubscribeInfoCallBack0200(data) {
		console.info("==========================>CommonEventSubscribeInfoCallBack0200=======================>");
		expect(Array.isArray(data.events)).assertEqual(true);
		expect(data.events[0]).assertEqual("@#￥#3243adsafdf_中文");
	}

	function SubscriberCallBack0200(data) {
		console.info("==========================>SubscriberCallBack0200=======================>");
		expect(data.event).assertEqual("@#￥#3243adsafdf_中文");
		CommonEventSubscriber0200.getSubscribeInfo(CommonEventSubscribeInfoCallBack0200);
	}

	function CreateSubscriberCallBack0200(data) {
		console.info("==========================>CreateSubscriberCallBack0200=======================>");
		CommonEventSubscriber0200 = data;
	}

	//  @tc.number: ActsSubscriber_test_0200
	//  @tc.name: verify subscribe and publish : Check subscribe and publish common event data
	//  @tc.desc: Check the subscriber can receive event "@#￥#3243adsafdf_中文" type of the interface (by CallBack)
	it('ActsSubscriber_test_0200', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["@#￥#3243adsafdf_中文"],
		};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo,
			CreateSubscriberCallBack0200
		)

		await Subscriber.subscribe(CommonEventSubscriber0200, SubscriberCallBack0200);

		Subscriber.publish("@#￥#3243adsafdf_中文", PublishCallBack0200);
		done();
	})
})

