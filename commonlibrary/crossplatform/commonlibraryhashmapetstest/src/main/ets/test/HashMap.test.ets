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
import HashMap from "@ohos.util.HashMap";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
export default function HashMapTest() {
  describe("HashMapTest", function () {
    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Create an HashMap instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      let hashMap = new HashMap();
      expect(hashMap != undefined).assertEqual(true);
    });

    /**
     * @tc.number: TEST_LENGTH_001
     * @tc.name  : testLength001
     * @tc.desc  : Get the number of key value pairs in the HashMap instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 0
     */
    it("testLength001", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number: TEST_IS_EMPTY_001
     * @tc.name  : testIsEmpty001
     * @tc.desc  : Determine whether the HashMap instance is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty001", 0, function () {
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

    /**
     * @tc.number: TEST_IS_EMPTY_002
     * @tc.name  : testIsEmpty002
     * @tc.desc  : Determine whether the HashMap instance is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty002", 0, function () {
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

    /**
     * @tc.number: TEST_IS_EMPTY_003
     * @tc.name  : testIsEmpty003
     * @tc.desc  : Determine whether the HashMap instance is empty.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIsEmpty003", 0, function () {
      let hashMap = new HashMap();
      try {
        hashMap.isEmpty.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_HAS_KEY_001
     * @tc.name  : testHasKey001
     * @tc.desc  : Determine whether the HashMap contains the specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasKey001", 0, function () {
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

    /**
     * @tc.number: TEST_HAS_KEY_002
     * @tc.name  : testHasKey002
     * @tc.desc  : Determine whether the HashMap contains the specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasKey002", 0, function () {
      let hashMap = new HashMap();
      let res = hashMap.hasKey(8);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_KEY_003
     * @tc.name  : testHasKey003
     * @tc.desc  : Determine whether the HashMap contains the specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testKeys003", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.keys();
      for (let i = 0; i < hashMap.length; i++) {
        let result = hashMap.hasKey(res.next().value);
        expect(result).assertEqual(true);
      }
    });

    /**
     * @tc.number: TEST_HAS_KEY_004
     * @tc.name  : testHasKey004
     * @tc.desc  : Determine whether the HashMap contains the specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasKey004", 0, function () {
      let hashMap = new HashMap();
      try {
        hashMap.hasKey.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The hasKey method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_HAS_VALUE_001
     * @tc.name  : testHasValue001
     * @tc.desc  : Determine whether the HashMap contains the specified value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasValue001", 0, function () {
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

    /**
     * @tc.number: TEST_HAS_VALUE_002
     * @tc.name  : testHasValue002
     * @tc.desc  : Determine whether the HashMap contains the specified value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasValue002", 0, function () {
      let hashMap = new HashMap();
      let res = hashMap.hasValue(8);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_VALUE_003
     * @tc.name  : testHasValue003
     * @tc.desc  : Determine whether the HashMap contains the specified value.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHasValue003", 0, function () {
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

    /**
     * @tc.number: TEST_GET_001
     * @tc.name  : testGet001
     * @tc.desc  : Get the corresponding value through the key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet001", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.get(3);
      expect(res).assertEqual("C");
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
      let hashMap = new HashMap();
      let res = hashMap.get(3);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_GET_003
     * @tc.name  : testGet003
     * @tc.desc  : Get the corresponding value through the key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGet003", 0, function () {
      let hashMap = new HashMap();
      try {
        hashMap.get.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The get method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_SET_ALL_001
     * @tc.name  : testSetAll001
     * @tc.desc  : Copy key value pairs from one HashMap to another.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetAll001", 0, function () {
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

    /**
     * @tc.number: TEST_SET_ALL_002
     * @tc.name  : testSetAll002
     * @tc.desc  : Copy key value pairs from one HashMap to another.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSetAll002", 0, function () {
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
        expect(JSON.stringify(arr[i])).assertEqual(JSON.stringify([i + 1, hashMap.get(i + 1)]));
      }
    });

    /**
     * @tc.number: TEST_SET_001
     * @tc.name  : testSet001
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet001", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, "A");
      let res = hashMap.get(1);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_SET_002
     * @tc.name  : testSet002
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet002", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, 2);
      let res = hashMap.get(1);
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number: TEST_SET_003
     * @tc.name  : testSet003
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet003", 0, function () {
      let hashMap = new HashMap();
      let c = [1, 2, 3];
      hashMap.set(1, c);
      let res = hashMap.get(1);
      expect(res).assertEqual(c);
    });

    /**
     * @tc.number: TEST_SET_004
     * @tc.name  : testSet004
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet004", 0, function () {
      let hashMap = new HashMap();
      let c = { name: "lili", age: "13" };
      hashMap.set(1, c);
      let res = hashMap.get(1);
      expect(res).assertEqual(c);
    });

    /**
     * @tc.number: TEST_SET_005
     * @tc.name  : testSet005
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet005", 0, function () {
      let hashMap = new HashMap();
      hashMap.set("a", "A");
      let res = hashMap.get("a");
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_SET_006
     * @tc.name  : testSet006
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet006", 0, function () {
      let hashMap = new HashMap();
      hashMap.set("", "A");
      let res = hashMap.get("");
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_SET_007
     * @tc.name  : testSet007
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet007", 0, function () {
      let hashMap = new HashMap();
      hashMap.set("$", "A");
      let res = hashMap.get("$");
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_SET_008
     * @tc.name  : testSet008
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet008", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(3.14, "A");
      let res = hashMap.get(3.14);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_SET_009
     * @tc.name  : testSet009
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet009", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(0.3, "A");
      let res = hashMap.get(0.3);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_SET_0010
     * @tc.name  : testSet010
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet010", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(-1, "A");
      let res = hashMap.get(-1);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_SET_011
     * @tc.name  : testSet011
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet011", 0, function () {
      let hashMap = new HashMap();
      let a = {};
      hashMap.set(a, "A");
      let res = hashMap.get(a);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.number: TEST_SET_012
     * @tc.name  : testSet012
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet012", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, null);
      let res = hashMap.get(1);
      expect(res).assertEqual(null);
    });

    /**
     * @tc.number: TEST_SET_013
     * @tc.name  : testSet013
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet013", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, "$");
      let res = hashMap.get(1);
      expect(res).assertEqual("$");
    });

    /**
     * @tc.number: TEST_SET_014
     * @tc.name  : testSet014
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet014", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, 3.14);
      let res = hashMap.get(1);
      expect(res).assertEqual(3.14);
    });

    /**
     * @tc.number: TEST_SET_015
     * @tc.name  : testSet015
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet015", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, -1);
      let res = hashMap.get(1);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number: TEST_SET_016
     * @tc.name  : testSet016
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet016", 0, function () {
      let hashMap = new HashMap();
      let a = {};
      hashMap.set(1, a);
      let res = hashMap.get(1);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.number: TEST_SET_017
     * @tc.name  : testSet017
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet017", 0, function () {
      let hashMap = new HashMap();
      for (let i = 0; i < 100; i++) {
        hashMap.set(1, i);
      }
      let res = hashMap.get(1);
      let res1 = hashMap.length;
      expect(res).assertEqual(99);
      expect(res1).assertEqual(1);
    });

    /**
     * @tc.number: TEST_SET_018
     * @tc.name  : testSet018
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet018", 0, function () {
      let hashMap = new HashMap();
      for (let i = 0; i < 100; i++) {
        hashMap.set(i, 1);
        let res = hashMap.get(i);
        expect(res).assertEqual(1);
      }
      let res1 = hashMap.length;
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.number: TEST_SET_019
     * @tc.name  : testSet019
     * @tc.desc  : Add a pair of key value pairs to the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testSet019", 0, function () {
      let hashMap = new HashMap();
      try {
        hashMap.set.bind({}, 1, "A")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The set method cannot be bound`);
      }
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

    /**
     * @tc.number: TEST_REMOVE_002
     * @tc.name  : testRemove002
     * @tc.desc  : Delete key value pairs according to key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove002", 0, function () {
      let hashMap = new HashMap();
      let res = hashMap.remove(3);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_REMOVE_003
     * @tc.name  : testRemove003
     * @tc.desc  : Delete key value pairs according to key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testRemove003", 0, function () {
      let hashMap = new HashMap();
      try {
        hashMap.remove.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The remove method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_CLEAR_001
     * @tc.name  : testClear001
     * @tc.desc  : Clear all key value pairs in HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear001", 0, function () {
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

    /**
     * @tc.number: TEST_CLEAR_002
     * @tc.name  : testClear002
     * @tc.desc  : Clear all key value pairs in HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testClear002", 0, function () {
      let hashMap = new HashMap();
      hashMap.clear();
      let res = hashMap.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number: TEST_KEYS_001
     * @tc.name  : testKeys001
     * @tc.desc  : Get a collection of all the keys in the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testKeys001", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.keys();
      for (let i = 0; i < hashMap.length; i++) {
        let result = hashMap.hasKey(res.next().value);
        expect(result).assertEqual(true);
      }
    });

    /**
     * @tc.number: TEST_VALUES_001
     * @tc.name  : testValues001
     * @tc.desc  : Get a collection of all the values in the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testValues001", 0, function () {
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

    /**
     * @tc.number: TEST_REPLACE_001
     * @tc.name  : testReplace001
     * @tc.desc  : Modify the corresponding value according to the specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testReplace001", 0, function () {
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

    /**
     * @tc.number: TEST_REPLACE_002
     * @tc.name  : testReplace002
     * @tc.desc  : Modify the corresponding value according to the specified key.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testReplace002", 0, function () {
      let hashMap = new HashMap();
      let res = hashMap.replace(2, "G");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_FOR_EACH_001
     * @tc.name  : testForEach001
     * @tc.desc  : Traverse all key value pairs in the HashMap instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach001", 0, function () {
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

    /**
     * @tc.number: TEST_FOR_EACH_002
     * @tc.name  : testForEach002
     * @tc.desc  : Traverse all key value pairs in the HashMap instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach002", 0, function () {
      let hashMap = new HashMap();
      let arr = [];
      hashMap.forEach((item, index) => {
        arr.push(item);
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number: TEST_FOR_EACH_003
     * @tc.name  : testForEach003
     * @tc.desc  : Traverse all key value pairs in the HashMap instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach003", 0, function () {
      let hashMap = new HashMap();
      try {
        hashMap.forEach.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The forEach method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_ENTRIES_001
     * @tc.name  : testEntries001
     * @tc.desc  : Get all key value pairs collection in HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEntries001", 0, function () {
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

    /**
     * @tc.number: TEST_ENTRIES_002
     * @tc.name  : testEntries002
     * @tc.desc  : Get all key value pairs collection in HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testEntries002", 0, function () {
      let hashMap = new HashMap();
      let res = hashMap.entries();
      expect(undefined).assertEqual(res.next().value);
    });

    /**
     * @tc.number: TEST_ITERATOR_001
     * @tc.name  : testIterator001
     * @tc.desc  : Iterate over all key value pairs in the HashMap.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIterator001", 0, function () {
      let hashMap = new HashMap();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let arr = [];
      let iters = hashMap[Symbol.iterator]();
      let flag = true;
      for (let i = 0, len = hashMap.length; i < len; i++) {
        let entry = iters.next().value;
        let res = hashMap.get(entry[0]);
        if (res != entry[1]) {
          flag = false;
          break;
        }
      }
      expect(flag).assertEqual(true);
    });
  });
}
