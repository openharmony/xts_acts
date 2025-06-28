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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "../../../hypium/index";
import { sleep } from '../testability/pages/TestUtils';
import hilog from '@ohos.hilog';

export default function ArrayBufferApiTest() {
  describe('ArrayBufferApiTest', (): void => {


    // Presets a clear action, which is performed after each unit test case ends.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: clear action function.
    afterEach(async (): Promise<void> => {
      console.info('ArrayBufferApiTest afterEach called');
      await sleep(200);
    })
    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0100
     * @tc.name ArrayBufferApiTest0100
     * @tc.desc Test ArrayBuffer.prototype.slice where start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0100';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const slice1 = sab.slice(8, 4);
          expect(slice1.byteLength).assertEqual(0);

          const slice2 = sab.slice(16, 8);
          expect(slice2.byteLength).assertEqual(0);

          const slice3 = sab.slice(4, 0);
          expect(slice3.byteLength).assertEqual(0);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
        }
        done();
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0200
     * @tc.name ArrayBufferApiTest0200
     * @tc.desc Test ArrayBuffer.prototype.slice where start < end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0200';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const slice1 = sab.slice(0, 16);
          expect(slice1.byteLength).assertEqual(16);

          const slice2 = sab.slice(0, 8);
          expect(slice2.byteLength).assertEqual(8);

          const slice3 = sab.slice(4, 12);
          expect(slice3.byteLength).assertEqual(8);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0300
     * @tc.name ArrayBufferApiTest0300
     * @tc.desc Test ArrayBuffer.prototype.slice where start = end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0300';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const slice1 = sab.slice(0, 0);
          expect(slice1.byteLength).assertEqual(0);

          const slice2 = sab.slice(8, 8);
          expect(slice2.byteLength).assertEqual(0);

          const slice3 = sab.slice(16, 16);
          expect(slice3.byteLength).assertEqual(0);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0400
     * @tc.name ArrayBufferApiTest0400
     * @tc.desc Test ArrayBuffer.prototype.slice with start=0, end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0400';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const int8Array = new Int8Array(sab);
          int8Array[0] = 42;

          const slice1 = sab.slice(0, 1);
          expect(slice1.byteLength).assertEqual(1);

          const slicedInt8Array = new Int8Array(slice1);
          expect(slicedInt8Array[0]).assertEqual(42);

          int8Array[0] = 24;
          expect(slicedInt8Array[0]).assertEqual(42);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0500
     * @tc.name ArrayBufferApiTest0500
     * @tc.desc Test ArrayBuffer.prototype.slice with start=0, end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0500';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const int8Array = new Int8Array(sab);
          int8Array[0] = 1;
          int8Array[15] = 15;

          const slice1 = sab.slice(0, 16);
          expect(slice1.byteLength).assertEqual(16);

          const slicedInt8Array = new Int8Array(slice1);
          expect(slicedInt8Array[0]).assertEqual(1);
          expect(slicedInt8Array[15]).assertEqual(15);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0600
     * @tc.name ArrayBufferApiTest0600
     * @tc.desc Test ArrayBuffer.prototype.slice with start=0, end=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0600';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const int8Array = new Int8Array(sab);
          int8Array[0] = 1;
          int8Array[15] = 15;

          const slice1 = sab.slice(0, 17);
          expect(slice1.byteLength).assertEqual(16);

          const slicedInt8Array = new Int8Array(slice1);
          expect(slicedInt8Array[0]).assertEqual(1);
          expect(slicedInt8Array[15]).assertEqual(15);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0700
     * @tc.name ArrayBufferApiTest0700
     * @tc.desc Test ArrayBuffer.prototype.slice with start=length, end=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0700';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);
          const slice1 = sab.slice(16, 17);
          expect(slice1.byteLength).assertEqual(0);

        } catch (err) {
          let error = err as Error;
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0800
     * @tc.name ArrayBufferApiTest0800
     * @tc.desc Test ArrayBuffer.prototype.slice with start=length-1, end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0800';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const int8Array = new Int8Array(sab);
          int8Array[15] = 42;

          const slice1 = sab.slice(15, 16);
          expect(slice1.byteLength).assertEqual(1);

          const slicedInt8Array = new Int8Array(slice1);
          expect(slicedInt8Array[0]).assertEqual(42);

          int8Array[15] = 24;
          expect(slicedInt8Array[0]).assertEqual(42);

        } catch (err) {
          let error = err as Error;
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_0900
     * @tc.name ArrayBufferApiTest0900
     * @tc.desc Test ArrayBuffer.prototype.slice with start=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest0900';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const int8Array = new Int8Array(sab);
          for (let i = 0; i < 16; i++) {
            int8Array[i] = i;
          }

          const slice1 = sab.slice(0);
          expect(slice1.byteLength).assertEqual(16);

          const slicedInt8Array = new Int8Array(slice1);
          for (let i = 0; i < 16; i++) {
            expect(slicedInt8Array[i]).assertEqual(i);
          }

          int8Array[0] = 99;
          expect(slicedInt8Array[0]).assertEqual(0);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_1000
     * @tc.name ArrayBufferApiTest1000
     * @tc.desc Test ArrayBuffer.prototype.slice with start=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest1000';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const slice1 = sab.slice(16);
          expect(slice1.byteLength).assertEqual(0);

          const int8Array = new Int8Array(slice1);
          expect(int8Array.length).assertEqual(0);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_1100
     * @tc.name ArrayBufferApiTest1100
     * @tc.desc Test ArrayBuffer.prototype.slice with start=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest1100';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const slice1 = sab.slice(17, sab.byteLength);
          expect(slice1.byteLength).assertEqual(0);

          const int8Array = new Int8Array(slice1);
          expect(int8Array.length).assertEqual(0);

        } catch (error: Error) {
          console.error(`${caseName} Test failed: ${error}`);
          expect(false).assertTrue();
        } finally {
          console.info(`${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_MODULE_ArrayBuffer_API_TEST_1200
     * @tc.name ArrayBufferApiTest1200
     * @tc.desc Test ArrayBuffer.prototype.slice with start=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferApiTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'ArrayBufferApiTest1200';
        console.info(`${caseName} test start`);

        try {
          const sab = new ArrayBuffer(16);

          const int8Array = new Int8Array(sab);
          int8Array[15] = 42;

          const slice1 = sab.slice(15, sab.byteLength);
          expect(slice1.byteLength).assertEqual(1);

          const slicedInt8Array = new Int8Array(slice1);
          expect(slicedInt8Array[0]).assertEqual(42);

          int8Array[15] = 99;
          expect(slicedInt8Array[0]).assertEqual(42);

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
