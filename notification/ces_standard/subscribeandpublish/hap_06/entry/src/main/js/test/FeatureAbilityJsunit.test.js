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

	var CommonEventSubscriber0600;

	function PublishCallBack0600() {
		console.info("==========================>PublishCallBack0600=======================>");
	}

    function StickyCommonEventCallBack0600(data) {
        console.info("==========================>StickyCommonEventCallBack0600=======================>");
        expect(data).assertEqual(true);
	}


	function SubscriberCallBack0600(data) {
		console.info("==========================>SubscriberCallBack0600=======================>");
	}

	function SubscriberCallBack20600(data) {
		console.info("==========================>SubscriberCallBack20600=======================>");
        expect(data.event).assertEqual("@#￥#3243adsafdf_");
        CommonEventSubscriber0600.isStickyCommonEvent(StickyCommonEventCallBack0600);
	}

	function CreateSubscriberCallBack0600(data) {
		console.info("==========================>CreateSubscriberCallBack0600=======================>");
		CommonEventSubscriber0600 = data;
	}

	//  @tc.number: ActsSubscriber_test_0600
    //  @tc.name: verify subscribe and publish : Check the same subscribe and different callback, and Check publish sticky event
    //  @tc.desc: Check the subscriber can receive event "@#￥#3243adsafdf_" type of the interface (by CallBack)
	it('ActsSubscriber_test_0600', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["@#￥#3243adsafdf_"]
    	};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo,
	 		CreateSubscriberCallBack0600
		)

		await Subscriber.subscribe(CommonEventSubscriber0600, SubscriberCallBack0600);
		await Subscriber.subscribe(CommonEventSubscriber0600, SubscriberCallBack20600);

        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: true,

		}

		Subscriber.publish("@#￥#3243adsafdf_", CommonEventPublishData, PublishCallBack0600);
		done();
	})
})

