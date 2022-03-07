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
import HashMap from "@ohos.util.HashMap";

describe("HashMapTest", function () {
  it("SR000GGR4B_testConstructor001", 0, function () {
    try {
      let hashMap = new HashMap();
      expect(hashMap != undefined).assertEqual(true);
    } catch (err) {
      expect(err).assertEqual("Error: Cannot create new HashMap");
    }
  });
  it("SR000GGR4B_testSet002_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    let res = hashMap.get(1);
    expect(res).assertEqual("A");
  });
  it("SR000GGR4B_testSet002_2", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, 2);
    let res = hashMap.get(1);
    expect(res).assertEqual(2);
  });
  it("SR000GGR4B_testSet002_3", 0, function () {
    let hashMap = new HashMap();
    let c = [1, 2, 3];
    hashMap.set(1, c);
    let res = hashMap.get(1);
    expect(res).assertEqual(c);
  });
  it("SR000GGR4B_testSet002_4", 0, function () {
    let hashMap = new HashMap();
    let c = {name: "lili", age: "13"};
    hashMap.set(1, c);
    let res = hashMap.get(1);
    expect(res).assertEqual(c);
  });
  it("SR000GGR4B_testSet002_5", 0, function () {
    let hashMap = new HashMap();
    hashMap.set("a", "A");
    let res = hashMap.get("a");
    expect(res).assertEqual("A");
  });
  it("SR000GGR4B_testSet002_6", 0, function () {
    let hashMap = new HashMap();
    hashMap.set("", "A");
    let res = hashMap.get("");
    expect(res).assertEqual("A");
  });
  it("SR000GGR4B_testSet002_7", 0, function () {
    let hashMap = new HashMap();
    hashMap.set("$", "A");
    let res = hashMap.get("$");
    expect(res).assertEqual("A");
  });
  it("SR000GGR4B_testSet002_8", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(3.14, "A");
    let res = hashMap.get(3.14);
    expect(res).assertEqual("A");
  });
  it("SR000GGR4B_testSet002_9", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(0.3, "A");
    let res = hashMap.get(0.3);
    expect(res).assertEqual("A");
  });
  it("SR000GGR4B_testSet002_10", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(-1, "A");
    let res = hashMap.get(-1);
    expect(res).assertEqual("A");
  });
  it("SR000GGR4B_testSet002_11", 0, function () {
    let hashMap = new HashMap();
    let a = {};
    hashMap.set(a, "A");
    let res = hashMap.get(a);
    expect(res).assertEqual("A");
  });
  it("SR000GGR4B_testSet002_12", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, undefined);
    let res = hashMap.get(1);
    expect(res).assertEqual(undefined);
  });
  it("SR000GGR4B_testSet002_13", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "$");
    let res = hashMap.get(1);
    expect(res).assertEqual("$");
  });
  it("SR000GGR4B_testSet002_14", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, 3.14);
    let res = hashMap.get(1);
    expect(res).assertEqual(3.14);
  });
  it("SR000GGR4B_testSet002_15", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, -1);
    let res = hashMap.get(1);
    expect(res).assertEqual(-1);
  });
  it("SR000GGR4B_testSet002_16", 0, function () {
    let hashMap = new HashMap();
    let a = {};
    hashMap.set(1, a);
    let res = hashMap.get(1);
    expect(res).assertEqual(a);
  });
  it("SR000GGR4B_testSet002_17", 0, function () {
    let hashMap = new HashMap();
    for (let i = 0; i < 100; i++) {
      hashMap.set(1, i);
    }
    let res = hashMap.get(1);
    let res1 = hashMap.length;
    expect(res).assertEqual(99);
    expect(res1).assertEqual(1);
  });
  it("SR000GGR4B_testSet002_18", 0, function () {
    let hashMap = new HashMap();
    for (let i = 0; i < 100; i++) {
      hashMap.set(i, 1);
      let res = hashMap.get(i);
      expect(res).assertEqual(1);
    }
    let res1 = hashMap.length;
    expect(res1).assertEqual(100);
  });
  it("SR000GGR4B_testLength003", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.length;
    expect(res).assertEqual(5);
  });
  it("SR000GGR4B_testHasKey004_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.hasKey(3);
    expect(res).assertEqual(true);
    let res1 = hashMap.hasKey(8);
    expect(res1).assertEqual(false);
  });
  it("SR000GGR4B_testHasKey004_2", 0, function () {
    let hashMap = new HashMap();
    let res = hashMap.hasKey(8);
    expect(res).assertEqual(false);
  });
  it("SR000GGR4B_testHasValue005_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.hasValue("C");
    expect(res).assertEqual(true);
    let res1 = hashMap.hasValue(8);
    expect(res1).assertEqual(false);
  });
  it("SR000GGR4B_testHasValue005_2", 0, function () {
    let hashMap = new HashMap();
    let res = hashMap.hasValue(8);
    expect(res).assertEqual(false);
  });
  it("SR000GGR4B_testGet006_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.get(3);
    expect(res).assertEqual("C");
  });
  it("SR000GGR4B_testGet006_2", 0, function () {
    let hashMap = new HashMap();
    try {
      let res = hashMap.get(3);
    } catch (err) {
      expect(err).assertEqual(
        "Error: The removed element does not exist in this container"
      );
    }
  });
  it("SR000GGR4B_testSetAll007_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let hashMap1 = new HashMap();
    hashMap1.set(1, 1);
    hashMap1.set(2, 2);
    hashMap.setAll(hashMap1);
    let arr = [];
    for (let [key, value] of hashMap) {
      arr.push([key, value]);
    }
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });

    for (let i = 0; i < arr.length; i++) {
      expect(arr[i][0]).assertEqual(i + 1);
      expect(arr[i][1]).assertEqual(hashMap.get(i + 1));
    }
  });
  it("SR000GGR4B_testSetAll007_2", 0, function () {
    let hashMap = new HashMap();
    let hashMap1 = new HashMap();
    hashMap1.set(1, 1);
    hashMap1.set(2, 2);
    hashMap.setAll(hashMap1);
    let arr = [];
    for (let [key, value] of hashMap) {
      arr.push([key, value]);
    }
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });
    for (let i = 0; i < arr.length; i++) {
      expect(JSON.stringify(arr[i])).assertEqual(
        JSON.stringify([i + 1, hashMap.get(i + 1)])
      );
    }
  });
  it("SR000GGR4B_testRemove008_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.remove(3);
    expect(res).assertEqual("C");
    let res1 = hashMap.length;
    expect(res1).assertEqual(4);
  });
  it("SR000GGR4B_testRemove008_2", 0, function () {
    let hashMap = new HashMap();
    try {
      let res = hashMap.remove(3);
    } catch (err) {
      expect(err).assertEqual(
        "Error: The removed element does not exist in this container"
      );
    }
  });
  it("SR000GGR4B_testClear009", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.length;
    expect(res).assertEqual(5);
    hashMap.clear();
    let res1 = hashMap.length;
    expect(res1).assertEqual(0);
  });
  it("SR000GGR4B_testClear010", 0, function () {
    let hashMap = new HashMap();
    hashMap.clear();
    let res = hashMap.length;
    expect(res).assertEqual(0);
  });
  it("SR000GGR4B_testKeys010", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.keys();
    for (let i = 0; i < hashMap.length; i++) {
      console.log(res.next());
    }
  });
  it("SR000GGR4B_testValues011", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.values();
    for (let i = 0; i < hashMap.length; i++) {
      let has = hashMap.hasValue(res.next().value);
      expect(has).assertEqual(true);
    }
  });
  it("SR000GGR4B_testReplace012_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.replace(2, "G");
    expect(res).assertEqual(true);
    expect(hashMap.get(2)).assertEqual("G");
  });
  it("SR000GGR4B_testReplace012_2", 0, function () {
    let hashMap = new HashMap();
    let res = hashMap.replace(2, "G");
    expect(res).assertEqual(false);
  });
  it("SR000GGR4B_testForEach013_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let vals = [];
    let keys = [];
    hashMap.forEach((value, key) => {
      keys.push(key);
      vals.push(value);
    });
    for (let i = 0; i < keys.length; i++) {
      let has = hashMap.hasKey(keys[i]);
      expect(has).assertEqual(true);
    }
    for (let i = 0; i < vals.length; i++) {
      let has = hashMap.hasValue(vals[i]);
      expect(has).assertEqual(true);
    }
  });
  it("SR000GGR4B_testForEach013_2", 0, function () {
    let hashMap = new HashMap();
    let arr = [];
    try {
      hashMap.forEach((item, index) => {
        arr.push(item);
      });
    } catch (err) {
      expect(err).assertEqual("Error:Cannot create new hashMap");
    }
    expect(arr.length).assertEqual(0);
  });
  it("SR000GGR4B_testIterator014_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let arr = [];
    for (let [key, value] of hashMap) {
      arr.push([key, value]);
    }
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i][0]).assertEqual(i + 1);
      expect(arr[i][1]).assertEqual(hashMap.get(i + 1));
    }
  });
  it("SR000GGR4B_testIterator014_2", 0, function () {
    let hashMap = new HashMap();
    let arr = [];
    try {
      for (let item of hashMap) {
        arr.push(item);
      }
    } catch (err) {
      expect(err).assertEqual("Error: Cannot create new HashMap");
    }
    expect(arr.length).assertEqual(0);
  });
  it("SR000GGR4B_testEntries015_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.entries();
    let arr = [];
    for (let i = 0; i < hashMap.length; i++) {
      let obj = res.next();
      arr.push([obj.value[0], obj.value[1]]);
    }
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i][0]).assertEqual(i + 1);
      expect(arr[i][1]).assertEqual(hashMap.get(i + 1));
    }
  });
  it("SR000GGR4B_testEntries015_2", 0, function () {
    let hashMap = new HashMap();
    let res = hashMap.entries();
    expect(undefined).assertEqual(res.next().value);
  });
  it("SR000GGR4B_testIsEmpty016_1", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let res = hashMap.length;
    let res1 = hashMap.isEmpty();
    expect(res).assertEqual(5);
    expect(res1).assertEqual(false);
  });
  it("SR000GGR4B_testIsEmpty016_2", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    hashMap.clear();
    let res = hashMap.length;
    let res1 = hashMap.isEmpty();
    expect(res).assertEqual(0);
    expect(res1).assertEqual(true);
  });
  it("SR000GGR4B_testEntries043", 0, function () {
    let hashMap = new HashMap();
    let res = hashMap.entries();
    expect(undefined).assertEqual(res.next().value);
  });
  it("SR000GGR4B_testIterator044", 0, function () {
    let hashMap = new HashMap();
    hashMap.set(1, "A");
    hashMap.set(2, "B");
    hashMap.set(3, "C");
    hashMap.set(4, "D");
    hashMap.set(5, "E");
    let arr = [];
    let res = hashMap[Symbol.iterator]();
    let temp = undefined;
    do {
      temp = res.next().value;
      arr.push(temp);
    } while (temp != undefined);
    arr.sort(function (a, b) {
      return a[0] - b[0];
    });
    let arr1 = ["1,A", "2,B", "3,C", "4,D", "5,E"];
    for (let i = 0; i < arr.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
});
