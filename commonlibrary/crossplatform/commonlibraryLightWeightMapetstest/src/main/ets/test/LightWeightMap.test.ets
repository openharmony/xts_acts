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

import LightWeightMap from "@ohos.util.LightWeightMap";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function LightWeightMapTest() {
describe("LightWeightMapTest", function () {

   /**
   * @tc.number: TEST_CONSTRUCTOR_001
   * @tc.name:   testConstructor001
   * @tc.desc:   Create an LightWeightMap instance. For example: let lightWeightMap = new LightWeightMap().
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testConstructor001", 0, function () {
    try {
      let lightWeightMap = new LightWeightMap();
      expect(lightWeightMap != undefined).assertEqual(true);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The LightWeightMap's constructor cannot be directly invoked");
    }
  });

   /**
   * @tc.number: TEST_LENGTH_001
   * @tc.name:   testLength001
   * @tc.desc:   Get the number of key value pairs in the lightWeightMap instance. For example: lightWeightMap.length.
   * @tc.size:   MediumTest
   * @tc.type:   Field
   * @tc.level:  level 1
   */
  it("testLength001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.length;
    expect(res).assertEqual(5);
  });

  /**
   * @tc.number: TEST_HASALL_001
   * @tc.name:   testHasAll001
   * @tc.desc:   Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testHasAll001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let lightWeightMap1 = new LightWeightMap();
    lightWeightMap1.set("a", "A");
    lightWeightMap1.set("d", "D");
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.number: TEST_HASALL_002
   * @tc.name: testHasAll002
   * @tc.desc: Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testHasAll002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let lightWeightMap1 = new LightWeightMap();
    lightWeightMap1.set("a1", "A1");
    lightWeightMap1.set("d1", "D1");
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(false);
  });
                  
  /**
   * @tc.number: TEST_HASALL_003
   * @tc.name: testHasAll003
   * @tc.desc: Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testHasAll003", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let lightWeightMap1 = new LightWeightMap();
    lightWeightMap1.set("a", "A1");
    lightWeightMap1.set("d", "D1");
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(false);
  });

  /**
  * @tc.number: TEST_HASALL_004
   * @tc.name: testHasAll004
   * @tc.desc: Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testHasAll004", 0, function () {
    let lightWeightMap = new LightWeightMap();
    let lightWeightMap1 = new LightWeightMap();
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(true);
  });

  /**
  * @tc.number: TEST_HASALL_005
   * @tc.name: testHasAll005
   * @tc.desc: Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testHasAll005", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let lightWeightMap1 = new LightWeightMap();
    lightWeightMap1.set("a", "A");
    lightWeightMap1.set("d", "D1");
    let res = lightWeightMap.hasAll(lightWeightMap1);
    expect(res).assertEqual(false);
  });

  /**
  * @tc.number: TEST_HASALL_006
   * @tc.name: testHasAll006
   * @tc.desc: Judge whether a lightweightmap contains all key value pairs in another lightweightmap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testHasAll006", 0, function () {
    let lightWeightMap = new LightWeightMap();
    try {
      //@ts-ignore
      lightWeightMap.hasAll([1, 2, 3]);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "map" must be LightWeightMap. Received value is: 1,2,3`);
    }
  });

  /**
  * @tc.number: TEST_HASKEY_001
   * @tc.name: testHasKey001
   * @tc.desc: Determine whether the LightWeightMap contains the specified key. For example: lightWeightMap.hasKey("a").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testHasKey001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let res = lightWeightMap.hasKey("a");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(false);
  });

  /**
  * @tc.number: TEST_HASVALUE_001
   * @tc.name: testHasValue001
   * @tc.desc: Determine whether the LightWeightMap contains the specified value. 
   * For example: lightWeightMap.hasValue("A").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testHasValue001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let res = lightWeightMap.hasValue("A");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasValue(1);
    expect(res1).assertEqual(false);
  });

   /**
   * @tc.number: TEST_INCREASECAPACITYTO_001
   * @tc.name: testIncreaseCapacityTo001
   * @tc.desc: Expand the LightWeightMap instance capacity to the specified value. 
   * For example: lightWeightMap.increaseCapacityTo(3).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testIncreaseCapacityTo001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    lightWeightMap.increaseCapacityTo(3);
    let length = lightWeightMap.length;
    expect(length).assertEqual(5);
  });

   /**
   * @tc.number: TEST_INCREASECAPACITYTO_002
   * @tc.name: testIncreaseCapacityTo002
   * @tc.desc: Expand the LightWeightMap instance capacity to the specified value. 
   * For example: lightWeightMap.increaseCapacityTo(10).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testIncreaseCapacityTo002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    let res = lightWeightMap.increaseCapacityTo(10);
    expect(res).assertEqual(undefined);
  });
                  
  /**
  * @tc.number: TEST_INCREASECAPACITYTO_003
   * @tc.name: testIncreaseCapacityTo003
   * @tc.desc: Expand the LightWeightMap instance capacity to the specified value. 
   * For example: lightWeightMap.increaseCapacityTo("qwe").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testIncreaseCapacityTo003", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    lightWeightMap.set("b", "B");
    lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D");
    lightWeightMap.set("e", "E");
    try {
      //@ts-ignore
      lightWeightMap.increaseCapacityTo("qwe");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "minimumCapacity" must be number. Received value is: qwe`);
    }
  });

  /**
  * @tc.number: TEST_ENTRIES_001
   * @tc.name: testEntries001
   * @tc.desc: Get all key value pairs collection in lightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testEntries001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.entries();
    expect(JSON.stringify(res.next().value)).assertEqual('[1,"A"]');
    expect(JSON.stringify(res.next().value)).assertEqual('[2,"B"]');
    expect(JSON.stringify(res.next().value)).assertEqual('[3,"C"]');
    expect(JSON.stringify(res.next().value)).assertEqual('[4,"D"]');
    expect(JSON.stringify(res.next().value)).assertEqual('[5,"E"]');
  });

  /**
  * @tc.number: TEST_GET_001
   * @tc.name: testGet001
   * @tc.desc: Get the corresponding value through the key. For example: lightWeightMap.get(4).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGet001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.get(4);
    expect(res).assertEqual("D");
  });

   /**
   * @tc.number: TEST_GET_002
   * @tc.name: testGet002
   * @tc.desc: Get the corresponding value through the key. For example: lightWeightMap.get(10).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGet002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.get(10);
    expect(res).assertEqual(undefined);
  });

  /**
  * @tc.number: TEST_GETINDEXOFKEY_001
   * @tc.name: testGetIndexOfKey001
   * @tc.desc: Find the index of the key value pair according to the corresponding key. 
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   * If no key is specified, return -1.
   */
  it("testGetIndexOfKey001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.getIndexOfKey(2);
    expect(res).assertEqual(1);
  });

    /**
  * @tc.number: TEST_GETINDEXOFKEY_002
   * @tc.name: testGetIndexOfKey002
   * @tc.desc: Find the index of the key value pair according to the corresponding key. 
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   * If no key is specified, return -1.
   */
  it("testGetIndexOfKey002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.getIndexOfKey(10);
    expect(res).assertEqual(-1);
  });

  

  /**
  * @tc.number: TEST_GETINDEXOFVALUE_001
   * @tc.name: testGetIndexOfValue001
   * @tc.desc: Find the index of the key value pair according to the corresponding value. 
   * If no key is specified, return -1.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGetIndexOfValue001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    lightWeightMap.setValueAt(4, "F");
    let res = lightWeightMap.getIndexOfValue("F");
    expect(res).assertEqual(4);
  });

  /**
  * @tc.number: TEST_GETINDEXOFVALUE_002
   * @tc.name: testGetIndexOfValue002
   * @tc.desc: Find the index of the key value pair according to the corresponding value. 
   * If no key is specified, return -1.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGetIndexOfValue002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    lightWeightMap.setValueAt(4, "F");
    let res = lightWeightMap.getIndexOfValue("H");
    expect(res).assertEqual(-1);
  });

   /**
   * @tc.number: TEST_ISEMPTY_001
   * @tc.name: testIsEmpty001
   * @tc.desc: Determine whether the LightWeightMap instance is empty. For example: lightWeightMap.isEmpty().
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testIsEmpty001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    let res1 = lightWeightMap.isEmpty();
    expect(res1).assertEqual(true);
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res2 = lightWeightMap.isEmpty();
    expect(res2).assertEqual(false);
  });

  /**
  * @tc.number: TEST_GETKEYAT_001
   * @tc.name: testGetKeyAt001
   * @tc.desc: Find the key of the key value pair according to the corresponding index. 
   * For example: lightWeightMap.getKeyAt(1).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGetKeyAt001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.getKeyAt(1);
    expect(res).assertEqual(2);
  });

  /**
   * @tc.number: TEST_GETKEYAT_002
   * @tc.name: testGetKeyAt002
   * @tc.desc: Find the key of the key value pair according to the corresponding index. 
   * For example: lightWeightMap.getKeyAt("a").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGetKeyAt002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    try {
      //@ts-ignore
      let res = lightWeightMap.getKeyAt("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
  * @tc.number: TEST_GETKEYAT_003
   * @tc.name: testGetKeyAt003
   * @tc.desc: Find the key of the key value pair according to the corresponding index. 
   * For example: lightWeightMap.getKeyAt(6).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGetKeyAt003", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    try {
      let res = lightWeightMap.getKeyAt(6);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
    }
  });

  /**
  * @tc.number: TEST_KEYS_001
   * @tc.name: testKeys001
   * @tc.desc: Get a collection of all the keys in the LightWeightMap. For example: lightWeightMap.keys().
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testKeys001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.keys();
    expect(res.next().value).assertEqual(1);
    expect(res.next().value).assertEqual(2);
    expect(res.next().value).assertEqual(3);
    expect(res.next().value).assertEqual(4);
    expect(res.next().value).assertEqual(5);
  });

   /**
   * @tc.number: TEST_SETALL_001
   * @tc.name: testSetAll001
   * @tc.desc: Copy key value pairs from one LightWeightMap to another.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSetAll001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let lightWeightMap1 = new LightWeightMap();
    lightWeightMap1.set(6, "A");
    lightWeightMap1.set(7, "B");
    lightWeightMap.setAll(lightWeightMap1);
    for (let i = 1; i < 8; i++) {
      expect(lightWeightMap.hasKey(i)).assertEqual(true);
    }
  });

  /**
  * @tc.number: TEST_SETALL_002
   * @tc.name: testSetAll002
   * @tc.desc: Copy key value pairs from one LightWeightMap to another.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSetAll002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    try {
      //@ts-ignore
      lightWeightMap.setAll([1, 2, 3]);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "map" must be LightWeightMap. Received value is: 1,2,3`);
    }
  });

  /**
  * @tc.number: TEST_SET_001
   * @tc.name: testSet001
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(1, "A").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    let res = lightWeightMap.hasValue("A");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(true);
  });
            
  /**
  * @tc.number: TEST_SET_002
   * @tc.name: testSet002
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set("a", "A").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A");
    let res = lightWeightMap.hasValue("A");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey("a");
    expect(res1).assertEqual(true);
  });
            
  /**
  * @tc.number: TEST_SET_003
   * @tc.name: testSet003
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set("a", "A").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet003", 0, function () {
    let lightWeightMap = new LightWeightMap();
    let a = [1, 2, 3, 4];
    lightWeightMap.set(1, a);
    let res = lightWeightMap.hasValue(a);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(true);
  });
            
  /**
  * @tc.number: TEST_SET_004
   * @tc.name: testSet004
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet004", 0, function () {
    let lightWeightMap = new LightWeightMap();
    let c = {name: "lili", age: "13"};
    lightWeightMap.set(1, c);
    let res = lightWeightMap.hasValue(c);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(true);
  });

  /**
  * @tc.number: TEST_SET_005
   * @tc.name: testSet005
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(1, null).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet005", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, null);
    let res = lightWeightMap.hasValue(null);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1);
    expect(res1).assertEqual(true);
  });
                
  /**
  * @tc.number: TEST_SET_006
   * @tc.name: testSet006
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(null, null).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet006", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(null, null);
    let res = lightWeightMap.hasValue(null);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(null);
    expect(res1).assertEqual(true);
  });
                
  /**
  * @tc.number: TEST_SET_007
   * @tc.name: testSet007
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(true, false).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet007", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(true, false);
    let res = lightWeightMap.hasValue(false);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(true);
    expect(res1).assertEqual(true);
  });
                
  /**
  * @tc.number: TEST_SET_008
   * @tc.name: testSet008
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap. For example: lightWeightMap.set(1.23, 321).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet008", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1.23, 321);
    let res = lightWeightMap.hasValue(321);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(1.23);
    expect(res1).assertEqual(true);
  });

  /**
  * @tc.number: TEST_SET_009
   * @tc.name: testSet009
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet009", 0, function () {
    let lightWeightMap = new LightWeightMap();
    for (let i = 0; i < 100; i++) {
      lightWeightMap.set(i, "A");
    }
    let res = lightWeightMap.get(99);
    expect(res).assertEqual("A");
    let res1 = lightWeightMap.length;
    expect(res1).assertEqual(100);
  });
                  
  /**
  * @tc.number: TEST_SET_010
   * @tc.name: testSet010
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet010", 0, function () {
    let lightWeightMap = new LightWeightMap();
    for (let i = 0; i < 100; i++) {
      lightWeightMap.set(1, i);
    }
    let res = lightWeightMap.get(1);
    expect(res).assertEqual(99);
    let res1 = lightWeightMap.length;
    expect(res1).assertEqual(1);
  });
                  
  /**
  * @tc.number: TEST_SET_011
   * @tc.name: testSet011
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet011", 0, function () {
    let lightWeightMap = new LightWeightMap();
    for (let i = 0; i < 10000; i++) {
      lightWeightMap.set(i, i);
    }
    let res1 = lightWeightMap.length;
    expect(res1).assertEqual(10000);
    for (let index = 0; index < 10000; index++) {
      let resKey = lightWeightMap.hasKey(index);  
      expect(resKey).assertEqual(true);
      let resValue = lightWeightMap.hasValue(index);
      expect(resValue).assertEqual(true);
    }
  });
                  
  /**
  * @tc.number: TEST_SET_012
   * @tc.name: testSet012
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet012", 0, function () {
    let lightWeightMap = new LightWeightMap();
    for (let i = 0; i < 5000; i++) {
      lightWeightMap.set(i, i);
    }
    for (let i = -1; i > -5001; i--) {
      lightWeightMap.set(i, i);
    }
    let res1 = lightWeightMap.length;
    expect(res1).assertEqual(10000);
    for (let index = 0; index < 5000; index++) {
      let resKey = lightWeightMap.hasKey(index);
      expect(resKey).assertEqual(true);
      let resValue = lightWeightMap.hasValue(index);
      expect(resValue).assertEqual(true);
    }
    for (let i = -1; i > -5001; i--) {
      let resKey = lightWeightMap.hasKey(i);
      expect(resKey).assertEqual(true);
      let resValue = lightWeightMap.hasValue(i);
      expect(resValue).assertEqual(true);
    }
  });
                  
  /**
  * @tc.number: TEST_SET_013
   * @tc.name: testSet013
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet013", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(true, 0.001);
    let res = lightWeightMap.hasValue(0.001);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(true);
    expect(res1).assertEqual(true);
  });
                  
  /**
  * @tc.number: TEST_SET_014
   * @tc.name: testSet014
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet014", 0, function () {
    let lightWeightMap = new LightWeightMap();
    let a = [1, 2, 3, 4];
    lightWeightMap.set(a, 1);
    let res = lightWeightMap.hasValue(1);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(a);
    expect(res1).assertEqual(true);
  });
                  
  /**
  * @tc.number: TEST_SET_015
   * @tc.name: testSet015
   * @tc.desc: Add a pair of key value pairs to the LightWeightMap.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSet015", 0, function () {
    let lightWeightMap = new LightWeightMap();
    let a = {abc: 1};
    lightWeightMap.set(a, "");
    let res = lightWeightMap.hasValue("");
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasKey(a);
    expect(res1).assertEqual(true);
  });

   /**
   * @tc.number: TEST_REMOVE_001
   * @tc.name: testRemove001
   * @tc.desc: Delete key value pairs according to key. For example: lightWeightMap.remove(3).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testRemove001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.remove(3);
    expect(res).assertEqual("C");
    let res1 = lightWeightMap.hasValue("C");
    expect(res1).assertEqual(false);
  });
              

  /**
   * @tc.number: TEST_REMOVE_002
   * @tc.name: testRemove002
   * @tc.desc: Delete key value pairs according to key. For example: lightWeightMap.remove(3).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testRemove002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    let res = lightWeightMap.remove(3);
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_REMOVEAT_001
   * @tc.name: testRemoveAt001
   * @tc.desc: Delete key value pairs according to index. For example: lightWeightMap.removeAt(1).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testRemoveAt001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.removeAt(1);
    expect(res).assertEqual(true);
    let res1 = lightWeightMap.hasValue("A");
    expect(res1).assertEqual(true);
    let res2 = lightWeightMap.hasValue("B");
    expect(res2).assertEqual(false);
    let res3 = lightWeightMap.removeAt(10);
    expect(res3).assertEqual(false);
  });

   /**
   * @tc.number: TEST_REMOVEAT_002
   * @tc.name: testRemoveAt002
   * @tc.desc: Delete key value pairs according to index. For example: lightWeightMap.removeAt(1).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testRemoveAt002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    let res = lightWeightMap.removeAt(1);
    expect(res).assertEqual(false);
  });

  /**
  * @tc.number: TEST_REMOVEAT_003
   * @tc.name: testRemoveAt003
   * @tc.desc: Delete key value pairs according to index. For example: lightWeightMap.removeAt("a").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testRemoveAt003", 0, function () {
    let lightWeightMap = new LightWeightMap();
    try {
      //@ts-ignore
      let res = lightWeightMap.removeAt("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
  * @tc.number: TEST_CLEAR_001
   * @tc.name: testClear001
   * @tc.desc: Clear all key value pairs in LightWeightMap. For example: lightWeightMap.clear().
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testClear001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    lightWeightMap.clear();
    let res = lightWeightMap.length;
    expect(res).assertEqual(0);
    let isEmpty = lightWeightMap.isEmpty();
    expect(isEmpty).assertEqual(true);
  });

  /**
  * @tc.number: TEST_SETVALUEAT_001
   * @tc.name: testSetValueAt001
   * @tc.desc: Modify the value of the key value pair according to the corresponding index. 
   * For example: setValueAt(0, "a").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testSetValueAt001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    lightWeightMap.setValueAt(0, "a");
    let res = lightWeightMap.get(1);
    expect(res).assertEqual("a");
  });

  /**
  * @tc.number: TEST_FOREACH_001
   * @tc.name: testForEach001
   * @tc.desc: Traverse all key value pairs in the LightWeightMap instance.
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testForEach001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let arr = [];
    lightWeightMap.forEach((value, index) => {
      arr.push(value);
    });
    let arr1 = ["A", "B", "C", "D", "E"];
    for (let i = 0; i < arr1.length; i++) {
      expect(arr[i]).assertEqual(arr1[i]);
    }
  });

  /**
  * @tc.number: TEST_ITERATOR_001
   * @tc.name: testIterator001
   * @tc.desc: Iterate over all key value pairs in the LightWeightMap. 
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testIterator001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let iters = lightWeightMap[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = lightWeightMap.length; i < len; i++) {
      let entry = iters.next().value;
      let res = lightWeightMap.get(entry[0]);
      if (res != entry[1]) {
        flag = false;
        break;
      }
    }
    expect(flag).assertEqual(true);
  });

  /**
  * @tc.number: TEST_TOSTRING_001
   * @tc.name: testToString001
   * @tc.desc: Use "," to splice the elements in the LightWeightMap instance into a string. 
   * For example: lightWeightMap.toString().
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testToString001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    let res = lightWeightMap.toString();
    expect(res).assertEqual("1:A,2:B,3:C");
  });

  /**
  * @tc.number: TEST_GETVALUEAT_001
   * @tc.name: testGetValueAt001
   * @tc.desc: Get the value of the key value pair according to the corresponding index. 
   * For example: lightWeightMap.getValueAt(1).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGetValueAt001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.getValueAt(1);
    expect(res).assertEqual("B");
  });

  /**
  * @tc.number: TEST_GETVALUEAT_002
   * @tc.name: testGetValueAt002
   * @tc.desc: Get the value of the key value pair according to the corresponding index. 
   * For example: lightWeightMap.getValueAt("a").
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGetValueAt002", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    try {
      //@ts-ignore
      let res = lightWeightMap.getValueAt("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
  * @tc.number: TEST_GETVALUEAT_003
   * @tc.name: testGetValueAt003
   * @tc.desc: Get the value of the key value pair according to the corresponding index. 
   * For example: lightWeightMap.getValueAt(6).
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testGetValueAt003", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    try {
      lightWeightMap.getValueAt(6);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
    }
  });

  /**
  * @tc.number: TEST_VALUES_001
   * @tc.name: testValues001
   * @tc.desc: Get a collection of all the values in the LightWeightMap. For example: lightWeightMap.values().
   * @tc.size:   MediumTest
   * @tc.type:   Method
   * @tc.level:  level 2
   */
  it("testValues001", 0, function () {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A");
    lightWeightMap.set(2, "B");
    lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D");
    lightWeightMap.set(5, "E");
    let res = lightWeightMap.values();
    expect(res.next().value).assertEqual("A");
    expect(res.next().value).assertEqual("B");
    expect(res.next().value).assertEqual("C");
    expect(res.next().value).assertEqual("D");
    expect(res.next().value).assertEqual("E");
  });
  });
}

