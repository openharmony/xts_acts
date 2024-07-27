/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from './Utils'

const TAG = "ACTS_PhotoEditorExtension"

export default function abilityTest() {
    describe('ActsAbilityTest', () => {
        let globalscribe = undefined;

        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(() => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(() => {
            hilog.info(0x0000, TAG, `ACTS_PhotoEditorExtension beforeEach start`);

            let options = {
                url: 'testAbility/pages/p1',
            }
            let result;
            try {
                result = await router.pushUrl(options);
                await Utils.sleep(500);
                console.info("ACTS_PhotoEditorExtension push page result: " + JSON.stringify(result));
            } catch (err) {
                console.error("ACTS_PhotoEditorExtension push page error: " + err);
            }

            setTimeout(async () => {
                if (globalscribe !== undefined) {
                    Utils.unsubscribe(globalscribe)
                }
            }, 8000); // max wait 8s
        })
        afterEach(() => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })
        it('ACTS_PhotoEditorExtension_001', 0, () => {
            // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
            TAG = 'ACTS_PhotoEditorExtension_001 == ';

            let subscriber: commonEventManager.CommonEventSubscriber | null = null;
            let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
                events: ['ACTS_PhotoEditorExtension_OnRemoteReady'],
            };

            await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
                console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
                globalscribe = data;
                commonEventManager.subscribe(globalscribe, async (err, data) => {
                    console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

                    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
                    await abilityDelegator.executeShellCommand('aa dump -e').then((data) => {
                        console.info(TAG + 'data: ' + JSON.stringify(data));
                        var output = JSON.stringify(data);
                        try {
                            expect(output).assertContain("MuseEditorExtensionAbility");
                        } catch {
                            expect().assertFail();
                        }
                    });
                });
            }).catch((error) => {
                console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
                expect().assertFail();
            })
        })
    })
}