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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import ffrtndk from 'libffrtndk.so';
export default function ffrtTest() {
  describe('ActsFfrtTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('queueTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueTest001();
      expect(flag).assertEqual(9);
    })
    it('queueTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueTest002();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest001();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest002();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest003();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest004();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest001();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest002();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest003();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest004();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest005();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest006();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest007',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest007();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest008',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest008();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest009',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest009();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest010',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest010();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest011',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest011();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest012',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest012();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest013',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest013();
      expect(flag).assertEqual(0);
    })
    it('queueCancelTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest001();
      expect(flag).assertEqual(0);
    })
    it('queueCancelTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest003();
      expect(flag).assertEqual(0);
    })
    it('queueCancelTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest004();
      expect(flag).assertEqual(0);
    })
    it('basicTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.basicTest();
      expect(flag).assertEqual(0);
    })
    it('submitBasicTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitBasicTest();
      expect(flag).assertEqual(0);
    })
    it('submitInDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitInDependEmptyTest();
      expect(flag).assertEqual(0);
    })
    it('submitInDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitInDependNullptrTest();
      expect(flag).assertEqual(0);
    })
    it('submitOuDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitOuDependEmptyTest();
      expect(flag).assertEqual(0);
    })
    it('submitOuDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitOuDependNullptrTest();
      expect(flag).assertEqual(0);
    })
    it('submitIODependAttrBasicTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitIODependAttrBasicTest();
      expect(flag).assertEqual(0);
    })
    it('submitIn0Ou0WaitNullTask1Test',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitIn0Ou0WaitNullTask1Test();
      expect(flag).assertEqual(0);
    })
    it('delayCTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.delayCTest001();
      expect(flag).assertEqual(0);
    })
    it('qosQueryTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.qosQueryTest();
      expect(flag).assertEqual(0);
    })
    it('qosSetTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.qosSetTest();
      expect(flag).assertEqual(0);
    })
    it('qosIllegalTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.qosIllegalTest();
      expect(flag).assertEqual(0);
    })
    it('qosSetPthreadTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.qosSetPthreadTest();
      expect(flag).assertEqual(0);
    })
    it('qosSetNameTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.qosSetNameTest();
      expect(flag).assertEqual(0);
    })
    it('queueDelay001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelay001();
      expect(flag).assertEqual(0);
    })
    it('queueDelay005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelay005();
      expect(flag).assertEqual(0);
    })
    it('queueWait001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueWait001();
      expect(flag).assertEqual(0);
    })
    it('queue002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queue002();
      expect(flag).assertEqual(0);
    })
    it('queue003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queue003();
      expect(flag).assertEqual(0);
    })
    it('queueDestroy003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDestroy003();
      expect(flag).assertEqual(0);
    })
    it('queueDestroy005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDestroy005();
      expect(flag).assertEqual(0);
    })
    it('queueDestroy007',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDestroy007();
      expect(flag).assertEqual(0);
    })
    it('yieldSubmitThreadTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.yieldSubmitThreadTest();
      expect(flag).assertEqual(0);
    })
    it('yieldSubmitLoopTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.yieldSubmitLoopTest();
      expect(flag).assertEqual(0);
    })
    it('yieldBasicTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.yieldBasicTest();
      expect(flag).assertEqual(0);
    })
    it('queueDfx001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfx001();
      expect(flag).assertEqual(0);
    })
    it('queueDfx002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfx002();
      expect(flag).assertEqual(0);
    })
    it('sleepForTest000',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.sleepForTest000();
      expect(flag).assertEqual(0);
    })
    it('sleepForTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.sleepForTest001();
      expect(flag).assertEqual(0);
    })
    it('queueDelayTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelayTest001();
      expect(flag).assertEqual(0);
    })
    it('mutexTest006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexTest006();
      expect(flag).assertEqual(0);
    })
    it('mutexTest008',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexTest008();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest001();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest002();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest003();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest004();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableApiTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest001();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableApiTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest002();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableApiTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest003();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableApiTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest004();
      expect(flag).assertEqual(0);
    })
  })
}