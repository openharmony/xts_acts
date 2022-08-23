/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import accessibility from '@ohos.accessibility'
import commonEvent from '@ohos.commonEvent'

export default function abilityTest() {
    let targetBundleName = 'com.example.accessibilityxts';
    let subScriber = undefined;
    let isConnected: boolean = false;
    let events: Array<any> = [];

    describe('AccessibilityEventTest', function () {
        beforeAll(async function (done) {
            console.info('AccessibilityEventTest beforeAll');
            subScriber = await commonEvent.createSubscriber({events: ['onConnectState', 'accessibilityEvent']});
            commonEvent.subscribe(subScriber, (err, data) => {
                console.info('AccessibilityEventTest beforeAll data:' + JSON.stringify(data) );
                if (data.data == 'connect') {
                    isConnected = true;
                } else if (data.data == 'disconnect') {
                    isConnected = false;
                } else if (data.data == 'accessibilityEvent') {
                    events.push(data.parameters);
                }
            });

            setTimeout(async () => {
                await globalThis.abilityContext.startAbility({
                    deviceId: "",
                    bundleName: "com.example.acetest",
                    abilityName: "MainAbility",
                    action: "action1",
                    parameters: {},
                });
                done();
            }, 5000);
        })

        afterAll(async function (done) {
            console.info('AccessibilityEventTest: afterAll');
            commonEvent.unsubscribe(subScriber);
            isConnected = false;
            done();
        })

        beforeEach(async function (done) {
            console.info(`AccessibilityEventTest: beforeEach`);
            events.length = 0;
            setTimeout(done, 2000);
        })

        afterEach(async function (done) {
            console.info(`AccessibilityEventTest: afterEach`);
            done();
        })


        /*
         * @tc.number  AccessibilityEventTest_0100
         * @tc.name    AccessibilityEventTest_0100
         * @tc.desc    The parameter input is 'accessibilityFocus', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0100', 0, async function (done) {
            console.info(`AccessibilityEventTest_0100`);
            let event = new accessibility.EventInfo({});
            event.type = 'accessibilityFocus';
            event.bundleName = targetBundleName;
            event.triggerAction = 'accessibilityFocus';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'accessibilityFocus') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0100 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_0200
         * @tc.name    AccessibilityEventTest_0200
         * @tc.desc    The parameter input is 'accessibilityFocusClear', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0200', 0, async function (done) {
            console.info(`AccessibilityEventTest_0200`);
            let event = new accessibility.EventInfo({});
            event.type = 'accessibilityFocusClear';
            event.bundleName = targetBundleName;
            event.triggerAction = 'clearAccessibilityFocus';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'accessibilityFocusClear') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0200 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_0300
         * @tc.name    AccessibilityEventTest_0300
         * @tc.desc    The parameter input is 'click', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0300', 0, async function (done) {
            console.info(`AccessibilityEventTest_0300`);
            let event = new accessibility.EventInfo({});
            event.type = 'click';
            event.bundleName = targetBundleName;
            event.triggerAction = 'click';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'click') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0300 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_0400
         * @tc.name    AccessibilityEventTest_0400
         * @tc.desc    The parameter input is 'longClick', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0400', 0, async function (done) {
            console.info(`AccessibilityEventTest_0400`);
            let event = new accessibility.EventInfo({});
            event.type = 'longClick';
            event.bundleName = targetBundleName;
            event.triggerAction = 'longClick';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'longClick') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0400 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_0500
         * @tc.name    AccessibilityEventTest_0500
         * @tc.desc    The parameter input is 'focus', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0500', 0, async function (done) {
            console.info(`AccessibilityEventTest_0500`);
            let event = new accessibility.EventInfo({});
            event.type = 'focus';
            event.bundleName = targetBundleName;
            event.triggerAction = 'focus';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'focus') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0500 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_0600
         * @tc.name    AccessibilityEventTest_0600
         * @tc.desc    The parameter input is 'select', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0600', 0, async function (done) {
            console.info(`AccessibilityEventTest_0600`);
            let event = new accessibility.EventInfo({});
            event.type = 'select';
            event.bundleName = targetBundleName;
            event.triggerAction = 'select';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'select') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0600 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_0700
         * @tc.name    AccessibilityEventTest_0700
         * @tc.desc    The parameter input is 'hoverEnter', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0700', 0, async function (done) {
            console.info(`AccessibilityEventTest_0700`);
            let event = new accessibility.EventInfo({});
            event.type = 'hoverEnter';
            event.bundleName = targetBundleName;
            event.triggerAction = 'focus';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'hoverEnter') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0700 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_0800
         * @tc.name    AccessibilityEventTest_0800
         * @tc.desc    The parameter input is 'hoverExit', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0800', 0, async function (done) {
            console.info(`AccessibilityEventTest_0800`);
            let event = new accessibility.EventInfo({});
            event.type = 'hoverExit';
            event.bundleName = targetBundleName;
            event.triggerAction = 'focus';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'hoverExit') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0800 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_0900
         * @tc.name    AccessibilityEventTest_0900
         * @tc.desc    The parameter input is 'textUpdate', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_0900', 0, async function (done) {
            console.info(`AccessibilityEventTest_0900`);
            let event = new accessibility.EventInfo({});
            event.type = 'textUpdate';
            event.bundleName = targetBundleName;
            event.triggerAction = 'cut';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'textUpdate') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_0900 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_1000
         * @tc.name    AccessibilityEventTest_1000
         * @tc.desc    The parameter input is 'textSelectionUpdate', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_1000', 0, async function (done) {
            console.info(`AccessibilityEventTest_1000`);
            let event = new accessibility.EventInfo({});
            event.type = 'textSelectionUpdate';
            event.bundleName = targetBundleName;
            event.triggerAction = 'setSelection';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'textSelectionUpdate') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_1000 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_1100
         * @tc.name    AccessibilityEventTest_1100
         * @tc.desc    The parameter input is 'scroll', test the Ability event function,
         *             and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_1100', 0, async function (done) {
            console.info(`AccessibilityEventTest_1100`);
            let event = new accessibility.EventInfo({});
            event.type = 'scroll';
            event.bundleName = targetBundleName;
            event.triggerAction = 'scrollForward';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    if (item.eventType == 'scroll') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_1100 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_1200
         * @tc.name    AccessibilityEventTest_1200
         * @tc.desc    The parameter input is 'scroll', test the Ability event function,
         *             and return void, verify existence of 'target'. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_1200', 0, async function (done) {
            console.info(`AccessibilityEventTest_1200`);
            let event = new accessibility.EventInfo({});
            event.type = 'scroll';
            event.bundleName = targetBundleName;
            event.triggerAction = 'scrollForward';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    console.info(`AccessibilityEventTest_1200 haveTarget: ${item.haveTarget}`);
                    if (item.eventType == 'scroll' && item.haveTarget) {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_1200 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })

        /*
         * @tc.number  AccessibilityEventTest_1300
         * @tc.name    AccessibilityEventTest_1300
         * @tc.desc    The parameter input is 'scroll', test the Ability event function,
         *             and return void, verify existence of 'timeStamp'. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityEventTest_1300', 0, async function (done) {
            console.info(`AccessibilityEventTest_1300`);
            let event = new accessibility.EventInfo({});
            event.type = 'scroll';
            event.bundleName = targetBundleName;
            event.triggerAction = 'scrollForward';
            await accessibility.sendEvent(event);

            setTimeout(() => {
                let findResult = false;
                for (let item of events) {
                    console.info(`AccessibilityEventTest_1300 timeStamp: ${item.timeStamp}`);
                    if (item.eventType == 'scroll' && typeof(item.timeStamp) == 'number') {
                        findResult = true;
                    }
                }
                console.info('AccessibilityEventTest_1300 case: ' + findResult);
                expect(findResult).assertTrue();
                done();
            }, 3000);
        })
    })
}