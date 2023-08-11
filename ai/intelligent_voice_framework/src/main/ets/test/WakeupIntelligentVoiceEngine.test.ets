/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import intelligentVoice from '@ohos.ai.intelligentVoice';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function wakeupIntelligentVoiceEngineTest() {
describe('ActsWakeupIntelligentVoiceEngineTest', function () {
    let tag = "wakeupIntelligentvoiceEngineTest";
    console.info(`${tag}: Create WakeupIntelligentvoiceEngine Object JS Framework`);
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    function releaseWakeupEngine(wakeupEngine, done) {
        try {
            wakeupEngine.release(err => {
                if (err) {
                    console.info(`${tag} releaseWakeupEngine err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} releaseWakeupEngine success`);
                    done();
                }
            });
        } catch (error) {
            console.info(`${tag} failed to releaseWakeupEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    function getParameter(wakeupEngine, key, done) {
        try {
            wakeupEngine.getParameter(key, (err, data) => {
                if (err) {
                    console.info(`${tag} get parameter err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} get parameter success`);
                    let param = data;
                    expect(param).assertEqual('value');
                    releaseWakeupEngine(wakeupEngine, done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to get parameter: ${JSON.stringify(error)}`);
            done();
        }
    }

    function setParameter(wakeupEngine, key, value, done) {
        try {
            wakeupEngine.setParameter(key, value, err => {
                if (err) {
                    console.info(`${tag} set parameter err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} set parameter success`);
                    getParameter(wakeupEngine, 'key', done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to set parameter: ${JSON.stringify(error)}`);
            done();
        }
    }

    function setSensibility(wakeupEngine, sensibility, done) {
        try {
            wakeupEngine.setSensibility(sensibility, err => {
                if (err) {
                    console.info(`${tag} set sensibility err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} set sensibility success`);
                    setParameter(wakeupEngine, 'scene', '0', done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to set sensibility: ${JSON.stringify(error)}`);
            done();
        }
    }

    function setWakeupHapInfo(wakeupEngine, wakeupHapInfo, done) {
        try {
            wakeupEngine.setWakeupHapInfo(wakeupHapInfo, err => {
                if (err) {
                    console.info(`${tag} set wakeup hap info err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} set wakeup hap info success`);
                    setSensibility(wakeupEngine, intelligentVoice.SensibilityType.MIDDLE_SENSIBILITY, done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to set wakeup hap info: ${JSON.stringify(error)}`);
            done();
        }
    }

    function getSupportedRegions(wakeupEngine, done) {
        try {
            wakeupEngine.getSupportedRegions((err, data) => {
                if (err) {
                    console.log(`${tag} get supported regions err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} get supported regions success`);
                    let regions = data;
                    expect(regions.length).assertEqual(1);
                    for (let region in regions) {
                        console.info(`supported region: ${region}`);
                    }
                    let wakeupHapInfo = {
                        bundleName: 'example_bundle_name',
                        abilityName: 'example_ability_name'
                    }
                    setWakeupHapInfo(wakeupEngine, wakeupHapInfo, done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to createEnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }
    function wakeupAsync(wakeupEngine, done) {
        try {
            let descriptor = {
                needReconfirm: true,
                wakeupPhrase: '小艺小艺'
            }
            intelligentVoice.createWakeupIntelligentVoiceEngine(descriptor, (err, data) => {
                if (err) {
                    console.log(`${tag} createWakeupIntelligentVoiceEngine err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} createWakeupIntelligentVoiceEngine success`);
                    wakeupEngine = data;
                    getSupportedRegions(wakeupEngine, done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to createWakeupIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    async function wakeupPromise(descriptor, done) {
        let wakeupEngine = null;
        try {
            wakeupEngine = await intelligentVoice.createWakeupIntelligentVoiceEngine(descriptor);
            console.log(`${tag} createWakeupIntelligentVoiceEngine success`);
        } catch (error) {
            console.info(`${tag} failed to createWakeupIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            let regions = await wakeupEngine.getSupportedRegions();
            console.log(`${tag} get supported regions success`);
            expect(regions.length).assertEqual(1);
            for (let region in regions) {
                console.info(`supported region: ${region}`);
            }
        } catch (error) {
            console.info(`${tag} failed to get supported regions: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            let wakeupHapInfo = {
                bundleName: 'example_bundle_name',
                abilityName: 'example_ability_name'
            }
            await wakeupEngine.setWakeupHapInfo(wakeupHapInfo);
            console.log(`${tag} set wakeup hap info success`);
        } catch (error) {
            console.info(`${tag} failed to set wakeup hap info: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            await wakeupEngine.setSensibility(intelligentVoice.SensibilityType.HIGH_SENSIBILITY);
            console.log(`${tag} set sensibility success`);
        } catch(error) {
            console.info(`${tag} failed to set sensibility: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            await wakeupEngine.setParameter('scene', '0');
            console.log(`${tag} set parameter success`);
        } catch(error) {
            console.info(`${tag} failed to set parameter: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            let param = await wakeupEngine.getParameter('key');
            console.log(`${tag} get parameter success`);
            expect(param).assertEqual('value');
        } catch(error) {
            console.info(`${tag} failed to get parameter: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            wakeupEngine.on('wakeupIntelligentVoiceEvent', (callback) => {
                console.info(`${tag}: wakeup intelligentvoice event`);
                for (let prop in callback) {
                    console.info(`${tag}: intelligentvoice prop: ${prop}`);
                }
            });
            console.log(`${tag} register wakeup event success`);
            wakeupEngine.off('wakeupIntelligentVoiceEvent');
            console.log(`${tag} unregister wakeup event success`);
            expect(true).assertTrue();
            done();
        } catch(error) {
            console.info(`${tag} failed to register wakeup event: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            await wakeupEngine.release();
            console.log(`${tag} release WakeupIntelligentVoiceEngine success`);
        } catch(error) {
            console.info(`${tag} failed to release WakeupIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }
        done();
    }
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async function () {
    // Presets an action, which is performed only once before all test cases of the test suite start.
    // This API supports only one parameter: preset action function.
    console.info(`${tag}: beforeAll: Prerequisites at the test suite level`);
    await sleep(100);
    console.info(`${tag}: beforeAll: END`);
    })
    beforeEach(async function () {
    console.info(`${tag}: beforeEach: Prerequisites at the test case level`);
    await sleep(100);
    })
    afterEach(async function () {
    console.info(`${tag}: afterEach: Test case-level clearance conditions`);
    await sleep(100);
    })
    afterAll(function () {
    console.info(`${tag}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_WAKEUP_PROCESS_ASYNC_0100
     *@tc.name      : INTELLIGENT_VOICE_WAKEUP_PROCESS_ASYNC
     *@tc.desc      : INTELLIGENT_VOICE_WAKEUP_PROCESS_ASYNC
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 3
     */
    it('SUB_AI_INTELLIGENT_VOICE_WAKEUP_PROCESS_ASYNC_0100', 3, async function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let wakeupEngine = null;

        wakeupAsync(wakeupEngine, done);
    })
    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_WAKEUP_PROCESS_PROMISE_0100
     *@tc.name      : INTELLIGENT_VOICE_WAKEUP_PROCESS_PROMISE
     *@tc.desc      : INTELLIGENT_VOICE_WAKEUP_PROCESS_PROMISE
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 3
     */
    it('SUB_AI_INTELLIGENT_VOICE_WAKEUP_PROCESS_PROMISE_0100', 3, async function (done) {
    // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let descriptor = {
            needApAlgEngine: true,
            wakeupPhrase: '小艺小艺'
        }
        wakeupPromise(descriptor, done);
    })
})
}