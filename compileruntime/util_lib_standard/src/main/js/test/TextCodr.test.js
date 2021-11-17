/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import util from '@ohos.util'
describe('TextEncoderTest', function () {
    /**
     * @tc.name: testUtilPrintf001
     * @tc.desc: Returns the formatted string.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPrintf001', 0, function () {
        var format = "%i,%s";
        var value1 = 1.5;
        var value2 = "qwer";
        var value3 = 15;
        var result = util.printf(format, value1, value2, value3);
        expect(result).assertEqual("1,qwer 15");
    })

    /**
     * @tc.name: testUtilPrintf002
     * @tc.desc: Returns the formatted string.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPrintf002', 0, function () {
        var format = "%O";
        var value = { name: 'jack' ,age: 15 };
        var result = util.printf(format, value);
        expect(result).assertEqual("{ name: 'jack',\n  age: 15 }");
    })

    /**
     * @tc.name: testUtilPrintf003
     * @tc.desc: Returns the formatted string.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPrintf003', 0, function () {
        var format = "%o";
        var value = [1, 2, 3];
        var result = util.printf(format, value);
        var res = '[ 1, 2, 3, [length]: 3 ]'
        expect(result).assertEqual('[ 1, 2, 3, [length]: 3 ]');
    })

    /**
     * @tc.name: testUtilPrintf004
     * @tc.desc: Returns the formatted string.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPrintf004', 0, function () {
        var format = "%s,%s,%s";
        var value1 = "1.5";
        var value2 = "qwer";
        var result = util.printf(format, value1, value2);
        expect(result).assertEqual('1.5,qwer,%s');
    })

    /**
     * @tc.name: testUtilPrintf005
     * @tc.desc: Returns the formatted string.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPrintf005', 0, function () {
        var format = "%d,%d";
        var value1 = 6;
        var value2 = 16;
        var result = util.printf(format, value1, value2);
        expect(result).assertEqual('6,16');
    })

    /**
     * @tc.name: testUtilGetErrorString001
     * @tc.desc: Get the string name of the system errno.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilGetErrorString001', 0, async function () {
        var errnum = 10;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('No child process');
    })

    /**
     * @tc.name: testUtilGetErrorString002
     * @tc.desc: Get the string name of the system errno.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilGetErrorString002', 0, async function () {
        var errnum = 0;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('No error information');
    })

    /**
     * @tc.name: testUtilGetErrorString003
     * @tc.desc: Get the string name of the system errno.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilGetErrorString003', 0, async function () {
        var errnum = -1;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('No error information');
    })

    /**
     * @tc.name: testUtilGetErrorString004
     * @tc.desc: Get the string name of the system errno.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilGetErrorString004', 0, async function () {
        var errnum = 9;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('Bad file descriptor');
    })

    /**
     * @tc.name: testUtilGetErrorString005
     * @tc.desc: Get the string name of the system errno.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilGetErrorString005', 0, async function () {
        var errnum = 555;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('No error information');
    })

    /**
     * @tc.name: testUtilPromiseWrapper001
     * @tc.desc: Takes a function following the common error-first callback style, taking an callback as the last argument, and return a version that returns promises.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPromiseWrapper001', 0, async function () {
        function aysnFun(str1, str2, callback) {
            if (typeof str1 === 'string' && typeof str1 === 'string') {
                callback(null, str1 + str2);
            } else {
                callback('type err');
            }
        }
        let newPromiseObj = util.promiseWrapper(aysnFun)("Hello", 'World');
        newPromiseObj.then(res => {
            expect(res).strictEqual('HelloWorld');
        })
    })

    /**
     * @tc.name: testUtilPromiseWrapper002
     * @tc.desc: Takes a function following the common error-first callback style, taking an callback as the last argument, and return a version that returns promises.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPromiseWrapper002', 0, async function () {
        function aysnFun(str1, str2, callback) {
            if (typeof str1 === 'string' && typeof str1 === 'string') {
                callback(null, str1 + str2);
            } else {
                callback('type err');
            }
        }
        let newPromiseObj = util.promiseWrapper(aysnFun)([1, 2], 'World');
        newPromiseObj.catch(err => {
            expect(err).strictEqual('type err');
        })
    })

    /**
     * @tc.name: testUtilPromiseWrapper003
     * @tc.desc: Takes a function following the common error-first callback style, taking an callback as the last argument, and return a version that returns promises.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPromiseWrapper003', 0, async function () {
        const a = util.promiseWrapper(function() {})();
        const b = util.promiseWrapper(function() {})();
        expect(a).assertInstanceOf('Promise');
        expect(b).assertInstanceOf('Promise');

    })

    /**
     * @tc.name: testUtilPromiseWrapper004
     * @tc.desc: Takes a function following the common error-first callback style, taking an callback as the last argument, and return a version that returns promises.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPromiseWrapper004', 0, async function () {
        let errToThrow;
        const thrower = util.promiseWrapper(function(a, b, c, cb) {
            errToThrow = new Error();
            throw errToThrow;
        });
        thrower(1, 2, 3).catch(err => {
            expect(err).strictEqual(errToThrow);
        })
    })

    /**
     * @tc.name: testUtilPromiseWrapper005
     * @tc.desc: Takes a function following the common error-first callback style, taking an callback as the last argument, and return a version that returns promises.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPromiseWrapper005', 0, async function () {
        const err = new Error();
        const a = util.promiseWrapper((cb) => cb(err))();
        const b = util.promiseWrapper(() => {throw err;})();
        Promise.all([
            a.then(e => {
                expect(e).strictEqual(err);
            }),
            b.then(e => {
                expect(e).strictEqual(err);
            })
        ]);
    })

    /**
     * @tc.name: testUtilPromiseWrapper006
     * @tc.desc: Takes a function following the common error-first callback style, taking an callback as the last argument, and return a version that returns promises.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPromiseWrapper006', 0, async function () {
        const err = new Error('callback with the error.');
        const stack = err.stack;
        const fn = util.promiseWrapper(function(cb) {
            cb(null);
            cb(err);
        });
        (async () => {
            await fn();
            await Promise.resolve();
            return expect(stack).strictEqual(err.stack);
        })();
    })

    /**
     * @tc.name: testUtilPromiseWrapper007
     * @tc.desc: Takes a function following the common error-first callback style, taking an callback as the last argument, and return a version that returns promises.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilPromiseWrapper007', 0, async function () {
        function fn(err, val, callback) {
            callback(err, val);
        }
        (async () => {
            const value = await util.promiseWrapper(fn)(null, 42);
            expect(value).strictEqual(42);
        })();
    })

    /**
     * @tc.name: testUtilCallbackWrapper001
     * @tc.desc: Takes an async function (or a function that returns a Promise) and returns a function following the error-first callback style.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilCallbackWrapper001', 0, async function () {
        const promiseFn = [1, 2];
        try {
            util.callbackWrapper(promiseFn);
        } catch(e) {
            console.info('util_callbackWrapper_test_001 ' + e.message)
            expect(e.message).assertEqual('original is not function');
        }
    })


    /**
     * @tc.name: testUtilCallbackWrapper002
     * @tc.desc: Takes an async function (or a function that returns a Promise) and returns a function following the error-first callback style.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilCallbackWrapper002', 0, async function () {
        async function promiseFn() {
            return Promise.resolve('value');
        };
        var cb = util.callbackWrapper(promiseFn);
        cb((err, ret) => {
            expect(err).strictEqual(null);
            expect(ret).strictEqual('value');
        })
    })

    /**
     * @tc.name: testUtilCallbackWrapper003
     * @tc.desc: Takes an async function (or a function that returns a Promise) and returns a function following the error-first callback style.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilCallbackWrapper003', 0, async function () {
        async function promiseFn() {
            return 42;
        };
        var cb = util.callbackWrapper(promiseFn);
        cb((err, ret) => {
            expect(err).strictEqual(null);
            expect(ret).strictEqual(42);
        })
    })

    /**
     * @tc.name: testUtilCallbackWrapper004
     * @tc.desc: Takes an async function (or a function that returns a Promise) and returns a function following the error-first callback style.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilCallbackWrapper004', 0, async function () {
        async function promiseFn() {
            return Promise.reject('value');
        };
        var cb = util.callbackWrapper(promiseFn);
        cb((err, ret) => {
            expect(err).strictEqual('value');
            expect(ret).strictEqual(undefined);
        })
    })

    /**
     * @tc.name: testUtilCallbackWrapper005
     * @tc.desc: Takes an async function (or a function that returns a Promise) and returns a function following the error-first callback style.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilCallbackWrapper005', 0, async function (done) {
        async function promiseFn(a, b) {
            return a + b;
        };
        var cb = util.callbackWrapper(promiseFn);
        cb(1, 2, (err, ret) => {
            expect(err).assertEqual(null);
            expect(ret).assertEqual(3);
            done()
        })
    })

    /**
     * @tc.name: testUtilCallbackWrapper006
     * @tc.desc: Takes an async function (or a function that returns a Promise) and returns a function following the error-first callback style.
     * @tc.require: AR000GFB4U
     * @tc.author: shikai
     */
    it('testUtilCallbackWrapper006', 0, async function () {
        async function promiseFn(a, b) {
            return a + b;
        };
        try {
            var cb = util.callbackWrapper(promiseFn);
            cb([1, 2])
            console.info('')
        } catch(err) {
            console.info('util_callbackWrapper_test_006 ' + err.message)
            expect(err.message).assertEqual('maybe is not function');
        }
    })


    /**
     * @tc.name: testEncoding001
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncoding001', 0, function () {
        var  that = new util.TextDecoder('utf-8', { ignoreBOM : true })
        var retStr = that.encoding
        expect(retStr).assertEqual('utf-8')
    })

    /**
     * @tc.name: testEncoding002
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncoding002', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16le')
    })

    /**
     * @tc.name: testEncoding003
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncoding003', 0, function () {
        var that = new util.TextDecoder('utf-16be')
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name: testEncoding004
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncoding004', 0, function () {
        var that = new util.TextDecoder('utf-16be', { ignoreBOM : true })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name: testEncoding005
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncoding005', 0, function () {
        var that = new util.TextDecoder('utf-16be', { ignoreBOM : false })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })


    /**
     * @tc.name: testFatal001
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testFatal001', 0, function () {
        var that = new util.TextDecoder('utf-16be', { fatal : true })
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(true)
    })

    /**
     * @tc.name: testFatal002
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testFatal002', 0, function () {
        var that = new util.TextDecoder('utf-16be', { fatal : false })
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal003
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testFatal003', 0, function () {
        var that = new util.TextDecoder('utf-16be')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal004
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testFatal004', 0, function () {
        var that = new util.TextDecoder('utf-8')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal005
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testFatal005', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM001
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testIgnoreBOM001', 0, function () {
        var that = new util.TextDecoder('utf-16be', { ignoreBOM : true })
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(true)
    })

    /**
     * @tc.name: testIgnoreBOM002
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testIgnoreBOM002', 0, function () {
        var that = new util.TextDecoder('utf-16be', { ignoreBOM : false })
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM003
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testIgnoreBOM003', 0, function () {
        var that = new util.TextDecoder('utf-16be')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM004
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testIgnoreBOM004', 0, function () {
        var that = new util.TextDecoder('utf-8')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM005
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testIgnoreBOM005', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })


    /**
     * @tc.name: testDecode001
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testDecode001', 0, function () {
        var that = new util.TextDecoder('utf-8');
        var arr = new Uint8Array(3);
        for (var i = 0; i < 3; i++) {
            arr[i] = 0x61 + i;
        }
        var retStr = that.decode(arr);
        var rel = 'abc';
        expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.name: testDecode002
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testDecode002', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var arr = new Uint8Array(6)
        arr[0] = 0x61;
        arr[1] = 0x00;
        arr[2] = 0x62;
        arr[3] = 0x00;
        arr[4] = 0x63;
        arr[5] = 0x00;
        var retStr = that.decode(arr)
        var rel = 'abc'
        expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name: testDecode003
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testDecode003', 0, function () {
        var that = new util.TextDecoder('utf-16be');
        var arr = new Uint8Array(6);
        arr[0] = 0x00;
        arr[1] = 0x61;
        arr[2] = 0x00;
        arr[3] = 0x62;
        arr[4] = 0x00;
        arr[5] = 0x63;
        var retStr = that.decode(arr);
        var rel = 'abc'
        expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.name: testDecode004
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testDecode004', 0, function () {
        var that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
        var arr = new Uint8Array(6)
        arr[0] = 0xEF;
        arr[1] = 0xBB;
        arr[2] = 0xBF;
        arr[3] = 0x61;
        arr[4] = 0x62;
        arr[5] = 0x63;
        var retStr = that.decode(arr, {stream:true})
        var BOM = '\uFEFF'
        var rel = 'abc'
        var re = BOM + rel
        expect(retStr).assertEqual(re);
    })

    /**
     * @tc.name: testDecode005
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testDecode005', 0, function () {
        var that = new util.TextDecoder('utf-16le', { ignoreBOM : false })
        var arr = new Uint8Array(8)
        arr[0] = 0xFF;
        arr[1] = 0xFE;
        arr[2] = 0x61;
        arr[3] = 0x00;
        arr[4] = 0x62;
        arr[5] = 0x00
        arr[6] = 0x63;
        arr[7] = 0x00;
        var retStr = that.decode(arr, { stream : false })
        var BOM = '\uFEFF'
        var rel = 'abc'
        var re = BOM + rel
        expect(retStr).assertEqual(re)
    })
    
    /**
     * @tc.name: testGetEncoding001
     * @tc.desc: Encoding format.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testGetEncoding001', 0, function () {
        var that = new util.TextEncoder()
        var str = that.encoding
        expect(str).assertEqual('utf-8')
    })

    /**
     * @tc.name: testEncode001
     * @tc.desc: Returns the result of encoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncode001', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('abc')
        expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.name: testEncode002
     * @tc.desc: Returns the result of encoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncode002', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('\uD800楼楼')
        expect(result[5]).assertEqual(188)
    })

    /**
     * @tc.name: testEncode003
     * @tc.desc: Returns the result of encoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncode003', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('a\uD800楼楼')
        expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.name: testEncode004
     * @tc.desc: Returns the result of encoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncode004', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('abc\uD800楼楼')
        expect(result[1]).assertEqual(0x62)
    })

    /**
     * @tc.name: testEncode005
     * @tc.desc: Returns the result of encoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncode005', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('123\uD800楼楼')
        expect(result[0]).assertEqual(49)
        expect(result[9]).assertEqual(230)
    })

    /**
     * @tc.name: testEncode006
     * @tc.desc: Returns the result of encoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncode006', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('123¥\uD800楼')
        expect(result[10]).assertEqual(0xbc)
    })

    /**
     * @tc.name: testEncode007
     * @tc.desc: Returns the result of encoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncode007', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('¥¥')
        expect(result[0]).assertEqual(0xc2)
    })

    /**
     * @tc.name: testEncode008
     * @tc.desc: Returns the result of encoder.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncode008', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('$$')
        expect(result[0]).assertEqual(0x24)
    })

    /**
     * @tc.name: testEncodeInto001
     * @tc.desc: encode string, write the result to dest array.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncodeInto001', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 13)
        var result = new Uint32Array(20)
        result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(7)
        expect(result.written).assertEqual(13)
    })

    /**
     * @tc.name: testEncodeInto002
     * @tc.desc: encode string, write the result to dest array.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncodeInto002', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(6)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('abc\u2603d', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(6)
    })

    /**
     * @tc.name: testEncodeInto003
     * @tc.desc: encode string, write the result to dest array.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncodeInto003', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('abcd', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testEncodeInto004
     * @tc.desc: encode string, write the result to dest array.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncodeInto004', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('12345', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testEncodeInto005
     * @tc.desc: encode string, write the result to dest array.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncodeInto005', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('123 4*!@#', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testEncodeInto006
     * @tc.desc: encode string, write the result to dest array.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncodeInto006', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('', dest)
        expect(result.read).assertEqual(0)
        expect(result.written).assertEqual(0)
    })

    /**
     * @tc.name: testEncodeInto007
     * @tc.desc: encode string, write the result to dest array.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncodeInto007', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer)
        var result = new Uint32Array(20)
        result = that.encodeInto('12ab', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testEncodeInto008
     * @tc.desc: encode string, write the result to dest array.
     * @tc.require: AR000GFB4U
     * @tc.author: wangben
     */
    it('testEncodeInto008', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 0)
        var result = new Uint32Array(20)
        result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(0)
        expect(result.written).assertEqual(0)
    })
})