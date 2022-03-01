/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import accessibility from '@ohos.accessibility'

const bundleName = 'com.sample.testfora11y';
const triggerAction = 'accessibilityFocus';
const eventType = 'accessibilityFocus';

describe('AccessibleSendEvent', function () {

    beforeEach(async function (done) {
        console.info(`AccessibleSendEvent: beforeEach starts`);
        done();
    })

    afterEach(async function (done) {
        console.info(`AccessibleSendEvent: afterEach starts`);
        setTimeout(done, 1000);
    })
    
    /******************************************************************************** */
    /* Cases SendEventAccessibility_0010-0020 & SendEventAccessibilityNull_0010-0020  */
    /*    are for accessibility.sendEvent() API test                                  */
    /******************************************************************************** */
    
    /*
    * @tc.number  SendEventAccessibility_0010
    * @tc.name    SendEventAccessibility_0010
    * @tc.desc    The parameter input is EventInfo, test the sendEvent() function,
    *             and should return true.
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SendEventAccessibility_0010', 0, async function (done) {
        console.info('SendEventAccessibility_0010');
        let event = new accessibility.EventInfo();
        event.type = eventType;
        event.bundleName = bundleName;
        event.triggerAction = triggerAction;

        accessibility.sendEvent(event, (err, data) => {
            if (err.code != 0) {
                console.error(`AccessibleSendEvent: SendEventAccessibility_0010 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            console.info(`AccessibleSendEvent: SendEventAccessibility_0010 data ${data}`);
            expect(data).assertEqual(true);
            done();
        })
    })

    /*
    * @tc.number  SendEventAccessibility_0020
    * @tc.name    SendEventAccessibility_0020
    * @tc.desc    The parameter input is EventInfo, test the sendEvent() function,
    *             and should return true.
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SendEventAccessibility_0020', 0, async function (done) {
        console.info('SendEventAccessibility_0020');
        let event = new accessibility.EventInfo();
        event.type = eventType;
        event.bundleName = bundleName;
        event.triggerAction = triggerAction;

        accessibility.sendEvent(event).then((result) => {
            console.info(`AccessibleSendEvent: SendEventAccessibility_0020 data ${result}`);
            expect(result).assertEqual(true);
            done();
        }).catch((err) => {
            console.error(`AccessibleSendEvent: SendEventAccessibility_0020 has error: ${err}`);
            expect(null).assertFail();
            done();
        });
    })

    /*
    * @tc.number  SendEventAccessibilityNull_0010
    * @tc.name    SendEventAccessibilityNull_0010
    * @tc.desc    The parameter input is null, test the sendEvent() function,
    *             and should return false.
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SendEventAccessibilityNull_0010', 0, async function (done) {
        console.info('SendEventAccessibilityNull_0010');
        let event = null;

        accessibility.sendEvent(event, (err, data) => {
            if (err.code != 0) {
                console.error(`AccessibleSendEvent: SendEventAccessibilityNull_0010 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            console.info(`AccessibleSendEvent: SendEventAccessibilityNull_0010 data ${data}`);
            expect(data).assertEqual(false);
            done();
        })
    })

    /*
    * @tc.number  SendEventAccessibilityNull_0020
    * @tc.name    SendEventAccessibilityNull_0020
    * @tc.desc    The parameter input is null, test the sendEvent() function,
    *             and should return false.
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SendEventAccessibilityNull_0020', 0, async function (done) {
        console.info('SendEventAccessibilityNull_0020');
        let event = null;

        accessibility.sendEvent(event).then((result) => {
            console.info(`AccessibleSendEvent: SendEventAccessibilityNull_0020 data ${result}`);
            expect(result).assertEqual(false);
            done();
        }).catch((err) => {
            console.error(`AccessibleSendEvent: SendEventAccessibilityNull_0020 has error: ${err}`);
            expect(null).assertFail();
            done();
        });
    })
    
    
})

