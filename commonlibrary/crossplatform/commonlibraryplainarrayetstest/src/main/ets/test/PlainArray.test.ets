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
import PlainArray from "@ohos.util.PlainArray";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
export default function PlainArrayTest() {
  describe("PlainArrayTest", function () {
    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Create an PlainArray instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      let plainArray = new PlainArray();
      expect(plainArray != null).assertTrue();
    });

    /**
     * @tc.number: TEST_LENGTH_001
     * @tc.name  : testLength001
     * @tc.desc  : Get the number of key value pairs in the PlainArray instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 0
     */
    it("testLength001", 0, function () {
      let plainArray = new PlainArray();
      let res = plainArray.length;
      expect(res).assertEqual(0);
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      res = plainArray.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number: TEST_ADD_001
     * @tc.name  : testAdd001
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      let res = plainArray.get(1);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_ADD_002
     * @tc.name  : testAdd002
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd002", 0, function () {
      let plainArray = new PlainArray();
      let a = [1, 2, 3, 4];
      plainArray.add(2, a);
      let res = plainArray.get(2);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.number: TEST_ADD_003
     * @tc.name  : testAdd003
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd003", 0, function () {
      let plainArray = new PlainArray();
      let c = { name: "lili", age: "13" };
      plainArray.add(1, c);
      let res = plainArray.get(1);
      expect(res).assertEqual(c);
    });

    /**
     * @tc.number: TEST_ADD_004
     * @tc.name  : testAdd004
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd004", 0, function () {
      let plainArray = new PlainArray();
      let c = false;
      plainArray.add(1, c);
      let res = plainArray.get(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_ADD_005
     * @tc.name  : testAdd005
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd005", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, 3);
      let res = plainArray.get(1);
      expect(res).assertEqual(3);
    });

    /**
     * @tc.number: TEST_ADD_006
     * @tc.name  : testAdd006
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd006", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, 3.1);
      let res = plainArray.get(1);
      expect(res).assertEqual(3.1);
    });

    /**
     * @tc.number: TEST_ADD_007
     * @tc.name  : testAdd007
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd007", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, null);
      let res = plainArray.get(1);
      expect(res).assertEqual(null);
    });

    /**
     * @tc.number: TEST_ADD_008
     * @tc.name  : testAdd008
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd008", 0, function () {
      let plainArray = new PlainArray();
      for (let i = 0; i < 100; i++) {
        plainArray.add(i, i + 1);
      }
      let res = plainArray.get(1);
      let res1 = plainArray.length;
      expect(res).assertEqual(2);
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.number: TEST_ADD_009
     * @tc.name  : testAdd009
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd009", 0, function () {
      let plainArray = new PlainArray();
      for (let i = 0; i < 1000; i++) {
        plainArray.add(i, i + 1);
      }
      let res = plainArray.get(99);
      let res1 = plainArray.length;
      expect(res).assertEqual(100);
      expect(res1).assertEqual(1000);
    });

    /**
     * @tc.number: TEST_ADD_010
     * @tc.name  : testAdd010
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd010", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(3, "a");
      plainArray.add(1, "b");
      plainArray.add(2, "c");
      plainArray.add(5, "d");
      plainArray.add(4, "e");
      let res = plainArray.get(2);
      expect(res).assertEqual("c");
    });

    /**
     * @tc.number: TEST_ADD_011
     * @tc.name  : testAdd011
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd011", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "ABCd");
      plainArray.add(2, "~!@#$^&*()_+-*/=.?<>:;|{}[]");
      plainArray.add(3, null);
      plainArray.add(4, undefined);
      plainArray.add(5, []);
      plainArray.add(6, {});
      plainArray.add(7, true);
      plainArray.add(8, 1234);
      plainArray.add(9, 1.234);
      plainArray.add(10, -1234);
      let res = plainArray.get(2);
      expect(res).assertEqual("~!@#$^&*()_+-*/=.?<>:;|{}[]");
    });

    /**
     * @tc.number: TEST_ADD_012
     * @tc.name  : testAdd012
     * @tc.desc  : Add a pair of key value pairs to the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testAdd012", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, 1);
      plainArray.add(2, "b");
      plainArray.add(3, true);
      plainArray.add(4, [1, 2, 3, 4]);
      plainArray.add(5, { name: "lili", age: "13" });
      plainArray.add(6, undefined);
      plainArray.add(7, null);
      let res = plainArray.get(2);
      expect(res).assertEqual("b");
    });

    /**
     * @tc.number: TEST_CLEAR_001
     * @tc.name  : testClear001
     * @tc.desc  : Clear all key value pairs in PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.length;
      expect(res).assertEqual(5);
      plainArray.clear();
      let res1 = plainArray.length;
      expect(res1).assertEqual(0);
      plainArray.clear();
      let res2 = plainArray.length;
      expect(res2).assertEqual(0);
    });

    /**
     * @tc.number: TEST_CLONE_001
     * @tc.name  : testClone001
     * @tc.desc  : Clone an PlainArray instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClone001", 0, function () {
      let plainArray = new PlainArray();
      let clonePlainarray = plainArray.clone();
      let cloneLength = clonePlainarray.length;
      expect(cloneLength).assertEqual(0);
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.clone();
      let arr = [];
      res.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = ["A", "B", "C", "D", "E"];
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.number: TEST_HAS_001
     * @tc.name  : testHas001
     * @tc.desc  : Check whether the PlainArray contains a specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.has(6);
      expect(res).assertEqual(false);
      let res1 = plainArray.has(1);
      expect(res1).assertEqual(true);
    });

    /**
     * @tc.number: TEST_GET_001
     * @tc.name  : testGet001
     * @tc.desc  : Get the corresponding value through the key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.get(4);
      expect(res).assertEqual("D");
      res = plainArray.get(10);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_GET_002
     * @tc.name  : testGet002
     * @tc.desc  : Get the corresponding value through the key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet002", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.get(8);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_KEY_001
     * @tc.name  : testGetIndexOfKey001
     * @tc.desc  : Find the index of the key value pair according to the corresponding key.
     * If no key is specified, return -1.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOfKey001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfKey(2);
      expect(res).assertEqual(1);
      res = plainArray.getIndexOfKey(12);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_KEY_002
     * @tc.name  : testGetIndexOfKey002
     * @tc.desc  : Find the index of the key value pair according to the corresponding key.
     * If no key is specified, return -1.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOfKey002", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfKey(9);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_VALUE_001
     * @tc.name  : testGetIndexOfValue001
     * @tc.desc  : Find the index of the key value pair according to the corresponding key.
     * If no key is specified, return -1.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOfValue001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfValue("A");
      expect(res).assertEqual(0);
      res = plainArray.getIndexOfValue("Z");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_GET_INDEX_OF_VALUE_002
     * @tc.name  : testGetIndexOfValue002
     * @tc.desc  : Find the index of the key value pair according to the corresponding key.
     * If no key is specified, return -1.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetIndexOfValue002", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfValue("Asad");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_001
     * @tc.name  : testIsEmpty001
     * @tc.desc  : Determine whether the PlainArray instance is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty001", 0, function () {
      let plainArray = new PlainArray();
      let result = plainArray.length;
      expect(result).assertEqual(0);
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_GET_KEY_AT_001
     * @tc.name  : testGetKeyAt001
     * @tc.desc  : Find the key of the key value pair according to the corresponding index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetKeyAt001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getKeyAt(2);
      expect(res).assertEqual(3);
    });

    /**
     * @tc.number: TEST_GET_KEY_AT_002
     * @tc.name  : testGetKeyAt002
     * @tc.desc  : Find the key of the key value pair according to the corresponding index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetKeyAt002", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getKeyAt(50);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_REMOVE_001
     * @tc.name  : testRemove001
     * @tc.desc  : Delete key value pairs according to key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.remove(2);
      expect(res).assertEqual("B");
      let value = plainArray.get(2);
      expect(value).assertEqual(undefined);
      res = plainArray.remove(12);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_REMOVE_002
     * @tc.name  : testRemove002
     * @tc.desc  : Delete key value pairs according to key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove002", 0, function () {
      let plainArray = new PlainArray();
      let res = plainArray.remove(2);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_REMOVE_AT_001
     * @tc.name  : testReMoveAt001
     * @tc.desc  : Delete key value pairs according to index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveAt001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.removeAt(2);
      expect(res).assertEqual("C");
      let value = plainArray.get(3);
      expect(value).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_REMOVE_AT_002
     * @tc.name  : testReMoveAt002
     * @tc.desc  : Delete key value pairs according to index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveAt002", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.removeAt(12);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_REMOVE_RANGE_FROM_001
     * @tc.name  : testRemoveRangeFrom001
     * @tc.desc  : Deletes the specified number of elements from the specified starting index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemoveRangeFrom001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      plainArray.removeRangeFrom(0, 5);
      let res = plainArray.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number: TEST_SET_VALUE_AT_001
     * @tc.name  : testSetValueAt001
     * @tc.desc  : Modify the value of the key value pair according to the corresponding index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetValueAt001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      plainArray.setValueAt(2, "V");
      let keys = [1, 2, 3, 4, 5];
      let values = ["A", "B", "V", "D", "E"];
      for (let i = 0; i < keys.length; i++) {
        expect(values[i]).assertEqual(plainArray.get(keys[i]));
      }
      try {
        plainArray.setValueAt(-1, "X");
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: -1`);
      }
    });

    /**
     * @tc.number: TEST_SET_VALUE_AT_002
     * @tc.name  : testSetValueAt002
     * @tc.desc  : Modify the value of the key value pair according to the corresponding index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetValueAt002", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      try {
        plainArray.setValueAt(8, "V");
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 8`);
      }
    });

    /**
     * @tc.number: TEST_TO_STRING_001
     * @tc.name  : testToString001
     * @tc.desc  : Use "," to splice the elements in the LightWeightMap instance into a string.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testToString001", 0, function () {
      let plainArray = new PlainArray();
      let res1 = plainArray.toString();
      expect(res1).assertEqual("");
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      let res = plainArray.toString();
      expect(res).assertEqual("1:A,2:B,3:C");
    });

    /**
     * @tc.number: TEST_GET_VALUE_001
     * @tc.name  : testGetValueAt001
     * @tc.desc  : Get the value of the key value pair according to the corresponding index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetValueAt001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getValueAt(2);
      expect(res).assertEqual("C");
    });

    /**
     * @tc.number: TEST_GET_VALUE_002
     * @tc.name  : testGetValueAt002
     * @tc.desc  : Get the value of the key value pair according to the corresponding index.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetValueAt002", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      try {
        plainArray.getValueAt(50);
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 50`);
      }
    });

    /**
     * @tc.number: TEST_FOR_EACH_001
     * @tc.name  : testForEach001
     * @tc.desc  : Traverse all key value pairs in the PlainArray instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let arr = [];
      plainArray.forEach((value, index) => {
        arr.push(value);
      });
      let arr1 = ["A", "B", "C", "D", "E"];
      for (let i = 0; i < arr1.length; i++) {
        expect(arr[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.number: TEST_ITERATOR_001
     * @tc.name  : testIterator001
     * @tc.desc  : Iterate over all key value pairs in the PlainArray.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIterator001", 0, function () {
      let plainArray = new PlainArray();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let iters = plainArray[Symbol.iterator]();
      let flag = true;
      for (let i = 0, len = plainArray.length; i < len; i++) {
        let entry = iters.next().value;
        let res = plainArray.get(entry[0]);
        if (res != entry[1]) {
          flag = false;
          break;
        }
      }
      expect(flag).assertEqual(true);
    });
  });
}
