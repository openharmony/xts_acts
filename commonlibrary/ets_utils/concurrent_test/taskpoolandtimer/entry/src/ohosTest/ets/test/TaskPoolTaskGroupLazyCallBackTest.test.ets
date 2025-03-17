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
import { taskpool } from '@kit.ArkTS';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import lazy {
  callbackThen,
  callbackThenFinally,
  printArgs1,
  concurrentTask1,
  concurrentTask2,
  concurrentTask3
} from '../testability/pages/TaskMethodTest';
import lazy { Calculator } from '../testability/pages/Calculator';
import { BusinessError } from '@kit.BasicServicesKit';

const TASK_COUNT = 10;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function taskPoolTaskGroupLazyCallBackTest() {
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

  describe('TaskPoolTaskGroupLazyCallBackTest', () => {
    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1001
     * @tc.name taskPoolTaskGroupLazyCallBackTest1001
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask1, i);
          task.onEnqueued(async () => {
            console.log(`Task ${i} has been enqueued.`);
            const promiseResult = await new Promise<number>((resolve) => {
              setTimeout(() => resolve(i), 50);
            });
            const computedResult = await Calculator.computeSync(promiseResult);
            const finalResult = await Promise.resolve(computedResult).then((value) => {
              return value * 2;
            });
            console.log(`Task ${i} onEnqueued result: ${finalResult}`);
          });
          const result = await taskpool.execute(task) as number;
          results[i] = result;
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual((i * 2 + 1) * 2);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1002
     * @tc.name taskPoolTaskGroupLazyCallBackTest1002
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask2, i);
          task.onEnqueued(async () => {
            console.log(`Task ${i} has been enqueued.`);
            const promiseResult = await new Promise<number>((resolve) => {
              setTimeout(() => resolve(i), 50);
            });
            const computedResult = await Calculator.computeAsync1(promiseResult);
            const finalResult = await Promise.resolve(computedResult).then((value) => {
              return value * 2;
            });
            console.log(`Task ${i} onEnqueued result: ${finalResult}`);
          });
          const result = await taskpool.execute(task) as number;
          results[i] = result;
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual((i * 2 + 1) * 2);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1003
     * @tc.name taskPoolTaskGroupLazyCallBackTest1003
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask1, i);
          task.onStartExecution(async () => {
            console.log(`Task ${i} has started execution.`);
            const promiseResult = await new Promise<number>((resolve) => {
              setTimeout(() => resolve(i), 50);
            });
            const computedResult = Calculator.computeSync(promiseResult);
            const finalResult = await Promise.resolve(computedResult).then((value) => {
              return value * 2;
            });
            console.log(`Task ${i} onStartExecution result: ${finalResult}`);
          });
          const result = await taskpool.execute(task) as number;
          results[i] = result;
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual((i * 2 + 1) * 2);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1004
     * @tc.name taskPoolTaskGroupLazyCallBackTest1004
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask2, i);
          task.onStartExecution(async () => {
            console.log(`Task ${i} has started execution.`);
            const promiseResult = await new Promise<number>(async (resolve) => {
              const computedResult = await Calculator.computeAsync1(i);
              resolve(computedResult);
            });
            const finalResult = await Promise.resolve(promiseResult).then((value) => {
              return value * 2;
            });
            console.log(`Task ${i} onStartExecution result: ${finalResult}`);
          });
          const result = await taskpool.execute(task) as number;
          results[i] = result;
        }
        await sleep(100);

        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual((i * 2 + 1) * 2);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1005
     * @tc.name taskPoolTaskGroupLazyCallBackTest1005
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask3, i);
          task.onExecutionFailed(async (error: Error) => {
            console.log(`Task ${i} execution failed: ${error.message}`);
            const promiseResult = await new Promise<number>((resolve) => {
              setTimeout(() => resolve(i), 0);
            });
            const finalResult = await Promise.resolve(promiseResult).then((value) => {
              return Calculator.computeSync(value);
            });
            console.log(`Task ${i} onExecutionFailed result: ${finalResult}`);
            results[i] = finalResult;
          });
          try {
            await taskpool.execute(task);
          } catch (error) {
            console.log(`Task ${i} execution caught error: ${error.message}`);
          }
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual(i * 2 + 1);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1006
     * @tc.name taskPoolTaskGroupLazyCallBackTest1006
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask3, i);
          task.onExecutionFailed(async (error: Error) => {
            console.log(`Task ${i} execution failed: ${error.message}`);
            const promiseResult = await new Promise<number>((resolve) => {
              setTimeout(() => resolve(i), 0);
            });
            const finalResult = await Promise.resolve(promiseResult).then(async (value) => {
              const computedResult = await Calculator.computeAsync1(value);
              return computedResult;
            });
            console.log(`Task ${i} onExecutionFailed result: ${finalResult}`);
            results[i] = finalResult;
          });
          try {
            await taskpool.execute(task);
          } catch (error) {
            console.log(`Task ${i} execution caught error: ${error.message}`);
          }
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual(i * 2 + 1);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1007
     * @tc.name taskPoolTaskGroupLazyCallBackTest1007
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(concurrentTask1, index);
          task.onExecutionSucceeded(async () => {
            try {
              totalExpected += index * 2 + 1;
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log(`Task ${index} waiting in the first promise after success`);
                  resolve();
                }, 1000);
              });
              const promiseToAwait = new Promise<void>((resolve, reject) => {
                reject(new Error(`Simulated error for task ${index}`));
              });
              await promiseToAwait
                .catch(async (error: BusinessError) => {
                  const computedValue = Calculator.computeSync(index);
                  totalCalculated += computedValue;
                });
              console.log(`Task ${index} completed operations after success promise callback`);
            } catch (innerError) {
              console.error(`Task ${index} encountered an error in onExecutionSucceeded:`, innerError);
            }
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1008
     * @tc.name taskPoolTaskGroupLazyCallBackTest1008
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(concurrentTask1, index);
          task.onExecutionSucceeded(async () => {
            try {
              totalExpected += index * 2 + 1;
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log(`Task ${index} waiting in the first promise after success`);
                  resolve();
                }, 1000);
              });
              const promiseToAwait = new Promise<void>((resolve, reject) => {
                reject(new Error(`Simulated error for task ${index}`));
              });
              await promiseToAwait
                .catch(async (error: BusinessError) => {
                  const computedValue = await Calculator.computeAsync1(index);
                  totalCalculated += computedValue;
                  console.log(`Task ${index} computed value: ${computedValue}`);
                });
              console.log(`Task ${index} completed operations after success promise callback`);
            } catch (innerError) {
              console.error(`Task ${index} encountered an error in onExecutionSucceeded:`, innerError);
            }
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`Total Calculated: ${totalCalculated}`);
        console.info(`Total Expected: ${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1009
     * @tc.name taskPoolTaskGroupLazyCallBackTest1009
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask2, i);
          task.onReceiveData(async () => {
            console.log(`Task ${i} has received data.`);
            try {
              const promiseResult = await new Promise<number>(async (resolve) => {
                const computedResult = await Calculator.computeAsync1(i);
                resolve(computedResult);
              });
              const finalResult = await Promise.resolve(promiseResult).then((value) => {
                return value * 2;
              });
              console.log(`Task ${i} onReceiveData result: ${finalResult}`);
            } finally {
              const computedResult = await Calculator.computeAsync1(i);
              return computedResult;
            }
          });

          const result = await taskpool.execute(task) as number;
          results[i] = result;
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual((i * 2 + 1) * 2);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1010
     * @tc.name taskPoolTaskGroupLazyCallBackTest1010
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask2, i);
          const result = await taskpool.execute(task).then(async (value) => {
            console.log(`Task ${i} has completed with value: ${value}`);
            const promiseResult1 = await new Promise<number>(async (resolve) => {
              const computedResult1 = Calculator.computeSync(i);
              resolve(computedResult1);
            }).then((result1) => {
              console.log(`Task ${i} - lazyCompute1 result: ${result1}`);
              return result1;
            });
            const promiseResult2 = await Promise.resolve(promiseResult1).then(async (value) => {
              const computedResult2 = Calculator.computeSync(i);
              console.log(`Task ${i} - lazyCompute2 result: ${computedResult2}`);
              return computedResult2;
            });
            return promiseResult2;
          }) as number;
          results[i] = result;
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual(i * 2 + 1);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1011
     * @tc.name taskPoolTaskGroupLazyCallBackTest1011
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask2, i);
          try {
            const result = await taskpool.execute(task) as number;
            results[i] = result;
          } catch (error) {
            const catchResult = await new Promise<number>(async (resolve) => {
              console.log(`Task ${i} failed with error: ${error.message}`);
              const computedResult = await Calculator.computeAsync1(i);
              const finalResult = await new Promise<number>((resolve) => {
                setTimeout(() => {
                  resolve(computedResult * 2);
                }, 100);
              });
              resolve(finalResult);
            });
            results[i] = catchResult;
          }
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual((i * 2 + 1) * 2);
        }
        Done();
      });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_CALLBACK_TEST_1012
     * @tc.name taskPoolTaskGroupLazyCallBackTest1012
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyCallBackTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const results: number[] = [];
        const TASK_COUNT = 10;
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(concurrentTask2, i);
          try {
            const result = await taskpool.execute(task) as number;
            results[i] = result;
          } catch (error) {
            console.log(`Task ${i} failed with error: ${error.message}`);
            results[i] = -1;
          } finally {
            const finallyResult = await new Promise<number>(async (resolve) => {
              console.log(`Task ${i} is in finally block.`);
              const computedResult = await Calculator.computeAsync1(i);
              Promise.resolve(computedResult).then((value) => {
                const finalResult = value * 2;
                console.log(`Task ${i} - finally block result: ${finalResult}`);
                resolve(finalResult);
              });
            });
            results[i] = finallyResult;
          }
        }
        await sleep(100);
        expect(results.length).assertEqual(TASK_COUNT);
        for (let i = 0; i < TASK_COUNT; i++) {
          expect(results[i]).assertEqual((i * 2 + 1) * 2);
        }
        Done();
      });

  })
}