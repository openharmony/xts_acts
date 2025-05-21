/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from "@ohos/hypium";
import { ArkTSUtils , MessageEvents, taskpool, worker } from "@kit.ArkTS";
import { sleep } from "../testability/pages/Utils";
import {
  printArgs1,
  taskFunctionTest0200,
  taskFunctionTest0400,
  taskFunctionTest0600,
  taskFunctionTest0900,
  taskFunctionTest1200,
  taskFunctionTest1500,
  taskFunctionTest1800,
  taskFunctionTest2100,
  taskFunctionTest2400,
  test,
  taskFunctionTest2700,
  taskFunctionTest3000,
  taskFunctionTest3300,
  taskFunctionTest3600,
  taskFunctionTest3900,
  taskFunctionTest4200,
  taskFunctionTest4500,
  taskFunctionTest4700,
  taskFunctionTest4900,
  taskFunctionTest5000,
  taskFunctionTest5010,
  taskFunctionTest5200,
  taskFunctionTest5500
} from "../testability/pages/TaskpoolUtilsAsynclockSameUtils";
export default function TaskpoolUtilsAsynclockSameTest() {
  describe('TaskpoolUtilsAsynclockSameTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0100
     * @tc.name TaskpoolUtilsAsynclockSameTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done:Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise  = lock1.lockAsync(async () => {
            try {
              throw new Error('Error occurred in asynchronous operation');
            } catch (error) {
              count++;
              console.error('Caught an exception:', error.message);
            }
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise);
        }
        await Promise.all(promises);
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`)
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0200
     * @tc.name TaskpoolUtilsAsynclockSameTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest0200);
        await taskpool.execute(task).then(async (result) => {
          while(result != 3){
            await sleep(300);
          }
          expect(result).assertEqual(3);
          Done();
        });
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0300
     * @tc.name TaskpoolUtilsAsynclockSameTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0300';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        while(count != 10){
          await sleep(300);
        }
        await Promise.all(promises);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0400
     * @tc.name TaskpoolUtilsAsynclockSameTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest0400);
        await taskpool.execute(task).then(async (result) => {
          console.info(`${caseName} test end`)
          while(result != 3){
            await sleep(300);
          }
          expect(result).assertEqual(3);
          Done();
        });
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0500
     * @tc.name TaskpoolUtilsAsynclockSameTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0500';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let count = 0;
        const promises: Promise<void>[] = [];
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await new Promise<void>((_, reject) => {
              setTimeout(() => {
                reject();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        await Promise.all(promises);
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0600
     * @tc.name TaskpoolUtilsAsynclockSameTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest0600);
        await taskpool.execute(task).then(async (result) => {
          console.info(`${caseName} test end`)
          while(result != 3){
            await sleep(300);
          }
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0700
     * @tc.name TaskpoolUtilsAsynclockSameTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0700';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0800
     * @tc.name TaskpoolUtilsAsynclockSameTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            await new Promise<void>((resolve, reject) => {
              setTimeout(() => {
                try {
                  count++;
                  throw new Error('Simulated asynchronous operation error');
                } catch (e) {
                  errorCount++;
                  reject(e);
                }
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        while(errorCount != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });
    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_0900
     * @tc.name TaskpoolUtilsAsynclockSameTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest0900';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest0900);
        await taskpool.execute(task).then(async (result) => {
          console.log('Success execution count:' + result);
          while(result != 3){
            await sleep(300);
          }
          expect(result).assertEqual(3);
          console.info(`${caseName} test end`);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1000
     * @tc.name TaskpoolUtilsAsynclockSameTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1000';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let errorCount = 0;
        let executionSucceededCount = 0;
        task.onExecutionSucceeded(()=>{
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
             new Promise<void>((_, reject) => {
                try {
                  executionSucceededCount++;
                  const error = new Error('Simulated asynchronous operation error');
                  console.error('Caught an exception:', error.message);
                  throw error;
                } catch (e) {
                  errorCount++;
                  reject(e);
                }
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.info("taskpool: onExecute")
          count++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 1){
          await sleep(300);
        }
        while(executionSucceededCount != 1){
          await sleep(300);
        }
        while(errorCount != 1){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        expect(executionSucceededCount).assertEqual(1);
        expect(errorCount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1100
     * @tc.name TaskpoolUtilsAsynclockSameTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  try {
                    count++;
                    const error = new Error('Simulated asynchronous operation error');
                    console.error('Caught an exception:', error.message);
                    throw error;
                  } catch (e) {
                    errorCount++;
                    reject(e);
                  }
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1200
     * @tc.name TaskpoolUtilsAsynclockSameTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest1200, 1);
        await taskpool.execute(task).then(async (result) => {
          while(result != 3){
            await sleep(300);
          }
          console.log('Success execution count:' + result);
          expect(result).assertEqual(3);
          console.info(`${caseName} test end`);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1300
     * @tc.name TaskpoolUtilsAsynclockSameTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
        }
        while(count != 1){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1400
     * @tc.name TaskpoolUtilsAsynclockSameTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1500
     * @tc.name TaskpoolUtilsAsynclockSameTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest1500);
        await taskpool.execute(task).then(async (result) => {
          console.log('Success execution count:' + result);
          expect(result).assertEqual(3);
          console.info(`${caseName} test end`);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1600
     * @tc.name TaskpoolUtilsAsynclockSameTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let onEnqueuedcount = 0;
        task.onEnqueued(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  onEnqueuedcount++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.log('onExecute');
          count++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 1){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        expect(onEnqueuedcount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1700
     * @tc.name TaskpoolUtilsAsynclockSameTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1700';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1800
     * @tc.name TaskpoolUtilsAsynclockSameTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1800';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest1800);
        await taskpool.execute(task).then(async (result) => {
          console.log('Success execution count:' + result);
          while(result != 3){
            await sleep(300);
          }
          expect(result).assertEqual(3);
          console.info(`${caseName} test end`);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_1900
     * @tc.name TaskpoolUtilsAsynclockSameTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest1900';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        while(count != 1){
          await sleep(300);
        }
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2000
     * @tc.name TaskpoolUtilsAsynclockSameTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest2000';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              try {
                count++;
                const error = new Error('Simulated asynchronous operation error');
                console.error('Caught an exception:', error.message);
                throw error;
              } catch (e) {
                errorCount++;
              }
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2100
     * @tc.name TaskpoolUtilsAsynclockSameTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest2100);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2200
     * @tc.name TaskpoolUtilsAsynclockSameTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest2200';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let onStartExecutioncount = 0;
        task.onStartExecution(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
             lock2.lockAsync(async () => {
              try {
                const error = new Error('Simulated asynchronous operation error');
                console.error('Caught an exception:', error.message);
                throw error;
              } catch (e) {
                onStartExecutioncount++;
              }
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.log('onExecute');
          count++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 1) {
          await sleep(300);
        }
        while (onStartExecutioncount != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        expect(onStartExecutioncount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2300
     * @tc.name TaskpoolUtilsAsynclockSameTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest2300';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
               new Promise<void>((resolve, reject) => {
                count++;
                resolve();
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2400
     * @tc.name TaskpoolUtilsAsynclockSameTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest2400);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2500
     * @tc.name TaskpoolUtilsAsynclockSameTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest2500';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(test, 1);
        let count = 0;
        let onExecutionFailedcount = 0;
        task.onExecutionFailed(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              new Promise<void>((resolve, reject) => {
                count++;
                resolve();
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async()=>{
        }).catch(()=>{
          onExecutionFailedcount++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        expect(count).assertEqual(1);
        expect(onExecutionFailedcount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2600
     * @tc.name TaskpoolUtilsAsynclockSameTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest2600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              new Promise<void>((resolve, reject) => {
                count++;
                reject();
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2700
     * @tc.name TaskpoolUtilsAsynclockSameTest2700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest2700);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2800
     * @tc.name TaskpoolUtilsAsynclockSameTest2800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest2800';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          WorkThread.terminate();
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_2900
     * @tc.name TaskpoolUtilsAsynclockSameTest2900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest2900';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3000
     * @tc.name TaskpoolUtilsAsynclockSameTest3000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest3000);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3100
     * @tc.name TaskpoolUtilsAsynclockSameTest3100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest3100';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3200
     * @tc.name TaskpoolUtilsAsynclockSameTest3200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest3200';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3300
     * @tc.name TaskpoolUtilsAsynclockSameTest3300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest3300);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3400
     * @tc.name TaskpoolUtilsAsynclockSameTest3400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let count = 0;
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1,1);
        await taskpool.execute(task).finally(async () => {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
          try {
            await Promise.all(promises);
          } catch (e) {
            console.log('Caught an error in Promise.all:', JSON.stringify(e));
          }
          await sleep(300);
          console.log('Success execution count:' + count);
          expect(count).assertEqual(1);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3500
     * @tc.name TaskpoolUtilsAsynclockSameTest3500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest3500';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
              WorkThread.onexit = () => {
                console.log("onexit");
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                returnCount = e.data;
                count++;
                console.log('e:' + JSON.stringify(e));
                WorkThread.terminate();
                console.info(`${caseName} test end`);
              }
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3600
     * @tc.name TaskpoolUtilsAsynclockSameTest3600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest3600);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3700
     * @tc.name TaskpoolUtilsAsynclockSameTest3700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest3700';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {

          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
              WorkThread.onexit = () => {
                console.log("onexit");
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                count = e.data ;
                console.log('e:' + JSON.stringify(e));
                WorkThread.terminate();
                console.info(`${caseName} test end`);
              }
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);

        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 42) {
          await sleep(300);
        }
        expect(count).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3800
     * @tc.name TaskpoolUtilsAsynclockSameTest3800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest3800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {

              console.log('Enter exclusive lock lock2');
              console.log('Enter worker');
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
              WorkThread.onexit = () => {
                console.log("onexit");
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                returnCount = e.data;
                count++;
                console.log('e:' + JSON.stringify(e));
                console.info("main2 thread count is  " + count);
                WorkThread.terminate();
                console.log('Success execution count:' + count);
                console.info(`${caseName} test end`);
              }
              console.log('Exit worker');

            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_3900
     * @tc.name TaskpoolUtilsAsynclockSameTest3900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest3900);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4000
     * @tc.name TaskpoolUtilsAsynclockSameTest4000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest4000';
        console.info(`${caseName} test start`);
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          expect(e.data).assertEqual(42);
          Done();
        }
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4100
     * @tc.name TaskpoolUtilsAsynclockSameTest4100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest4100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
             lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
               lock3.lockAsync(async () => {
                console.log('Enter exclusive lock lock3');
                 let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
                 await taskpool.execute(task).then((result) => {
                   count++;
                 })
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4200
     * @tc.name TaskpoolUtilsAsynclockSameTest4200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest4200);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4300
     * @tc.name TaskpoolUtilsAsynclockSameTest4300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest4300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4400
     * @tc.name TaskpoolUtilsAsynclockSameTest4400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest4400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              lock3.lockAsync(async () => {
                console.log('Enter exclusive lock lock3');
                new Promise<void>((resolve, reject) => {
                  count++;
                  resolve();
                });
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4500
     * @tc.name TaskpoolUtilsAsynclockSameTest4500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest4500);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4600
     * @tc.name TaskpoolUtilsAsynclockSameTest4600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest4600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              lock3.lockAsync(async () => {
                console.log('Enter exclusive lock lock3');
                setTimeout( async () => {
                  console.log('Enter exclusive lock lock3');
                  count++
                },300);
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4700
     * @tc.name TaskpoolUtilsAsynclockSameTest4700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest4700);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4800
     * @tc.name TaskpoolUtilsAsynclockSameTest4800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest4800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              lock3.lockAsync(async () => {
                console.log('Enter exclusive lock lock3');
                console.log('Enter worker');
                let WorkThread: worker.ThreadWorker;
                WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
                WorkThread.onexit = () => {
                  console.log("onexit");
                }
                WorkThread.postMessage(caseName);
                WorkThread.onmessage = (e: MessageEvents): void => {
                  returnCount = e.data;
                  count++;
                  console.log('e:' + JSON.stringify(e));
                  console.info("main2 thread count is  " + count);
                  WorkThread.terminate();
                  console.log('Success execution count:' + count);
                  console.info(`${caseName} test end`);
                }
                console.log('Exit worker');
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_4900
     * @tc.name TaskpoolUtilsAsynclockSameTest4900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest4900);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_5000
     * @tc.name TaskpoolUtilsAsynclockSameTest5000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest5010,1);
        task.onReceiveData(taskFunctionTest5000);
        await taskpool.execute(task);
        await sleep(1000);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_5100
     * @tc.name TaskpoolUtilsAsynclockSameTest5100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest5100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            setTimeout(() => {},1000)
            console.log('Enter shared lock lock1');
             lock2.lockAsync(async () => {
              setTimeout(() => {},1000)
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 1000);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_5200
     * @tc.name TaskpoolUtilsAsynclockSameTest5200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest5200);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_5300
     * @tc.name TaskpoolUtilsAsynclockSameTest5300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest5300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_5400
     * @tc.name TaskpoolUtilsAsynclockSameTest5400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest5400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request("lock_1");
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            setTimeout(() => {},1000)
            console.log('Enter shared lock lock1');
            lock2.lockAsync(async () => {
              setTimeout(() => {},1000)
              console.log('Enter exclusive lock lock2');
                setTimeout(() => {
                  count++;
                }, 1000);
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_5500
     * @tc.name TaskpoolUtilsAsynclockSameTest5500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let task: taskpool.Task = new taskpool.Task(taskFunctionTest5500);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(3);
          Done();
        })
      });

    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_SAME_TEST_5600
     * @tc.name TaskpoolUtilsAsynclockSameTest5600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockSameTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockSameTest5600';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log("onexit");
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });
  })
}