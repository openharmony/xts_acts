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
import url from '@ohos.url'
import app from '@system.app'
import process from '@ohos.process'
import file from '@system.file';

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
    _temp = 0;
}

class MyClassBase {
    baseBuffer = 'baseData';
    strBuffer = 'intBase';
    setMethod(arg) {
        return arg + 100;
    }
    setBase(arg) {
        this.baseBuffer = arg;
    }
    setData(arg) {
        return arg + 2;
    }
    setBuffer(arg) {
        this.strBuffer = arg;
    }
}
class MyClass extends MyClassBase {
    msg = 'msg123';
    static buffer = 'data';
    static str = 'strData';
    foo(arg1, arg2) {
        return this.msg;
    }
    static bar(arg1) {
        return MyClass.buffer;
    }
    func(arg) {
        return arg;
    }
    async myAsync(arg) {
        return arg;
    }
    myFunc(arg) {
        this.msg = arg;
    }
    static async printData(arg) {
        return 0;
    }
    myFoo() {
        return 0;
    }
    getData(arg) {
        return 0;
    }
    async beforeAsync(arg) {
        return arg;
    }
    static getBar(arg1) {
        return MyClass.str;
    }
    async myBeforeAsync(arg) {
        return arg;
    }
}
class AfterClass extends MyClassBase {
    msg = 'msg123';
    message = 'messageData';
    static buffer = 'data';
    static str = 'strData';
    afterFoo(arg1, arg2) {
        return this.message;
    }
    foo(arg1, arg2) {
        return this.msg;
    }
    static bar(arg1) {
        return AfterClass.buffer;
    }
    func(arg) {
        return arg;
    }
    async myAsync(arg) {
        return arg;
    }
    myFunc(arg) {
        this.msg = arg;
    }
    afterFunc(arg) {
        this.message = arg;
    }
    static async printData(arg) {
        return 0;
    }
    myFoo() {
        return 0;
    }
    getData(arg) {
        return 0;
    }
    async afterAsync(arg) {
        return arg;
    }
    static getBar(arg1) {
        return AfterClass.str;
    }
    async myAfterAsync(arg) {
        return arg;
    }
}
class ReplaceClass extends MyClassBase {
    msg = 'msg123';
    static buffer = 'data';
    static str = 'strData';
    foo(arg1, arg2) {
        return this.msg;
    }
    static bar(arg1) {
        return ReplaceClass.buffer;
    }
    func(arg) {
        return arg;
    }
    async myAsync(arg) {
        return arg;
    }
    myFunc(arg) {
        this.msg = arg;
    }
    static async printData(arg) {
        return 0;
    }
    myFoo() {
        return 0;
    }
    getData(arg) {
        return 0;
    }
    async replaceAsync(arg) {
        return arg;
    }
    static getBar(arg1) {
        return ReplaceClass.str;
    }
}

let tempLower = new Temperature(30);
let tempUpper = new Temperature(40);
let tempLess = new Temperature(20);
let tempMiDF = new Temperature(35);
let tempMidS = new Temperature(39);
let tempMore = new Temperature(45);

let range = new util.Scope(tempLower, tempUpper);
let rangeFir = new util.Scope(tempMiDF, tempMidS);
let rangeSec = new util.Scope(tempLess, tempMore);
let rangeThi = new util.Scope(tempLess, tempMiDF);
let rangeFif = new util.Scope(tempMiDF, tempMore);

function promiseCase() {
  let p = new Promise(function (resolve, reject) {
    setTimeout(function () {
      resolve(0)
    }, 5)
  }).then(undefined, (error) => {
  })
  return p
}

