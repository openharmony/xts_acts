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
import  Url from '@ohos.url'
export default function UrlFunTest() {
describe('UrlFunTest', function () {
    
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00100
   * @tc.name: testParamsAppend001
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append('ma','jk')
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2&ma=jk')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00200
   * @tc.name: testParamsAppend002
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend002', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00300
   * @tc.name: testParamsAppend003
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend003', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00400
   * @tc.name: testParamsAppend004
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.append("app","par")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&app=par")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00500
   * @tc.name: testParamsAppend005
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.append("123","456")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&123=456")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00600
   * @tc.name: testParamsAppend006
   * @tc.desc: Appends throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend006', 0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2')
            let params = new Url.URLParams(that.search)
            params.append(123,"456")
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of 123 must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual("Parameter error.The type of 123 must be string");
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00700
   * @tc.name: testParamsAppend007
   * @tc.desc: Appends throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend007', 0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2')
            let params = new Url.URLParams(that.search)
            var a = '123'
            var b = undefined;
            params.append(a, b)
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00800
   * @tc.name: testParamsDelete001
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete001', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.delete("foo")
        var result = params.toString()
        expect(result).assertEqual("bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00900
   * @tc.name: testParamsDelete002
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete002', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete('foo');
        var result = params.toString();
        expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01000
   * @tc.name: testParamsDelete003
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete003', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete("foo大");
        var result = params.toString();
        expect(result).assertEqual("bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01100
   * @tc.name: testParamsDelete004
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete('bar');
        var result = params.toString();
        expect(result).assertEqual("foo=1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01200
   * @tc.name: testParamsDelete005
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete("faa");
        var result = params.toString();
        expect(result).assertEqual("foo=1&bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01300
   * @tc.name: testParamsDelete006
   * @tc.desc: Deletes throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete006', 0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2');
            let params = new Url.URLParams(that.search);
            params.delete();
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${arguments[0]} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${arguments[0]} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01400
   * @tc.name: testParamsDelete007
   * @tc.desc: Deletes throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete007', 0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2');
            let params = new Url.URLParams(that.search);
            params.delete(4);
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of 4 must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of 4 must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01500
   * @tc.name: testNewURLParams001
   * @tc.desc: The input parameter for New URLParams is undefined or null.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testNewURLParams001', 0, function () {
        let params = new Url.URLParams(undefined);
        let result = params.toString();
        expect(result).assertEqual('');
        let params1 = new Url.URLParams(null);
        let result1 = params1.toString();
        expect(result1).assertEqual('');
    })
    
   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01600
   * @tc.name: testParamsEntries001
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2");

        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[1]).assertEqual("value1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01700
   * @tc.name: testParamsEntries002
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries002', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[2]).assertEqual("key2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01800
   * @tc.name: testParamsEntries003
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("foo","jk")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[5]).assertEqual("jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01900
   * @tc.name: testParamsEntries004
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries004', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[3]).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02000
   * @tc.name: testParamsEntries005
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries005', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("jss","txt")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[4]).assertEqual("jss")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02100
   * @tc.name: testParams[Symbol.iterator]001
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2");
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[1]).assertEqual("value1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02200
   * @tc.name: testParams[Symbol.iterator]002
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]002', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[2]).assertEqual("key2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02300
   * @tc.name: testParams[Symbol.iterator]003
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("foo","jk")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[5]).assertEqual("jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02400
   * @tc.name: testParams[Symbol.iterator]004
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]004', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[3]).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02500
   * @tc.name: testParams[Symbol.iterator]005
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]005', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("jss","txt")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[4]).assertEqual("jss")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02600
   * @tc.name: testParamsForEach001
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[0]).assertEqual("value1 key1 true");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02700
   * @tc.name: testParamsForEach002
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach002', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[1]).assertEqual("value2 key2 true");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02800
   * @tc.name: testParamsForEach003
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2");
        params.append("foo","jk");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[2]).assertEqual("jk foo true");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02900
   * @tc.name: testParamsForEach004
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach004', 0, function () {
        let params = new Url.URLParams("foo=bar&jss=txt");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[1]).assertEqual("txt jss true");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03000
   * @tc.name: testParamsForEach005
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach005', 0, function () {
        let params = new Url.URLParams("foo=bar&jss=txt");
        params.append("foo","jk");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[0]).assertEqual("bar foo true");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03100
   * @tc.name: testParamsForEach006
   * @tc.desc: forEach throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach006', 0, function () {
        try {
            let params = new Url.URLParams("foo=bar&jss=txt");
            var arr={};
            var i = 0;
            var func = [0, 2, 4, 6, 8];
            params.forEach(func);
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${func} must be function`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${func} must be function`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03200
   * @tc.name: testParamsForEach007
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach007', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var arr = {};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func, undefined);
        expect(arr[0]).assertEqual("value1 key1 true");
        arr = {};
        i = 0;
        params.forEach(func, null);
        expect(arr[0]).assertEqual("value1 key1 true");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03300
   * @tc.name: testParamsGet001
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("1")
        expect(result).assertEqual(undefined)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03400
   * @tc.name: testParamsGet002
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet002', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("key2")
        expect(result).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03500
   * @tc.name: testParamsGet003
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("5","JKL")
        var result =  params.get("5")
        expect(result).assertEqual("JKL")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03600
   * @tc.name: testParamsGet004
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet004', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("key1")
        expect(result).assertEqual("value1")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03700
   * @tc.name: testParamsGet005
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet005', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("jss","JL")
        var result =  params.get("jss")
        expect(result).assertEqual("JL")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03800
   * @tc.name: testParamsGet006
   * @tc.desc: get throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet006', 0, function () {
        try{
            let params = new Url.URLParams("key1=value1&key2=value2")
            params.append("jss","JL")
            var a = 666;
            var result =  params.get(a)
            expect(0).assertEqual(1)
        }catch(err){
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03900
   * @tc.name: testParamsGetAll001
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("key1","AAA")
        var result =  params.getAll("key1")
        expect(result.toString()).assertEqual("value1,AAA")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04000
   * @tc.name: testParamsGetAll002
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll002', 0, function () {
        let params = new Url.URLParams("key1=value1&8=DEF")
        params.append("8","A8A")
        var result =  params.getAll("8")
        expect(result.toString()).assertEqual("DEF,A8A")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04100
   * @tc.name: testParamsGetAll003
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=da")
        params.append("key3","A3A")
        var result =  params.getAll("key3")
        expect(result.toString()).assertEqual("da,A3A")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04200
   * @tc.name: testParamsGetAll004
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll004', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key4")
        expect(result.toString()).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04300
   * @tc.name: testParamsGetAll005
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll005', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key2")
        expect(result.toString()).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04400
   * @tc.name: testParamsGetAll006
   * @tc.desc: getAll throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll006', 0, function () {
        try {
            let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
            params.append("key3","A3A")
            var b = 666;
            var result =  params.getAll(b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04500
   * @tc.name: testParamsHas001
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        var result =  params.has("2")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04600
   * @tc.name: testParamsHas002
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas002', 0, function () {
        let params = new Url.URLParams("小=value1&key2=value2&key3=大")
        var result =  params.has("小")
        expect(result).assertEqual(true)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04700
   * @tc.name: testParamsHas003
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas003', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥")
        expect(result).assertEqual(true)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04800
   * @tc.name: testParamsHas004
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas004', 0, function () {
        let params = new Url.URLParams("小=value1&key2=value2&key3=大")
        var result =  params.has("无")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04900
   * @tc.name: testParamsHas005
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas005', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥11")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05000
   * @tc.name: testParamsHas006
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas006', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        try {
            var a = 1;
            params.has(a);
        } catch(e) {
            expect(e.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`);
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05100
   * @tc.name: testParamsKeys001
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys001', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[0]).assertEqual("小");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05200
   * @tc.name: testParamsKeys002
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys002', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[1]).assertEqual("￥");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05300
   * @tc.name: testParamsKeys003
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys003', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[2]).assertEqual("key3");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05400
   * @tc.name: testParamsKeys004
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys004', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大&key4=六");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[3]).assertEqual("key4");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05500
   * @tc.name: testParamsKeys005
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys005', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大&key4=六&key5=发");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[4]).assertEqual("key5");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05600
   * @tc.name: testParamsSet001
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet001', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        // params.append("11","ACA");
        params.set("11","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&11=CCC");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05700
   * @tc.name: testParamsSet002
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet002', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set('10','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&10=BBB");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05800
   * @tc.name: testParamsSet003
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet003', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set("ma 大" ,"10￥");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&ma+%E5%A4%A7=10%EF%BF%A5");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05900
   * @tc.name: testParamsSet004
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet004', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        // params.append("1","ACA");
        params.set("1","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=CCC&2=value2&key3=3");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06000
   * @tc.name: testParamsSet005
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet005', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&12=BBB");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06100
   * @tc.name: testParamsSet006
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet006', 0, function () {
        let params = new Url.URLParams();
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("12=BBB");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06200
   * @tc.name: testParamsSet007
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet007', 0, function () {
        try {
            let params = new Url.URLParams("1=value1&2=value2&key3=3");
            var a = 12;
            params.set(a,'BBB');
            var res = params.toString();
            expect(0).assertEqual(1);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06300
   * @tc.name: testParamsSet007
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet007', 0, function () {
        try {
            let params = new Url.URLParams("1=value1&2=value2&key3=3");
            var b = undefined;
            params.set('12', b);
            var res = params.toString();
            expect(0).assertEqual(1);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06400
   * @tc.name: testParamsSort001
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort001', 0, function () {
        let params = new Url.URLParams("1=value1&3=value3&2=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06500
   * @tc.name: testParamsSort002
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort002', 0, function () {
        let params = new Url.URLParams("a=value1&c=value2&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=value1&b=key2&c=value2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06600
   * @tc.name: testParamsSort003
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort003', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=33");
        params.append("a","ACA");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=ACA&b=33&c=value2&d=value1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06700
   * @tc.name: testParamsSort004
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort004', 0, function () {
        let params = new Url.URLParams("1=value1&3=value3&2=key2&4=key4");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3&4=key4");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06800
   * @tc.name: testParamsSort005
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort005', 0, function () {
        let params = new Url.URLParams("a=value1&c=value2&4=key4&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("4=key4&a=value1&b=key2&c=value2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06900
   * @tc.name: testParamsValues001
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues001', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[0]).assertEqual("value1")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07000
   * @tc.name: testParamsValues002
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues002', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[1]).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07100
   * @tc.name: testParamsValues003
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues003', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        params.append("a","ACA")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[3]).assertEqual("ACA")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07200
   * @tc.name: testParamsValues004
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues004', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[3]).assertEqual("key4")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07300
   * @tc.name: testParamsValues005
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues005', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4&5=key5")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[4]).assertEqual("key5")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07400
   * @tc.name: testParamsToString001
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString001', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07500
   * @tc.name: testParamsToString002
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString002', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b= 大")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&1+12=QQQ")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07600
   * @tc.name: testParamsToString003
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString003', 0, function () {
        let params = new Url.URLParams("￥=)")
        params.delete("5")
        var result= params.toString()
        expect(result).assertEqual("%EF%BF%A5=%29")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07700
   * @tc.name: testParamsToString004
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString004', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07800
   * @tc.name: testParamsToString005
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString005', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b= 大&4=key4&5=key5")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&4=key4&5=key5&1+12=QQQ")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07900
   * @tc.name: testParamsConstruction001
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction001', 0, function () {
        let params = new Url.URLParams('?user=abc&query=xyz')
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08000
   * @tc.name: testParamsConstruction002
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction002', 0, function () {
        let params = new Url.URLParams({
            user: 'abc',
            query: ['first', 'second']
        });
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first%2Csecond")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08100
   * @tc.name: testParamsConstruction003
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction003', 0, function () {
        let params = new Url.URLParams([
                ['user', 'abc'],
                ['query', 'first'],
                ['query', 'second'],
        ]);
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08200
   * @tc.name: testParamsConstruction004
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction004', 0, function () {
        const map = new Map();
        map.set('user', 'abc');
        map.set('query', 'xyz');
        let params = new Url.URLParams(map)
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08300
   * @tc.name: testParamsConstruction005
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction005', 0, function () {
        function* getQueryPairs() {
            yield ['user', 'abc'];
            yield ['query', 'first'];
            yield ['query', 'second'];
        }
        let params = new Url.URLParams(getQueryPairs());
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08400
   * @tc.name: testParamsConstruction006
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction006', 0, function () {
        let params = new Url.URLParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08500
   * @tc.name: testParamsConstruction007
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction007', 0, function () {
        let param
        let params = new Url.URLParams(param)
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08600
   * @tc.name: testParamsConstruction008
   * @tc.desc: The type of init must be string two-dimensional array or object list throw error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction008', 0, function () {
        try {
            var param = 123456789;
            let params = new Url.URLParams(param)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${param} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${param} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08700
   * @tc.name: testParamsConstruction009
   * @tc.desc: The type of init must be string two-dimensional array or object list throw error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction009', 0, function () {
        try {
            var param = [
                ['user', 'abc', 'error'],
              ];
            let params = new Url.URLParams(param);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${param} must be string[][]`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${param} must be string[][]`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08800
   * @tc.name: testNewURLSearchParams001
   * @tc.desc: The input parameter for New URLSearchParams is undefined or null.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testNewURLSearchParams001', 0, function () {
        let params = new Url.URLSearchParams(undefined);
        let result = params.toString()
        expect(result).assertEqual('')
        let params1 = new Url.URLSearchParams(null);
        let result2 = params1.toString()
        expect(result2).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08900
   * @tc.name: testUrlAppend001
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLSearchParams(that.search);
        params.append('ma','jk')
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2&ma=jk')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09000
   * @tc.name: testUrlAppend002
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend002', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09100
   * @tc.name: testUrlAppend003
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend003', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09200
   * @tc.name: testUrlAppend004
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("app","par")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&app=par")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09300
   * @tc.name: testUrlAppend005
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("123","456")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&123=456")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09400
   * @tc.name: testUrlAppend006
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend006', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        try {
            var a = 1;
            params.append(a, "123")
        } catch(e) {
            expect(e.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`);
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09500
   * @tc.name: testUrlDelete001
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete001', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.delete("foo")
        var result = params.toString()
        expect(result).assertEqual("bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09600
   * @tc.name: testUrlDelete002
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete002', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete('foo');
        var result = params.toString();
        expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09700
   * @tc.name: testUrlDelete003
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete003', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete("foo大");
        var result = params.toString();
        expect(result).assertEqual("bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09800
   * @tc.name: testUrlDelete004
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete('bar');
        var result = params.toString();
        expect(result).assertEqual("foo=1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09900
   * @tc.name: testUrlDelete005
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete("faa");
        var result = params.toString();
        expect(result).assertEqual("foo=1&bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10000
   * @tc.name: testUrlEntries001
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");

        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[1]).assertEqual("value1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10100
   * @tc.name: testUrlEntries002
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries002', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[2]).assertEqual("key2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10200
   * @tc.name: testUrlEntries003
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries003', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("foo","jk")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[5]).assertEqual("jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10300
   * @tc.name: testUrlEntries004
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries004', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[3]).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10400
   * @tc.name: testUrlEntries005
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries005', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("jss","txt")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[4]).assertEqual("jss")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10500
   * @tc.name: testUrl[Symbol.iterator]001
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrl[Symbol.iterator]001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");
        var i=0;
