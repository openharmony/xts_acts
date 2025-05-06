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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from "@ohos/hypium";
import { worker } from '@kit.ArkTS';
import {SharedCounter} from '../testability/pages/AtomicsMultithreadUtils';
import { sleep } from "../testability/pages/TestUtils";

export default function AtomicsMultithreadTest() {
  describe('AtomicsMultithreadTest', () => {
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
     * @tc.number SUB_ATOMICS_MULTITHREAD_TEST_0100
     * @tc.name AtomicsMultithreadTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsMultithreadTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const sharedBuffer = new SharedArrayBuffer(4);
      const sharedArray = new Int32Array(sharedBuffer);
      sharedArray[0] = 5;
      console.log(`主线程: 初始值 = ${sharedArray[0]}`);
      const worker1 = new worker.ThreadWorker("../testability/pages/workers/Worker4");  //add 5
      const worker2 = new worker.ThreadWorker("../testability/pages/workers/Worker4");  //add 5
      worker1.postMessage(sharedBuffer);
      worker2.postMessage(sharedBuffer);
      worker1.onmessage = (e) => {
        console.log(`主线程收到 worker1 消息: ${e.data}`);
        worker1.terminate();
      };
      worker2.onmessage = (e) => {
        console.log(`主线程收到 worker2 消息: ${e.data}`);
        worker2.terminate();
      };
      await new Promise<void>((resolve) => setTimeout(resolve, 3000));
      expect(15).assertEqual(sharedArray[0]);
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_MULTITHREAD_TEST_0200
     * @tc.name AtomicsMultithreadTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsMultithreadTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // 创建一个共享内存的 Int32Array
      const sharedBuffer = new SharedArrayBuffer(4); // 4字节，足够存储一个32位整数
      const sharedArray = new Int32Array(sharedBuffer);
      // 初始值设置为10
      sharedArray[0] = 5;
      // 创建 Worker 线程
      const worker1 = new worker.ThreadWorker("../testability/pages/workers/Worker4");  //add 5
      // 向 Worker 发送共享内存
      worker1.postMessage(sharedBuffer);
      // 监听 Worker 的消息
      worker1.onmessage = (e) => {
        worker1.terminate();
      };
      await new Promise<void>((resolve) => setTimeout(resolve, 3000));
      //5 + 5  = 10
      expect(10).assertEqual(sharedArray[0]);
      Done();
    });



    /**
     * @tc.number SUB_ATOMICS_MULTITHREAD_TEST_0300
     * @tc.name AtomicsMultithreadTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsMultithreadTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // 创建一个共享内存的 Int32Array
      const sharedBuffer = new SharedArrayBuffer(4); // 4字节，足够存储一个32位整数
      const sharedArray = new Int32Array(sharedBuffer);
      // 初始值设置为10
      sharedArray[0] = 10;
      // 打印初始值
      console.log(`主线程: 初始值 = ${sharedArray[0]}`);
      // 创建 Worker 线程
      const worker1 = new worker.ThreadWorker("../testability/pages/workers/Worker4");  //add 5
      const worker2 = new worker.ThreadWorker("../testability/pages/workers/Worker5");  //and 0b0001
      // 向 Worker 发送共享内存
      worker1.postMessage(sharedBuffer);
      worker2.postMessage(sharedBuffer);
      // 监听 Worker 的消息
      worker1.onmessage = (e) => {
        console.log(`主线程收到 worker1 消息: ${e.data}`);
        worker1.terminate();
      };
      worker2.onmessage = (e) => {
        console.log(`主线程收到 worker2 消息: ${e.data}`);
        worker2.terminate();
      };
      await new Promise<void>((resolve) => setTimeout(resolve, 3000));
      //多线程操作顺序可能不同导致的结果也不同
      expect([1,5].includes(sharedArray[0])).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_MULTITHREAD_TEST_0400
     * @tc.name AtomicsMultithreadTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsMultithreadTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // 创建共享计数器（初始值=10）
      const counter = new SharedCounter(10);
      // 创建两个 Worker
      const worker1 = new worker.ThreadWorker("../testability/pages/workers/Worker6");
      let result = 0;
      // 向 Worker 发送共享内存
      worker1.postMessage(counter.getBuffer());

      // 监听 Worker 完成消息
      worker1.onmessage = () => {
        console.log(`主线程收到 Worker1 完成通知`);
      };

      // 主线程同时操作共享内存
      result = counter.add(11); //result返回初始值
      // 3秒后终止 Worker 并查看最终结果
      setTimeout(() => {
        worker1.terminate();
      }, 3000);

      await new Promise<void>((resolve) => setTimeout(resolve, 3000));
      expect(10).assertEqual(result);
      Done();
    });


  })
}