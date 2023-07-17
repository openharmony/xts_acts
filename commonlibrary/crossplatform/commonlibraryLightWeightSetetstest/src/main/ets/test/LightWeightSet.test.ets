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
import LightWeightSet from "@ohos.util.LightWeightSet";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function LightWeightSetTest() {
  describe("LightWeightSetTest", function () {

    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Create an LightWeightSet instance. For example: let lightWeightSet = new LightWeightSet().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      try {
        let lightWeightSet = new LightWeightSet();
        expect(lightWeightSet != undefined).assertEqual(true);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200012);
        expect(err.message).assertEqual("The LightWeightSet's constructor cannot be directly invoked");
      }
    });

    /**
     * @tc.number: TEST_LENGTH_001
     * @tc.name  : testLength001
     * @tc.desc  : Get the number of element in the LightWeightSet instance. For example: lightWeightSet.length.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it("testLength001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number: TEST_ADD_001
     * @tc.name  : testAdd001
     * @tc.desc  : Add element to LightWeightSet instance. For example: lightWeightSet.add(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      let res = lightWeightSet.has(1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_002
     * @tc.name  : testAdd002
     * @tc.desc  : Add element to LightWeightSet instance. For example: lightWeightSet.add("a").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd002", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add("a");
      let res = lightWeightSet.has("a");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_003
     * @tc.name  : testAdd003
     * @tc.desc  : Add element to LightWeightSet instance.
     * For example: let a = [1, 2, 3, 4]; lightWeightSet.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd003", 0, function () {
      let lightWeightSet = new LightWeightSet();
      let a = [1, 2, 3, 4];
      lightWeightSet.add(a);
      let res = lightWeightSet.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_004
     * @tc.name  : testAdd004
     * @tc.desc  : Add element to LightWeightSet instance.
     * For example: let a = {name: "lili", age: "13"}; lightWeightSet.add(a).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd004", 0, function () {
      let lightWeightSet = new LightWeightSet();
      let c = {name: "lili", age: "13"};
      lightWeightSet.add(c);
      let res = lightWeightSet.has(c);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_005
     * @tc.name  : testAdd005
     * @tc.desc  : Add element to LightWeightSet instance. For example: let c = false; lightWeightSet.add(c).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd005", 0, function () {
      let lightWeightSet = new LightWeightSet();
      let c = false;
      lightWeightSet.add(c);
      let res = lightWeightSet.has(c);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_006
     * @tc.name  : testAdd006
     * @tc.desc  : Add element to LightWeightSet instance. For example: lightWeightSet.add(null).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd006", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(null);
      let res = lightWeightSet.has(null);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_007
     * @tc.name  : testAdd007
     * @tc.desc  : Add element to LightWeightSet instance. For example: lightWeightSet.add(1.23).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd007", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1.23);
      let res1 = lightWeightSet.has(1.23);
      expect(res1).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_008
     * @tc.name  : testAdd008
     * @tc.desc  : Add element to LightWeightSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd008", 0, function () {
      let lightWeightSet = new LightWeightSet();
      for (let i = 0; i < 10000; i++) {
        lightWeightSet.add(i);
      }
      let res = lightWeightSet.getValueAt(9999);
      let res1 = lightWeightSet.length;
      expect(res).assertEqual(9999);
      expect(res1).assertEqual(10000);
    });

    /**
     * @tc.number: TEST_ADD_009
     * @tc.name  : testAdd009
     * @tc.desc  : Add element to LightWeightSet instance. For example: lightWeightSet.add("").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd009", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add("");
      let res = lightWeightSet.has("");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_010
     * @tc.name  : testAdd010
     * @tc.desc  : Add element to LightWeightSet instance. For example: lightWeightSet.add("$").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd010", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add("$");
      let res = lightWeightSet.has("$");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_ALL_001
     * @tc.name  : testAddAll001
     * @tc.desc  : Copy all element from one LightWeightSet to another.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAddAll001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let lightWeightSet1 = new LightWeightSet();
      lightWeightSet1.add(6);
      lightWeightSet1.add(7);
      let res1 = lightWeightSet.addAll(lightWeightSet1);
      for (let item of lightWeightSet) {
        console.log("lightWeightSet-----" + item);
      }
      for (let item of lightWeightSet1) {
        console.log("lightWeightSet1-----" + item);
      }
      for (let i = 1; i < 8; i++) {
        expect(lightWeightSet.has(i)).assertEqual(true);
      }
      expect(res1).assertEqual(true);
    });

    /**
     * @tc.number: TEST_HAS_ALL_001
     * @tc.name  : testHasAll001
     * @tc.desc  : Judge whether a lightWeightSet contains all elements in another lightWeightSet.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasAll001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add("a");
      lightWeightSet.add("b");
      lightWeightSet.add("c");
      lightWeightSet.add("d");
      lightWeightSet.add("e");
      let lightWeightSet1 = new LightWeightSet();
      lightWeightSet1.add("a");
      lightWeightSet1.add("d");
      let res = lightWeightSet.hasAll(lightWeightSet1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_HAS_ALL_002
     * @tc.name  : testHasAll002
     * @tc.desc  : Judge whether a lightWeightSet contains all elements in another lightWeightSet.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasAll002", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add("a");
      lightWeightSet.add("b");
      lightWeightSet.add("c");
      lightWeightSet.add("e");
      let lightWeightSet1 = new LightWeightSet();
      lightWeightSet1.add("a");
      lightWeightSet1.add("d");
      let res = lightWeightSet.hasAll(lightWeightSet1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_ALL_003
     * @tc.name  : testHasAll003
     * @tc.desc  : Judge whether a lightWeightSet contains all elements in another lightWeightSet.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasAll003", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let lightWeightSet1 = new LightWeightSet();
      lightWeightSet1.add("a1");
      lightWeightSet1.add("d1");
      let res = lightWeightSet.hasAll(lightWeightSet1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_ALL_004
     * @tc.name  : testHasAll004
     * @tc.desc  : Judge whether a lightWeightSet contains all elements in another lightWeightSet.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasAll004", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let lightWeightSet1 = new LightWeightSet();
      lightWeightSet1.add(1);
      lightWeightSet1.add("d");
      let res = lightWeightSet.hasAll(lightWeightSet1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_001
     * @tc.name  : testHas001
     * @tc.desc  : Judge whether a lightWeightSet contains all elements in another lightWeightSet.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add("a");
      lightWeightSet.add("b");
      lightWeightSet.add("c");
      lightWeightSet.add("d");
      lightWeightSet.add("e");
      let res = lightWeightSet.has("a");
      expect(res).assertEqual(true);
      let res1 = lightWeightSet.has(1);
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.number: TEST_EQUAL_001
     * @tc.name  : testEqual001
     * @tc.desc  : Compare lightWeightMap and specified object for equality. For example: lightWeightSet.equal(obj).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqual001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      let obj = [1,2,3];
      let res = lightWeightSet.equal(obj);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_EQUAL_002
     * @tc.name  : testEqual002
     * @tc.desc  : Compare lightWeightMap and specified object for equality. For example: lightWeightSet.equal(obj).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEqual002", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      let obj = [1,2];
      let res = lightWeightSet.equal(obj);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_INCREASE_CAPACITY_TO_001
     * @tc.name  : testIncreaseCapacityTo001
     * @tc.desc  : Expand the LightWeightSet capacity to the specified value.
     * For example: lightWeightSet.increaseCapacityTo(3).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIncreaseCapacityTo001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      try {
        lightWeightSet.increaseCapacityTo(3);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "minimumCapacity" is out of range. It must be > 8. Received value is: 3`);
      }
    });

    /**
     * @tc.number: TEST_INCREASE_CAPACITY_TO_002
     * @tc.name  : testIncreaseCapacityTo002
     * @tc.desc  : Expand the LightWeightSet capacity to the specified value.
     * For example: lightWeightSet.increaseCapacityTo(20).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIncreaseCapacityTo002", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.increaseCapacityTo(20);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_001
     * @tc.name  : testGetIndexOf001
     * @tc.desc  : Get the index according to the specified element. For example: lightWeightSet.getIndexOf(2).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOf001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.getIndexOf(2);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number: TEST_REMOVE_001
     * @tc.name  : testRemove001
     * @tc.desc  : Delete elements according to key. For example: lightWeightMap.remove(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.remove(1);
      expect(res).assertEqual(1);
      let arr = [];
      lightWeightSet.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = [2, 3, 4, 5];
      for (let i = 0; i < arr.length; i++) {
        expect(arr1[i]).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_002
     * @tc.name  : testRemove002
     * @tc.desc  : Delete elements according to key. For example: lightWeightMap.remove(3).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove002", 0, function () {
      let lightWeightSet = new LightWeightSet();
      let res = lightWeightSet.remove(3);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_REMOVE_003
     * @tc.name  : testRemove003
     * @tc.desc  : Delete elements according to key. For example: lightWeightMap.remove("A").
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove003", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.remove("A");
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_REMOVE_AT_001
     * @tc.name  : testRemoveAt001
     * @tc.desc  : Delete elements according to index. For example: lightWeightSet.removeAt(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveAt001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.removeAt(1);
      expect(res).assertEqual(true);
      let arr = [];
      lightWeightSet.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = [1, 3, 4, 5];
      for (let i = 0; i < arr.length; i++) {
        expect(arr1[i]).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_AT_002
     * @tc.name  : testRemoveAt002
     * @tc.desc  : Delete elements according to index. For example: lightWeightSet.removeAt(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveAt002", 0, function () {
      let lightWeightSet = new LightWeightSet();
      let res = lightWeightSet.removeAt(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CLEAR_001
     * @tc.name  : testClear001
     * @tc.desc  : Clear all elements in LightWeightSet. For example: lightWeightSet.clear().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      lightWeightSet.clear();
      let res = lightWeightSet.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number: TEST_CLEAR_002
     * @tc.name  : testClear002
     * @tc.desc  : Clear all elements in LightWeightSet. For example: lightWeightSet.clear().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear002", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.length;
      lightWeightSet.clear();
      let res1 = lightWeightSet.length;
      expect(res).assertEqual(5);
      expect(res1).assertEqual(0);
    });

    /**
     * @tc.number: TEST_FOR_EACH_001
     * @tc.name  : testForEach001
     * @tc.desc  : Traverse all elements in the LightWeightSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let arr = [];
      lightWeightSet.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = [1, 2, 3, 4, 5];
      for (let i = 0; i < arr1.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.number: TEST_ITERATOR_001
     * @tc.name  : testIterator001
     * @tc.desc  : Iterate over all elements in the LightWeightSet.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIterator001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let arr = [];
      let res = lightWeightSet[Symbol.iterator]();
      let temp = undefined;
      do {
        temp = res.next().value;
        arr.push(temp);
      } while (temp != undefined);
      let arr1 = [1, 2, 3, 4, 5];
      for (let i = 0; i < arr1.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.number: TEST_TO_STRING_001
     * @tc.name  : testToString001
     * @tc.desc  : Use "," to splice the elements in the LightWeightSet instance into a string.
     * For example: lightWeightSet.toString().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      let res = lightWeightSet.toString();
      expect(res).assertEqual("1,2,3");
    });

    /**
     * @tc.number: TEST_TO_ARRAY_001
     * @tc.name  : testToArray001
     * @tc.desc  : Convert an lightWeightSet instance to an array. For example: lightWeightSet.toArray().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToArray001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.toArray();
      let arr1 = [1, 2, 3, 4, 5];
      for (let i = 0; i < arr1.length; i++) {
        expect(res[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.number: TEST_GET_VALUE_AT_001
     * @tc.name  : testGetValueAt001
     * @tc.desc  :  Get the element according to the corresponding index. For example: lightWeightSet.getValueAt(1).
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetValueAt001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.getValueAt(1);
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number: TEST_VALUES_001
     * @tc.name  : testValues001
     * @tc.desc  : Get a collection of all the values in the LightWeightSet. For example: lightWeightSet.values().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testValues001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.values();
      expect(res.next().value).assertEqual(1);
      expect(res.next().value).assertEqual(2);
      expect(res.next().value).assertEqual(3);
      expect(res.next().value).assertEqual(4);
      expect(res.next().value).assertEqual(5);
    });

    /**
     * @tc.number: TEST_ENTRIES_001
     * @tc.name  : testEntries001
     * @tc.desc  : Get all key value pairs collection in lightWeightSet.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEntries001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.entries();
      expect(JSON.stringify(res.next().value)).assertEqual("[1,1]");
      expect(JSON.stringify(res.next().value)).assertEqual("[2,2]");
      expect(JSON.stringify(res.next().value)).assertEqual("[3,3]");
      expect(JSON.stringify(res.next().value)).assertEqual("[4,4]");
      expect(JSON.stringify(res.next().value)).assertEqual("[5,5]");
    });

    /**
     * @tc.number: TEST_IS_EMPTY_001
     * @tc.name  : testIsEmpty001
     * @tc.desc  : Determine whether the lightWeightSet instance is empty. For example: lightWeightSet.isEmpty().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty001", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      let res = lightWeightSet.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_002
     * @tc.name  : testIsEmpty002
     * @tc.desc  : Determine whether the lightWeightSet instance is empty. For example: lightWeightSet.isEmpty().
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty002", 0, function () {
      let lightWeightSet = new LightWeightSet();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      lightWeightSet.add(4);
      lightWeightSet.add(5);
      lightWeightSet.clear();
      let res = lightWeightSet.isEmpty();
      expect(res).assertEqual(true);
    });


  })
}