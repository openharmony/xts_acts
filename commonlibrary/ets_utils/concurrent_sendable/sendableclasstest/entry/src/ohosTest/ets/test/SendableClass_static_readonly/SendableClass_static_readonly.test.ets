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
  ISendable,
  ModifiedTopLevelSendableFunction,
  SendableConstEnum,
  SendableArrowNewStaticReadonlyClass,
  SendableExpressionArrowOutStaticReadonlyClass,
  SendableNonFuncStaticReadonlyClass,
  SendableNonParameterFuncStaticReadonlyClass,
  SendableStaticReadonlyClass,
  SendableFuncType,
  topLevelSendableClass
} from './SendableClass_static_readonly';

new SendableNonParameterFuncStaticReadonlyClass();
new SendableNonFuncStaticReadonlyClass();
new SendableArrowNewStaticReadonlyClass();

@Sendable
export class SendableExpressionOutArrowStaticReadonlyClass implements ISendable {
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

export default function sendableClassStaticReadonlyTest() {
  describe('ActsSendableClassStaticReadonlyTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0100
     * @tc.name       : testSendableStaticReadonlyClass0001
     * @tc.desc       : Test SendableStaticReadonlyClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0001';
      try {
        expect(SendableStaticReadonlyClass.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0200
     * @tc.name       : testSendableStaticReadonlyClass0002
     * @tc.desc       : Test SendableStaticReadonlyClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0002';
      try {
        expect(SendableStaticReadonlyClass.myNumber).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0300
     * @tc.name       : testSendableStaticReadonlyClass0003
     * @tc.desc       : Test SendableStaticReadonlyClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0003';
      try {
        expect(SendableStaticReadonlyClass.myBoolean).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0400
     * @tc.name       : testSendableStaticReadonlyClass0004
     * @tc.desc       : Test SendableStaticReadonlyClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0004';
      try {
        expect(SendableStaticReadonlyClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0500
     * @tc.name       : testSendableStaticReadonlyClass0005
     * @tc.desc       : Test SendableStaticReadonlyClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0005';
      try {
        expect(SendableStaticReadonlyClass.myUndefined).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0600
     * @tc.name       : testSendableStaticReadonlyClass0006
     * @tc.desc       : Test SendableStaticReadonlyClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0006';
      try {
        expect(SendableStaticReadonlyClass.myNull).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0700
     * @tc.name       : testSendableStaticReadonlyClass0007
     * @tc.desc       : Test SendableStaticReadonlyClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0007';
      try {
        expect(SendableStaticReadonlyClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
        SendableStaticReadonlyClass.topLevelClassInstance.num = 2;
        expect(SendableStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0800
     * @tc.name       : testSendableStaticReadonlyClass0008
     * @tc.desc       : Test SendableStaticReadonlyClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0008';
      try {
        expect(typeof SendableStaticReadonlyClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableStaticReadonlyClass.topLevelFunction()).assertEqual('Top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0900
     * @tc.name       : testSendableStaticReadonlyClass0009
     * @tc.desc       : Test SendableStaticReadonlyClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0009';
      try {
        expect(typeof SendableStaticReadonlyClass.myEnum).assertEqual('number');
        expect(SendableStaticReadonlyClass.myEnum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1000
     * @tc.name       : testSendableStaticReadonlyClass0010
     * @tc.desc       : Test SendableStaticReadonlyClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0010';
      try {
        expect(typeof SendableStaticReadonlyClass.myArray).assertEqual('object');
        expect(SendableStaticReadonlyClass.myArray.toString()).assertEqual('');
        SendableStaticReadonlyClass.myArray.push(4, 5);
        expect(SendableStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1100
     * @tc.name       : testSendableStaticReadonlyClass0011
     * @tc.desc       : Test SendableStaticReadonlyClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0011';
      try {
        expect(typeof SendableStaticReadonlyClass.myMap).assertEqual('object');
        expect(SendableStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
        SendableStaticReadonlyClass.myMap.set(1, 2);
        expect(SendableStaticReadonlyClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1200
     * @tc.name       : testSendableStaticReadonlyClass0012
     * @tc.desc       : Test SendableStaticReadonlyClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0012';
      try {
        expect(typeof SendableStaticReadonlyClass.mySet).assertEqual('object');
        expect(SendableStaticReadonlyClass.mySet.has(123)).assertEqual(false);
        SendableStaticReadonlyClass.mySet.add(123);
        expect(SendableStaticReadonlyClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1300
     * @tc.name       : testSendableStaticReadonlyClass0013
     * @tc.desc       : Test SendableStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0013';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1400
     * @tc.name       : testSendableStaticReadonlyClass0014
     * @tc.desc       : Test SendableStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0014';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1500
     * @tc.name       : testSendableStaticReadonlyClass0015
     * @tc.desc       : Test SendableStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0015';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1600
     * @tc.name       : testSendableStaticReadonlyClass0016
     * @tc.desc       : Test SendableStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0016';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1700
     * @tc.name       : testSendableStaticReadonlyClass0017
     * @tc.desc       : Test SendableStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0017';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1800
     * @tc.name       : testSendableStaticReadonlyClass0018
     * @tc.desc       : Test SendableStaticReadonlyClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0018';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayUint32Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1900
     * @tc.name       : testSendableStaticReadonlyClass0019
     * @tc.desc       : Test SendableStaticReadonlyClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0019';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2000
     * @tc.name       : testSendableStaticReadonlyClass0020
     * @tc.desc       : Test SendableStaticReadonlyClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0020';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2100
     * @tc.name       : testSendableStaticReadonlyClass0021
     * @tc.desc       : Test SendableStaticReadonlyClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0021';
      try {
        expect(typeof SendableStaticReadonlyClass.myArrayBuffer).assertEqual('object');
        expect(SendableStaticReadonlyClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableStaticReadonlyClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2200
     * @tc.name       : testSendableStaticReadonlyClass0022
     * @tc.desc       : Test SendableStaticReadonlyClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0022';
      try {
        expect(typeof SendableStaticReadonlyClass.myConcatArray).assertEqual('object');
        expect(SendableStaticReadonlyClass.myConcatArray[1]).assertEqual(2);
        expect(SendableStaticReadonlyClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2300
     * @tc.name       : testSendableStaticReadonlyClass0023
     * @tc.desc       : Test SendableStaticReadonlyClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0023';
      try {
        expect(typeof SendableStaticReadonlyClass.myBitVector).assertEqual('object');
        expect(SendableStaticReadonlyClass.myBitVector.pop()).assertEqual(0);
        SendableStaticReadonlyClass.myBitVector.push(1);
        expect(SendableStaticReadonlyClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2400
     * @tc.name       : testSendableStaticReadonlyClass0024
     * @tc.desc       : Test SendableStaticReadonlyClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0024';
      try {
        expect(typeof SendableStaticReadonlyClass.myASON).assertEqual('object');
        expect((SendableStaticReadonlyClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableStaticReadonlyClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2500
     * @tc.name       : testSendableStaticReadonlyClass0025
     * @tc.desc       : Test SendableStaticReadonlyClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0025';
      try {
        expect(typeof SendableStaticReadonlyClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2600
     * @tc.name       : testSendableStaticReadonlyClass0026
     * @tc.desc       : Test SendableStaticReadonlyClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticReadonlyClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0026';
      try {
        expect(typeof SendableStaticReadonlyClass.mySendableUnionArray).assertEqual('number');
        expect(SendableStaticReadonlyClass.mySendableUnionArray).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2700
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0001
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0001';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myString).assertEqual('example string');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2800
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0002
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0002';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myNumber).assertEqual(42);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2900
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0003
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0003';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myBoolean).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3000
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0004
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0004';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myBigInt)
            .assertEqual(1234567890123456789012345678901234567890n);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3100
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0005
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0005';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myUndefined).assertEqual(undefined);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3200
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0006
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0006';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myNull).assertEqual(null);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3300
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0007
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0007';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.topLevelClassInstance instanceof
            topLevelSendableClass).assertEqual(true);
          expect(SendableNonParameterFuncStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
          SendableNonParameterFuncStaticReadonlyClass.topLevelClassInstance.num = 2;
          expect(SendableNonParameterFuncStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3400
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0008
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0008';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.topLevelFunction === 'function')
            .assertEqual(true);
          expect(SendableNonParameterFuncStaticReadonlyClass.topLevelFunction())
            .assertEqual('Top level sendable function');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3500
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0009
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0009';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myEnum).assertEqual('number');
          expect(SendableNonParameterFuncStaticReadonlyClass.myEnum).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3600
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0010
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0010';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myArray).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myArray.toString()).assertEqual('');
          SendableNonParameterFuncStaticReadonlyClass.myArray.push(4, 5);
          expect(SendableNonParameterFuncStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3700
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0011
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0011';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myMap).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
          SendableNonParameterFuncStaticReadonlyClass.myMap.set(1, 2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myMap.get(1)).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3800
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0012
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0012';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.mySet).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.mySet.has(123)).assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.mySet.add(123);
          expect(SendableNonParameterFuncStaticReadonlyClass.mySet.has(123)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3900
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0013
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0013';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt8Array).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt8Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt8Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4000
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0014
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0014';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4100
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0015
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0015';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt16Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt16Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt16Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4200
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0016
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0016';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint16Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint16Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint16Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4300
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0017
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0017';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt32Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt32Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4400
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0018
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0018';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint32Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint32Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint32Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4500
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0019
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0019';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4600
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0020
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0020';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayFloat32Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayFloat32Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayFloat32Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayFloat32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4700
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0021
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0021';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myArrayBuffer).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myArrayBuffer.byteLength).assertEqual(10);
          expect(SendableNonParameterFuncStaticReadonlyClass.myArrayBuffer.slice(0, 4).byteLength)
            .assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4800
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0022
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0022';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myConcatArray).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myConcatArray[1]).assertEqual(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myConcatArray.join('-')).assertEqual("1-2-4");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4900
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0023
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0023';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myBitVector).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myBitVector.pop()).assertEqual(0);
          SendableNonParameterFuncStaticReadonlyClass.myBitVector.push(1);
          expect(SendableNonParameterFuncStaticReadonlyClass.myBitVector.pop()).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5000
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0024
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0024';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myASON).assertEqual('object');
          expect((SendableNonParameterFuncStaticReadonlyClass.myASON as object)?.["name"]).assertEqual('John');
          expect(ArkTSUtils.isSendable(SendableNonParameterFuncStaticReadonlyClass.myASON)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5100
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0025
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0025';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myAsyncLock).assertEqual('object');
          expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5200
     * @tc.name       : testSendableNonParameterFuncStaticReadonlyClass0026
     * @tc.desc       : Test SendableNonParameterFuncStaticReadonlyClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0026';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.mySendableUnionArray).assertEqual('number');
          expect(SendableNonParameterFuncStaticReadonlyClass.mySendableUnionArray).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5300
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0001
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0001';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5400
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0002
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0002';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myNumber).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5500
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0003
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0003';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myBoolean).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5600
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0004
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0004';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myBigInt)
          .assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5700
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0005
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0005';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myUndefined).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5800
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0006
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0006';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myNull).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5900
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0007
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0007';
      try {
        expect(SendableNonFuncStaticReadonlyClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableNonFuncStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
        SendableNonFuncStaticReadonlyClass.topLevelClassInstance.num = 2;
        expect(SendableNonFuncStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6000
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0008
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0008';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableNonFuncStaticReadonlyClass.topLevelFunction()).assertEqual('Top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6100
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0009
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0009';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myEnum).assertEqual('number');
        expect(SendableNonFuncStaticReadonlyClass.myEnum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6200
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0010
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0010';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myArray).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myArray.toString()).assertEqual('');
        SendableNonFuncStaticReadonlyClass.myArray.push(4, 5);
        expect(SendableNonFuncStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6300
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0011
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0011';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myMap).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
        SendableNonFuncStaticReadonlyClass.myMap.set(1, 2);
        expect(SendableNonFuncStaticReadonlyClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6400
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0012
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0012';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.mySet).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.mySet.has(123)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.mySet.add(123);
        expect(SendableNonFuncStaticReadonlyClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6500
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0013
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0013';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6600
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0014
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0014';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6700
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0015
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0015';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6800
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0016
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0016';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6900
     * @tc.name       : testSendableNonFuncStaticReadonlyClass0017
     * @tc.desc       : Test SendableNonFuncStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticReadonlyClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0017';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })