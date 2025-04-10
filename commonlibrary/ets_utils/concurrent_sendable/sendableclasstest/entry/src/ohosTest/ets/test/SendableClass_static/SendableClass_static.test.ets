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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections } from '@kit.ArkTS';
import {
  arrowFunc,
  getArray,
  getArrayBuffer,
  getASON,
  getAsyncLock,
  getBigInt,
  getBitVector,
  getBoolean,
  getConcatArray,
  getEnum,
  getMap,
  getNull,
  getNumber,
  getSendableUnionArray,
  getSet,
  getString,
  getTopLevelClassInstance,
  getTopLevelFunction,
  getTypedArrayFloat32Array,
  getTypedArrayInt16Array,
  getTypedArrayInt32Array,
  getTypedArrayInt8Array,
  getTypedArrayUint16Array,
  getTypedArrayUint32Array,
  getTypedArrayUint8Array,
  getTypedArrayUint8ClampedArray,
  getUndefined,
  identityFunction,
  ISendable,
  ModifiedTopLevelSendableFunction,
  SendableConstEnum,
  SendableArrowNewStaticClass,
  SendableArrowOutStaticClass,
  SendableArrowStaticClass,
  SendableExpressionArrowOutStaticClass,
  SendableExpressionOutStaticClass,
  SendableFuncInStaticClass,
  SendableFuncStaticClass,
  SendableNonFuncStaticClass,
  SendableNonParameterFuncStaticClass,
  SendableOutArrowStaticClass,
  SendableParameterFuncStaticClass,
  SendableStaticClass,
  SendableFuncType,
  topLevelSendableClass,
} from './SendableClass_static';

new SendableFuncStaticClass(identityFunction);
new SendableArrowStaticClass(arrowFunc);
new SendableArrowOutStaticClass(arrowFunc);
new SendableFuncInStaticClass();
new SendableNonParameterFuncStaticClass();
new SendableOutArrowStaticClass();
new SendableNonFuncStaticClass();
new SendableParameterFuncStaticClass();
new SendableArrowNewStaticClass();
new SendableExpressionOutStaticClass();

@Sendable
export class SendableExpressionOutArrowStaticClass implements ISendable {
  static myString: string = getString();
  static myNumber: number = getNumber();
  static myBoolean: boolean = getBoolean();
  static myBigInt: bigint = getBigInt();
  static myUndefined: undefined | string | number | null = getUndefined();
  static myNull: undefined | string | number | null = getNull();
  static topLevelClassInstance: topLevelSendableClass = getTopLevelClassInstance();
  static topLevelFunction: SendableFuncType = getTopLevelFunction();
  static myEnum: SendableConstEnum = getEnum();
  static myArray: collections.Array<number> = getArray();
  static myMap: collections.Map<number, number> = getMap();
  static mySet: collections.Set<number> = getSet();
  static myTypedArrayInt8Array: collections.Int8Array = getTypedArrayInt8Array();
  static myTypedArrayUint8Array: collections.Uint8Array = getTypedArrayUint8Array();
  static myTypedArrayInt16Array: collections.Int16Array = getTypedArrayInt16Array();
  static myTypedArrayUint16Array: collections.Uint16Array = getTypedArrayUint16Array();
  static myTypedArrayInt32Array: collections.Int32Array = getTypedArrayInt32Array();
  static myTypedArrayUint32Array: collections.Uint32Array = getTypedArrayUint32Array();
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = getTypedArrayUint8ClampedArray();
  static myTypedArrayFloat32Array: collections.Float32Array = getTypedArrayFloat32Array();
  static myArrayBuffer: collections.ArrayBuffer = getArrayBuffer();
  static myConcatArray: collections.ConcatArray<number> = getConcatArray();
  static myBitVector: collections.BitVector = getBitVector();
  static myASON: ISendable = getASON();
  static myAsyncLock: ArkTSUtils.locks.AsyncLock = getAsyncLock();
  static mySendableUnionArray: string | number | boolean | bigint = getSendableUnionArray();

  constructor() {
  }
}

