/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import JSON from "@ohos.util.json";
export default function JsonTest() {
describe('JsonTest', function () {

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0001
   * @tc.name: testparse0001
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0001", 0, function () {
    const jsonText = '{"name": "John", "age": 30}';
    let obj = JSON.parse(jsonText);
    expect( obj.hasOwnProperty('name')).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0002
   * @tc.name: testparse0002
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0002", 0, function () {
    function reviverFunc(key, value) {
      if (key === "age") {
        return value + 1;
      }
      return value;
    }
    const jsonText = '{"name": "John", "age": 30}';
    let obj = JSON.parse(jsonText, reviverFunc);
    expect(obj["age"]).assertEqual(31);
  });
  
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0003
   * @tc.name: testparse0003
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0003", 0, function () {
    let obj = JSON.parse("null");
    expect(obj).assertEqual(null);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0004
   * @tc.name: testparse0004
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0004", 0, function () {
    let obj = JSON.parse("true");
    expect(obj).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0005
   * @tc.name: testparse0005
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0005", 0, function () {
    let obj = JSON.parse("false");
    expect(obj).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0006
   * @tc.name: teststringify0006
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0006", 0, function () {
    let obj = JSON.stringify({});
    expect(obj).assertEqual("{}");
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0007
   * @tc.name: teststringify0007
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0007", 0, function () {
    let obj = JSON.stringify({name: "joy", age: 30});
    expect(obj).assertEqual('{"name":"joy","age":30}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0008
   * @tc.name: teststringify0008
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0008", 0, function () {
    let arr = [1, 2];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr);
    expect(rst).assertEqual('{"1":"John","2":30}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0009
   * @tc.name: teststringify0009
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0009", 0, function () {
    let arr = [1, 2];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr, 1);
    expect(rst).assertEqual('{\n "1": "John",\n "2": 30\n}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0010
   * @tc.name: teststringify0010
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0010", 0, function () {
    let arr = [1, 2];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr, "www");
    expect(rst).assertEqual('{\nwww"1": "John",\nwww"2": 30\n}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0011
   * @tc.name: teststringify0011
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0011", 0, function () {
    let arr = [1, 2];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr, "  ");
    expect(rst).assertEqual('{\n  "1": "John",\n  "2": 30\n}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0012
   * @tc.name: teststringify0012
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0012", 0, function () {
    let arr = [];
    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, arr);
    expect(rst).assertEqual('{}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0013
   * @tc.name: teststringify0013
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0013", 0, function () {
    const replacer = (key, value) => {
      if (typeof value === "string") {
        return value.toUpperCase();
      }
      return value;
    };

    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, replacer);
    expect(rst).assertEqual('{"1":"JOHN","2":30,"3":"NEW YORK"}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0014
   * @tc.name: teststringify0014
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0014", 0, function () {
    const replacer = (key, value) => {
      if (typeof value === "string") {
        return value.toUpperCase();
      }
      return value;
    };

    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, replacer, undefined);
    expect(rst).assertEqual('{"1":"JOHN","2":30,"3":"NEW YORK"}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0015
   * @tc.name: teststringify0015
   * @tc.desc: Convert a JavaScript object or value to a JSON string
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("teststringify0015", 0, function () {
    const replacer = (key, value) => {
      if (typeof value === "string") {
        return value.toUpperCase();
      }
      return value;
    };

    let obj = {1: "John", 2: 30, 3: "New York"};
    let rst = JSON.stringify(obj, replacer, "000");
    expect(rst).assertEqual('{\n000"1": "JOHN",\n000"2": 30,\n000"3": "NEW YORK"\n}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0016
   * @tc.name: testhas0016
   * @tc.desc: Checks whether the object parsed from a JSON string contains the property.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testhas0016", 0, function () {
    const obj = {"name": "John", "age": 30, "city": "New York"};
    let rst = JSON.has(obj, 'name');
    expect(rst).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0017
   * @tc.name: testhas0017
   * @tc.desc: Checks whether the object parsed from a JSON string contains the property.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testhas0017", 0, function () {
    const obj = {"name": "John", "age": 30, "city": "New York"};
    let rst = JSON.has(obj, 'sex');
    expect(rst).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0018
   * @tc.name: testremove0018
   * @tc.desc: Removes a property from the object parsed from a JSON string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("tesremove0018", 0, function () {
    const obj = {"name": "John", "age": 30, "city": "New York"};
    JSON.remove(obj, "name");
    let rst = JSON.has(obj, "name");
    expect(rst).assertEqual(false);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0019
   * @tc.name: testremove0019
   * @tc.desc: Removes a property from the object parsed from a JSON string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("tesremove0019", 0, function () {
    const obj = {"name": "John", "age": 30, "city": "New York"};
    JSON.remove(obj, "sex");
    let rst = JSON.has(obj, "name");
    expect(rst).assertEqual(true);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0020
   * @tc.name: testremove0020
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it("testparse0020", 0, function () {
      try {
        let rst = JSON.parse('12\t\r\n 34')
      } catch (e) {
        let name = e.name;
        expect(name).assertEqual('BusinessError');
      }
    });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0021
   * @tc.name: testremove0021
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0021", 0, function () {
    try {
      let rst = JSON.parse('\u2028\u20291234');
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0022
   * @tc.name: testremove0022
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0022", 0, function () {
    let rst = JSON.parse('\t\r \n{\t\r \n' +
      '"property"\t\r \n:\t\r \n{\t\r \n}\t\r \n,\t\r \n' +
      '"prop2"\t\r \n:\t\r \n' +
      '[\t\r \ntrue\t\r \n,\t\r \nnull\t\r \n,123.456\t\r \n]' +
      '\t\r \n}\t\r \n');
    let strRst = JSON.stringify(rst);
    expect(strRst).assertEqual('{"property":{},"prop2":[true,null,123.456]}');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0023
   * @tc.name: testremove0023
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0023", 0, function () {
    try {
      let rst = JSON.parse('12 34');
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0024
   * @tc.name: testremove0024
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0024", 0, function () {
    let rst = JSON.parse('"abc"');
    expect(rst).assertEqual(rst);
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0025
   * @tc.name: testremove0025
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0025", 0, function () {
    try {
      let rst = JSON.parse('""');
      let rst1 = JSON.stringify(rst);
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0026
   * @tc.name: testremove0026
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0026", 0, function () {
    try {
      let rst = JSON.parse('"\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007"');
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0027
   * @tc.name: testremove0027
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0027", 0, function () {
    let rst = JSON.parse('"\\u0058"');
    expect(rst).assertEqual('X');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0028
   * @tc.name: testremove0028
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0028", 0, function () {
    let rst = JSON.parse('"\\\\"');
    expect(rst).assertEqual('\\');
  });

  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_JSON_0029
   * @tc.name: testremove0029
   * @tc.desc: Parsing JSON strings
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testparse0029", 0, function () {
    var nullChars = new Array();
    nullChars[0] = '\"\u0000\"';
    try {
       let obj = JSON.parse('{ "name" : ' + nullChars[0] + "John" + nullChars[0] + ' } ');
    } catch (e) {
      let name = e.name;
      expect(name).assertEqual('BusinessError');
    }
  });
})}