export default function UtilFunTest() {
describe('TextEncoderTest', function () {

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0001
     * @tc.name: testUtilPrintf001
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPrintf001', 0, function () {
      let format = "%i,%s";
      let value1 = 1.5;
      let value2 = "qwer";
      let value3 = 15;
      let result = util.printf(format, value1, value2, value3);
      expect(result).assertEqual("1,qwer 15");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0002
     * @tc.name: testUtilPrintf002
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPrintf002', 0, function () {
      let format = "%O";
      let value = { name: 'jack' ,age: 15 };
      let result = util.printf(format, value);
      expect(result).assertEqual("{ name: 'jack',\n  age: 15 }");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0003
     * @tc.name: testUtilPrintf003
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPrintf003', 0, function () {
      let format = "%o";
      let value = [1, 2, 3];
      let result = util.printf(format, value);
      let res = '[ 1, 2, 3, [length]: 3 ]'
      expect(result).assertEqual('[ 1, 2, 3, [length]: 3 ]');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0004
     * @tc.name: testUtilPrintf004
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPrintf004', 0, function () {
      let format = "%s,%s,%s";
      let value1 = "1.5";
      let value2 = "qwer";
      let result = util.printf(format, value1, value2);
      expect(result).assertEqual('1.5,qwer,%s');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0005
     * @tc.name: testUtilPrintf005
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPrintf005', 0, function () {
      let format = "%d,%d";
      let value1 = 6;
      let value2 = 16;
      let result = util.printf(format, value1, value2);
      expect(result).assertEqual('6,16');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0006
     * @tc.name: testUtilGetErrorString001
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilGetErrorString001', 0, async function () {
      let errnum = 10;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('Unknown system error 10');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0007
     * @tc.name: testUtilGetErrorString002
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilGetErrorString002', 0, async function () {
      let errnum = 0;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('Unknown system error 0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0008
     * @tc.name: testUtilGetErrorString003
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilGetErrorString003', 0, async function () {
      let errnum = -1;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('operation not permitted');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0009
     * @tc.name: testUtilGetErrorString004
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilGetErrorString004', 0, async function () {
      let errnum = 9;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('Unknown system error 9');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0010
     * @tc.name: testUtilGetErrorString005
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilGetErrorString005', 0, async function () {
      let errnum = 555;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('Unknown system error 555');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0011
     * @tc.name: testUtilPromisify_new_001
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromisify_new_001', 0, async function () {
      function fn(val, callback) {
        if (typeof val === 'string') {
          callback(null, val);
        } else {
          callback('type err');
        }
      }
      let value = util.promisify(fn);
      let res = ""
      res = await value("Hello");
      expect(String(res)).assertEqual("Hello");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0012
     * @tc.name: testUtilPromisify_new_002
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromisify_new_002', 0, async function () {
      function fn(str, callback) {
        if (typeof str === 'string') {
          callback(null, str);
        } else {
          callback('type err');
        }
      }
      let value = util.promisify(fn);
      let res;
      let flag = false;
      value([1, 2]).then((d) => {
        flag = true;
        res = d;
      }).catch((e) => {
        flag = true;
        res = e;
      })
      while (!flag) {
        await promiseCase()
      }
      expect(res).assertEqual('type err');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0013
     * @tc.name: testUtilPromisify_new_003
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromisify_new_003', 0, async function () {
      function fn(val, callback) {
        callback(null, val);
      }
      const value = util.promisify(fn);
      let res = 0;
      res = await value(42);
      expect(Number(res)).assertEqual(42);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0014
     * @tc.name: testUtilPromisify_new_004
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromisify_new_004', 0, async function () {
      function fn(val, callback) {
        if (typeof val === 'boolean') {
          callback(null, val);
        } else {
          callback('type err');
        }
      }
      const value = util.promisify(fn);
      expect(Boolean(await value(true))).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0015
     * @tc.name: testUtilPromisify_new_005
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromisify_new_005', 0, async function () {
      function fn(val, callback) {
        if (typeof val === 'number') {
          callback(null, val);
        } else {
          callback('type err');
        }
      }
      const value = util.promisify(fn);
      expect(Number(await value(100))).assertEqual(100);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0016
     * @tc.name: testUtilPromiseWrapper001
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a version that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromiseWrapper001', 0, async function () {
      function aysnFun(str1, str2, callback) {
        if (typeof str1 === 'string' && typeof str1 === 'string') {
          callback(null, str1 + str2);
        } else {
          callback('type err');
        }
      }
      let newPromiseObj = util.promiseWrapper(aysnFun);
      let res = await newPromiseObj("Hello", 'World');
      expect(String(res)).assertEqual('HelloWorld');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0017
     * @tc.name: testUtilPromiseWrapper002
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a version that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromiseWrapper002', 0, async function () {
      function aysnFun(str1, str2, callback) {
        if (typeof str1 === 'string' && typeof str1 === 'string') {
          callback(null, str1 + str2);
        } else {
          callback('type err');
        }
      }
      let newPromiseObj = util.promiseWrapper(aysnFun);
      let res = "";
      let flag = false;
      newPromiseObj([1, 2], 'World').catch((err) => {
        flag = true;
        res = err;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(String(res)).assertEqual('type err');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0018
     * @tc.name: testUtilPromiseWrapper003
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a version that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromiseWrapper003', 0, async function () {
      const thrower = util.promiseWrapper(function(a, b, c, cb) {
        throw new Error("123");
      });
      let res = "";
      let flag = false;
      thrower(1, 2, 3).catch((err) => {
        res = err;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(String(res)).assertEqual("Error: 123");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0019
     * @tc.name: testUtilPromiseWrapper004
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a version that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromiseWrapper004', 0, async function () {
      const err = new Error("123");
      const a = util.promiseWrapper((cb) => cb(err))();
      const b = util.promiseWrapper(() => {throw err;})();
      let res = "";
      let flag = 0;
      Promise.all([
        a.catch((e) => {
          res += e.message;
          flag += 1;
        }),
        b.catch((e) => {
          res += e.message;
          flag += 1;
        })
      ]);
      while(flag != 2) {
        await promiseCase()
      }
      expect(res).assertEqual("123123")
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0020
     * @tc.name: testUtilPromiseWrapper005
     * @tc.desc: Takes a function following the common error-first callback style,
     taking an callback as the last argument, and return a version that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromiseWrapper005', 0, async function () {
      const err = new Error('callback with the error.');
      const stack = err.stack;
      const fn = util.promiseWrapper(function(cb) {
        cb(null, "success");
        cb(err);
      });
      let res = await fn();
      expect(String(res)).assertEqual("success");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0021
     * @tc.name: testUtilPromiseWrapper006
     * @tc.desc: Takes a function following the common error-first callback style,
     taking an callback as the last argument, and return a version that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilPromiseWrapper006', 0, async function () {
      function fn(err, val, callback) {
        callback(err, val);
      }
      const value = await util.promiseWrapper(fn)(null, 42);
      expect(Number(value)).assertEqual(42);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0022
     * @tc.name: testUtilCallbackWrapper001
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilCallbackWrapper001', 0, async function () {
      const promiseFn = [1, 2];
      try {
        util.callbackWrapper(promiseFn);
      } catch(e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of 1,2 must be function');
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0023
     * @tc.name: testUtilCallbackWrapper002
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
     * returns a function following the error-first callback style.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilCallbackWrapper002', 0, async function () {
      async function promiseFn() {
        return Promise.resolve('value');
      }
      let cb = util.callbackWrapper(promiseFn);
      let resErr = ""
      let resRet = ""
      let flag = false
      cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(resErr).assertEqual(null);
      expect(resRet).assertEqual('value');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0024
     * @tc.name: testUtilCallbackWrapper003
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
     * returns a function following the error-first callback style.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilCallbackWrapper003', 0, async function () {
      async function promiseFn() {
        return 42;
      }
      let cb = util.callbackWrapper(promiseFn);
      let resErr = ""
      let resRet = ""
      let flag = false
      cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(resErr).assertEqual(null);
      expect(resRet).assertEqual(42);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0025
     * @tc.name: testUtilCallbackWrapper004
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilCallbackWrapper004', 0, async function () {
      async function promiseFn() {
        let err = Error('value');
        return Promise.reject(err);
      }
      let cb = util.callbackWrapper(promiseFn);
      let resErr;
      let resRet = "";
      let flag = false
      cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(resErr.message).assertEqual('value');
      expect(resRet).assertEqual(undefined);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0026
     * @tc.name: testUtilCallbackWrapper005
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilCallbackWrapper005', 0, async function () {
      async function promiseFn(a, b) {
        return a + b;
      }
      let cb = util.callbackWrapper(promiseFn);
      let resErr;
      let resRet = "";
      let flag = false
      cb(1, 2, (err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(resErr).assertEqual(null);
      expect(resRet).assertEqual(3);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0027
     * @tc.name: testUtilCallbackWrapper006
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
     returns a function following the error-first callback style.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUtilCallbackWrapper006', 0, async function () {
      async function promiseFn() {
        return null;
      }
      let cb = util.callbackWrapper(promiseFn);
      try {
        cb([1, 2]);
      } catch (err) {
        expect(err.message).assertEqual('maybe is not function');
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0028
     * @tc.name: testencoding_textdecoder_001
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_001', 0, function () {
      let  that = new util.TextDecoder('utf-8', { ignoreBOM : true })
      let retStr = that.encoding
      expect(retStr).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0029
     * @tc.name: testencoding_textdecoder_002
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_002', 0, function () {
      let that = new util.TextDecoder('utf-16le')
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16le')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0030
     * @tc.name: testencoding_textdecoder_003
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_003', 0, function () {
      let that = new util.TextDecoder('utf-16be')
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0031
     * @tc.name: testencoding_textdecoder_004
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_004', 0, function () {
      let that = new util.TextDecoder('utf-16be', { ignoreBOM : true })
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0032
     * @tc.name: testencoding_textdecoder_005
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_005', 0, function () {
      let that = new util.TextDecoder('utf-16be', { ignoreBOM : false })
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0033
     * @tc.name: testencoding_textdecoder_006
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_006', 0, function () {
      let that = new util.TextDecoder(undefined);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0034
     * @tc.name: testencoding_textdecoder_007
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_007', 0, function () {
      let that = new util.TextDecoder('utf-8', undefined);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0035
     * @tc.name: testencoding_textdecoder_008
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_008', 0, function () {
      let that = new util.TextDecoder(undefined, {ignoreBOM: true});
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0036
     * @tc.name: testencoding_textdecoder_009
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_009', 0, function () {
      let that = new util.TextDecoder(null);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0037
     * @tc.name: testencoding_textdecoder_010
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_010', 0, function () {
      let that = new util.TextDecoder('utf-8', null);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0038
     * @tc.name: testencoding_textdecoder_011
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textdecoder_011', 0, function () {
      let that = new util.TextDecoder(null, {ignoreBOM: true});
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0039
     * @tc.name: testFatal001
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFatal001', 0, function () {
      let that = new util.TextDecoder('utf-16be', { fatal : true })
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0040
     * @tc.name: testFatal002
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFatal002', 0, function () {
      let that = new util.TextDecoder('utf-16be', { fatal : false })
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0041
     * @tc.name: testFatal003
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFatal003', 0, function () {
      let that = new util.TextDecoder('utf-16be')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0042
     * @tc.name: testFatal004
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFatal004', 0, function () {
      let that = new util.TextDecoder('utf-8')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0043
     * @tc.name: testFatal005
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFatal005', 0, function () {
      let that = new util.TextDecoder('utf-16le')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0044
     * @tc.name: testFatal006
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFatal006', 0, function () {
      let that = new util.TextDecoder('gbk')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0045
     * @tc.name: testFatal007
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFatal007', 0, function () {
      let that = new util.TextDecoder('gb18030')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0046
     * @tc.name: testFatal008
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFatal008', 0, function () {
      let that = new util.TextDecoder('gb2312')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0047
     * @tc.name: testIgnoreBOM001
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIgnoreBOM001', 0, function () {
      let that = new util.TextDecoder('utf-16be', { ignoreBOM : true })
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0048
     * @tc.name: testIgnoreBOM002
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIgnoreBOM002', 0, function () {
      let that = new util.TextDecoder('utf-16be', { ignoreBOM : false })
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0049
     * @tc.name: testIgnoreBOM003
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIgnoreBOM003', 0, function () {
      let that = new util.TextDecoder('utf-16be')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0050
     * @tc.name: testIgnoreBOM004
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIgnoreBOM004', 0, function () {
      let that = new util.TextDecoder('utf-8')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0051
     * @tc.name: testIgnoreBOM005
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIgnoreBOM005', 0, function () {
      let that = new util.TextDecoder('utf-16le')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0052
     * @tc.name: testIgnoreBOM006
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIgnoreBOM006', 0, function () {
      let that = new util.TextDecoder('gbk')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0053
     * @tc.name: testIgnoreBOM007
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIgnoreBOM007', 0, function () {
      let that = new util.TextDecoder('gb18030')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0054
     * @tc.name: testIgnoreBOM008
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testIgnoreBOM008', 0, function () {
      let that = new util.TextDecoder('gb2312')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0055
     * @tc.name: testdecode_testdecode_001
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_001', 0, function () {
      let that = new util.TextDecoder('utf-8');
      let arr = new Uint8Array(3);
      for (let i = 0; i < 3; i++) {
        arr[i] = 0x61 + i;
      }
      let retStr = that.decode(arr);
      let rel = 'abc';
      expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0056
     * @tc.name: testdecode_testdecode_002
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_002', 0, function () {
      let that = new util.TextDecoder('utf-16le')
      let arr = new Uint8Array(6)
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decode(arr)
      let rel = 'abc'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0057
     * @tc.name: testdecode_testdecode_003
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_003', 0, function () {
      let that = new util.TextDecoder('utf-16be');
      let arr = new Uint8Array(6);
      arr[0] = 0x00;
      arr[1] = 0x61;
      arr[2] = 0x00;
      arr[3] = 0x62;
      arr[4] = 0x00;
      arr[5] = 0x63;
      let retStr = that.decode(arr);
      let rel = 'abc'
      expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0058
     * @tc.name: testdecode_testdecode_004
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_004', 0, function () {
      let that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
      let arr = new Uint8Array(6)
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decode(arr, {stream:false})
      let BOM = '\uFEFF'
      let rel = 'abc'
      let re = BOM + rel
      expect(retStr).assertEqual(re);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0059
     * @tc.name: testdecode_testdecode_005
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_005', 0, function () {
      let that = new util.TextDecoder('utf-16le', { ignoreBOM : false })
      let arr = new Uint8Array(8)
      arr[0] = 0xFF;
      arr[1] = 0xFE;
      arr[2] = 0x61;
      arr[3] = 0x00;
      arr[4] = 0x62;
      arr[5] = 0x00
      arr[6] = 0x63;
      arr[7] = 0x00;
      let retStr = that.decode(arr, { stream : false })
      let BOM = '\uFEFF'
      let rel = 'abc'
      let re = BOM + rel
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0060
     * @tc.name: testdecode_testdecode_006
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_006', 0, function () {
      let that = new util.TextDecoder('gbk')
      let arr = new Uint8Array(8)
      arr[0] = 0xC4;
      arr[1] = 0xE3;
      arr[2] = 0xBA;
      arr[3] = 0xC3;
      arr[4] = 0xCA;
      arr[5] = 0xC0;
      arr[6] = 0xBD;
      arr[7] = 0xE7;
      let retStr = that.decode(arr)
      let rel = '你好世界'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0061
     * @tc.name: testdecode_testdecode_007
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_007', 0, function () {
      let that = new util.TextDecoder('gb18030')
      let arr = new Uint8Array(8)
      arr[0] = 0xC4;
      arr[1] = 0xE3;
      arr[2] = 0xBA;
      arr[3] = 0xC3;
      arr[4] = 0xCA;
      arr[5] = 0xC0;
      arr[6] = 0xBD;
      arr[7] = 0xE7;
      let retStr = that.decode(arr)
      let rel = '你好世界'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0062
     * @tc.name: testdecode_testdecode_008
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_008', 0, function () {
      let that = new util.TextDecoder('gb2312')
      let arr = new Uint8Array(8)
      arr[0] = 0xC4;
      arr[1] = 0xE3;
      arr[2] = 0xBA;
      arr[3] = 0xC3;
      arr[4] = 0xCA;
      arr[5] = 0xC0;
      arr[6] = 0xBD;
      arr[7] = 0xE7;
      let retStr = that.decode(arr)
      let rel = '你好世界'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0063
     * @tc.name: testdecode_testdecode_009
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_009', 0, function () {
      let that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
      let arr = new Uint8Array(6)
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decode(arr, undefined)
      let BOM = '\uFEFF'
      let rel = 'abc'
      let res = BOM + rel
      expect(retStr).assertEqual(res);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0064
     * @tc.name: testdecode_testdecode_010
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testdecode_testdecode_010', 0, function () {
      let that = new  util.TextDecoder('utf-8', { ignoreBOM : true });
      let arr = new Uint8Array(6);
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decode(arr, null);
      let BOM = '\uFEFF'
      let rel = 'abc'
      let res = BOM + rel
      expect(retStr).assertEqual(res);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0065
     * @tc.name: decodeWithStream001
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream001', 0, function () {
      let that = new util.TextDecoder('utf-16le', { ignoreBOM : false });
      let arr = new Uint8Array(8)
      arr[0] = 0xFF;
      arr[1] = 0xFE;
      arr[2] = 0x61;
      arr[3] = 0x00;
      arr[4] = 0x62;
      arr[5] = 0x00;
      arr[6] = 0x63;
      arr[7] = 0x00;
      let retStr = that.decodeWithStream(arr, { stream : false });
      let BOM = '\uFEFF';
      let rel = 'abc';
      let re = BOM + rel;
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0066
     * @tc.name: decodeWithStream002
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream002', 0, function () {
      let that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
      let arr = new Uint8Array(6)
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decodeWithStream(arr, {stream:true})
      let BOM = '\uFEFF'
      let rel = 'abc'
      let re = BOM + rel;
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0067
     * @tc.name: decodeWithStream003
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream003', 0, function () {
      let that = new util.TextDecoder('utf-16be');
      let arr = new Uint8Array(6);
      arr[0] = 0x00;
      arr[1] = 0x61;
      arr[2] = 0x00;
      arr[3] = 0x62;
      arr[4] = 0x00;
      arr[5] = 0x63;
      let retStr = that.decodeWithStream(arr);
      let rel = 'abc'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0068
     * @tc.name: decodeWithStream004
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream004', 0, function () {
      let that = new util.TextDecoder('utf-16le')
      let arr = new Uint8Array(6)
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decodeWithStream(arr);
      let rel = 'abc'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0069
     * @tc.name: decodeWithStream005
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream005', 0, function () {
      let that = new util.TextDecoder('utf-8');
      let arr = new Uint8Array(3);
      for (let i = 0; i < 3; i++) {
        arr[i] = 0x61 + i;
      }
      let retStr = that.decodeWithStream(arr);
      let rel = 'abc';
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0070
     * @tc.name: decodeWithStream006
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream006', 0, function () {
      let that = new util.TextDecoder('utf-16le')
      let arr = new Uint8Array(6)
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decodeWithStream(arr, undefined);
      let rel = 'abc'
      expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0071
     * @tc.name: decodeWithStream007
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream007', 0, function () {
      let that = new util.TextDecoder('utf-16le')
      let arr = new Uint8Array(6)
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decodeWithStream(arr, null);
      let rel = 'abc'
      expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0072
     * @tc.name: testencoding_textencoder_001
     * @tc.desc: Encoding format.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textencoder_001', 0, function () {
      let that = new util.TextEncoder()
      let str = that.encoding
      expect(str).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0073
     * @tc.name: testencoding_textencoder_002
     * @tc.desc: Encoding format test gb18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textencoder_002', 0, function () {
      let that = new util.TextEncoder('gb18030')
      let str = that.encoding
      expect(str).assertEqual('gb18030')
      that = new util.TextEncoder('GB18030')
      str = that.encoding;
      expect(str).assertEqual('GB18030')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0074
     * @tc.name: testencoding_textencoder_003
     * @tc.desc: Encoding format test gbk.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textencoder_003', 0, function () {
      let that = new util.TextEncoder('gbk')
      let str = that.encoding
      expect(str).assertEqual('gbk')
      that = new util.TextEncoder('GBK')
      str = that.encoding;
      expect(str).assertEqual('GBK')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0075
     * @tc.name: testencoding_textencoder_004
     * @tc.desc: Encoding format test gb2313.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textencoder_004', 0, function () {
      let that = new util.TextEncoder('gb2312')
      let str = that.encoding
      expect(str).assertEqual('gb2312')
      that = new util.TextEncoder('GB2312')
      str = that.encoding;
      expect(str).assertEqual('GB2312')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0076
     * @tc.name: testencoding_textencoder_005
     * @tc.desc: The TextEncoder construction parameter is undefined or null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencoding_textencoder_005', 0, function () {
      let encode1 = new util.TextEncoder(undefined)
      let str1 = encode1.encoding
      expect(str1).assertEqual('utf-8')
      let encode2 = new util.TextEncoder(null)
      let str2 = encode2.encoding
      expect(str2).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0077
     * @tc.name: testEncode001
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode001', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc')
      expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0078
     * @tc.name: testEncode002
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode002', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('\uD800楼楼')
      expect(result[5]).assertEqual(188)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0079
     * @tc.name: testEncode003
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode003', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('a\uD800楼楼')
      expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0080
     * @tc.name: testEncode004
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode004', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc\uD800楼楼')
      expect(result[1]).assertEqual(0x62)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0081
     * @tc.name: testEncode005
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode005', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('123\uD800楼楼')
      expect(result[0]).assertEqual(49)
      expect(result[9]).assertEqual(230)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0082
     * @tc.name: testEncode006
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode006', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('123¥\uD800楼')
      expect(result[10]).assertEqual(0xbc)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0083
     * @tc.name: testEncode007
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode007', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('¥¥')
      expect(result[0]).assertEqual(0xc2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0084
     * @tc.name: testEncode008
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode008', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('$$')
      expect(result[0]).assertEqual(0x24)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0085
     * @tc.name: testEncode009
     * @tc.desc: Returns the result of encoder for gb18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode009', 0, function () {
      let that = new util.TextEncoder('gb18030')
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc哈哈熠熠')
      expect(result[0]).assertEqual(97)
      expect(result[3]).assertEqual(185)
      expect(result[4]).assertEqual(254)
      expect(result[7]).assertEqual(236)
      expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0086
     * @tc.name: testEncode010
     * @tc.desc: Returns the result of encoder for GB18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode0010', 0, function () {
      let that = new util.TextEncoder('GB18030')
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc哈哈熠熠')
      expect(result[0]).assertEqual(97)
      expect(result[3]).assertEqual(185)
      expect(result[4]).assertEqual(254)
      expect(result[7]).assertEqual(236)
      expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0087
     * @tc.name: testEncode011
     * @tc.desc: Returns the result of encoder for GB18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode0011', 0, function () {
      let that = new util.TextEncoder('GBK')
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc哈哈熠熠')
      expect(result[0]).assertEqual(97)
      expect(result[3]).assertEqual(185)
      expect(result[4]).assertEqual(254)
      expect(result[7]).assertEqual(236)
      expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0088
     * @tc.name: testEncode012
     * @tc.desc: Returns the result of encoder for gbk.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode012', 0, function () {
      let that = new util.TextEncoder('gbk')
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc哈哈熠熠')
      expect(result[0]).assertEqual(97)
      expect(result[3]).assertEqual(185)
      expect(result[4]).assertEqual(254)
      expect(result[7]).assertEqual(236)
      expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0089
     * @tc.name: testEncode013
     * @tc.desc: Returns the result of encoder for gb2312.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode013', 0, function () {
      let that = new util.TextEncoder('gb2312')
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc哈哈熠熠')
      expect(result[0]).assertEqual(97)
      expect(result[3]).assertEqual(185)
      expect(result[4]).assertEqual(254)
      expect(result[7]).assertEqual(236)
      expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0090
     * @tc.name: testEncode014
     * @tc.desc: Returns the result of encoder for gb2312.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode014', 0, function () {
      let that = new util.TextEncoder('GB2312')
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc哈哈熠熠')
      expect(result[0]).assertEqual(97)
      expect(result[3]).assertEqual(185)
      expect(result[4]).assertEqual(254)
      expect(result[7]).assertEqual(236)
      expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0091
     * @tc.name: testEncode015
     * @tc.desc: Returns the result of encoder for gb2312, input long string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode015', 0, function () {
      let that = new util.TextEncoder('GB18030')
      let buffer = new ArrayBuffer(900)
      let result = new Uint8Array(buffer)
      result = that.encode('abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈')
      expect(result[6]).assertEqual(185)
      expect(result[30]).assertEqual(97)
      expect(result[57]).assertEqual(254)
      expect(result[98]).assertEqual(185)
      expect(result[119]).assertEqual(254)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0092
     * @tc.name: testEncode016
     * @tc.desc: The encode parameter is undefined or null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncode016', 0, function () {
      let that = new util.TextEncoder()
      let result1 = that.encode(undefined)
      expect(result1).assertEqual(undefined)
      let result2 = that.encode(null)
      expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0093
     * @tc.name: testEncodeInto001
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto001', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let dest = new Uint8Array(buffer, 0, 13)
      let result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
      expect(result.read).assertEqual(7)
      expect(result.written).assertEqual(13)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0094
     * @tc.name: testEncodeInto002
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto002', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(6)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('abc\u2603d', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(6)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0095
     * @tc.name: testEncodeInto003
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto003', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('abcd', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0096
     * @tc.name: testEncodeInto004
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto004', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('12345', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0097
     * @tc.name: testEncodeInto005
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto005', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('123 4*!@#', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0098
     * @tc.name: testEncodeInto006
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto006', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('', dest)
      expect(result.read).assertEqual(0)
      expect(result.written).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0099
     * @tc.name: testEncodeInto007
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto007', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('12ab', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0100
     * @tc.name: testEncodeInto008
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto008', 0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let dest = new Uint8Array(buffer, 0, 0)
      let result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
      expect(result.read).assertEqual(0)
      expect(result.written).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0101
     * @tc.name: testEncodeInto001
     * @tc.desc: The encodeInto parameter is undefined or null
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEncodeInto009', 0, function () {
      let that = new util.TextEncoder()
      let result1 = that.encodeInto(undefined)
      expect(result1).assertEqual(undefined)
      let result2 = that.encodeInto(null)
      expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0102
     * @tc.name: testTextDecoderCreate_Options_001
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextDecoderCreate_Options_001', 0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : true
      }
      let  that = util.TextDecoder.create('utf-8', textDecoderOptions)
      let retStr = that.encoding
      expect(retStr).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0103
     * @tc.name: testTextDecoderCreate_Options_002
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextDecoderCreate_Options_002', 0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : false
      }
      let that = util.TextDecoder.create('utf-16be', textDecoderOptions)
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0104
     * @tc.name: testTextDecoderCreate_Options_003
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextDecoderCreate_Options_003', 0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : false
      }
      let that = util.TextDecoder.create(undefined, textDecoderOptions)
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0105
     * @tc.name: testTextDecoderCreate_Options_004
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTextDecoderCreate_Options_004', 0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : true
      }
      let that = util.TextDecoder.create(undefined, textDecoderOptions);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0106
     * @tc.name: decodeWithStream_Options_001
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream_Options_001', 0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : false
      }
      let decodeWithStreamOptions = util.DecodeWithStreamOptions = {
        stream: false
      }
      let that = util.TextDecoder.create('utf-16le', textDecoderOptions);
      let arr = new Uint8Array(8)
      arr[0] = 0xFF;
      arr[1] = 0xFE;
      arr[2] = 0x61;
      arr[3] = 0x00;
      arr[4] = 0x62;
      arr[5] = 0x00;
      arr[6] = 0x63;
      arr[7] = 0x00;
      let retStr = that.decodeWithStream(arr, decodeWithStreamOptions);
      let BOM = '\uFEFF';
      let rel = 'abc';
      let re = BOM + rel;
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0107
     * @tc.name: decodeWithStream_Options_002
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('decodeWithStream_Options_002', 0, function () {
      let textDecoderOptions =  util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : true
      }
      let decodeWithStreamOptions = util.DecodeWithStreamOptions = {
        stream: true
      }
      let that = util.TextDecoder.create('utf-8', textDecoderOptions);
      let arr = new Uint8Array(6)
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decodeWithStream(arr, decodeWithStreamOptions)
      let BOM = '\uFEFF'
      let rel = 'abc'
      let re = BOM + rel;
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0108
     * @tc.name: testencodeIntoUint8Array_Info_001
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencodeIntoUint8Array_Info_001', 0, function () {
      let encodeIntoUint8ArrayInfo = util.EncodeIntoUint8ArrayInfo
      encodeIntoUint8ArrayInfo = {
        read: 0,
        written: 0
      }
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(6)
      let dest = new Uint8Array(buffer)
      encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('abc\u2603d', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(4)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(6)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.name: testencodeIntoUint8Array_Info_002
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testencodeIntoUint8Array_Info_002', 0, function () {
      let encodeIntoUint8ArrayInfo = util.EncodeIntoUint8ArrayInfo = {
        read: 0,
        written: 0
      }
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(0)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(0)
    })
  })

  describe('ScopeTest', function () {

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0001
     * @tc.name: test_getLower_001
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getLower_001', 0, function () {
      let result = range.getLower()
      expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0002
     * @tc.name: test_getLower_002
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getLower_002', 0, function () {
      let result = rangeFir.getLower()
      expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0003
     * @tc.name: test_getLower_003
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getLower_003', 0, function () {
      let result = rangeSec.getLower()
      expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0004
     * @tc.name: test_getLower_004
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getLower_004', 0, function () {
      let result = rangeThi.getLower()
      expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0005
     * @tc.name: test_getLower_005
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getLower_005', 0, function () {
      let result = rangeFif.getLower()
      expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0006
     * @tc.name: test_getUpper_001
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getUpper_001', 0, function () {
      let result = range.getUpper()
      expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0007
     * @tc.name: test_getUpper_002
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getUpper_002', 0, function () {
      let result = rangeFir.getUpper()
      expect(result.toString()).assertEqual('39')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0008
     * @tc.name: test_getUpper_003
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getUpper_003', 0, function () {
      let result = rangeSec.getUpper()
      expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0009
     * @tc.name: test_getUpper_004
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getUpper_004', 0, function () {
      let result = rangeThi.getUpper()
      expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0010
     * @tc.name: test_getUpper_005
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_getUpper_005', 0, function () {
      let result = rangeFif.getUpper()
      expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0011
     * @tc.name: test_clamp_001
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_clamp_001', 0, function () {
      let result =range.clamp(tempLess)
      expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0012
     * @tc.name: test_clamp_002
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_clamp_002', 0, function () {
      let result =range.clamp(tempMiDF)
      expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0013
     * @tc.name: test_clamp_003
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_clamp_003', 0, function () {
      let result =range.clamp(tempMore)
      expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0014
     * @tc.name: test_clamp_004
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_clamp_004', 0, function () {
      let result =range.clamp(tempLower)
      expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0015
     * @tc.name: test_clamp_005
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_clamp_005', 0, function () {
      let result =range.clamp(tempUpper)
      expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0016
     * @tc.name: test_contains_001
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_001', 0, function () {
      let result = range.contains(tempLess)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0017
     * @tc.name: test_contains_002
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_002', 0, function () {
      let result = range.contains(tempMiDF)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0018
     * @tc.name: test_contains_003
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_003', 0, function () {
      let result = range.contains(tempMore)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0019
     * @tc.name: test_contains_004
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_004', 0, function () {
      let result = range.contains(tempLower)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0020
     * @tc.name: test_contains_005
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_005', 0, function () {
      let result = range.contains(tempUpper)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0021
     * @tc.name: test_contains_006
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_006', 0, function () {
      let result = range.contains(rangeFir)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0022
     * @tc.name: test_contains_007
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_007', 0, function () {
      let result = range.contains(rangeSec)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0023
     * @tc.name: test_contains_008
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_008', 0, function () {
      let result = range.contains(rangeThi)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0024
     * @tc.name: test_contains_009
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_009', 0, function () {
      let result = range.contains(rangeFif)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0025
     * @tc.name: test_contains_010
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_contains_010', 0, function () {
      let result = range.contains(range)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0026
     * @tc.name: test_expand_001
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_001', 0, function () {
      let result = range.expand(tempMiDF, tempMidS)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0027
     * @tc.name: test_expand_002
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_002', 0, function () {
      let result = range.expand(tempLess, tempMore)
      expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0028
     * @tc.name: test_expand_003
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_003', 0, function () {
      let result = range.expand(tempLess, tempMiDF)
      expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0029
     * @tc.name: test_expand_004
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_004', 0, function () {
      let result = range.expand(tempMiDF, tempMore)
      expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0030
     * @tc.name: test_expand_005
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_005', 0, function () {
      let result = range.expand(tempLower, tempUpper)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0031
     * @tc.name: test_expand_006
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_006', 0, function () {
      let result = range.expand(rangeFir)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0032
     * @tc.name: test_expand_007
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_007', 0, function () {
      let result = range.expand(rangeSec)
      expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0033
     * @tc.name: test_expand_008
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_008', 0, function () {
      let result = range.expand(rangeThi)
      expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0034
     * @tc.name: test_expand_009
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_009', 0, function () {
      let result = range.expand(rangeFif)
      expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0035
     * @tc.name: test_expand_010
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_010', 0, function () {
      let result = range.expand(range)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0036
     * @tc.name: test_expand_011
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_011', 0, function () {
      let result = range.expand(tempMiDF)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0037
     * @tc.name: test_expand_012
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_012', 0, function () {
      let result = range.expand(tempLess)
      expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0038
     * @tc.name: test_expand_013
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_013', 0, function () {
      let result = range.expand(tempMore)
      expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0039
     * @tc.name: test_expand_014
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_014', 0, function () {
      let result = range.expand(tempLower)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0040
     * @tc.name: test_expand_015
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_expand_015', 0, function () {
      let result = range.expand(tempUpper)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0041
     * @tc.name: test_intersect_001
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_intersect_001', 0, function () {
      let result = range.intersect(rangeFir)
      expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0042
     * @tc.name: test_intersect_002
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_intersect_002', 0, function () {
      let result = range.intersect(rangeSec)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0043
     * @tc.name: test_intersect_003
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_intersect_003', 0, function () {
      let result = range.intersect(rangeThi)
      expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0044
     * @tc.name: test_intersect_004
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_intersect_004', 0, function () {
      let result = range.intersect(rangeFif)
      expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0045
     * @tc.name: test_intersect_005
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_intersect_005', 0, function () {
      let result = range.intersect(range)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0046
     * @tc.name: test_intersect_006
     * @tc.desc: Returns the intersection of the current range and the range specified by
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     the given lower and upper bounds.
     */
    it('test_intersect_006', 0, function () {
      let result = range.intersect(tempMiDF, tempMidS)
      expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0047
     * @tc.name: test_intersect_007
     * @tc.desc: Returns the intersection of the current range and the range specified by
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     the given lower and upper bounds.
     */
    it('test_intersect_007', 0, function () {
      let result = range.intersect(tempLess, tempMore)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0048
     * @tc.name: test_intersect_008
     * @tc.desc: Returns the intersection of the current range and the range specified by
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     the given lower and upper bounds.
     */
    it('test_intersect_008', 0, function () {
      let result = range.intersect(tempLess, tempMiDF)
      expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0049
     * @tc.name: test_intersect_009
     * @tc.desc: Returns the intersection of the current range and the range specified by
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     the given lower and upper bounds.
     */
    it('test_intersect_009', 0, function () {
      let result = range.intersect(tempMiDF, tempMore)
      expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0050
     * @tc.name: test_intersect_010
     * @tc.desc: Returns the intersection of the current range and the range specified by
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     the given lower and upper bounds.
     */
    it('test_intersect_010', 0, function () {
      let result = range.intersect(tempLower, tempUpper)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0051
     * @tc.name: test_toString_001
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_toString_001', 0, function () {
      let result = range.toString()
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0052
     * @tc.name: test_toString_002
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_toString_002', 0, function () {
      let result = rangeFir.toString()
      expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0053
     * @tc.name: test_toString_003
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_toString_003', 0, function () {
      let result = rangeSec.toString()
      expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0054
     * @tc.name: test_toString_004
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_toString_004', 0, function () {
      let result = rangeThi.toString()
      expect(result.toString()).assertEqual('[20, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0055
     * @tc.name: test_toString_005
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_toString_005', 0, function () {
      let result = rangeFif.toString()
      expect(result.toString()).assertEqual('[35, 45]')
    })
  })

  describe('Base64Test', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0001
     * @tc.name: test_encodeSync_base64_001
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_001', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([115,49,51]);
      let rarray = new Uint8Array([99,122,69,122]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0002
     * @tc.name: test_encodeSync_base64_002
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_002', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 20; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0003
     * @tc.name: test_encodeSync_base64_003
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_003', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,
        110,32,78,111,100,101,46,106,115]);
      let rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,
        73,71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 36; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0004
     * @tc.name: test_encodeSync_base64_004
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_004', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([168, 174, 155, 255]);
      let rarray = new Uint8Array([113,75,54,98,47,119,61,61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 8; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0005
     * @tc.name: test_encodeSync_base64_005
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_005', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let result = that.encodeSync(array);
      for (let i = 0; i <8; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0006
     * @tc.name: test_encodeToStringSync_base64_001
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToStringSync_base64_001', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([115,49,51]);
      let result = that.encodeToStringSync(array)
      expect(result).assertEqual('czEz')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0007
     * @tc.name: test_encodeToStringSync_base64_002
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToStringSync_base64_002', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual('QmFzZTY0IE5vZGUuanM=')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0008
     * @tc.name: test_encodeToStringSync_base64_003
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToStringSync_base64_003', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,
        32,78,111,100,101,46,106,115]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0009
     * @tc.name: test_encodeToStringSync_base64_004
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToStringSync_base64_004', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([168, 174, 155, 255]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual('qK6b/w==')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0010
     * @tc.name: test_encodeToStringSync_base64_005
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToStringSync_base64_005', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual('QmFzZTY0')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0011
     * @tc.name: test_decodeSync_base64_001
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_001', 0, function () {
      let that = new util.Base64()
      let buff = 'czEz';
      let rarray = new Uint8Array([115,49,51]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 3; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0012
     * @tc.name: test_decodeSync_base64_002
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_002', 0, function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0IE5vZGUuanM=';
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 14; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0013
     * @tc.name: test_decodeSync_base64_003
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_003', 0, function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
      let rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,
        105,110,32,78,111,100,101,46,106,115]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 26; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0014
     * @tc.name: test_decodeSync_base64_004
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_004', 0, function () {
      let that = new util.Base64()
      let buff = 'qK6b/w==';
      let rarray = new Uint8Array([168, 174, 155, 255]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0015
     * @tc.name: test_decodeSync_base64_005
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_005', 0, function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0';
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.decodeSync(buff);
      for (let i = 0; i <6; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0016
     * @tc.name: test_decodeSync_base64_006
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_006', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([99,122,69,122]);
      let rarray = new Uint8Array([115,49,51]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 3; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0017
     * @tc.name: test_decodeSync_base64_007
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_007', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 14; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0018
     * @tc.name: test_decodeSync_base64_008
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_008', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,
        53,110,73,71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
      let rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,
        110,32,78,111,100,101,46,106,115]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 26; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0019
     * @tc.name: test_decodeSync_base64_009
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_009', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([113,75,54,98,47,119,61,61]);
      let rarray = new Uint8Array([168, 174, 155, 255]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0020
     * @tc.name: test_decodeSync_base64_010
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decodeSync_base64_010', 0, function () {
      let that = new util.Base64()
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.decodeSync(array);
      for (let i = 0; i <6; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    //base64 EncodeAsync test
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0021
     * @tc.name: test_encodeAsync_base64_001
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly
     allocated u8 array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeAsync_base64_001', 0, async function () {
      let that = await new util.Base64();
      let array = new Uint8Array([115,49,51]);
      let rarray = new Uint8Array([99,122,69,122]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0022
     * @tc.name: test_encodeAsync_base64_002
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly
     allocated u8 array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeAsync_base64_002', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0023
     * @tc.name: test_encodeAsync_base64_003
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeAsync_base64_003', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,
        78,111,100,101,46,106,115]);
      let rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,
        71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0024
     * @tc.name: test_encodeAsync_base64_004
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeAsync_base64_004', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([168, 174, 155, 255]);
      let rarray = new Uint8Array([113,75,54,98,47,119,61,61]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0025
     * @tc.name: test_encodeAsync_base64_005
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeAsync_base64_005', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0026
     * @tc.name: test_encodeToString_base64_001
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToString_base64_001', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([115,49,51]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('czEz')
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0027
     * @tc.name: test_encodeToString_base64_002
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToString_base64_002', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('QmFzZTY0IE5vZGUuanM=')
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0028
     * @tc.name: test_encodeToString_base64_003
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToString_base64_003', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,71,108,
        117,73,69,53,118,90,71,85,117,97,110,77,61]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0029
     * @tc.name: test_encodeToString_base64_004
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToString_base64_004', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([168, 174, 155, 255]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('qK6b/w==')
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0030
     * @tc.name: test_encodeToString_base64_005
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_encodeToString_base64_005', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('QmFzZTY0')
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0031
     * @tc.name: test_decode_base64_001
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_001', 0, async function () {
      let that = new util.Base64()
      let buff = 'czEz';
      let array = new Uint8Array([115,49,51]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0032
     * @tc.name: test_decode_base64_002
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_002', 0, async function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0IE5vZGUuanM=';
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0033
     * @tc.name: test_decode_base64_003
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_003', 0, async function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
      let array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,78,
        111,100,101,46,106,115]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0034
     * @tc.name: test_decode_base64_004
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_004', 0, async function () {
      let that = new util.Base64()
      let buff = 'qK6b/w==';
      let array = new Uint8Array([168, 174, 155, 255]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0035
     * @tc.name: test_decode_base64_005
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_005', 0, async function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0';
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0036
     * @tc.name: test_decode_base64_006
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_006', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([99,122,69,122]);
      let rarray = new Uint8Array([115,49,51]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0037
     * @tc.name: test_decode_base64_007
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_007', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0038
     * @tc.name: test_decode_base64_008
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_008', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,71,108,
        117,73,69,53,118,90,71,85,117,97,110,77,61]);
      let rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,78,111,
        100,101,46,106,115]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0039
     * @tc.name: test_decode_base64_009
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8 array
     into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_009', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([113,75,54,98,47,119,61,61]);
      let rarray = new Uint8Array([168, 174, 155, 255]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_BASE64_0040
     * @tc.name: test_decode_base64_010
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_decode_base64_010', 0, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })
  })

  describe('RationalNumberFunTest', function () {

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0001
     * @tc.name: test_createRationalFromString_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_createRationalFromString_001', 0, function () {
      let res = util.RationalNumber.createRationalFromString('-1:2')
      let result1 = res.valueOf()
      expect(result1).assertEqual(-0.5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0002
     * @tc.name: test_createRationalFromString_002
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_createRationalFromString_002', 0, function () {
      let res = util.RationalNumber.createRationalFromString('+3/4')
      let result1 = res.valueOf()
      expect(result1).assertEqual(0.75)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0003
     * @tc.name: test_createRationalFromString_003
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_createRationalFromString_003', 0, function () {
      let res = util.RationalNumber.createRationalFromString('+3:-4')
      let result1 = res.valueOf()
      expect(result1).assertEqual(-0.75)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0004
     * @tc.name: test_createRationalFromString_004
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_createRationalFromString_004', 0, function () {
      let res = util.RationalNumber.createRationalFromString('+2:4')
      let result1 = res.valueOf()
      expect(result1).assertEqual(0.5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0005
     * @tc.name: test_createRationalFromString_005
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_createRationalFromString_005', 0, function () {
      let res = util.RationalNumber.createRationalFromString('-2:-4')
      let result1 = res.valueOf()
      expect(result1).assertEqual(0.5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0006
     * @tc.name: test_compareTo_001
     * @tc.desc: Compares the current RationalNumber object with a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('test_compareTo_001', 0, function () {
      let pro = new util.RationalNumber(2, 1)
      let proc = new util.RationalNumber(3, 4)
      let res = pro.compareTo(proc)
      expect(res).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0007
