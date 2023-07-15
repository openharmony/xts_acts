/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import util from "@ohos.util";
import url from "@ohos.url";
import app from "@system.app";
import process from "@ohos.process";
import request from "@ohos.request";

class Temperature {
  private readonly _temp: Temperature;

  constructor(value) {
    this._temp = value;
  }
  compareTo(value) {
    return this._temp >= value.getTemp();
  }
  getTemp() {
    return this._temp;
  }
  toString() {
    return this._temp.toString();
  }
}
let tempLower = new Temperature(30);
let tempUpper = new Temperature(40);
let tempLess = new Temperature(20);
let tempMiDF = new Temperature(35);
let tempMidS = new Temperature(39);
let tempMore = new Temperature(45);

let rangeHp = new util.ScopeHelper(tempLower, tempUpper);
let rangeHpFir = new util.ScopeHelper(tempMiDF, tempMidS);
let rangeHpSec = new util.ScopeHelper(tempLess, tempMore);
let rangeHpThi = new util.ScopeHelper(tempLess, tempMiDF);
let rangeHpFif = new util.ScopeHelper(tempMiDF, tempMore);

export default function UtilFunTest() {
  describe("UtilTest", function () {
    /**
     * @tc.number: TEST_IS_NUMBER_OBJECT_001
     * @tc.name  : testIsNumberObject001
     * @tc.desc  : Check whether the entered value is of the number object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNumberObject001", 0, function () {
      let proc = new util.types();
      let result = proc.isNumberObject(new Number(0));
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number: TEST_IS_NUMBER_OBJECT_002
     * @tc.name  : testIsNumberObject002
     * @tc.desc  : Check whether the entered value is of the number object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNumberObject002", 0, function () {
      let proc = new util.types();
      let result = proc.isNumberObject(new Number(10));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_NUMBER_OBJECT_003
     * @tc.name  : testIsNumberObject003
     * @tc.desc  : Check whether the entered value is of the number object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNumberObject003", 0, function () {
      let proc = new util.types();
      let result = proc.isNumberObject(new Number(200));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_NUMBER_OBJECT_004
     * @tc.name  : testIsNumberObject004
     * @tc.desc  : Check whether the entered value is of the number object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNumberObject004", 0, function () {
      let proc = new util.types();
      let result = proc.isNumberObject(0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_NUMBER_OBJECT_005
     * @tc.name  : testIsNumberObject005
     * @tc.desc  : Check whether the entered value is of the number object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNumberObject005", 0, function () {
      let proc = new util.types();
      let result = proc.isNumberObject(100);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_PROMISE_001
     * @tc.name  : testIsPromise001
     * @tc.desc  : Check whether the entered value is of promise type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsPromise001", 0, function () {
      let proc = new util.types();
      let result = proc.isPromise(Promise.resolve(42));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_PROMISE_002
     * @tc.name  : testIsPromise002
     * @tc.desc  : Check whether the entered value is of promise type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsPromise002", 0, function () {
      let proc = new util.types();
      let result = proc.isPromise(Promise.resolve(33));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_PROMISE_003
     * @tc.name  : testIsPromise003
     * @tc.desc  : Check whether the entered value is of promise type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsPromise003", 0, function () {
      let proc = new util.types();
      let result = proc.isPromise(Promise.resolve(44));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_PROMISE_004
     * @tc.name  : testIsPromise004
     * @tc.desc  : Check whether the entered value is of promise type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsPromise004", 0, function () {
      let proc = new util.types();
      let err = Error("33");
      let result = proc.isPromise(Promise.reject(err));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_PROMISE_005
     * @tc.name  : testIsPromise005
     * @tc.desc  : Check whether the entered value is of promise type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsPromise005", 0, function () {
      let proc = new util.types();
      let err = Error("23");
      let result = proc.isPromise(Promise.reject(err));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_PROXY_001
     * @tc.name  : testIsProxy001
     * @tc.desc  : Check whether the value entered is of proxy type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsProxy001", 0, function () {
      let proc = new util.types();
      const target = {};
      const proxy = new Proxy(target, {});
      let result = proc.isProxy(proxy);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_PROXY_002
     * @tc.name  : testIsProxy002
     * @tc.desc  : Check whether the value entered is of proxy type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsProxy002", 0, function () {
      let proc = new util.types();
      const target = {};
      let result = proc.isProxy(target);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_PROXY_003
     * @tc.name  : testIsProxy003
     * @tc.desc  : Check whether the value entered is of proxy type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsProxy003", 0, function () {
      let proc = new util.types();
      const handler = {
        get: function (obj, prop) {
          return prop in obj ? obj[prop] : 37;
        },
      };
      const p = new Proxy({}, handler);
      let result = proc.isProxy(p);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_PROXY_004
     * @tc.name  : testIsProxy004
     * @tc.desc  : Check whether the value entered is of proxy type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsProxy004", 0, function () {
      let proc = new util.types();
      const handler = {
        get: function (obj, prop) {
          return prop in obj ? obj[prop] : 121;
        },
      };
      const p = new Proxy({}, handler);
      let result = proc.isProxy(p);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_PROXY_005
     * @tc.name  : testIsProxy005
     * @tc.desc  : Check whether the value entered is of proxy type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsProxy005", 0, function () {
      let proc = new util.types();
      const handler = {
        get: function (obj, prop) {
          return prop in obj ? obj[prop] : 121;
        },
      };
      let result = proc.isProxy(handler);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_REG_EXP_001
     * @tc.name  : testIsRegExp001
     * @tc.desc  : Check whether the entered value is of type regexp.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsRegExp001", 0, function () {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp("abc"));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_REG_EXP_002
     * @tc.name  : testIsRegExp002
     * @tc.desc  : Check whether the entered value is of type regexp.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsRegExp002", 0, function () {
      let proc = new util.types();
      let result = proc.isRegExp(/abc/);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_REG_EXP_003
     * @tc.name  : testIsRegExp003
     * @tc.desc  : Check whether the entered value is of type regexp.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsRegExp003", 0, function () {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp("fgd"));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_REG_EXP_004
     * @tc.name  : testIsRegExp004
     * @tc.desc  : Check whether the entered value is of type regexp.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsRegExp004", 0, function () {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp("123"));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_REG_EXP_005
     * @tc.name  : testIsRegExp005
     * @tc.desc  : Check whether the entered value is of type regexp.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsRegExp005", 0, function () {
      let proc = new util.types();
      let result = proc.isRegExp(new RegExp(/ab+c/, "i"));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SET_001
     * @tc.name  : testIsSet001
     * @tc.desc  : Check whether the entered value is of type set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSet001", 0, function () {
      let proc = new util.types();
      let result = proc.isSet(new Set());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SET_002
     * @tc.name  : testIsSet002
     * @tc.desc  : Check whether the entered value is of type set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSet002", 0, function () {
      let proc = new util.types();
      let result = proc.isSet(new Map());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SET_003
     * @tc.name  : testIsSet003
     * @tc.desc  : Check whether the entered value is of type set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSet003", 0, function () {
      let proc = new util.types();
      let result = proc.isSet(new String());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SET_004
     * @tc.name  : testIsSet004
     * @tc.desc  : Check whether the entered value is of type set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSet004", 0, function () {
      let proc = new util.types();
      let result = proc.isSet(new Boolean());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SET_005
     * @tc.name  : testIsSet005
     * @tc.desc  : Check whether the entered value is of type set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSet005", 0, function () {
      let proc = new util.types();
      let result = proc.isSet(new WeakSet());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SET_ITERATOR_001
     * @tc.name  : testIsSetIterator001
     * @tc.desc  : Check whether the entered value is the iterator type of set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSetIterator001", 0, function () {
      let proc = new util.types();
      const set = new Set();
      let result = proc.isSetIterator(set.keys());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SET_ITERATOR_002
     * @tc.name  : testIsSetIterator002
     * @tc.desc  : Check whether the entered value is the iterator type of set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSetIterator002", 0, function () {
      let proc = new util.types();
      const set = new Set();
      let result = proc.isSetIterator(set.values());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SET_ITERATOR_003
     * @tc.name  : testIsSetIterator003
     * @tc.desc  : Check whether the entered value is the iterator type of set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSetIterator003", 0, function () {
      let proc = new util.types();
      const set = new Set();
      let result = proc.isSetIterator(set.entries());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SET_ITERATOR_004
     * @tc.name  : testIsSetIterator004
     * @tc.desc  : Check whether the entered value is the iterator type of set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSetIterator004", 0, function () {
      let proc = new util.types();
      const set = new Set();
      let result = proc.isSetIterator(set[Symbol.iterator]());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SET_ITERATOR_005
     * @tc.name  : testIsSetIterator005
     * @tc.desc  : Check whether the entered value is the iterator type of set.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSetIterator005", 0, function () {
      let proc = new util.types();
      const set = new Set();
      let result = proc.isSetIterator(set);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SHARED_ARRAY_BUFFER_001
     * @tc.name  : testIsSharedArrayBuffer001
     * @tc.desc  : Check whether the entered value is of type sharedarraybuffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSharedArrayBuffer001", 0, function () {
      let proc = new util.types();
      let result = proc.isSharedArrayBuffer(new SharedArrayBuffer(0));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SHARED_ARRAY_BUFFER_002
     * @tc.name  : testIsSharedArrayBuffer002
     * @tc.desc  : Check whether the entered value is of type sharedarraybuffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSharedArrayBuffer002", 0, function () {
      let proc = new util.types();
      let result = proc.isSharedArrayBuffer(new Int16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SHARED_ARRAY_BUFFER_003
     * @tc.name  : testIsSharedArrayBuffer003
     * @tc.desc  : Check whether the entered value is of type sharedarraybuffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSharedArrayBuffer003", 0, function () {
      let proc = new util.types();
      let result = proc.isSharedArrayBuffer(new Int32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SHARED_ARRAY_BUFFER_004
     * @tc.name  : testIsSharedArrayBuffer004
     * @tc.desc  : Check whether the entered value is of type sharedarraybuffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSharedArrayBuffer004", 0, function () {
      let proc = new util.types();
      let result = proc.isSharedArrayBuffer(new ArrayBuffer(1));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SHARED_ARRAY_BUFFER_005
     * @tc.name  : testIsSharedArrayBuffer005
     * @tc.desc  : Check whether the entered value is of type sharedarraybuffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSharedArrayBuffer005", 0, function () {
      let proc = new util.types();
      let result = proc.isSharedArrayBuffer(new Uint8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_STRING_OBJECT_001
     * @tc.name  : testIsStringObject001
     * @tc.desc  : Check whether the entered value is a string object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsStringObject001", 0, function () {
      let proc = new util.types();
      let result = proc.isStringObject(new String("foo"));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_STRING_OBJECT_002
     * @tc.name  : testIsStringObject002
     * @tc.desc  : Check whether the entered value is a string object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsStringObject002", 0, function () {
      let proc = new util.types();
      let result = proc.isStringObject(new String("twoo"));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_STRING_OBJECT_003
     * @tc.name  : testIsStringObject003
     * @tc.desc  : Check whether the entered value is a string object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsStringObject003", 0, function () {
      let proc = new util.types();
      let result = proc.isStringObject(new String("fdfsfd"));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_STRING_OBJECT_004
     * @tc.name  : testIsStringObject004
     * @tc.desc  : Check whether the entered value is a string object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsStringObject004", 0, function () {
      let proc = new util.types();
      let result = proc.isStringObject("ffds111");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_STRING_OBJECT_005
     * @tc.name  : testIsStringObject005
     * @tc.desc  : Check whether the entered value is a string object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsStringObject005", 0, function () {
      let proc = new util.types();
      let result = proc.isStringObject("foo");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SYMBOL_OBJECT_001
     * @tc.name  : testIsSymbolObject001
     * @tc.desc  : Check whether the entered value is a symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSymbolObject001", 0, function () {
      let proc = new util.types();
      const symbols = Symbol("foo");
      let result = proc.isSymbolObject(Object(symbols));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SYMBOL_OBJECT_002
     * @tc.name  : testIsSymbolObject002
     * @tc.desc  : Check whether the entered value is a symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSymbolObject002", 0, function () {
      let proc = new util.types();
      const symbols = Symbol("s12");
      let result = proc.isSymbolObject(Object(symbols));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SYMBOL_OBJECT_003
     * @tc.name  : testIsSymbolObject003
     * @tc.desc  : Check whether the entered value is a symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSymbolObject003", 0, function () {
      let proc = new util.types();
      const symbols = Symbol("sads");
      let result = proc.isSymbolObject(Object(symbols));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_SYMBOL_OBJECT_004
     * @tc.name  : testIsSymbolObject004
     * @tc.desc  : Check whether the entered value is a symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSymbolObject004", 0, function () {
      let proc = new util.types();
      const symbols = Symbol("asdd");
      let result = proc.isSymbolObject(symbols);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_SYMBOL_OBJECT_005
     * @tc.name  : testIsSymbolObject005
     * @tc.desc  : Check whether the entered value is a symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsSymbolObject005", 0, function () {
      let proc = new util.types();
      const symbols = Symbol("foo");
      let result = proc.isSymbolObject(symbols);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_TYPED_ARRAY_001
     * @tc.name  : testIsTypedArray001
     * @tc.desc  : Check whether the entered value is a type contained in typedarray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsTypedArray001", 0, function () {
      let proc = new util.types();
      let result = proc.isTypedArray(new Float64Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_TYPED_ARRAY_002
     * @tc.name  : testIsTypedArray002
     * @tc.desc  : Check whether the entered value is a type contained in typedarray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsTypedArray002", 0, function () {
      let proc = new util.types();
      let result = proc.isTypedArray(new Uint8Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_TYPED_ARRAY_003
     * @tc.name  : testIsTypedArray003
     * @tc.desc  : Check whether the entered value is a type contained in typedarray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsTypedArray003", 0, function () {
      let proc = new util.types();
      let result = proc.isTypedArray(new Uint16Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_TYPED_ARRAY_004
     * @tc.name  : testIsTypedArray004
     * @tc.desc  : Check whether the entered value is a type contained in typedarray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsTypedArray004", 0, function () {
      let proc = new util.types();
      let result = proc.isTypedArray(new Uint32Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_TYPED_ARRAY_005
     * @tc.name  : testIsTypedArray005
     * @tc.desc  : Check whether the entered value is a type contained in typedarray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsTypedArray005", 0, function () {
      let proc = new util.types();
      let result = proc.isTypedArray(new ArrayBuffer(0));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT8_ARRAY_001
     * @tc.name  : testIsUint8Array001
     * @tc.desc  : Check whether the entered value is the uint8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8Array(new Uint8Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_UINT8_ARRAY_002
     * @tc.name  : testIsUint8Array002
     * @tc.desc  : Check whether the entered value is the uint8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8Array(new Uint16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT8_ARRAY_003
     * @tc.name  : testIsUint8Array003
     * @tc.desc  : Check whether the entered value is the uint8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8Array(new Uint32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT8_ARRAY_004
     * @tc.name  : testIsUint8Array004
     * @tc.desc  : Check whether the entered value is the uint8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8Array(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT8_ARRAY_005
     * @tc.name  : testIsUint8Array005
     * @tc.desc  : Check whether the entered value is the uint8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8Array(new Int16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT8_CLAMPED_ARRAY_001
     * @tc.name  : testIsUint8ClampedArray001
     * @tc.desc  : Check whether the entered value is the uint8clampedarray array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8ClampedArray001", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Uint8ClampedArray([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_UINT8_CLAMPED_ARRAY_002
     * @tc.name  : testIsUint8ClampedArray002
     * @tc.desc  : Check whether the entered value is the uint8clampedarray array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8ClampedArray002", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT8_CLAMPED_ARRAY_003
     * @tc.name  : testIsUint8ClampedArray003
     * @tc.desc  : Check whether the entered value is the uint8clampedarray array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8ClampedArray003", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Int16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT8_CLAMPED_ARRAY_004
     * @tc.name  : testIsUint8ClampedArray004
     * @tc.desc  : Check whether the entered value is the uint8clampedarray array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8ClampedArray004", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Int32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT8_CLAMPED_ARRAY_005
     * @tc.name  : testIsUint8ClampedArray005
     * @tc.desc  : Check whether the entered value is the uint8clampedarray array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint8ClampedArray005", 0, function () {
      let proc = new util.types();
      let result = proc.isUint8ClampedArray(new Uint32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT16_ARRAY_001
     * @tc.name  : testIsUint16Array001
     * @tc.desc  : Check whether the entered value is the uint16array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint16Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isUint16Array(new Uint16Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_UINT16_ARRAY_002
     * @tc.name  : testIsUint16Array002
     * @tc.desc  : Check whether the entered value is the uint16array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint16Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isUint16Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT16_ARRAY_003
     * @tc.name  : testIsUint16Array003
     * @tc.desc  : Check whether the entered value is the uint16array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint16Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isUint16Array(new Uint32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT16_ARRAY_004
     * @tc.name  : testIsUint16Array004
     * @tc.desc  : Check whether the entered value is the uint16array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint16Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isUint16Array(new Uint8ClampedArray([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT16_ARRAY_005
     * @tc.name  : testIsUint16Array005
     * @tc.desc  : Check whether the entered value is the uint16array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint16Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isUint16Array(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT32_ARRAY_001
     * @tc.name  : testIsUint32Array001
     * @tc.desc  : Check whether the entered value is the uint32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint32Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isUint32Array(new Uint32Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_UINT32_ARRAY_002
     * @tc.name  : testIsUint32Array002
     * @tc.desc  : Check whether the entered value is the uint32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint32Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isUint32Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT32_ARRAY_003
     * @tc.name  : testIsUint32Array003
     * @tc.desc  : Check whether the entered value is the uint32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint32Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isUint32Array(new Uint16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT32_ARRAY_004
     * @tc.name  : testIsUint32Array004
     * @tc.desc  : Check whether the entered value is the uint32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint32Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isUint32Array(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_UINT32_ARRAY_005
     * @tc.name  : testIsUint32Array005
     * @tc.desc  : Check whether the entered value is the uint32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsUint32Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isUint32Array(new Uint8ClampedArray([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_WEAK_MAP_001
     * @tc.name  : testIsWeakMap001
     * @tc.desc  : Check whether the entered value is of type weakmap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakMap001", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakMap(new WeakMap());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_WEAK_MAP_002
     * @tc.name  : testIsWeakMap002
     * @tc.desc  : Check whether the entered value is of type weakmap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakMap002", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakMap(new Map());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_WEAK_MAP_003
     * @tc.name  : testIsWeakMap003
     * @tc.desc  : Check whether the entered value is of type weakmap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakMap003", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakMap(new Set());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_WEAK_MAP_004
     * @tc.name  : testIsWeakMap004
     * @tc.desc  : Check whether the entered value is of type weakmap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakMap004", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakMap(new String());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_WEAK_MAP_005
     * @tc.name  : testIsWeakMap005
     * @tc.desc  : Check whether the entered value is of type weakmap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakMap005", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakMap(new WeakSet());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_WEAK_SET_001
     * @tc.name  : testIsWeakSet001
     * @tc.desc  : Check whether the entered value is of type weakset.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakSet001", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakSet(new WeakSet());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_WEAK_SET_002
     * @tc.name  : testIsWeakSet002
     * @tc.desc  : Check whether the entered value is of type weakset.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakSet002", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakSet(new WeakMap());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_WEAK_SET_003
     * @tc.name  : testIsWeakSet003
     * @tc.desc  : Check whether the entered value is of type weakset.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakSet003", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakSet(new String());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_WEAK_SET_004
     * @tc.name  : testIsWeakSet004
     * @tc.desc  : Check whether the entered value is of type weakset.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakSet004", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakSet(new Set());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_WEAK_SET_005
     * @tc.name  : testIsWeakSet005
     * @tc.desc  : Check whether the entered value is of type weakset.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsWeakSet005", 0, function () {
      let proc = new util.types();
      let result = proc.isWeakSet(new Map());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_NATIVE_ERROR_001
     * @tc.name  : testIsNativeError001
     * @tc.desc  : Check whether the value entered is of type error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNativeError001", 0, function () {
      let proc = new util.types();
      let result = proc.isNativeError(new TypeError());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_NATIVE_ERROR_002
     * @tc.name  : testIsNativeError002
     * @tc.desc  : Check whether the value entered is of type error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNativeError002", 0, function () {
      let proc = new util.types();
      let result = proc.isNativeError(new Error());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_NATIVE_ERROR_003
     * @tc.name  : testIsNativeError003
     * @tc.desc  : Check whether the value entered is of type error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNativeError003", 0, function () {
      let proc = new util.types();
      let result = proc.isNativeError(new RangeError());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_NATIVE_ERROR_004
     * @tc.name  : testIsNativeError004
     * @tc.desc  : Check whether the value entered is of type error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNativeError004", 0, function () {
      let proc = new util.types();
      let result = proc.isNativeError(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_NATIVE_ERROR_005
     * @tc.name  : testIsNativeError005
     * @tc.desc  : Check whether the value entered is of type error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNativeError005", 0, function () {
      let proc = new util.types();
      let result = proc.isNativeError(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MODULE_NAMESPACE_OBJECT_001
     * @tc.name  : testIsModuleNamespaceObject001
     * @tc.desc  : Check whether the entered value is the module namespace object object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsModuleNamespaceObject001", 0, function () {
      let proc = new util.types();
      let result = proc.isModuleNamespaceObject(url);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MODULE_NAMESPACE_OBJECT_002
     * @tc.name  : testIsModuleNamespaceObject002
     * @tc.desc  : Check whether the entered value is the module namespace object object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsModuleNamespaceObject002", 0, function () {
      let proc = new util.types();
      let result = proc.isModuleNamespaceObject(request);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MODULE_NAMESPACE_OBJECT_003
     * @tc.name  : testIsModuleNamespaceObject003
     * @tc.desc  : Check whether the entered value is the module namespace object object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsModuleNamespaceObject003", 0, function () {
      let proc = new util.types();
      let result = proc.isModuleNamespaceObject(process);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MODULE_NAMESPACE_OBJECT_004
     * @tc.name  : testIsModuleNamespaceObject004
     * @tc.desc  : Check whether the entered value is the module namespace object object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsModuleNamespaceObject004", 0, function () {
      let proc = new util.types();
      let result = proc.isModuleNamespaceObject(app);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MAP_ITERATOR_001
     * @tc.name  : testIsMapIterator001
     * @tc.desc  : Check whether the entered value is the iterator type of map.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMapIterator001", 0, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map.keys());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_MAP_ITERATOR_002
     * @tc.name  : testIsMapIterator002
     * @tc.desc  : Check whether the entered value is the iterator type of map.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMapIterator002", 0, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map.values());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_MAP_ITERATOR_003
     * @tc.name  : testIsMapIterator003
     * @tc.desc  : Check whether the entered value is the iterator type of map.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMapIterator003", 0, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map.entries());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_MAP_ITERATOR_004
     * @tc.name  : testIsMapIterator004
     * @tc.desc  : Check whether the entered value is the iterator type of map.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMapIterator004", 0, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map[Symbol.iterator]());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_MAP_ITERATOR_005
     * @tc.name  : testIsMapIterator005
     * @tc.desc  : Check whether the entered value is the iterator type of map.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMapIterator005", 0, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MAP_001
     * @tc.name  : testIsMap001
     * @tc.desc  : Check whether the entered value is of map type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMap001", 0, function () {
      let proc = new util.types();
      let result = proc.isMap(new Map());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_MAP_002
     * @tc.name  : testIsMap002
     * @tc.desc  : Check whether the entered value is of map type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMap002", 0, function () {
      let proc = new util.types();
      let result = proc.isMap(new Set());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MAP_003
     * @tc.name  : testIsMap003
     * @tc.desc  : Check whether the entered value is of map type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMap003", 0, function () {
      let proc = new util.types();
      let result = proc.isMap(new String());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MAP_004
     * @tc.name  : testIsMap004
     * @tc.desc  : Check whether the entered value is of map type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMap004", 0, function () {
      let proc = new util.types();
      let result = proc.isMap(new Object());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_MAP_005
     * @tc.name  : testIsMap005
     * @tc.desc  : Check whether the entered value is of map type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsMap005", 0, function () {
      let proc = new util.types();
      let result = proc.isMap(new Boolean());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT32_ARRAY_001
     * @tc.name  : testIsInt32Array001
     * @tc.desc  : Check whether the entered value is the int32array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt32Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int32Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_INT32_ARRAY_002
     * @tc.name  : testIsInt32Array002
     * @tc.desc  : Check whether the entered value is the int32array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt32Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT32_ARRAY_003
     * @tc.name  : testIsInt32Array003
     * @tc.desc  : Check whether the entered value is the int32array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt32Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT32_ARRAY_004
     * @tc.name  : testIsInt32Array004
     * @tc.desc  : Check whether the entered value is the int32array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt32Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Float64Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT32_ARRAY_005
     * @tc.name  : testIsInt32Array005
     * @tc.desc  : Check whether the entered value is the int32array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt32Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT16_ARRAY_001
     * @tc.name  : testIsInt16Array001
     * @tc.desc  : Check whether the entered value is the int16array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt16Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int16Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_INT16_ARRAY_002
     * @tc.name  : testIsInt16Array002
     * @tc.desc  : Check whether the entered value is the int16array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt16Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT16_ARRAY_003
     * @tc.name  : testIsInt16Array003
     * @tc.desc  : Check whether the entered value is the int16array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt16Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT16_ARRAY_004
     * @tc.name  : testIsInt16Array004
     * @tc.desc  : Check whether the entered value is the int16array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt16Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT16_ARRAY_005
     * @tc.name  : testIsInt16Array005
     * @tc.desc  : Check whether the entered value is the int16array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt16Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Float64Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT8_ARRAY_001
     * @tc.name  : testIsInt8Array001
     * @tc.desc  : Check whether the entered value is of int8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt8Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new Int8Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_INT8_ARRAY_002
     * @tc.name  : testIsInt8Array002
     * @tc.desc  : Check whether the entered value is of int8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt8Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new ArrayBuffer(0));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT8_ARRAY_003
     * @tc.name  : testIsInt8Array003
     * @tc.desc  : Check whether the entered value is of int8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt8Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new Int32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT8_ARRAY_004
     * @tc.name  : testIsInt8Array004
     * @tc.desc  : Check whether the entered value is of int8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt8Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new Float64Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_INT8_ARRAY_005
     * @tc.name  : testIsInt8Array005
     * @tc.desc  : Check whether the entered value is of int8array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsInt8Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_GENERATOR_OBJECT_001
     * @tc.name  : testIsGeneratorObject001
     * @tc.desc  : Check whether the entered value is a generator object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsGeneratorObject001", 0, function () {
      let proc = new util.types();
      let result = proc.isGeneratorObject(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_GENERATOR_OBJECT_002
     * @tc.name  : testIsGeneratorObject002
     * @tc.desc  : Check whether the entered value is a generator object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsGeneratorObject002", 0, function () {
      let proc = new util.types();
      let result = proc.isGeneratorObject(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_GENERATOR_OBJECT_003
     * @tc.name  : testIsGeneratorObject003
     * @tc.desc  : Check whether the entered value is a generator object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsGeneratorObject003", 0, function () {
      let proc = new util.types();
      let result = proc.isGeneratorObject(new Int16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_GENERATOR_OBJECT_004
     * @tc.name  : testIsGeneratorObject004
     * @tc.desc  : Check whether the entered value is a generator object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsGeneratorObject004", 0, function () {
      let proc = new util.types();
      let result = proc.isGeneratorObject(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_GENERATOR_FUNCTION_001
     * @tc.name  : testIsGeneratorFunction001
     * @tc.desc  : Check whether the input value is a generator function type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsGeneratorFunction001", 0, function () {
      let proc = new util.types();
      let result = proc.isGeneratorFunction(new Int8Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_GENERATOR_FUNCTION_002
     * @tc.name  : testIsGeneratorFunction002
     * @tc.desc  : Check whether the input value is a generator function type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsGeneratorFunction002", 0, function () {
      let proc = new util.types();
      let result = proc.isGeneratorFunction(function foo() {});
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_GENERATOR_FUNCTION_003
     * @tc.name  : testIsGeneratorFunction003
     * @tc.desc  : Check whether the input value is a generator function type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsGeneratorFunction003", 0, function () {
      let proc = new util.types();
      let result = proc.isGeneratorFunction(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_GENERATOR_FUNCTION_004
     * @tc.name  : testIsGeneratorFunction004
     * @tc.desc  : Check whether the input value is a generator function type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsGeneratorFunction004", 0, function () {
      let proc = new util.types();
      let result = proc.isGeneratorFunction(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FLOAT64_ARRAY_001
     * @tc.name  : testIsFloat64Array001
     * @tc.desc  : Check whether the entered value is of float64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat64Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Float64Array());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_FLOAT64_ARRAY_002
     * @tc.name  : testIsFloat64Array002
     * @tc.desc  : Check whether the entered value is of float64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat64Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Int8Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FLOAT64_ARRAY_003
     * @tc.name  : testIsFloat64Array003
     * @tc.desc  : Check whether the entered value is of float64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat64Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Float32Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FLOAT64_ARRAY_004
     * @tc.name  : testIsFloat64Array004
     * @tc.desc  : Check whether the entered value is of float64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat64Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Uint8Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FLOAT64_ARRAY_005
     * @tc.name  : testIsFloat64Array005
     * @tc.desc  : Check whether the entered value is of float64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat64Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Int16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FLOAT32_ARRAY_001
     * @tc.name  : testIsFloat32Array001
     * @tc.desc  : Check whether the entered value is of float32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat32Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Float32Array());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_FLOAT32_ARRAY_002
     * @tc.name  : testIsFloat32Array002
     * @tc.desc  : Check whether the entered value is of float32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat32Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Int8Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FLOAT32_ARRAY_003
     * @tc.name  : testIsFloat32Array003
     * @tc.desc  : Check whether the entered value is of float32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat32Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Int16Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FLOAT32_ARRAY_004
     * @tc.name  : testIsFloat32Array004
     * @tc.desc  : Check whether the entered value is of float32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat32Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Float64Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FLOAT32_ARRAY_005
     * @tc.name  : testIsFloat32Array005
     * @tc.desc  : Check whether the entered value is of float32array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFloat32Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Uint8Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EXTERNAL_001
     * @tc.name  : testIsExternal001
     * @tc.desc  : Check whether the entered value is a native external value type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsExternal001", 0, function () {
      let proc = new util.types();
      let result = proc.isExternal(new Float32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EXTERNAL_002
     * @tc.name  : testIsExternal002
     * @tc.desc  : Check whether the entered value is a native external value type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsExternal002", 0, function () {
      let proc = new util.types();
      let result = proc.isExternal(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EXTERNAL_003
     * @tc.name  : testIsExternal003
     * @tc.desc  : Check whether the entered value is a native external value type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsExternal003", 0, function () {
      let proc = new util.types();
      let result = proc.isExternal(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EXTERNAL_004
     * @tc.name  : testIsExternal004
     * @tc.desc  : Check whether the entered value is a native external value type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsExternal004", 0, function () {
      let proc = new util.types();
      let result = proc.isExternal(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EXTERNAL_005
     * @tc.name  : testIsExternal005
     * @tc.desc  : Check whether the entered value is a native external value type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsExternal005", 0, function () {
      let proc = new util.types();
      let result = proc.isExternal(new Int16Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_DATE_001
     * @tc.name  : testIsDate001
     * @tc.desc  : Check whether the entered value is of type date.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDate001", 0, function () {
      let proc = new util.types();
      let result = proc.isDate(new Date());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_DATE_002
     * @tc.name  : testIsDate002
     * @tc.desc  : Check whether the entered value is of type date.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDate002", 0, function () {
      let proc = new util.types();
      let result = proc.isDate(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_DATE_003
     * @tc.name  : testIsDate003
     * @tc.desc  : Check whether the entered value is of type date.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDate003", 0, function () {
      let proc = new util.types();
      let result = proc.isDate(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_DATE_004
     * @tc.name  : testIsDate004
     * @tc.desc  : Check whether the entered value is of type date.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDate004", 0, function () {
      let proc = new util.types();
      let result = proc.isDate(new Int16Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_DATE_005
     * @tc.name  : testIsDate005
     * @tc.desc  : Check whether the entered value is of type date.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDate005", 0, function () {
      let proc = new util.types();
      let result = proc.isDate(new Float64Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_DATA_VIEW_001
     * @tc.name  : testIsDataView001
     * @tc.desc  : Check whether the entered value is of DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDataView001", 0, function () {
      let proc = new util.types();
      const ab = new ArrayBuffer(20);
      let result = proc.isDataView(new DataView(ab));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_DATA_VIEW_002
     * @tc.name  : testIsDataView002
     * @tc.desc  : Check whether the entered value is of DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDataView002", 0, function () {
      let proc = new util.types();
      let result = proc.isDataView(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_DATA_VIEW_003
     * @tc.name  : testIsDataView003
     * @tc.desc  : Check whether the entered value is of DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDataView003", 0, function () {
      let proc = new util.types();
      let result = proc.isDataView(new Float64Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_DATA_VIEW_004
     * @tc.name  : testIsDataView004
     * @tc.desc  : Check whether the entered value is of DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDataView004", 0, function () {
      let proc = new util.types();
      let result = proc.isDataView(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_DATA_VIEW_005
     * @tc.name  : testIsDataView005
     * @tc.desc  : Check whether the entered value is of DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsDataView005", 0, function () {
      let proc = new util.types();
      let result = proc.isDataView(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BOXED_PRIMITIVE_001
     * @tc.name  : testIsBoxedPrimitive001
     * @tc.desc  : Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBoxedPrimitive001", 0, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BOXED_PRIMITIVE_002
     * @tc.name  : testIsBoxedPrimitive002
     * @tc.desc  : Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBoxedPrimitive002", 0, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(new Boolean(false));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_BOXED_PRIMITIVE_003
     * @tc.name  : testIsBoxedPrimitive003
     * @tc.desc  : Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBoxedPrimitive003", 0, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(Symbol("foo"));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BOXED_PRIMITIVE_004
     * @tc.name  : testIsBoxedPrimitive004
     * @tc.desc  : Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBoxedPrimitive004", 0, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(Object(Symbol("foo")));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_BOXED_PRIMITIVE_005
     * @tc.name  : testIsBoxedPrimitive005
     * @tc.desc  : Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBoxedPrimitive005", 0, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(new Boolean(true));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_BOOLEAN_OBJECT_001
     * @tc.name  : testIsBooleanObject001
     * @tc.desc  : Check whether the entered value is a Boolean object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBooleanObject001", 0, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(new Boolean(false));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_BOOLEAN_OBJECT_002
     * @tc.name  : testIsBooleanObject002
     * @tc.desc  : Check whether the entered value is a Boolean object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBooleanObject002", 0, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(new Boolean(true));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_BOOLEAN_OBJECT_003
     * @tc.name  : testIsBooleanObject003
     * @tc.desc  : Check whether the entered value is a Boolean object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBooleanObject003", 0, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BOOLEAN_OBJECT_004
     * @tc.name  : testIsBooleanObject004
     * @tc.desc  : Check whether the entered value is a Boolean object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBooleanObject004", 0, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BOOLEAN_OBJECT_005
     * @tc.name  : testIsBooleanObject005
     * @tc.desc  : Check whether the entered value is a Boolean object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBooleanObject005", 0, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(Boolean(true));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BIG_UINT64_ARRAY_001
     * @tc.name  : testIsBigUint64Array001
     * @tc.desc  : Check whether the entered value is of biguint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigUint64Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new BigUint64Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_BIG_UINT64_ARRAY_002
     * @tc.name  : testIsBigUint64Array002
     * @tc.desc  : Check whether the entered value is of biguint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigUint64Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BIG_UINT64_ARRAY_003
     * @tc.name  : testIsBigUint64Array003
     * @tc.desc  : Check whether the entered value is of biguint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigUint64Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Float64Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BIG_UINT64_ARRAY_004
     * @tc.name  : testIsBigUint64Array004
     * @tc.desc  : Check whether the entered value is of biguint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigUint64Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BIG_UINT64_ARRAY_005
     * @tc.name  : testIsBigUint64Array005
     * @tc.desc  : Check whether the entered value is of biguint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigUint64Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new BigInt64Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BIG_INT64_ARRAY_001
     * @tc.name  : testIsBigInt64Array001
     * @tc.desc  : Check whether the entered value is of bigint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigInt64Array001", 0, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new BigInt64Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_BIG_INT64_ARRAY_002
     * @tc.name  : testIsBigInt64Array002
     * @tc.desc  : Check whether the entered value is of bigint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigInt64Array002", 0, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Int32Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BIG_INT64_ARRAY_003
     * @tc.name  : testIsBigInt64Array003
     * @tc.desc  : Check whether the entered value is of bigint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigInt64Array003", 0, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BIG_INT64_ARRAY_004
     * @tc.name  : testIsBigInt64Array004
     * @tc.desc  : Check whether the entered value is of bigint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigInt64Array004", 0, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Float64Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_BIG_INT64_ARRAY_005
     * @tc.name  : testIsBigInt64Array005
     * @tc.desc  : Check whether the entered value is of bigint64array array type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsBigInt64Array005", 0, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ASYNC_FUNCTION_001
     * @tc.name  : testIsAsyncFunction001
     * @tc.desc  : Check whether the value entered is an asynchronous function type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAsyncFunction001", 0, function () {
      let proc = new util.types();
      let result = proc.isAsyncFunction(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ASYNC_FUNCTION_002
     * @tc.name  : testIsAsyncFunction002
     * @tc.desc  : Check whether the value entered is an asynchronous function type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAsyncFunction002", 0, function () {
      let proc = new util.types();
      let result = proc.isAsyncFunction(function foo() {});
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ASYNC_FUNCTION_003
     * @tc.name  : testIsAsyncFunction003
     * @tc.desc  : Check whether the value entered is an asynchronous function type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAsyncFunction003", 0, function () {
      let proc = new util.types();
      let result = proc.isAsyncFunction(new Int8Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ASYNC_FUNCTION_004
     * @tc.name  : testIsAsyncFunction004
     * @tc.desc  : Check whether the value entered is an asynchronous function type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAsyncFunction004", 0, function () {
      let proc = new util.types();
      let result = proc.isAsyncFunction(async function foo() {});
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_001
     * @tc.name  : testIsArrayBuffer001
     * @tc.desc  : Check whether the entered value is of arraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBuffer001", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new ArrayBuffer(0));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_002
     * @tc.name  : testIsArrayBuffer002
     * @tc.desc  : Check whether the entered value is of arraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBuffer002", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_003
     * @tc.name  : testIsArrayBuffer003
     * @tc.desc  : Check whether the entered value is of arraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBuffer003", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_004
     * @tc.name  : testIsArrayBuffer004
     * @tc.desc  : Check whether the entered value is of arraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBuffer004", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new Int8Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_005
     * @tc.name  : testIsArrayBuffer005
     * @tc.desc  : Check whether the entered value is of arraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBuffer005", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new Int16Array());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARGUMENTS_OBJECT_001
     * @tc.name  : testIsArgumentsObject001
     * @tc.desc  : Check whether the entered value is an arguments object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArgumentsObject001", 0, function () {
      let proc = new util.types();
      function foo() {
        let result = proc.isArgumentsObject(arguments);
        expect(result).assertEqual(true);
      }
      let f = foo();
    });

    /**
     * @tc.number: TEST_IS_ARGUMENTS_OBJECT_002
     * @tc.name  : testIsArgumentsObject002
     * @tc.desc  : Check whether the entered value is an arguments object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArgumentsObject002", 0, function () {
      let proc = new util.types();
      let result = proc.isArgumentsObject(new Int8Array([]));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARGUMENTS_OBJECT_003
     * @tc.name  : testIsArgumentsObject003
     * @tc.desc  : Check whether the entered value is an arguments object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArgumentsObject003", 0, function () {
      let proc = new util.types();
      let result = proc.isArgumentsObject(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARGUMENTS_OBJECT_004
     * @tc.name  : testIsArgumentsObject004
     * @tc.desc  : Check whether the entered value is an arguments object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArgumentsObject004", 0, function () {
      let proc = new util.types();
      let result = proc.isArgumentsObject(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARGUMENTS_OBJECT_005
     * @tc.name  : testIsArgumentsObject005
     * @tc.desc  : Check whether the entered value is an arguments object type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArgumentsObject005", 0, function () {
      let proc = new util.types();
      let result = proc.isArgumentsObject(new Boolean());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_VIEW_001
     * @tc.name  : testIsArrayBufferView001
     * @tc.desc  : Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_
     uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBufferView001", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int8Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_VIEW_002
     * @tc.name  : testIsArrayBufferView002
     * @tc.desc  : Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_
     uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBufferView002", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int32Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_VIEW_003
     * @tc.name  : testIsArrayBufferView003
     * @tc.desc  : Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_
     uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBufferView003", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new DataView(new ArrayBuffer(16)));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_VIEW_004
     * @tc.name  : testIsArrayBufferView004
     * @tc.desc  : Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_
     uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBufferView004", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ARRAY_BUFFER_VIEW_005
     * @tc.name  : testIsArrayBufferView005
     * @tc.desc  : Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_
     uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsArrayBufferView005", 0, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int16Array([]));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ANY_ARRAY_BUFFER_001
     * @tc.name  : testIsAnyArrayBuffer001
     * @tc.desc  : Check whether the entered value is of anyarraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAnyArrayBuffer001", 0, function () {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(new ArrayBuffer(0));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ANY_ARRAY_BUFFER_002
     * @tc.name  : testIsAnyArrayBuffer002
     * @tc.desc  : Check whether the entered value is of anyarraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAnyArrayBuffer002", 0, function () {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ANY_ARRAY_BUFFER_003
     * @tc.name  : testIsAnyArrayBuffer003
     * @tc.desc  : Check whether the entered value is of anyarraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAnyArrayBuffer003", 0, function () {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ANY_ARRAY_BUFFER_004
     * @tc.name  : testIsAnyArrayBuffer004
     * @tc.desc  : Check whether the entered value is of anyarraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAnyArrayBuffer004", 0, function () {
      let proc = new util.types();
      let buf = new ArrayBuffer(10);
      let result = proc.isAnyArrayBuffer(buf);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ANY_ARRAY_BUFFER_005
     * @tc.name  : testIsAnyArrayBuffer005
     * @tc.desc  : Check whether the entered value is of anyarraybuffer type.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsAnyArrayBuffer005", 0, function () {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(new Boolean(false));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_UTIL_FORMAT_001
     * @tc.name  : testUtilFormat001
     * @tc.desc  : Returns the formatted string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilFormat001", 0, function () {
      let format = "%i,%s";
      let value1 = 1.5;
      let value2 = "qwer";
      let value3 = 15;
      let result = util.format(format, value1, value2, value3);
      expect(result).assertEqual("1,qwer 15");
    });

    /**
     * @tc.number: TEST_UTIL_FORMAT_002
     * @tc.name  : testUtilFormat002
     * @tc.desc  : Returns the formatted string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilFormat002", 0, function () {
      let format = "%O";
      let value = { name: "jack", age: 15 };
      let result = util.format(format, value);
      expect(result).assertEqual("{ name: 'jack',\n  age: 15 }");
    });

    /**
     * @tc.number: TEST_UTIL_FORMAT_003
     * @tc.name  : testUtilFormat003
     * @tc.desc  : Returns the formatted string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilFormat003", 0, function () {
      let format = "%o";
      let value = [1, 2, 3];
      let result = util.format(format, value);
      expect(result).assertEqual("[ 1, 2, 3, [length]: 3 ]");
    });

    /**
     * @tc.number: TEST_UTIL_FORMAT_004
     * @tc.name  : testUtilFormat004
     * @tc.desc  : Returns the formatted string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilFormat004", 0, function () {
      let format = "%s,%s,%s";
      let value1 = "1.5";
      let value2 = "qwer";
      let result = util.format(format, value1, value2);
      expect(result).assertEqual("1.5,qwer,%s");
    });

    /**
     * @tc.number: TEST_UTIL_FORMAT_005
     * @tc.name  : testUtilFormat005
     * @tc.desc  : Returns the formatted string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilFormat005", 0, function () {
      let format = "%d,%d";
      let value1 = 6;
      let value2 = 16;
      let result = util.format(format, value1, value2);
      expect(result).assertEqual("6,16");
    });

    /**
     * @tc.number: TEST_UTIL_ERR_NO_TO_STRING_001
     * @tc.name  : testUtilErrNoToString001
     * @tc.desc  : Get the string name of the system errno.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilErrNoToString001", 0, async function () {
      let errnum = 10;
      let result = util.errnoToString(errnum);
      expect(result).assertEqual("Unknown system error 10");
    });

    /**
     * @tc.number: TEST_UTIL_ERR_NO_TO_STRING_002
     * @tc.name  : testUtilErrNoToString002
     * @tc.desc  : Get the string name of the system errno.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilErrNoToString002", 0, async function () {
      let errnum = 0;
      let result = util.errnoToString(errnum);
      expect(result).assertEqual("Unknown system error 0");
    });

    /**
     * @tc.number: TEST_UTIL_ERR_NO_TO_STRING_003
     * @tc.name  : testUtilErrNoToString003
     * @tc.desc  : Get the string name of the system errno.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilErrNoToString003", 0, async function () {
      let errnum = -1;
      let result = util.errnoToString(errnum);
      expect(result).assertEqual("operation not permitted");
    });

    /**
     * @tc.number: TEST_UTIL_ERR_NO_TO_STRING_004
     * @tc.name  : testUtilErrNoToString004
     * @tc.desc  : Get the string name of the system errno.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilErrNoToString004", 0, async function () {
      let errnum = 9;
      let result = util.errnoToString(errnum);
      expect(result).assertEqual("Unknown system error 9");
    });

    /**
     * @tc.number: TEST_UTIL_ERR_NO_TO_STRING_005
     * @tc.name  : testUtilErrNoToString005
     * @tc.desc  : Get the string name of the system errno.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilErrNoToString005", 0, async function () {
      let errnum = 555;
      let result = util.errnoToString(errnum);
      expect(result).assertEqual("Unknown system error 555");
    });

    /**
     * @tc.number: TEST_UTIL_CALLBACK_WRAPPER_001
     * @tc.name  : testUtilCallbackWrapper001
     * @tc.desc  : Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilCallbackWrapper001", 0, async function () {
      async function promiseFn() {
        return Promise.resolve("value");
      }
      let cb = util.callbackWrapper(promiseFn);
      cb(1, (err, ret) => {
        expect(err).assertEqual(null);
        expect(ret).assertEqual("value");
      });
    });

    /**
     * @tc.number: TEST_UTIL_CALLBACK_WRAPPER_002
     * @tc.name  : testUtilCallbackWrapper002
     * @tc.desc  : Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilCallbackWrapper002", 0, async function () {
      async function promiseFn() {
        return 42;
      }
      let cb = util.callbackWrapper(promiseFn);
      cb(1, (err, ret) => {
        expect(err).assertEqual(null);
        expect(ret).assertEqual(42);
      });
    });

    /**
     * @tc.number: TEST_UTIL_CALLBACK_WRAPPER_003
     * @tc.name  : testUtilCallbackWrapper003
     * @tc.desc  : Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilCallbackWrapper003", 0, async function () {
      async function promiseFn() {
        let err = Error("value");
        return Promise.reject(err);
      }
      let cb = util.callbackWrapper(promiseFn);
      cb(1, (err, ret) => {
        expect(err.message === "value").assertTrue();
        expect(ret).assertEqual(undefined);
      });
    });

    /**
     * @tc.number: TEST_UTIL_CALLBACK_WRAPPER_004
     * @tc.name  : testUtilCallbackWrapper004
     * @tc.desc  : Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilCallbackWrapper004", 0, async function () {
      async function promiseFn(args) {
        const [a, b] = args;
        return a + b;
      }
      let cb = util.callbackWrapper(promiseFn);
      cb([1, 2], (err, ret) => {
        expect(err).assertEqual(null);
        expect(ret).assertEqual(3);
      });
    });

    /**
     * @tc.number: TEST_UTIL_CALLBACK_WRAPPER_005
     * @tc.name  : testUtilCallbackWrapper005
     * @tc.desc  : Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilCallbackWrapper005", 0, async function () {
      async function promiseFn() {
        return null;
      }
      let cb = util.callbackWrapper(promiseFn);
      try {
        cb(1, [1, 2]);
        expect(0).assertEqual(1);
      } catch (err) {
        expect(err.message).assertEqual("maybe is not function");
      }
    });

    /**
     * @tc.number: TEST_UTIL_PROMISIFY_001
     * @tc.name  : testUtilPromisify001
     * @tc.desc  : Takes a function following the common error-first callback style,
     taking an callback as the last argument, and return a function that returns promises.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilPromisify001", 0, async function () {
      function fn(val, callback) {
        if (typeof val === "string") {
          callback(null, val);
        } else {
          callback("type err");
        }
      }
      let value = util.promisify(fn);
      const result = await value("Hello");
      expect(result[0] == "Hello").assertTrue();
    });

    /**
     * @tc.number: TEST_UTIL_PROMISIFY_002
     * @tc.name  : testUtilPromisify002
     * @tc.desc  : Takes a function following the common error-first callback style,
     taking an callback as the last argument, and return a function that returns promises.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilPromisify002", 0, async function () {
      function fn(str, callback) {
        if (typeof str === "string") {
          callback(null, str);
        } else {
          callback(null, "type err");
        }
      }
      let value = util.promisify(fn);
      const result = await value(123);
      expect(result[0] == "type err").assertTrue();
    });

    /**
     * @tc.number: TEST_UTIL_PROMISIFY_003
     * @tc.name  : testUtilPromisify003
     * @tc.desc  : Takes a function following the common error-first callback style,
     taking an callback as the last argument, and return a function that returns promises.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilPromisify003", 0, async function () {
      function fn(val, callback) {
        callback(null, val);
      }
      let value = util.promisify(fn);
      const result = await value(42);
      expect(result[0] == 42).assertTrue();
    });

    /**
     * @tc.number: TEST_UTIL_PROMISIFY_004
     * @tc.name  : testUtilPromisify004
     * @tc.desc  : Takes a function following the common error-first callback style,
     taking an callback as the last argument, and return a function that returns promises.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilPromisify004", 0, async function () {
      function fn(val, callback) {
        if (typeof val === "boolean") {
          callback(null, val);
        } else {
          callback("type err");
        }
      }
      let value = util.promisify(fn);
      const result = await value(false);
      expect(result[0] == false).assertTrue();
    });

    /**
     * @tc.number: TEST_UTIL_PROMISIFY_005
     * @tc.name  : testUtilPromisify005
     * @tc.desc  : Takes a function following the common error-first callback style,
     taking an callback as the last argument, and return a function that returns promises.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilPromisify005", 0, async function () {
      function fn(val, callback) {
        if (typeof val === "number") {
          callback(null, val);
        } else {
          callback("type err");
        }
      }
      let value = util.promisify(fn);
      const result = await value(100);
      expect(result[0] == 100).assertTrue();
    });

    /**
     * @tc.number: TEST_UTIL_GENERATE_RANDOM_UUID_001
     * @tc.name  : testUtilGenerateRandomUUID001
     * @tc.desc  : Generate a random RFC 4122 version 4 UUID.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilGenerateRandomUUID001", 0, async function () {
      let result = util.generateRandomUUID(true);
      expect(result.length).assertEqual(36);
    });

    /**
     * @tc.number: TEST_UTIL_GENERATE_RANDOM_UUID_002
     * @tc.name  : testUtilGenerateRandomUUID002
     * @tc.desc  : Generate a random RFC 4122 version 4 UUID.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilGenerateRandomUUID002", 0, async function () {
      let result = util.generateRandomUUID(false);
      expect(result.length).assertEqual(36);
    });

    /**
     * @tc.number: TEST_UTIL_GENERATE_RANDOM_BINARY_UUID_001
     * @tc.name  : testUtilGenerateRandomBinaryUUID001
     * @tc.desc  : Generate a random RFC 4122 version 4 UUID.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilGenerateRandomBinaryUUID001", 0, async function () {
      let result = util.generateRandomBinaryUUID(true);
      expect(result.length).assertEqual(16);
    });

    /**
     * @tc.number: TEST_UTIL_GENERATE_RANDOM_BINARY_UUID_002
     * @tc.name  : testUtilGenerateRandomBinaryUUID002
     * @tc.desc  : Generate a random RFC 4122 version 4 UUID.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilgenerateRandomBinaryUUID002", 0, async function () {
      let result = util.generateRandomBinaryUUID(false);
      expect(result.length).assertEqual(16);
    });

    /**
     * @tc.number: TEST_UTIL_PARSE_UUID_001
     * @tc.name  : testUtilParseUUID001
     * @tc.desc  : Generate a random RFC 4122 version 4 UUID.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilParseUUID001", 0, async function () {
      let result = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
      expect(result.length).assertEqual(16);
    });

    /**
     * @tc.number: TEST_UTIL_PARSE_UUID_002
     * @tc.name  : testUtilParseUUID002
     * @tc.desc  : Generate a random RFC 4122 version 4 UUID.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilParseUUID002", 0, async function () {
      try {
        let result = util.parseUUID("84df796-66cc-4655-9b89-d6218d100f9c");
        expect(0).assertEqual(1);
      } catch (e) {
        expect(e.message).assertEqual("Syntax Error.Invalid 84df796-66cc-4655-9b89-d6218d100f9c string");
      }
    });

    /**
     * @tc.number: TEST_UTIL_PARSE_UUID_003
     * @tc.name  : testUtilParseUUID003
     * @tc.desc  : Generate a random RFC 4122 version 4 UUID.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUtilParseUUID003", 0, async function () {
      try {
        let result = util.parseUUID("84Wdf796-66cc-4655-9b89-d6218d100f9c");
        expect(0).assertEqual(1);
      } catch (e) {
        expect(e.message).assertEqual("Syntax Error.Invalid 84Wdf796-66cc-4655-9b89-d6218d100f9c string");
      }
    });

    /**
     * @tc.number: TEST_ENCODING_TEXT_DECODER_001
     * @tc.name  : testEncodingTextDecoder001
     * @tc.desc  : The source encoding's name, lowercased.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodingTextDecoder001", 0, function () {
      let that = util.TextDecoder.create("utf-8", { ignoreBOM: true });
      let retStr = that.encoding;
      expect(retStr).assertEqual("utf-8");
    });

    /**
     * @tc.number: TEST_FATAL_001
     * @tc.name  : testFatal001
     * @tc.desc  : Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testFatal001", 0, function () {
      let that = util.TextDecoder.create("utf-16be", { fatal: true });
      let fatalStr = that.fatal;
      expect(fatalStr).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IGNORE_BOM_001
     * @tc.name  : testIgnoreBom001
     * @tc.desc  : Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIgnoreBOM001", 0, function () {
      let that = util.TextDecoder.create("utf-16be", { ignoreBOM: true });
      let ignoreBOMStr = that.ignoreBOM;
      expect(ignoreBOMStr).assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Check if the constructor of TextDecoder has been called.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      let that = new util.TextDecoder();
      expect(that != null).assertTrue();
    });

    /**
     * @tc.number: TEST_TEXT_DECODER_CREATE_001
     * @tc.name  : testTextDecoderCreate001
     * @tc.desc  : The source encoding's name, lowercased.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testTextDecoderCreate001", 0, function () {
      let that = util.TextDecoder.create("utf-8", { ignoreBOM: true });
      let retStr = that.encoding;
      expect(retStr).assertEqual("utf-8");
    });

    /**
     * @tc.number: TEST_TEXT_DECODER_CREATE_002
     * @tc.name  : testTextDecoderCreate002
     * @tc.desc  : The source encoding's name, lowercased.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testTextDecoderCreate002", 0, function () {
      let that = util.TextDecoder.create("utf-16le");
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual("utf-16le");
    });

    /**
     * @tc.number: TEST_TEXT_DECODER_CREATE_003
     * @tc.name  : testTextDecoderCreate003
     * @tc.desc  : The source encoding's name, lowercased.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testTextDecoderCreate003", 0, function () {
      let that = util.TextDecoder.create("utf-16be", { ignoreBOM: true });
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual("utf-16be");
    });

    /**
     * @tc.number: TEST_TEXT_DECODER_CREATE_004
     * @tc.name  : testTextDecoderCreate004
     * @tc.desc  : The source encoding's name, lowercased.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testTextDecoderCreate004", 0, function () {
      let that = util.TextDecoder.create("utf-16be", { ignoreBOM: false });
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual("utf-16be");
    });

    /**
     * @tc.number: TEST_TEXT_DECODER_CREATE_005
     * @tc.name  : testTextDecoderCreate005
     * @tc.desc  : The source encoding's name, lowercased.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testTextDecoderCreate005", 0, function () {
      let that = util.TextDecoder.create();
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual("utf-8");
    });

    /**
     * @tc.number: TEST_TEXT_DECODER_CREATE_006
     * @tc.name  : testTextDecoderCreate006
     * @tc.desc  : The source encoding's name, lowercased.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testTextDecoderCreate006", 0, function () {
      let that = util.TextDecoder.create("utf-8", { ignoreBOM: false });
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual("utf-8");
    });

    /**
     * @tc.number: TEST_DECODER_WITH_STREAM_001
     * @tc.name  : testDecodeWithStream001
     * @tc.desc  : Decode the input parameters and output the corresponding text.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeWithStream001", 0, function () {
      let that = util.TextDecoder.create("utf-16le", { ignoreBOM: false });
      let arr = new Uint8Array(8);
      arr[0] = 0xff;
      arr[1] = 0xfe;
      arr[2] = 0x61;
      arr[3] = 0x00;
      arr[4] = 0x62;
      arr[5] = 0x00;
      arr[6] = 0x63;
      arr[7] = 0x00;
      let retStr = that.decodeWithStream(arr, { stream: false });
      let BOM = "\uFEFF";
      let rel = "abc";
      let re = BOM + rel;
      expect(retStr).assertEqual(re);
    });

    /**
     * @tc.number: TEST_DECODER_WITH_STREAM_002
     * @tc.name  : testDecodeWithStream002
     * @tc.desc  : Decode the input parameters and output the corresponding text.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeWithStream002", 0, function () {
      let that = util.TextDecoder.create("utf-8", { ignoreBOM: true });
      let arr = new Uint8Array(6);
      arr[0] = 0xef;
      arr[1] = 0xbb;
      arr[2] = 0xbf;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decodeWithStream(arr, { stream: true });
      let BOM = "\uFEFF";
      let rel = "abc";
      let re = BOM + rel;
      expect(retStr).assertEqual(re);
    });

    /**
     * @tc.number: TEST_DECODER_WITH_STREAM_003
     * @tc.name  : testDecodeWithStream003
     * @tc.desc  : Decode the input parameters and output the corresponding text.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeWithStream003", 0, function () {
      let that = util.TextDecoder.create("utf-16be");
      let arr = new Uint8Array(6);
      arr[0] = 0x00;
      arr[1] = 0x61;
      arr[2] = 0x00;
      arr[3] = 0x62;
      arr[4] = 0x00;
      arr[5] = 0x63;
      let retStr = that.decodeWithStream(arr);
      let rel = "abc";
      expect(retStr).assertEqual(rel);
    });

    /**
     * @tc.number: TEST_DECODER_WITH_STREAM_004
     * @tc.name  : testDecodeWithStream004
     * @tc.desc  : Decode the input parameters and output the corresponding text.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeWithStream004", 0, function () {
      let that = util.TextDecoder.create("utf-16le");
      let arr = new Uint8Array(6);
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decodeWithStream(arr);
      let rel = "abc";
      expect(retStr).assertEqual(rel);
    });

    /**
     * @tc.number: TEST_DECODER_WITH_STREAM_005
     * @tc.name  : testDecodeWithStream005
     * @tc.desc  : Decode the input parameters and output the corresponding text.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeWithStream005", 0, function () {
      let that = util.TextDecoder.create("utf-8");
      let arr = new Uint8Array(3);
      for (let i = 0; i < 3; i++) {
        arr[i] = 0x61 + i;
      }
      let retStr = that.decodeWithStream(arr);
      let rel = "abc";
      expect(retStr).assertEqual(rel);
    });

    /**
     * @tc.number: TEST_ENCODING_TEXT_ENCODER_001
     * @tc.name  : testEncodingTextEncoder001
     * @tc.desc  : Encoding format.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodingTextEncoder001", 0, function () {
      let that = new util.TextEncoder();
      let str = that.encoding;
      expect(str).assertEqual("utf-8");
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_001
     * @tc.name  : testEncodeInto001
     * @tc.desc  : Returns the result of encoder.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto001", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("abc");
      expect(result[0]).assertEqual(0x61);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_002
     * @tc.name  : testEncodeInto002
     * @tc.desc  : Returns the result of encoder.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto002", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("\uD800楼楼");
      expect(result[5]).assertEqual(188);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_003
     * @tc.name  : testEncodeInto003
     * @tc.desc  : Returns the result of encoder.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto003", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("a\uD800楼楼");
      expect(result[0]).assertEqual(0x61);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_004
     * @tc.name  : testEncodeInto004
     * @tc.desc  : Returns the result of encoder.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto004", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("abc\uD800楼楼");
      expect(result[1]).assertEqual(0x62);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_005
     * @tc.name  : testEncodeInto005
     * @tc.desc  : Returns the result of encoder.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto005", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("123\uD800楼楼");
      expect(result[0]).assertEqual(49);
      expect(result[9]).assertEqual(230);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_006
     * @tc.name  : testEncodeInto006
     * @tc.desc  : Returns the result of encoder.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto006", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("123¥\uD800楼");
      expect(result[10]).assertEqual(0xbc);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_007
     * @tc.name  : testEncodeInto007
     * @tc.desc  : Returns the result of encoder.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto007", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("¥¥");
      expect(result[0]).assertEqual(0xc2);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_008
     * @tc.name  : testEncodeInto008
     * @tc.desc  : Returns the result of encoder.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto008", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("$$");
      expect(result[0]).assertEqual(0x24);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_009
     * @tc.name  : testEncodeInto009
     * @tc.desc  : Returns the result of encoder for gb18030.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto009", 0, function () {
      let that1 = new util.TextEncoder('gb18030');
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("abcde");
      expect(that1 != null).assertTrue();
      expect(result[0]).assertEqual(97);
      expect(result[1]).assertEqual(98);
      expect(result[2]).assertEqual(99);
      expect(result[3]).assertEqual(100);
      expect(result[4]).assertEqual(101);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_010
     * @tc.name  : testEncodeInto010
     * @tc.desc  : Returns the result of encoder for GB18030.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeInto010", 0, function () {
      let that1 = new util.TextEncoder('GB18030');
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let result = new Uint8Array(buffer);
      result = that.encodeInto("abcde");
      expect(that1 != null).assertTrue();
      expect(result[0]).assertEqual(97);
      expect(result[1]).assertEqual(98);
      expect(result[2]).assertEqual(99);
      expect(result[3]).assertEqual(100);
      expect(result[4]).assertEqual(101);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_UINT_8_ARRAY_001
     * @tc.name  : testEncodeIntoUint8Array001
     * @tc.desc  : encode string, write the result to dest array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeIntoUint8Array001", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let dest = new Uint8Array(buffer, 0, 13);
      let result = new Object();
      result = that.encodeIntoUint8Array("\uD800A\uDF06A楼HiA", dest);
      expect(result["read"]).assertEqual(7);
      expect(result["written"]).assertEqual(13);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_UINT_8_ARRAY_002
     * @tc.name  : testEncodeIntoUint8Array002
     * @tc.desc  : encode string, write the result to dest array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeIntoUint8Array002", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(6);
      let dest = new Uint8Array(buffer);
      let result = new Object();
      result = that.encodeIntoUint8Array("abc\u2603d", dest);
      expect(result["read"]).assertEqual(4);
      expect(result["written"]).assertEqual(6);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_UINT_8_ARRAY_003
     * @tc.name  : testEncodeIntoUint8Array003
     * @tc.desc  : encode string, write the result to dest array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeIntoUint8Array003", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(4);
      let dest = new Uint8Array(buffer);
      let result = new Object();
      result = that.encodeIntoUint8Array("abcd", dest);
      expect(result["read"]).assertEqual(4);
      expect(result["written"]).assertEqual(4);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_UINT_8_ARRAY_004
     * @tc.name  : testEncodeIntoUint8Array004
     * @tc.desc  : encode string, write the result to dest array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeIntoUint8Array004", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(4);
      let dest = new Uint8Array(buffer);
      let result = new Object();
      result = that.encodeIntoUint8Array("12345", dest);
      expect(result["read"]).assertEqual(4);
      expect(result["written"]).assertEqual(4);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_UINT_8_ARRAY_005
     * @tc.name  : testEncodeIntoUint8Array005
     * @tc.desc  : encode string, write the result to dest array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeIntoUint8Array005", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(4);
      let dest = new Uint8Array(buffer);
      let result = new Object();
      result = that.encodeIntoUint8Array("123 4*!@#", dest);
      expect(result["read"]).assertEqual(4);
      expect(result["written"]).assertEqual(4);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_UINT_8_ARRAY_006
     * @tc.name  : testEncodeIntoUint8Array006
     * @tc.desc  : encode string, write the result to dest array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeIntoUint8Array006", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(4);
      let dest = new Uint8Array(buffer);
      let result = new Object();
      result = that.encodeIntoUint8Array("", dest);
      expect(result["read"]).assertEqual(0);
      expect(result["written"]).assertEqual(0);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_UINT_8_ARRAY_007
     * @tc.name  : testEncodeIntoUint8Array007
     * @tc.desc  : encode string, write the result to dest array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeIntoUint8Array007", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let dest = new Uint8Array(buffer);
      let result = new Object();
      result = that.encodeIntoUint8Array("12ab", dest);
      expect(result["read"]).assertEqual(4);
      expect(result["written"]).assertEqual(4);
    });

    /**
     * @tc.number: TEST_ENCODE_INTO_UINT_8_ARRAY_008
     * @tc.name  : testEncodeIntoUint8Array008
     * @tc.desc  : encode string, write the result to dest array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeIntoUint8Array008", 0, function () {
      let that = new util.TextEncoder();
      let buffer = new ArrayBuffer(20);
      let dest = new Uint8Array(buffer, 0, 0);
      let result = new Object();
      result = that.encodeIntoUint8Array("\uD800A\uDF06A楼HiA", dest);
      expect(result["read"]).assertEqual(0);
      expect(result["written"]).assertEqual(0);
    });

    /**
     * @tc.number: TEST_PARSE_Rational_NUMBER_001
     * @tc.name  : testParseRationalNumber001
     * @tc.desc  : Creates a RationalNumber object based on a given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParseRationalNumber001", 0, function () {
      let res = util.RationalNumber.parseRationalNumber(2, 1);
      let result = res.valueOf();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number: TEST_CREATE_Rational_FROM_STRING_001
     * @tc.name  : testCreateRationalFromString001
     * @tc.desc  : Creates a RationalNumber object based on a given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCreateRationalFromString001", 0, function () {
      let res = util.RationalNumber.createRationalFromString("-1:2");
      let result = res.valueOf();
      expect(result).assertEqual(-0.5);
    });

    /**
     * @tc.number: TEST_CREATE_Rational_FROM_STRING_002
     * @tc.name  : testCreateRationalFromString002
     * @tc.desc  : Creates a RationalNumber object based on a given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCreateRationalFromString002", 0, function () {
      let res = util.RationalNumber.createRationalFromString("+3/4");
      let result = res.valueOf();
      expect(result).assertEqual(0.75);
    });

    /**
     * @tc.number: TEST_CREATE_Rational_FROM_STRING_003
     * @tc.name  : testCreateRationalFromString003
     * @tc.desc  : Creates a RationalNumber object based on a given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCreateRationalFromString003", 0, function () {
      let res = util.RationalNumber.createRationalFromString("+3:-4");
      let result = res.valueOf();
      expect(result).assertEqual(-0.75);
    });

    /**
     * @tc.number: TEST_CREATE_Rational_FROM_STRING_004
     * @tc.name  : testCreateRationalFromString004
     * @tc.desc  : Creates a RationalNumber object based on a given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCreateRationalFromString004", 0, function () {
      let res = util.RationalNumber.createRationalFromString("+2:4");
      let result = res.valueOf();
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number: TEST_CREATE_Rational_FROM_STRING_004
     * @tc.name  : testCreateRationalFromString004
     * @tc.desc  : Creates a RationalNumber object based on a given string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCreateRationalFromString005", 0, function () {
      let res = util.RationalNumber.createRationalFromString("+2:-4");
      let result = res.valueOf();
      expect(result).assertEqual(-0.5);
    });

    /**
     * @tc.number: TEST_COMPARE_001
     * @tc.name  : testCompare001
     * @tc.desc  : Compares the current RationalNumber object with a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCompare001", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 1);
      let proc = util.RationalNumber.parseRationalNumber(3, 4);
      let res = pro.compare(proc);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_COMPARE_002
     * @tc.name  : testCompare002
     * @tc.desc  : Compares the current RationalNumber object with a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCompare002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 1);
      let proc = util.RationalNumber.parseRationalNumber(0, 0);
      let res = pro.compare(proc);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_COMPARE_003
     * @tc.name  : testCompare003
     * @tc.desc  : Compares the current RationalNumber object with a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCompare003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 1);
      let proc = util.RationalNumber.parseRationalNumber(8, 3);
      let res = pro.compare(proc);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_COMPARE_004
     * @tc.name  : testCompare004
     * @tc.desc  : Compares the current RationalNumber object with a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCompare004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 1);
      let proc = util.RationalNumber.parseRationalNumber(2, 1);
      let res = pro.compare(proc);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number: TEST_COMPARE_005
     * @tc.name  : testCompare005
     * @tc.desc  : Compares the current RationalNumber object with a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCompare005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 0);
      let proc = util.RationalNumber.parseRationalNumber(2, 1);
      let res = pro.compare(proc);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_EQUALS_001
     * @tc.name  : testEquals001
     * @tc.desc  : Checks whether a given object is the same as the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEquals001", 0, function () {
      let pro = new util.RationalNumber();
      expect(pro != null).assertTrue();
      let proc = new util.RationalNumber();
      let res = pro.equals(proc);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_EQUALS_002
     * @tc.name  : testEquals002
     * @tc.desc  : Checks whether a given object is the same as the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEquals002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(1, 2);
      let proc = util.RationalNumber.parseRationalNumber(4, 2);
      let res = pro.equals(proc);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_EQUALS_003
     * @tc.name  : testEquals003
     * @tc.desc  : Checks whether a given object is the same as the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEquals003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 1);
      let proc = util.RationalNumber.parseRationalNumber(0, 2);
      let res = pro.equals(proc);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_EQUALS_004
     * @tc.name  : testEquals004
     * @tc.desc  : Checks whether a given object is the same as the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEquals004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 0);
      let proc = util.RationalNumber.parseRationalNumber(0, 2);
      let res = pro.equals(proc);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_EQUALS_005
     * @tc.name  : testEquals005
     * @tc.desc  : Checks whether a given object is the same as the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEquals005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(-2, 0);
      let proc = util.RationalNumber.parseRationalNumber(2, 0);
      let res = pro.equals(proc);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_VALUE_OF_001
     * @tc.name  : testRationalNumberValueOf001
     * @tc.desc  : Obtains the value of the current RationalNumber object as a number.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberValueOf001", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 1);
      let res = pro.valueOf();
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_VALUE_OF_002
     * @tc.name  : testRationalNumberValueOf002
     * @tc.desc  : Obtains the value of the current RationalNumber object as a number.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberValueOf002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 10);
      let res = pro.valueOf();
      expect(res).assertEqual(0.2);
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_VALUE_OF_003
     * @tc.name  : testRationalNumberValueOf003
     * @tc.desc  : Obtains the value of the current RationalNumber object as a number.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberValueOf003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(1, 2);
      let res = pro.valueOf();
      expect(res).assertEqual(0.5);
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_VALUE_OF_004
     * @tc.name  : testRationalNumberValueOf004
     * @tc.desc  : Obtains the value of the current RationalNumber object as a number.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberValueOf004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(4, 2);
      let res = pro.valueOf();
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_VALUE_OF_005
     * @tc.name  : testRationalNumberValueOf005
     * @tc.desc  : Obtains the value of the current RationalNumber object as a number.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberValueOf005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(4, 1);
      let res = pro.valueOf();
      expect(res).assertEqual(4);
    });

    /**
     * @tc.number: TEST_GET_COMMON_FACTOR_001
     * @tc.name  : testGetCommonFactor001
     * @tc.desc  : Obtains the greatest common divisor of two specified numbers.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetCommonFactor001", 0, function () {
      let res = util.RationalNumber.getCommonFactor(4, 8);
      expect(res).assertEqual(4);
    });

    /**
     * @tc.number: TEST_GET_COMMON_FACTOR_002
     * @tc.name  : testGetCommonFactor002
     * @tc.desc  : Obtains the greatest common divisor of two specified numbers.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetCommonFactor002", 0, function () {
      let res = util.RationalNumber.getCommonFactor(10, 15);
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number: TEST_GET_COMMON_FACTOR_003
     * @tc.name  : testGetCommonFactor003
     * @tc.desc  : Obtains the greatest common divisor of two specified numbers.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetCommonFactor003", 0, function () {
      let res = util.RationalNumber.getCommonFactor(8, 4);
      expect(res).assertEqual(4);
    });

    /**
     * @tc.number: TEST_GET_COMMON_FACTOR_004
     * @tc.name  : testGetCommonFactor004
     * @tc.desc  : Obtains the greatest common divisor of two specified numbers.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetCommonFactor004", 0, function () {
      let res = util.RationalNumber.getCommonFactor(8, 16);
      expect(res).assertEqual(8);
    });

    /**
     * @tc.number: TEST_GET_COMMON_FACTOR_005
     * @tc.name  : testGetCommonFactor005
     * @tc.desc  : Obtains the greatest common divisor of two specified numbers.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetCommonFactor005", 0, function () {
      let res = util.RationalNumber.getCommonFactor(2, 16);
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number: TEST_GET_DENOMINATOR_001
     * @tc.name  : testGetDenominator001
     * @tc.desc  : Obtains the denominator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetDenominator001", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 1);
      let res = pro.getDenominator();
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_GET_DENOMINATOR_002
     * @tc.name  : testGetDenominator002
     * @tc.desc  : Obtains the denominator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetDenominator002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 3);
      let res = pro.getDenominator();
      expect(res).assertEqual(3);
    });

    /**
     * @tc.number: TEST_GET_DENOMINATOR_003
     * @tc.name  : testGetDenominator003
     * @tc.desc  : Obtains the denominator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetDenominator003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 0);
      let res = pro.getDenominator();
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number: TEST_GET_DENOMINATOR_004
     * @tc.name  : testGetDenominator004
     * @tc.desc  : Obtains the denominator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetDenominator004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(10, 5);
      let res = pro.getDenominator();
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_GET_DENOMINATOR_005
     * @tc.name  : testGetDenominator005
     * @tc.desc  : Obtains the denominator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetDenominator005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(6, 3);
      let res = pro.getDenominator();
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_GET_DENOMINATOR_006
     * @tc.name  : testGetDenominator006
     * @tc.desc  : Obtains the denominator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetDenominator006", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(6, -3);
      let res = pro.getDenominator();
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_GET_NUMERATOR_001
     * @tc.name  : testGetNumerator001
     * @tc.desc  : Obtains the numerator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetNumerator001", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(-2, 1);
      let res = pro.getNumerator();
      expect(res).assertEqual(-2);
    });

    /**
     * @tc.number: TEST_GET_NUMERATOR_002
     * @tc.name  : testGetNumerator002
     * @tc.desc  : Obtains the numerator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetNumerator002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 3);
      let res = pro.getNumerator();
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number: TEST_GET_NUMERATOR_003
     * @tc.name  : testGetNumerator003
     * @tc.desc  : Obtains the numerator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetNumerator003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 4);
      let res = pro.getNumerator();
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_GET_NUMERATOR_004
     * @tc.name  : testGetNumerator004
     * @tc.desc  : Obtains the numerator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetNumerator004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(3, 6);
      let res = pro.getNumerator();
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_GET_NUMERATOR_005
     * @tc.name  : testGetNumerator005
     * @tc.desc  : Obtains the numerator of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetNumerator005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(10, 5);
      let res = pro.getNumerator();
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number: TEST_IS_FINITE_001
     * @tc.name  : testIsFinite001
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFinite001", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(-2, 1);
      let res = pro.isFinite();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_FINITE_002
     * @tc.name  : testIsFinite002
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFinite002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 3);
      let res = pro.isFinite();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_FINITE_003
     * @tc.name  : testIsFinite003
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFinite003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 0);
      let res = pro.isFinite();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_FINITE_004
     * @tc.name  : testIsFinite004
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFinite004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(1, 3);
      let res = pro.isFinite();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_FINITE_005
     * @tc.name  : testIsFinite005
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsFinite005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(10, 5);
      let res = pro.isFinite();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_NAN_001
     * @tc.name  : testIsNaN001
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNaN001", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(-2, 1);
      let res = pro.isNaN();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_NAN_002
     * @tc.name  : testIsNaN002
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNaN002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 3);
      let res = pro.isNaN();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_NAN_003
     * @tc.name  : testIsNaN003
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNaN003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 0);
      let res = pro.isNaN();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_NAN_004
     * @tc.name  : testIsNaN004
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNaN004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(10, 0);
      let res = pro.isNaN();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_NAN_005
     * @tc.name  : testIsNaN005
     * @tc.desc  : Checks whether the current RationalNumber object represents a finite value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsNaN005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(10, 1);
      let res = pro.isNaN();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ZERO_001
     * @tc.name  : testIsZero001
     * @tc.desc  : Checks whether the current RationalNumber object represents the value 0.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsZero001", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(-2, 1);
      let res = pro.isZero();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ZERO_002
     * @tc.name  : testIsZero002
     * @tc.desc  : Checks whether the current RationalNumber object represents the value 0.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsZero002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 3);
      let res = pro.isZero();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_ZERO_003
     * @tc.name  : testIsZero003
     * @tc.desc  : Checks whether the current RationalNumber object represents the value 0.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsZero003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 0);
      let res = pro.isZero();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ZERO_004
     * @tc.name  : testIsZero004
     * @tc.desc  : Checks whether the current RationalNumber object represents the value 0.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsZero004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(10, 2);
      let res = pro.isZero();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_ZERO_005
     * @tc.name  : testIsZero005
     * @tc.desc  : Checks whether the current RationalNumber object represents the value 0.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsZero005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(1, 1);
      let res = pro.isZero();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_TO_STRING_001
     * @tc.name  : testRationalNumberToString001
     * @tc.desc  : Obtains a string representation of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberToString001", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(-2, 1);
      let res = pro.toString();
      expect(res).assertEqual("-2/1");
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_TO_STRING_002
     * @tc.name  : testRationalNumberToString002
     * @tc.desc  : Obtains a string representation of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberToString002", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(0, 0);
      let res = pro.toString();
      expect(res).assertEqual("NaN");
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_TO_STRING_003
     * @tc.name  : testRationalNumberToString003
     * @tc.desc  : Obtains a string representation of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberToString003", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(3, 0);
      let res = pro.toString();
      expect(res).assertEqual("Infinity");
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_TO_STRING_004
     * @tc.name  : testRationalNumberToString004
     * @tc.desc  : Obtains a string representation of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberToString004", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(-3, 0);
      let res = pro.toString();
      expect(res).assertEqual("-Infinity");
    });

    /**
     * @tc.number: TEST_RATIONAL_NUMBER_TO_STRING_005
     * @tc.name  : testRationalNumberToString005
     * @tc.desc  : Obtains a string representation of the current RationalNumber object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRationalNumberToString005", 0, function () {
      let pro = util.RationalNumber.parseRationalNumber(2, 3);
      let res = pro.toString();
      expect(res).assertEqual("2/3");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_UPDATE_GET_CAPACITY_001
     * @tc.name  : testLruCacheUpdateGetCapacity001
     * @tc.desc  : Updates the buffer capacity to a specified capacity.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheUpdateGetCapacity001", 0, function () {
      let that = new util.LRUCache();
      expect(that != null).assertTrue();
      that.updateCapacity(10);
      let result = that.getCapacity();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_UPDATE_GET_CAPACITY_002
     * @tc.name  : testLruCacheUpdateGetCapacity002
     * @tc.desc  : Updates the buffer capacity to a specified capacity.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheUpdateGetCapacity002", 0, function () {
      let that = new util.LRUCache();
      expect(that != null).assertTrue();
      that.updateCapacity(2147483646);
      let result = that.getCapacity();
      expect(result).assertEqual(2147483646);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_UPDATE_GET_CAPACITY_003
     * @tc.name  : testLruCacheUpdateGetCapacity003
     * @tc.desc  : Updates the buffer capacity to a specified capacity.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheUpdateGetCapacity003", 0, function () {
      let that = new util.LRUCache(100);
      expect(that != null).assertTrue();
      that.updateCapacity(20);
      let result = that.getCapacity();
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_UPDATE_GET_CAPACITY_004
     * @tc.name  : testLruCacheUpdateGetCapacity004
     * @tc.desc  : Updates the buffer capacity to a specified capacity.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheUpdateGetCapacity004", 0, function () {
      let that = new util.LRUCache(50);
      expect(that != null).assertTrue();
      that.updateCapacity(2);
      let result = that.getCapacity();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_UPDATE_GET_CAPACITY_005
     * @tc.name  : testLruCacheUpdateGetCapacity005
     * @tc.desc  : Updates the buffer capacity to a specified capacity.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheUpdateGetCapacity005", 0, function () {
      let that = new util.LRUCache(200);
      expect(that != null).assertTrue();
      that.updateCapacity(100);
      let result = that.getCapacity();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_TO_STRING_001
     * @tc.name  : testLruCacheToString001
     * @tc.desc  : Returns a string representation of the object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheToString001", 0, function () {
      let that = new util.LRUCache();
      that.put("1111", "bcjdshc");
      that.put(1, 2);
      let result = that.toString();
      expect(result).assertEqual("LRUCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_TO_STRING_002
     * @tc.name  : testLruCacheToString002
     * @tc.desc  : Returns a string representation of the object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheToString002", 0, function () {
      let that = new util.LRUCache();
      that.put("1111", "bcjdshc");
      that.put(1, 2);
      that.get(1);
      that.get("1111");
      let result = that.toString();
      expect(result).assertEqual("LRUCache[ maxSize = 64, hits = 2, misses = 0, hitRate = 100% ]");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_TO_STRING_003
     * @tc.name  : testLruCacheToString003
     * @tc.desc  : Returns a string representation of the object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheToString003", 0, function () {
      let that = new util.LRUCache(100);
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      let result = that.toString();
      expect(result).assertEqual("LRUCache[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_TO_STRING_004
     * @tc.name  : testLruCacheToString004
     * @tc.desc  : Returns a string representation of the object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheToString004", 0, function () {
      let that = new util.LRUCache(100);
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.get(2);
      let result = that.toString();
      expect(result).assertEqual("LRUCache[ maxSize = 100, hits = 1, misses = 1, hitRate = 50% ]");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_TO_STRING_005
     * @tc.name  : testLruCacheToString005
     * @tc.desc  : Returns a string representation of the object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheToString005", 0, function () {
      let that = new util.LRUCache(100);
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.get(2);
      that.get(1);
      that.contains(5);
      let result = that.toString();
      expect(result).assertEqual("LRUCache[ maxSize = 100, hits = 3, misses = 1, hitRate = 75% ]");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_LENGTH_001
     * @tc.name  : testLruCacheLength001
     * @tc.desc  : Obtains the total number of values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheLength001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      let result = that.length;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CAPACITY_001
     * @tc.name  : testLruCacheGetCapacity001
     * @tc.desc  : Obtains the capacity of the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCapacity001", 0, function () {
      let that = new util.LRUCache();
      let result = that.getCapacity();
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CAPACITY_002
     * @tc.name  : testLruCacheGetCapacity002
     * @tc.desc  : Obtains the capacity of the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCapacity002", 0, function () {
      let that = new util.LRUCache(2);
      let result = that.getCapacity();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CAPACITY_003
     * @tc.name  : testLruCacheGetCapacity003
     * @tc.desc  : Obtains the capacity of the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCapacity003", 0, function () {
      let that = new util.LRUCache(100);
      let result = that.getCapacity();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CAPACITY_004
     * @tc.name  : testLruCacheGetCapacity004
     * @tc.desc  : Obtains the capacity of the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCapacity004", 0, function () {
      let that = new util.LRUCache();
      that.updateCapacity(50);
      let result = that.getCapacity();
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CAPACITY_005
     * @tc.name  : testLruCacheGetCapacity005
     * @tc.desc  : Obtains the capacity of the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCapacity005", 0, function () {
      let that = new util.LRUCache(100);
      that.updateCapacity(10);
      let result = that.getCapacity();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CLEAR_001
     * @tc.name  : testLruCacheClear001
     * @tc.desc  : Clears key-value pairs from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheClear001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      let result1 = that.length;
      that.clear();
      let result2 = that.length;
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CLEAR_002
     * @tc.name  : testLruCacheClear002
     * @tc.desc  : Clears key-value pairs from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheClear002", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put(5, 33);
      that.put(25, 35);
      let result1 = that.length;
      that.clear();
      let result2 = that.length;
      expect(result1).assertEqual(4);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CLEAR_003
     * @tc.name  : testLruCacheClear003
     * @tc.desc  : Clears key-value pairs from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheClear003", 0, function () {
      let that = new util.LRUCache();
      that.put("abc", 2);
      that.put(2, "abc");
      that.put("ancd", "abcd");
      that.put(10, 35);
      let result1 = that.length;
      that.clear();
      let result2 = that.length;
      expect(result1).assertEqual(4);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CLEAR_004
     * @tc.name  : testLruCacheClear004
     * @tc.desc  : Clears key-value pairs from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheClear004", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put(5, 33);
      that.updateCapacity(3);
      let result1 = that.length;
      that.clear();
      let result2 = that.length;
      expect(result1).assertEqual(3);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CLEAR_005
     * @tc.name  : testLruCacheClear005
     * @tc.desc  : Clears key-value pairs from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheClear005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put(5, 33);
      that.put("abcd", "string");
      that.updateCapacity(2);
      let result1 = that.length;
      that.clear();
      let result2 = that.length;
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CREATE_COUNT_001
     * @tc.name  : testLruCacheGetCreateCount001
     * @tc.desc  : Obtains the number of times createDefault(Object) returned a value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCreateCount001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.get(3);
      that.get(5);
      that.get(10);
      let result = that.getCreateCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CREATE_COUNT_002
     * @tc.name  : testLruCacheGetCreateCount002
     * @tc.desc  : Obtains the number of times createDefault(Object) returned a value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCreateCount002", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.get(6);
      that.get(8);
      that.get(20);
      let result = that.getCreateCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CREATE_COUNT_003
     * @tc.name  : testLruCacheGetCreateCount003
     * @tc.desc  : Obtains the number of times createDefault(Object) returned a value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCreateCount003", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.get("abc");
      that.get("cndk");
      let result = that.getCreateCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CREATE_COUNT_004
     * @tc.name  : testLruCacheGetCreateCount004
     * @tc.desc  : Obtains the number of times createDefault(Object) returned a value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCreateCount004", 0, function () {
      let that = new util.LRUCache();
      that.put(5, 2);
      that.put(10, 10);
      that.put("abcd", "abcd");
      that.get(5);
      that.get(20);
      that.get(12);
      let result = that.getCreateCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_CREATE_COUNT_005
     * @tc.name  : testLruCacheGetCreateCount005
     * @tc.desc  : Obtains the number of times createDefault(Object) returned a value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetCreateCount005", 0, function () {
      let that = new util.LRUCache();
      that.put("xsjk", "bcjds");
      that.put("ajc", 10);
      that.put("abcd", 15);
      that.get(2);
      that.get(10);
      that.get(30);
      let result = that.getCreateCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MISS_COUNT_001
     * @tc.name  : testLruCacheGetMissCount001
     * @tc.desc  : Obtains the number of times that the queried values are not matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMissCount001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.get(3);
      that.get(5);
      that.get(10);
      let result = that.getMissCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MISS_COUNT_002
     * @tc.name  : testLruCacheGetMissCount002
     * @tc.desc  : Obtains the number of times that the queried values are not matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMissCount002", 0, function () {
      let that = new util.LRUCache();
      that.put(5, 2);
      that.put(1, 10);
      that.put("abcd", "bcjsc");
      that.get(2);
      that.get(10);
      that.get(15);
      let result = that.getMissCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MISS_COUNT_003
     * @tc.name  : testLruCacheGetMissCount003
     * @tc.desc  : Obtains the number of times that the queried values are not matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMissCount003", 0, function () {
      let that = new util.LRUCache();
      that.put(10, 10);
      that.put(3, 20);
      that.put(12, 16);
      that.get(1);
      that.get(2);
      that.get(6);
      let result = that.getMissCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MISS_COUNT_004
     * @tc.name  : testLruCacheGetMissCount004
     * @tc.desc  : Obtains the number of times that the queried values are not matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMissCount004", 0, function () {
      let that = new util.LRUCache();
      that.put("acb", "asdc");
      that.put("vfb", 1);
      that.put("abcd", "abcd");
      that.get(3);
      that.get(5);
      that.get(10);
      let result = that.getMissCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MISS_COUNT_005
     * @tc.name  : testLruCacheGetMissCount005
     * @tc.desc  : Obtains the number of times that the queried values are not matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMissCount005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.get(3);
      that.get(5);
      that.get(10);
      that.contains(2);
      that.contains(6);
      let result = that.getMissCount();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MISS_COUNT_006
     * @tc.name  : testLruCacheGetMissCount006
     * @tc.desc  : Obtains the number of times that the queried values are not matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMissCount006", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.get(1);
      that.get(2);
      that.get("abcd");
      let result = that.getMissCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_REMOVAL_COUNT_001
     * @tc.name  : testLruCacheGetRemovalCount001
     * @tc.desc  : Obtains the number of times that values are evicted from the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetRemovalCount001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.put(3, 20);
      that.put(5, 30);
      let result = that.getRemovalCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_REMOVAL_COUNT_002
     * @tc.name  : testLruCacheGetRemovalCount002
     * @tc.desc  : Obtains the number of times that values are evicted from the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetRemovalCount002", 0, function () {
      let that = new util.LRUCache();
      that.put(10, 2);
      that.put(3, 2);
      that.put(15, 15);
      that.put(1, 20);
      let result = that.getRemovalCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_REMOVAL_COUNT_003
     * @tc.name  : testLruCacheGetRemovalCount003
     * @tc.desc  : Obtains the number of times that values are evicted from the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetRemovalCount003", 0, function () {
      let that = new util.LRUCache();
      that.put("abc", 2);
      that.put("abcd", "abcd");
      that.put(3, 2);
      let result = that.getRemovalCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_REMOVAL_COUNT_004
     * @tc.name  : testLruCacheGetRemovalCount004
     * @tc.desc  : Obtains the number of times that values are evicted from the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetRemovalCount004", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.updateCapacity(2);
      that.put(3, 20);
      that.put(5, 30);
      let result = that.getRemovalCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_REMOVAL_COUNT_005
     * @tc.name  : testLruCacheGetRemovalCount005
     * @tc.desc  : Obtains the number of times that values are evicted from the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetRemovalCount005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.updateCapacity(3);
      that.put("string", 20);
      that.put("abc", 30);
      that.put(10, 20);
      let result = that.getRemovalCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MATCH_COUNT_001
     * @tc.name  : testLruCacheGetMatchCount001
     * @tc.desc  : Obtains the number of times that the queried values are successfully matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMatchCount001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.get(1);
      that.get(2);
      that.get("abcd");
      let result = that.getMatchCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MATCH_COUNT_002
     * @tc.name  : testLruCacheGetMatchCount002
     * @tc.desc  : Obtains the number of times that the queried values are successfully matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMatchCount002", 0, function () {
      let that = new util.LRUCache();
      that.put(10, 2);
      that.put(2, 1);
      that.put("abcd", 15);
      that.get(10);
      that.get(2);
      that.get("abcd");
      that.get("string");
      let result = that.getMatchCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MATCH_COUNT_003
     * @tc.name  : testLruCacheGetMatchCount003
     * @tc.desc  : Obtains the number of times that the queried values are successfully matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMatchCount003", 0, function () {
      let that = new util.LRUCache();
      that.put(0, 1);
      that.put(30, 10);
      that.put("abcd", 15);
      that.get(0);
      that.get(30);
      that.get("abcd");
      let result = that.getMatchCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MATCH_COUNT_004
     * @tc.name  : testLruCacheGetMatchCount004
     * @tc.desc  : Obtains the number of times that the queried values are successfully matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMatchCount004", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.get(1);
      that.get(2);
      that.get("abcd");
      that.contains(2);
      that.contains("abcd");
      that.contains(20);
      let result = that.getMatchCount();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MATCH_COUNT_005
     * @tc.name  : testLruCacheGetMatchCount005
     * @tc.desc  : Obtains the number of times that the queried values are successfully matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMatchCount005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.put("string", "string");
      that.get(1);
      that.get(2);
      that.get("abcd");
      that.get("string");
      that.contains(2);
      that.contains("abcd");
      that.contains("string");
      that.contains(10);
      let result = that.getMatchCount();
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_MATCH_COUNT_006
     * @tc.name  : testLruCacheGetMatchCount006
     * @tc.desc  : Obtains the number of times that the queried values are successfully matched.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetMatchCount006", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      that.get(5);
      let result = that.getMatchCount();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_PUT_COUNT_001
     * @tc.name  : testLruCacheGetPutCount001
     * @tc.desc  : Obtains the number of times that values are added to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetPutCount001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      let result = that.getPutCount();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_PUT_COUNT_002
     * @tc.name  : testLruCacheGetPutCount002
     * @tc.desc  : Obtains the number of times that values are added to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetPutCount002", 0, function () {
      let that = new util.LRUCache();
      that.put(5, 3);
      that.put(2, 10);
      let result = that.getPutCount();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_PUT_COUNT_003
     * @tc.name  : testLruCacheGetPutCount003
     * @tc.desc  : Obtains the number of times that values are added to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetPutCount003", 0, function () {
      let that = new util.LRUCache();
      that.put("string", 2);
      that.put("abcd", 1);
      that.put("ab", "a");
      let result = that.getPutCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_PUT_COUNT_004
     * @tc.name  : testLruCacheGetPutCount004
     * @tc.desc  : Obtains the number of times that values are added to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetPutCount004", 0, function () {
      let that = new util.LRUCache();
      that.put("string", "string");
      that.put("ac", "abc");
      that.put("abcd", 15);
      let result = that.getPutCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_PUT_COUNT_005
     * @tc.name  : testLruCacheGetPutCount005
     * @tc.desc  : Obtains the number of times that values are added to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGetPutCount005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.updateCapacity(2);
      that.put("abcd", "abc");
      let result = that.getPutCount();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_IS_EMPTY_001
     * @tc.name  : testLruCacheIsEmpty001
     * @tc.desc  : Checks whether the current buffer is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheIsEmpty001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      let result = that.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_IS_EMPTY_002
     * @tc.name  : testLruCacheIsEmpty002
     * @tc.desc  : Checks whether the current buffer is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheIsEmpty002", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      let result = that.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_IS_EMPTY_003
     * @tc.name  : testLruCacheIsEmpty003
     * @tc.desc  : Checks whether the current buffer is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheIsEmpty003", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put(5, 33);
      let result = that.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_IS_EMPTY_004
     * @tc.name  : testLruCacheIsEmpty004
     * @tc.desc  : Checks whether the current buffer is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheIsEmpty004", 0, function () {
      let that = new util.LRUCache();
      that.put("abc", 2);
      that.put("string", 10);
      that.put("ab", "abc");
      let result = that.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_IS_EMPTY_005
     * @tc.name  : testLruCacheIsEmpty005
     * @tc.desc  : Checks whether the current buffer is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheIsEmpty005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(2, 10);
      that.put(5, 33);
      that.clear();
      let result = that.isEmpty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_001
     * @tc.name  : testLruCacheGet001
     * @tc.desc  : Obtains the value associated with a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGet001", 0, function () {
      let that = new util.LRUCache(100);
      that.put(1, 2);
      let result = that.get(1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_002
     * @tc.name  : testLruCacheGet002
     * @tc.desc  : Obtains the value associated with a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGet002", 0, function () {
      let that = new util.LRUCache(100);
      that.put(1, 2);
      let result = that.get(5);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_003
     * @tc.name  : testLruCacheGet003
     * @tc.desc  : Obtains the value associated with a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGet003", 0, function () {
      let that = new util.LRUCache(100);
      that.put(1, 2);
      that.put(2, 10);
      that.put("abcd", 15);
      let result1 = that.get(20);
      let result2 = that.get("abcd");
      let result3 = that.get(2);
      expect(result1).assertEqual(undefined);
      expect(result2).assertEqual(15);
      expect(result3).assertEqual(10);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_004
     * @tc.name  : testLruCacheGet004
     * @tc.desc  : Obtains the value associated with a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGet004", 0, function () {
      let that = new util.LRUCache();
      that.put("1111", "bcjdshc");
      that.put(20, "cdjcaxb");
      that.put("abcd", 15);
      let result1 = that.get("1111");
      let result2 = that.get(20);
      let result3 = that.get("abcd");
      let result4 = that.get(25);
      expect(result1).assertEqual("bcjdshc");
      expect(result2).assertEqual("cdjcaxb");
      expect(result3).assertEqual(15);
      expect(result4).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_005
     * @tc.name  : testLruCacheGet005
     * @tc.desc  : Obtains the value associated with a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGet005", 0, function () {
      let that = new util.LRUCache();
      that.put("1111", "bcjdshc");
      that.put(20, "cdjcaxb");
      that.updateCapacity(2);
      that.put("abcd", 15);
      let result1 = that.get("1111");
      let result2 = that.get(20);
      let result3 = that.get("abcd");
      let result4 = that.get(25);
      expect(result1).assertEqual(undefined);
      expect(result2).assertEqual("cdjcaxb");
      expect(result3).assertEqual(15);
      expect(result4).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_GET_005
     * @tc.name  : testLruCacheGet005
     * @tc.desc  : Obtains the value associated with a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheGet006", 0, function () {
      let that = new util.LRUCache();
      let un = undefined;
      that.put(20, "cdjcaxb");
      try {
        let result1 = that.get(un);
        expect(0).assertEqual(1);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of undefined must be Object");
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
      }
    });

    /**
     * @tc.number: TEST_LRU_CACHE_PUT_001
     * @tc.name  : testLruCachePut001
     * @tc.desc  : Adds a key-value pair to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCachePut001", 0, function () {
      let that = new util.LRUCache();
      let temp = that.put("1111", "bcjdshc");
      expect(temp).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_PUT_002
     * @tc.name  : testLruCachePut002
     * @tc.desc  : Adds a key-value pair to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCachePut002", 0, function () {
      let that = new util.LRUCache();
      let temp1 = that.put("1111", "bcjdshc");
      let temp2 = that.put("1111", 13);
      expect(temp2).assertEqual("bcjdshc");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_PUT_003
     * @tc.name  : testLruCachePut003
     * @tc.desc  : Adds a key-value pair to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCachePut003", 0, function () {
      let that = new util.LRUCache();
      let temp = that.put("1111", "bcjdshc");
      let temp1 = that.put(1, 12);
      let temp2 = that.put(2, 5);
      let temp3 = that.put(2, "adasfdad");
      let temp4 = that.put("abc", 10);
      expect(temp1).assertEqual(undefined);
      expect(temp2).assertEqual(undefined);
      expect(temp3).assertEqual(5);
      expect(temp4).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_PUT_004
     * @tc.name  : testLruCachePut004
     * @tc.desc  : Adds a key-value pair to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCachePut004", 0, function () {
      let that = new util.LRUCache();
      let temp = that.put("1111", "bcjdshc");
      let temp1 = that.put(1, 12);
      let temp2 = that.put(2, 5);
      that.updateCapacity(2);
      let temp3 = that.put(2, "adasfdad");
      let temp4 = that.put("1111", 10);
      expect(temp).assertEqual(undefined);
      expect(temp1).assertEqual(undefined);
      expect(temp2).assertEqual(undefined);
      expect(temp3).assertEqual(5);
      expect(temp4).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_PUT_005
     * @tc.name  : testLruCachePut005
     * @tc.desc  : Adds a key-value pair to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCachePut005", 0, function () {
      let that = new util.LRUCache();
      let temp = that.put("1111", "bcjdshc");
      let temp1 = that.put(1, 12);
      let temp2 = that.put(2, 5);
      let temp3 = that.put(1, 10);
      let temp4 = that.put(2, 22);
      let temp5 = that.put(2, 30);
      expect(temp).assertEqual(undefined);
      expect(temp1).assertEqual(undefined);
      expect(temp2).assertEqual(undefined);
      expect(temp3).assertEqual(12);
      expect(temp4).assertEqual(5);
      expect(temp5).assertEqual(22);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_PUT_006
     * @tc.name  : testLruCachePut006
     * @tc.desc  : Adds a key-value pair to the buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCachePut006", 0, function () {
      let that = new util.LRUCache();
      let un = undefined;
      try {
        that.put(un, "bcjdshc");
        expect(0).assertEqual(1);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of undefined must be Object");
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
      }
    });

    /**
     * @tc.number: TEST_LRU_CACHE_VALUES_001
     * @tc.name  : testLruCacheValues001
     * @tc.desc  : Obtains a list of all values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheValues001", 0, function () {
      let that = new util.LRUCache();
      that.put("string", "abc");
      let result = that.values();
      expect(result[0]).assertEqual("abc");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_VALUES_002
     * @tc.name  : testLruCacheValues002
     * @tc.desc  : Obtains a list of all values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheValues002", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      let result = that.values();
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(15);
      expect(result[3]).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_VALUES_003
     * @tc.name  : testLruCacheValues003
     * @tc.desc  : Obtains a list of all values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheValues003", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      let result = that.values();
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(15);
      expect(result[2]).assertEqual(20);
      expect(result[3]).assertEqual(10);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_VALUES_004
     * @tc.name  : testLruCacheValues004
     * @tc.desc  : Obtains a list of all values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheValues004", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.contains(1);
      let result = that.values();
      expect(result[0]).assertEqual(15);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(10);
      expect(result[3]).assertEqual(2);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_VALUES_005
     * @tc.name  : testLruCacheValues005
     * @tc.desc  : Obtains a list of all values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheValues005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.remove(5);
      that.contains(3);
      that.get(1);
      that.contains("abc");
      let result = that.values();
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_KEYS_001
     * @tc.name  : testLruCacheKeys001
     * @tc.desc  : Obtains a list of keys for the values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheKeys001", 0, function () {
      let that = new util.LRUCache();
      that.put("string", "abc");
      let result = that.keys();
      expect(result[0]).assertEqual("string");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_KEYS_002
     * @tc.name  : testLruCacheKeys002
     * @tc.desc  : Obtains a list of keys for the values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheKeys002", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      let result = that.keys();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual("abc");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_KEYS_003
     * @tc.name  : testLruCacheKeys003
     * @tc.desc  : Obtains a list of keys for the values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheKeys003", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      let result = that.keys();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual("abc");
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_KEYS_004
     * @tc.name  : testLruCacheKeys004
     * @tc.desc  : Obtains a list of keys for the values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheKeys004", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.contains(1);
      let result = that.keys();
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual("abc");
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_KEYS_005
     * @tc.name  : testLruCacheKeys005
     * @tc.desc  : Obtains a list of keys for the values in the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheKeys005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.remove(5);
      that.contains(3);
      that.get(1);
      that.contains("abc");
      let result = that.keys();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual("abc");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_REMOVE_001
     * @tc.name  : testLruCacheRemove001
     * @tc.desc  : Deletes a specified key and its associated value from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheRemove001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      let result = that.remove(1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_REMOVE_002
     * @tc.name  : testLruCacheRemove002
     * @tc.desc  : Deletes a specified key and its associated value from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheRemove002", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put("abcd", 20);
      let result1 = that.remove(1);
      let result2 = that.remove("abcd");
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_REMOVE_003
     * @tc.name  : testLruCacheRemove003
     * @tc.desc  : Deletes a specified key and its associated value from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheRemove003", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      let result1 = that.remove(1);
      let result2 = that.remove(5);
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_REMOVE_004
     * @tc.name  : testLruCacheRemove004
     * @tc.desc  : Deletes a specified key and its associated value from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheRemove004", 0, function () {
      let that = new util.LRUCache();
      that.put(0, "abc");
      that.put("abcd", 20);
      let result1 = that.remove(1);
      let result2 = that.remove("abcd");
      expect(result1).assertEqual(undefined);
      expect(result2).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_REMOVE_005
     * @tc.name  : testLruCacheRemove005
     * @tc.desc  : Deletes a specified key and its associated value from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheRemove005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      let result1 = that.remove(1);
      let result2 = that.remove(3);
      let result3 = that.get(3);
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(10);
      expect(result3).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_REMOVE_006
     * @tc.name  : testLruCacheRemove006
     * @tc.desc  : Deletes a specified key and its associated value from the current buffer.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheRemove006", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      let un = undefined;
      try {
        that.remove(un);
        expect(0).assertEqual(1);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of undefined must be Object");
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
      }
    });

    /**
     * @tc.number: TEST_LRU_CACHE_AFTER_REMOVAL_001
     * @tc.name  : testLruCacheAfterRemoval001
     * @tc.desc  : Executes subsequent operations after a value is deleted.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheAfterRemoval001", 0, function () {
      let arr = [];
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor() {
          super();
        }
        afterRemoval(isEvict, key, value, newValue) {
          if (isEvict === false) {
            arr = [key, value, newValue];
          }
        }
      }
      let lru = new ChildLRUCache();
      lru.afterRemoval(false, 10, 30, null);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_AFTER_REMOVAL_002
     * @tc.name  : testLruCacheAfterRemoval002
     * @tc.desc  : Executes subsequent operations after a value is deleted.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheAfterRemoval002", 0, function () {
      let arr = [];
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor() {
          super();
        }
        afterRemoval(isEvict, key, value, newValue) {
          if (isEvict === false) {
            arr = [key, value, newValue];
          }
        }
      }
      let lru = new ChildLRUCache();
      lru.afterRemoval(false, "string", 10, null);
      expect(arr[0]).assertEqual("string");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_AFTER_REMOVAL_003
     * @tc.name  : testLruCacheAfterRemoval003
     * @tc.desc  : Executes subsequent operations after a value is deleted.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheAfterRemoval003", 0, function () {
      let arr = [];
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor() {
          super();
        }
        afterRemoval(isEvict, key, value, newValue) {
          if (isEvict === false) {
            arr = [key, value, newValue];
          }
        }
      }
      let lru = new ChildLRUCache();
      lru.afterRemoval(false, 10, 30, 12);
      expect(arr[2]).assertEqual(12);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_AFTER_REMOVAL_004
     * @tc.name  : testLruCacheAfterRemoval004
     * @tc.desc  : Executes subsequent operations after a value is deleted.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheAfterRemoval004", 0, function () {
      let arr = [];
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor() {
          super();
        }
        afterRemoval(isEvict, key, value, newValue) {
          if (isEvict === false) {
            arr = [key, value, newValue];
          }
        }
      }
      let lru = new ChildLRUCache();
      lru.afterRemoval(false, "abc", 30, "string");
      expect(arr[1]).assertEqual(30);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_AFTER_REMOVAL_005
     * @tc.name  : testLruCacheAfterRemoval005
     * @tc.desc  : Executes subsequent operations after a value is deleted.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheAfterRemoval005", 0, function () {
      let arr = [];
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor() {
          super();
        }
        afterRemoval(isEvict, key, value, newValue) {
          if (isEvict === true) {
            arr = [key, value, newValue];
          }
        }
      }
      let lru = new ChildLRUCache();
      lru.afterRemoval(true, "abc", "ab", "string");
      expect(arr[2]).assertEqual("string");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_AFTER_REMOVAL_006
     * @tc.name  : testLruCacheAfterRemoval006
     * @tc.desc  : Executes subsequent operations after a value is deleted.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheAfterRemoval006", 0, function () {
      let arr = [];
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor(capacity) {
          super(capacity);
        }
        afterRemoval(isEvict, key, value, newValue) {
          if (isEvict === true) {
            arr = [key, value];
          }
        }
      }
      let that = new ChildLRUCache(2);
      that.put(1, 2);
      that.put(3, 10);
      that.put("abc", 20);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_AFTER_REMOVAL_007
     * @tc.name  : testLruCacheAfterRemoval007
     * @tc.desc  : Executes subsequent operations after a value is deleted.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheAfterRemoval007", 0, function () {
      let arr = [];
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor(capacity) {
          super(capacity);
        }
        afterRemoval(isEvict, key, value, newValue) {
          if (isEvict === false) {
            arr = [key, value, newValue];
          }
        }
      }
      let that = new ChildLRUCache(3);
      that.put(1, 2);
      that.put(3, 10);
      that.put(1, 8);
      expect(arr[2]).assertEqual(8);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_AFTER_REMOVAL_008
     * @tc.name  : testLruCacheAfterRemoval008
     * @tc.desc  : Executes subsequent operations after a value is deleted.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheAfterRemoval008", 0, function () {
      let arrk = [];
      let arrv = [];
      class ChildLRUCache<K, V> extends util.LRUCache<K, V> {
        constructor(capacity) {
          super(capacity);
        }
        afterRemoval(isEvict, key, value, newValue) {
          if (isEvict === false) {
            arrk = Array.from(key);
            arrv = Array.from(value);
          }
        }
      }
      let that = new ChildLRUCache(3);
      that.put(1, 2);
      that.put(3, 10);
      that.put(2, 8);
      that.clear();
      expect(arrk[0]).assertEqual(1);
      expect(arrk[1]).assertEqual(3);
      expect(arrk[2]).assertEqual(2);
      expect(arrv[0]).assertEqual(2);
      expect(arrv[1]).assertEqual(10);
      expect(arrv[2]).assertEqual(8);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CONTAINS_001
     * @tc.name  : testLruCacheContains001
     * @tc.desc  : Checks whether the current buffer contains a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheContains001", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      let result = that.contains(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CONTAINS_002
     * @tc.name  : testLruCacheContains002
     * @tc.desc  : Checks whether the current buffer contains a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheContains002", 0, function () {
      let that = new util.LRUCache();
      that.put(0, 5);
      let result = that.contains(0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CONTAINS_003
     * @tc.name  : testLruCacheContains003
     * @tc.desc  : Checks whether the current buffer contains a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheContains003", 0, function () {
      let that = new util.LRUCache();
      that.put("abc", "abc");
      let result = that.contains(1);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CONTAINS_004
     * @tc.name  : testLruCacheContains004
     * @tc.desc  : Checks whether the current buffer contains a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheContains004", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put("abcd", 20);
      let result1 = that.contains(1);
      let result2 = that.contains(20);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CONTAINS_005
     * @tc.name  : testLruCacheContains005
     * @tc.desc  : Checks whether the current buffer contains a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheContains005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put("string", "string");
      let result1 = that.contains(1);
      let result2 = that.contains("string");
      let result3 = that.contains(0);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CONTAINS_006
     * @tc.name  : testLruCacheContains006
     * @tc.desc  : Checks whether the current buffer contains a specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheContains006", 0, function () {
      let that = new util.LRUCache();
      that.put("abc", "abc");
      let un = undefined;
      try {
        that.contains(un);
        expect(0).assertEqual(1);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of undefined must be Object");
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
      }
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CREATE_DEFAULT_001
     * @tc.name  : testLruCacheCreateDefault001
     * @tc.desc  : Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheCreateDefault001", 0, function () {
      let that = new util.LRUCache();
      let result = that.createDefault(1);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CREATE_DEFAULT_002
     * @tc.name  : testLruCacheCreateDefault002
     * @tc.desc  : Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheCreateDefault002", 0, function () {
      let that = new util.LRUCache();
      let result = that.createDefault(0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CREATE_DEFAULT_003
     * @tc.name  : testLruCacheCreateDefault003
     * @tc.desc  : Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheCreateDefault003", 0, function () {
      let that = new util.LRUCache();
      let result = that.createDefault("string");
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CREATE_DEFAULT_004
     * @tc.name  : testLruCacheCreateDefault004
     * @tc.desc  : Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheCreateDefault004", 0, function () {
      let that = new util.LRUCache();
      let result = that.createDefault(10);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CREATE_DEFAULT_005
     * @tc.name  : testLruCacheCreateDefault005
     * @tc.desc  : Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheCreateDefault005", 0, function () {
      let that = new util.LRUCache();
      let result1 = that.createDefault("abc");
      let result2 = that.createDefault("ab");
      expect(result1).assertEqual(undefined);
      expect(result2).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_CREATE_DEFAULT_006
     * @tc.name  : testLruCacheCreateDefault006
     * @tc.desc  : Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheCreateDefault006", 0, function () {
      let that = new util.LRUCache();
      let un = undefined;
      try {
        that.createDefault(un);
        expect(0).assertEqual(1);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of undefined must be Object");
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
      }
    });

    /**
     * @tc.number: TEST_LRU_CACHE_ENTRIES_001
     * @tc.name  : testLruCacheEntries001
     * @tc.desc  : Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheEntries001", 0, function () {
      let that = new util.LRUCache();
      that.put("string", "abc");
      let i = 0;
      let arr = {};
      for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[1]).assertEqual("abc");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_ENTRIES_002
     * @tc.name  : testLruCacheEntries002
     * @tc.desc  : Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheEntries002", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      let i = 0;
      let arr = {};
      for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_ENTRIES_003
     * @tc.name  : testLruCacheEntries003
     * @tc.desc  : Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheEntries003", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      let i = 0;
      let arr = {};
      for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_ENTRIES_004
     * @tc.name  : testLruCacheEntries004
     * @tc.desc  : Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheEntries004", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.contains(1);
      let i = 0;
      let arr = {};
      for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[1]).assertEqual(15);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_ENTRIES_005
     * @tc.name  : testLruCacheEntries005
     * @tc.desc  : Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheEntries005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.remove(5);
      that.contains(3);
      that.get(1);
      that.contains("abc");
      let i = 0;
      let arr = {};
      for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[1]).assertEqual(10);
      expect(arr[3]).assertEqual(2);
      expect(arr[5]).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_SYMBOL_ITERATOR_001
     * @tc.name  : testLruCacheSymbolIterator001
     * @tc.desc  : Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheSymbolIterator001", 0, function () {
      let that = new util.LRUCache();
      that.put("string", "abc");
      that.put("abc", 20);
      let i = 0;
      let arr = {};
      for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[1]).assertEqual("abc");
    });

    /**
     * @tc.number: TEST_LRU_CACHE_SYMBOL_ITERATOR_002
     * @tc.name  : testLruCacheSymbolIterator002
     * @tc.desc  : Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheSymbolIterator002", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      let i = 0;
      let arr = {};
      for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_SYMBOL_ITERATOR_003
     * @tc.name  : testLruCacheSymbolIterator003
     * @tc.desc  : Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheSymbolIterator003", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      let i = 0;
      let arr = {};
      for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_SYMBOL_ITERATOR_004
     * @tc.name  : testLruCacheSymbolIterator004
     * @tc.desc  : Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheSymbolIterator004", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.contains(1);
      let i = 0;
      let arr = {};
      for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[1]).assertEqual(15);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number: TEST_LRU_CACHE_SYMBOL_ITERATOR_005
     * @tc.name  : testLruCacheSymbolIterator005
     * @tc.desc  : Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testLruCacheSymbolIterator005", 0, function () {
      let that = new util.LRUCache();
      that.put(1, 2);
      that.put(3, 10);
      that.put(5, 15);
      that.put("abc", 20);
      that.get(3);
      that.remove(5);
      that.contains(3);
      that.get(1);
      that.contains("abc");
      let i = 0;
      let arr = {};
      for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
      }
      expect(arr[1]).assertEqual(10);
      expect(arr[3]).assertEqual(2);
      expect(arr[5]).assertEqual(20);
    });

    /**
     * @tc.number: TEST_COMPARE_TO_001
     * @tc.name  : testCompareTo001
     * @tc.desc  : Compare the size of two values and return a Boolean value
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testCompareTo001", 0, function () {
      let result1 = tempLower.compareTo(tempUpper);
      let result2 = tempUpper.compareTo(tempLower);
      let result3 = tempMiDF.compareTo(tempLess);
      let result4 = tempMore.compareTo(tempMidS);
      let result5 = tempLess.compareTo(tempMidS);
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result4).assertEqual(true);
      expect(result5).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CONSTRUCTOR_THROW_ERROR_001
     * @tc.name  : testConstructorThrowError001
     * @tc.desc  : A constructor used to create a Scope instance with the lower and upper bounds specified.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructorThrowError001", 0, function () {
      try {
        let range = new util.ScopeHelper(1, 2);
        expect(0).assertEqual(1);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 1 must be object");
      }
    });

    /**
     * @tc.number: TEST_TO_STRING_001
     * @tc.name  : testToString001
     * @tc.desc  : Obtains a string representation of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString001", 0, function () {
      let result = rangeHp.toString();
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_TO_STRING_002
     * @tc.name  : testToString002
     * @tc.desc  : Obtains a string representation of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString002", 0, function () {
      let result = rangeHpFir.toString();
      expect(result.toString()).assertEqual("[35, 39]");
    });

    /**
     * @tc.number: TEST_TO_STRING_003
     * @tc.name  : testToString003
     * @tc.desc  : Obtains a string representation of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString003", 0, function () {
      let result = rangeHpSec.toString();
      expect(result.toString()).assertEqual("[20, 45]");
    });

    /**
     * @tc.number: TEST_TO_STRING_004
     * @tc.name  : testToString004
     * @tc.desc  : Obtains a string representation of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString004", 0, function () {
      let result = rangeHpThi.toString();
      expect(result.toString()).assertEqual("[20, 35]");
    });

    /**
     * @tc.number: TEST_TO_STRING_005
     * @tc.name  : testToString005
     * @tc.desc  : Obtains a string representation of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString005", 0, function () {
      let result = rangeHpFif.toString();
      expect(result.toString()).assertEqual("[35, 45]");
    });

    /**
     * @tc.number: TEST_INTERSECT_001
     * @tc.name  : testIntersect001
     * @tc.desc  : Returns the intersection of a given range and the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect001", 0, function () {
      let result = rangeHp.intersect(rangeHpFir);
      expect(result.toString()).assertEqual("[35, 39]");
    });

    /**
     * @tc.number: TEST_INTERSECT_002
     * @tc.name  : testIntersect002
     * @tc.desc  : Returns the intersection of a given range and the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect002", 0, function () {
      let result = rangeHp.intersect(rangeHpSec);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_INTERSECT_003
     * @tc.name  : testIntersect003
     * @tc.desc  : Returns the intersection of a given range and the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect003", 0, function () {
      let result = rangeHp.intersect(rangeHpThi);
      expect(result.toString()).assertEqual("[30, 35]");
    });

    /**
     * @tc.number: TEST_INTERSECT_004
     * @tc.name  : testIntersect004
     * @tc.desc  : Returns the intersection of a given range and the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect004", 0, function () {
      let result = rangeHp.intersect(rangeHpFif);
      expect(result.toString()).assertEqual("[35, 40]");
    });

    /**
     * @tc.number: TEST_INTERSECT_005
     * @tc.name  : testIntersect005
     * @tc.desc  : Returns the intersection of a given range and the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect005", 0, function () {
      let result = rangeHp.intersect(rangeHp);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_INTERSECT_006
     * @tc.name  : testIntersect006
     * @tc.desc  : Returns the intersection of the current range and the range specified by
     the given lower and upper bounds.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect006", 0, function () {
      let result = rangeHp.intersect(tempMiDF, tempMidS);
      expect(result.toString()).assertEqual("[35, 39]");
    });

    /**
     * @tc.number: TEST_INTERSECT_007
     * @tc.name  : testIntersect007
     * @tc.desc  : Returns the intersection of the current range and the range specified by
     the given lower and upper bounds.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect007", 0, function () {
      let result = rangeHp.intersect(tempLess, tempMore);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_INTERSECT_008
     * @tc.name  : testIntersect008
     * @tc.desc  : Returns the intersection of the current range and the range specified by
     the given lower and upper bounds.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect008", 0, function () {
      let result = rangeHp.intersect(tempLess, tempMiDF);
      expect(result.toString()).assertEqual("[30, 35]");
    });

    /**
     * @tc.number: TEST_INTERSECT_009
     * @tc.name  : testIntersect009
     * @tc.desc  : Returns the intersection of the current range and the range specified by
     the given lower and upper bounds.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect009", 0, function () {
      let result = rangeHp.intersect(tempMiDF, tempMore);
      expect(result.toString()).assertEqual("[35, 40]");
    });

    /**
     * @tc.number: TEST_INTERSECT_010
     * @tc.name  : testIntersect010
     * @tc.desc  : Returns the intersection of the current range and the range specified by
     the given lower and upper bounds.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersect010", 0, function () {
      let result = rangeHp.intersect(tempLower, tempUpper);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_INTERSECT_THROE_ERROR_001
     * @tc.name  : testIntersectThrowError001
     * @tc.desc  : Returns the intersection of the current range and the range specified by
     the given lower and upper bounds.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIntersectThrowError001", 0, function () {
      try {
        let result = rangeHp.intersect(tempMiDF, 123);
        expect(result.toString()).assertEqual("[35, 39]");
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be ScopeType");
      }
    });

    /**
     * @tc.number: TEST_GET_UPPER_001
     * @tc.name  : testGetUpper001
     * @tc.desc  : Obtains the upper bound of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetUpper001", 0, function () {
      let result = rangeHp.getUpper();
      expect(result.toString()).assertEqual("40");
    });

    /**
     * @tc.number: TEST_GET_UPPER_002
     * @tc.name  : testGetUpper002
     * @tc.desc  : Obtains the upper bound of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetUpper002", 0, function () {
      let result = rangeHpFir.getUpper();
      expect(result.toString()).assertEqual("39");
    });

    /**
     * @tc.number: TEST_GET_UPPER_003
     * @tc.name  : testGetUpper003
     * @tc.desc  : Obtains the upper bound of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetUpper003", 0, function () {
      let result = rangeHpSec.getUpper();
      expect(result.toString()).assertEqual("45");
    });

    /**
     * @tc.number: TEST_GET_UPPER_004
     * @tc.name  : testGetUpper004
     * @tc.desc  : Obtains the upper bound of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetUpper004", 0, function () {
      let result = rangeHpThi.getUpper();
      expect(result.toString()).assertEqual("35");
    });

    /**
     * @tc.number: TEST_GET_UPPER_005
     * @tc.name  : testGetUpper005
     * @tc.desc  : Obtains the upper bound of the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetUpper005", 0, function () {
      let result = rangeHpFif.getUpper();
      expect(result.toString()).assertEqual("45");
    });

    /**
     * @tc.number: TEST_EXPAND_001
     * @tc.name  : testExpand001
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand001", 0, function () {
      let result = rangeHp.expand(rangeHpFir);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_EXPAND_002
     * @tc.name  : testExpand002
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand002", 0, function () {
      let result = rangeHp.expand(rangeHpSec);
      expect(result.toString()).assertEqual("[20, 45]");
    });

    /**
     * @tc.number: TEST_EXPAND_003
     * @tc.name  : testExpand003
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand003", 0, function () {
      let result = rangeHp.expand(rangeHpThi);
      expect(result.toString()).assertEqual("[20, 40]");
    });

    /**
     * @tc.number: TEST_EXPAND_004
     * @tc.name  : testExpand004
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand004", 0, function () {
      let result = rangeHp.expand(rangeHpFif);
      expect(result.toString()).assertEqual("[30, 45]");
    });

    /**
     * @tc.number: TEST_EXPAND_005
     * @tc.name  : testExpand005
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand005", 0, function () {
      let result = rangeHp.expand(rangeHp);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_EXPAND_006
     * @tc.name  : testExpand006
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand006", 0, function () {
      let result = rangeHp.expand(tempMiDF);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_EXPAND_007
     * @tc.name  : testExpand007
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand007", 0, function () {
      let result = rangeHp.expand(tempLess);
      expect(result.toString()).assertEqual("[20, 40]");
    });

    /**
     * @tc.number: TEST_EXPAND_008
     * @tc.name  : testExpand008
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand008", 0, function () {
      let result = rangeHp.expand(tempMore);
      expect(result.toString()).assertEqual("[30, 45]");
    });

    /**
     * @tc.number: TEST_EXPAND_009
     * @tc.name  : testExpand009
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand009", 0, function () {
      let result = rangeHp.expand(tempLower);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_EXPAND_010
     * @tc.name  : testExpand010
     * @tc.desc  : Creates the smallest range that includes the current range and a given range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testExpand010", 0, function () {
      let result = rangeHp.expand(tempUpper);
      expect(result.toString()).assertEqual("[30, 40]");
    });

    /**
     * @tc.number: TEST_CONTAINS_001
     * @tc.name  : testContains001
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains001", 0, function () {
      let result = rangeHp.contains(tempLess);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CONTAINS_002
     * @tc.name  : testContains002
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains002", 0, function () {
      let result = rangeHp.contains(tempMiDF);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONTAINS_003
     * @tc.name  : testContains003
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains003", 0, function () {
      let result = rangeHp.contains(tempMore);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CONTAINS_004
     * @tc.name  : testContains004
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains004", 0, function () {
      let result = rangeHp.contains(tempLower);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONTAINS_005
     * @tc.name  : testContains005
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains005", 0, function () {
      let result = rangeHp.contains(tempUpper);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONTAINS_006
     * @tc.name  : testContains006
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains006", 0, function () {
      let result = rangeHp.contains(rangeHpFir);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_CONTAINS_007
     * @tc.name  : testContains007
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains007", 0, function () {
      let result = rangeHp.contains(rangeHpSec);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CONTAINS_008
     * @tc.name  : testContains008
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains008", 0, function () {
      let result = rangeHp.contains(rangeHpThi);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CONTAINS_009
     * @tc.name  : testContains009
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains009", 0, function () {
      let result = rangeHp.contains(rangeHpFif);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CONTAINS_010
     * @tc.name  : testContains010
     * @tc.desc  : Checks whether a given value is within the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testContains010", 0, function () {
      let result = rangeHp.contains(rangeHp);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_CLAMP_001
     * @tc.name  : testClamp001
     * @tc.desc  : Clamps a given value to the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClamp001", 0, function () {
      let result = rangeHp.clamp(tempLess);
      expect(result.toString()).assertEqual("30");
    });

    /**
     * @tc.number: TEST_CLAMP_002
     * @tc.name  : testClamp002
     * @tc.desc  : Clamps a given value to the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClamp002", 0, function () {
      let result = rangeHp.clamp(tempMiDF);
      expect(result.toString()).assertEqual("35");
    });

    /**
     * @tc.number: TEST_CLAMP_003
     * @tc.name  : testClamp003
     * @tc.desc  : Clamps a given value to the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClamp003", 0, function () {
      let result = rangeHp.clamp(tempMore);
      expect(result.toString()).assertEqual("40");
    });

    /**
     * @tc.number: TEST_CLAMP_004
     * @tc.name  : testClamp004
     * @tc.desc  : Clamps a given value to the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClamp004", 0, function () {
      let result = rangeHp.clamp(tempLower);
      expect(result.toString()).assertEqual("30");
    });

    /**
     * @tc.number: TEST_CLAMP_005
     * @tc.name  : testClamp005
     * @tc.desc  : Clamps a given value to the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClamp005", 0, function () {
      let result = rangeHp.clamp(tempUpper);
      expect(result.toString()).assertEqual("40");
    });

    /**
     * @tc.number: TEST_CLAMP_THROW_ERROR_001
     * @tc.name  : testClampThrowError001
     * @tc.desc  : Clamps a given value to the current range.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClampThrowError001", 0, function () {
      try {
        let result = rangeHp.clamp(123);
        expect(result.toString()).assertEqual("30");
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be object");
      }
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_001
     * @tc.name  : testEncodeSyncBase64001
     * @tc.desc  : Encodes all bytes from the specified u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64001", 0, function () {
      let that = new util.Base64Helper();
      expect(that != null).assertTrue();
      let array = new Uint8Array([115, 49, 51]);
      let rarray = new Uint8Array([99, 122, 69, 122]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_002
     * @tc.name  : testEncodeSyncBase64002
     * @tc.desc  : Encodes all bytes from the specified u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64002", 0, function () {
      let that = new util.Base64Helper();
      expect(that != null).assertTrue();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 20; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_003
     * @tc.name  : testEncodeSyncBase64003
     * @tc.desc  : Encodes all bytes from the specified u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64003", 0, function () {
      let that = new util.Base64Helper();
      expect(that != null).assertTrue();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110, 73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 36; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_004
     * @tc.name  : testEncodeSyncBase64004
     * @tc.desc  : Encodes all bytes from the specified u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64004", 0, function () {
      let that = new util.Base64Helper();
      expect(that != null).assertTrue();
      let array = new Uint8Array([168, 174, 155, 255]);
      let rarray = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 8; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_005
     * @tc.name  : testEncodeSyncBase64005
     * @tc.desc  : Encodes all bytes from the specified u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64005", 0, function () {
      let that = new util.Base64Helper();
      expect(that != null).assertTrue();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 8; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_SYNC_BASE64_001
     * @tc.name  : testEncodeToStringSyncBase64001
     * @tc.desc  : Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringSyncBase64001", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual("czEz");
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_SYNC_BASE64_002
     * @tc.name  : testEncodeToStringSyncBase64002
     * @tc.desc  : Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringSyncBase64002", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual("QmFzZTY0IE5vZGUuanM=");
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_SYNC_BASE64_003
     * @tc.name  : testEncodeToStringSyncBase64003
     * @tc.desc  : Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringSyncBase64003", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual("QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=");
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_SYNC_BASE64_004
     * @tc.name  : testEncodeToStringSyncBase64004
     * @tc.desc  : Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringSyncBase64004", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([168, 174, 155, 255]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual("qK6b/w==");
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_SYNC_BASE64_005
     * @tc.name  : testEncodeToStringSyncBase64005
     * @tc.desc  : Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringSyncBase64005", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual("QmFzZTY0");
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_001
     * @tc.name  : testDecodeSyncBase64001
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64001", 0, function () {
      let that = new util.Base64Helper();
      let buff = "czEz";
      let rarray = new Uint8Array([115, 49, 51]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 3; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_002
     * @tc.name  : testDecodeSyncBase64002
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64002", 0, function () {
      let that = new util.Base64Helper();
      let buff = "QmFzZTY0IE5vZGUuanM=";
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 14; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_003
     * @tc.name  : testDecodeSyncBase64003
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64003", 0, function () {
      let that = new util.Base64Helper();
      let buff = "QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=";
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 26; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_004
     * @tc.name  : testDecodeSyncBase64004
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64004", 0, function () {
      let that = new util.Base64Helper();
      let buff = "qK6b/w==";
      let rarray = new Uint8Array([168, 174, 155, 255]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_005
     * @tc.name  : testDecodeSyncBase64005
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64005", 0, function () {
      let that = new util.Base64Helper();
      let buff = "QmFzZTY0";
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 6; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_006
     * @tc.name  : testDecodeSyncBase64006
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64006", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 14; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_007
     * @tc.name  : testDecodeSyncBase64007
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64007", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110, 73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 26; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_008
     * @tc.name  : testDecodeSyncBase64008
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64008", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
      let rarray = new Uint8Array([168, 174, 155, 255]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_DECODE_SYNC_BASE64_009
     * @tc.name  : testDecodeSyncBase64009
     * @tc.desc  : Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeSyncBase64009", 0, function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 6; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_001
     * @tc.name  : testEncodeSyncBase64001
     * @tc.desc  : Asynchronously encodes all bytes in the specified u8 array into the newly
     allocated u8 array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64001", 0, async function () {
      let that = await new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      let rarray = new Uint8Array([99, 122, 69, 122]);
      that.encode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_002
     * @tc.name  : testEncodeSyncBase64002
     * @tc.desc  : Asynchronously encodes all bytes in the specified u8 array into the newly
     allocated u8 array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64002", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      that.encode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_003
     * @tc.name  : testEncodeSyncBase64003
     * @tc.desc  : Asynchronously encodes all bytes in the specified u8 array into the newly
     allocated u8 array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64003", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110, 73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      that.encode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_004
     * @tc.name  : testEncodeSyncBase64004
     * @tc.desc  : Asynchronously encodes all bytes in the specified u8 array into the newly
     allocated u8 array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64004", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([168, 174, 155, 255]);
      let rarray = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
      that.encode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_ENCODE_SYNC_BASE64_005
     * @tc.name  : testEncodeSyncBase64005
     * @tc.desc  : Asynchronously encodes all bytes in the specified u8 array into the newly
     allocated u8 array using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeSyncBase64005", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      that.encode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_BASE64_001
     * @tc.name  : testEncodeToStringBase64001
     * @tc.desc  : Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringBase64001", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([115, 49, 51]);
      that.encodeToString(array).then((val) => {
        expect(val).assertEqual("czEz");
      });
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_BASE64_002
     * @tc.name  : testEncodeToStringBase64002
     * @tc.desc  : Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringBase64002", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.encodeToString(array).then((val) => {
        expect(val).assertEqual("QmFzZTY0IE5vZGUuanM=");
      });
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_BASE64_003
     * @tc.name  : testEncodeToStringBase64003
     * @tc.desc  : Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringBase64003", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110, 73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      that.encodeToString(array).then((val) => {
        expect(val).assertEqual("QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=");
      });
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_BASE64_004
     * @tc.name  : testEncodeToStringBase64004
     * @tc.desc  : Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringBase64004", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([168, 174, 155, 255]);
      that.encodeToString(array).then((val) => {
        expect(val).assertEqual("qK6b/w==");
      });
    });

    /**
     * @tc.number: TEST_ENCODE_TO_STRING_BASE64_005
     * @tc.name  : testEncodeToStringBase64005
     * @tc.desc  : Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEncodeToStringBase64005", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.encodeToString(array).then((val) => {
        expect(val).assertEqual("QmFzZTY0");
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_001
     * @tc.name  : testDecodeBase64001
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64001", 0, async function () {
      let that = new util.Base64Helper();
      let buff = "czEz";
      let array = new Uint8Array([115, 49, 51]);
      that.decode(buff).then((val) => {
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_002
     * @tc.name  : testDecodeBase64002
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64002", 0, async function () {
      let that = new util.Base64Helper();
      let buff = "QmFzZTY0IE5vZGUuanM=";
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.decode(buff).then((val) => {
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_003
     * @tc.name  : testDecodeBase64003
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64003", 0, async function () {
      let that = new util.Base64Helper();
      let buff = "QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=";
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.decode(buff).then((val) => {
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_004
     * @tc.name  : testDecodeBase64004
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64004", 0, async function () {
      let that = new util.Base64Helper();
      let buff = "qK6b/w==";
      let array = new Uint8Array([168, 174, 155, 255]);
      that.decode(buff).then((val) => {
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_005
     * @tc.name  : testDecodeBase64005
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64005", 0, async function () {
      let that = new util.Base64Helper();
      let buff = "QmFzZTY0";
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.decode(buff).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_006
     * @tc.name  : testDecodeBase64006
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64006", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([99, 122, 69, 122]);
      let rarray = new Uint8Array([115, 49, 51]);
      that.decode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_007
     * @tc.name  : testDecodeBase64007
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64007", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.decode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_008
     * @tc.name  : testDecodeBase64008
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64008", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110, 73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.decode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_009
     * @tc.name  : testDecodeBase64009
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64009", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
      let rarray = new Uint8Array([168, 174, 155, 255]);
      that.decode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });

    /**
     * @tc.number: TEST_DECODE_BASE64_010
     * @tc.name  : testDecodeBase64010
     * @tc.desc  : Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testDecodeBase64010", 0, async function () {
      let that = new util.Base64Helper();
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.decode(array).then((val) => {
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i]);
        }
      });
    });
  });
}
