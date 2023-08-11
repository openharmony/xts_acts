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

export default function enrollIntelligentVoiceEngineTest() {
describe('ActsEnrollIntelligentVoiceEngineTest', function () {
    let tag = "enrollIntelligentvoiceEngineTest";
    console.info(`${tag}: Create EnrollIntelligentvoiceEngine Object JS Framework`);
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    function releaseEnrollEngine(enrollEngine, done) {
        try {
            enrollEngine.release(err => {
                if (err) {
                    console.info(`${tag} releaseEnrollEngine err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} releaseEnrollEngine success`);
                    done();
                }
            });
        } catch (error) {
            console.info(`${tag} failed to releaseEnrollEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    function getParameter(enrollEngine, key, done) {
        try {
            enrollEngine.getParameter(key, (err, data) => {
                if (err) {
                    console.info(`${tag} get parameter err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} get parameter success`);
                    let param = data;
                    expect(param).assertEqual('value');
                    releaseEnrollEngine(enrollEngine, done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to get parameter: ${JSON.stringify(error)}`);
            done();
        }
    }

    function setParameter(enrollEngine, key, value, done) {
        try {
            enrollEngine.setParameter(key, value, err => {
                if (err) {
                    console.info(`${tag} set parameter err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} set parameter success`);
                    getParameter(enrollEngine, 'key', done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to set parameter: ${JSON.stringify(error)}`);
            done();
        }
    }

    function setSensibility(enrollEngine, sensibility, done) {
        try {
            enrollEngine.setSensibility(sensibility, err => {
                if (err) {
                    console.info(`${tag} set sensibility err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} set sensibility success`);
                    setParameter(enrollEngine, 'scene', '0', done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to set sensibility: ${JSON.stringify(error)}`);
            done();
        }
    }

    function setWakeupHapInfo(enrollEngine, wakeupHapInfo, done) {
        try {
            enrollEngine.setWakeupHapInfo(wakeupHapInfo, err => {
                if (err) {
                    console.info(`${tag} set wakeup hap info err: ${JSON.stringify(err)}`);
                    done();
                    return;
                } else {
                    console.log(`${tag} set wakeup hap info success`);
                    setSensibility(enrollEngine, intelligentVoice.SensibilityType.MIDDLE_SENSIBILITY, done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to set wakeup hap info: ${JSON.stringify(error)}`);
            done();
        }
    }

    function commit(enrollEngine, done) {
        try {
            enrollEngine.commit((err, data) => {
                if (err) {
                    console.log(`${tag} commit err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} commit success`);
                    let wakeupHapInfo = {
                        bundleName: 'example_bundle_name',
                        abilityName: 'example_ability_name'
                    }
                    setWakeupHapInfo(enrollEngine, wakeupHapInfo, done);
                }
            });
        } catch(error) {
            console.info(`${tag} failed to commit: ${JSON.stringify(error)}`);
            done();
        }
    }

    function stopEnrollEngine(enrollEngine, done) {
        try {
            enrollEngine.stop((err) => {
                if (err) {
                    console.log(`${tag} stop enrollIntelligentvoiceEngine err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} stop enrollIntelligentvoiceEngine success`);
                    releaseEnrollEngine(enrollEngine, done);
                }
            });
        } catch(error) {
            console.info(`${tag} failed to start enrollIntelligentvoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    function startThenStopEnrollEngine(enrollEngine, done) {
        try {
            enrollEngine.enrollForResult(false, (err, data) => {
                if (err) {
                    console.log(`${tag} start enrollIntelligentvoiceEngine err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} start enrollIntelligentvoiceEngine success`);
                    expect(data).not().assertUndefined();
                    stopEnrollEngine(enrollEngine, done);
                }
            });
        } catch(error) {
            console.info(`${tag} failed to start enrollIntelligentvoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    function startEnrollEngine(enrollEngine, cnt, done) {
        try {
            enrollEngine.enrollForResult(false, (err, data) => {
                if (err) {
                    console.log(`${tag} start enrollIntelligentvoiceEngine err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} start enrollIntelligentvoiceEngine success, cnt: ${cnt}`);
                    expect(data).not().assertUndefined();
                    if (cnt < 0) {
                        startEnrollEngine(enrollEngine, cnt + 1, done);
                    } else {
                        commit(enrollEngine, done);
                    }
                }
            });
        } catch(error) {
            console.info(`${tag} failed to start enrollIntelligentvoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    function initEnrollEngine(enrollEngine, needStop, done) {
        let config = {
            language: 'zh',
            region: 'CN'
        }
        try {
            enrollEngine.init(config, (err, data) => {
                if (err) {
                    console.log(`${tag} init enrollIntelligentvoiceEngine err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} init enrollIntelligentvoiceEngine success`);
                    if (needStop) {
                        startThenStopEnrollEngine(enrollEngine, done);
                    } else {
                        startEnrollEngine(enrollEngine, 0, done);
                    }
                }
            });
        } catch(error) {
            console.info(`${tag} failed to init enrollIntelligentvoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    function getSupportedRegions(enrollEngine, done) {
        try {
            enrollEngine.getSupportedRegions((err, data) => {
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
                    initEnrollEngine(enrollEngine, false, done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to createEnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    function enrollAsync(enrollEngine, done) {
        try {
            let descriptor = {
                wakeupPhrase: '小艺小艺'
            }
            intelligentVoice.createEnrollIntelligentVoiceEngine(descriptor, (err, data) => {
                if (err) {
                    console.log(`${tag} createEnrollIntelligentVoiceEngine err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} createEnrollIntelligentVoiceEngine success`);
                    enrollEngine = data;
                    getSupportedRegions(enrollEngine, done);
                }
            });
        } catch (error) {
            console.info(`${tag} failed to createEnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    function stopEnrollAsync(enrollEngine, done) {
        try {
            let descriptor = {
                wakeupPhrase: '小艺小艺'
            }
            intelligentVoice.createEnrollIntelligentVoiceEngine(descriptor, (err, data) => {
                if (err) {
                    console.log(`${tag} createEnrollIntelligentVoiceEngine err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(`${tag} createEnrollIntelligentVoiceEngine success`);
                    enrollEngine = data;
                    initEnrollEngine(enrollEngine, true, done)
                }
            });
        } catch (error) {
            console.info(`${tag} failed to createEnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            done();
        }
    }

    async function enrollPromise(descriptor, done) {
        let enrollEngine = null;
        try {
            enrollEngine = await intelligentVoice.createEnrollIntelligentVoiceEngine(descriptor);
            console.log(`${tag} createEnrollIntelligentVoiceEngine success`);
        } catch (error) {
            console.info(`${tag} failed to createEnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            let regions = await enrollEngine.getSupportedRegions();
            console.log(`${tag} get supported regions success`);
            expect(regions.length).assertEqual(1);
            for (let region in regions) {
                console.info(`supported region: ${region}`);
            }
        } catch (error) {
            console.info(`${tag} failed to get supported regions : ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        let config = {
            language: 'zh',
            region: 'CN'
        }

        try {
            let initRet = await enrollEngine.init(config);
            console.log(`${tag} init EnrollIntelligentVoiceEngine success`);
        } catch(error) {
            console.info(`${tag} failed to init EnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            let startRet = await enrollEngine.enrollForResult(false);
            console.log(`${tag} start EnrollIntelligentVoiceEngine finish`);
            expect(startRet).not().assertUndefined();
        } catch(error) {
            console.info(`${tag} failed to start EnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            let commitRet = await enrollEngine.commit();
            console.log(`${tag} commit enroll finish`);
        } catch(error) {
            console.info(`${tag} failed to commit enroll: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            let wakeupHapInfo = {
                bundleName: 'example_bundle_name',
                abilityName: 'example_ability_name'
            }
            await enrollEngine.setWakeupHapInfo(wakeupHapInfo);
            console.log(`${tag} set wakeup hap info success`);
        } catch(error) {
            console.info(`${tag} failed to set wakeup hap info: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            await enrollEngine.setSensibility(intelligentVoice.SensibilityType.LOW_SENSIBILITY);
            console.log(`${tag} set sensibility success`);
        } catch(error) {
            console.info(`${tag} failed to set sensibility: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            await enrollEngine.setParameter('scene', '0');
            console.log(`${tag} set parameter success`);
        } catch(error) {
            console.info(`${tag} failed to set parameter: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            let param = await enrollEngine.getParameter('key');
            console.log(`${tag} get parameter success`);
            expect(param).assertEqual('value');
        } catch(error) {
            console.info(`${tag} failed to get parameter: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            await enrollEngine.release();
            console.log(`${tag} release EnrollIntelligentVoiceEngine success`);
        } catch(error) {
            console.info(`${tag} failed to release EnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }
        done();
    }
    async function stopEnrollPromise(descriptor, done) {
        let enrollEngine = null;
        try {
            enrollEngine = await intelligentVoice.createEnrollIntelligentVoiceEngine(descriptor);
            console.log(`${tag} createEnrollIntelligentVoiceEngine success`);
        } catch (error) {
            console.info(`${tag} failed to createEnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        let config = {
            language: 'zh',
            region: 'CN'
        }

        try {
            let initRet = await enrollEngine.init(config);
            console.log(`${tag} init EnrollIntelligentVoiceEngine success`);
        } catch(error) {
            console.info(`${tag} failed to init EnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            await enrollEngine.stop();
            console.log(`${tag} stop EnrollIntelligentVoiceEngine success`);
        } catch(error) {
            console.info(`${tag} failed to stop EnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
            expect(false).assertTrue();
            done();
            return;
        }

        try {
            await enrollEngine.release();
            console.log(`${tag} release EnrollIntelligentVoiceEngine success`);
        } catch(error) {
            console.info(`${tag} failed to release EnrollIntelligentVoiceEngine: ${JSON.stringify(error)}`);
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
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_ENROLL_PROCESS_ASYNC_0100
     *@tc.name      : INTELLIGENT_VOICE_ENROLL_PROCESS_ASYNC
     *@tc.desc      : INTELLIGENT_VOICE_ENROLL_PROCESS_ASYNC
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 3
     */
    it('SUB_AI_INTELLIGENT_VOICE_ENROLL_PROCESS_ASYNC_0100', 3, async function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let enrollEngine = null;
        enrollAsync(enrollEngine, done);
    })
    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_STOP_ENROLL_PROCESS_ASYNC_0100
     *@tc.name      : INTELLIGENT_VOICE_STOP_ENROLL_PROCESS_ASYNC
     *@tc.desc      : INTELLIGENT_VOICE_STOP_ENROLL_PROCESS_ASYNC
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_AI_INTELLIGENT_VOICE_STOP_ENROLL_PROCESS_ASYNC_0100', 2, async function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let enrollEngine = null;
        stopEnrollAsync(enrollEngine, done);
    })
    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_ENROLL_PROCESS_PROMISE_0100
     *@tc.name      : INTELLIGENT_VOICE_ENROLL_PROCESS_PROMISE
     *@tc.desc      : INTELLIGENT_VOICE_ENROLL_PROCESS_PROMISE
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 3
     */
    it('SUB_AI_INTELLIGENT_VOICE_ENROLL_PROCESS_PROMISE_0100', 3, async function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let descriptor = {
            wakeupPhrase: '小艺小艺'
        }
        enrollPromise(descriptor, done);
    })
    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_STOP_ENROLL_PROCESS_PROMISE_0100
     *@tc.name      : INTELLIGENT_VOICE_STOP_ENROLL_PROCESS_PROMISE
     *@tc.desc      : INTELLIGENT_VOICE_STOP_ENROLL_PROCESS_PROMISE
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_AI_INTELLIGENT_VOICE_STOP_ENROLL_PROCESS_PROMISE_0100', 2, async function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let descriptor = {
            wakeupPhrase: '小艺小艺'
        }
        stopEnrollPromise(descriptor, done);
    })
})
}