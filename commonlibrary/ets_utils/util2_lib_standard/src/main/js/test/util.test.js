/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import util from '@ohos.util'

class Temperature {
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
var tempLower = new Temperature(30);
var tempUpper = new Temperature(40);
var tempLess = new Temperature(20);
var tempMiDF = new Temperature(35);
var tempMidS = new Temperature(39);
var tempMore = new Temperature(45);

var rangeHp = new util.ScopeHelper(tempLower, tempUpper);
var rangeHpFir = new util.ScopeHelper(tempMiDF, tempMidS);
var rangeHpSec = new util.ScopeHelper(tempLess, tempMore);
var rangeHpThi = new util.ScopeHelper(tempLess, tempMiDF);
var rangeHpFif = new util.ScopeHelper(tempMiDF, tempMore);

export default function UtilFunTest() {
describe('TextEncoderTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_001
     * @tc.name: testIsNumberObject001
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject001', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(0));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_002
     * @tc.name: testIsNumberObject002
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(10));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_003
     * @tc.name: testIsNumberObject003
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(200));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_004
     * @tc.name: testIsNumberObject004
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(0);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_005
     * @tc.name: testIsNumberObject005
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(100);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_001
     * @tc.name: testIsPromise001
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise001', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(42));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_002
     * @tc.name: testIsPromise002
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise002', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(33));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_003
     * @tc.name: testIsPromise003
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise003', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(44));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_004
     * @tc.name: testIsPromise004
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise004', 0, function() {
        var proc = new util.types();
        var err = Error(33);
        var result = proc.isPromise(Promise.reject(err));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_005
     * @tc.name: testIsPromise005
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise005', 0, function() {
        var proc = new util.types();
        var err = Error(23);
        var result = proc.isPromise(Promise.reject(err));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_001
     * @tc.name: testIsProxy001
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsProxy001', 0, function() {
        var proc = new util.types();
        const target = {};
        const proxy = new Proxy(target, {});
        var result = proc.isProxy(proxy);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_002
     * @tc.name: testIsProxy002
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsProxy002', 0, function() {
        var proc = new util.types();
        const target = {};
        const proxy = new Proxy(target, {});
        var result = proc.isProxy(target);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_003
     * @tc.name: testIsProxy003
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsProxy003', 0, function() {
        var proc = new util.types();
        const handler = {
            get: function(obj, prop) {
                return prop in obj ? obj[prop] : 37;
            }
        };
        const p = new Proxy({}, handler);
        var result = proc.isProxy(p);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_004
     * @tc.name: testIsProxy004
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsProxy004', 0, function() {
        var proc = new util.types();
        const handler = {
            get: function(obj, prop) {
                return prop in obj ? obj[prop] : 121;
            }
        };
        const p = new Proxy({}, handler);
        var result = proc.isProxy(p);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_005
     * @tc.name: testIsProxy005
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsProxy005', 0, function() {
        var proc = new util.types();
        const handler = {
            get: function(obj, prop) {
                return prop in obj ? obj[prop] : 121;
            }
        };
        const p = new Proxy({}, handler);
        var result = proc.isProxy(handler);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_001
     * @tc.name: testIsRegExp001
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp001', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('abc'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_002
     * @tc.name: testIsRegExp002
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp002', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(/abc/);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_003
     * @tc.name: testIsRegExp003
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp003', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('fgd'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_004
     * @tc.name: testIsRegExp004
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp004', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('123'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_005
     * @tc.name: testIsRegExp005
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp005', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp(/ab+c/, 'i'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_001
     * @tc.name: testIsSet001
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet001', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Set());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_002
     * @tc.name: testIsSet002
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet002', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_003
     * @tc.name: testIsSet003
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet003', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_004
     * @tc.name: testIsSet004
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet004', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Boolean());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_005
     * @tc.name: testIsSet005
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet005', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new WeakSet());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_001
     * @tc.name: testIsSetIterator001
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator001', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.keys());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_002
     * @tc.name: testIsSetIterator002
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator002', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.values());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_003
     * @tc.name: testIsSetIterator003
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator003', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.entries());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_004
     * @tc.name: testIsSetIterator004
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator004', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set[Symbol.iterator]());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_005
     * @tc.name: testIsSetIterator005
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator005', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_001
     * @tc.name: testIsSharedArrayBuffer001
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer001', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new SharedArrayBuffer([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_002
     * @tc.name: testIsSharedArrayBuffer002
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer002', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_003
     * @tc.name: testIsSharedArrayBuffer003
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer003', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_004
     * @tc.name: testIsSharedArrayBuffer004
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer004', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new ArrayBuffer([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_005
     * @tc.name: testIsSharedArrayBuffer005
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer005', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_001
     * @tc.name: testIsStringObject001
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject001', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('foo'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_002
     * @tc.name: testIsStringObject002
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('twoo'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_003
     * @tc.name: testIsStringObject003
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('fdfsfd'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_004
     * @tc.name: testIsStringObject004
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject('ffds111');
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_005
     * @tc.name: testIsStringObject005
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject('foo');
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_001
     * @tc.name: testIsSymbolObject001
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject001', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('foo');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_002
     * @tc.name: testIsSymbolObject002
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject002', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('s12');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_003
     * @tc.name: testIsSymbolObject003
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject003', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('sads');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_004
     * @tc.name: testIsSymbolObject004
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject004', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('asdd');
        var result = proc.isSymbolObject(symbols);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_005
     * @tc.name: testIsSymbolObject005
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject005', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('foo');
        var result = proc.isSymbolObject(symbols);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_001
     * @tc.name: testIsTypedArray001
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray001', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Float64Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_002
     * @tc.name: testIsTypedArray002
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray002', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint8Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_003
     * @tc.name: testIsTypedArray003
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray003', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint16Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_004
     * @tc.name: testIsTypedArray004
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray004', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint32Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_005
     * @tc.name: testIsTypedArray005
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray005', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new ArrayBuffer());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_001
     * @tc.name: testIsUint8Array001
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint8Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_002
     * @tc.name: testIsUint8Array002
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_003
     * @tc.name: testIsUint8Array003
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_004
     * @tc.name: testIsUint8Array004
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_005
     * @tc.name: testIsUint8Array005
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_001
     * @tc.name: testIsUint8ClampedArray001
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Uint8ClampedArray([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_002
     * @tc.name: testIsUint8ClampedArray002
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_003
     * @tc.name: testIsUint8ClampedArray003
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_004
     * @tc.name: testIsUint8ClampedArray004
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_005
     * @tc.name: testIsUint8ClampedArray005
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_001
     * @tc.name: testIsUint16Array001
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint16Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_002
     * @tc.name: testIsUint16Array002
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_003
     * @tc.name: testIsUint16Array003
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_004
     * @tc.name: testIsUint16Array004
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint8ClampedArray([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_005
     * @tc.name: testIsUint16Array005
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_001
     * @tc.name: testIsUint32Array001
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint32Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_002
     * @tc.name: testIsUint32Array002
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_003
     * @tc.name: testIsUint32Array003
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_004
     * @tc.name: testIsUint32Array004
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_005
     * @tc.name: testIsUint32Array005
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint8ClampedArray([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_001
     * @tc.name: testIsWeakMap001
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap001', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new WeakMap());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_002
     * @tc.name: testIsWeakMap002
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap002', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_003
     * @tc.name: testIsWeakMap003
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap003', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new Set());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_004
     * @tc.name: testIsWeakMap004
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap004', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_005
     * @tc.name: testIsWeakMap005
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap005', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new WeakSet());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_001
     * @tc.name: testIsWeakSet001
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet001', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new WeakSet());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_002
     * @tc.name: testIsWeakSet002
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet002', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new WeakMap());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_003
     * @tc.name: testIsWeakSet003
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet003', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_004
     * @tc.name: testIsWeakSet004
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet004', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new Set());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_005
     * @tc.name: testIsWeakSet005
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet005', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_UUID_001
     * @tc.name: testUtilRandomUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomUUID001', 0, async function () {
        var result = util.randomUUID(true);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_UUID_002
     * @tc.name: testUtilRandomUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomUUID002', 0, async function () {
        var result = util.randomUUID(false);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_BINARY_UUID_001
     * @tc.name: testUtilRandomBinaryUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomBinaryUUID001', 0, async function () {
        var result = util.randomBinaryUUID(true);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_BINARY_UUID_002
     * @tc.name: testUtilRandomBinaryUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomBinaryUUID002', 0, async function () {
        var result = util.randomBinaryUUID(false);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_001
     * @tc.name: testUtilParseUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID001', 0, async function () {
        var result = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_002
     * @tc.name: testUtilParseUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID002', 0, async function () {
        try {
            var result = util.parseUUID('84df796-66cc-4655-9b89-d6218d100f9c');
        } catch(e) {
            expect(e.message).assertEqual('Syntax Error.Invalid 84df796-66cc-4655-9b89-d6218d100f9c string');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_003
     * @tc.name: testUtilParseUUID003
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID003', 0, async function () {
        try {
            var result = util.parseUUID('84Wdf796-66cc-4655-9b89-d6218d100f9c');
        } catch(e) {
            expect(e.message).assertEqual('Syntax Error.Invalid 84Wdf796-66cc-4655-9b89-d6218d100f9c string');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_UUID_001
     * @tc.name: testUtilgenerateRandomUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomUUID001', 0, async function () {
        var result = util.generateRandomUUID(true);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_UUID_002
     * @tc.name: testUtilgenerateRandomUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomUUID002', 0, async function () {
        var result = util.generateRandomUUID(false);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_UUID_003
     * @tc.name: testUtilgenerateRandomUUID003
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomUUID003', 0, async function () {
        let sum = 0
        for (let i = 0; i < 10; i++) {
          let result = util.generateRandomUUID(true);
          if (result.length === 36) {
            sum++;
          }
        }
        expect(sum).assertEqual(10);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_BINARY_UUID_001
     * @tc.name: testUtilgenerateRandomBinaryUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomBinaryUUID001', 0, async function () {
        var result = util.generateRandomBinaryUUID(true);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_BINARY_UUID_002
     * @tc.name: testUtilgenerateRandomBinaryUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomBinaryUUID002', 0, async function () {
        var result = util.generateRandomBinaryUUID(false);
        expect(result.length).assertEqual(16);
    })
})

describe('ScopeHelperTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_001
     * @tc.name: test_getLower_001
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_001', 0, function () {
        var result = rangeHp.getLower()
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_002
     * @tc.name: test_getLower_002
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_002', 0, function () {
        var result = rangeHpFir.getLower()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_003
     * @tc.name: test_getLower_003
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_003', 0, function () {
        var result = rangeHpSec.getLower()
        expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_004
     * @tc.name: test_getLower_004
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_004', 0, function () {
        var result = rangeHpThi.getLower()
        expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_005
     * @tc.name: test_getLower_005
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_005', 0, function () {
        var result = rangeHpFif.getLower()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_001
     * @tc.name: test_getUpper_001
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_001', 0, function () {
        var result = rangeHp.getUpper()
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_002
     * @tc.name: test_getUpper_002
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_002', 0, function () {
        var result = rangeHpFir.getUpper()
        expect(result.toString()).assertEqual('39')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_003
     * @tc.name: test_getUpper_003
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_003', 0, function () {
        var result = rangeHpSec.getUpper()
        expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_004
     * @tc.name: test_getUpper_004
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_004', 0, function () {
        var result = rangeHpThi.getUpper()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_005
     * @tc.name: test_getUpper_005
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_005', 0, function () {
        var result = rangeHpFif.getUpper()
        expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_001
     * @tc.name: test_clamp_001
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_001', 0, function () {
        var result = rangeHp.clamp(tempLess)
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_002
     * @tc.name: test_clamp_002
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_002', 0, function () {
        var result = rangeHp.clamp(tempMiDF)
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_003
     * @tc.name: test_clamp_003
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_003', 0, function () {
        var result = rangeHp.clamp(tempMore)
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_004
     * @tc.name: test_clamp_004
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_004', 0, function () {
        var result = rangeHp.clamp(tempLower)
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_005
     * @tc.name: test_clamp_005
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_005', 0, function () {
        var result = rangeHp.clamp(tempUpper)
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_001
     * @tc.name: test_contains_001
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_001', 0, function () {
        var result = rangeHp.contains(tempLess)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_002
     * @tc.name: test_contains_002
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_002', 0, function () {
        var result = rangeHp.contains(tempMiDF)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_003
     * @tc.name: test_contains_003
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_003', 0, function () {
        var result = rangeHp.contains(tempMore)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_004
     * @tc.name: test_contains_004
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_004', 0, function () {
        var result = rangeHp.contains(tempLower)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_005
     * @tc.name: test_contains_005
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_005', 0, function () {
        var result = rangeHp.contains(tempUpper)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_006
     * @tc.name: test_contains_006
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_006', 0, function () {
        var result = rangeHp.contains(rangeHpFir)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_007
     * @tc.name: test_contains_007
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_007', 0, function () {
        var result = rangeHp.contains(rangeHpSec)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_008
     * @tc.name: test_contains_008
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_008', 0, function () {
        var result = rangeHp.contains(rangeHpThi)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_009
     * @tc.name: test_contains_009
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_009', 0, function () {
        var result = rangeHp.contains(rangeHpFif)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_010
     * @tc.name: test_contains_010
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_010', 0, function () {
        var result = rangeHp.contains(rangeHp)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_001
     * @tc.name: test_expand_001
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_001', 0, function () {
        var result = rangeHp.expand(tempMiDF, tempMidS)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_002
     * @tc.name: test_expand_002
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_002', 0, function () {
        var result = rangeHp.expand(tempLess, tempMore)
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_003
     * @tc.name: test_expand_003
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_003', 0, function () {
        var result = rangeHp.expand(tempLess, tempMiDF)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_004
     * @tc.name: test_expand_004
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_004', 0, function () {
        var result = rangeHp.expand(tempMiDF, tempMore)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_005
     * @tc.name: test_expand_005
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_005', 0, function () {
        var result = rangeHp.expand(tempLower, tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_006
     * @tc.name: test_expand_006
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_006', 0, function () {
        var result = rangeHp.expand(rangeHpFir)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_007
     * @tc.name: test_expand_007
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_007', 0, function () {
        var result = rangeHp.expand(rangeHpSec)
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_008
     * @tc.name: test_expand_008
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_008', 0, function () {
        var result = rangeHp.expand(rangeHpThi)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_009
     * @tc.name: test_expand_009
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_009', 0, function () {
        var result = rangeHp.expand(rangeHpFif)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_010
     * @tc.name: test_expand_010
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_010', 0, function () {
        var result = rangeHp.expand(rangeHp)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_011
     * @tc.name: test_expand_011
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_011', 0, function () {
        var result = rangeHp.expand(tempMiDF)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_012
     * @tc.name: test_expand_012
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_012', 0, function () {
        var result = rangeHp.expand(tempLess)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_013
     * @tc.name: test_expand_013
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_013', 0, function () {
        var result = rangeHp.expand(tempMore)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_014
     * @tc.name: test_expand_014
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_014', 0, function () {
        var result = rangeHp.expand(tempLower)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_015
     * @tc.name: test_expand_015
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_015', 0, function () {
        var result = rangeHp.expand(tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_001
     * @tc.name: test_intersect_001
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_001', 0, function () {
        var result = rangeHp.intersect(rangeHpFir)
