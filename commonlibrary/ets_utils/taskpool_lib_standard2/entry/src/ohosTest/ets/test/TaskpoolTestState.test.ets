/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, afterEach } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@ohos.base';
import { printLang } from '../utils';

const asyncSleep: Function = (time: number): Promise<Object> => {
  return new Promise(resolve => setTimeout(resolve, time));
}
const promiseCase: Function = () => {
  let p: Promise<void | Object> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      resolve(0);
    }, 100);
  });
  return p;
}

export default function TaskpoolTestState() {
  describe('ActsTaskPoolStateTest', () => {

    afterEach(async () => {
      await asyncSleep(1000);
    })
    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4500
     * @tc.name      : testTaskpoolState001
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolState001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolState001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let testTask1: taskpool.Task = new taskpool.Task(printLang, 100);
        let testTask2: taskpool.Task = new taskpool.Task(printLang, 200);
        let testTask3: taskpool.Task = new taskpool.Task(printLang, 300);
        taskpool.execute(testTask1).then((res: Object) => {
          console.info(`${caseName}: testTask1 return value: ${JSON.stringify(res)}`);
          const taskInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          const state: taskpool.State = taskInfo.taskInfos[0]?.state;
          console.info(`${caseName}: state1: ${state}`);
          expect(state).assertEqual(2);
          isTerminate1 = true;
        });
        taskpool.execute(testTask2).then((res: Object) => {
          console.info(`${caseName}: testTask2 return value: ${JSON.stringify(res)}`);
          const taskInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          const state: taskpool.State = taskInfo.taskInfos[0]?.state;
          console.info(`${caseName}: state2: ${state}`);
          expect(state).assertEqual(2);
          isTerminate2 = true;
        });
        taskpool.execute(testTask3).then((res: Object) => {
          console.info(`${caseName}: testTask3 return value: ${JSON.stringify(res)}`);
          const taskInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          const state: taskpool.State = taskInfo.taskInfos[0]?.state;
          console.info(`${caseName}: state3: ${state}`);
          try {
            expect(state).assertEqual(2);
          } catch (error) {
            console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          }
          isTerminate3 = true;
        });
        let taskInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        console.info(`${caseName}: stateing1 taskInfo: ${JSON.stringify(taskInfo)}`);
        let state: taskpool.State = taskInfo.taskInfos[0]?.state;
        console.info(`${caseName}: stateing1: ${JSON.stringify(state)}`);
        expect(state).assertEqual(1);
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        taskInfo = taskpool.getTaskPoolInfo();
        console.info(`${caseName}: statef1 taskInfo: ${JSON.stringify(taskInfo)}`);
        expect(taskInfo.taskInfos.length).assertEqual(0);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

  });
}