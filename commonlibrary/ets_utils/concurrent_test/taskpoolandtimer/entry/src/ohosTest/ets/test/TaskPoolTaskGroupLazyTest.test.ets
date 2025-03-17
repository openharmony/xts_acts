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
  awaitAsync,
  awaitCatch,
  awaitCompute,
  awaitFinally,
  awaitPromise,
  promiseAll,
  promiseCompute,
  promiseThen
} from '../testability/pages/TaskMethodTest';

const TASK_COUNT = 10;

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}


export default function taskPoolTaskGroupLazyTest() {
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

  describe('TaskPoolTaskGroupLazyTest', () => {
    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_TEST_1001
     * @tc.name taskPoolTaskGroupLazyTest1001
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let i = 0; i < TASK_COUNT; i++) {
        const task: taskpool.Task = new taskpool.Task(promiseThen, i);
        const result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(i * 2 + 1);
        sleep(100);
      }
      done();
    });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_TEST_1002
     * @tc.name taskPoolTaskGroupLazyTest1002
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let i = 0; i < TASK_COUNT; i++) {
        const task: taskpool.Task = new taskpool.Task(awaitCompute, i);
        const result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual((i * 2 + 1) * 2);
        sleep(100);
      }
      done();
    });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_TEST_1003
     * @tc.name taskPoolTaskGroupLazyTest1003
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let i = 0; i < TASK_COUNT; i++) {
        const task: taskpool.Task = new taskpool.Task(awaitPromise, i);
        const result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(((i + 10) * 2 + 1));
        sleep(100);
      }
      done();
    });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_TEST_1004
     * @tc.name taskPoolTaskGroupLazyTest1004
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let i = 0; i < TASK_COUNT; i++) {
        const task: taskpool.Task = new taskpool.Task(awaitFinally, i);
        const result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(((i + 1) * 2 + 1));
        sleep(100);
      }
      done();
    });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_TEST_1005
     * @tc.name taskPoolTaskGroupLazyTest1005
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let i = 0; i < TASK_COUNT; i++) {
        const task: taskpool.Task = new taskpool.Task(awaitCatch, i);
        const result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual((i * 4 + 1));
        sleep(100);
      }
      done();
    });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_TEST_1006
     * @tc.name taskPoolTaskGroupLazyTest1006
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let i = 0; i < TASK_COUNT; i++) {
        const task: taskpool.Task = new taskpool.Task(promiseCompute, i);
        const result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(((i + 1) * 2 + 1));
        sleep(100);
      }
      done();
    });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_TEST_1007
     * @tc.name taskPoolTaskGroupLazyTest1007
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let i = 0; i < TASK_COUNT; i++) {
        const task: taskpool.Task = new taskpool.Task(awaitAsync, i);
        const result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual((i * 2 + 2));
        sleep(100);
      }
      done();
    });

    /**
     * @tc.number TASKPOOL_TASKGROUP_LAZY_TEST_1008
     * @tc.name taskPoolTaskGroupLazyTest1008
     * @tc.desc test taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupLazyTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let i = 0; i < TASK_COUNT; i++) {
        const task: taskpool.Task = new taskpool.Task(promiseAll, i);
        const result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(((i + 1) * 2 + 1 + i));
        sleep(100);
      }
      done();
    });
  });
}