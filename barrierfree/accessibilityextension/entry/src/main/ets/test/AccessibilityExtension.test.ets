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
import commonEvent from '@ohos.commonEvent'
import config from '@ohos.accessibility.config'

export default function abilityTest() {
    let isCalled: boolean = false;
    let subScriber = undefined;

    describe('AccessibilityExtensionTest', function () {
        beforeAll(async function (done) {
            console.info('AccessibilityExtensionTest: beforeAll');
            subScriber = await commonEvent.createSubscriber({events: ['onConnectState']});
            commonEvent.subscribe(subScriber, (err, data) => {
                console.info('AccessibilityExtensionTest beforeAll subscribe data:' + JSON.stringify(data) );
                isCalled = (data.data == 'connect');
            });
            setTimeout(done, 5000);
        })

        afterAll(async function (done) {
            console.info('AccessibilityExtensionTest: afterAll');
            commonEvent.unsubscribe(subScriber);
            done();
        })

        beforeEach(async function (done) {
            console.info(`AccessibilityExtensionTest: beforeEach`);
            done();
        })

        afterEach(async function (done) {
            console.info(`AccessibilityExtensionTest: afterEach`);
            done();
        })


        /*
         * @tc.number  AccessibilityExtensionTest_Connect_0100
         * @tc.name    AccessibilityExtensionTest_Connect_0100
         * @tc.desc    The parameter input is null, test the ExtensionAbility onConnect function,
         *             and return undefined 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityExtensionTest_Connect_0100', 0, async function (done) {
            console.info('AccessibilityExtensionTest_Connect_0100: start');
            config.enableAbility('com.example.accessibilityxts/AccessibilityExtAbility',
                                    ["retrieve", "touchGuide", "gesture"]
            ).then(() => {
                console.info(`AccessibilityExtensionTest enableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityExtensionTest enableAbility has error: ${err.code}`);
            });

            setTimeout(() => {
                console.info('AccessibilityExtensionTest_Connect_0100 isCalled : ' + isCalled);
                expect(isCalled).assertEqual(true);
                done();
            }, 5000);
        })

        /*
         * @tc.number  AccessibilityExtensionTest_Disconnect_0200
         * @tc.name    AccessibilityExtensionTest_Disconnect_0200
         * @tc.desc    The parameter input is null, test the ExtensionAbility onDisconnect function,
         *             and return undefined 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityExtensionTest_Disconnect_0200', 0, async function (done) {
            console.info('AccessibilityExtensionTest_Disconnect_0200 start');
            config.disableAbility('com.example.accessibilityxts/AccessibilityExtAbility').then(() => {
                console.info(`AccessibilityExtensionTest disableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityExtensionTest disableAbility has error: ${err.code}`);
            });

            setTimeout(() => {
                console.info('AccessibilityExtensionTest_Disconnect_0200 isCalled : ' + isCalled);
                expect(isCalled).assertEqual(false);
                done();
            }, 5000);
        })
    })
}