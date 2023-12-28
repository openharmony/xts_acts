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
     * @tc.number: testParamsAppend001
     * @tc.name: testParamsAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
     it('testParamsAppend001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append('ma','jk')
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2&ma=jk')
    })

    /**
     * @tc.number: testParamsAppend002
     * @tc.name: testParamsAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testParamsAppend002', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

    /**
     * @tc.number: testParamsAppend003
     * @tc.name: testParamsAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testParamsAppend003', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

    /**
     * @tc.number: testParamsAppend004
     * @tc.name: testParamsAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testParamsAppend004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.append("app","par")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&app=par")
    })

    /**
     * @tc.number: testParamsAppend005
     * @tc.name: testParamsAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testParamsAppend005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.append("123","456")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&123=456")
    })

    /**
     * @tc.number: testParamsAppend006
     * @tc.name: testParamsAppend
     * @tc.desc: Appends throw BusinessError: Parameter error.
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
     * @tc.number: testParamsAppend007
     * @tc.name: testParamsAppend
     * @tc.desc: Appends throw BusinessError: Parameter error.
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
     * @tc.number: testParamsDelete001
     * @tc.name: testParamsDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testParamsDelete001', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.delete("foo")
        var result = params.toString()
        expect(result).assertEqual("bar=2")
    })

    /**
     * @tc.number: testParamsDelete002
     * @tc.name: testParamsDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testParamsDelete002', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete('foo');
        var result = params.toString();
        expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    })

    /**
     * @tc.number: testParamsDelete003
     * @tc.name: testParamsDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testParamsDelete003', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete("foo大");
        var result = params.toString();
        expect(result).assertEqual("bar=2")
    })

    /**
     * @tc.number: testParamsDelete004
     * @tc.name: testParamsDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testParamsDelete004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete('bar');
        var result = params.toString();
        expect(result).assertEqual("foo=1");
    })

    /**
     * @tc.number: testParamsDelete005
     * @tc.name: testParamsDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testParamsDelete005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete("faa");
        var result = params.toString();
        expect(result).assertEqual("foo=1&bar=2")
    })

    /**
     * @tc.number: testParamsDelete006
     * @tc.name: testParamsDelete
     * @tc.desc: Deletes throw BusinessError: Parameter error.
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
     * @tc.number: testParamsDelete007
     * @tc.name: testParamsDelete
     * @tc.desc: Deletes throw BusinessError: Parameter error.
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
     * @tc.number: testNewURLParams001
     * @tc.name: testNewURLParams
     * @tc.desc: The input parameter for New URLParams is undefined or null.
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
     * @tc.number: testParamsEntries001
     * @tc.name: testParamsEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParamsEntries002
     * @tc.name: testParamsEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParamsEntries003
     * @tc.name: testParamsEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParamsEntries004
     * @tc.name: testParamsEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParamsEntries005
     * @tc.name: testParamsEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParams[Symbol.iterator]001
     * @tc.name: testParams[Symbol.iterator]
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParams[Symbol.iterator]002
     * @tc.name: testParams[Symbol.iterator]
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParams[Symbol.iterator]003
     * @tc.name: testParams[Symbol.iterator]
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParams[Symbol.iterator]004
     * @tc.name: testParams[Symbol.iterator]
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testParams[Symbol.iterator]005
     * @tc.name: testParams[Symbol.iterator]
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
    * @tc.number: testParamsForEach001
    * @tc.name: testParamsForEach
    * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
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
    * @tc.number: testParamsForEach002
    * @tc.name: testParamsForEach
    * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
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
     * @tc.number: testParamsForEach003
     * @tc.name: testParamsForEach
     * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
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
     * @tc.number: testParamsForEach004
     * @tc.name: testParamsForEach
     * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
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
     * @tc.number: testParamsForEach005
     * @tc.name: testParamsForEach
     * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
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
     * @tc.number: testParamsForEach006
     * @tc.name: testParamsForEach
     * @tc.desc: forEach throw BusinessError: Parameter error.
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
    * @tc.number: testParamsForEach007
    * @tc.name: testParamsForEach
    * @tc.desc: The second parameter of forEach is undefined or null.
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
     * @tc.number: testParamsGet001
     * @tc.name: testParamsGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testParamsGet001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("1")
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: testParamsGet002
     * @tc.name: testParamsGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testParamsGet002', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("key2")
        expect(result).assertEqual("value2")
    })

    /**
     * @tc.number: testParamsGet003
     * @tc.name: testParamsGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testParamsGet003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("5","JKL")
        var result =  params.get("5")
        expect(result).assertEqual("JKL")
    })

    /**
     * @tc.number: testParamsGet004
     * @tc.name: testParamsGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testParamsGet004', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("key1")
        expect(result).assertEqual("value1")
    })

    /**
     * @tc.number: testParamsGet005
     * @tc.name: testParamsGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testParamsGet005', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("jss","JL")
        var result =  params.get("jss")
        expect(result).assertEqual("JL")
    })

    /**
     * @tc.number: testParamsGet006
     * @tc.name: testParamsGet
     * @tc.desc: get throw BusinessError: Parameter error.
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
     * @tc.number: testParamsGetAll001
     * @tc.name: testParamsGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testParamsGetAll001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("key1","AAA")
        var result =  params.getAll("key1")
        expect(result.toString()).assertEqual("value1,AAA")
    })

    /**
     * @tc.number: testParamsGetAll002
     * @tc.name: testParamsGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testParamsGetAll002', 0, function () {
        let params = new Url.URLParams("key1=value1&8=DEF")
        params.append("8","A8A")
        var result =  params.getAll("8")
        expect(result.toString()).assertEqual("DEF,A8A")
    })

    /**
     * @tc.number: testParamsGetAll003
     * @tc.name: testParamsGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testParamsGetAll003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=da")
        params.append("key3","A3A")
        var result =  params.getAll("key3")
        expect(result.toString()).assertEqual("da,A3A")
    })

    /**
     * @tc.number: testParamsGetAll004
     * @tc.name: testParamsGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testParamsGetAll004', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key4")
        expect(result.toString()).assertEqual('')
    })

    /**
     * @tc.number: testParamsGetAll005
     * @tc.name: testParamsGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testParamsGetAll005', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key2")
        expect(result.toString()).assertEqual("value2")
    })

    /**
     * @tc.number: testParamsGetAll006
     * @tc.name: testParamsGetAll
     * @tc.desc: getAll throw BusinessError: Parameter error.
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
     * @tc.number: testParamsHas001
     * @tc.name: testParamsHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testParamsHas001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        var result =  params.has("2")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: testParamsHas002
     * @tc.name: testParamsHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testParamsHas002', 0, function () {
        let params = new Url.URLParams("小=value1&key2=value2&key3=大")
        var result =  params.has("小")
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: testParamsHas003
     * @tc.name: testParamsHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testParamsHas003', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥")
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: testParamsHas004
     * @tc.name: testParamsHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testParamsHas004', 0, function () {
        let params = new Url.URLParams("小=value1&key2=value2&key3=大")
        var result =  params.has("无")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: testParamsHas005
     * @tc.name: testParamsHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testParamsHas005', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥11")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: testParamsHas006
     * @tc.name: testParamsHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
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
     * @tc.number: testParamsKeys001
     * @tc.name: testParamsKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
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
     * @tc.number: testParamsKeys002
     * @tc.name: testParamsKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
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
     * @tc.number: testParamsKeys003
     * @tc.name: testParamsKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
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
     * @tc.number: testParamsKeys004
     * @tc.name: testParamsKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
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
     * @tc.number: testParamsKeys005
     * @tc.name: testParamsKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
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
     * @tc.number: testParamsSet001
     * @tc.name: testParamsSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testParamsSet001', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        // params.append("11","ACA");
        params.set("11","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&11=CCC");
    })

    /**
     * @tc.number: testParamsSet002
     * @tc.name: testParamsSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testParamsSet002', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set('10','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&10=BBB");
    })

    /**
     * @tc.number: testParamsSet003
     * @tc.name: testParamsSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testParamsSet003', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set("ma 大" ,"10￥");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&ma+%E5%A4%A7=10%EF%BF%A5");
    })

    /**
     * @tc.number: testParamsSet004
     * @tc.name: testParamsSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testParamsSet004', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        // params.append("1","ACA");
        params.set("1","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=CCC&2=value2&key3=3");
    })

    /**
     * @tc.number: testParamsSet005
     * @tc.name: testParamsSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testParamsSet005', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&12=BBB");
    })

    /**
     * @tc.number: testParamsSet006
     * @tc.name: testParamsSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter throw BusinessError: Parameter error.
     */
    it('testParamsSet006', 0, function () {
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
     * @tc.number: testParamsSet007
     * @tc.name: testParamsSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter throw BusinessError: Parameter error.
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
     * @tc.number: testParamsSort001
     * @tc.name: testParamsSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testParamsSort001', 0, function () {
        let params = new Url.URLParams("1=value1&3=value3&2=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3");
    })

    /**
     * @tc.number: testParamsSort002
     * @tc.name: testParamsSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testParamsSort002', 0, function () {
        let params = new Url.URLParams("a=value1&c=value2&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=value1&b=key2&c=value2");
    })

    /**
     * @tc.number: testParamsSort003
     * @tc.name: testParamsSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testParamsSort003', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=33");
        params.append("a","ACA");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=ACA&b=33&c=value2&d=value1");
    })

    /**
     * @tc.number: testParamsSort004
     * @tc.name: testParamsSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testParamsSort004', 0, function () {
        let params = new Url.URLParams("1=value1&3=value3&2=key2&4=key4");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3&4=key4");
    })

    /**
     * @tc.number: testParamsSort005
     * @tc.name: testParamsSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testParamsSort005', 0, function () {
        let params = new Url.URLParams("a=value1&c=value2&4=key4&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("4=key4&a=value1&b=key2&c=value2");
    })

    /**
     * @tc.number: testParamsValues001
     * @tc.name: testParamsValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
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
     * @tc.number: testParamsValues002
     * @tc.name: testParamsValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
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
     * @tc.number: testParamsValues003
     * @tc.name: testParamsValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
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
     * @tc.number: testParamsValues004
     * @tc.name: testParamsValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
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
     * @tc.number: testParamsValues005
     * @tc.name: testParamsValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
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
     * @tc.number: testParamsToString001
     * @tc.name: testParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testParamsToString001', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7")
    })

    /**
     * @tc.number: testParamsToString002
     * @tc.name: testParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testParamsToString002', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b= 大")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&1+12=QQQ")
    })

    /**
     * @tc.number: testParamsToString003
     * @tc.name: testParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testParamsToString003', 0, function () {
        let params = new Url.URLParams("￥=)")
        params.delete("5")
        var result= params.toString()
        expect(result).assertEqual("%EF%BF%A5=%29")
    })

    /**
     * @tc.number: testParamsToString004
     * @tc.name: testParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testParamsToString004', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

    /**
     * @tc.number: testParamsToString005
     * @tc.name: testParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testParamsToString005', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b= 大&4=key4&5=key5")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&4=key4&5=key5&1+12=QQQ")
    })

    /**
     * @tc.number: testParamsConstruction001
     * @tc.name: testParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testParamsConstruction001', 0, function () {
        let params = new Url.URLParams('?user=abc&query=xyz')
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

    /**
     * @tc.number: testParamsConstruction002
     * @tc.name: testParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
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
     * @tc.number: testParamsConstruction003
     * @tc.name: testParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
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
     * @tc.number: testParamsConstruction004
     * @tc.name: testParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
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
     * @tc.number: testParamsConstruction005
     * @tc.name: testParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
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
     * @tc.number: testParamsConstruction006
     * @tc.name: testParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testParamsConstruction006', 0, function () {
        let params = new Url.URLParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.number: testParamsConstruction007
     * @tc.name: testParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testParamsConstruction007', 0, function () {
        let param
        let params = new Url.URLParams(param)
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.number: testParamsConstruction008
     * @tc.name: testParamsConstruction
     * @tc.desc:  The type of init must be string two-dimensional array or object list throw error.
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
     * @tc.number: testParamsConstruction009
     * @tc.name: testParamsConstruction
     * @tc.desc:  The type of init must be string two-dimensional array or object list throw error.
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
     * @tc.number: testNewURLSearchParams001
     * @tc.name: testNewURLSearchParams
     * @tc.desc: The input parameter for New URLSearchParams is undefined or null.
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
     * @tc.number: testUrlAppend001
     * @tc.name: testUrlAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testUrlAppend001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLSearchParams(that.search);
        params.append('ma','jk')
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2&ma=jk')
    })

    /**
     * @tc.number: testUrlAppend002
     * @tc.name: testUrlAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testUrlAppend002', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

    /**
     * @tc.number: testUrlAppend003
     * @tc.name: testUrlAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testUrlAppend003', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

    /**
     * @tc.number: testUrlAppend004
     * @tc.name: testUrlAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testUrlAppend004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("app","par")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&app=par")
    })

    /**
     * @tc.number: testUrlAppend005
     * @tc.name: testUrlAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
     */
    it('testUrlAppend005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("123","456")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&123=456")
    })

    /**
     * @tc.number: testUrlAppend006
     * @tc.name: testUrlAppend
     * @tc.desc: Appends a specified key/value pair as a new search parameter.
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
     * @tc.number: testUrlDelete001
     * @tc.name: testUrlDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testUrlDelete001', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.delete("foo")
        var result = params.toString()
        expect(result).assertEqual("bar=2")
    })

    /**
     * @tc.number: testUrlDelete002
     * @tc.name: testUrlDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testUrlDelete002', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete('foo');
        var result = params.toString();
        expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    })

    /**
     * @tc.number: testUrlDelete003
     * @tc.name: testUrlDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testUrlDelete003', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete("foo大");
        var result = params.toString();
        expect(result).assertEqual("bar=2")
    })

    /**
     * @tc.number: testUrlDelete004
     * @tc.name: testUrlDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testUrlDelete004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete('bar');
        var result = params.toString();
        expect(result).assertEqual("foo=1");
    })

    /**
     * @tc.number: testUrlDelete005
     * @tc.name: testUrlDelete
     * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
     */
    it('testUrlDelete005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete("faa");
        var result = params.toString();
        expect(result).assertEqual("foo=1&bar=2")
    })

    /**
     * @tc.number: testUrlEntries001
     * @tc.name: testUrlEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testUrlEntries002
     * @tc.name: testUrlEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testUrlEntries003
     * @tc.name: testUrlEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testUrlEntries004
     * @tc.name: testUrlEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testUrlEntries005
     * @tc.name: testUrlEntries
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
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
     * @tc.number: testUrl[Symbol.iterator]()001
     * @tc.name: testUrl[Symbol.iterator]()
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     */
    it('testUrl[Symbol.iterator]001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");
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
     * @tc.number: testUrl[Symbol.iterator]()002
     * @tc.name: testUrl[Symbol.iterator]()
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     */
    it('testUrl[Symbol.iterator]()002', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
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
     * @tc.number: testUrl[Symbol.iterator]()003
     * @tc.name: testUrl[Symbol.iterator]()
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     */
    it('testUrl[Symbol.iterator]()003', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
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
     * @tc.number: testUrl[Symbol.iterator]()004
     * @tc.name: testUrl[Symbol.iterator]()
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     */
    it('testUrl[Symbol.iterator]()004', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
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
     * @tc.number: testUrl[Symbol.iterator]()005
     * @tc.name: testUrl[Symbol.iterator]()
     * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     */
    it('testUrl[Symbol.iterator]()005', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
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
    * @tc.number: testUrlForEach001
    * @tc.name: testUrlForEach
    * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
    */
    it('testUrlForEach001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
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
    * @tc.number: testUrlForEach002
    * @tc.name: testUrlForEach
    * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
    */
    it('testUrlForEach002', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");
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
     * @tc.number: testUrlForEach003
     * @tc.name: testUrlForEach
     * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     */
    it('testUrlForEach003', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");
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
     * @tc.number: testUrlForEach004
     * @tc.name: testUrlForEach
     * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     */
    it('testUrlForEach004', 0, function () {
        let params = new Url.URLSearchParams("foo=bar&jss=txt");
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
     * @tc.number: testUrlForEach005
     * @tc.name: testUrlForEach
     * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     */
    it('testUrlForEach005', 0, function () {
        let params = new Url.URLSearchParams("foo=bar&jss=txt");
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
    * @tc.number: testUrlForEach006
    * @tc.name: testUrlForEach
    * @tc.desc: The second parameter of forEach is undefined or null.
    */
       it('testUrlForEach006', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var arr = {};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func, undefined);
        expect(arr[0]).assertEqual("value1 key1 true");
        arr = {}
        i = 0;
        params.forEach(func, null);
        expect(arr[0]).assertEqual("value1 key1 true");
    })

    /**
     * @tc.number: testUrlGet001
     * @tc.name: testUrlGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testUrlGet001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("1")
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: testUrlGet002
     * @tc.name: testUrlGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testUrlGet002', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("key2")
        expect(result).assertEqual("value2")
    })

    /**
     * @tc.number: testUrlGet003
     * @tc.name: testUrlGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testUrlGet003', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("5","JKL")
        var result =  params.get("5")
        expect(result).assertEqual("JKL")
    })

    /**
     * @tc.number: testUrlGet004
     * @tc.name: testUrlGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testUrlGet004', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("key1")
        expect(result).assertEqual("value1")
    })

    /**
     * @tc.number: testUrlGet005
     * @tc.name: testUrlGet
     * @tc.desc: Returns the first value associated to the given search parameter.
     */
    it('testUrlGet005', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("jss","JL")
        var result =  params.get("jss")
        expect(result).assertEqual("JL")
    })

    /**
     * @tc.number: testUrlGetAll001
     * @tc.name: testUrlGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testUrlGetAll001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("key1","AAA")
        var result =  params.getAll("key1")
        expect(result.toString()).assertEqual("value1,AAA")
    })

    /**
     * @tc.number: testUrlGetAll002
     * @tc.name: testUrlGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testUrlGetAll002', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&8=DEF")
        params.append("8","A8A")
        var result =  params.getAll("8")
        expect(result.toString()).assertEqual("DEF,A8A")
    })

    /**
     * @tc.number: testUrlGetAll003
     * @tc.name: testUrlGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testUrlGetAll003', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=da")
        params.append("key3","A3A")
        var result =  params.getAll("key3")
        expect(result.toString()).assertEqual("da,A3A")
    })

    /**
     * @tc.number: testUrlGetAll004
     * @tc.name: testUrlGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testUrlGetAll004', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key4")
        expect(result.toString()).assertEqual('')
    })

    /**
     * @tc.number: testUrlGetAll005
     * @tc.name: testUrlGetAll
     * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
     */
    it('testUrlGetAll005', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key2")
        expect(result.toString()).assertEqual("value2")
    })

    /**
     * @tc.number: testUrlHas001
     * @tc.name: testUrlHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testUrlHas001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        var result =  params.has("2")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: testUrlHas002
     * @tc.name: testUrlHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testUrlHas002', 0, function () {
        let params = new Url.URLSearchParams("小=value1&key2=value2&key3=大")
        var result =  params.has("小")
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: testUrlHas003
     * @tc.name: testUrlHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testUrlHas003', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥")
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: testUrlHas004
     * @tc.name: testUrlHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testUrlHas004', 0, function () {
        let params = new Url.URLSearchParams("小=value1&key2=value2&key3=大")
        var result =  params.has("无")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: testUrlHas005
     * @tc.name: testUrlHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testUrlHas005', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥11")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: testUrlHas006
     * @tc.name: testUrlHas
     * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
     */
    it('testUrlHas006', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
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
     * @tc.number: testUrlKeys001
     * @tc.name: testUrlKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
     */
    it('testUrlKeys001', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[0]).assertEqual("小");
    })

    /**
     * @tc.number: testUrlKeys002
     * @tc.name: testUrlKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
     */
    it('testUrlKeys002', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[1]).assertEqual("￥");
    })

    /**
     * @tc.number: testUrlKeys003
     * @tc.name: testUrlKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
     */
    it('testUrlKeys003', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[2]).assertEqual("key3");
    })

    /**
     * @tc.number: testUrlKeys004
     * @tc.name: testUrlKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
     */
    it('testUrlKeys004', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大&key4=六");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[3]).assertEqual("key4");
    })

    /**
     * @tc.number: testUrlKeys005
     * @tc.name: testUrlKeys
     * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
     */
    it('testUrlKeys005', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大&key4=六&key5=发");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[4]).assertEqual("key5");
    })

    /**
     * @tc.number: testUrlSet001
     * @tc.name: testUrlSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testUrlSet001', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        // params.append("11","ACA");
        params.set("11","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&11=CCC");
    })

    /**
     * @tc.number: testUrlSet002
     * @tc.name: testUrlSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testUrlSet002', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set('10','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&10=BBB");
    })

    /**
     * @tc.number: testUrlSet003
     * @tc.name: testUrlSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testUrlSet003', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set("ma 大" ,"10￥");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&ma+%E5%A4%A7=10%EF%BF%A5");
    })

    /**
     * @tc.number: testUrlSet004
     * @tc.name: testUrlSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testUrlSet004', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        // params.append("1","ACA");
        params.set("1","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=CCC&2=value2&key3=3");
    })

    /**
     * @tc.number: testUrlSet005
     * @tc.name: testUrlSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testUrlSet005', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&12=BBB");
    })

    /**
     * @tc.number: testUrlSet006
     * @tc.name: testUrlSet
     * @tc.desc: Sets the value associated with a given search parameter to the given value.
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it('testUrlSet006', 0, function () {
        try {
            let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
            var a = 12;
            params.set(a, 'BBB');
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

    /**
     * @tc.number: testUrlSort001
     * @tc.name: testUrlSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testUrlSort001', 0, function () {
        let params = new Url.URLSearchParams("1=value1&3=value3&2=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3");
    })

    /**
     * @tc.number: testUrlSort002
     * @tc.name: testUrlSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testUrlSort002', 0, function () {
        let params = new Url.URLSearchParams("a=value1&c=value2&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=value1&b=key2&c=value2");
    })

    /**
     * @tc.number: testUrlSort003
     * @tc.name: testUrlSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testUrlSort003', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=33");
        params.append("a","ACA");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=ACA&b=33&c=value2&d=value1");
    })

    /**
     * @tc.number: testUrlSort004
     * @tc.name: testUrlSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testUrlSort004', 0, function () {
        let params = new Url.URLSearchParams("1=value1&3=value3&2=key2&4=key4");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3&4=key4");
    })

    /**
     * @tc.number: testUrlSort005
     * @tc.name: testUrlSort
     * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
     */
    it('testUrlSort005', 0, function () {
        let params = new Url.URLSearchParams("a=value1&c=value2&4=key4&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("4=key4&a=value1&b=key2&c=value2");
    })

    /**
     * @tc.number: testUrlValues001
     * @tc.name: testUrlValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
     */
    it('testUrlValues001', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[0]).assertEqual("value1")
    })

    /**
     * @tc.number: testUrlValues002
     * @tc.name: testUrlValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
     */
    it('testUrlValues002', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[1]).assertEqual("value2")
    })

    /**
     * @tc.number: testUrlValues003
     * @tc.name: testUrlValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
     */
    it('testUrlValues003', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
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
     * @tc.number: testUrlValues004
     * @tc.name: testUrlValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
     */
    it('testUrlValues004', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[3]).assertEqual("key4")
    })

    /**
     * @tc.number: testUrlValues005
     * @tc.name: testUrlValues
     * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
     */
    it('testUrlValues005', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4&5=key5")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[4]).assertEqual("key5")
    })

    /**
     * @tc.number: testUrlSearchParamsToString001
     * @tc.name: testUrlSearchParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testUrlSearchParamsToString001', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7")
    })

    /**
     * @tc.number: testUrlSearchParamsToString002
     * @tc.name: testUrlSearchParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testUrlSearchParamsToString002', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b= 大")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&1+12=QQQ")
    })

    /**
     * @tc.number: testUrlSearchParamsToString003
     * @tc.name: testUrlSearchParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testUrlSearchParamsToString003', 0, function () {
        let params = new Url.URLSearchParams("￥=)")
        params.delete("5")
        var result= params.toString()
        expect(result).assertEqual("%EF%BF%A5=%29")
    })

    /**
     * @tc.number: testUrlSearchParamsToString004
     * @tc.name: testUrlSearchParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testUrlSearchParamsToString004', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

    /**
     * @tc.number: testUrlSearchParamsToString005
     * @tc.name: testUrlSearchParamsToString
     * @tc.desc: Returns a query string suitable for use in a URL.
     */
    it('testUrlSearchParamsToString005', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b= 大&4=key4&5=key5")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&4=key4&5=key5&1+12=QQQ")
    })

    /**
     * @tc.number: testUrlSearchParamsConstruction001
     * @tc.name: testUrlSearchParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testUrlSearchParamsConstruction001', 0, function () {
        let params = new Url.URLSearchParams('?user=abc&query=xyz')
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

    /**
     * @tc.number: testUrlSearchParamsConstruction002
     * @tc.name: testUrlSearchParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testUrlSearchParamsConstruction002', 0, function () {
        let params = new Url.URLSearchParams({
            user: 'abc',
            query: ['first', 'second']
        });
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first%2Csecond")
    })

    /**
     * @tc.number: testUrlSearchParamsConstruction003
     * @tc.name: testUrlSearchParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testUrlSearchParamsConstruction003', 0, function () {
        let params = new Url.URLSearchParams([
                ['user', 'abc'],
                ['query', 'first'],
                ['query', 'second'],
        ]);
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

    /**
     * @tc.number: testUrlSearchParamsConstruction004
     * @tc.name: testUrlSearchParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testUrlSearchParamsConstruction004', 0, function () {
        const map = new Map();
        map.set('user', 'abc');
        map.set('query', 'xyz');
        let params = new Url.URLSearchParams(map)
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

    /**
     * @tc.number: testUrlSearchParamsConstruction005
     * @tc.name: testUrlSearchParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testUrlSearchParamsConstruction005', 0, function () {
        function* getQueryPairs() {
            yield ['user', 'abc'];
            yield ['query', 'first'];
            yield ['query', 'second'];
        }
        let params = new Url.URLSearchParams(getQueryPairs());
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

    /**
     * @tc.number: testUrlSearchParamsConstruction006
     * @tc.name: testUrlSearchParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testUrlSearchParamsConstruction006', 0, function () {
        let params = new Url.URLSearchParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.number: testUrlSearchParamsConstruction007
     * @tc.name: testUrlSearchParamsConstruction
     * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
     */
    it('testUrlSearchParamsConstruction007', 0, function () {
        let param
        let params = new Url.URLSearchParams(param)
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.number: testNewUrl001
     * @tc.name: testNewUrl
     * @tc.desc: The second parameter of Url construction is undefined or null.
     */
    it('testNewUrl001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment', undefined)
        let result = params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
        let params1 = new Url.URL('http://username:password@host:8080/directory/file?query#fragment', null)
        let result2 = params1.toString()
        expect(result2).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.number: testUrlToString001
     * @tc.name: testUrlToString
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToString001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.number: testUrlToString002
     * @tc.name: testUrlToString
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToString002', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file")
    })

    /**
     * @tc.number: testUrlToString003
     * @tc.name: testUrlToString
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToString003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/#fragment")
    })

    /**
     * @tc.number: testUrlToString004
     * @tc.name: testUrlToString
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToString004', 0, function () {
        let params = new Url.URL('http1://host/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http1://host/directory/file?query#fragment")
    })

    /**
     * @tc.number: testUrlToString005
     * @tc.name: testUrlToString
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToString005', 0, function () {
        let params = new Url.URL('http:host:8080/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.number: testUrlHref001
     * @tc.name: testUrlHref
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlHref001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.href
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.number: testUrlHref002
     * @tc.name: testUrlHref
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlHref002', 0, function () {
        let params = new Url.URL('http://host:8080/directory/file?query#fragment')
        var result= params.href
        expect(result).assertEqual("http://host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.number: testUrlHref003
     * @tc.name: testUrlHref
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlHref003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080')
        var result= params.href
        expect(result).assertEqual("http://username:password@host:8080/")
    })

    /**
     * @tc.number: testUrlHref004
     * @tc.name: testUrlHref
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlHref004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.href = 'http1://myhost/path?sss=1#ff';
        var result= params.href
        expect(result).assertEqual("http1://myhost/path?sss=1#ff")
    })

    /**
     * @tc.number: testUrlHref005
     * @tc.name: testUrlHref
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlHref005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.href = 'http://myhost:99/path#ff';
        var result= params.href
        expect(result).assertEqual("http://myhost:99/path#ff")
    })

    /**
     * @tc.number: testUrlOrigin001
     * @tc.name: testUrlOrigin
     * @tc.desc: Gets the read-only serialization of the URL's origin.
     */
    it('testUrlOrigin001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host:8080')
    })

    /**
     * @tc.number: testUrlOrigin002
     * @tc.name: testUrlOrigin
     * @tc.desc: Gets the read-only serialization of the URL's origin.
     */
    it('testUrlOrigin002', 0, function () {
        let params = new Url.URL('http://username:password@host:11/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host:11')
    })

    /**
     * @tc.number: testUrlOrigin003
     * @tc.name: testUrlOrigin
     * @tc.desc: Gets the read-only serialization of the URL's origin.
     */
    it('testUrlOrigin003', 0, function () {
        let params = new Url.URL('http://username:password@host/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host')
    })

    /**
     * @tc.number: testUrlOrigin004
     * @tc.name: testUrlOrigin
     * @tc.desc: Gets the read-only serialization of the URL's origin.
     */
    it('testUrlOrigin004', 0, function () {
        let params = new Url.URL('http://username:password@aaaasshost:212/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://aaaasshost:212')
    })

    /**
     * @tc.number: testUrlOrigin005
     * @tc.name: testUrlOrigin
     * @tc.desc: Gets the read-only serialization of the URL's origin.
     */
    it('testUrlOrigin005', 0, function () {
        let params = new Url.URL('http://username:password@host22:100#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host22:100')
    })

    /**
     * @tc.number: testUrlProtocol001
     * @tc.name: testUrlProtocol
     * @tc.desc: Gets and sets the protocol portion of the URL.
     */
    it('testUrlProtocol001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('http:')
    })

    /**
     * @tc.number: testUrlProtocol002
     * @tc.name: testUrlProtocol
     * @tc.desc: Gets and sets the protocol portion of the URL.
     */
    it('testUrlProtocol002', 0, function () {
        let params = new Url.URL('http1://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('http1:')
    })

    /**
     * @tc.number: testUrlProtocol003
     * @tc.name: testUrlProtocol
     * @tc.desc: Gets and sets the protocol portion of the URL.
     */
    it('testUrlProtocol003', 0, function () {
        let params = new Url.URL('https://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('https:')
    })

    /**
     * @tc.number: testUrlProtocol004
     * @tc.name: testUrlProtocol
     * @tc.desc: Gets and sets the protocol portion of the URL.
     */
    it('testUrlProtocol004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.protocol = 'https:';
        var result= params.protocol
        expect(result).assertEqual('https:')
    })

    /**
     * @tc.number: testUrlProtocol005
     * @tc.name: testUrlProtocol
     * @tc.desc: Gets and sets the protocol portion of the URL.
     */
    it('testUrlProtocol005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.protocol = 'ftp:';
        var result= params.protocol
        expect(result).assertEqual('ftp:')
    })

    /**
     * @tc.number: testUrlUsername001
     * @tc.name: testUrlUsername
     * @tc.desc: Gets and sets the username portion of the URL.
     */
    it('testUrlUsername001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('username')
    })

    /**
     * @tc.number: testUrlUsername002
     * @tc.name: testUrlUsername
     * @tc.desc: Gets and sets the username portion of the URL.
     */
    it('testUrlUsername002', 0, function () {
        let params = new Url.URL('http://zhao:password@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('zhao')
    })

    /**
     * @tc.number: testUrlUsername003
     * @tc.name: testUrlUsername
     * @tc.desc: Gets and sets the username portion of the URL.
     */
    it('testUrlUsername003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.username = 'skk'
        var result= params.username
        expect(result).assertEqual('skk')
    })

    /**
     * @tc.number: testUrlUsername004
     * @tc.name: testUrlUsername
     * @tc.desc: Gets and sets the username portion of the URL.
     */
    it('testUrlUsername004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.username = 'skp111'
        var result= params.username
        expect(result).assertEqual('skp111')
    })

    /**
     * @tc.number: testUrlUsername005
     * @tc.name: testUrlUsername
     * @tc.desc: Gets and sets the username portion of the URL.
     */
    it('testUrlUsername005', 0, function () {
        let params = new Url.URL('http://usme@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('usme')
    })

    /**
     * @tc.number: testUrlPassword001
     * @tc.name: testUrlPassword
     * @tc.desc: Gets and sets the password portion of the URL.
     */
    it('testUrlPassword001', 0, function () {
        let params = new Url.URL('http://username:11@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('11')
    })

    /**
     * @tc.number: testUrlPassword002
     * @tc.name: testUrlPassword
     * @tc.desc: Gets and sets the password portion of the URL.
     */
    it('testUrlPassword002', 0, function () {
        let params = new Url.URL('http://username:23aa@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('23aa')
    })

    /**
     * @tc.number: testUrlPassword003
     * @tc.name: testUrlPassword
     * @tc.desc: Gets and sets the password portion of the URL.
     */
    it('testUrlPassword003', 0, function () {
        let params = new Url.URL('http://username@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('')
    })

    /**
     * @tc.number: testUrlPassword004
     * @tc.name: testUrlPassword
     * @tc.desc: Gets and sets the password portion of the URL.
     */
    it('testUrlPassword004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.password = '1234'
        var result= params.password
        expect(result).assertEqual('1234')
    })

    /**
     * @tc.number: testUrlPassword005
     * @tc.name: testUrlPassword
     * @tc.desc: Gets and sets the password portion of the URL.
     */
    it('testUrlPassword005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.password = '';
        var result= params.password
        expect(result).assertEqual('')
    })

    /**
     * @tc.number: testUrlHost001
     * @tc.name: testUrlHost
     * @tc.desc: Gets and sets the host portion of the URL.
     */
    it('testUrlHost001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('host:8080')
    })

    /**
     * @tc.number: testUrlHost002
     * @tc.name: testUrlHost
     * @tc.desc: Gets and sets the host portion of the URL.
     */
    it('testUrlHost002', 0, function () {
        let params = new Url.URL('http://username:password@hosthost/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('hosthost')
    })

    /**
     * @tc.number: testUrlHost003
     * @tc.name: testUrlHost
     * @tc.desc: Gets and sets the host portion of the URL.
     */
    it('testUrlHost003', 0, function () {
        let params = new Url.URL('http://username:password@host:199/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('host:199')
    })

    /**
     * @tc.number: testUrlHost004
     * @tc.name: testUrlHost
     * @tc.desc: Gets and sets the host portion of the URL.
     */
    it('testUrlHost004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.host = 'jkjk'
        var result= params.host
        expect(result).assertEqual('jkjk:8080')
    })

    /**
     * @tc.number: testUrlHost005
     * @tc.name: testUrlHost
     * @tc.desc: Gets and sets the host portion of the URL.
     */
    it('testUrlHost005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.host = 'jkjk:100'
        var result= params.host
        expect(result).assertEqual('jkjk:100')
    })

    /**
     * @tc.number: testUrlHostname001
     * @tc.name: testUrlHostname
     * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
     */
    it('testUrlHostname001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('host')
    })

    /**
     * @tc.number: testUrlHostname002
     * @tc.name: testUrlHostname
     * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
     */
    it('testUrlHostname002', 0, function () {
        let params = new Url.URL('http://username:password@host123:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('host123')
    })

    /**
     * @tc.number: testUrlHostname003
     * @tc.name: testUrlHostname
     * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
     */
    it('testUrlHostname003', 0, function () {
        let params = new Url.URL('http://username:password@885ssa:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('885ssa')
    })

    /**
     * @tc.number: testUrlHostname004
     * @tc.name: testUrlHostname
     * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
     */
    it('testUrlHostname004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.hostname = 'sksk'
        var result= params.hostname
        expect(result).assertEqual('sksk')
    })

    /**
     * @tc.number: testUrlHostname005
     * @tc.name: testUrlHostname
     * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
     */
    it('testUrlHostname005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.hostname = 'hosthost'
        var result= params.hostname
        expect(result).assertEqual('hosthost')
    })

    /**
     * @tc.number: testUrlPort001
     * @tc.name: testUrlPort
     * @tc.desc: Gets and sets the port portion of the URL.
     */
    it('testUrlPort001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('8080')
    })

    /**
     * @tc.number: testUrlPort002
     * @tc.name: testUrlPort
     * @tc.desc: Gets and sets the port portion of the URL.
     */
    it('testUrlPort002', 0, function () {
        let params = new Url.URL('http://username:password@host:100/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('100')
    })

    /**
     * @tc.number: testUrlPort003
     * @tc.name: testUrlPort
     * @tc.desc: Gets and sets the port portion of the URL.
     */
    it('testUrlPort003', 0, function () {
        let params = new Url.URL('http://username:password@host/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('')
    })

    /**
     * @tc.number: testUrlPort004
     * @tc.name: testUrlPort
     * @tc.desc: Gets and sets the port portion of the URL.
     */
    it('testUrlPort004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.port = '99'
        var result= params.port
        expect(result).assertEqual('99')
    })

    /**
     * @tc.number: testUrlPort005
     * @tc.name: testUrlPort
     * @tc.desc: Gets and sets the port portion of the URL.
     */
    it('testUrlPort005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.port = '123'
        var result= params.port
        expect(result).assertEqual('123')
    })

    /**
     * @tc.number: testUrlPathname001
     * @tc.name: testUrlPathname
     * @tc.desc: Gets and sets the path portion of the URL.
     */
    it('testUrlPathname001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/directory/file')
    })

    /**
     * @tc.number: testUrlPathname002
     * @tc.name: testUrlPathname
     * @tc.desc: Gets and sets the path portion of the URL.
     */
    it('testUrlPathname002', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/directory')
    })

    /**
     * @tc.number: testUrlPathname003
     * @tc.name: testUrlPathname
     * @tc.desc: Gets and sets the path portion of the URL.
     */
    it('testUrlPathname003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/')
    })

    /**
     * @tc.number: testUrlPathname004
     * @tc.name: testUrlPathname
     * @tc.desc: Gets and sets the path portion of the URL.
     */
    it('testUrlPathname004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.pathname = 'path'
        var result= params.pathname
        expect(result).assertEqual('/path')
    })

    /**
     * @tc.number: testUrlPathname005
     * @tc.name: testUrlPathname
     * @tc.desc: Gets and sets the path portion of the URL.
     */
    it('testUrlPathname005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.pathname = '/directory/file11'
        var result= params.pathname
        expect(result).assertEqual('/directory/file11')
    })

    /**
     * @tc.number: testUrlSearch001
     * @tc.name: testUrlSearch
     * @tc.desc: Gets and sets the serialized query portion of the URL.
     */
    it('testUrlSearch001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        var result= params.search
        expect(result).assertEqual('?query=qqqq')
    })

    /**
     * @tc.number: testUrlSearch002
     * @tc.name: testUrlSearch
     * @tc.desc: Gets and sets the serialized query portion of the URL.
     */
    it('testUrlSearch002', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq&ll=pp#fragment')
        var result= params.search
        expect(result).assertEqual('?query=qqqq&ll=pp')
    })

    /**
     * @tc.number: testUrlSearch003
     * @tc.name: testUrlSearch
     * @tc.desc: Gets and sets the serialized query portion of the URL.
     */
    it('testUrlSearch003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?ppp9875=77#fragment')
        var result= params.search
        expect(result).assertEqual('?ppp9875=77')
    })

    /**
     * @tc.number: testUrlSearch004
     * @tc.name: testUrlSearch
     * @tc.desc: Gets and sets the serialized query portion of the URL.
     */
    it('testUrlSearch004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        params.search = 'kk=99'
        var result= params.search
        expect(result).assertEqual('?kk=99')
    })

    /**
     * @tc.number: testUrlSearch005
     * @tc.name: testUrlSearch
     * @tc.desc: Gets and sets the serialized query portion of the URL.
     */
    it('testUrlSearch005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        params.search = 'pppk=99'
        var result= params.search
        expect(result).assertEqual('?pppk=99')
    })

    /**
     * @tc.number: testUrlHash001
     * @tc.name: testUrlHash
     * @tc.desc: Gets and sets the fragment portion of the URL.
     */
    it('testUrlHash001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        var result= params.hash
        expect(result).assertEqual('#fragment')
    })

    /**
     * @tc.number: testUrlHash002
     * @tc.name: testUrlHash
     * @tc.desc: Gets and sets the fragment portion of the URL.
     */
    it('testUrlHash002', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        params.hash = '123456'
        var result= params.hash
        expect(result).assertEqual('#123456')
    })

    /**
     * @tc.number: testUrlHash003
     * @tc.name: testUrlHash
     * @tc.desc: Gets and sets the fragment portion of the URL.
     */
    it('testUrlHash003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#poiu')
        var result= params.hash
        expect(result).assertEqual('#poiu')
    })

    /**
     * @tc.number: testUrlHash004
     * @tc.name: testUrlHash
     * @tc.desc: Gets and sets the fragment portion of the URL.
     */
    it('testUrlHash004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp')
        var result= params.hash
        expect(result).assertEqual('')
    })

    /**
     * @tc.number: testUrlHash005
     * @tc.name: testUrlHash
     * @tc.desc: Gets and sets the fragment portion of the URL.
     */
    it('testUrlHash005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        params.hash = 'qwer'
        var result= params.hash
        expect(result).assertEqual('#qwer')
    })

    /**
     * @tc.number: testUrlSearchParams001
     * @tc.name: testUrlSearchParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
     it('testUrlSearchParams001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2')
    })

    /**
     * @tc.number: testUrlSearchParams002
     * @tc.name: testUrlSearchParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlSearchParams002', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = that.searchParams
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

    /**
     * @tc.number: testUrlSearchParams003
     * @tc.name: testUrlSearchParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlSearchParams003', 0, function () {
        let that = new Url.URL('https://example.com?d=value1&c=value2&b=大&4=key4')
        let params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

    /**
     * @tc.number: testUrlSearchParams004
     * @tc.name: testUrlSearchParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlSearchParams004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = that.searchParams
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

    /**
     * @tc.number: testUrlSearchParams005
     * @tc.name: testUrlSearchParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlSearchParams005', 0, function () {
        let that = new Url.URL('http://username:password@host:8080/directory/file?你好=china#qwer=da')
        let params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual("%E4%BD%A0%E5%A5%BD=china")
    })
   /**
     * @tc.number: testUrlURLParams001
     * @tc.name: testUrlURLParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlURLParams001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var seach = that.params
        var result = seach.toString()
        expect(result).assertEqual('foo=1&bar=2')
    })

    /**
     * @tc.number: testUrlURLParams002
     * @tc.name: testUrlURLParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlURLParams002', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let seach = that.params
        seach.append("ma 大","jk￥")
        var result = seach.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

    /**
     * @tc.number: testUrlURLParams003
     * @tc.name: testUrlURLParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlURLParams003', 0, function () {
        let that = new Url.URL('https://example.com?d=value1&c=value2&b=大&4=key4')
        let seach = that.params
        var result = seach.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

    /**
     * @tc.number: testUrlURLParams004
     * @tc.name: testUrlURLParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlURLParams004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let seach = that.params
        seach.append("foo~!@#$%^&*()_+-=","jk")
        var result = seach.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

    /**
     * @tc.number: testUrlURLParams005
     * @tc.name: testUrlURLParams
     * @tc.desc: Gets the SearchParams portion of the URL
     */
    it('testUrlURLParams005', 0, function () {
        let that = new Url.URL('http://username:password@host:8080/directory/file?你好=china#qwer=da')
        let seach = that.params
        var result = seach.toString()
        expect(result).assertEqual("%E4%BD%A0%E5%A5%BD=china")
    })

    /**
     * @tc.number: testUrlToJson001
     * @tc.name: testUrlToJson
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToJson001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/directory/file?query=pppppp#qwer=da')
    })

    /**
     * @tc.number: testUrlToJson002
     * @tc.name: testUrlToJson
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToJson002', 0, function () {
        let params = new Url.URL('http://host:8080/directory/file?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http://host:8080/directory/file?query=pppppp#qwer=da')
    })

    /**
     * @tc.number: testUrlToJson003
     * @tc.name: testUrlToJson
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToJson003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/')
    })

    /**
     * @tc.number: testUrlToJson004
     * @tc.name: testUrlToJson
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToJson004', 0, function () {
        let params = new Url.URL('http11://username:password@host:8080?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http11://username:password@host:8080?query=pppppp#qwer=da')
    })

    /**
     * @tc.number: testUrlToJson005
     * @tc.name: testUrlToJson
     * @tc.desc: Returns the serialized URL as a string.
     */
    it('testUrlToJson005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/directory')
    })

    /**
     * @tc.number: testUrlIPv6001
     * @tc.name: testUrlIPv6
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlIPv6001', 0, function () {
        let params = new Url.URL('http://[FEDC:BA98:7654:3210:FEDC:BA98:7654:3210]:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://[fedc:ba98:7654:3210:fedc:ba98:7654:3210]/index.html')
    })

    /**
     * @tc.number: testUrlIPv6002
     * @tc.name: testUrlIPv6
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlIPv6002', 0, function () {
        let params = new Url.URL('http://[1080:0:0:0:8:800:200C:417A]/index.html')
        var result= params.href
        expect(result).assertEqual('http://[1080::8:800:200c:417a]/index.html')
    })

    /**
     * @tc.number: testUrlIPv6003
     * @tc.name: testUrlIPv6
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlIPv6003', 0, function () {
        let params = new Url.URL('http://[::FFFF:129.144.52.38]:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://[::ffff:8190:3426]/index.html')
    })

    /**
     * @tc.number: testUrlIPv4001
     * @tc.name: testUrlIPv4
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlIPv4001', 0, function () {
        let params = new Url.URL('http://0377.0xff.255.1:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://255.255.255.1/index.html')
    })

    /**
     * @tc.number: testUrlIPv4002
     * @tc.name: testUrlIPv4
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlIPv4002', 0, function () {
        let params = new Url.URL('http://0377.0xff.255.g/index.html')
        var result= params.href
        expect(result).assertEqual('http://0377.0xff.255.g/index.html')
    })

    /**
     * @tc.number: testUrlIPv4003
     * @tc.name: testUrlIPv4
     * @tc.desc: Gets and sets the serialized URL.
     */
    it('testUrlIPv4003', 0, function () {
        let params = new Url.URL('http://190.254.245.9:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://190.254.245.9/index.html')
    })

    /**
     * @tc.number: testUrlConstruction001
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction001', 0, function () {
        let params = new Url.URL('https://developer.mozilla.org',)
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.number: testUrlConstruction002
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction002', 0, function () {
        let params = new Url.URL('https://developer.mozilla.org','flie:/developer.mozilla.org')
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.number: testUrlConstruction003
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction003', 0, function () {
        let params = new Url.URL('https://developer.mozilla.org','ftp://www.example.com')
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.number: testUrlConstruction004
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction004', 0, function () {
        let params = new Url.URL(' ', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/')
    })

    /**
     * @tc.number: testUrlConstruction005
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction005', 0, function () {
        let params = new Url.URL('.', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/')
    })

    /**
     * @tc.number: testUrlConstruction006
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction006', 0, function () {
        let params = new Url.URL('../h:', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/h:')
    })

    /**
     * @tc.number: testUrlConstruction007
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction007', 0, function () {
        let params = new Url.URL('/sca/./path/path/../scasa/jjjjj', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/sca/path/scasa/jjjjj')
    })

    /**
     * @tc.number: testUrlConstruction008
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction008', 0, function () {
        let params = new Url.URL('/../sca/./path/path/../scasa/jjjjj', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/sca/path/scasa/jjjjj')
    })

    /**
     * @tc.number: testUrlConstruction009
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction009', 0, function () {
        let params = new Url.URL( '/../sca/./path/path/../scasa/jjjjj', 'file://www.example.com')
        var result= params.href
        expect(result).assertEqual('file://www.example.com/sca/path/scasa/jjjjj')
    })

    /**
     * @tc.number: testUrlConstruction010
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction010', 0, function () {
        let params = new Url.URL('/../sca/./path/path/../scasa/jjjjj', 'file1://www.example.com')
        var result= params.href
        expect(result).assertEqual('file1://www.example.com/sca/path/scasa/jjjjj')
    })

    /**
     * @tc.number: testUrlConstruction011
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction011', 0, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('www.baidu.com/ssaa',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.0902zy.cn/www.baidu.com/ssaa')
    })

    /**
     * @tc.number: testUrlConstruction012
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction012', 0, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('//www.baidu.com/ssaa',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.baidu.com/ssaa')
    })

    /**
     * @tc.number: testUrlConstruction013
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction013', 0, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
    })

    /**
     * @tc.number: testUrlConstruction014
     * @tc.name: testUrlConstruction
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlConstruction014', 0, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        var result = params.searchParams.toString();
        expect(result).assertEqual('abc=123&def=456')
    })

    /**
     * @tc.number: testUrlparseURL001
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL001', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('https://developer.mozilla.org',)
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.number: testUrlparseURL002
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL002', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('https://developer.mozilla.org','flie:/developer.mozilla.org')
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.number: testUrlparseURL003
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL003', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('https://developer.mozilla.org','ftp://www.example.com')
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.number: testUrlparseURL004
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL004', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL(' ', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/')
    })

    /**
     * @tc.number: testUrlparseURL005
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL005', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('.', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/')
    })

    /**
     * @tc.number: testUrlparseURL006
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL006', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('../h:', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/h:')
    })

    /**
     * @tc.number: testUrlparseURL007
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, BusinessError: Parameter error.
     */
    it('testUrlparseURL007', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = undefined
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

    /**
     * @tc.number: testUrlparseURL008
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, BusinessError: Parameter error.
     */
    it('testUrlparseURL008', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 666;
            var b = 666;
            Url.URL.parseURL(a, b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

    /**
     * @tc.number: testUrlparseURL009
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, throw BusinessError:Parameter error.
    */
    it('testUrlparseURL009', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = '666666';
            var b = 666666;
            Url.URL.parseURL(a, b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string or URL`);
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string or URL`);
        }
    })

    /**
     * @tc.number: testUrlparseURL0010
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
    */
    it('testUrlparseURL0010', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = '666666';
            var b = "666666";
            Url.URL.parseURL(a, b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.number: testUrlparseURL0011
     * @tc.name: testUrlparseURL
     * @tc.desc: The second parameter of parseURL is undefined or null.
    */
    it('testUrlparseURL0011', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params1 =  Url.URL.parseURL('https://developer.mozilla.org', undefined)
        let result = params1.href
        expect(result).assertEqual('https://developer.mozilla.org/')
        let params2 =  Url.URL.parseURL('https://developer.mozilla.org', null)
        let result1 = params2.href
        expect(result1).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.number: testUrlparseURL0012
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
     it('testUrlparseURL0012', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168')
        var result= params2.href
        expect(result).assertEqual('http://0.0.0.168/')
    })

    /**
     * @tc.number: testUrlparseURL0013
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL0013', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.')
        var result= params2.href
        expect(result).assertEqual('http://0.0.0.168/')
    })

    /**
     * @tc.number: testUrlparseURL0014
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL0014', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1')
        var result= params2.href
        expect(result).assertEqual('http://168.0.0.1/')
    })

    /**
     * @tc.number: testUrlparseURL0015
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL0015', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.')
        var result= params2.href
        expect(result).assertEqual('http://168.0.0.1/')
    })

    /**
     * @tc.number: testUrlparseURL0016
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL0016', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.1')
        var result= params2.href
        expect(result).assertEqual('http://168.1.0.1/')
    })

    /**
     * @tc.number: testUrlparseURL0017
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL0017', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.60.114.105')
        var result= params2.href
        expect(result).assertEqual('http://168.60.114.105/')
    })

    /**
     * @tc.number: testUrlparseURL0018
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL0018', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.399')
        var result= params2.href
        expect(result).assertEqual('http://168.1.1.143/')
    })

    /**
     * @tc.number: testUrlparseURL0019
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL0019', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.3.0XFF')
        var result= params2.href
        expect(result).assertEqual('http://168.3.0.255/')
    })

    /**
     * @tc.number: testUrlparseURL0020
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, which is used to instantiate a URL object.
     */
    it('testUrlparseURL0020', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.3.65535')
        var result= params2.href
        expect(result).assertEqual('http://168.3.255.255/')
    })

    /**
     * @tc.number: testUrlparseURL0021
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
    */
    it('testUrlparseURL0021', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 'http://168.399.3';
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.number: testUrlparseURL0022
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
    */
    it('testUrlparseURL0022', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 'http://168.255.65536';
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.number: testUrlparseURL0023
     * @tc.name: testUrlparseURL
     * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
    */
    it('testUrlparseURL0023', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 'http://168.555.0X10000';
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })
})}