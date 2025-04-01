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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { Calculator } from '../testability/pages/Calculator';
import {
  callbackAll,
  callbackAllAsync,
  callbackAsync,
  callbackAsyncPromise,
  callbackCatchAsync,
  callbackCatchSync,
  callbackCompute,
  callbackFinallyAsync,
  callbackPromiseSync,
  callbackThen,
  callbackThenFinally,
  failTask,
  printArgs1,
  sendTaskData,
} from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';

const TASK_COUNT = 10;

export default function taskPoolStaticCallbackTest() {
  describe('TaskPoolStaticCallbackTest', () => {
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
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0100
     * @tc.name taskPoolStaticCallbackTest1001
     * @tc.desc test static onEnqueued all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const taskPromises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(printArgs1, i);
          task.onEnqueued(async () => {
            const res1 = await callbackAll(i);
            result1 = result1 + res1;
            taskPromises.push(taskPromise);
          })
          const taskPromise = taskpool.execute(task);
          const res2 = Calculator.computeSync(i + 1) + 1;
          result2 = result2 + res2;
        }
        await Promise.all(taskPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0200
     * @tc.name taskPoolStaticCallbackTest1002
     * @tc.desc test static onEnqueued all asyncFuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const completionPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(printArgs1, i);
          let resolveCompletion: Function;
          const completionPromise = new Promise<void>((resolve) => {
            resolveCompletion = resolve;
          });
          completionPromises.push(completionPromise);
          task.onEnqueued(async () => {
            try {
              const res1 = await callbackAllAsync(i);
              result1 += res1;
            } finally {
              resolveCompletion();
            }
          });
          taskpool.execute(task);
          result2 += Calculator.computeSync(i + 1) + 1;
        }
        await Promise.all(completionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0300
     * @tc.name taskPoolStaticCallbackTest1003
     * @tc.desc test static onStartExecution new-promise-fuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const completionPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(printArgs1, i);
          const completionPromise = new Promise<void>((resolve) => {
            task.onStartExecution(async () => {
              try {
                const res1 = await callbackCompute(i);
                result1 += res1;
              } finally {
                resolve();
              }
            });
          });
          completionPromises.push(completionPromise);
          taskpool.execute(task);
          result2 += Calculator.computeSync(i) + 1;
        }
        await Promise.all(completionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0400
     * @tc.name taskPoolStaticCallbackTest1004
     * @tc.desc test static onStartExecution new-promise-asyncFuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const taskCompletionPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(printArgs1, i);
          let resolveTask: Function;
          const taskDone = new Promise<void>((resolve) => {
            resolveTask = resolve;
          });
          taskCompletionPromises.push(taskDone);
          task.onStartExecution(async () => {
            try {
              const res1 = await callbackAsync(i);
              result1 += res1;
            } catch (err) {
              console.error(`Task ${i} failed:`, err);
            } finally {
              resolveTask();
            }
          });
          taskpool.execute(task);
          result2 += Calculator.computeSync(i) + 1;
        }
        await Promise.all(taskCompletionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0500
     * @tc.name taskPoolStaticCallbackTest1005
     * @tc.desc test static onExecutionFailed promise-then-fuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const completionPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(failTask, i);
          const completionPromise = new Promise<void>((resolve) => {
            task.onExecutionFailed(async () => {
              const res1 = await callbackPromiseSync(i);
              result1 += res1;
              resolve();
            });
          });
          completionPromises.push(completionPromise);
          taskpool.execute(task)
            .then(() => console.info("taskpool: execute task success"))
            .catch((e: BusinessError) => {
              console.error(`taskpool: error code: ${e.code}, error info: ${e.message}`);
            });

          result2 += Calculator.computeSync(i);
        }
        await Promise.all(completionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0600
     * @tc.name taskPoolStaticCallbackTest1006
     * @tc.desc test static onExecutionFailed promise-then-asyncFuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1=0;
        let result2=0;
        const completionPromises:Promise<void>[]=[];
        for(let i=0;i<TASK_COUNT;i++){
          const task=new taskpool.Task(failTask,i);
          const completionPromise=new Promise<void>((resolve)=>{
            task.onExecutionFailed(async()=>{
              const res1=await callbackPromiseSync(i);
              result1+=res1;
              resolve();
            });
          });
          completionPromises.push(completionPromise);
          taskpool.execute(task)
            .then(()=>console.info("taskpool: execute task success"))
            .catch((e:BusinessError)=>{
              console.error(`taskpool: error code: ${e.code}, error info: ${e.message}`);
            });
          result2+=Calculator.computeSync(i);
        }
        await Promise.all(completionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0700
     * @tc.name taskPoolStaticCallbackTest1007
     * @tc.desc test static onExecutionSucceeded promise-catch-fuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const completionPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(printArgs1, i);
          const completionPromise = new Promise<void>((resolve) => {
            task.onExecutionSucceeded(async () => {
              const res1 = await callbackCatchSync(i);
              result1 += res1;
              resolve();
            });
          });
          completionPromises.push(completionPromise);
          taskpool.execute(task)
            .then(() => console.info("taskpool: execute task success"))
            .catch((e: BusinessError) => {
              console.error(`taskpool: error code: ${e.code}, error info: ${e.message}`);
            });
          result2 += Calculator.computeSync(i * 2);
        }
        await Promise.all(completionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0800
     * @tc.name taskPoolStaticCallbackTest1008
     * @tc.desc test static onExecutionSucceeded promise-catch-asyncFuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(printArgs1, i);
          task.onExecutionSucceeded(async () => {
            const res1 = await callbackCatchAsync(i);
            result1 = result1 + res1;
          })
          await taskpool.execute(task).then(() => {
            console.info("taskpool: execute task success");
          }).catch((e: BusinessError) => {
            console.error(`taskpool: error code: ${e.code}, error info: ${e.message}`);
          })
          const res2 = Calculator.computeSync(i * 2);
          result2 = result2 + res2;
        }
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_0900
     * @tc.name taskPoolStaticCallbackTest1009
     * @tc.desc test static onReceiveData promise-finally-asyncFuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const completionPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(sendTaskData, i);
          const dataPromise = new Promise<void>((resolve) => {
            task.onReceiveData(async (num: number) => {
              const res1 = await callbackFinallyAsync(num);
              result1 += res1;
              resolve();
            });
          });
          const executionPromise = taskpool.execute(task)
            .then(() => {
              console.info("taskpool: execute task success");
            })
            .catch((e: BusinessError) => {
              console.error(`taskpool: error code: ${e.code}, error info: ${e.message}`);
            });
          completionPromises.push(dataPromise, executionPromise);
          const res2 = Calculator.computeSync(i * 10) + i * 10;
          result2 += res2;
        }
        await Promise.all(completionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_1000
     * @tc.name taskPoolStaticCallbackTest1010
     * @tc.desc test static then promise-then-fuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const completionPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(printArgs1, i);
          const taskPromise = taskpool.execute(task)
            .then(async (num) => {
              const res1 = await callbackThen(num as number);
              result1 += res1;
            })
            .catch((e:BusinessError) => {
              console.error(`Task execution error: ${e.message}`);
            });
          completionPromises.push(taskPromise);
          const res2 = Calculator.computeSync(Calculator.computeSync(i));
          result2 += res2;
        }
        await Promise.all(completionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_1100
     * @tc.name taskPoolStaticCallbackTest1011
     * @tc.desc test static then promise-finally-asyncFuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const taskPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(printArgs1, i);
          const taskPromise = taskpool.execute(task)
            .then(async (num) => {
              const res1 = await callbackThenFinally(num as number);
              result1 += res1;
            })
            .catch((e:BusinessError) => {
              console.error(`Task error: ${e.message}`);
            });
          taskPromises.push(taskPromise);
          const res2 = Calculator.computeSync(Calculator.computeSync(i));
          result2 += res2;
        }
        await Promise.all(taskPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_1200
     * @tc.name taskPoolStaticCallbackTest1012
     * @tc.desc test static catch new-promise-then-asyncPromise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const errorHandlingPromises: Promise<void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(failTask, i);
          const taskPromise = taskpool.execute(task)
            .then(() => {
              console.info("taskpool: execute task success");
            })
            .catch(async (e: BusinessError) => {
              console.error(`taskpool: error code: ${e.code}, error info: ${e.message}`);
              const res1 = await callbackAsyncPromise(i);
              result1 += res1;
            });

          errorHandlingPromises.push(taskPromise);
          const res2 = i * 2;
          result2 += res2;
        }
        await Promise.all(errorHandlingPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_CALLBACK_TEST_1300
     * @tc.name taskPoolStaticCallbackTest1013
     * @tc.desc test static finally all-asyncFuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolStaticCallbackTest1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let result1 = 0;
        let result2 = 0;
        const completionPromises: Promise<object|void>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          const task = new taskpool.Task(printArgs1, 1);
          const taskPromise = taskpool.execute(task)
            .finally(async () => {
              const res1 = await callbackAllAsync(i);
              result1 += res1;
            })
            .catch((e: Error) => {
              console.error("Task execution error:", e);
              return Promise.resolve();
            });
          completionPromises.push(taskPromise);
          const res2 = Calculator.computeSync(i + 1) + 1;
          result2 += res2;
        }
        await Promise.all(completionPromises);
        await sleep(200);
        expect(result1).assertEqual(result2);
        done();
      });
  });
}
