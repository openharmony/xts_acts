/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { Calculator } from '../testability/pages/Calculator';
import { callbackCatchSync, callbackFinallyAsync } from '../testability/pages/TaskMethodTest';
import { sleep } from '../testability/pages/Utils';

const TASK_COUNT = 10;

export default function taskPoolStaticWorkerTest() {
  describe('TaskPoolStaticWorkerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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

    /**
     * @tc.number TASKPOOL_STATIC_WORKER_TEST_0100
     * @tc.name taskPoolStaticWorkerTest1001
     * @tc.desc test static worker-all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticWorkerTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          let result = 0;
          let work = new worker.ThreadWorker('../testability/pages/workers/CalculatorWorker1.ets');
          work.postMessage(i);
          work.onmessage = (e: MessageEvents): void => {
            result = e.data;
            console.info("main thread data is  " + result);
            work.terminate();
          }

          work.onexit = () => {
            console.log("main thread terminate");
          }

          work.onerror = (err: ErrorEvent) => {
            console.log("main error message " + err.message);
          }

          await sleep(500);
          expect(result).assertEqual(Calculator.computeSync(i));
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_WORKER_TEST_0200
     * @tc.name taskPoolStaticWorkerTest1002
     * @tc.desc test static worker-onmessage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticWorkerTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          let result = 0;
          let work = new worker.ThreadWorker('../testability/pages/workers/CalculatorWorker2.ets');
          work.postMessage(i);
          work.onmessage = async (e: MessageEvents): Promise<void> => {
            result = await callbackCatchSync(e.data);
            console.info("main thread data is  " + result);
            work.terminate();
          }

          work.onexit = () => {
            console.log("main thread terminate");
          }

          work.onerror = (err: ErrorEvent) => {
            console.log("main error message " + err.message);
          }

          await sleep(500);
          expect(result).assertEqual(Calculator.computeSync(2 * i));
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_WORKER_TEST_0300
     * @tc.name taskPoolStaticWorkerTest1003
     * @tc.desc test static worker-onExit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticWorkerTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          let result = 0;
          let work = new worker.ThreadWorker('../testability/pages/workers/CalculatorWorker2.ets');
          work.postMessage(i);
          work.onmessage = () => {
            console.info("main thread data is  " + result);
            work.terminate();
          }

          work.onexit = async () => {
            result = await callbackFinallyAsync(i);
            console.log("main thread terminate");
          }

          work.onerror = (err: ErrorEvent) => {
            console.log("main error message " + err.message);
          }

          await sleep(500);
          expect(result).assertEqual(Calculator.computeSync(i) + i);
        }
        done();
      });
  });
}