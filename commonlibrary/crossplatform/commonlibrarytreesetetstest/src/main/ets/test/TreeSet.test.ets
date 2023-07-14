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
import TreeSet from "@ohos.util.TreeSet";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function TreeSetTest() {
describe("TreeSetTest", function () {
  /**
   * @tc.number: TEST_CONSTRUCTOR_001
   * @tc.name  : testConstructor001
   * @tc.desc  : Create an TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testConstructor001", 0, function () {
      let treeSet = new TreeSet();
      expect(treeSet != undefined).assertTrue();
  });

  /**
   * @tc.number: TEST_LENGTH_001
   * @tc.name  : testLength001
   * @tc.desc  : Get the number of element in the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 0
   */
  it("testLength001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.length;
    expect(res).assertEqual(3);
  });

  /**
   * @tc.number: TEST_IS_EMPTY_001
   * @tc.name  : testIsEmpty001
   * @tc.desc  : Determine whether the TreeSet instance is empty.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testIsEmpty001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    let res1 = treeSet.isEmpty();
    expect(res1).assertEqual(false);
  });

  /**
   * @tc.number: TEST_IS_EMPTY_002
   * @tc.name  : testIsEmpty002
   * @tc.desc  : Determine whether the TreeSet instance is empty.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testIsEmpty002", 0, function () {
    let treeSet = new TreeSet();
    let res2 = treeSet.isEmpty();
    expect(res2).assertEqual(true);
  });

  /**
   * @tc.number: TEST_HAS_001
   * @tc.name  : testHas001
   * @tc.desc  : Determine whether the TreeSet instance contains the specified element.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testHas001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.has(2);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_HAS_002
   * @tc.name  : testHas002
   * @tc.desc  : Determine whether the TreeSet instance contains the specified element.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testHas002", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res1 = treeSet.has(3);
    expect(res1).assertEqual(false);
  });

  /**
   * @tc.number: TEST_ADD_001
   * @tc.name  : testAdd001
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("四");
    let res = treeSet.has("四");
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_002
   * @tc.name  : testAdd002
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd002", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(8);
    let res = treeSet.has(8);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_003
   * @tc.name  : testAdd003
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd003", 0, function () {
    let treeSet = new TreeSet();
    let a = [1, 2, 3, 4];
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_004
   * @tc.name  : testAdd004
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd004", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("*");
    let res = treeSet.has("*");
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_005
   * @tc.name  : testAdd005
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd005", 0, function () {
    let treeSet = new TreeSet();
    let a = {name: "lala", age: "13岁"};
    treeSet.add(a);
    let res = treeSet.has(a);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_006
   * @tc.name  : testAdd006
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd006", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(1.234);
    let res = treeSet.has(1.234);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_007
   * @tc.name  : testAdd007
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd007", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(true);
    let res = treeSet.has(true);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_008
   * @tc.name  : testAdd008
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd008", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("");
    let res = treeSet.has("");
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_009
   * @tc.name  : testAdd009
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd009", 0, function () {
    let treeSet = new TreeSet();
    for (let i = 0; i < 10000; i++) {
      treeSet.add(i);
    }
    let res = treeSet.has(8888);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_ADD_010
   * @tc.name  : testAdd010
   * @tc.desc  : Add element to TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testAdd010", 0, function () {
    let treeSet = new TreeSet();
    try {
      treeSet.add.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The add method cannot be bound`);
    }
  });

  /**
   * @tc.number: TEST_REMOVE_001
   * @tc.name  : testRemove001
   * @tc.desc  : Delete the specified value.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testRemove001", 0, function () {
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

  /**
   * @tc.number: TEST_REMOVE_002
   * @tc.name  : testRemove002
   * @tc.desc  : Delete the specified value.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testRemove002", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.remove("c");
    expect(res).assertEqual(false);
  });

  /**
   * @tc.number: TEST_CLEAR_001
   * @tc.name  : testClear001
   * @tc.desc  : Clear all elements of the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testClear001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.clear();
    let res = treeSet.length;
    expect(res).assertEqual(0);
  });

  /**
   * @tc.number: TEST_CLEAR_002
   * @tc.name  : testClear002
   * @tc.desc  : Clear all elements of the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testClear002", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.clear();
    let res = treeSet.length;
    expect(res).assertEqual(0);
    let res1 = treeSet.popFirst();
    expect(res1).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_CLEAR_003
   * @tc.name  : testClear003
   * @tc.desc  : Clear all elements of the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it('testClear003', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.clear.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The clear method cannot be bound`);
    }
  });

  /**
   * @tc.number: TEST_GET_FIRST_VALUE_001
   * @tc.name  : testGetFirstValue001
   * @tc.desc  : Get the value that ranks first in the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetFirstValue001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getFirstValue();
    expect(res).assertEqual(0);
  });

  /**
   * @tc.number: TEST_GET_FIRST_VALUE_002
   * @tc.name  : testGetFirstValue002
   * @tc.desc  : Get the value that ranks first in the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetFirstValue002", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getFirstValue();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_GET_LAST_VALUE_001
   * @tc.name  : testGetLastValue001
   * @tc.desc  : Get the last sorted key in the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetLastValue001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    let res = treeSet.getLastValue();
    expect(res).assertEqual(2);
  });

  /**
   * @tc.number: TEST_GET_LAST_VALUE_002
   * @tc.name  : testGetLastValue002
   * @tc.desc  : Get the last sorted key in the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetLastValue002", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getLastValue();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_GET_LOWER_VALUE_001
   * @tc.name  : testGetLowerValue001
   * @tc.desc  : Get a value that is a little lower than the specified value sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetLowerValue001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getLowerValue(2);
    expect(res).assertEqual(1);
  });

  /**
   * @tc.number: TEST_GET_LOWER_VALUE_002
   * @tc.name  : testGetLowerValue002
   * @tc.desc  : Get a value that is a little lower than the specified value sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetLowerValue002", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getLowerValue(2);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_GET_LOWER_VALUE_003
   * @tc.name  : testGetLowerValue003
   * @tc.desc  : Get a value that is a little lower than the specified value sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it('testGetLowerValue003', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.getLowerValue.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The getLowerValue method cannot be bound`);
    }
  });

  /**
   * @tc.number: TEST_GET_LOWER_VALUE_004
   * @tc.name  : testGetLowerValue004
   * @tc.desc  : Get a value that is a little lower than the specified value sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it('testGetLowerValue004', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.getLowerValue(null);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be not null. Received value is: null`);
    }
  });

  /**
   * @tc.number: TEST_GET_HIGHER_VALUE_001
   * @tc.name  : testGetHigherValue001
   * @tc.desc  : Get a value that is a little higher than the specified value sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetHigherValue001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add(0);
    treeSet.add(1);
    treeSet.add(2);
    treeSet.add(3);
    treeSet.add(4);
    let res = treeSet.getHigherValue(3);
    expect(res).assertEqual(4);
  });

  /**
   * @tc.number: TEST_GET_HIGHER_VALUE_002
   * @tc.name  : testGetHigherValue002
   * @tc.desc  : Get a value that is a little higher than the specified value sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testGetHigherValue002", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.getHigherValue(3);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_GET_HIGHER_VALUE_003
   * @tc.name  : testGetHigherValue003
   * @tc.desc  : Get a value that is a little higher than the specified value sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it('testGetHigherValue003', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.getHigherValue(null);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "key" must be not null. Received value is: null`);
    }
  });

  /**
   * @tc.number: TEST_GET_HIGHER_VALUE_004
   * @tc.name  : testGetHigherValue004
   * @tc.desc  : Get a value that is a little higher than the specified value sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it('testGetHigherValue004', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.getHigherValue.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The getHigherValue method cannot be bound`);
    }
  });

  /**
   * @tc.number: TEST_POP_FIRST_001
   * @tc.name  : testPopFirst001
   * @tc.desc  : Delete first value of sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testPopFirst001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("e");
    let res = treeSet.popFirst();
    expect(res).assertEqual("a");
  });

  /**
   * @tc.number: TEST_POP_FIRST_002
   * @tc.name  : testPopFirst002
   * @tc.desc  : Delete first value of sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testPopFirst002", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.popFirst();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_POP_LAST_001
   * @tc.name  : testPopLast001
   * @tc.desc  : Delete last value of sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testPopLast001", 0, function () {
    let treeSet = new TreeSet();
    treeSet.add("a");
    treeSet.add("b");
    treeSet.add("c");
    treeSet.add("d");
    treeSet.add("e");
    let res = treeSet.popLast();
    expect(res).assertEqual("e");
  });

  /**
   * @tc.number: TEST_POP_LAST_002
   * @tc.name  : testPopLast002
   * @tc.desc  : Delete last value of sort.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testPopLast002", 0, function () {
    let treeSet = new TreeSet();
    let res = treeSet.popLast();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_FOR_EACH_001
   * @tc.name  : testForEach001
   * @tc.desc  : Traverse the collection of all elements of the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testForEach001", 0, function () {
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

  /**
   * @tc.number: TEST_FOR_EACH_002
   * @tc.name  : testForEach002
   * @tc.desc  : Traverse the collection of all elements of the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it('testForEach002', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.forEach.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The forEach method cannot be bound`);
    }
  });

  /**
   * @tc.number: TEST_VALUES_001
   * @tc.name  : testValues001
   * @tc.desc  : Get a collection of all the values in the TreeSet.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testValues001", 0, function () {
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

  /**
   * @tc.number: TEST_VALUES_002
   * @tc.name  : testValues002
   * @tc.desc  : Get a collection of all the values in the TreeSet.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it('testValues002', 0, function () {
    let  treeSet = new TreeSet();
    try {
      treeSet.values.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The Symbol.iterator method cannot be bound`);
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

  /**
   * @tc.number: TEST_ITERATOR_001
   * @tc.name  : testIterator001
   * @tc.desc  : Iterate over all elements of the TreeSet instance.
   * @tc.size  : MediumTest
   * @tc.type  : Method
   * @tc.level : Level 2
   */
  it("testIterator001", 0, function () {
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
})
}