export default function sendableClassStaticTest() {
  describe('ActsSendableClassStaticTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0100
     * @tc.name       : testSendableStaticClass0001
     * @tc.desc       : Test SendableStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0001';
      try {
        expect(SendableStaticClass.myString).assertEqual('example string');
        SendableStaticClass.myString = 'new string';
        expect(SendableStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0200
     * @tc.name       : testSendableStaticClass0002
     * @tc.desc       : Test SendableStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0002';
      try {
        expect(SendableStaticClass.myNumber).assertEqual(42);
        SendableStaticClass.myNumber = 100;
        expect(SendableStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0300
     * @tc.name       : testSendableStaticClass0003
     * @tc.desc       : Test SendableStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0003';
      try {
        expect(SendableStaticClass.myBoolean).assertEqual(true);
        SendableStaticClass.myBoolean = false;
        expect(SendableStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0400
     * @tc.name       : testSendableStaticClass0004
     * @tc.desc       : Test SendableStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0004';
      try {
        expect(SendableStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0500
     * @tc.name       : testSendableStaticClass0005
     * @tc.desc       : Test SendableStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0005';
      try {
        expect(SendableStaticClass.myUndefined).assertEqual(undefined);
        SendableStaticClass.myUndefined = 123;
        expect(SendableStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0600
     * @tc.name       : testSendableStaticClass0006
     * @tc.desc       : Test SendableStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0006';
      try {
        expect(SendableStaticClass.myNull).assertEqual(null);
        SendableStaticClass.myNull = 'not null anymore';
        expect(SendableStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0700
     * @tc.name       : testSendableStaticClass0007
     * @tc.desc       : Test SendableStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0007';
      try {
        expect(SendableStaticClass.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(SendableStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableStaticClass.topLevelClassInstance.num = 2;
        expect(SendableStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0800
     * @tc.name       : testSendableStaticClass0008
     * @tc.desc       : Test SendableStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0008';
      try {
        expect(typeof SendableStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableStaticClass.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0900
     * @tc.name       : testSendableStaticClass0009
     * @tc.desc       : Test SendableStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0009';
      try {
        expect(typeof SendableStaticClass.myEnum).assertEqual('number');
        expect(SendableStaticClass.myEnum).assertEqual(0);
        SendableStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1000
     * @tc.name       : testSendableStaticClass0010
     * @tc.desc       : Test SendableStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0010';
      try {
        expect(typeof SendableStaticClass.myArray).assertEqual('object');
        expect(SendableStaticClass.myArray.toString()).assertEqual('');
        SendableStaticClass.myArray.push(4, 5);
        expect(SendableStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1100
     * @tc.name       : testSendableStaticClass0011
     * @tc.desc       : Test SendableStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0011';
      try {
        expect(typeof SendableStaticClass.myMap).assertEqual('object');
        expect(SendableStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableStaticClass.myMap.set(1, 2);
        expect(SendableStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1200
     * @tc.name       : testSendableStaticClass0012
     * @tc.desc       : Test SendableStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0012';
      try {
        expect(typeof SendableStaticClass.mySet).assertEqual('object');
        expect(SendableStaticClass.mySet.has(123)).assertEqual(false);
        SendableStaticClass.mySet.add(123);
        expect(SendableStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1300
     * @tc.name       : testSendableStaticClass0013
     * @tc.desc       : Test SendableStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0013';
      try {
        expect(typeof SendableStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1400
     * @tc.name       : testSendableStaticClass0014
     * @tc.desc       : Test SendableStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0014';
      try {
        expect(typeof SendableStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1500
     * @tc.name       : testSendableStaticClass0015
     * @tc.desc       : Test SendableStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0015';
      try {
        expect(typeof SendableStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1600
     * @tc.name       : testSendableStaticClass0016
     * @tc.desc       : Test SendableStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0016';
      try {
        expect(typeof SendableStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1700
     * @tc.name       : testSendableStaticClass0017
     * @tc.desc       : Test SendableStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0017';
      try {
        expect(typeof SendableStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1800
     * @tc.name       : testSendableStaticClass0018
     * @tc.desc       : Test SendableStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0018';
      try {
        expect(typeof SendableStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1900
     * @tc.name       : testSendableStaticClass0019
     * @tc.desc       : Test SendableStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0019';
      try {
        expect(typeof SendableStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2000
     * @tc.name       : testSendableStaticClass0020
     * @tc.desc       : Test SendableStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0020';
      try {
        expect(typeof SendableStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2100
     * @tc.name       : testSendableStaticClass0021
     * @tc.desc       : Test SendableStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0021';
      try {
        expect(typeof SendableStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2200
     * @tc.name       : testSendableStaticClass0022
     * @tc.desc       : Test SendableStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0022';
      try {
        expect(typeof SendableStaticClass.myConcatArray).assertEqual('object');
        expect(SendableStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2300
     * @tc.name       : testSendableStaticClass0023
     * @tc.desc       : Test SendableStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0023';
      try {
        expect(typeof SendableStaticClass.myBitVector).assertEqual('object');
        expect(SendableStaticClass.myBitVector.pop()).assertEqual(0);
        SendableStaticClass.myBitVector.push(1);
        expect(SendableStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2400
     * @tc.name       : testSendableStaticClass0024
     * @tc.desc       : Test SendableStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0024';
      try {
        expect(typeof SendableStaticClass.myASON).assertEqual('object');
        expect((SendableStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2500
     * @tc.name       : testSendableStaticClass0025
     * @tc.desc       : Test SendableStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0025';
      try {
        expect(typeof SendableStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2600
     * @tc.name       : testSendableStaticClass0026
     * @tc.desc       : Test SendableStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0026';
      try {
        expect(typeof SendableStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableStaticClass.mySendableUnionArray).assertEqual(1);
        SendableStaticClass.mySendableUnionArray = 2;
        expect(SendableStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2700
     * @tc.name       : testSendableFuncStaticClass0001
     * @tc.desc       : Test SendableFuncStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0001';
      try {
        expect(SendableFuncStaticClass.myString).assertEqual('example string');
        SendableFuncStaticClass.myString = 'new string';
        expect(SendableFuncStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2800
     * @tc.name       : testSendableFuncStaticClass0002
     * @tc.desc       : Test SendableFuncStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0002';
      try {
        expect(SendableFuncStaticClass.myNumber).assertEqual(42);
        SendableFuncStaticClass.myNumber = 100;
        expect(SendableFuncStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2900
     * @tc.name       : testSendableFuncStaticClass0003
     * @tc.desc       : Test SendableFuncStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0003';
      try {
        expect(SendableFuncStaticClass.myBoolean).assertEqual(true);
        SendableFuncStaticClass.myBoolean = false;
        expect(SendableFuncStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3000
     * @tc.name       : testSendableFuncStaticClass0004
     * @tc.desc       : Test SendableFuncStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0004';
      try {
        expect(SendableFuncStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableFuncStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableFuncStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3100
     * @tc.name       : testSendableFuncStaticClass0005
     * @tc.desc       : Test SendableFuncStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0005';
      try {
        expect(SendableFuncStaticClass.myUndefined).assertEqual(undefined);
        SendableFuncStaticClass.myUndefined = 123;
        expect(SendableFuncStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })