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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { ArkTSUtils, collections, lang, taskpool } from '@kit.ArkTS';
import {
  printAny1,
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  printArray1,
  printArray2,
  printArray3,
  printArray4,
  printArrayBuffer1,
  printArrayBuffer2,
  printArrayBuffer3,
  printArrayBuffer4,
  printASON1,
  printASON2,
  printASON3,
  printASON4,
  printAsyncLock1,
  printAsyncLock2,
  printAsyncLock3,
  printAsyncLock4,
  printBigint1,
  printBigint2,
  printBigint3,
  printBigint4,
  printBitVector1,
  printBitVector2,
  printBitVector3,
  printBitVector4,
  printBoolean1,
  printBoolean2,
  printBoolean3,
  printBoolean4,
  printConcatArray1,
  printConcatArray2,
  printConcatArray3,
  printConcatArray4,
  printEnum1,
  printEnum2,
  printEnum3,
  printEnum4,
  printFloat32Array1,
  printFloat32Array2,
  printFloat32Array3,
  printFloat32Array4,
  printInt16Array1,
  printInt16Array2,
  printInt16Array3,
  printInt16Array4,
  printInt32Array1,
  printInt32Array2,
  printInt32Array3,
  printInt32Array4,
  printInt8Array1,
  printInt8Array2,
  printInt8Array3,
  printInt8Array4,
  printISendable1,
  printISendable2,
  printISendable3,
  printISendable4,
  printMap1,
  printMap2,
  printMap3,
  printMap4,
  printMyClass1,
  printMyClass2,
  printNull1,
  printNull2,
  printNull3,
  printNull4,
  printSendableFunction1,
  printSendableFunction2,
  printSendableTestClass1,
  printSendableTestClass2,
  printSet1,
  printSet2,
  printSet3,
  printSet4,
  printSharedArrayBuffer3,
  printSharedArrayBuffer4,
  printStr1,
  printStr2,
  printStr3,
  printStr4,
  printUint16Array1,
  printUint16Array2,
  printUint16Array3,
  printUint16Array4,
  printUint32Array1,
  printUint32Array2,
  printUint32Array3,
  printUint32Array4,
  printUint8Array1,
  printUint8Array2,
  printUint8Array3,
  printUint8Array4,
  printUint8ClampedArray1,
  printUint8ClampedArray2,
  printUint8ClampedArray3,
  printUint8ClampedArray4,
  printUndefined1,
  printUndefined2,
  printUndefined3,
  printUndefined4,
  printUnion1,
  printUnion2,
  printUnion3,
  printUnion4,
  sampleFunction
} from '../testability/pages/TaskMethods';
import {
  Count1,
  Count2,
  Count3,
  Count4,
  CountBigint1,
  CountBigint2,
  CountBol1,
  CountBol2,
  CountStr1,
  CountStr2,
  CountUndefined1,
  CountUndefined2,
  MyClass,
  MyEnum,
  SendableTestClass
} from '../testability/pages/TaskDataFlg';
import { BusinessError } from '@kit.BasicServicesKit';
import { AsyncLock } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';


export default function TaskGroupAbilityTest3() {
  describe('TaskGroupAbilityTest3', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(1000)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_5300
     * @tc.name taskPoolTaskGroupTask5300
     * @tc.desc Create two tasks with ISendable interface parameters and ISendable interface return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask5300', 0, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let iSendable1: lang.ISendable = 1
      let iSendable2: lang.ISendable = "test2"
      taskGroup.addTask(printISendable1, iSendable1);
      taskGroup.addTask(printISendable2, iSendable2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      Done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_5400
     * @tc.name taskPoolTaskGroupTask5400
     * @tc.desc Create two tasks with ISendable interface parameters and ISendable interface return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask5400', 0, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let iSendable1: lang.ISendable = 1
      let iSendable2: lang.ISendable = "test2"
      taskGroup.addTask(printISendable3, iSendable1);
      taskGroup.addTask(printISendable4, iSendable2);

      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      Done();
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_5500
     * @tc.name taskPoolTaskGroupTask5500
     * @tc.desc Create two tasks with SendableFunction parameters and SendableFunction return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask5500', 0, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();

      taskGroup.addTask(printSendableFunction1, sampleFunction);
      taskGroup.addTask(printSendableFunction2, sampleFunction);
      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        try {
          const results = await taskpool.execute(taskGroup) as object[];
          results.forEach((result) => {
            const newResult = result as Function;
            newResult(sampleFunction);
          });
          Count1.count++
          Count2.count++
        } catch (error) {
          console.error('Error executing task group:', error);
        }
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      Done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_5600
     * @tc.name taskPoolTaskGroupTask5600
     * @tc.desc Create two tasks with SendableClass parameters and SendableClass return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask5600', 0, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printAny1, 1, "test")
      taskGroup.addTask(printAny1, 2, "tes2")

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }
      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      Done()
    })
  })
}