/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import TreeMap from "@ohos.util.TreeMap";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function TreeMapTest() {
describe("TreeMapTest", function () {
                          
  /**
   * @tc.number: TEST_CONSTRUCTOR_001
   * @tc.name  : testConstructor001
   * @tc.desc  : Create an TreeMap instance. For example: let treeMap = new TreeMap().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testConstructor001", 0, function () {
    try {
      let treeMap = new TreeMap();
      expect(treeMap != undefined).assertEqual(true);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The TreeMap's constructor cannot be directly invoked");
    }
  });

  /**
   * @tc.number: TEST_LENGTH_001
   * @tc.name  : testLength001
   * @tc.desc  : Get the number of key value pairs in the TreeMap instance. For example: treeMap.length.
   * @tc.size  : MediumTest
   * @tc.type  : Field
   * @tc.level : Level 1
   */
  it("testLength001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.length;
    expect(res).assertEqual(5);
  });
                            
  /**
   * @tc.number: TEST_LENGTH_002
   * @tc.name  : testLength002
   * @tc.desc  : Get the number of key value pairs in the TreeMap instance. For example: treeMap.length.
   * @tc.size  : MediumTest
   * @tc.type  : Field
   * @tc.level : Level 1
   */
  it("testLength002", 0, function () {
    let treeMap = new TreeMap();
    let res = treeMap.length;
    expect(res).assertEqual(0);
  });

  /**
   * @tc.number: TEST_ISEMPTY_001
   * @tc.name  : testIsEmpty001
   * @tc.desc  : Determine whether the TreeMap instance is empty. For example: treeMap.isEmpty().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */                                                                                              
  it("testIsEmpty001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.isEmpty();
    expect(res).assertEqual(false);
    treeMap.clear();
    let res1 = treeMap.isEmpty();
    expect(res1).assertEqual(true);
  });

  /**
   * @tc.number: TEST_HASKEY_001
   * @tc.name  : testHasKey001
   * @tc.desc  : Determine whether the TreeMap contains the specified key. For example: treeMap.hasKey(1).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testHasKey001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    let res = treeMap.hasKey(1);
    expect(res).assertEqual(true);
    let res1 = treeMap.hasKey(6);
    expect(res1).assertEqual(false);
  });

  /**
   * @tc.number: TEST_HASVALUE_001
   * @tc.name  : testHasValue001
   * @tc.desc  : Determine whether the TreeMap contains the specified Value. For example: treeMap.hasValue("a").
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testHasValue001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.hasValue("a");
    expect(res).assertEqual(true);
    let res1 = treeMap.hasValue("d");
    expect(res1).assertEqual(false);
  });

  /**
   * @tc.number: TEST_GET_001
   * @tc.name  : testGet001
   * @tc.desc  : Get the corresponding value through the key. For example: treeMap.get(1).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGet001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.get(1);
    expect(res).assertEqual("b");
  });

  /**
   * @tc.number: TEST_GET_002
   * @tc.name  : testGet002
   * @tc.desc  : Get the corresponding value through the key. For example: treeMap.get(1).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGet002", 0, function () {
    let treeMap = new TreeMap();
    let res = treeMap.get(1);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_GET_003
   * @tc.name  : testGet003
   * @tc.desc  : Get the corresponding value through the key. For example: treeMap.get(0).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGet003", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.clear();
    expect(treeMap.length).assertEqual(0);
    let res = treeMap.get(0);
     expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_GETFIRSTKEY_001
   * @tc.name  : testGetFirstKey001
   * @tc.desc  : Get the key that ranks first in the TreeMap instance. For example: treeMap.getFirstKey().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetFirstKey001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.getFirstKey();
    expect(res).assertEqual(0);
  });

  /**
   * @tc.number: TEST_GETFIRSTKEY_002
   * @tc.name  : testGetFirstKey002
   * @tc.desc  : Get the key that ranks first in the TreeMap instance. For example: treeMap.getFirstKey().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetFirstKey002", 0, function () {
    let treeMap = new TreeMap();
    let res = treeMap.getFirstKey();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_GETLASTKEY_001
   * @tc.name  : testGetLastKey001
   * @tc.desc  : Get the last sorted key in the TreeMap instance. For example: treeMap.getLastKey().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetLastKey001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.getLastKey();
    expect(res).assertEqual(2);
  });

  /**
   * @tc.number: TEST_GETLASTKEY_002
   * @tc.name  : testGetLastKey002
   * @tc.desc  : Get the last sorted key in the TreeMap instance. For example: treeMap.getLastKey().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetLastKey002", 0, function () {
    let treeMap = new TreeMap();
    let res = treeMap.getLastKey();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_SETALL_001
   * @tc.name  : testSetAll001
   * @tc.desc  : Copy key value pairs from one HashMap to another. For example: treeMap.setAll(treeMap1).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSetAll001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    let treeMap1 = new TreeMap();
    treeMap1.set(0, "a");
    treeMap1.set(1, "b");
    treeMap1.set(2, "c");
    treeMap.setAll(treeMap1);
    let res = treeMap.get(0);
    expect(res).assertEqual("a");
    let res1 = treeMap.get(1);
    expect(res1).assertEqual("b");
    let res2 = treeMap.get(2);
    expect(res2).assertEqual("c");
  });

  /**
   * @tc.number: TEST_SET_001
   * @tc.name  : testSet001
   * @tc.desc  : Add a pair of key value pairs to the TreeMap. For example: treeMap.set(0, "四").
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "四");
    let res = treeMap.get(0);
    expect(res).assertEqual("四");
  });

  /**
   * @tc.number: TEST_SET_002
   * @tc.name  : testSet002
   * @tc.desc  : Add a pair of key value pairs to the TreeMap. For example: treeMap.set(0, 8).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet002", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, 8);
    let res = treeMap.get(0);
    expect(res).assertEqual(8);
  });

  /**
   * @tc.number: TEST_SET_003
   * @tc.name  : testSet003
   * @tc.desc  : Add a pair of key value pairs to the TreeMap.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet003", 0, function () {
    let treeMap = new TreeMap();
    let a = [1, 2, 3, 4];
    treeMap.set(0, a);
    let res = treeMap.get(0);
    expect(res).assertEqual(a);
  });

  /**
   * @tc.number: TEST_SET_004
   * @tc.name  : testSet004
   * @tc.desc  : Add a pair of key value pairs to the TreeMap.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet004", 0, function () {
    let treeMap = new TreeMap();
    let a = {name: "lala", age: "13"};
    treeMap.set(0, a);
    let res = treeMap.get(0);
    expect(res).assertEqual(a);
  });

  /**
   * @tc.number: TEST_SET_005
   * @tc.name  : testSet005
   * @tc.desc  : Add a pair of key value pairs to the TreeMap. For example: treeMap.set(2, "*").
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet005", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(2, "*");
    let res = treeMap.get(2);
    expect(res).assertEqual("*");
  });

  /**
   * @tc.number: TEST_SET_006
   * @tc.name  : testSet006
   * @tc.desc  : Add a pair of key value pairs to the TreeMap. For example: treeMap.set(-2, 3.14).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet006", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(-2, 3.14);
    let res = treeMap.get(-2);
    expect(res).assertEqual(3.14);
  });

  /**
   * @tc.number: TEST_SET_007
   * @tc.name  : testSet007
   * @tc.desc  : Add a pair of key value pairs to the TreeMap. For example: treeMap.set(100, true).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet007", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(100, true);
    let res = treeMap.get(100);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_SET_008
   * @tc.name  : testSet008
   * @tc.desc  : Add a pair of key value pairs to the TreeMap. For example: treeMap.set(100, true).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet008", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(100, "");
    let res = treeMap.get(100);
    expect(res).assertEqual("");
  });

  /**
   * @tc.number: TEST_SET_009
   * @tc.name  : testSet009
   * @tc.desc  : Add a pair of key value pairs to the TreeMap. For example: treeMap.set("a", "四").
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet009", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set("a", "四");
    let res = treeMap.get("a");
    expect(res).assertEqual("四");
  });

  /**
   * @tc.number: TEST_SET_010
   * @tc.name  : testSet010
   * @tc.desc  : Add a pair of key value pairs to the TreeMap.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testSet010", 0, function () {
    let treeMap = new TreeMap();
    for (let i = 0; i < 10000; i++) {
      treeMap.set(0, 8);
    }
    let res = treeMap.get(0);
    expect(res).assertEqual(8);
    expect(treeMap.length).assertEqual(1);
  });

  /**
   * @tc.number: TEST_REMOVE_001
   * @tc.name  : testRemove001
   * @tc.desc  : Delete key value pairs according to key. For example: treeMap.remove(1).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testRemove001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.remove(1);
    expect(res).assertEqual("b");
  });

  /**
   * @tc.number: TEST_REMOVE_002
   * @tc.name  : testRemove002
   * @tc.desc  : Delete key value pairs according to key. For example: treeMap.remove(1).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testRemove002", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    let res = treeMap.remove(1);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_CLEAR_001
   * @tc.name  : testClear001
   * @tc.desc  : Clear all key value pairs in TreeMap. For example: treeMap.clear().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testClear001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.clear();
    let res = treeMap.length;
    expect(res).assertEqual(0);
  });

  /**
   * @tc.number: TEST_CLEAR_002
   * @tc.name  : testClear002
   * @tc.desc  : Clear all key value pairs in TreeMap. For example: treeMap.clear().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testClear002", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.clear();
    let res = treeMap.length;
    expect(res).assertEqual(0);
    treeMap.set(3, "d");
    let va = treeMap.get(3);
    expect(va).assertEqual("d");
  });

  /**
   * @tc.number: TEST_GETLOWERKEY_001
   * @tc.name  : testGetLowerKey001
   * @tc.desc  : Get a key that is a little lower than the specified key sort.
   * For example: treeMap.getLowerKey(2).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetLowerKey001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.getLowerKey(2);
    expect(res).assertEqual(1);
  });

  /**
   * @tc.number: TEST_GETLOWERKEY_002
   * @tc.name  : testGetLowerKey002
   * @tc.desc  : Get a key that is a little lower than the specified key sort. For example: treeMap.getLowerKey(2).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetLowerKey002", 0, function () {
    let treeMap = new TreeMap();
    let res = treeMap.getLowerKey(2);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_GETHIGHERKEY_001
   * @tc.name  : testGetHigherKey001
   * @tc.desc  : Get a key that is a little higher than the specified key sort. For example: treeMap.getLowerKey(2).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetHigherKey001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.getHigherKey(2);
    expect(res).assertEqual(3);
  });

  /**
   * @tc.number: TEST_GETHIGHERKEY_002
   * @tc.name  : testGetHigherKey002
   * @tc.desc  : Get a key that is a little higher than the specified key sort. For example: treeMap.getLowerKey(2).
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetHigherKey002", 0, function () {
    let treeMap = new TreeMap();
    let res = treeMap.getHigherKey(2);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_KEYS_001
   * @tc.name  : testKeys001
   * @tc.desc  : Get a collection of all the keys in the TreeMap. For example: treeMap.keys().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testKeys001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.keys();
    expect(res.next().value).assertEqual(0);
    expect(res.next().value).assertEqual(1);
    expect(res.next().value).assertEqual(2);
    expect(res.next().value).assertEqual(3);
    expect(res.next().value).assertEqual(4);
  });

  /**
   * @tc.number: TEST_VALUES_001
   * @tc.name  : testValues001
   * @tc.desc  : Get a collection of all the values in the TreeMap. For example: treeMap.values().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testValues001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.values();
    expect(res.next().value).assertEqual("a");
    expect(res.next().value).assertEqual("b");
    expect(res.next().value).assertEqual("c");
    expect(res.next().value).assertEqual("d");
    expect(res.next().value).assertEqual("g");
  });

  /**
   * @tc.number: TEST_REPLACE_001
   * @tc.name  : testReplace001
   * @tc.desc  : Modify the corresponding value according to the specified key. For example: treeMap.replace(2, "B").
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testReplace001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.replace(2, "B");
    let res1 = treeMap.get(2);
    expect(res1).assertEqual("B");
  });

  /**
   * @tc.number: TEST_REPLACE_002
   * @tc.name  : testReplace002
   * @tc.desc  : Modify the corresponding value according to the specified key. For example: treeMap.replace(2, "B").
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testReplace002", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    let res = treeMap.replace(2, "B");
    expect(res).assertEqual(false);
    let res1 = treeMap.get(2);
    expect(res1).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_FOREACH_001
   * @tc.name  : testForEach001
   * @tc.desc  : Traverse all key value pairs in the TreeMap instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testForEach001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let arr1 = [];
    let arr2 = [];
    treeMap.forEach((value, key) => {
      arr1.push(value);
    });
    treeMap.forEach((value, key) => {
      arr2.push(key);
    });
    let arr = ["a", "b", "c", "d", "g"];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
    let arr3 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr3.length; i++) {
      expect(arr3[i]).assertEqual(arr2[i]);
    }
  });

  /**
   * @tc.number: TEST_ENTRIES_001
   * @tc.name  : testEntries001
   * @tc.desc  : Get all key value pairs collection in TreeMap.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testEntries001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let entries = treeMap.entries();
    let flag = true;
    for (let i = 0, len = treeMap.length; i < len; i++) {
      let entry = entries.next().value;
      let res = treeMap.get(entry[0]);
      if (res != entry[1]) {
        flag = false;
        break;
      }
    }
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ITERATOR_001
   * @tc.name  : testIterator001
   * @tc.desc  : Traverse all key value pairs in the TreeMap instance. For example: treeMap[Symbol.iterator]().
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testIterator001", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let iters = treeMap[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = treeMap.length; i < len; i++) {
      let entry = iters.next().value;
      let res = treeMap.get(entry[0]);
      if (res != entry[1]) {
        flag = false;
        break;
      }
    }
    expect(flag).assertEqual(true);
  });

})
}