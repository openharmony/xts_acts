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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { Worker2 } from '../testability/pages/Calculator';
import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import lazy { Calculator } from '../testability/pages/Calculator'

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function taskPoolTaskGroupLazyWorkerTest() {
  // Defines a test suite. Two parameters are supported: test suite name and test suite function.
  beforeAll(() => {
    // Presets an action, which is performed only once before all test cases of the test suite start.
    // This API supports only one parameter: preset action function.
  })
  beforeEach(async () => {
    await sleep(100)
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

  describe('taskPoolTaskGroupLazyWorkerTest', () => {
    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_WORKER_TEST_1001
     * @tc.name taskPoolTaskGroupLazyWorkerTest1001
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyWorkerTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        let completedTasks = 0;
        let work = new worker.ThreadWorker('../workers/Worker.ets');
        work.onmessage = (e: MessageEvents): void => {
          const result: number = e.data;
          totalExpected += result;
          totalCalculated += result;
          completedTasks++;
          console.log(`main received result: ${result} from worker`);
          console.log(`totalCalculated: ${totalCalculated}, totalExpected: ${totalExpected}`);
          if (completedTasks === 10) {
            expect(totalCalculated).assertEqual(totalExpected);
            work.terminate()
            Done();
          }
        };
        work.onerror = (err: ErrorEvent) => {
          console.log(`main error message: ${err.message}`);
        };
        for (let index = 0; index < 10; index++) {
          console.log('即将发送的 index 值:', index);
          work.postMessage(index);
        }
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_WORKER_TEST_1002
     * @tc.name taskPoolTaskGroupLazyWorkerTest1002
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyWorkerTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        let completedTasks = 0;
        let work = new worker.ThreadWorker('../workers/Worker1.ets');
        work.onmessage = (e: MessageEvents): void => {
          const result: number = e.data;
          totalExpected += result;
          totalCalculated += result;
          completedTasks++;
          console.log(`main received result: ${result} from worker`);
          console.log(`totalCalculated: ${totalCalculated}, totalExpected: ${totalExpected}`);
          if (completedTasks === 10) {
            expect(totalCalculated).assertEqual(totalExpected);
            work.terminate()
            Done();
          }
        };
        work.onerror = (err: ErrorEvent) => {
          console.log(`main error message: ${err.message}`);
        };
        for (let index = 0; index < 10; index++) {
          console.log('即将发送的 index 值:', index);
          work.postMessage(index);
        }
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_WORKER_TEST_1003
     * @tc.name taskPoolTaskGroupLazyWorkerTest1003
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyWorkerTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        let completedTasks = 0;
        for (let index = 0; index < 10; index++) {
          console.log(`Worker ${index} created`);
          const workerInstance = new Worker2();
          workerInstance.worker.onexit = async (code: number): Promise<void> => {
            console.log(`Worker ${index} exited with code: ${code}`);
            try {
              const result1 = await new Promise<number>(async (resolve, reject) => {
                try {
                  const res = await Calculator.computeAsync1(index);
                  console.log(`Worker ${index} computeAsync1 result: ${res}`);
                  resolve(res);
                } catch (error) {
                  console.log(`Worker ${index} computeAsync1 error: ${error.message}`);
                  reject(error);
                } finally {
                  console.log(`Worker ${index} computeAsync1 finally`);
                }
              });

              const result2 = await Promise.resolve(result1)
                .then(async (res) => {
                  return res;
                })
                .finally(async () => {
                  console.log(`Worker ${index} Promise callback finally`);
                });
              totalExpected += result2;
              totalCalculated += result2;
              completedTasks++;
              console.log(`totalCalculated: ${totalCalculated}, totalExpected: ${totalExpected}`);
              if (completedTasks === 10) {
                expect(totalCalculated).assertEqual(totalExpected);
                Done();
              }
            } catch (error) {
              console.log(`Worker ${index} error in onexit: ${error.message}`);
            } finally {
              workerInstance.worker.terminate();
            }
          };
          console.log('即将发送的 index 值:', index);
          workerInstance.worker.postMessage(index);
          console.log(`Worker ${index} postMessage called`);
        }
      });

  });
}