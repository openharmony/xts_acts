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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import Url from "@ohos.url";
export default function UrlFunTest() {
  describe("UrlFunTest", function () {
    /**
     * @tc.number: TEST_PARAMS_APPEND_001
     * @tc.name  : testParamsAppend001
     * @tc.desc  : Appends a specified key/value pair as a new search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsAppend001", 0, function () {
      let that = Url.URL.parseURL("http://username:password@host:8080/directory/file?foo=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.append("ma", "jk");
      let result = params.toString();
      expect(result).assertEqual("foo=1&bar=2&ma=jk");
    });

    /**
     * @tc.number: TEST_PARAMS_APPEND_002
     * @tc.name  : testParamsAppend001
     * @tc.desc  : Appends a specified key/value pair as a new search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsAppend002", 0, function () {
      let that = Url.URL.parseURL("http://username:password@host:8080/directory/file?foo=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.append("ma 大", "jk￥");
      let result = params.toString();
      expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5");
    });

    /**
     * @tc.number: TEST_PARAMS_APPEND_003
     * @tc.name  : testParamsAppend001
     * @tc.desc  : Appends a specified key/value pair as a new search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsAppend003", 0, function () {
      let that = Url.URL.parseURL("http://username:password@host:8080/directory/file?foo=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.append("foo~!@#$%^&*()_+-=", "jk");
      let result = params.toString();
      expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk");
    });

    /**
     * @tc.number: TEST_PARAMS_APPEND_004
     * @tc.name  : testParamsAppend001
     * @tc.desc  : Appends a specified key/value pair as a new search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsAppend004", 0, function () {
      let that = Url.URL.parseURL("https://example.com?foo=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.append("app", "par");
      let result = params.toString();
      expect(result).assertEqual("foo=1&bar=2&app=par");
    });

    /**
     * @tc.number: TEST_PARAMS_APPEND_005
     * @tc.name  : testParamsAppend001
     * @tc.desc  : Appends a specified key/value pair as a new search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsAppend005", 0, function () {
      let that = Url.URL.parseURL("https://example.com?foo=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.append("123", "456");
      let result = params.toString();
      expect(result).assertEqual("foo=1&bar=2&123=456");
    });

    /**
     * @tc.number: TEST_PARAMS_APPEND_006
     * @tc.name  : testParamsAppend001
     * @tc.desc  : Appends throw BusinessError: Parameter error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsAppend006", 0, function () {
      let a = "123";
      let b = undefined;
      try {
        let that = Url.URL.parseURL("https://example.com?foo=1&bar=2");
        let params = new Url.URLParams(that.search);
        params.append(a, b);
        expect(0).assertEqual(1);
      } catch (err) {
        expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string`);
      }
    });

    /**
     * @tc.number: TEST_PARAMS_DELETE_001
     * @tc.name  : testParamsDelete001
     * @tc.desc  : Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsDelete001", 0, function () {
      let that = Url.URL.parseURL("https://example.com?foo=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.delete("foo");
      let result = params.toString();
      expect(result).assertEqual("bar=2");
    });

    /**
     * @tc.number: TEST_PARAMS_DELETE_002
     * @tc.name  : testParamsDelete002
     * @tc.desc  : Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsDelete002", 0, function () {
      let that = Url.URL.parseURL("https://example.com?foo大=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.delete("foo");
      let result = params.toString();
      expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    });

    /**
     * @tc.number: TEST_PARAMS_DELETE_003
     * @tc.name  : testParamsDelete003
     * @tc.desc  : Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsDelete003", 0, function () {
      let that = Url.URL.parseURL("https://example.com?foo大=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.delete("foo大");
      let result = params.toString();
      expect(result).assertEqual("bar=2");
    });

    /**
     * @tc.number: TEST_PARAMS_DELETE_004
     * @tc.name  : testParamsDelete004
     * @tc.desc  : Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsDelete004", 0, function () {
      let that = Url.URL.parseURL("https://example.com?foo=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.delete("bar");
      let result = params.toString();
      expect(result).assertEqual("foo=1");
    });

    /**
     * @tc.number: TEST_PARAMS_DELETE_005
     * @tc.name  : testParamsDelete005
     * @tc.desc  : Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsDelete005", 0, function () {
      let that = Url.URL.parseURL("https://example.com?foo=1&bar=2");
      let params = new Url.URLParams(that.search);
      params.delete("faa");
      let result = params.toString();
      expect(result).assertEqual("foo=1&bar=2");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_ALL_001
     * @tc.name  : testParamsGetAll001
     * @tc.desc  : Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGetAll001", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      params.append("key1", "AAA");
      let result = params.getAll("key1");
      expect(result.toString()).assertEqual("value1,AAA");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_ALL_002
     * @tc.name  : testParamsGetAll002
     * @tc.desc  : Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGetAll002", 0, function () {
      let params = new Url.URLParams("key1=value1&8=DEF");
      params.append("8", "A8A");
      let result = params.getAll("8");
      expect(result.toString()).assertEqual("DEF,A8A");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_ALL_003
     * @tc.name  : testParamsGetAll003
     * @tc.desc  : Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGetAll003", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2&key3=da");
      params.append("key3", "A3A");
      let result = params.getAll("key3");
      expect(result.toString()).assertEqual("da,A3A");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_ALL_004
     * @tc.name  : testParamsGetAll004
     * @tc.desc  : Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGetAll004", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2&key3=大");
      params.append("key3", "A3A");
      let result = params.getAll("key4");
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_ALL_005
     * @tc.name  : testParamsGetAll005
     * @tc.desc  : Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGetAll005", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2&key3=大");
      params.append("key3", "A3A");
      let result = params.getAll("key2");
      expect(result.toString()).assertEqual("value2");
    });

    /**
     * @tc.number: TEST_PARAMS_ENTRIES_001
     * @tc.name  : testParamsEntries001
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsEntries001", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");

      let i = 0;
      let arr = {};
      for (let pair of params.entries()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[1]).assertEqual("value1");
    });

    /**
     * @tc.number: TEST_PARAMS_ENTRIES_002
     * @tc.name  : testParamsEntries002
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsEntries002", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let i = 0;
      let arr = {};
      for (let pair of params.entries()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[2]).assertEqual("key2");
    });

    /**
     * @tc.number: TEST_PARAMS_ENTRIES_003
     * @tc.name  : testParamsEntries003
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsEntries003", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      params.append("foo", "jk");
      let i = 0;
      let arr = {};
      for (let pair of params.entries()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[5]).assertEqual("jk");
    });

    /**
     * @tc.number: TEST_PARAMS_ENTRIES_004
     * @tc.name  : testParamsEntries004
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsEntries004", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let i = 0;
      let arr = {};
      for (let pair of params.entries()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[3]).assertEqual("value2");
    });

    /**
     * @tc.number: TEST_PARAMS_ENTRIES_005
     * @tc.name  : testParamsEntries005
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsEntries005", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      params.append("jss", "txt");
      let i = 0;
      let arr = {};
      for (let pair of params.entries()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[4]).assertEqual("jss");
    });

    /**
     * @tc.number: TEST_PARAMS_FOREACH_001
     * @tc.name  : testParamsForEach001
     * @tc.desc  : Callback functions are used to traverse key-value pairs on the URLParams instance object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsForEach001", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let arr = {};
      let i = 0;
      function func(value, key, SearchParams) {
        arr[i] = value + " " + key + " " + (params === SearchParams);
        i++;
      }
      params.forEach(func);
      expect(arr[0]).assertEqual("value1 key1 true");
    });

    /**
     * @tc.number: TEST_PARAMS_FOREACH_002
     * @tc.name  : testParamsForEach002
     * @tc.desc  : Callback functions are used to traverse key-value pairs on the URLParams instance object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsForEach002", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let arr = {};
      let i = 0;
      function func(value, key, SearchParams) {
        arr[i] = value + " " + key + " " + (params === SearchParams);
        i++;
      }
      params.forEach(func);
      expect(arr[1]).assertEqual("value2 key2 true");
    });

    /**
     * @tc.number: TEST_PARAMS_FOREACH_003
     * @tc.name  : testParamsForEach003
     * @tc.desc  : Callback functions are used to traverse key-value pairs on the URLParams instance object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsForEach003", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      params.append("foo", "jk");
      let arr = {};
      let i = 0;
      function func(value, key, SearchParams) {
        arr[i] = value + " " + key + " " + (params === SearchParams);
        i++;
      }
      params.forEach(func);
      expect(arr[2]).assertEqual("jk foo true");
    });

    /**
     * @tc.number: TEST_PARAMS_FOREACH_004
     * @tc.name  : testParamsForEach004
     * @tc.desc  : Callback functions are used to traverse key-value pairs on the URLParams instance object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsForEach004", 0, function () {
      let params = new Url.URLParams("foo=bar&jss=txt");
      let arr = {};
      let i = 0;
      function func(value, key, SearchParams) {
        arr[i] = value + " " + key + " " + (params === SearchParams);
        i++;
      }
      params.forEach(func);
      expect(arr[1]).assertEqual("txt jss true");
    });

    /**
     * @tc.number: TEST_PARAMS_FOREACH_005
     * @tc.name  : testParamsForEach005
     * @tc.desc  : Callback functions are used to traverse key-value pairs on the URLParams instance object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsForEach005", 0, function () {
      let params = new Url.URLParams("foo=bar&jss=txt");
      params.append("foo", "jk");
      let arr = {};
      let i = 0;
      function func(value, key, SearchParams) {
        arr[i] = value + " " + key + " " + (params === SearchParams);
        i++;
      }
      params.forEach(func);
      expect(arr[0]).assertEqual("bar foo true");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_001
     * @tc.name  : testParamsGet001
     * @tc.desc  : Returns the first value associated to the given search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGet001", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let result = params.get("1");
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_PARAMS_GET_002
     * @tc.name  : testParamsGet002
     * @tc.desc  : Returns the first value associated to the given search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGet002", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let result = params.get("key2");
      expect(result).assertEqual("value2");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_003
     * @tc.name  : testParamsGet003
     * @tc.desc  : Returns the first value associated to the given search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGet003", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      params.append("5", "JKL");
      let result = params.get("5");
      expect(result).assertEqual("JKL");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_004
     * @tc.name  : testParamsGet004
     * @tc.desc  : Returns the first value associated to the given search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGet004", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let result = params.get("key1");
      expect(result).assertEqual("value1");
    });

    /**
     * @tc.number: TEST_PARAMS_GET_005
     * @tc.name  : testParamsGet005
     * @tc.desc  : Returns the first value associated to the given search parameter.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsGet005", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      params.append("jss", "JL");
      let result = params.get("jss");
      expect(result).assertEqual("JL");
    });

    /**
     * @tc.number: TEST_PARAMS_HAS_001
     * @tc.name  : testParamsHas001
     * @tc.desc  : Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsHas001", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2&key3=大");
      let result = params.has("2");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_PARAMS_HAS_002
     * @tc.name  : testParamsHas002
     * @tc.desc  : Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsHas002", 0, function () {
      let params = new Url.URLParams("小=value1&key2=value2&key3=大");
      let result = params.has("小");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_PARAMS_HAS_003
     * @tc.name  : testParamsHas003
     * @tc.desc  : Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsHas003", 0, function () {
      let params = new Url.URLParams("小=value1&￥=value2&key3=大");
      params.append("￥", "ACA");
      let result = params.has("￥");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number: TEST_PARAMS_HAS_004
     * @tc.name  : testParamsHas004
     * @tc.desc  : Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsHas004", 0, function () {
      let params = new Url.URLParams("小=value1&key2=value2&key3=大");
      let result = params.has("无");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_PARAMS_HAS_005
     * @tc.name  : testParamsHas005
     * @tc.desc  : Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsHas005", 0, function () {
      let params = new Url.URLParams("小=value1&￥=value2&key3=大");
      params.append("￥", "ACA");
      let result = params.has("￥11");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number: TEST_PARAMS_SET_001
     * @tc.name  : testParamsSet001
     * @tc.desc  : Sets the value associated with a given search parameter to the given value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it("testParamsSet001", 0, function () {
      let params = new Url.URLParams("1=value1&2=value2&key3=3");
      params.set("11", "CCC");
      let res = params.toString();
      expect(res).assertEqual("1=value1&2=value2&key3=3&11=CCC");
    });

    /**
     * @tc.number: TEST_PARAMS_SET_002
     * @tc.name  : testParamsSet002
     * @tc.desc  : Sets the value associated with a given search parameter to the given value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it("testParamsSet002", 0, function () {
      let params = new Url.URLParams("1=value1&2=value2&key3=3");
      params.set("10", "BBB");
      let res = params.toString();
      expect(res).assertEqual("1=value1&2=value2&key3=3&10=BBB");
    });

    /**
     * @tc.number: TEST_PARAMS_SET_003
     * @tc.name  : testParamsSet003
     * @tc.desc  : Sets the value associated with a given search parameter to the given value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it("testParamsSet003", 0, function () {
      let params = new Url.URLParams("1=value1&2=value2&key3=3");
      params.set("ma 大", "10￥");
      let res = params.toString();
      expect(res).assertEqual("1=value1&2=value2&key3=3&ma+%E5%A4%A7=10%EF%BF%A5");
    });

    /**
     * @tc.number: TEST_PARAMS_SET_004
     * @tc.name  : testParamsSet004
     * @tc.desc  : Sets the value associated with a given search parameter to the given value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it("testParamsSet004", 0, function () {
      let params = new Url.URLParams("1=value1&2=value2&key3=3");
      params.set("1", "CCC");
      let res = params.toString();
      expect(res).assertEqual("1=CCC&2=value2&key3=3");
    });

    /**
     * @tc.number: TEST_PARAMS_SET_005
     * @tc.name  : testParamsSet005
     * @tc.desc  : Sets the value associated with a given search parameter to the given value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it("testParamsSet005", 0, function () {
      let params = new Url.URLParams("1=value1&2=value2&key3=3");
      params.set("12", "BBB");
      let res = params.toString();
      expect(res).assertEqual("1=value1&2=value2&key3=3&12=BBB");
    });

    /**
     * @tc.number: TEST_PARAMS_SET_006
     * @tc.name  : testParamsSet006
     * @tc.desc  : toString throw BusinessError: Parameter error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     * If there were several matching values, this method deletes the others.
     * If the search parameter doesn't exist, this method creates it.
     */
    it("testParamsSet006", 0, function () {
      let b = undefined;
      try {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set("12", b);
        let res = params.toString();
        expect(0).assertEqual(1);
      } catch (err) {
        expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string`);
      }
    });

    /**
     * @tc.number: TEST_PARAMS_SORT_001
     * @tc.name  : testParamsSort001
     * @tc.desc  : Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSort001", 0, function () {
      let params = new Url.URLParams("1=value1&3=value3&2=key2");
      params.sort();
      let res = params.toString();
      expect(res).assertEqual("1=value1&2=key2&3=value3");
    });

    /**
     * @tc.number: TEST_PARAMS_SORT_002
     * @tc.name  : testParamsSort002
     * @tc.desc  : Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSort002", 0, function () {
      let params = new Url.URLParams("a=value1&c=value2&b=key2");
      params.sort();
      let res = params.toString();
      expect(res).assertEqual("a=value1&b=key2&c=value2");
    });

    /**
     * @tc.number: TEST_PARAMS_SORT_003
     * @tc.name  : testParamsSort003
     * @tc.desc  : Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSort003", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b=33");
      params.append("a", "ACA");
      params.sort();
      let res = params.toString();
      expect(res).assertEqual("a=ACA&b=33&c=value2&d=value1");
    });

    /**
     * @tc.number: TEST_PARAMS_SORT_004
     * @tc.name  : testParamsSort004
     * @tc.desc  : Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSort004", 0, function () {
      let params = new Url.URLParams("1=value1&3=value3&2=key2&4=key4");
      params.sort();
      let res = params.toString();
      expect(res).assertEqual("1=value1&2=key2&3=value3&4=key4");
    });

    /**
     * @tc.number: TEST_PARAMS_SORT_005
     * @tc.name  : testParamsSort005
     * @tc.desc  : Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSort005", 0, function () {
      let params = new Url.URLParams("a=value1&c=value2&4=key4&b=key2");
      params.sort();
      let res = params.toString();
      expect(res).assertEqual("4=key4&a=value1&b=key2&c=value2");
    });

    /**
     * @tc.number: TEST_PARAMS_KEYS_001
     * @tc.name  : testParamsKeys001
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsKeys001", 0, function () {
      let params = new Url.URLParams("小=value1&￥=value2&key3=大");
      let arr = {};
      let i = 0;
      for (let key of params.keys()) {
        arr[i] = key;
        i++;
      }
      expect(arr[0]).assertEqual("小");
    });

    /**
     * @tc.number: TEST_PARAMS_KEYS_002
     * @tc.name  : testParamsKeys002
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsKeys002", 0, function () {
      let params = new Url.URLParams("小=value1&￥=value2&key3=大");
      let arr = {};
      let i = 0;
      for (let key of params.keys()) {
        arr[i] = key;
        i++;
      }
      expect(arr[1]).assertEqual("￥");
    });

    /**
     * @tc.number: TEST_PARAMS_KEYS_003
     * @tc.name  : testParamsKeys003
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsKeys003", 0, function () {
      let params = new Url.URLParams("小=value1&￥=value2&key3=大");
      let arr = {};
      let i = 0;
      for (let key of params.keys()) {
        arr[i] = key;
        i++;
      }
      expect(arr[2]).assertEqual("key3");
    });

    /**
     * @tc.number: TEST_PARAMS_KEYS_004
     * @tc.name  : testParamsKeys004
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsKeys004", 0, function () {
      let params = new Url.URLParams("小=value1&￥=value2&key3=大&key4=六");
      let arr = {};
      let i = 0;
      for (let key of params.keys()) {
        arr[i] = key;
        i++;
      }
      expect(arr[3]).assertEqual("key4");
    });

    /**
     * @tc.number: TEST_PARAMS_KEYS_005
     * @tc.name  : testParamsKeys005
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsKeys005", 0, function () {
      let params = new Url.URLParams("小=value1&￥=value2&key3=大&key4=六&key5=发");
      let arr = {};
      let i = 0;
      for (let key of params.keys()) {
        arr[i] = key;
        i++;
      }
      expect(arr[4]).assertEqual("key5");
    });

    /**
     * @tc.number: TEST_PARAMS_VALUES_001
     * @tc.name  : testParamsValues001
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsValues001", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b=大");
      let arr = {};
      let i = 0;
      for (let value of params.values()) {
        arr[i] = value;
        i++;
      }
      expect(arr[0]).assertEqual("value1");
    });

    /**
     * @tc.number: TEST_PARAMS_VALUES_002
     * @tc.name  : testParamsValues002
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsValues002", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b=大");
      let arr = {};
      let i = 0;
      for (let value of params.values()) {
        arr[i] = value;
        i++;
      }
      expect(arr[1]).assertEqual("value2");
    });

    /**
     * @tc.number: TEST_PARAMS_VALUES_003
     * @tc.name  : testParamsValues003
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsValues003", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b=大");
      params.append("a", "ACA");
      let arr = {};
      let i = 0;
      for (let value of params.values()) {
        arr[i] = value;
        i++;
      }
      expect(arr[3]).assertEqual("ACA");
    });

    /**
     * @tc.number: TEST_PARAMS_VALUES_004
     * @tc.name  : testParamsValues004
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsValues004", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4");
      let arr = {};
      let i = 0;
      for (let value of params.values()) {
        arr[i] = value;
        i++;
      }
      expect(arr[3]).assertEqual("key4");
    });

    /**
     * @tc.number: TEST_PARAMS_VALUES_005
     * @tc.name  : testParamsValues005
     * @tc.desc  : Returns an iterator allowing to go through all keys contained in this object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsValues005", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4&5=key5");
      let arr = {};
      let i = 0;
      for (let value of params.values()) {
        arr[i] = value;
        i++;
      }
      expect(arr[4]).assertEqual("key5");
    });

    /**
     * @tc.number: TEST_PARAMS_SYMBOL_ITERATOR_001
     * @tc.name  : testParamsSymbolIterator001
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSymbolIterator001", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let i = 0;
      let arr = {};
      for (let pair of params[Symbol.iterator]()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[1]).assertEqual("value1");
    });

    /**
     * @tc.number: TEST_PARAMS_SYMBOL_ITERATOR_002
     * @tc.name  : testParamsSymbolIterator002
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSymbolIterator002", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let i = 0;
      let arr = {};
      for (let pair of params[Symbol.iterator]()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[2]).assertEqual("key2");
    });

    /**
     * @tc.number: TEST_PARAMS_SYMBOL_ITERATOR_003
     * @tc.name  : testParamsSymbolIterator003
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSymbolIterator003", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      params.append("foo", "jk");
      let i = 0;
      let arr = {};
      for (let pair of params[Symbol.iterator]()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[5]).assertEqual("jk");
    });

    /**
     * @tc.number: TEST_PARAMS_SYMBOL_ITERATOR_004
     * @tc.name  : testParamsSymbolIterator004
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSymbolIterator004", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      let i = 0;
      let arr = {};
      for (let pair of params[Symbol.iterator]()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[3]).assertEqual("value2");
    });

    /**
     * @tc.number: TEST_PARAMS_SYMBOL_ITERATOR_005
     * @tc.name  : testParamsSymbolIterator005
     * @tc.desc  : Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsSymbolIterator005", 0, function () {
      let params = new Url.URLParams("key1=value1&key2=value2");
      params.append("jss", "txt");
      let i = 0;
      let arr = {};
      for (let pair of params[Symbol.iterator]()) {
        arr[i] = pair[0];
        i++;
        arr[i] = pair[1];
        i++;
      }
      expect(arr[4]).assertEqual("jss");
    });

    /**
     * @tc.number: TEST_PARAMS_TO_STRING_001
     * @tc.name  : testParamsToString001
     * @tc.desc  : Returns a query string suitable for use in a URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsToString001", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b=大");
      let result = params.toString();
      expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7");
    });

    /**
     * @tc.number: TEST_PARAMS_TO_STRING_002
     * @tc.name  : testParamsToString002
     * @tc.desc  : Returns a query string suitable for use in a URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsToString002", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b= 大");
      params.append("1 12", "QQQ");
      let result = params.toString();
      expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&1+12=QQQ");
    });

    /**
     * @tc.number: TEST_PARAMS_TO_STRING_003
     * @tc.name  : testParamsToString003
     * @tc.desc  : Returns a query string suitable for use in a URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsToString003", 0, function () {
      let params = new Url.URLParams("$=()");
      params.delete("5");
      let result = params.toString();
      expect(result).assertEqual("%24=%28%29");
    });

    /**
     * @tc.number: TEST_PARAMS_TO_STRING_004
     * @tc.name  : testParamsToString004
     * @tc.desc  : Returns a query string suitable for use in a URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsToString004", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4");
      let result = params.toString();
      expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4");
    });

    /**
     * @tc.number: TEST_PARAMS_TO_STRING_005
     * @tc.name  : testParamsToString005
     * @tc.desc  : Returns a query string suitable for use in a URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsToString005", 0, function () {
      let params = new Url.URLParams("d=value1&c=value2&b= 大&4=key4&5=key5");
      params.append("1 12", "QQQ");
      let result = params.toString();
      expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&4=key4&5=key5&1+12=QQQ");
    });

    /**
     * @tc.number: TEST_URL_TO_STRING_001
     * @tc.name  : testUrlToString001
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToString001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.toString();
      expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment");
    });

    /**
     * @tc.number: TEST_URL_TO_STRING_002
     * @tc.name  : testUrlToString002
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToString002", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file");
      let result = params.toString();
      expect(result).assertEqual("http://username:password@host:8080/directory/file");
    });

    /**
     * @tc.number: TEST_URL_TO_STRING_003
     * @tc.name  : testUrlToString003
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToString003", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080#fragment");
      let result = params.toString();
      expect(result).assertEqual("http://username:password@host:8080/#fragment");
    });

    /**
     * @tc.number: TEST_URL_TO_STRING_004
     * @tc.name  : testUrlToString004
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToString004", 0, function () {
      let params = Url.URL.parseURL("http1://host/directory/file?query#fragment");
      let result = params.toString();
      expect(result).assertEqual("http1://host/directory/file?query#fragment");
    });

    /**
     * @tc.number: TEST_URL_TO_STRING_005
     * @tc.name  : testUrlToString005
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToString005", 0, function () {
      let params = Url.URL.parseURL("http:host:8080/directory/file?query#fragment");
      let result = params.toString();
      expect(result).assertEqual("http://host:8080/directory/file?query#fragment");
    });

    /**
     * @tc.number: TEST_URL_PARSE_URL_001
     * @tc.name  : testUrlParseUrl001
     * @tc.desc  : URL constructor, which is used to instantiate a URL object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlParseUrl001", 0, function () {
      let params = new Url.URL();
      expect(params != null).assertTrue();
      let params2 = Url.URL.parseURL("https://developer.mozilla.org");
      let result = params2.href;
      expect(result).assertEqual("https://developer.mozilla.org/");
    });

    /**
     * @tc.number: TEST_URL_PARSE_URL_002
     * @tc.name  : testUrlParseUrl002
     * @tc.desc  : URL constructor, which is used to instantiate a URL object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlParseUrl002", 0, function () {
      let params = new Url.URL();
      expect(params != null).assertTrue();
      let params2 = Url.URL.parseURL("https://developer.mozilla.org", "flie:/developer.mozilla.org");
      let result = params2.href;
      expect(result).assertEqual("https://developer.mozilla.org/");
    });

    /**
     * @tc.number: TEST_URL_PARSE_URL_003
     * @tc.name  : testUrlParseUrl003
     * @tc.desc  : URL constructor, which is used to instantiate a URL object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlParseUrl003", 0, function () {
      let params = new Url.URL();
      expect(params != null).assertTrue();
      let params2 = Url.URL.parseURL("https://developer.mozilla.org", "ftp://www.example.com");
      let result = params2.href;
      expect(result).assertEqual("https://developer.mozilla.org/");
    });

    /**
     * @tc.number: TEST_URL_PARSE_URL_004
     * @tc.name  : testUrlParseUrl004
     * @tc.desc  : URL constructor, which is used to instantiate a URL object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlParseUrl004", 0, function () {
      let params = new Url.URL();
      expect(params != null).assertTrue();
      let params2 = Url.URL.parseURL(" ", "http://www.example.com");
      let result = params2.href;
      expect(result).assertEqual("http://www.example.com/");
    });

    /**
     * @tc.number: TEST_URL_PARSE_URL_005
     * @tc.name  : testUrlParseUrl005
     * @tc.desc  : URL constructor, which is used to instantiate a URL object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlParseUrl005", 0, function () {
      let params = new Url.URL();
      expect(params != null).assertTrue();
      let params2 = Url.URL.parseURL(".", "http://www.example.com");
      let result = params2.href;
      expect(result).assertEqual("http://www.example.com/");
    });

    /**
     * @tc.number: TEST_URL_PARSE_URL_006
     * @tc.name  : testUrlParseUrl006
     * @tc.desc  : URL constructor, which is used to instantiate a URL object.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlParseUrl006", 0, function () {
      let params = new Url.URL();
      expect(params != null).assertTrue();
      let params2 = Url.URL.parseURL("../h:", "http://www.example.com");
      let result = params2.href;
      expect(result).assertEqual("http://www.example.com/h:");
    });

    /**
     * @tc.number: TEST_URL_PARSE_URL_007
     * @tc.name  : testUrlParseUrl007
     * @tc.desc  : URL constructor, BusinessError: Parameter error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlParseUrl007", 0, function () {
      let a = undefined;
      try {
        let params = new Url.URL();
        expect(params != null).assertTrue();
        Url.URL.parseURL(a);
        expect(0).assertEqual(1);
      } catch (err) {
        expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
      }
    });

    /**
     * @tc.number: TEST_URL_PARSE_URL_008
     * @tc.name  : testUrlParseUrl008
     * @tc.desc  : URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlParseUrl008", 0, function () {
      try {
        let params = new Url.URL();
        expect(params != null).assertTrue();
        let a = "666666";
        let b = "666666";
        Url.URL.parseURL(a, b);
        expect(0).assertEqual(1);
      } catch (err) {
        expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`);
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
      }
    });

    /**
     * @tc.number: TEST_URL_TO_JSON_001
     * @tc.name  : testUrlToJson001
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToJson001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query=pppppp#qwer=da");
      let result = params.toJSON();
      expect(result).assertEqual("http://username:password@host:8080/directory/file?query=pppppp#qwer=da");
    });

    /**
     * @tc.number: TEST_URL_TO_JSON_002
     * @tc.name  : testUrlToJson002
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToJson002", 0, function () {
      let params = Url.URL.parseURL("http://host:8080/directory/file?query=pppppp#qwer=da");
      let result = params.toJSON();
      expect(result).assertEqual("http://host:8080/directory/file?query=pppppp#qwer=da");
    });

    /**
     * @tc.number: TEST_URL_TO_JSON_003
     * @tc.name  : testUrlToJson003
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToJson003", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080");
      let result = params.toJSON();
      expect(result).assertEqual("http://username:password@host:8080/");
    });

    /**
     * @tc.number: TEST_URL_TO_JSON_004
     * @tc.name  : testUrlToJson004
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToJson004", 0, function () {
      let params = Url.URL.parseURL("http11://username:password@host:8080?query=pppppp#qwer=da");
      let result = params.toJSON();
      expect(result).assertEqual("http11://username:password@host:8080?query=pppppp#qwer=da");
    });

    /**
     * @tc.number: TEST_URL_TO_JSON_005
     * @tc.name  : testUrlToJson005
     * @tc.desc  : Returns the serialized URL as a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testUrlToJson005", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory");
      let result = params.toJSON();
      expect(result).assertEqual("http://username:password@host:8080/directory");
    });

    /**
     * @tc.number: TEST_PARAMS_CONSTRUCTION_001
     * @tc.name  : testParamsConstruction001
     * @tc.desc  : A parameterized constructor used to create an URLParams instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsConstruction001", 0, function () {
      let params = new Url.URLParams("?user=abc&query=xyz");
      let result = params.toString();
      expect(result).assertEqual("user=abc&query=xyz");
    });

    /**
     * @tc.number: TEST_PARAMS_CONSTRUCTION_002
     * @tc.name  : testParamsConstruction002
     * @tc.desc  : A parameterized constructor used to create an URLParams instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsConstruction002", 0, function () {
      let params = new Url.URLParams({
        user: "abc",
        query: "first",
      });
      let result = params.toString();
      expect(result).assertEqual("user=abc&query=first");
    });

    /**
     * @tc.number: TEST_PARAMS_CONSTRUCTION_003
     * @tc.name  : testParamsConstruction003
     * @tc.desc  : A parameterized constructor used to create an URLParams instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsConstruction003", 0, function () {
      let params = new Url.URLParams([
        ["user", "abc"],
        ["query", "first"],
        ["query", "second"],
      ]);
      let result = params.toString();
      expect(result).assertEqual("user=abc&query=first&query=second");
    });

    /**
     * @tc.number: TEST_PARAMS_CONSTRUCTION_004
     * @tc.name  : testParamsConstruction004
     * @tc.desc  : A parameterized constructor used to create an URLParams instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsConstruction004", 0, function () {
      let params = new Url.URLParams();
      params.append("abcde", "fghki");
      let paramsResult = params.toString();
      expect(paramsResult).assertEqual("abcde=fghki");
    });

    /**
     * @tc.number: TEST_PARAMS_CONSTRUCTION_005
     * @tc.name  : testParamsConstruction005
     * @tc.desc  : A parameterized constructor used to create an URLParams instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsConstruction005", 0, function () {
      let param;
      let params = new Url.URLParams(param);
      params.append("abcde", "fghki");
      let paramsResult = params.toString();
      expect(paramsResult).assertEqual("abcde=fghki");
    });

    /**
     * @tc.number: TEST_PARAMS_CONSTRUCTION_006
     * @tc.name  : testParamsConstruction006
     * @tc.desc  : BusinessError: Parameter error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testParamsConstruction006", 0, function () {
      let param = [["user", "abc", "error"]];
      try {
        let params = new Url.URLParams(param);
        expect(0).assertEqual(1);
      } catch (err) {
        expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${param} must be string[][]`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`Parameter error.The type of ${param} must be string[][]`);
      }
    });

    /**
     * @tc.number: TEST_URL_HASH_001
     * @tc.name  : testUrlHash001
     * @tc.desc  : Gets and sets the fragment portion of the URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlHash001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query=pppppp#fragment");
      let result = params.hash;
      expect(result).assertEqual("#fragment");
    });

    /**
     * @tc.number: TEST_URL_HOST_001
     * @tc.name  : testUrlHost001
     * @tc.desc  : Gets and sets the host portion of the URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlHost001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.host;
      expect(result).assertEqual("host:8080");
    });

    /**
     * @tc.number: TEST_URL_HOST_NAME_001
     * @tc.name  : testUrlHostName001
     * @tc.desc  : Gets and sets the host name portion of the URL，not include the port.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlHostName001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.hostname;
      expect(result).assertEqual("host");
    });

    /**
     * @tc.number: TEST_URL_HREF_001
     * @tc.name  : testUrlHref001
     * @tc.desc  : Gets and sets the serialized URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlHref001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.href;
      expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment");
    });

    /**
     * @tc.number: TEST_URL_ORIGIN_001
     * @tc.name  : testUrlOrigin001
     * @tc.desc  : Gets the read-only serialization of the URL's origin.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlOrigin001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.origin;
      expect(result).assertEqual("http://host:8080");
    });

    /**
     * @tc.number: TEST_URL_PASSWORD_001
     * @tc.name  : testUrlPassword001
     * @tc.desc  : Gets and sets the password portion of the URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlPassword001", 0, function () {
      let params = Url.URL.parseURL("http://username:11@host:8080/directory/file?query#fragment");
      let result = params.password;
      expect(result).assertEqual("11");
    });

    /**
     * @tc.number: TEST_URL_PATHNAME_001
     * @tc.name  : testUrlPathName001
     * @tc.desc  : Gets and sets the path portion of the URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlPathName001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.pathname;
      expect(result).assertEqual("/directory/file");
    });

    /**
     * @tc.number: TEST_URL_PORT_001
     * @tc.name  : testUrlPort001
     * @tc.desc  : Gets and sets the port portion of the URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlPort001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.port;
      expect(result).assertEqual("8080");
    });

    /**
     * @tc.number: TEST_URL_PROTOCOL_001
     * @tc.name  : testUrlProtocol001
     * @tc.desc  : Gets and sets the protocol portion of the URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlProtocol001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.protocol;
      expect(result).assertEqual("http:");
    });

    /**
     * @tc.number: TEST_URL_SEARCH_001
     * @tc.name  : testUrlSearch001
     * @tc.desc  : Gets and sets the serialized query portion of the URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlSearch001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query=qqqq#fragment");
      let result = params.search;
      expect(result).assertEqual("?query=qqqq");
    });

    /**
     * @tc.number: TEST_URL_URL_PARAMS_001
     * @tc.name  : testUrlURLParams001
     * @tc.desc  : Gets the SearchParams portion of the URL
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlURLParams001", 0, function () {
      let that = Url.URL.parseURL("http://username:password@host:8080/directory/file?foo=1&bar=2");
      let seach = that.params;
      let result = seach.toString();
      expect(result).assertEqual("foo=1&bar=2");
    });

    /**
     * @tc.number: TEST_URL_USERNAME_001
     * @tc.name  : testUrlUserName001
     * @tc.desc  : Gets and sets the username portion of the URL.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     */
    it("testUrlUserName001", 0, function () {
      let params = Url.URL.parseURL("http://username:password@host:8080/directory/file?query#fragment");
      let result = params.username;
      expect(result).assertEqual("username");
    });
  });
}
