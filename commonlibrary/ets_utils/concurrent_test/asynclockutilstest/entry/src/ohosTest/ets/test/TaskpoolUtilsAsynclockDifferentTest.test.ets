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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Size,
  Level,
  TestType
} from "@ohos/hypium";
import { sleep } from "../testability/pages/Utils";
import { ArkTSUtils, MessageEvents, taskpool, worker } from "@kit.ArkTS";
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


} from "../testability/pages/TaskpoolUtilsAsynclockSameUtils";
export default function TaskpoolUtilsAsynclockDifferentTest() {
  describe('TaskpoolUtilsAsynclockDifferentTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(300);
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
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0100
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0100';
        console.info(`${caseName} test start`);
        let LOCK1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise = LOCK1.lockAsync(async () => {
            console.log('SHARED');
            console.log('EXCLUSIVE');
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
        await sleep(300);
        console.log('count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`)
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0200
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0200';
        console.info(`${caseName} test start`);
        let LOCK1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        taskpool.execute(task).then(async (value: Object) => {
          console.log("taskpool result: " + value);
          for (let i = 0; i < 3; i++) {
            const promise1 = LOCK1.lockAsync(async () => {
              console.log('SHARED');
              try {
                throw new Error('Error occurred in asynchronous operation');
              } catch (error) {
                count++;
                console.error('Caught an exception:', error.message);
              }
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            promises.push(promise1);
          }
        });
        await Promise.all(promises);
        await sleep(300);
        console.log('count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`)
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0300
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0300';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                console.log('Asynchronous operation completed');
                resolve();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        await sleep(300);
        await Promise.all(promises);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0400
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0400';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log('Asynchronous operation completed');
                  resolve();
                  count++;
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        await Promise.all(promises);
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0500
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0500';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        let count = 0;
        const promises: Promise<void>[] = [];
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await new Promise<void>((_, reject) => {
              setTimeout(() => {
                console.log('Asynchronous operation completed');
                reject();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        await Promise.all(promises);
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0600
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0600';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await new Promise<void>((_, reject) => {
                setTimeout(() => {
                  console.log('Asynchronous operation completed');
                  reject();
                  count++;
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        await Promise.all(promises);
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0700
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0700';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0800
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0800';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
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
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        console.log('Error count:' + errorCount);
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_0900
     * @tc.name TaskpoolUtilsAsynclockDifferentTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest0900';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let errorCount = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await new Promise<void>((_, reject) => {
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
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        expect(errorCount).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1000
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1000';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1100
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1100';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
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
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        console.log('Error count:' + errorCount);
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1200
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1200';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let errorCount = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await lock2.lockAsync(async () => {
                console.log('Enter exclusive lock lock2');
                await new Promise<void>((_, reject) => {
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
              console.log('Exit exclusive lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        expect(errorCount).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1300
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1400
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1400';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1500
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1500';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await lock2.lockAsync(async () => {
                console.log('Enter exclusive lock lock2');
                await new Promise<void>((resolve, reject) => {
                  setTimeout(() => {
                    count++;
                    resolve();
                  }, 200);
                });
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
              console.log('Exit exclusive lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1600
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1600';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1700
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1700';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await lock2.lockAsync(async () => {
                console.log('Enter exclusive lock lock2');
                await new Promise<void>((resolve, reject) => {
                  setTimeout(() => {
                    count++;
                    reject();
                  }, 200);
                });
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
              console.log('Exit exclusive lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1800
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1800';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_1900
     * @tc.name TaskpoolUtilsAsynclockDifferentTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest1900';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
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
        console.log('Error count:' + errorCount);
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_2000
     * @tc.name TaskpoolUtilsAsynclockDifferentTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest2000';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let errorCount = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await lock2.lockAsync(async () => {
                console.log('Enter exclusive lock lock2');
                await new Promise<void>((_, reject) => {
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
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit exclusive lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        expect(errorCount).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_2100
     * @tc.name TaskpoolUtilsAsynclockDifferentTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest2100';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let errorCount = 0;
        task.onEnqueued(() => {
          console.info("taskpool: onEnqueued")
        });
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await lock2.lockAsync(async () => {
                console.log('Enter exclusive lock lock2');
                await new Promise<void>((_, reject) => {
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
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit exclusive lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        expect(errorCount).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_2200
     * @tc.name TaskpoolUtilsAsynclockDifferentTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest2200';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
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
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_2300
     * @tc.name TaskpoolUtilsAsynclockDifferentTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest2300';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await lock2.lockAsync(async () => {
                console.log('Enter exclusive lock lock2');
                await new Promise<void>((resolve, reject) => {
                  setTimeout(() => {
                    count++;
                    resolve();
                  }, 200);
                });
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit exclusive lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_2400
     * @tc.name TaskpoolUtilsAsynclockDifferentTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest2400';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
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
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_2500
     * @tc.name TaskpoolUtilsAsynclockDifferentTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest2500';
        console.info(`${caseName} test start`);
        const lock1 = new ArkTSUtils.locks.AsyncLock();
        const lock2 = new ArkTSUtils.locks.AsyncLock();
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        await taskpool.execute(task).then(async () => {
          for (let i = 0; i < 3; i++) {
            const promise1 = lock1.lockAsync(async () => {
              console.log('Enter shared lock lock1');
              await lock2.lockAsync(async () => {
                console.log('Enter exclusive lock lock2');
                await new Promise<void>((resolve, reject) => {
                  setTimeout(() => {
                    count++;
                    reject();
                  }, 200);
                });
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit exclusive lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit shared lock lock1');
            promises.push(promise1);
          }
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_UTILS_ASYNCLOCK_DIFFERENT_TEST_2600
     * @tc.name TaskpoolUtilsAsynclockDifferentTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskpoolUtilsAsynclockDifferentTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolUtilsAsynclockDifferentTest2600';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info("main2 thread count is  " + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

  })
}