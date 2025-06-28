/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "../../../hypium/index";
import { gc, MemoryMonitor, performBufferOperations, sleep } from '../testability/pages/TestUtils';
import hilog from '@ohos.hilog';
export default function ArrayBufferTest() {
  describe('ArrayBufferTest', (): void => {

    // Presets an action, which is performed before each unit test case starts.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: preset action function.
    beforeEach(async (): Promise<void> => {
      console.info('ArrayBufferTest beforeEach called');
      // Add delay to ensure resources from the previous test case are released
      await sleep(200);
    })


    /**
     * @tc.number SUB_MODULE_ArrayBuffer_TEST_0100
     * @tc.name ArrayBufferTest0100
     * @tc.desc Test accessing ArrayBuffer with Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferTest0100';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const int32Array = new Int32Array(sab);
          expect(int32Array.length).assertEqual(4);
          expect(int32Array.byteLength).assertEqual(16);

          int32Array[0] = 123456789;
          int32Array[1] = -987654321;
          int32Array[2] = 0;
          int32Array[3] = 42;

          expect(int32Array[0]).assertEqual(123456789);
          expect(int32Array[1]).assertEqual(-987654321);
          expect(int32Array[2]).assertEqual(0);
          expect(int32Array[3]).assertEqual(42);

          const int32Array2 = new Int32Array(sab);

          expect(int32Array2[0]).assertEqual(123456789);
          expect(int32Array2[1]).assertEqual(-987654321);
          expect(int32Array2[2]).assertEqual(0);
          expect(int32Array2[3]).assertEqual(42);

          int32Array2[0] = 999;

          expect(int32Array[0]).assertEqual(999);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_TEST_0200
     * @tc.name ArrayBufferTest0200
     * @tc.desc Test accessing ArrayBuffer with Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferTest0200';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(32);

          const float64Array = new Float64Array(sab);
          expect(float64Array.length).assertEqual(4);
          expect(float64Array.byteLength).assertEqual(32);

          float64Array[0] = 3.14159265358979;
          float64Array[1] = -2.71828182845904;
          float64Array[2] = 0.0;
          float64Array[3] = 1.23456789e-10;

          expect(Math.abs(float64Array[0] - 3.14159265358979) < 1e-14).assertTrue();
          expect(Math.abs(float64Array[1] - (-2.71828182845904)) < 1e-14).assertTrue();
          expect(float64Array[2]).assertEqual(0.0);
          expect(Math.abs(float64Array[3] - 1.23456789e-10) < 1e-24).assertTrue();

          const float64Array2 = new Float64Array(sab);

          expect(Math.abs(float64Array2[0] - 3.14159265358979) < 1e-14).assertTrue();
          expect(Math.abs(float64Array2[1] - (-2.71828182845904)) < 1e-14).assertTrue();
          expect(float64Array2[2]).assertEqual(0.0);
          expect(Math.abs(float64Array2[3] - 1.23456789e-10) < 1e-24).assertTrue();

          float64Array[0] = Math.sin(1.0);
          expect(Math.abs(float64Array[0] - Math.sin(1.0)) < 1e-14).assertTrue();

          const uint8Array = new Uint8Array(sab);
          expect(uint8Array.length).assertEqual(32);

          const initialValue = float64Array[2];
          uint8Array[16] = 1;
          expect(float64Array[2] !== initialValue).assertTrue();

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_TEST_0300
     * @tc.name ArrayBufferTest0300
     * @tc.desc Test accessing ArrayBuffer with Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferTest0300';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const uint8Array = new Uint8Array(sab);
          expect(uint8Array.length).assertEqual(16);
          expect(uint8Array.byteLength).assertEqual(16);

          for (let i = 0; i < 16; i++) {
            uint8Array[i] = i + 10;
          }

          for (let i = 0; i < 16; i++) {
            expect(uint8Array[i]).assertEqual(i + 10);
          }

          uint8Array[0] = 0xF0;
          uint8Array[1] = 0x0F;

          uint8Array[2] = uint8Array[0] & uint8Array[1];
          expect(uint8Array[2]).assertEqual(0x00);

          uint8Array[3] = uint8Array[0] | uint8Array[1];
          expect(uint8Array[3]).assertEqual(0xFF);

          uint8Array[4] = uint8Array[0] ^ uint8Array[1];
          expect(uint8Array[4]).assertEqual(0xFF);

          uint8Array[6] = 0;
          uint8Array[7] = 255;
          expect(uint8Array[6]).assertEqual(0);
          expect(uint8Array[7]).assertEqual(255);

          uint8Array[8] = 255;
          uint8Array[8] += 1;
          expect(uint8Array[8]).assertEqual(0);

          const int32Array = new Int32Array(sab);

          int32Array[0] = 0x12345678;

          if (new Uint8Array(new Uint32Array([0x12345678]).buffer)[0] === 0x78) {
            expect(uint8Array[0]).assertEqual(0x78);
            expect(uint8Array[1]).assertEqual(0x56);
            expect(uint8Array[2]).assertEqual(0x34);
            expect(uint8Array[3]).assertEqual(0x12);
          } else {
            expect(uint8Array[0]).assertEqual(0x12);
            expect(uint8Array[1]).assertEqual(0x34);
            expect(uint8Array[2]).assertEqual(0x56);
            expect(uint8Array[3]).assertEqual(0x78);
          }

        } catch (error: Error) {
          hilog.info(11, 'SharedArrayBufferTest', `${caseName} error:`+error)
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });


    /**
     * @tc.number SUB_MODULE_ArrayBuffer_TEST_0700
     * @tc.name ArrayBufferTest0700
     * @tc.desc Test for memory leaks by repeatedly creating and disposing ArrayBuffer instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferTest0700';
        console.info(`${caseName} test start`);

        try {
          const iterations = 1000;
          const bufferSize = 1024;
          const monitor = new MemoryMonitor(caseName);

          await monitor.takeSnapshot('Initial');

          for (let i = 0; i < iterations; i++) {
            const sab = new ArrayBuffer(bufferSize);
            const int32Array = new Int32Array(sab);
            int32Array[0] = i;

            if (i == 0 || i == 200 || i == 400 || i == 600 || i == 800 || i == 999) {
              console.info(`${caseName}: Completed ${i} iterations`);
              await monitor.takeSnapshot(`After ${i} iterations`);
            }
          }

          console.info(`${caseName}: Completed all ${iterations} iterations`);
          await monitor.takeSnapshot('Final');

          const memoryLeakDetected = !monitor.checkForLeaks(1.5);
          console.info(`${caseName}: Memory leak detected: ${memoryLeakDetected}`);

          expect(memoryLeakDetected).assertFalse();
        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_TEST_0800
     * @tc.name ArrayBufferTest0800
     * @tc.desc Single thread iterating 1000 times through combined API operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferTest0800';
        console.info(`${caseName} test start`);
        try {
          let startTime: number = Date.now();
          let totalSum: number = 0;
          for (let i = 0; i < 1000; i++) {
            const sab = new ArrayBuffer(64);
            const int32Array = new Int32Array(sab);
            for (let j = 0; j < int32Array.length; j++) {
              int32Array[j] = j;
            }
            const float64Array = new Float64Array(sab);
            float64Array[0] = 3.14;

            let sum: number = 0;
            for (let j = 0; j < int32Array.length; j++) {
              sum += int32Array[j];
            }
            totalSum += sum;

            const sabSlice = sab.slice(0, 32);
            const sliceView = new Uint8Array(sabSlice);
            if (sliceView.byteLength > 0) {
              sliceView[0] = 1;
            }
          }
          let endTime: number = Date.now();
          console.info(`${caseName}: Completed 1000 iterations in ${endTime -
            startTime} ms with total sum: ${totalSum}`);
          expect(true).assertTrue();
        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_TEST_0900
     * @tc.name ArrayBufferTest0900
     * @tc.desc ArrayBuffer Performance Test 2100 - Multi-thread (10 threads) competing through 1000 iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferTest0900';
        console.info(`${caseName} test start`);
        try {
          const startTime: number = Date.now();
          const tasks: Array<Promise<number>> = [];

          for (let t = 0; t < 10; t++) {
            const task = new taskpool.Task(performBufferOperations);
            tasks.push(taskpool.execute(task) as Promise<number>);
          }

          const results: number[] = await Promise.all<number>(tasks);
          const totalSum: number = results.reduce((acc: number, val: number) => acc + Number(val), 0);

          const endTime: number = Date.now();
          console.info(`$   {caseName}: Completed multi-thread competition in ${endTime -
            startTime} ms with total sum: ${totalSum}`);
          expect(true).assertTrue();
        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_TEST_1000
     * @tc.name ArrayBufferTest1000
     * @tc.desc ArrayBuffer Lifecycle Test 2200 - Single thread iterating 1000 times with GC pressure while maintaining correct calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferTest1000';
        console.info(`${caseName} test start`);
        try {
          let startTime: number = Date.now();
          let totalSum: number = 0;

          const referenceBuffer = new ArrayBuffer(64);
          const referenceArray = new Int32Array(referenceBuffer);
          for (let j = 0; j < referenceArray.length; j++) {
            referenceArray[j] = j;
          }
          let referenceSum = 0;
          for (let j = 0; j < referenceArray.length; j++) {
            referenceSum += referenceArray[j];
          }

          for (let i = 0; i < 1000; i++) {
            const sab = new ArrayBuffer(64);
            const int32Array = new Int32Array(sab);
            for (let j = 0; j < int32Array.length; j++) {
              int32Array[j] = j;
            }

            if (i % 100 === 0) {
              gc();
              console.info(`${caseName}: Triggered GC at iteration ${i}`);
            }

            let sum: number = 0;
            for (let j = 0; j < int32Array.length; j++) {
              sum += int32Array[j];
            }

            expect(sum).assertEqual(referenceSum);

            totalSum += sum;

            const sabSlice = sab.slice(0, 32);
            const sliceView = new Uint8Array(sabSlice);
            if (sliceView.byteLength > 0) {
              sliceView[0] = 1;
            }
          }

          gc();

          let endTime: number = Date.now();
          console.info(`${caseName}: Completed 1000 iterations with GC in ${endTime -
            startTime} ms with total sum: ${totalSum}`);

          expect(totalSum).assertEqual(1000 * referenceSum);
          expect(true).assertTrue();
        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

  });
}

