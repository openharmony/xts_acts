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
import HashSet from "@ohos.util.HashSet";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
export default function HashSetTest() {
  describe("HashSetTest", function () {
    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Create an HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      let hashSet = new HashSet();
      expect(hashSet != null).assertTrue();
    });

    /**
     * @tc.number: TEST_LENGTH_001
     * @tc.name  : testLength001
     * @tc.desc  : Get the number of element in the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 0
     */
    it("testLength001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(1);
      hashSet.add(2);
      let res = hashSet.length;
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_001
     * @tc.name  : testIsEmpty001
     * @tc.desc  : Determine whether the HashSet instance is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(4);
      hashSet.add(1);
      let res = hashSet.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_002
     * @tc.name  : testIsEmpty002
     * @tc.desc  : Determine whether the HashSet instance is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty002", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.clear();
      let res = hashSet.isEmpty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_003
     * @tc.name  : testIsEmpty003
     * @tc.desc  : Determine whether the HashSet instance is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty003", 0, function () {
      let hashSet = new HashSet();
      try {
        hashSet.isEmpty.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_HAS_001
     * @tc.name  : testHas001
     * @tc.desc  : Determine whether the HashSet instance contains the specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.has(1);
      expect(res).assertEqual(true);
      let res1 = hashSet.has("A");
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_002
     * @tc.name  : testHas002
     * @tc.desc  : Determine whether the HashSet instance contains the specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas002", 0, function () {
      let hashSet = new HashSet();
      let res = hashSet.has(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_003
     * @tc.name  : testHas003
     * @tc.desc  : Determine whether the HashSet instance contains the specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas003", 0, function () {
      let hashSet = new HashSet();
      try {
        hashSet.has.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The has method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_ADD_001
     * @tc.name  : testAdd001
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(1);
      let res = hashSet.has(1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_002
     * @tc.name  : testAdd002
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd002", 0, function () {
      let hashSet = new HashSet();
      hashSet.add("b");
      hashSet.add("a");
      hashSet.add("g");
      let res = hashSet.has("a");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_003
     * @tc.name  : testAdd003
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd003", 0, function () {
      let hashSet = new HashSet();
      let c = [1, 2, 3];
      hashSet.add(c);
      let res = hashSet.has(c);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_004
     * @tc.name  : testAdd004
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd004", 0, function () {
      let hashSet = new HashSet();
      let c = { name: "lili", age: "13" };
      hashSet.add(c);
      let res = hashSet.has(c);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_005
     * @tc.name  : testAdd005
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd005", 0, function () {
      let hashSet = new HashSet();
      hashSet.add("");
      let res = hashSet.has("");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_006
     * @tc.name  : testAdd006
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd006", 0, function () {
      let hashSet = new HashSet();
      hashSet.add("$");
      let res = hashSet.has("$");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_007
     * @tc.name  : testAdd007
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd007", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(1.34);
      let res = hashSet.has(1.34);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_008
     * @tc.name  : testAdd008
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd008", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(-1);
      let res = hashSet.has(-1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_009
     * @tc.name  : testAdd009
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd009", 0, function () {
      let hashSet = new HashSet();
      let a = {};
      hashSet.add(a);
      let res = hashSet.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_ADD_010
     * @tc.name  : testAdd010
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd010", 0, function () {
      let hashSet = new HashSet();
      for (let i = 0; i < 100; i++) {
        hashSet.add(i);
        let res = hashSet.has(i);
        expect(res).assertEqual(true);
      }
      let res1 = hashSet.length;
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.number: TEST_ADD_011
     * @tc.name  : testAdd011
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd011", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(1);
      hashSet.add(1);
      let has = hashSet.has(1);
      let size = hashSet.length;
      expect(has).assertEqual(true);
      expect(size).assertEqual(1);
    });

    /**
     * @tc.number: TEST_ADD_012
     * @tc.name  : testAdd012
     * @tc.desc  : Add element to HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd012", 0, function () {
      let hashSet = new HashSet();
      try {
        hashSet.add.bind({}, "a")();
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
     * @tc.desc  : Delete the specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.remove(1);
      expect(res).assertEqual(true);
      let arr = [];
      hashSet.forEach((value, index) => {
        arr.push(value);
      });
      for (let i = 0; i < arr.length; i++) {
        let has = hashSet.has(arr[i]);
        expect(has).assertEqual(true);
      }
    });

    /**
     * @tc.number: TEST_REMOVE_002
     * @tc.name  : testRemove002
     * @tc.desc  : Delete the specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove002", 0, function () {
      let hashSet = new HashSet();
      let res = hashSet.remove(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_CLEAR_001
     * @tc.name  : testClear001
     * @tc.desc  : Clear all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.length;
      expect(res).assertEqual(5);
      hashSet.clear();
      let res1 = hashSet.length;
      expect(res1).assertEqual(0);
    });

    /**
     * @tc.number: TEST_CLEAR_002
     * @tc.name  : testClear002
     * @tc.desc  : Clear all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear002", 0, function () {
      let hashSet = new HashSet();
      let res = hashSet.clear();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_FOR_EACH_001
     * @tc.name  : testForEach001
     * @tc.desc  : Traverse the collection of all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let arr = [];
      hashSet.forEach((value, index) => {
        arr.push(value);
      });
      for (let i = 0; i < arr.length; i++) {
        let has = hashSet.has(arr[i]);
        expect(has).assertEqual(true);
      }
    });

    /**
     * @tc.number: TEST_FOR_EACH_002
     * @tc.name  : testForEach002
     * @tc.desc  : Traverse the collection of all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach002", 0, function () {
      let hashSet = new HashSet();
      let arr = [];
      hashSet.forEach((value, index) => {
        arr.push(value);
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number: TEST_FOR_EACH_003
     * @tc.name  : testForEach003
     * @tc.desc  : Traverse the collection of all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach003", 0, function () {
      let hashSet = new HashSet();
      for (let i = 0; i < 100; i++) {
        hashSet.add(i);
      }
      let arr = [];
      hashSet.forEach((value, index) => {
        arr.push(value);
      });
      for (let i = 0; i < 100; i++) {
        let a = arr[i];
        let res = hashSet.has(a);
        expect(res).assertEqual(true);
      }
    });

    /**
     * @tc.number: TEST_FOR_EACH_004
     * @tc.name  : testForEach004
     * @tc.desc  : Traverse the collection of all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach004", 0, function () {
      let hashSet = new HashSet();
      try {
        hashSet.forEach.bind({}, "a")();
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
     * @tc.desc  : Get a collection of all elements of a HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testValues001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add("A");
      hashSet.add("B");
      hashSet.add("C");
      hashSet.add("D");
      hashSet.add("E");
      let res = hashSet.values();
      for (let i = 0; i < hashSet.length; i++) {
        let has = hashSet.has(res.next().value);
        expect(has).assertEqual(true);
      }
    });

    /**
     * @tc.number: TEST_ENTRIES_001
     * @tc.name  : testEntries001
     * @tc.desc  : Iterate over all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEntries001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let res = hashSet.entries();
      for (let i = 0; i < hashSet.length; i++) {
        let has = hashSet.has(res.next().value[1]);
        expect(has).assertEqual(true);
      }
    });

    /**
     * @tc.number: TEST_ENTRIES_002
     * @tc.name  : testEntries002
     * @tc.desc  : Iterate over all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEntries002", 0, function () {
      let hashSet = new HashSet();
      let res = hashSet.entries();
      expect(res.next().value).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_ITERATOR_001
     * @tc.name  : testIterator001
     * @tc.desc  : Iterate over all elements of the HashSet instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIterator001", 0, function () {
      let hashSet = new HashSet();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let res = hashSet[Symbol.iterator]();
      let temp = undefined;
      let arr = [];
      do {
        temp = res.next().value;
        arr.push(temp);
      } while (temp != undefined);
      arr.sort(function (a, b) {
        return a - b;
      });
      let arr1 = [1, 2, 3, 4, 5];
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });
  });
}
