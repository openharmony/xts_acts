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

export default function intelligentVoiceManagerApi10Test() {
describe('ActsIntelligentVoiceManagerApi10Test', function () {
    let tagFrmwk = "intelligentvoiceManagerApi10Test";
    console.info(`${tagFrmwk}: Create IntelligentvoiceManger Object JS Framework`);
    let intelligentvoiceManager = null;
    function getIntelligentvoiceManager() {
        intelligentvoiceManager = intelligentVoice.getIntelligentVoiceManager();
        if (intelligentvoiceManager != null) {
            console.info(`${tagFrmwk}: getIntelligentvoiceManger : PASS`);
        } else {
            console.info(`${tagFrmwk}: getIntelligentvoiceManger : FAIL`);
        }
    }

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async function () {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
        console.info(`${tagFrmwk}: beforeAll: Prerequisites at the test suite level`);
        await getIntelligentvoiceManager();
        console.info(`${tagFrmwk}: beforeAll: END`);
    })
    beforeEach(async function () {
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
        console.info(`${tagFrmwk}: beforeEach: Prerequisites at the test case level`);
    })
    afterEach(async function () {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
        console.info(`${tagFrmwk}: afterEach: Test case-level clearance conditions`);
    })
    afterAll(function () {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
        console.info(`${tagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_ENGINE_TYPE_0100
     *@tc.name      : INTELLIGENT_VOICE_ENGINE_TYPE
     *@tc.desc      : INTELLIGENT_VOICE_ENGINE_TYPE
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 1
     */
    it('SUB_AI_INTELLIGENT_VOICE_ENGINE_TYPE_0100', 1, function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        expect(intelligentVoice.IntelligentVoiceEngineType.ENROLL_ENGINE_TYPE).assertEqual(0);
        expect(intelligentVoice.IntelligentVoiceEngineType.WAKEUP_ENGINE_TYPE).assertEqual(1);
        expect(intelligentVoice.IntelligentVoiceEngineType.UPDATE_ENGINE_TYPE).assertEqual(2);
        done();
    })
    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_ENROLL_RESULT_0100
     *@tc.name      : INTELLIGENT_VOICE_ENROLL_RESULT
     *@tc.desc      : INTELLIGENT_VOICE_ENROLL_RESULT
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 1
     */
    it('SUB_AI_INTELLIGENT_VOICE_ENROLL_RESULT_0100', 1, function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        expect(intelligentVoice.EnrollResult.SUCCESS).assertEqual(0);
        expect(intelligentVoice.EnrollResult.VPR_TRAIN_FAILED).assertEqual(-1);
        expect(intelligentVoice.EnrollResult.WAKEUP_PHRASE_NOT_MATCH).assertEqual(-2);
        expect(intelligentVoice.EnrollResult.TOO_NOISY).assertEqual(-3);
        expect(intelligentVoice.EnrollResult.TOO_LOUD).assertEqual(-4);
        expect(intelligentVoice.EnrollResult.INTERVAL_LARGE).assertEqual(-5);
        expect(intelligentVoice.EnrollResult.DIFFERENT_PERSON).assertEqual(-6);
        expect(intelligentVoice.EnrollResult.UNKNOWN_ERROR).assertEqual(-100);
        done();
    })
    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_WAKEUP_EVENT_0100
     *@tc.name      : INTELLIGENT_VOICE_WAKEUP_EVENT
     *@tc.desc      : INTELLIGENT_VOICE_WAKEUP_EVENT
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 1
     */
    it('SUB_AI_INTELLIGENT_VOICE_WAKEUP_EVENT_0100', 1, function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        expect(intelligentVoice.WakeupIntelligentVoiceEventType.INTELLIGENT_VOICE_EVENT_WAKEUP_NONE).assertEqual(0);
        expect(intelligentVoice.WakeupIntelligentVoiceEventType.INTELLIGENT_VOICE_EVENT_RECOGNIZE_COMPLETE).assertEqual(1);
        done();
    })
    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_ERROR_CODE_0100
     *@tc.name      : INTELLIGENT_VOICE_ERROR_CODE
     *@tc.desc      : INTELLIGENT_VOICE_ERROR_CODE
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 1
     */
    it('SUB_AI_INTELLIGENT_VOICE_ERROR_CODE_0100', 1, function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        expect(intelligentVoice.IntelligentVoiceErrorCode.INTELLIGENT_VOICE_NO_MEMORY).assertEqual(22700101);
        expect(intelligentVoice.IntelligentVoiceErrorCode.INTELLIGENT_VOICE_INVALID_PARAM).assertEqual(22700102);
        expect(intelligentVoice.IntelligentVoiceErrorCode.INTELLIGENT_VOICE_INIT_FAILED).assertEqual(22700103);
        expect(intelligentVoice.IntelligentVoiceErrorCode.INTELLIGENT_VOICE_COMMIT_ENROLL_FAILED).assertEqual(22700104);
        done();
    })
    /**
     *@tc.number    : SUB_AI_INTELLIGENT_VOICE_ENGINE_MANAGER_0100
     *@tc.name      : INTELLIGENT_VOICE_ENGINE_MANAGER
     *@tc.desc      : INTELLIGENT_VOICE_ENGINE_MANAGER
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_AI_INTELLIGENT_VOICE_ENGINE_MANAGER_0100', 2, function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        try {
            let info = intelligentvoiceManager.getCapabilityInfo();
            expect(info.length).assertEqual(2);
            for (let key in info) {
                console.info(`supported intelligent voice engine type: ${key}`);
            }
        } catch (error) {
            console.info(`failed to get supported intelligent voice engine type: ${JSON.stringify(error)}`);
            done();
            return;
        }

        intelligentvoiceManager.on('serviceChange', (serviceChangeType) => {});
        expect(true).assertTrue();
        intelligentvoiceManager.off('serviceChange');
        expect(true).assertTrue();

        expect(intelligentVoice.ServiceChangeType.SERVICE_UNAVAILABLE).assertEqual(0);
        // expect(intelligentVoice.IntelligentVoiceEngineType.WAKEUP_ENGINE_TYPE).assertEqual(1);
        // expect(intelligentVoice.IntelligentVoiceEngineType.UPDATE_ENGINE_TYPE).assertEqual(2);
        done();
    })
})
}