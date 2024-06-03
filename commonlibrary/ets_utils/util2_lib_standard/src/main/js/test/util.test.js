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
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_002
     * @tc.name: test_intersect_002
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_002', 0, function () {
        var result = rangeHp.intersect(rangeHpSec)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_003
     * @tc.name: test_intersect_003
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_003', 0, function () {
        var result = rangeHp.intersect(rangeHpThi)
        expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_004
     * @tc.name: test_intersect_004
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_004', 0, function () {
        var result = rangeHp.intersect(rangeHpFif)
        expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_005
     * @tc.name: test_intersect_005
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_005', 0, function () {
        var result = rangeHp.intersect(rangeHp)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_006
     * @tc.name: test_intersect_006
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_006', 0, function () {
        var result = rangeHp.intersect(tempMiDF, tempMidS)
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_007
     * @tc.name: test_intersect_007
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_007', 0, function () {
        var result = rangeHp.intersect(tempLess, tempMore)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_008
     * @tc.name: test_intersect_008
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_008', 0, function () {
        var result = rangeHp.intersect(tempLess, tempMiDF)
        expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_009
     * @tc.name: test_intersect_009
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_009', 0, function () {
        var result = rangeHp.intersect(tempMiDF, tempMore)
        expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_010
     * @tc.name: test_intersect_010
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_010', 0, function () {
        var result = rangeHp.intersect(tempLower, tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_001
     * @tc.name: test_toString_001
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_001', 0, function () {
        var result = rangeHp.toString()
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_002
     * @tc.name: test_toString_002
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_002', 0, function () {
        var result = rangeHpFir.toString()
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_003
     * @tc.name: test_toString_003
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_003', 0, function () {
        var result = rangeHpSec.toString()
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_004
     * @tc.name: test_toString_004
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_004', 0, function () {
        var result = rangeHpThi.toString()
        expect(result.toString()).assertEqual('[20, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_005
     * @tc.name: test_toString_005
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_005', 0, function () {
        var result = rangeHpFif.toString()
        expect(result.toString()).assertEqual('[35, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_THROW_ERROR_001
     * @tc.name: test_constructor_throwError_001
     * @tc.desc: A constructor used to create a Scope instance with the lower and upper bounds specified.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_constructor_throwError_001', 0, function () {
        try {
            var range = new util.ScopeHelper(1, 2);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 1 must be object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_THROW_ERROR_001
     * @tc.name: test_intersect_throwError_001
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_throwError_001', 0, function () {
        try {
            var result = rangeHp.intersect("str")
            expect(result.toString()).assertEqual('[35, 39]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of str must be ScopeHelper or ScopeType");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_THROW_ERROR_002
     * @tc.name: test_intersect_throwError_002
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_throwError_002', 0, function () {
        try {
            var result = rangeHp.intersect(tempMiDF, 123)
            expect(result.toString()).assertEqual('[35, 39]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be ScopeType");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_THROW_ERROR_001
     * @tc.name: test_expand_throwError_001
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_throwError_001', 0, function () {
        try {
            var result = rangeHp.expand(tempMiDF, "123")
            expect(result.toString()).assertEqual('[30, 40]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be ScopeType");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_THROW_ERROR_002
     * @tc.name: test_expand_throwError_002
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_throwError_002', 0, function () {
        try {
            var result = rangeHp.expand(123)
            expect(result.toString()).assertEqual('[30, 40]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be ScopeHelper or ScopeType");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_THROW_ERROR_001
     * @tc.name: test_contains_throwError_001
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_throwError_001', 0, function () {
        try {
            var result = rangeHp.contains("str")
            expect(result).assertEqual(true)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of str must be object or ScopeHelper");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_THROW_ERROR_001
     * @tc.name: test_clamp_throwError_001
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_throwError_001', 0, function () {
        try {
             var result = rangeHp.clamp(123)
             expect(result.toString()).assertEqual('30')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be object");
        }
    })
})

describe('LRUCacheTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_001
     * @tc.name: testLRUCacheUpdateGetCapacity001
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity001', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(10)
        var result = that.getCapacity()
        expect(result).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_002
     * @tc.name: testLRUCacheUpdateGetCapacity002
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity002', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(2147483646)
        var result = that.getCapacity()
        expect(result).assertEqual(2147483646)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_003
     * @tc.name: testLRUCacheUpdateGetCapacity003
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity003', 0, function () {
        var that = new util.LRUCache(100)
        that.updateCapacity(20)
        var result = that.getCapacity()
        expect(result).assertEqual(20)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_004
     * @tc.name: testLRUCacheUpdateGetCapacity004
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity004', 0, function () {
        var that = new util.LRUCache(50)
        that.updateCapacity(2)
        var result = that.getCapacity()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_005
     * @tc.name: testLRUCacheUpdateGetCapacity005
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity005', 0, function () {
        var that = new util.LRUCache(200)
        that.updateCapacity(100)
        var result = that.getCapacity()
        expect(result).assertEqual(100)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_006
     * @tc.name: testLRUCacheUpdateGetCapacity006
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity006', 0, function () {
        var that = new util.LRUCache(200)
        try {
            that.updateCapacity('a');
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of a must be number');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of a must be number");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_001
     * @tc.name: testLRUCacheGet001
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet001', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        var result = that.get(1)
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_002
     * @tc.name: testLRUCacheGet002
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet002', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        var result = that.get(5)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_003
     * @tc.name: testLRUCacheGet003
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet003', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        var result1 = that.get(20)
        var result2 = that.get('abcd')
        var result3 = that.get(2)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(15)
        expect(result3).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_004
     * @tc.name: testLRUCacheGet004
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet004', 0, function () {
        var that = new util.LRUCache()
        that.put('1111','bcjdshc')
        that.put(20,'cdjcaxb')
        that.put('abcd',15)
        var result1 = that.get('1111')
        var result2 = that.get(20)
        var result3 = that.get('abcd')
        var result4 = that.get(25)
        expect(result1).assertEqual('bcjdshc')
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_005
     * @tc.name: testLRUCacheGet005
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet005', 0, function () {
        var that = new util.LRUCache()
        that.put('1111','bcjdshc')
        that.put(20,'cdjcaxb')
        that.updateCapacity(2)
        that.put('abcd',15)
        var result1 = that.get('1111')
        var result2 = that.get(20)
        var result3 = that.get('abcd')
        var result4 = that.get(25)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_006
     * @tc.name: testLRUCacheGet006
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        that.put(20,'cdjcaxb')
        try {
            var result1 = that.get(un);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_001
     * @tc.name: testLRUCachePut001
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut001', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        expect(temp).assertEqual('bcjdshc')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_002
     * @tc.name: testLRUCachePut002
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut002', 0, function () {
        var that = new util.LRUCache()
        var temp1 = that.put('1111','bcjdshc')
        var temp2 = that.put('1111',13)
        expect(temp2).assertEqual(13)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_003
     * @tc.name: testLRUCachePut003
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut003', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        var temp3 = that.put(2,'adasfdad')
        var temp4 = that.put('abc',10)
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual('adasfdad')
        expect(temp4).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_004
     * @tc.name: testLRUCachePut004
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut004', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        that.updateCapacity(2)
        var temp3 = that.put(2,'adasfdad')
        var temp4 = that.put('1111',10)
        expect(temp).assertEqual('bcjdshc')
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual('adasfdad')
        expect(temp4).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_005
     * @tc.name: testLRUCachePut005
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut005', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        var temp3 = that.put(1,10)
        var temp4 = that.put(2,22)
        var temp5 = that.put(2,30)
        expect(temp).assertEqual('bcjdshc')
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual(10)
        expect(temp4).assertEqual(22)
        expect(temp5).assertEqual(30)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_006
     * @tc.name: testLRUCachePut006
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        try {
            that.put(un,'bcjdshc')
          } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
          }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_001
     * @tc.name: testLRUCacheGetCreateCount001
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCreateCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_002
     * @tc.name: testLRUCacheGetCreateCount002
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCreateCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(6)
        that.get(8)
        that.get(20)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_003
     * @tc.name: testLRUCacheGetCreateCount003
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCreateCount003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.get('abc')
        that.get('cndk')
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_004
     * @tc.name: testLRUCacheGetCreateCount004
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCreateCount004', 0, function () {
        var that = new util.LRUCache()
        that.put(5,2)
        that.put(10,10)
        that.put('abcd','abcd')
        that.get(3)
        that.get(20)
        that.get(12)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_005
     * @tc.name: testLRUCacheGetCreateCount005
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCreateCount005', 0, function () {
        var that = new util.LRUCache()
        that.put('xsjk','bcjds')
        that.put('ajc',10)
        that.put('abcd',15)
        that.get(2)
        that.get(10)
        that.get(30)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_001
     * @tc.name: testLRUCacheGetMissCount001
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMissCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_002
     * @tc.name: testLRUCacheGetMissCount002
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMissCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(5,2)
        that.put(1,10)
        that.put('abcd','bcjsc')
        that.get(2)
        that.get(10)
        that.get(15)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_003
     * @tc.name: testLRUCacheGetMissCount003
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMissCount003', 0, function () {
        var that = new util.LRUCache()
        that.put(10,10)
        that.put(3,20)
        that.put(12,16)
        that.get(1)
        that.get(2)
        that.get(6)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_004
     * @tc.name: testLRUCacheGetMissCount004
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMissCount004', 0, function () {
        var that = new util.LRUCache()
        that.put('acb','asdc')
        that.put('vfb',1)
        that.put('abcd','abcd')
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_005
     * @tc.name: testLRUCacheGetMissCount005
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMissCount005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        that.contains(2)
        that.contains(6)
        var result = that.getMissCount()
        expect(result).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_006
     * @tc.name: testLRUCacheGetMissCount006
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMissCount006', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        var result = that.getMissCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_001
     * @tc.name: testLRUCacheGetRemovalCount001
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetRemovalCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put(3,20)
        that.put(5,30)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_002
     * @tc.name: testLRUCacheGetRemovalCount002
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetRemovalCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(10,2)
        that.put(3,2)
        that.put(15,15)
        that.put(1,20)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_003
     * @tc.name: testLRUCacheGetRemovalCount003
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetRemovalCount003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put('abcd','abcd')
        that.put(3,2)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_004
     * @tc.name: testLRUCacheGetRemovalCount004
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetRemovalCount004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.updateCapacity(2)
        that.put(3,20)
        that.put(5,30)
        var result = that.getRemovalCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_005
     * @tc.name: testLRUCacheGetRemovalCount005
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetRemovalCount005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.updateCapacity(3)
        that.put('string',20)
        that.put('abc',30)
        that.put(10,20)
        var result = that.getRemovalCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_001
     * @tc.name: testLRUCacheGetMatchCount001
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMatchCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_002
     * @tc.name: testLRUCacheGetMatchCount002
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMatchCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(10,2)
        that.put(2,1)
        that.put('abcd',15)
        that.get(10)
        that.get(2)
        that.get('abcd')
        that.get('string')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_003
     * @tc.name: testLRUCacheGetMatchCount003
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMatchCount003', 0, function () {
        var that = new util.LRUCache()
        that.put(0,1)
        that.put(30,10)
        that.put('abcd',15)
        that.get(0)
        that.get(30)
        that.get('abcd')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_004
     * @tc.name: testLRUCacheGetMatchCount004
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMatchCount004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.contains(2)
        that.contains('abcd')
        that.contains(20)
        var result = that.getMatchCount()
        expect(result).assertEqual(5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_005
     * @tc.name: testLRUCacheGetMatchCount005
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMatchCount005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('string','string')
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.get('string')
        that.contains(2)
        that.contains('abcd')
        that.contains('string')
        that.contains(10)
        var result = that.getMatchCount()
        expect(result).assertEqual(7)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_006
     * @tc.name: testLRUCacheGetMatchCount006
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetMatchCount006', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(5)
        var result = that.getMatchCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_001
     * @tc.name: testLRUCacheGetPutCount001
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetPutCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.getPutCount()
        expect(result).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_002
     * @tc.name: testLRUCacheGetPutCount002
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetPutCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(5,3)
        that.put(2,10)
        var result = that.getPutCount()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_003
     * @tc.name: testLRUCacheGetPutCount003
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetPutCount003', 0, function () {
        var that = new util.LRUCache()
        that.put('string',2)
        that.put('abcd',1)
        that.put('ab','a')
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_004
     * @tc.name: testLRUCacheGetPutCount004
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetPutCount004', 0, function () {
        var that = new util.LRUCache()
        that.put('string','string')
        that.put('ac','abc')
        that.put('abcd',15)
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_005
     * @tc.name: testLRUCacheGetPutCount005
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetPutCount005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.updateCapacity(2)
        that.put('abcd','abc')
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_001
     * @tc.name: testLRUCacheGetCapacity001
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity001', 0, function () {
        var that = new util.LRUCache()
        var result = that.getCapacity()
        expect(result).assertEqual(64)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_002
     * @tc.name: testLRUCacheGetCapacity002
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity002', 0, function () {
        var that = new util.LRUCache(2)
        var result = that.getCapacity()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_003
     * @tc.name: testLRUCacheGetCapacity003
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity003', 0, function () {
        var that = new util.LRUCache(100)
        var result = that.getCapacity()
        expect(result).assertEqual(100)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_004
     * @tc.name: testLRUCacheGetCapacity004
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity004', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(50)
        var result = that.getCapacity()
        expect(result).assertEqual(50)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_005
     * @tc.name: testLRUCacheGetCapacity005
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity005', 0, function () {
        var that = new util.LRUCache(100)
        that.updateCapacity(10)
        var result = that.getCapacity()
        expect(result).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_001
     * @tc.name: testLRUCacheLength001
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheLength001', 0, function () {
        var that = new util.LRUCache()
        var result = that.length
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_002
     * @tc.name: testLRUCacheLength002
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheLength002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.length
        expect(result).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_003
     * @tc.name: testLRUCacheLength003
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheLength003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put('string','string')
        var result = that.length
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_004
     * @tc.name: testLRUCacheLength004
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheLength004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('abcd',20)
        var result = that.length
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_005
     * @tc.name: testLRUCacheLength005
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheLength005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('abcd',20)
        that.updateCapacity(3);
        that.put(5,33);
        that.put(25,35);
        var result = that.length
        expect(result).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_001
     * @tc.name: testLRUCacheClear001
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheClear001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(1)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_002
     * @tc.name: testLRUCacheClear002
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheClear002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.put(25,35);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_003
     * @tc.name: testLRUCacheClear003
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheClear003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put(2,'abc')
        that.put('ancd','abcd')
        that.put(10,35)
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_004
     * @tc.name: testLRUCacheClear004
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheClear004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.updateCapacity(3);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(3)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_005
     * @tc.name: testLRUCacheClear005
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheClear005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.put('abcd','string');
        that.updateCapacity(2);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_001
     * @tc.name: testLRUCacheIsEmpty001
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheIsEmpty001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_002
     * @tc.name: testLRUCacheIsEmpty002
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheIsEmpty002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_003
     * @tc.name: testLRUCacheIsEmpty003
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheIsEmpty003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_004
     * @tc.name: testLRUCacheIsEmpty004
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheIsEmpty004', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put('string',10)
        that.put('ab','abc')
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_005
     * @tc.name: testLRUCacheIsEmpty005
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheIsEmpty005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.clear()
        var result = that.isEmpty()
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_001
     * @tc.name: testLRUCacheContains001
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.contains(1)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_002
     * @tc.name: testLRUCacheContains002
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains002', 0, function () {
        var that = new util.LRUCache()
        that.put(0,5)
        var result = that.contains(0)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_003
     * @tc.name: testLRUCacheContains003
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc','abc')
        var result = that.contains(1)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_004
     * @tc.name: testLRUCacheContains004
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put('abcd',20)
        var result1 = that.contains(1)
        var result2 = that.contains(20)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_005
     * @tc.name: testLRUCacheContains005
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put('string','string')
        var result1 = that.contains(1)
        var result2 = that.contains('string')
        var result3 = that.contains(0)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(true)
        expect(result3).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_006
     * @tc.name: testLRUCacheContains006
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains006', 0, function () {
        var that = new util.LRUCache()
        that.put('abc','abc')
        let un = undefined;
        try {
            that.contains(un)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_001
     * @tc.name: testLRUCacheRemove001
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.remove(1)
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_002
     * @tc.name: testLRUCacheRemove002
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put('abcd',20)
        var result1 = that.remove(1)
        var result2 = that.remove('abcd')
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(20)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_003
     * @tc.name: testLRUCacheRemove003
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result1 = that.remove(1)
        var result2 = that.remove(5)
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_004
     * @tc.name: testLRUCacheRemove004
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove004', 0, function () {
        var that = new util.LRUCache()
        that.put(0,'abc')
        that.put('abcd',20)
        var result1 = that.remove(1)
        var result2 = that.remove('abcd')
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(20)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_005
     * @tc.name: testLRUCacheRemove005
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        var result1 = that.remove(1)
        var result2 = that.remove(3)
        var result3 = that.get(3)
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(10)
        expect(result3).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_006
     * @tc.name: testLRUCacheRemove006
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove006', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        let un = undefined;
        try {
            that.remove(un)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_001
     * @tc.name: testLRUCacheCreateDefault001
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault001', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(1)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_002
     * @tc.name: testLRUCacheCreateDefault002
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault002', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(0)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_003
     * @tc.name: testLRUCacheCreateDefault003
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault003', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault('string')
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_004
     * @tc.name: testLRUCacheCreateDefault004
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault004', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(10)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_005
     * @tc.name: testLRUCacheCreateDefault005
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault005', 0, function () {
        var that = new util.LRUCache()
        var result1 = that.createDefault('abc')
        var result2 = that.createDefault('ab')
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_006
     * @tc.name: testLRUCacheCreateDefault006
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        try {
            that.createDefault(un);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_001
     * @tc.name: testLRUCacheKeys001
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheKeys001', 0, function () {
        var that = new util.LRUCache()
        that.put('string','abc')
        var result = that.keys()
        expect(result[0]).assertEqual('string')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_002
     * @tc.name: testLRUCacheKeys002
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheKeys002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(3)
        expect(result[2]).assertEqual(5)
        expect(result[3]).assertEqual('abc')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_003
     * @tc.name: testLRUCacheKeys003
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheKeys003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(5)
        expect(result[2]).assertEqual('abc')
        expect(result[3]).assertEqual(3)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_004
     * @tc.name: testLRUCacheKeys004
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheKeys004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var result = that.keys()
        expect(result[0]).assertEqual(5)
        expect(result[1]).assertEqual('abc')
        expect(result[2]).assertEqual(3)
        expect(result[3]).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_005
     * @tc.name: testLRUCacheKeys005
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
