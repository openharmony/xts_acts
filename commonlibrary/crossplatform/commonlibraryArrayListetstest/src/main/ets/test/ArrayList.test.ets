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
import ArrayList from "@ohos.util.ArrayList";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function ArraylistTest() {
  describe("ArraylistTest", function () {

    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Create an ArrayList instance. For example: let arrayList = new ArrayList().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      try {
        let arrayList = new ArrayList();
        expect(arrayList != undefined).assertEqual(true);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The ArrayList's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.number: TEST_LENGTH_001
     * @tc.name  : testLength001
     * @tc.desc  : Get the number of elements contained in the ArrayList instance. For example: arrayList.length.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 0
     * */
    it("testLength001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number: TEST_ADD_001
     * @tc.name  : testAdd001
     * @tc.desc  : Add a string type element to the end of the ArrayList instance. For example: arrayList.add("四").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      let res = arrayList.has("四");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_002
     * @tc.name  : testAdd002
     * @tc.desc  : Add a number type element to the end of the ArrayList instance. For example: arrayList.add(8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(8);
      let res = arrayList.has(8);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_003
     * @tc.name  : testAdd003
     * @tc.desc  : Add a object type element to the end of the ArrayList instance.
     * For example: let a = {name: "lala", age: "13岁"}; arrayList.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd003", 0, function () {
      let arrayList = new ArrayList();
      let a = {name: "lala", age: "13岁"};
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_004
     * @tc.name  : testAdd004
     * @tc.desc  : Add a array type element to the end of the ArrayList instance.
     * For example: let a = [1, 2, 3, 4]; arrayList.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd004", 0, function () {
      let arrayList = new ArrayList();
      let a = [1, 2, 3, 4];
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_005
     * @tc.name  : testAdd005
     * @tc.desc  : Add a boolean type element to the end of the ArrayList instance.
     * For example: let a = true; arrayList.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd005", 0, function () {
      let arrayList = new ArrayList();
      let a = true;
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_006
     * @tc.name  : testAdd006
     * @tc.desc  : Add a string element to the end of the ArrayList instance.
     * For example: for (let i = 0; i < 100; i++) {arrayList.add(i);}.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd006", 0, function () {
      let arrayList = new ArrayList();
      for (let i = 0; i < 100; i++) {
        arrayList.add(i);
      }
      let res = arrayList.getIndexOf(99);
      let res1 = arrayList.length;
      expect(res).assertEqual(99);
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.number: TEST_ADD_007
     * @tc.name  : testAdd007
     * @tc.desc  : Add a symbol type element to the end of the ArrayList instance.
     * For example: let a = "*";arrayList.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd007", 0, function () {
      let arrayList = new ArrayList();
      let a = "*";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_008
     * @tc.name  : testAdd008
     * @tc.desc  : Add a decimal type to the end of the ArrayList instance. For example: let a = "3.14";arrayList.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd008", 0, function () {
      let arrayList = new ArrayList();
      let a = "3.14";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_009
     * @tc.name  : testAdd009
     * @tc.desc  : Add a null character element to the end of the ArrayList instance.
     * For example: let a = "";arrayList.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd009", 0, function () {
      let arrayList = new ArrayList();
      let a = "";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_010
     * @tc.name  : testAdd010
     * @tc.desc  : Add a boolean type element to the end of the ArrayList instance.
     * For example: arrayList.add.bind({})().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd010", 0, function () {
      let arrayList = new ArrayList();
      try {
        arrayList.add.bind({}, "a")()
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
     * @tc.desc  : Insert an element into the middle of the ArrayList instance. For example: arrayList.insert(8, 2).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsert001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["四", "三", 8, 1, "a"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_INSERT_002
     * @tc.name  : testInsert002
     * @tc.desc  : Inserting an element with an index less than 0 will throw an exception.
     * For example: arrayList.insert(8, -1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsert002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      try {
        let res = arrayList.insert(8, -1);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: -1`);
      }
    });

    /**
     * @tc.number: TEST_INSERT_003
     * @tc.name  : testInsert003
     * @tc.desc  : Inserting an element with an index greater than or equal to the length of
     * the ArrayList instance will throw an exception. For example: arrayList.insert(8, 10).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsert003", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      try {
        let res = arrayList.insert(8, 10);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 10`);
      }
    });

    /**
     * @tc.number: TEST_INSERT_004
     * @tc.name  : testInsert004
     * @tc.desc  : Inserting an element with an index greater than or equal to the length of
     * the ArrayList instance will throw an exception. For example: arrayList.insert(8, 11).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsert004", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      try {
        let res = arrayList.insert(8, 11);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 11`);
      }
    });

    /**
     * @tc.number: TEST_HAS_001
     * @tc.name  : testHas001
     * @tc.desc  : Check whether the ArrayList contains a specified element. For example: arrayList.has(8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.has(8);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_HAS_002
     * @tc.name  : testHas002
     * @tc.desc  : Check whether the ArrayList contains a specified element.
     * For example: arrayList.has.bind({})().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testHas002', 0, function () {
      let arrayList = new ArrayList();
      try {
        arrayList.has.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The has method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_HAS_003
     * @tc.name  : testHas003
     * @tc.desc  : Check whether the ArrayList contains a specified element. For example: arrayList.has("二").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas003", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.has("二");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_001
     * @tc.name  : testGetIndexOf001
     * @tc.desc  : In the ArrayList instance, find the index of a specified element from front to back,
     * and return the index found for the first time. If not found, return -1. For example: arrayList.getIndexOf(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOf001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(1);
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(1, 2);
      let res1 = arrayList.getIndexOf(1);
      expect(res1).assertEqual(0);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_002
     * @tc.name  : testGetIndexOf002
     * @tc.desc  : In the ArrayList instance, find the index of a specified element from front to back,
     * and return the index found for the first time. If not found, return -1. For example: arrayList.getIndexOf("A").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOf002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(1);
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(1, 2);
      let res = arrayList.getIndexOf("A");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_REMOVE_BY_INDEX_001
     * @tc.name  : testRemoveByIndex001
     * @tc.desc  : In the ArrayList instance, delete the element based on its index.
     * For example: arrayList.removeByIndex(2).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByIndex001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.removeByIndex(2);
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["四", "三", "a"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_BY_INDEX_002
     * @tc.name  : testRemoveByIndex002
     * @tc.desc  : In the ArrayList instance, delete the element based on its index index.
     * For example: arrayList.removeByIndex(5).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByIndex002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("a");
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add("a");
      arrayList.add("b");
      try {
        let res = arrayList.removeByIndex(5);
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
     * @tc.desc  : In the ArrayList instance, delete the element based on its index.
     * For example: arrayList.removeByIndex.bind({})().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testRemoveByIndex003', 0, function () {
      let arrayList = new ArrayList();
      try {
        arrayList.removeByIndex.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The removeByIndex method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_001
     * @tc.name  : testRemove001
     * @tc.desc  : Delete the specified element . For example: arrayList.remove("三").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.remove("三");
      let res = arrayList.has("三");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_REMOVE_002
     * @tc.name  : testRemove002
     * @tc.desc  : Delete the specified element.For example: arrayList.remove("A").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      let res = arrayList.remove("A");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_REMOVE_003
     * @tc.name  : testRemove003
     * @tc.desc  : Delete the specified element.
     * For example: arrayList.forEach((item, index) => {if (item == 1) {arrayList.remove(item);}}).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove003", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(0);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(1);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.forEach((item, index) => {
        if (item == 1) {
          arrayList.remove(item);
        }
      });
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = [0, 2, 3];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_004
     * @tc.name  : testRemove004
     * @tc.desc  : Delete the specified element . For example: arrayList.remove.bind({})().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testRemove004', 0, function () {
      let arrayList = new ArrayList();
      try {
        arrayList.remove.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The remove method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_GET_LAST_INDEX_OF_001
     * @tc.name  : testGetLastIndexOf001
     * @tc.desc  :  In the ArrayList instance, find the index of a specified element from brack to front,
     * and return the index found for the first time. If not found, return -1. For example: arrayList.add("四").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetLastIndexOf001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      let res = arrayList.getLastIndexOf(1);
      expect(res).assertEqual(4);
    });

    /**
     * @tc.number: TEST_REMOVE_BY_RANGE_001
     * @tc.name  : testRemoveByRange001
     * @tc.desc  : Deletes elements from a specified range, including elements at the start position and
     * elements at the end position. For example: arrayList.removeByRange(1, 3).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByRange001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      arrayList.removeByRange(1, 3);
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["四", "a", 1, "b", "c", 1];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_BY_RANGE_002
     * @tc.name  : testRemoveByRange002
     * @tc.desc  : Add a string element to the end of the ArrayList instance. For example: arrayList.add("四").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByRange002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      try {
        let res = arrayList.removeByRange(3, 1);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 0. Received value is: 3`);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_BY_RANGE_003
     * @tc.name  : testRemoveByRange003
     * @tc.desc  : Deletes elements from a specified range, including elements at the start position and
     * elements at the end position. For example: removeByRange(6, 8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByRange003", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      try {
        let res = arrayList.removeByRange(6, 8);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_BY_RANGE_004
     * @tc.name  : testRemoveByRange004
     * @tc.desc  : Deletes elements from a specified range, including elements at the start position and
     * elements at the end position. For example: removeByRange(0, 7).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByRange004", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      arrayList.removeByRange(0, 8);
      let res = arrayList.length;
      let res1 = arrayList.getLastIndexOf(1);
      expect(res).assertEqual(0);
      expect(res1).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_REMOVE_BY_RANGE_005
     * @tc.name  : testRemoveByRange005
     * @tc.desc  : Deletes elements from a specified range, including elements at the start position and
     * elements at the end position. For example: removeByRange(0, 8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveByRange005", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      try {
        arrayList.removeByRange(0, 9);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: 9`);
      }
    });

    /**
     * @tc.number: TEST_REPLACE_ALL_ELEMENTS_001
     * @tc.name  : testReplaceAllElements001
     * @tc.desc  : Perform some operation on the elements in the ArrayList instance and return the ArrayList instance
     * after the operation. For example: arrayList.replaceAllElements((item, index) => {return (item = 2 * item);}).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testReplaceAllElements001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.replaceAllElements((item:number, index:number) => {
        return (item = 2 * item);
      });
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = [8, 6, 2, 4, 28];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_FOR_EACH_001
     * @tc.name  : testForEach001
     * @tc.desc  : Traversing elements in an ArrayList instance.
     * For example: arrayList.forEach((item, index) => {arr.push(item);}).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = [4, 3, 1, 2, 14];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_FOR_EACH_002
     * @tc.name  : testForEach002
     * @tc.desc  : Traversing elements in an ArrayList instance.
     * For example: arrayList.forEach.bind({}, "a")(() => {}).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testForEach002', 0, function () {
      let arrayList = new ArrayList();
      try {
        arrayList.forEach.bind({}, "a")();
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
     * @tc.desc  : Arrange the elements in the ArrayList instance in descending order.
     * For example: arrayList.sort((a, b) => a - b).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSort001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.sort((a:any, b:any) => a - b);
      let arr = [];
      arrayList.forEach((item, index) => {
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
     * @tc.desc  : Arrange the elements in the ArrayList instance in descending order.
     * For example: arrayList.sort((a, b) => a - b).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSort002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("刘");
      arrayList.add("张三");
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add("李四");
      arrayList.sort((a:any, b:any) => a - b);
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["刘", "张三", 1, 2, "李四"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_SORT_003
     * @tc.name  : testSort003
     * @tc.desc  : Arrange the elements in the ArrayList instance in descending order.
     * For example: arrayList.sort((a, b) => a - b).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSort003", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("c");
      arrayList.add("a");
      arrayList.add("b");
      arrayList.add("e");
      arrayList.add("d");
      arrayList.sort((a:any, b:any) => a - b);
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["c", "a", "b", "e", "d"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_SUB_ARRAY_LIST_001
     * @tc.name  : testSubArrayList001
     * @tc.desc  : Intercepts an element within the specified range, including the element with the
     * starting index but not the element with the ending index. For example: arrayList.subArrayList(2, 4).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSubArrayList001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let subArr = arrayList.subArrayList(2, 4);
      let arr = [];
      subArr.forEach((item, index) => {
        arr.push(item);
      });
      let a = [1, 2];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_SUB_ARRAY_LIST_002
     * @tc.name  : testSubArrayList002
     * @tc.desc  : Intercepts an element within the specified range, including the element with the
     * starting index but not the element with the ending index. For example: arrayList.subArrayList(4, 2).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSubArrayList002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      try {
        let subArr = arrayList.subArrayList(4, 2);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 1. Received value is: 4`);
      }
    });

    /**
     * @tc.number: TEST_SUB_ARRAY_LIST_003
     * @tc.name  : testSubArrayList003
     * @tc.desc  : Intercepts an element within the specified range, including the element with the
     * starting index but not the element with the ending index. For example: arrayList.subArrayList(0 ,6).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSubArrayList003", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let subArr = arrayList.subArrayList(0, 5);
      let arr = [];
      arrayList.forEach((item, index) => {
        arr.push(item);
      });
      let a = [4, 3, 1, 2, 14];
      for (let i = 0; i < a.length; i++) {
        expect(a[i]).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number: TEST_SUB_ARRAY_LIST_004
     * @tc.name  : testSubArrayList004
     * @tc.desc  : Intercepts an element within the specified range, including the element with the
     * starting index but not the element with the ending index. For example: arrayList.subArrayList(6, 9).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSubArrayList004", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      try {
        let subArr = arrayList.subArrayList(6, 9);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
      }
    });

    /**
     * @tc.number: TEST_CLEAR_001
     * @tc.name  : testClear001
     * @tc.desc  : Clear all elements in the ArrayList instance. For example: arrayList.clear().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.clear();
      let res = arrayList.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number: TEST_CLEAR_002
     * @tc.name  : testClear002
     * @tc.desc  : Clear all elements in the ArrayList instance. For example: arrayList.clear.bind({}, "a")().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testClear002', 0, function () {
      let arrayList = new ArrayList();
      try {
        arrayList.clear.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The clear method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_CLONE_001
     * @tc.name  : testClone001
     * @tc.desc  : Clone an ArrayList instance. For example: arrayList.clone().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClone001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let res = arrayList.clone();
      let arr = [];
      res.forEach((item, index) => {
        arr.push(item);
      });
      let a = [4, 3, 1, 2, 14];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_GET_CAPACITY_001
     * @tc.name  : testGetCapacity001
     * @tc.desc  : Get the capacity of ArrayList instance. For example: arrayList.getCapacity().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetCapacity001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let res = arrayList.getCapacity();
      expect(res).assertEqual(10);
    });

    /**
     * @tc.number: TEST_GET_CAPACITY_002
     * @tc.name  : testGetCapacity002
     * @tc.desc  : Get the capacity of the ArrayList instance after capacity expansion.
     * For example: arrayList.getCapacity().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetCapacity002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.add("a");
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add("d");
      arrayList.add("v");
      let a = [1, 2, 3, 4];
      arrayList.add(a);
      let res = arrayList.getCapacity();
      expect(res).assertEqual(15);
    });

    /**
     * @tc.number: TEST_CONVERT_TO_ARRAY_001
     * @tc.name  : testConvertToArray001
     * @tc.desc  : Convert an ArrayList instance to an array. For example: arrayList.convertToArray().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConvertToArray001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let arr = arrayList.convertToArray();
      let a = [4, 3, 1, 2, 14];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_IS_EMPTY_001
     * @tc.name  : testIsEmpty001
     * @tc.desc  : Determine whether the ArrayList instance is empty. For example: arrayList.isEmpty().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.clear();
      let res = arrayList.isEmpty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_002
     * @tc.name  : testIsEmpty002
     * @tc.desc  : Determine whether the ArrayList instance is empty. For example: arrayList.isEmpty().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let res = arrayList.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_003
     * @tc.name  : testIsEmpty003
     * @tc.desc  : Determine whether the ArrayList instance is empty. For example: arrayList.isEmpty.bind({}, "a")().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testIsEmpty003', 0, function () {
      let arrayList = new ArrayList();
      try {
        arrayList.isEmpty.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_INCREASE_CAPACITY_TO_001
     * @tc.name  : testIncreaseCapacityTo001
     * @tc.desc  : Expand the ArrayList instance capacity to the specified value.
     * For example: arrayList.increaseCapacityTo(8).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIncreaseCapacityTo001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.increaseCapacityTo(8);
      let res = arrayList.getCapacity();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.number: TEST_INCREASE_CAPACITY_TO_002
     * @tc.name  : testIncreaseCapacityTo002
     * @tc.desc  : Expand the ArrayList instance capacity to the specified value.
     * For example: arrayList.increaseCapacityTo(-1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIncreaseCapacityTo002", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.increaseCapacityTo(-1);
      let res = arrayList.getCapacity();
      expect(res).assertEqual(10);
    });

    /**
     * @tc.number: TEST_TRIM_TO_CURRENT_LENGTH_001
     * @tc.name  : testTrimToCurrentLength001
     * @tc.desc  : Limit the ArrayList instance capacity to the length of the ArrayList instance.
     * For example: arrayList.trimToCurrentLength().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testTrimToCurrentLength001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.trimToCurrentLength();
      let res = arrayList.getCapacity();
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number: TEST_ITERATOR_001
     * @tc.name  : testIterator001
     * @tc.desc  : Iterates over all elements in an ArrayList instance. For example: arrayList[Symbol.iterator]().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIterator001", 0, function () {
      let arrayList = new ArrayList();
      arrayList.add("刘");
      arrayList.add("张三");
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add("李四");
      let arr = [];
      let itr = arrayList[Symbol.iterator]();
      let tmp = undefined;
      do {
        tmp = itr.next().value;
        arr.push(tmp);
      } while (tmp != undefined);
      let a = ["刘", "张三", 1, 2, "李四"];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });


  })
}