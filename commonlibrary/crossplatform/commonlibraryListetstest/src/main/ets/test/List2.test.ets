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
import List from "@ohos.util.List";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function ListTest() {
  describe("ListTest", function () {

    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Create an List instance. For example: let list = new List().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      try {
        let list = new List();
        expect(list != undefined).assertEqual(true);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The List's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.number: TEST_LENGTH_001
     * @tc.name  : testLength001
     * @tc.desc  : Get the number of elements contained in the List instance. For example: list.length.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it("testLength001", 0, function () {
      let list = new List();
      list.add(4);
      list.add(3);
      list.add(1);
      list.add(2);
      list.add(14);
      let res = list.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number: TEST_ADD_001
     * @tc.name  : testAdd001
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add(8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd001", 0, function () {
      let list = new List();
      list.add(8);
      let res = list.get(0);
      expect(res).assertEqual(8);
    });

    /**
     * @tc.number: TEST_ADD_002
     * @tc.name  : testAdd002
     * @tc.desc  : Add a element to the end of the List instance.
     * For example: let a = [1, 2, 3, 4]; list.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd002", 0, function () {
      let list = new List();
      let a = [1, 2, 3, 4];
      list.add(a);
      let res = list.get(0);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.number: TEST_ADD_003
     * @tc.name  : testAdd003
     * @tc.desc  : Add a element to the end of the List instance.
     * For example: let a = {name: "lala", age: "13"}; list.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd003", 0, function () {
      let list = new List();
      let a = {name: "lala", age: "13"};
      list.add(a);
      let res = list.get(0);
      expect(res).assertEqual(a);
    });
    /**
     * @tc.number: TEST_ADD_004
     * @tc.name  : testAdd004
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add("*").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd004", 0, function () {
      let list = new List();
      list.add(".");
      list.add("*");
      list.add("|");
      let res = list.get(0);
      expect(res).assertEqual(".");
    });

    /**
     * @tc.number: TEST_ADD_005
     * @tc.name  : testAdd005
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add("*").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd005", 0, function () {
      let list = new List();
      list.add(".");
      list.add("*");
      list.add("|");
      let arr = [];
      list.forEach((item, index) => {
        arr.push(item);
      });
      let a = [".", "*", "|"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_ADD_006
     * @tc.name  : testAdd006
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add(" ").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd006", 0, function () {
      let list = new List();
      list.add(" ");
      let res = list.get(0);
      expect(res).assertEqual(" ");
    });

    /**
     * @tc.number: TEST_ADD_007
     * @tc.name  : testAdd007
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add("a").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd007", 0, function () {
      let list = new List();
      list.add("a");
      list.add("a");
      let res = list.get(0);
      let res1 = list.get(1);
      expect(res).assertEqual("a");
      expect(res1).assertEqual("a");
    });
    /**
     * @tc.number: TEST_ADD_008
     * @tc.name  : testAdd008
     * @tc.desc  : Add a element to the end of the List instance. For example: for (let i = 0; i < 100; i++) {list.add(i);}.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd008", 0, function () {
      let list = new List();
      for (let i = 0; i < 100; i++) {
        list.add(i);
      }
      let res = list.get(99);
      let res1 = list.length;
      expect(res).assertEqual(99);
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.number: TEST_ADD_009
     * @tc.name  : testAdd009
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add(null).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd009", 0, function () {
      let list = new List();
      list.add(null);
      let res = list.get(0);
      expect(res).assertEqual(null);
    });

    /**
     * @tc.number: TEST_ADD_010
     * @tc.name  : testAdd010
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add(0.1111).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd010", 0, function () {
      let list = new List();
      list.add(0.1111);
      let res = list.get(0);
      expect(res).assertEqual(0.1111);
    });

    /**
     * @tc.number: TEST_ADD_011
     * @tc.name  : testAdd011
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add(-1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd011", 0, function () {
      let list = new List();
      list.add(-1);
      let res = list.get(0);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_ADD_012
     * @tc.name  : testAdd012
     * @tc.desc  : Add a element to the end of the List instance. For example: const obj = {}; list.add(obj).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd012", 0, function () {
      let list = new List();
      const obj = {};
      list.add(obj);
      let res = list.get(0);
      expect(res).assertEqual(obj);
    });

    /**
     * @tc.number: TEST_ADD_013
     * @tc.name  : testAdd013
     * @tc.desc  : Add a element to the end of the List instance. For example: list.add.bind({}, "a")().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testAdd013', 0, function () {
      let  list = new List();
      try {
        list.add.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The add method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_INSERT_001
     * @tc.name  : testInsert001
     * @tc.desc  : Insert an element into the middle of the List instance. For example: list.insert("d", 3).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsert001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      list.insert("d", 3);
      let arr = [];
      list.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["a", "b", "c", "d", "a", "b"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_INSERT_002
     * @tc.name  : testInsert002
     * @tc.desc  : Insert an element into the middle of the List instance. For example: list.insert("d", 8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsert002", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      try {
        let res = list.insert("d", 8);
        expect(true).assertEqual(false);
      } catch(err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 5. Received value is: 8`);
      }
    });

    /**
     * @tc.number: TEST_GET_001
     * @tc.name  : testGet001
     * @tc.desc  : Gets the element corresponding to the specified index. For example: list.get(0).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet001", 0, function () {
      let list = new List();
      list.add("四");
      let res = list.get(0);
      expect(res).assertEqual("四");
    });

    /**
     * @tc.number: TEST_GET_002
     * @tc.name  : testGet002
     * @tc.desc  : Gets the element corresponding to the specified index. For example: list.get(2).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet002", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      list.add("b");
      let res = list.get(2);
      expect(res).assertEqual("c");
    });

    /**
     * @tc.number: TEST_GET_003
     * @tc.name  : testGet003
     * @tc.desc  : Gets the element corresponding to the specified index. For example: list.get(6).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet003", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      list.add("b");
      let res = list.get(6);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_GET_004
     * @tc.name  : testGet004
     * @tc.desc  : Gets the element corresponding to the specified index. For example: list.get(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet004", 0, function () {
      let list = new List();
      let res = list.get(1);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_GET_005
     * @tc.name  : testGet005
     * @tc.desc  : Gets the element corresponding to the specified index. For example: list.get.bind({}, 1)().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet005", 0, function () {
      let list = new List();
      try {
        list.get.bind({}, 1)();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The get method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_HAS_001
     * @tc.name  : testHas001
     * @tc.desc  : Check whether the List contains a specified element. For example: list.has("a").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      let res = list.has("a");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_HAS_002
     * @tc.name  : testHas002
     * @tc.desc  : Check whether the List contains a specified element. For example: list.has("d").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas002", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      let res = list.has("d");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_003
     * @tc.name  : testHas003
     * @tc.desc  : Check whether the List contains a specified element. For example: list.has(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas003", 0, function () {
      let list = new List();
      let res = list.has(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_001
     * @tc.name  : testGetIndexOf001
     * @tc.desc  :  In the List instance, find the index of a specified element from front to back,
     * and return the index found for the first time. If not found, return -1. For example: list.getIndexOf("b").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOf001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      list.add("b");
      let res = list.getIndexOf("b");
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_002
     * @tc.name  : testGetIndexOf002
     * @tc.desc  :  In the List instance, find the index of a specified element from front to back,
     * and return the index found for the first time. If not found, return -1. For example: list.getIndexOf("b").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOf002", 0, function () {
      let list = new List();
      let res = list.getIndexOf(1);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_REMOVE_BY_INDEX_001
     * @tc.name  : testRemoveByIndex001
     * @tc.desc  : In the List instance, delete the element based on its index. For example: list.removeByIndex(2).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByIndex001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      list.removeByIndex(2);
      let arr = [];
      list.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["a", "b", "a", "b"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_BY_INDEX_002
     * @tc.name  : testRemoveByIndex002
     * @tc.desc  : In the List instance, delete the element based on its index. For example: list.removeByIndex(5).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByIndex002", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      try {
        let res = list.removeByIndex(5);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 5`);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_BY_INDEX_003
     * @tc.name  : testRemoveByIndex003
     * @tc.desc  : In the List instance, delete the element based on its index. For example: list.removeByIndex(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByIndex003", 0, function () {
      let list = new List();
      try {
        let res = list.removeByIndex(1);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 0. Received value is: 1`);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_001
     * @tc.name  : testRemove001
     * @tc.desc  : Delete the specified element. For example: list.remove("a").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      let res = list.remove("a");
      let arr = [];
      list.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["b", "c", "a", "b"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_GET_LAST_INDEX_OF_001
     * @tc.name  : testGetLastIndexOf001
     * @tc.desc  :  In the List instance, find the index of a specified element from brack to front,
     * and return the index found for the first time. If not found, return -1. For example: list.getLastIndexOf("a").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetLastIndexOf001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      list.add("b");
      let res = list.getLastIndexOf("a");
      expect(res).assertEqual(3);
    });

    /**
     * @tc.number: TEST_GET_LAST_INDEX_OF_002
     * @tc.name  : testGetLastIndexOf002
     * @tc.desc  :  In the List instance, find the index of a specified element from brack to front,
     * and return the index found for the first time. If not found, return -1. For example: list.getLastIndexOf("F").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetLastIndexOf002", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      list.add("b");
      let res = list.getLastIndexOf("F");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_GET_FIRST_001
     * @tc.name  : testGetFirst001
     * @tc.desc  : Get the header element of the List instance. For example: list.getFirst().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetFirst001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      let res = list.getFirst();
      expect(res).assertEqual("a");
    });

    /**
     * @tc.number: TEST_GET_FIRST_001
     * @tc.name  : testGetFirst001
     * @tc.desc  : Get the header element of the List instance. For example: list.getFirst().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetFirst002", 0, function () {
      let list = new List();
      let res = list.getFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_GET_LAST_001
     * @tc.name  : testGetLast001
     * @tc.desc  : Get the end element of the List instance. For example: list.getLast().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetLast001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      let res = list.getLast();
      expect(res).assertEqual("b");
    });

    /**
     * @tc.number: TEST_GET_LAST_001
     * @tc.name  : testGetLast001
     * @tc.desc  : Get the end element of the List instance. For example: list.getLast().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetLast002", 0, function () {
      let list = new List();
      let res = list.getLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_SET_001
     * @tc.name  : testSet001
     * @tc.desc  : Modify the element corresponding to the specified index. For example: list.set(2, "d").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.set(2, "d");
      let res1 = list.get(2);
      expect(res1).assertEqual("d");
    });

    /**
     * @tc.number: TEST_SET_002
     * @tc.name  : testSet002
     * @tc.desc  : Modify the element corresponding to the specified index. For example: list.set(6, "d").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet002", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      try {
        list.set(6, "d");
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 2. Received value is: 6`);
      }
    });

    /**
     * @tc.number: TEST_EQUAL_001
     * @tc.name  : testEqual001
     * @tc.desc  : Judge whether two List instances are equal. For example: let res = list.equal(list1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqual001", 0, function () {
      let list = new List();
      let list1 = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list1.add("a");
      list1.add("b");
      list1.add("d");
      let res = list.equal(list1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_EQUAL_002
     * @tc.name  : testEqual002
     * @tc.desc  : Judge whether two List instances are equal. For example: let res = list.equal(list1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqual002", 0, function () {
      let list = new List();
      let list1 = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list1.add("a");
      list1.add("b");
      list1.add("c");
      let res = list.equal(list1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_EQUAL_003
     * @tc.name  : testEqual003
     * @tc.desc  : Judge whether two List instances are equal. For example: let res = list.equal(list1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqual003", 0, function () {
      let list = new List();
      let list1 = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list1.add("a");
      list1.add("b");
      let res = list.equal(list1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_EQUAL_004
     * @tc.name  : testEqual004
     * @tc.desc  : Judge whether two List instances are equal. For example: let res = list.equal(list1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqual004", 0, function () {
      let list = new List();
      let list1 = new List();
      let res = list.equal(list1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_FOR_EACH_001
     * @tc.name  : testForEach001
     * @tc.desc  : Traversing elements in an List instance. For example: list.forEach((item, index) => {arr.push(item);}).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach001", 0, function () {
      let list = new List();
      let c = [1, 2, 3, 4];
      list.add(8);
      list.add("一");
      list.add("二");
      list.add(5);
      list.add(c);
      list.add(6);
      list.add("三");
      list.add("四");
      let arr = [];
      list.forEach((item, index) => {
        arr.push(item);
      });
      let a = [8, "一", "二", 5, c, 6, "三", "四"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_FOR_EACH_002
     * @tc.name  : testForEach002
     * @tc.desc  : Traversing elements in an List instance. For example: list.forEach((item, index) => {num++;}).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach002", 0, function () {
      let list = new List();
      let num = 0;
      list.forEach((item, index) => {
        num++;
      });
      expect(num).assertEqual(0);
    });

    /**
     * @tc.number: TEST_FOR_EACH_003
     * @tc.name  : testForEach003
     * @tc.desc  : Traversing elements in an List instance. For example: list.forEach.bind({}, "a")().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testForEach003', 0, function () {
      let  list = new List();
      try {
        list.forEach.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The forEach method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_SORT_001
     * @tc.name  : testSort001
     * @tc.desc  : Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSort001", 0, function () {
      let list = new List();
      list.add(4);
      list.add(3);
      list.add(1);
      list.add(2);
      list.add(14);
      list.sort((a:any, b:any) => a - b);
      let arr = [];
      list.forEach((item, index) => {
        arr.push(item);
      });
      let a = [1, 2, 3, 4, 14];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_SORT_002
     * @tc.name  : testSort002
     * @tc.desc  : Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSort002", 0, function () {
      let list = new List();
      list.add(";");
      list.add("一");
      list.add("a");
      list.add("1");
      list.add("2");
      list.add("14");
      list.sort((a:any, b:any) => a - b);
      let arr = [];
      list.forEach((item, index) => {
        arr.push(item);
      });
      let a = [";", "一", "a", "1", "2", "14"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_SORT_003
     * @tc.name  : testSort003
     * @tc.desc  : Arrange the elements in the List instance in descending order. For example: list.sort((a, b) => a - b).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSort003", 0, function () {
      let list = new List();
      list.sort((a:any, b:any) => a - b);
      let res1 = list.length;
      expect(res1).assertEqual(0);
    });

    /**
     * @tc.number: TEST_CLEAR_001
     * @tc.name  : testClear001
     * @tc.desc  : Clear all elements in the List instance. For example: list.clear().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.clear();
      let res = list.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number: TEST_CLEAR_002
     * @tc.name  : testClear002
     * @tc.desc  : Clear all elements in the List instance. For example: list.clear().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear002", 0, function () {
      let list = new List();
      list.clear();
      let res1 = list.length;
      expect(res1).assertEqual(0);
    });

    /**
     * @tc.number: TEST_GET_SUBLIST_001
     * @tc.name  : testGetSubList001
     * @tc.desc  : Intercepts an element within the specified range, including the element with the
     * starting index but not the element with the ending index. For example: list.getSubList(2, 4).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetSubList001", 0, function () {
      let list = new List();
      list.add(4);
      list.add(3);
      list.add(1);
      list.add(2);
      list.add(14);
      let res = list.getSubList(2, 4);
      let arr = [];
      res.forEach((item, index) => {
        arr.push(item);
      });
      let a = [1, 2];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_GET_SUBLIST_002
     * @tc.name  : testGetSubList002
     * @tc.desc  : Intercepts an element within the specified range, including the element with the
     * starting index but not the element with the ending index. For example: list.getSubList(2, 8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetSubList002", 0, function () {
      let list = new List();
      list.add("4");
      list.add("3");
      list.add("1");
      list.add("2");
      list.add("14");
      try {
        list.getSubList(2, 8);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 5. Received value is: 8`);
      }
    });

    /**
     * @tc.number: TEST_GET_SUBLIST_003
     * @tc.name  : testGetSubList003
     * @tc.desc  : Intercepts an element within the specified range, including the element with the
     * starting index but not the element with the ending index. For example: list.getSubList(6, 8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetSubList003", 0, function () {
      let list = new List();
      list.add("4");
      list.add("3");
      list.add("1");
      list.add("2");
      list.add("14");
      try {
        list.getSubList(6, 8);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
      }
    });

    /**
     * @tc.number: TEST_GET_SUBLIST_004
     * @tc.name  : testGetSubList004
     * @tc.desc  : Intercepts an element within the specified range, including the element with the
     * starting index but not the element with the ending index. For example: list.getSubList(6, 2).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetSubList004", 0, function () {
      let list = new List();
      list.add("4");
      list.add("3");
      list.add("1");
      list.add("2");
      list.add("14");
      try {
        list.getSubList(6, 2);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 1. Received value is: 6`);
      }
    });

    /**
     * @tc.number: TEST_REPLACE_ALL_ELEMENTS_001
     * @tc.name  : testReplaceAllElements001
     * @tc.desc  : Perform some operation on the elements in the List instance and return the List instance
     * after the operation. For example: list.replaceAllElements((item, index) => {return (item = 2 * item);}).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testReplaceAllElements001", 0, function () {
      let list = new List();
      list.add(1);
      list.add(2);
      list.add(4);
      list.add(5);
      list.replaceAllElements((item:number, index) => {
        return (item = 2 * item);
      });
      let arr = [];
      list.forEach((item, index) => {
        arr.push(item);
      });
      let a = [2, 4, 8, 10];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_REPLACE_ALL_ELEMENTS_002
     * @tc.name  : testReplaceAllElements002
     * @tc.desc  : Perform some operation on the elements in the List instance and return the List instance
     * after the operation. For example: list.replaceAllElements((item, index) => {num++;}).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testReplaceAllElements002", 0, function () {
      let list = new List();
      let num = 0;
      list.replaceAllElements((item, index) => {
        num++;
      });
      expect(num).assertEqual(0);
    });

    /**
     * @tc.number: TEST_CONVERT_TO_ARRAY_001
     * @tc.name  : testConvertToArray001
     * @tc.desc  : Convert an List instance to an array. For example: list.convertToArray().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConvertToArray001", 0, function () {
      let list = new List();
      list.add(4);
      list.add(3);
      list.add(1);
      list.add(2);
      list.add(14);
      let res = list.convertToArray();

      let a = [4, 3, 1, 2, 14];
      for (let i = 0; i < a.length; i++) {
        expect(res[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_CONVERT_TO_ARRAY_002
     * @tc.name  : testConvertToArray002
     * @tc.desc  : Convert an List instance to an array. For example: list.convertToArray().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConvertToArray002", 0, function () {
      let list = new List();
      const res = list.convertToArray();
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_001
     * @tc.name  : testIsEmpty001
     * @tc.desc  : Determine whether the List instance is empty. For example: list.isEmpty().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty001", 0, function () {
      let list = new List();
      list.add(8);
      list.add("一");
      list.add("二");
      list.add(5);
      let c = [1, 2, 3, 4];
      list.add(c);
      list.add(6);
      list.add("三");
      list.add("四");
      let res = list.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_002
     * @tc.name  : testIsEmpty002
     * @tc.desc  : Determine whether the List instance is empty. For example: list.isEmpty().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty002", 0, function () {
      let list = new List();
      let res = list.isEmpty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_003
     * @tc.name  : testIsEmpty003
     * @tc.desc  : Determine whether the List instance is empty. For example: list.isEmpty.bind({}, "a")().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty003", 0, function () {
      let  list = new List();
      try {
        list.isEmpty.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_ITERATOR_001
     * @tc.name  : testIterator001
     * @tc.desc  : Iterates over all elements in an List instance. For example: List[Symbol.iterator]().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIterator001", 0, function () {
      let list = new List();
      list.add("a");
      list.add("b");
      list.add("c");
      list.add("a");
      list.add("b");
      list.removeByIndex(2);
      let arr = [];
      let itr = list[Symbol.iterator]();
      let tmp = undefined;
      do {
        tmp = itr.next().value;
        arr.push(tmp);
      } while (tmp != undefined);
      let a = ["a", "b", "a", "b"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });



  })
}