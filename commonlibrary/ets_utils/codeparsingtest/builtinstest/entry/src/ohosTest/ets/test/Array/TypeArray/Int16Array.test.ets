/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { Constants } from './Int16ArrayData.test'

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info( `sleep ${time} over...`)
  })
}

export default function Int16ArrayTest() {
  describe('Int16ArrayTest', () => {
    let value: string;
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
    afterEach(async (done:Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('TypeArray after each called');
      value == '';
      await sleep(10);
      done();
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0100
     * @tc.name       : testInt16Constructor0001
     * @tc.desc       : Testing Constructor of Int16Array without param.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0001";
      try {
        let array = new Int16Array();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0200
     * @tc.name       : testInt16Constructor0002
     * @tc.desc       : Testing Constructor of Int16Array with length 0,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0002";
      try {
        let array = new Int16Array(0);
        array[0] = 3;
        expect(array[0]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0300
     * @tc.name       : testInt16Constructor0003
     * @tc.desc       : Testing Constructor of Int16Array with length 10,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0003";
      try {
        let array = new Int16Array(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0400
     * @tc.name       : testInt16Constructor0004
     * @tc.desc       : Testing Constructor of Int16Array with length 10,and set index 0 with 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0004";
      try {
        let array = new Int16Array(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0500
     * @tc.name       : testInt16Constructor0005
     * @tc.desc       : Testing Constructor of Int16Array with length 10,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0005";
      try {
        let array = new Int16Array(10);
        expect(array[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0600
     * @tc.name       : testInt16Constructor0006
     * @tc.desc       : Testing Constructor of Int16Array with 'q',and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0006";
      try {
        const array = Constants.int16ConstructTestArray1;
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0700
     * @tc.name       : testInt16Constructor0007
     * @tc.desc       : Testing Constructor of Int16Array with '56',and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0007";
      try {
        const array = Constants.int16ConstructTestArray2;
        expect(array[1]).assertEqual(0);
        expect(array.length).assertEqual(56);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0800
     * @tc.name       : testInt16Constructor0008
     * @tc.desc       : Testing Constructor of Int16Array with array[21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0008";
      try {
        let array = new Int16Array([21, 31]);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_0900
     * @tc.name       : testInt16Constructor0009
     * @tc.desc       : Testing Constructor of Int16Array with array[21,31],and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0009";
      try {
        let array = new Int16Array([21, 31]);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1000
     * @tc.name       : testInt16Constructor0010
     * @tc.desc       : Testing Constructor of Int16Array with array[21,31],and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0010";
      try {
        let array = new Int16Array([21, 31]);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1100
     * @tc.name       : testInt16Constructor0011
     * @tc.desc       : Testing Constructor of Int16Array with array[21,31],and set value of index 10,get value of index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0011";
      try {
        let array = new Int16Array([21, 31]);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1200
     * @tc.name       : testInt16Constructor0012
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array which construct by array [21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0012";
      try {
        let array = new Int16Array(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1300
     * @tc.name       : testInt16Constructor0013
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array which construct by array [21,31],and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0013";
      try {
        let array = new Int16Array(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1400
     * @tc.name       : testInt16Constructor0014
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array which construct by array [21,31],and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0014";
      try {
        let array = new Int16Array(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1500
     * @tc.name       : testInt16Constructor0015
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array which construct by array [21,31],and set value of index 10,and get value of index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0015";
      try {
        let array = new Int16Array(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1600
     * @tc.name       : testInt16Constructor0016
     * @tc.desc       : Testing Constructor of Int16Array with Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0016";
      try {
        let array = new Int16Array(new Array(21,31));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1700
     * @tc.name       : testInt16Constructor0017
     * @tc.desc       : Testing Constructor of Int16Array with Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0017";
      try {
        let array = new Int16Array(new Array(21,31));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1800
     * @tc.name       : testInt16Constructor0018
     * @tc.desc       : Testing Constructor of Int16Array with Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0018";
      try {
        let array = new Int16Array(new Array(21,31));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_1900
     * @tc.name       : testInt16Constructor0019
     * @tc.desc       : Testing Constructor of Int16Array with Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0019";
      try {
        let array = new Int16Array(new Array(21,31));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2000
     * @tc.name       : testInt16Constructor0020
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0020";
      try {
        let array = new Int16Array(new Int8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2100
     * @tc.name       : testInt16Constructor0021
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0021";
      try {
        let array = new Int16Array(new Int8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2200
     * @tc.name       : testInt16Constructor0022
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0022";
      try {
        let array = new Int16Array(new Int8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2300
     * @tc.name       : testInt16Constructor0023
     * @tc.desc       : Testing Constructor of Int16Array with Int8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0023";
      try {
        let array = new Int16Array(new Int8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2400
     * @tc.name       : testInt16Constructor0024
     * @tc.desc       : Testing Constructor of Int16Array with Uint8Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0024";
      try {
        let array = new Int16Array(new Uint8Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2500
     * @tc.name       : testInt16Constructor0025
     * @tc.desc       : Testing Constructor of Int16Array with Uint8Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0025";
      try {
        let array = new Int16Array(new Uint8Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2600
     * @tc.name       : testInt16Constructor0026
     * @tc.desc       : Testing Constructor of Int16Array with Uint8Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0026";
      try {
        let array = new Int16Array(new Uint8Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2700
     * @tc.name       : testInt16Constructor0027
     * @tc.desc       : Testing Constructor of Int16Array with Uint8Array,Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0027";
      try {
        let array = new Int16Array(new Uint8Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2800
     * @tc.name       : testInt16Constructor0028
     * @tc.desc       : Testing Constructor of Int16Array with Uint8ClampedArray,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0028";
      try {
        let array = new Int16Array(new Uint8ClampedArray([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_2900
     * @tc.name       : testInt16Constructor0029
     * @tc.desc       : Testing Constructor of Int16Array with Uint8ClampedArray,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0029";
      try {
        let array = new Int16Array(new Uint8ClampedArray([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3000
     * @tc.name       : testInt16Constructor0030
     * @tc.desc       : Testing Constructor of Int16Array with Uint8ClampedArray,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0030";
      try {
        let array = new Int16Array(new Uint8ClampedArray([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3100
     * @tc.name       : testInt16Constructor0031
     * @tc.desc       : Testing Constructor of Int16Array with Uint8ClampedArray,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0031";
      try {
        let array = new Int16Array(new Uint8ClampedArray([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3200
     * @tc.name       : testInt16Constructor0032
     * @tc.desc       : Testing Constructor of Int16Array with Int16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0032";
      try {
        let array = new Int16Array(new Int16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3300
     * @tc.name       : testInt16Constructor0033
     * @tc.desc       : Testing Constructor of Int16Array with Int16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0033";
      try {
        let array = new Int16Array(new Int16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3400
     * @tc.name       : testInt16Constructor0034
     * @tc.desc       : Testing Constructor of Int16Array with Int16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0034";
      try {
        let array = new Int16Array(new Int16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3500
     * @tc.name       : testInt16Constructor0035
     * @tc.desc       : Testing Constructor of Int16Array with Int16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0035";
      try {
        let array = new Int16Array(new Int16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3600
     * @tc.name       : testInt16Constructor0036
     * @tc.desc       : Testing Constructor of Int8Array with Uint16Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0036";
      try {
        let array = new Int16Array(new Uint16Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3700
     * @tc.name       : testInt16Constructor0037
     * @tc.desc       : Testing Constructor of Int16Array with Uint16Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0037";
      try {
        let array = new Int16Array(new Uint16Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3800
     * @tc.name       : testInt16Constructor0038
     * @tc.desc       : Testing Constructor of Int16Array with Uint16Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0038";
      try {
        let array = new Int16Array(new Uint16Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_3900
     * @tc.name       : testInt16Constructor0039
     * @tc.desc       : Testing Constructor of Int16Array with Uint16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0039";
      try {
        let array = new Int16Array(new Uint16Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4000
     * @tc.name       : testInt16Constructor0040
     * @tc.desc       : Testing Constructor of Int16Array with Int32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0040";
      try {
        let array = new Int16Array(new Int32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4100
     * @tc.name       : testInt16Constructor0041
     * @tc.desc       : Testing Constructor of Int16Array with Int32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0041";
      try {
        let array = new Int16Array(new Int32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4200
     * @tc.name       : testInt16Constructor0042
     * @tc.desc       : Testing Constructor of Int8Array with Int32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0042";
      try {
        let array = new Int16Array(new Int32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4300
     * @tc.name       : testInt16Constructor0043
     * @tc.desc       : Testing Constructor of Int16Array with Int32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0043";
      try {
        let array = new Int16Array(new Int32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4400
     * @tc.name       : testInt16Constructor0044
     * @tc.desc       : Testing Constructor of Int16Array with Uint32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0044";
      try {
        let array = new Int16Array(new Uint32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4500
     * @tc.name       : testInt16Constructor0045
     * @tc.desc       : Testing Constructor of Int16Array with Uint32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0045";
      try {
        let array = new Int16Array(new Uint32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4600
     * @tc.name       : testInt16Constructor0046
     * @tc.desc       : Testing Constructor of Int16Array with Uint32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0046";
      try {
        let array = new Int16Array(new Uint32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4700
     * @tc.name       : testInt16Constructor0047
     * @tc.desc       : Testing Constructor of Int16Array with Uint32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0047";
      try {
        let array = new Int16Array(new Uint32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4800
     * @tc.name       : testInt16Constructor0048
     * @tc.desc       : Testing Constructor of Int16Array with BigInt64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0048";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigInt64Array([-21n, 31n]);
        // new Int16Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const int16Array  = new Int16Array(byteLength * 2); // because Int16 is 2 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Int16Array
          const bytes = new Int16Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          int16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int16Array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_4900
     * @tc.name       : testInt16Constructor0049
     * @tc.desc       : Testing Constructor of Int16Array with BigInt64Array,and get value is error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0049";
      try {
        let bigInt64Array = new BigInt64Array([21n,31n]);
        new Int16Array(bigInt64Array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5000
     * @tc.name       : testInt16Constructor0050
     * @tc.desc       : Testing Constructor of Int16Array with BigUint64Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0050";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigUint64Array([21n, 31n]);
        // new Int16Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const int16Array  = new Int16Array(byteLength * 2); // because Int16is 2 byte，BigInt64 is 8 byte，buffer * 2.

        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Int16Array
          const bytes = new Int8Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          int16Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(int16Array[0]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5100
     * @tc.name       : testInt16Constructor0051
     * @tc.desc       : Testing Constructor of Int16Array with BigUint64Array, get value error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0051";
      try {
        let array = new Int16Array(new BigUint64Array([21n,31n]));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('TypeError');
        expect(err.message).assertContain('srcArrayContentType is not equal objContentType.');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5200
     * @tc.name       : testInt16Constructor0052
     * @tc.desc       : Testing Constructor of Int16Array with Float32Array,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0052";
      try {
        let array = new Int16Array(new Float32Array([21,31]));
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5300
     * @tc.name       : testInt16Constructor0053
     * @tc.desc       : Testing Constructor of Int16Array with Float32Array,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0053";
      try {
        let array = new Int16Array(new Float32Array([21,31]));
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5400
     * @tc.name       : testInt16Constructor0054
     * @tc.desc       : Testing Constructor of Int16Array with Float32Array,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0054";
      try {
        let array = new Int16Array(new Float32Array([21,31]));
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5500
     * @tc.name       : testInt16Constructor0055
     * @tc.desc       : Testing Constructor of Int16Array with Float32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0055";
      try {
        let array = new Int16Array(new Float32Array([21,31]));
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5600
     * @tc.name       : testInt16Constructor0056
     * @tc.desc       : Testing Constructor of Int16Array with ArrayBuffer,and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0056";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5700
     * @tc.name       : testInt16Constructor0057
     * @tc.desc       : Testing Constructor of Int16Array with ArrayBuffer,and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0057";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5800
     * @tc.name       : testInt16Constructor0058
     * @tc.desc       : Testing Constructor of Int16Array with ArrayBuffer,and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0058";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_5900
     * @tc.name       : testInt16Constructor0059
     * @tc.desc       : Testing Constructor of Int16Array with ArrayBuffer,Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0059";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
        expect(array[3]).assertEqual(0);
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_6000
     * @tc.name       : testInt16Constructor0060
     * @tc.desc       : Testing Constructor of Int16Array with (ArrayBuffer,0,2),and get value of index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0060";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Int16Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_6100
     * @tc.name       : testInt16Constructor0061
     * @tc.desc       : Testing Constructor of Int16Array with (ArrayBuffer,0,2),and get value of index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0061";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Int16Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_6200
     * @tc.name       : testInt16Constructor0062
     * @tc.desc       : Testing Constructor of Int16Array with (ArrayBuffer,0,2),and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0062";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Int16Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_CONSTRUCTOR_6300
     * @tc.name       : testInt16Constructor0063
     * @tc.desc       : Testing Constructor of Int16Array with (ArrayBuffer,0,2),
     * Set array[10] and get value of index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16Constructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16Constructor0063";
      try {
        let buffer = new ArrayBuffer(5);
        let array = new Int16Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTESPERELEMENT_6400
     * @tc.name       : testBytesPerElement0064
     * @tc.desc       : Testing BYTES_PER_ELEMENT of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBytesPerElement0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBytesPerElement0064";
      try {
        let bytes = Int16Array.BYTES_PER_ELEMENT;
        expect(bytes).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LENGTH_6500
     * @tc.name       : testInt16rrayLength0065
     * @tc.desc       : Testing length of Int8Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayLength0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayLength0065";
      try {
        let bytes = Int16Array.length;
        expect(bytes).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYFROM_6600
     * @tc.name       : testInt16ArrayFrom0066
     * @tc.desc       : Testing static function from 'foo' of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayFrom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayFrom0066";
      try {
        expect(Constants.int16ConstructTestArray3[0]).assertEqual(0);
        expect(Constants.int16ConstructTestArray3[1]).assertEqual(0);
        expect(Constants.int16ConstructTestArray3[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYFROM_6700
     * @tc.name       : testInt16ArrayFrom0067
     * @tc.desc       : Testing static function from "123" of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayFrom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayFrom0067";
      try {
        expect(Constants.int16ConstructTestArray6[0]).assertEqual(1);
        expect(Constants.int16ConstructTestArray6[1]).assertEqual(2);
        expect(Constants.int16ConstructTestArray6[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYFROM_6800
     * @tc.name       : testInt16ArrayFrom0068
     * @tc.desc       : Testing static function from set() of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayFrom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayFrom0068";
      try {
        expect(Constants.int16ConstructTestArray4[0]).assertEqual(0);
        expect(Constants.int16ConstructTestArray4[1]).assertEqual(0);
        expect(Constants.int16ConstructTestArray4[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYFROM_6900
     * @tc.name       : testInt16ArrayFrom0069
     * @tc.desc       : Testing static function from map() of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayFrom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayFrom0069";
      try {
        expect(Constants.int16ConstructTestArray5[0]).assertEqual(0);
        expect(Constants.int16ConstructTestArray5[1]).assertEqual(0);
        expect(Constants.int16ConstructTestArray5[2]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYFROM_7000
     * @tc.name       : testInt16ArrayFrom0070
     * @tc.desc       : Testing static function from => func of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayFrom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayFrom0070";
      try {
        let array = Int16Array.from(Array.from([1, 2, 3], (x) => x + x));
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(4);
        expect(array[2]).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYFROM_7100
     * @tc.name       : testInt16ArrayFrom0071
     * @tc.desc       : Testing static function from length => of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayFrom0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayFrom0071";
      try {
        expect(Constants.int16FromTestArray[0]).assertEqual(0);
        expect(Constants.int16FromTestArray[1]).assertEqual(1);
        expect(Constants.int16FromTestArray[2]).assertEqual(2);
        expect(Constants.int16FromTestArray[3]).assertEqual(3);
        expect(Constants.int16FromTestArray[4]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYFROM_7200
     * @tc.name       : testInt16ArrayFrom0072
     * @tc.desc       : Testing static function from range length step + 1 => of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayFrom0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayFrom0072";
      try {
        expect(Constants.int16ArrayNumber[0]).assertEqual(0);
        expect(Constants.int16ArrayNumber[1]).assertEqual(1);
        expect(Constants.int16ArrayNumber[2]).assertEqual(2);
        expect(Constants.int16ArrayNumber[3]).assertEqual(3);
        expect(Constants.int16ArrayNumber[4]).assertEqual(4);
        expect(Constants.int16ArrayNumber[5]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYFROM_7300
     * @tc.name       : testInt16ArrayFrom0073
     * @tc.desc       : Testing static function from range length 'A~Z' => of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayFrom0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayFrom0073";
      try {
        expect(Constants.int16ArrayCharacter[0]).assertEqual(65);
        expect(Constants.int16ArrayCharacter[1]).assertEqual(66);
        expect(Constants.int16ArrayCharacter[2]).assertEqual(67);
        expect(Constants.int16ArrayCharacter[25]).assertEqual(90);
        expect(Constants.int16ArrayCharacter[26]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_7400
     * @tc.name       : testInt16ArrayOf0074
     * @tc.desc       : Testing static function of non of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0074";
      try {
        let array = Int16Array.of();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_7500
     * @tc.name       : testInt16ArrayOf0075
     * @tc.desc       : Testing static function of length 0 of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0075";
      try {
        let array = Int16Array.of(0);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_7600
     * @tc.name       : testInt16ArrayOf0076
     * @tc.desc       : Testing static function of length 10 of Int16Array, get index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0076";
      try {
        let array = Int16Array.of(10);
        array[0] = 3;
        expect(array[0]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_7700
     * @tc.name       : testInt16ArrayOf0077
     * @tc.desc       : Testing static function of length 10 of Int16Array, get index 10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0077";
      try {
        let array = Int16Array.of(10);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_7800
     * @tc.name       : testInt16ArrayOf0078
     * @tc.desc       : Testing static function of length 10 of Int16Array, get index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0078";
      try {
        let array = Int16Array.of(10);
        expect(array[1]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_7900
     * @tc.name       : testInt16ArrayOf0079
     * @tc.desc       : Testing static function of [21, 31] of Int16Array, get index 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0079";
      try {
        let array = Int16Array.of(21, 31);
        expect(array[0]).assertEqual(21);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_8000
     * @tc.name       : testInt16ArrayOf0080
     * @tc.desc       : Testing static function of [21, 31] of Int16Array, get index 1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0080";
      try {
        let array = Int16Array.of(21, 31);
        expect(array[1]).assertEqual(31);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_8100
     * @tc.name       : testInt16ArrayOf0081
     * @tc.desc       : Testing static function of [21, 31] of Int16Array, get index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0081";
      try {
        let array = Int16Array.of(21, 31);
        expect(array[3]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_8200
     * @tc.name       : testInt16ArrayOf0082
     * @tc.desc       : Testing static function of [21, 31] of Int16Array, get index 3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0082";
      try {
        let array = Int16Array.of(21, 31);
        array[10] = 3;
        expect(array[10]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_8300
     * @tc.name       : testInt16ArrayOf0083
     * @tc.desc       : Testing static function of undefined of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0083";
      try {
        expect(Constants.int16OfTestUndefined.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_8400
     * @tc.name       : testInt16ArrayOf0084
     * @tc.desc       : Testing static function of "test" of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0084";
      try {
        expect(Constants.int16OfTestStr.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_8500
     * @tc.name       : testInt16ArrayOf0085
     * @tc.desc       : Testing static function of "123" of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0085";
      try {
        expect(Constants.int16OfTestNumber1.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYOF_8600
     * @tc.name       : testInt16ArrayOf0086
     * @tc.desc       : Testing static function of "1","2","3" of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayOf0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayOf0086";
      try {
        expect(Constants.int16OfTestNumber2[0]).assertEqual(1);
        expect(Constants.int16OfTestNumber2[1]).assertEqual(2);
        expect(Constants.int16OfTestNumber2[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAYBYTEOFFSET_8700
     * @tc.name       : testInt16ArrayByteOffset0087
     * @tc.desc       : Testing instance property byteOffset of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayByteOffset0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayByteOffset0087";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Int16Array(buffer);
        expect(arrayOffSet0.byteOffset).assertEqual(0);
        const arrayOffSet8 = new Int16Array(buffer, 8);
        expect(arrayOffSet8.byteOffset).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYBYTELENGTH_8800
     * @tc.name       : testInt16ArrayByteLength0088
     * @tc.desc       : Testing instance property byteLength of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayByteLength0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayByteLength0088";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Int16Array(buffer);
        expect(arrayOffSet0.byteLength).assertEqual(32);
        const arrayOffSet8 = new Int16Array(buffer, 8);
        expect(arrayOffSet8.byteLength).assertEqual(24);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYBUFFER_8900
     * @tc.name       : testInt16ArrayBuffer0089
     * @tc.desc       : Testing instance property buffer of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayBuffer0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayBuffer0089";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Int16Array(buffer);
        expect(arrayOffSet0.buffer.byteLength).assertEqual(32);
        const arrayOffSet8 = new Int16Array(buffer, 8);
        expect(arrayOffSet8.buffer.byteLength).assertEqual(32);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAYLENGTH_9000
     * @tc.name       : testInt16ArrayLength0090
     * @tc.desc       : Testing instance function length of Int16Array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInt16ArrayLength0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testInt16ArrayLength0090";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Int16Array(buffer);
        expect(arrayOffSet0.length).assertEqual(16);
        const arrayOffSet8 = new Int16Array(buffer, 8);
        expect(arrayOffSet8.length).assertEqual(12);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

  })
}