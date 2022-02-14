/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
import TreeMap from "@ohos.util.TreeMap";

describe("TreeMapTest", function () {
  it("SR000GGR3H_testConstructor001", 0, function () {
    try {
      let treeMap = new TreeMap();
      expect(treeMap != undefined).assertEqual(true);
    } catch (err) {
      expect(err).assertEqual("Error: Cannot create new TreeMap");
    }
  });
  it("SR000GGR3H_testSet002_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "四");
    let res = treeMap.get(0);
    expect(res).assertEqual("四");
  });
  it("SR000GGR3H_testSet002_2", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, 8);
    let res = treeMap.get(0);
    expect(res).assertEqual(8);
  });
  it("SR000GGR3H_testSet002_3", 0, function () {
    let treeMap = new TreeMap();
    let a = [1, 2, 3, 4];
    treeMap.set(0, a);
    let res = treeMap.get(0);
    expect(res).assertEqual(a);
  });
  it("SR000GGR3H_testSet002_4", 0, function () {
    let treeMap = new TreeMap();
    let a = {name: "lala", age: "13"};
    treeMap.set(0, a);
    let res = treeMap.get(0);
    expect(res).assertEqual(a);
  });
  it("SR000GGR3H_testSet002_5", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(2, "*");
    let res = treeMap.get(2);
    expect(res).assertEqual("*");
  });
  it("SR000GGR3H_testSet002_6", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(-2, 3.14);
    let res = treeMap.get(-2);
    expect(res).assertEqual(3.14);
  });
  it("SR000GGR3H_testSet002_7", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(100, true);
    let res = treeMap.get(100);
    expect(res).assertEqual(true);
  });
  it("SR000GGR3H_testSet002_8", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(100, "");
    let res = treeMap.get(100);
    expect(res).assertEqual("");
  });
  it("SR000GGR3H_testSet002_9", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set("a", "四");
    let res = treeMap.get("a");
    expect(res).assertEqual("四");
  });
  it("SR000GGR3H_testSet002_10", 0, function () {
    let treeMap = new TreeMap();
    for (let i = 0; i < 10000; i++) {
      treeMap.set(0, 8);
    }
    let res = treeMap.get(0);
    expect(res).assertEqual(8);
    expect(treeMap.length).assertEqual(1);
  });
  it("SR000GGR3H_testHasKey003", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    let res = treeMap.hasKey(1);
    expect(res).assertEqual(true);
    let res1 = treeMap.hasKey(6);
    expect(res1).assertEqual(false);
  });
  it("SR000GGR3H_testHasValue004", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.hasValue("a");
    expect(res).assertEqual(true);
    let res1 = treeMap.hasValue("d");
    expect(res1).assertEqual(false);
  });
  it("SR000GGR3H_testGet005_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.get(1);
    expect(res).assertEqual("b");
  });
  it("SR000GGR3H_testGet005_2", 0, function () {
    let treeMap = new TreeMap();
    try {
      let res = treeMap.get(1);
      expect(res).assertEqual(undefined);
    } catch (err) {
      expect(err).assertEqual("Error: The node of this key does not exist in the tree");
    }
  });
  it("SR000GGR3H_testGet005_3", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.clear();
    expect(treeMap.length).assertEqual(0);
    try {
      let res = treeMap.get(0);
      expect(res).assertEqual(undefined);
    } catch (err) {
      expect(err).assertEqual("Error: The node of this key does not exist in the tree");
    }
  });
  it("SR000GGR3H_testGetFirstKey006_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.getFirstKey();
    expect(res).assertEqual(0);
  });
  it("SR000GGR3H_testGetFirstKey006_2", 0, function () {
    let treeMap = new TreeMap();
    try {
      let res = treeMap.getFirstKey();
    } catch (err) {
      expect(err).assertEqual("Error: don't find this key,this tree is empty");
    }
  });
  it("SR000GGR3H_testGetLastKey007_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.getLastKey();
    expect(res).assertEqual(2);
  });
  it("SR000GGR3H_testGetLastKey007_2", 0, function () {
    let treeMap = new TreeMap();
    try {
      let res = treeMap.getLastKey();
    } catch (err) {
      expect(err).assertEqual("Error: don't find this key,this tree is empty");
    }
  });
  it("SR000GGR3H_testSetAll008", 0, function () {
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
  it("SR000GGR3H_testRemove009_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    let res = treeMap.remove(1);
    expect(res).assertEqual("b");
  });
  it("SR000GGR3H_testRemove009_2", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    let res = treeMap.remove(1);
    expect(res).assertEqual(null);
  });
  it("SR000GGR3H_testClear010_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.clear();
    let res = treeMap.length;
    expect(res).assertEqual(0);
  });
  it("SR000GGR3H_testClear010_2", 0, function () {
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
  it("SR000GGR3H_testGetLowerKey011_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.getLowerKey(2);
    expect(res).assertEqual(1);
  });
  it("SR000GGR3H_testGetLowerKey011_2", 0, function () {
    let treeMap = new TreeMap();
    try {
      let res = treeMap.getLowerKey(2);
    } catch (err) {
      expect(err).assertEqual("Error: don't find this key,this node is undefine");
    }
  });
  it("SR000GGR3H_testGetHigherKey012_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.getHigherKey(2);
    expect(res).assertEqual(3);
  });
  it("SR000GGR3H_testGetHigherKey012_2", 0, function () {
    let treeMap = new TreeMap();
    try {
      let res = treeMap.getHigherKey(2);
    } catch (err) {
      expect(err).assertEqual("Error: don't find this key,this node is undefine");
    }
  });
  it("SR000GGR3H_testKeys013", 0, function () {
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
  it("SR000GGR3H_testValues014", 0, function () {
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
  it("SR000GGR3H_testReplace015_1", 0, function () {
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
  it("SR000GGR3H_testReplace015_2", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    let res = treeMap.replace(2, "B");
    expect(res).assertEqual(false);
    try {
      let res1 = treeMap.get(2);
      expect(res1).assertEqual(undefined);
    } catch (err) {
      expect(err).assertEqual("Error: The node of this key does not exist in the tree");
    }
  });
  it("SR000GGR3H_testLength016_1", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.length;
    expect(res).assertEqual(5);
  });
  it("SR000GGR3H_testLength016_2", 0, function () {
    let treeMap = new TreeMap();
    let res = treeMap.length;
    expect(res).assertEqual(0);
  });
  it("SR000GGR3H_testForEach017", 0, function () {
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
  it("SR000GGR3H_testEntries018", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let res = treeMap.entries();
    let arr = ["0,a", "1,b", "2,c", "3,d", "4,g"];
    for (let i = 0; i < treeMap.length; i++) {
      expect(arr[i]).assertEqual(res.next().value);
    }
  });
  it("SR000GGR3H_testIterator019", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let arr = ["0,a", "1,b", "2,c", "3,d", "4,g"];
    let iterArr = [];
    for (let [key, value] of treeMap) {
      iterArr.push(key + "," + value);
    }
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i]).assertEqual(iterArr[i]);
    }
  });
  it("SR000GGR3H_testIterator020", 0, function () {
    let treeMap = new TreeMap();
    treeMap.set(0, "a");
    treeMap.set(1, "b");
    treeMap.set(2, "c");
    treeMap.set(3, "d");
    treeMap.set(4, "g");
    let arr = [];
    let res = treeMap[Symbol.iterator]();
    let temp = undefined;
    do {
      temp = res.next().value;
      arr.push(temp);
    } while (temp != undefined);
    let arr1 = ["0,a", "1,b", "2,c", "3,d", "4,g"];
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
});
