/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "../../../hypium/index";
import util from '@ohos.util'

export default function UtilTypesTest() {
  describe('UtilTypesTest', (): void => {
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_001
     * @tc.name: testIsPromise001
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isPromise(Promise.resolve(42));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_002
     * @tc.name: testIsPromise002
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isPromise(Promise.resolve(33));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_003
     * @tc.name: testIsPromise003
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsPromise003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isPromise(Promise.resolve(44));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_004
     * @tc.name: testIsPromise004
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsPromise004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let err = Error("33");
      let result = proc.isPromise(Promise.reject(err));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_005
     * @tc.name: testIsPromise005
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsPromise005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let err = Error("23");
      let result = proc.isPromise(Promise.reject(err));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_001
     * @tc.name: testIsRegExp001
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsRegExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp('abc'));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_002
     * @tc.name: testIsRegExp002
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsRegExp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp("/abc/"));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_003
     * @tc.name: testIsRegExp003
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsRegExp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp('fgd'));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_004
     * @tc.name: testIsRegExp004
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsRegExp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp('123'));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_005
     * @tc.name: testIsRegExp005
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsRegExp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp("/ab+c/", 'i'));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_001
     * @tc.name: testIsSet001
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isSet(new Set<int>());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_002
     * @tc.name: testIsSet002
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isSet(new Map<int, int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_003
     * @tc.name: testIsSet003
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isSet(new String());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_004
     * @tc.name: testIsSet004
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isSet(new Boolean());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_005
     * @tc.name: testIsSet005
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isSet(new WeakSet<int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_001
     * @tc.name: testIsTypedArray001
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsTypedArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isTypedArray(new Float64Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_002
     * @tc.name: testIsTypedArray002
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsTypedArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isTypedArray(new Uint8Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_003
     * @tc.name: testIsTypedArray003
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsTypedArray003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isTypedArray(new Uint16Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_004
     * @tc.name: testIsTypedArray004
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsTypedArray004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isTypedArray(new Uint32Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_005
     * @tc.name: testIsTypedArray005
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsTypedArray005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isTypedArray(new ArrayBuffer(96));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_001
     * @tc.name: testIsUint8Array001
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8Array(new Uint8Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_002
     * @tc.name: testIsUint8Array002
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8Array(new Uint16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_003
     * @tc.name: testIsUint8Array003
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8Array(new Uint32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_004
     * @tc.name: testIsUint8Array004
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_005
     * @tc.name: testIsUint8Array005
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8Array(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_001
     * @tc.name: testIsUint8ClampedArray001
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8ClampedArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Uint8ClampedArray());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_002
     * @tc.name: testIsUint8ClampedArray002
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8ClampedArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_003
     * @tc.name: testIsUint8ClampedArray003
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8ClampedArray003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_004
     * @tc.name: testIsUint8ClampedArray004
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8ClampedArray004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Int32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_005
     * @tc.name: testIsUint8ClampedArray005
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint8ClampedArray005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Uint32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_001
     * @tc.name: testIsUint16Array001
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint16Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint16Array(new Uint16Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_002
     * @tc.name: testIsUint16Array002
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint16Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint16Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_003
     * @tc.name: testIsUint16Array003
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint16Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint16Array(new Uint32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_004
     * @tc.name: testIsUint16Array004
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint16Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint16Array(new Uint8ClampedArray());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_005
     * @tc.name: testIsUint16Array005
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint16Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint16Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_001
     * @tc.name: testIsUint32Array001
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint32Array(new Uint32Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_002
     * @tc.name: testIsUint32Array002
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint32Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_003
     * @tc.name: testIsUint32Array003
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint32Array(new Uint16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_004
     * @tc.name: testIsUint32Array004
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint32Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_005
     * @tc.name: testIsUint32Array005
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsUint32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isUint32Array(new Uint8ClampedArray());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_001
     * @tc.name: testIsWeakMap001
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakMap(new WeakMap<int, int>());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_002
     * @tc.name: testIsWeakMap002
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakMap(new Map<int, int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_003
     * @tc.name: testIsWeakMap003
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakMap(new Set<int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_004
     * @tc.name: testIsWeakMap004
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakMap(new String());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_005
     * @tc.name: testIsWeakMap005
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakMap(new WeakSet<int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_001
     * @tc.name: testIsWeakSet001
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakSet(new WeakSet<int>());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_002
     * @tc.name: testIsWeakSet002
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakSet(new WeakMap<int, int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_003
     * @tc.name: testIsWeakSet003
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakSet(new String());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_004
     * @tc.name: testIsWeakSet004
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakSet(new Set<int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_005
     * @tc.name: testIsWeakSet005
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testIsWeakSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let proc = new util.types();
      let result = proc.isWeakSet(new Map<int, int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0001
     * @tc.name: testIsAnyArrayBuffer001
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsAnyArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(new ArrayBuffer(1));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0002
     * @tc.name: testIsAnyArrayBuffer002
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsAnyArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0003
     * @tc.name: testIsAnyArrayBuffer003
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsAnyArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0004
     * @tc.name: testIsAnyArrayBuffer004
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsAnyArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let buf = new ArrayBuffer(1);
      let result = proc.isAnyArrayBuffer(buf);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0005
     * @tc.name: testIsAnyArrayBuffer005
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsAnyArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(new Boolean(false));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0006
     * @tc.name: testIsArrayBufferView001
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_
     uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBufferView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int8Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0007
     * @tc.name: testIsArrayBufferView002
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_
     int32_ array or napi_ uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBufferView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int32Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0008
     * @tc.name: testIsArrayBufferView003
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_
     array or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or
     napi_ uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBufferView003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new DataView(new ArrayBuffer(16)));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0009
     * @tc.name: testIsArrayBufferView004
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_ array or naPi_ uint8_
     clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_ uint32_ array or
     napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBufferView004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBufferView(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0010
     * @tc.name: testIsArrayBufferView005
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_ array or naPi_ uint8_
     clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_ uint32_ array or
     napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBufferView005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int16Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0016
     * @tc.name: testIsArrayBuffer001
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new ArrayBuffer(0));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0017
     * @tc.name: testIsArrayBuffer002
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBuffer(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0018
     * @tc.name: testIsArrayBuffer003
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBuffer(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0019
     * @tc.name: testIsArrayBuffer004
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0020
     * @tc.name: testIsArrayBuffer005
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0025
     * @tc.name: testIsBigInt64Array001
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigInt64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new BigInt64Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0026
     * @tc.name: testIsBigInt64Array002
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigInt64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Int32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0027
     * @tc.name: testIsBigInt64Array003
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigInt64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0028
     * @tc.name: testIsBigInt64Array004
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigInt64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0029
     * @tc.name: testIsBigInt64Array005
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigInt64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0030
     * @tc.name: testIsBigUint64Array001
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigUint64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new BigUint64Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0031
     * @tc.name: testIsBigUint64Array002
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigUint64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0032
     * @tc.name: testIsBigUint64Array003
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigUint64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0033
     * @tc.name: testIsBigUint64Array004
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigUint64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0034
     * @tc.name: testIsBigUint64Array005
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigUint64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new BigInt64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0035
     * @tc.name: testIsBigUint64Array006
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsBigUint64Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0046
     * @tc.name: testIsDataView001
     * @tc.desc: Check whether the entered value is of DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDataView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      const ab = new ArrayBuffer(20);
      let result = proc.isDataView(new DataView(ab));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0047
     * @tc.name: testIsDataView002
     * @tc.desc: Check whether the entered value is of DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDataView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDataView(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0048
     * @tc.name: testIsDataView003
     * @tc.desc: Check whether the entered value is of DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDataView003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDataView(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0049
     * @tc.name: testIsDataView004
     * @tc.desc: Check whether the entered value is of DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDataView004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDataView(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0050
     * @tc.name: testIsDataView005
     * @tc.desc: Check whether the entered value is of DataView type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDataView005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDataView(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0051
     * @tc.name: testIsDate001
     * @tc.desc: Check whether the entered value is of type date.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDate(new Date());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0052
     * @tc.name: testIsDate002
     * @tc.desc: Check whether the entered value is of type date.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDate(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0053
     * @tc.name: testIsDate003
     * @tc.desc: Check whether the entered value is of type date.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDate(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0054
     * @tc.name: testIsDate004
     * @tc.desc: Check whether the entered value is of type date.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDate(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0055
     * @tc.name: testIsDate005
     * @tc.desc: Check whether the entered value is of type date.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsDate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isDate(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0061
     * @tc.name: testIsFloat32Array001
     * @tc.desc: Check whether the entered value is of float32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Float32Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0062
     * @tc.name: testIsFloat32Array002
     * @tc.desc: Check whether the entered value is of float32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0063
     * @tc.name: testIsFloat32Array003
     * @tc.desc: Check whether the entered value is of float32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0064
     * @tc.name: testIsFloat32Array004
     * @tc.desc: Check whether the entered value is of float32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0065
     * @tc.name: testIsFloat32Array005
     * @tc.desc: Check whether the entered value is of float32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0066
     * @tc.name: testIsFloat64Array001
     * @tc.desc: Check whether the entered value is of float64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Float64Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0067
     * @tc.name: testIsFloat64Array002
     * @tc.desc: Check whether the entered value is of float64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0068
     * @tc.name: testIsFloat64Array003
     * @tc.desc: Check whether the entered value is of float64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Float32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0069
     * @tc.name: testIsFloat64Array004
     * @tc.desc: Check whether the entered value is of float64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0070
     * @tc.name: testIsFloat64Array005
     * @tc.desc: Check whether the entered value is of float64array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsFloat64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0079
     * @tc.name: testIsInt8Array001
     * @tc.desc: Check whether the entered value is of int8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt8Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt8Array(new Int8Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0080
     * @tc.name: testIsInt8Array002
     * @tc.desc: Check whether the entered value is of int8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt8Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt8Array(new ArrayBuffer(0));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0081
     * @tc.name: testIsInt8Array003
     * @tc.desc: Check whether the entered value is of int8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt8Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt8Array(new Int32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0082
     * @tc.name: testIsInt8Array004
     * @tc.desc: Check whether the entered value is of int8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt8Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt8Array(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0083
     * @tc.name: testIsInt8Array005
     * @tc.desc: Check whether the entered value is of int8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt8Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt8Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0084
     * @tc.name: testIsInt16Array001
     * @tc.desc: Check whether the entered value is the int16array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt16Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int16Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0085
     * @tc.name: testIsInt16Array002
     * @tc.desc: Check whether the entered value is the int16array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt16Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0086
     * @tc.name: testIsInt16Array003
     * @tc.desc: Check whether the entered value is the int16array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt16Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0087
     * @tc.name: testIsInt16Array004
     * @tc.desc: Check whether the entered value is the int16array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt16Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt16Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0088
     * @tc.name: testIsInt16Array005
     * @tc.desc: Check whether the entered value is the int16array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt16Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt16Array(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0089
     * @tc.name: testIsInt32Array001
     * @tc.desc: Check whether the entered value is the int32array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int32Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0090
     * @tc.name: testIsInt32Array002
     * @tc.desc: Check whether the entered value is the int32array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0091
     * @tc.name: testIsInt32Array003
     * @tc.desc: Check whether the entered value is the int32array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0092
     * @tc.name: testIsInt32Array004
     * @tc.desc: Check whether the entered value is the int32array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt32Array(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0093
     * @tc.name: testIsInt32Array005
     * @tc.desc: Check whether the entered value is the int32array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsInt32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isInt32Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0094
     * @tc.name: testIsMap001
     * @tc.desc: Check whether the entered value is of map type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isMap(new Map<int, int>());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0095
     * @tc.name: testIsMap002
     * @tc.desc: Check whether the entered value is of map type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isMap(new Set<int>());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0096
     * @tc.name: testIsMap003
     * @tc.desc: Check whether the entered value is of map type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isMap(new String());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0097
     * @tc.name: testIsMap004
     * @tc.desc: Check whether the entered value is of map type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isMap(new Object());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0098
     * @tc.name: testIsMap005
     * @tc.desc: Check whether the entered value is of map type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isMap(new Boolean());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0099
     * @tc.name: testIsMapIterator001
     * @tc.desc: Check whether the entered value is the iterator type of map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMapIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      const map = new Map<int, int>();
      let result = proc.isMapIterator(map.keys());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0100
     * @tc.name: testIsMapIterator002
     * @tc.desc: Check whether the entered value is the iterator type of map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMapIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      const map = new Map<int, int>();
      let result = proc.isMapIterator(map.values());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0101
     * @tc.name: testIsMapIterator003
     * @tc.desc: Check whether the entered value is the iterator type of map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMapIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      const map = new Map<int, int>();
      let result = proc.isMapIterator(map.entries());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0102
     * @tc.name: testIsMapIterator004
     * @tc.desc: Check whether the entered value is the iterator type of map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMapIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      const map = new Map<int, int>();
      let result = proc.isMapIterator(map.$_iterator());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0103
     * @tc.name: testIsMapIterator005
     * @tc.desc: Check whether the entered value is the iterator type of map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsMapIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      const map = new Map<int, int>();
      let result = proc.isMapIterator(map);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0108
     * @tc.name: testIsNativeError001
     * @tc.desc: Check whether the value entered is of type error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNativeError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isNativeError(new TypeError());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0109
     * @tc.name: testIsNativeError002
     * @tc.desc: Check whether the value entered is of type error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNativeError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isNativeError(new Error());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0110
     * @tc.name: testIsNativeError003
     * @tc.desc: Check whether the value entered is of type error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNativeError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isNativeError(new RangeError());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0111
     * @tc.name: testIsNativeError004
     * @tc.desc: Check whether the value entered is of type error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNativeError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isNativeError(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TYPES_0112
     * @tc.name: testIsNativeError005
     * @tc.desc: Check whether the value entered is of type error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNativeError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let proc = new util.types();
      let result = proc.isNativeError(false);
      expect(result).assertEqual(false);
    })
  })
}
