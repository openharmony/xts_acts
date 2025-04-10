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
import {
  ISendable,
  ModifiedTopLevelSendableFunction,
  SendableAsyncFuncSetClass,
  SendableConstEnum,
  SendableConstructorClass,
  SendableFuncSetClass,
  SendableGetFuncSetClass,
  SendableSetFuncSetClass,
  SendableStaticFuncSetClass,
  SendableStaticGetFuncSetClass,
  SendableStaticSetFuncSetClass,
  topLevelSendableClass,
  TopLevelSendableFunction
} from './SendableClassFuncSet';
import { ArkTSUtils, collections } from '@kit.ArkTS';

new SendableStaticFuncSetClass();

export default function sendableDefaultFuncSetClassTest() {
  describe('ActsSendableFuncSetClassTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableFuncSetClass0001
     * @tc.desc       : Test SendableFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0001';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnString('test string');
        expect(returnValue).assertEqual('test string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableFuncSetClass0002
     * @tc.desc       : Test SendableFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0002';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnNumber(42);
        expect(returnValue).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableFuncSetClass0003
     * @tc.desc       : Test SendableFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0003';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnBoolean(true);
        expect(returnValue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableFuncSetClass0004
     * @tc.desc       : Test SendableFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0004';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnBigInt(987654321098765432109876543210987654321n);
        expect(returnValue).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableFuncSetClass0005
     * @tc.desc       : Test SendableFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0005';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnUndefined(undefined);
        expect(returnValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableFuncSetClass0006
     * @tc.desc       : Test SendableFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0006';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnNull(null);
        expect(returnValue).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableFuncSetClass0007
     * @tc.desc       : Test SendableFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0007';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnTopLevelClassInstance(new topLevelSendableClass());
        expect(returnValue instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableFuncSetClass0008
     * @tc.desc       : Test SendableFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0008';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnTopLevelFunction(TopLevelSendableFunction);
        expect(returnValue).assertEqual(TopLevelSendableFunction);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableFuncSetClass0009
     * @tc.desc       : Test SendableFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0009';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        const returnValue = instance.returnEnum(SendableConstEnum.OPTION_1);
        expect(returnValue).assertEqual(SendableConstEnum.OPTION_1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableFuncSetClass0010
     * @tc.desc       : Test SendableFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0010';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        const returnValue = instance.returnArray(new collections.Array<number>());
        expect(returnValue instanceof collections.Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableFuncSetClass0011
     * @tc.desc       : Test SendableFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0011';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        const returnValue = instance.returnMap(new collections.Map<number, number>());
        expect(returnValue instanceof collections.Map).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableFuncSetClass0012
     * @tc.desc       : Test SendableFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0012';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        const returnValue = instance.returnSet(new collections.Set<number>());
        expect(returnValue instanceof collections.Set).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1300
     * @tc.name       : testSendableFuncSetClass0013
     * @tc.desc       : Test SendableFuncSetClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0013';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayInt8Array(new collections.Int8Array(6));
        expect(returnValue instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1400
     * @tc.name       : testSendableFuncSetClass0014
     * @tc.desc       : Test SendableFuncSetClass Uint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0014';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayUint8Array(new collections.Uint8Array(6));
        expect(returnValue instanceof collections.Uint8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1500
     * @tc.name       : testSendableFuncSetClass0015
     * @tc.desc       : Test SendableFuncSetClass Int16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0015';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayInt16Array(new collections.Int16Array(6));
        expect(returnValue instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1600
     * @tc.name       : testSendableFuncSetClass0016
     * @tc.desc       : Test SendableFuncSetClass Uint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0016';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayUint16Array(new collections.Uint16Array(6));
        expect(returnValue instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1700
     * @tc.name       : testSendableFuncSetClass0017
     * @tc.desc       : Test SendableFuncSetClass Int32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0017';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayInt32Array(new collections.Int32Array(6));
        expect(returnValue instanceof collections.Int32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1800
     * @tc.name       : testSendableFuncSetClass0018
     * @tc.desc       : Test SendableFuncSetClass Uint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0018';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayUint32Array(new collections.Uint32Array(6));
        expect(returnValue instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1900
     * @tc.name       : testSendableFuncSetClass0019
     * @tc.desc       : Test SendableFuncSetClass Uint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0019';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayUint8ClampedArray(new collections.Uint8ClampedArray(6));
        expect(returnValue instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2000
     * @tc.name       : testSendableFuncSetClass0020
     * @tc.desc       : Test SendableFuncSetClass Float32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0020';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayFloat32Array(new collections.Float32Array(6));
        expect(returnValue instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2100
     * @tc.name       : testSendableFuncSetClass0021
     * @tc.desc       : Test SendableFuncSetClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0021';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        const returnValue = instance.returnArrayBuffer(new collections.ArrayBuffer(10));
        expect(returnValue instanceof collections.ArrayBuffer).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2200
     * @tc.name       : testSendableFuncSetClass0022
     * @tc.desc       : Test SendableFuncSetClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0022';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        const returnValue = instance.returnConcatArray(new collections.Array<number>(1, 2, 4));
        expect(returnValue.toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2300
     * @tc.name       : testSendableFuncSetClass0023
     * @tc.desc       : Test SendableFuncSetClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0023';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        const returnValue = instance.returnBitVector(new collections.BitVector(2));
        expect(returnValue instanceof collections.BitVector).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2400
     * @tc.name       : testSendableFuncSetClass0024
     * @tc.desc       : Test SendableFuncSetClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0024';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue =
          instance.returnASON(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
        expect(typeof returnValue).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2500
     * @tc.name       : testSendableFuncSetClass0025
     * @tc.desc       : Test SendableFuncSetClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0025';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        const returnValue = instance.returnAsyncLock(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
        expect(returnValue instanceof ArkTSUtils.locks.AsyncLock).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2600
     * @tc.name       : testSendableFuncSetClass0026
     * @tc.desc       : Test SendableFuncSetClass SendableUnionArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0026';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnSendableUnionArray(1);
        expect(returnValue).assertEqual(instance.mySendableUnionArray);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableStaticFuncSetClass0001
     * @tc.desc       : Test SendableStaticFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0001';
      try {
        const returnValue = SendableStaticFuncSetClass.returnString('test string');
        expect(returnValue).assertEqual('test string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableStaticFuncSetClass0002
     * @tc.desc       : Test SendableStaticFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0002';
      try {
        const returnValue = SendableStaticFuncSetClass.returnNumber(42);
        expect(returnValue).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableStaticFuncSetClass0003
     * @tc.desc       : Test SendableStaticFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0003';
      try {
        const returnValue = SendableStaticFuncSetClass.returnBoolean(true);
        expect(returnValue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableStaticFuncSetClass0004
     * @tc.desc       : Test SendableStaticFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0004';
      try {
        const returnValue = SendableStaticFuncSetClass.returnBigInt(987654321098765432109876543210987654321n);
        expect(returnValue).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableStaticFuncSetClass0005
     * @tc.desc       : Test SendableStaticFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0005';
      try {
        const returnValue = SendableStaticFuncSetClass.returnUndefined(undefined);
        expect(returnValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableStaticFuncSetClass0006
     * @tc.desc       : Test SendableStaticFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0006';
      try {
        const returnValue = SendableStaticFuncSetClass.returnNull(null);
        expect(returnValue).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableStaticFuncSetClass0007
     * @tc.desc       : Test SendableStaticFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0007';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTopLevelClassInstance(new topLevelSendableClass());
        expect(returnValue instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableStaticFuncSetClass0008
     * @tc.desc       : Test SendableStaticFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0008';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTopLevelFunction(TopLevelSendableFunction);
        expect(returnValue).assertEqual(TopLevelSendableFunction);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableStaticFuncSetClass0009
     * @tc.desc       : Test SendableStaticFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0009';
      try {
        const returnValue = SendableStaticFuncSetClass.returnEnum(SendableConstEnum.OPTION_1);
        expect(returnValue).assertEqual(SendableConstEnum.OPTION_1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableStaticFuncSetClass0010
     * @tc.desc       : Test SendableStaticFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0010';
      try {
        const returnValue = SendableStaticFuncSetClass.returnArray(new collections.Array<number>());
        expect(returnValue instanceof collections.Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableStaticFuncSetClass0011
     * @tc.desc       : Test SendableStaticFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0011';
      try {
        const returnValue = SendableStaticFuncSetClass.returnMap(new collections.Map<number, number>());
        expect(returnValue instanceof collections.Map).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableStaticFuncSetClass0012
     * @tc.desc       : Test SendableStaticFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0012';
      try {
        const returnValue = SendableStaticFuncSetClass.returnSet(new collections.Set<number>());
        expect(returnValue instanceof collections.Set).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })