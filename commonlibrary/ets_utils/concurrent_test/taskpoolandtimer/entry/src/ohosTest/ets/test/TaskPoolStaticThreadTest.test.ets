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
import {
  awaitAsync,
  awaitCatch,
  awaitCompute,
  awaitFinally,
  awaitPromise,
  promiseAll,
  promiseCompute,
  promiseThen,
} from '../testability/pages/TaskMethodTest';
import { sleep } from './TaskPoolTaskGroupLazyWorkerTest.test';

const TASK_COUNT = 10;

export default function taskPoolStaticThreadTest() {
  describe('TaskPoolStaticThreadTest', () => {
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
     * @tc.number TASKPOOL_STATIC_THREAD_TEST_0100
     * @tc.name taskPoolStaticThreadTest1001
     * @tc.desc test static new-promise & promise-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticThreadTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(promiseThen, i);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(i * 2 + 1);
          await sleep(100);
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_THREAD_TEST_0200
     * @tc.name taskPoolStaticThreadTest1002
     * @tc.desc test static asyncFuction-(new-promise & promise)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticThreadTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(awaitCompute, i);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual((i * 2 + 1) * 2);
          await sleep(100);
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_THREAD_TEST_0300
     * @tc.name taskPoolStaticThreadTest1003
     * @tc.desc test static new-promise & promise-then-asyncFuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticThreadTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(awaitPromise, i);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(((i + 10) * 2 + 1));
          await sleep(100);
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_THREAD_TEST_0400
     * @tc.name taskPoolStaticThreadTest1004
     * @tc.desc test static new-promise & promise--finally-fuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticThreadTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(awaitFinally, i);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(((i + 1) * 2 + 1));
          await sleep(100);
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_THREAD_TEST_0500
     * @tc.name taskPoolStaticThreadTest1005
     * @tc.desc test static new-promise & promise-catch-fuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticThreadTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(awaitCatch, i);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual((i * 4 + 1));
          await sleep(100);
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_THREAD_TEST_0600
     * @tc.name taskPoolStaticThreadTest1006
     * @tc.desc test static new-promise & promise-then-fuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticThreadTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(promiseCompute, i);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(((i + 1) * 2 + 1));
          await sleep(100);
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_THREAD_TEST_0700
     * @tc.name taskPoolStaticThreadTest1007
     * @tc.desc test static new-promise-then-asyncFuction & promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticThreadTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(awaitAsync, i);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual((i * 2 + 2));
          await sleep(100);
        }
        done();
      });

    /**
     * @tc.number TASKPOOL_STATIC_THREAD_TEST_0800
     * @tc.name taskPoolStaticThreadTest1008
     * @tc.desc test static new-promise & promise & fuction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolStaticThreadTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        for (let i = 0; i < TASK_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(promiseAll, i);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(((i + 1) * 2 + 1 + i));
          await sleep(100);
        }
        done();
      });
  });
}