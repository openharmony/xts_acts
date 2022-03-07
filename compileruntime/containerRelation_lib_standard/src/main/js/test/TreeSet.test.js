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
import TreeSet from "@ohos.util.TreeSet";

describe("TreeSetTest", function () {
  it("SR000GGR3I_testConstructor001", 0, function () {
    try {
      let treeSet = new TreeSet();
      expect(treeSet != undefined).assertEqual(true);
    } catch (err) {
      expect(err).assertEqual("Error: Cannot create new TreeSet");
    }
  });
  it("SR000GGR3I_testAdd002_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("四");
    let res = treeSet.has("四");
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testAdd002_2", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(8);
    let res = treeSet.has(8);
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testAdd002_3", 0, function () {
    let treeSet = new TreeSet();
    let a = [1, 2, 3, 4];
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testAdd002_4", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("*");
    let res = treeSet.has("*");
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testAdd002_5", 0, function () {
    let treeSet = new TreeSet();
    let a = {name: "lala", age: "13岁"};
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testAdd002_6", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(1.234);
    let res = treeSet.has(1.234);
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testAdd002_7", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(true);
    let res = treeSet.has(true);
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testAdd002_8", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("");
    let res = treeSet.has("");
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testAdd002_9", 0, function () {
    let treeSet = new TreeSet();
    for (let i = 0; i < 10000; i++) {
      treeSet.add(i);
    }
    expect(treeSet.length).assertEqual(10000);
    let res = treeSet.has(8888);
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testLength003_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.length;
    expect(res).assertEqual(3);
  });
  it("SR000GGR3I_testLength003_2", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.length;
    expect(res).assertEqual(0);
  });
  it("SR000GGR3I_testHas004_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.has(2);
    expect(res).assertEqual(true);
  });
  it("SR000GGR3I_testHas004_2", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res1 = treeSet.has(3);
    expect(res1).assertEqual(false);
  });
  it("SR000GGR3I_testGetFirstValue005_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getFirstValue();
    expect(res).assertEqual(0);
  });
  it("SR000GGR3I_testGetFirstValue005_2", 0, function () {
    let treeSet = new TreeSet();
    try {
      let res = treeSet.getFirstValue();
    } catch (err) {
      expect(err).assertEqual("Error: don't find this key,this tree is empty");
    }
  });
  it("SR000GGR3I_testGetLastValue006_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.getLastValue();
    expect(res).assertEqual(2);
  });
  it("SR000GGR3I_testGetLastValue006_2", 0, function () {
    let treeSet = new TreeSet();
    try {
      let res = treeSet.getLastValue();
    } catch (err) {
      expect(err).assertEqual("Error: don't find this key,this tree is empty");
    }
  });
  it("SR000GGR3I_testGetLowerValue007_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getLowerValue(2);
    expect(res).assertEqual(1);
  });
  it("SR000GGR3I_testGetLowerValue007_2", 0, function () {
    let treeSet = new TreeSet();
    try {
      let res = treeSet.getLowerValue(2);
    } catch (err) {
      expect(err).assertEqual("Error: don't find this key,this node is undefine");
    }
  });
  it("SR000GGR3I_testGetHigherValue008_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getHigherValue(3);
    expect(res).assertEqual(4);
  });
  it("SR000GGR3I_testGetHigherValue008_2", 0, function () {
    let treeSet = new TreeSet();
    try {
      let res = treeSet.getHigherValue(3);
    } catch (err) {
      expect(err).assertEqual("Error: don't find this key,this node is undefine");
    }
  });
  it("SR000GGR3I_testPopFirst009_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("e");
    let res = treeSet.popFirst();
    expect(res).assertEqual("a");
  });
  it("SR000GGR3I_testPopFirst009_2", 0, function () {
    let treeSet = new TreeSet();
    try {
      let res = treeSet.popFirst();
    } catch (err) {
      expect(err).assertEqual("Error: don't find first node,this tree is empty");
    }
  });
  it("SR000GGR3I_testPopLast010_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("e");
    let res = treeSet.popLast();
    expect(res).assertEqual("e");
  });
  it("SR000GGR3I_testPopLast010_2", 0, function () {
    let treeSet = new TreeSet();
    try {
      let res = treeSet.popLast();
    } catch (err) {
      expect(err).assertEqual("Error: don't find last node,this tree is empty");
    }
  });
  it("SR000GGR3I_testClear011_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.clear();
    let res = treeSet.length;
    expect(res).assertEqual(0);
  });
  it("SR000GGR3I_testClear011_2", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.clear();
    let res = treeSet.length;
    expect(res).assertEqual(0);
    treeSet.add(3);
    try {
      treeSet.popFirst();
    } catch (err) {
      expect(err).assertEqual("Error: don't find first node,this tree is empty");
    }
  });
  it("SR000GGR3I_testIsEmpty012_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    let res1 = treeSet.isEmpty();
    expect(res1).assertEqual(false);
  });
  it("SR000GGR3I_testIsEmpty012_2", 0, function () {
    let treeSet = new TreeSet();
    let res2 = treeSet.isEmpty();
    expect(res2).assertEqual(true);
  });
  it("SR000GGR3I_testRemove013_1", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("g");
    let res1 = treeSet.remove("c");
    expect(res1).assertEqual(true);
    let res2 = treeSet.has("c");
    expect(res2).assertEqual(false);
  });
  it("SR000GGR3I_testRemove013_2", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.remove("c");
    expect(res).assertEqual(false);
  });
  it("SR000GGR3I_testValues014", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("g");
    let res = treeSet.values();
    expect(res.next().value).assertEqual("a");
    expect(res.next().value).assertEqual("b");
    expect(res.next().value).assertEqual("c");
    expect(res.next().value).assertEqual("d");
    expect(res.next().value).assertEqual("g");
  });
  it("SR000GGR3I_testForEach015", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let arr1 = [];
    treeSet.forEach((value, key) => {
      arr1.push(value);
    });
    let arr = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
  it("SR000GGR3I_testEntries016", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("g");
    let res = treeSet.entries();
    expect(JSON.stringify(res.next().value)).assertEqual('["a","a"]');
    expect(JSON.stringify(res.next().value)).assertEqual('["b","b"]');
    expect(JSON.stringify(res.next().value)).assertEqual('["c","c"]');
    expect(JSON.stringify(res.next().value)).assertEqual('["d","d"]');
    expect(JSON.stringify(res.next().value)).assertEqual('["g","g"]');
  });
  it("SR000GGR3I_testIterator017", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let arr = [];
    for (let item of treeSet) {
      arr.push(item);
    }
    let arr1 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
  it("SR000GGR3I_testIterator018", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let arr = [];
    let res = treeSet[Symbol.iterator]();
    let temp = undefined;
    do {
      temp = res.next().value;
      arr.push(temp);
    } while (temp != undefined);
    let arr1 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });
});
