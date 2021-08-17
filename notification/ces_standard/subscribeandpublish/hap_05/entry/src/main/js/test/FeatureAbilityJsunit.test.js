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

	var CommonEventSubscriber0500;

	function PublishCallBack0500() {
		console.info("==========================>PublishCallBack0500=======================>");
	}

    function OrderedCommonEventCallBack0500(data) {
        console.info("==========================>OrderedCommonEventCallBack0500=======================>");
        expect(data).assertEqual(false);
	}

	function SubscriberCallBack0500(data) {
		console.info("==========================>SubscriberCallBack0500=======================>");
        expect(data.event).assertEqual("publish_event0500");
        CommonEventSubscriber0500.isOrderedCommonEvent(OrderedCommonEventCallBack0500);
	}

	function CreateSubscriberCallBack0500(data) {
		console.info("==========================>CreateSubscriberCallBack0500=======================>");
		CommonEventSubscriber0500 = data;
	}

	//  @tc.number: ActsSubscriber_test_0500
    //  @tc.name: verify subscribe and publish : Check subscribe and publish sticky event
    //  @tc.desc: Check the subscriber can receive event "publish_event0500" type of the interface (by CallBack)
	it('ActsSubscriber_test_0500', 0, async function (done) {

		var CommonEventSubscribeInfo = {
			events: ["publish_event0500"]
    	};

		await Subscriber.createSubscriber(
			CommonEventSubscribeInfo,
	 		CreateSubscriberCallBack0500
		)

		await Subscriber.subscribe(CommonEventSubscriber0500, SubscriberCallBack0500);

        var CommonEventPublishData = {
            isOrdered: false,
            isSticky: true,
		}

		Subscriber.publish("publish_event0500", CommonEventPublishData, PublishCallBack0500);
		done();
	})
})

