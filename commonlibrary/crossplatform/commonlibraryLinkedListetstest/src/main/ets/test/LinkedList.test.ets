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
import LinkedList from "@ohos.util.LinkedList";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function LinkedListTest() {
describe("LinkedListTest", function () {

  /**
   * @tc.number:TEST_CONSTRUCTOR_001
   * @tc.name:  testConstructor001
   * @tc.desc:  Create an LinkedList instance. For example: let linkedList = new LinkedList().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testConstructor001", 0, function () {
    try {
      let linkedList = new LinkedList();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The LinkedList's constructor cannot be directly invoked");
    }
  });

  /**
   * @tc.number:TEST_LENGTH_001
   * @tc.name:  testLength001
   * @tc.desc:  Get the number of elements in the LinkedList instance. For example: linkedList.length.
   * @tc.size:  MediumTest
   * @tc.type:  Field
   * @tc.level: level 1
   */
  it("testLength001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(4);
    linkedList.add(3);
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(14);
    let res = linkedList.length;
    expect(res).assertEqual(5);
  });

  /**
   * @tc.number:TEST_ADD_001
   * @tc.name: testAdd001
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add("四").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("四");
    let res = linkedList.get(0);
    expect(res).assertEqual("四");
  });
  
  /**
   * @tc.number:TEST_ADD_002
   * @tc.name: testAdd002
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add(8).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(8);
    let res = linkedList.get(0);
    expect(res).assertEqual(8);
  });
    
  /**
   * @tc.number:TEST_ADD_003
   * @tc.name: testAdd003
   * @tc.desc: Add a element to the end of the LinkedList instance. 
   * For example: let a = [1, 2, 3, 4];linkedList.add(a).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd003", 0, function () {
    let linkedList = new LinkedList();
    let a = [1, 2, 3, 4];
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.number:TEST_ADD_004
   * @tc.name: testAdd004
   * @tc.desc: Add a element to the end of the LinkedList instance. 
   * For example: let a = {name: "lala", age: "13"};linkedList.add(a).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd004", 0, function () {
    let linkedList = new LinkedList();
    let a = {name: "lala", age: "13"};
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.number:TEST_ADD_005
   * @tc.name: testAdd005
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = ".";linkedList.add(a).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd005", 0, function () {
    let linkedList = new LinkedList();
    let a = ".";
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.number:TEST_ADD_006
   * @tc.name: testAdd006
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = "*";linkedList.add(a).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd006", 0, function () {
    let linkedList = new LinkedList();
    let a = "*";
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.number:TEST_ADD_007
   * @tc.name: testAdd007
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = "/";linkedList.add(a).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd007", 0, function () {
    let linkedList = new LinkedList();
    let a = '/"';
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.number:TEST_ADD_008
   * @tc.name: testAdd008
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = "";linkedList.add(a).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd008", 0, function () {
    let linkedList = new LinkedList();
    let a = "";
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
  });
    
  /**
   * @tc.number:TEST_ADD_009
   * @tc.name: testAdd009
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: let a = "a";linkedList.add(a).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd009", 0, function () {
    let linkedList = new LinkedList();
    let a = "a";
    linkedList.add(a);
    linkedList.add(a);
    let res = linkedList.get(0);
    expect(res).assertEqual(a);
    let res1 = linkedList.get(1);
    expect(res1).assertEqual(a);
  });

   /**
   * @tc.number:TEST_ADD_010
   * @tc.name: testAdd010
   * @tc.desc: Add a element to the end of the LinkedList instance. 
   * For example: for (let i = 0; i < 100; i++) {linkedList.add(i);}.
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd010", 0, function () {
    let linkedList = new LinkedList();
    for (let i = 0; i < 100; i++) {
      linkedList.add(i);
    }
    let res = linkedList.get(99);
    expect(res).assertEqual(99);
  });

  /**
   * @tc.number:TEST_ADD_011
   * @tc.name: testAdd011
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add(null).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd054", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(null);
    let res = linkedList.get(0);
    expect(res).assertEqual(null);
  });
    
  /**
   * @tc.number:TEST_ADD_012
   * @tc.name: testAdd012
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add(0.1).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd055", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(0.1);
    let res = linkedList.get(0);
    expect(res).assertEqual(0.1);
  });
    
  /**
   * @tc.number:TEST_ADD_013
   * @tc.name: testAdd013
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add(-1).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level:level 2
   */
  it("testAdd056", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(-1);
    let res = linkedList.get(0);
    expect(res).assertEqual(-1);
  });
    
  /**
   * @tc.number:TEST_ADD_014
   * @tc.name: testAdd014
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: const obj = {}; linkedList.add(obj).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testAdd014", 0, function () {
    let linkedList = new LinkedList();
    const obj = {};
    linkedList.add(obj);
    let res = linkedList.get(0);
    expect(res).assertEqual(obj);
  });

  /**
   * @tc.number:TEST_ADD_015
   * @tc.name: testAdd015
   * @tc.desc: Add a element to the end of the LinkedList instance. For example: linkedList.add.bind({}, obj)().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testAdd015", 0, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.add.bind({}, "a")();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The add method cannot be bound`);
    }
  });



  /**
   * @tc.number:TEST_INSERT_001
   * @tc.name: testInsert001
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(3, "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testInsert001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.insert(3, "d");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "d", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
   * @tc.number:TEST_INSERT_002
   * @tc.name: testInsert002
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(0, "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testInsert002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.insert(0, "d");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["d", "a", "b", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
  * @tc.number:TEST_INSERT_003
   * @tc.name: testInsert003
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(5, "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testInsert003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.insert(5, "d");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "a", "b", "d"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
  * @tc.number:TEST_INSERT_004
   * @tc.name: testInsert004
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(9, "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testInsert004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    try {
      let res = linkedList.insert(8, "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 5. Received value is: 8`);
    }
  });

   /**
   * @tc.number:TEST_INSERT_005
   * @tc.name: testInsert005
   * @tc.desc: Insert an element into the middle of the LinkedList instance. For example: linkedList.insert("a", "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testInsert005", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    try {
      //@ts-ignore
      linkedList.insert("a", "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });



  /**
  * @tc.number:TEST_GET_001
   * @tc.name: testGet001
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList.get(1).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGet001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.get(1);
    expect(res).assertEqual("b");
  });

   /**
   * @tc.number:TEST_GET_002
   * @tc.name: testGet002
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList.get(10).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGet002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.get(10);
    expect(res).assertEqual(undefined);
  });

  /**
  * @tc.number:TEST_GET_003
   * @tc.name: testGet003
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList.get(1).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGet003", 0, function () {
    let linkedList = new LinkedList();
    let res = linkedList.get(1);
    expect(res).assertEqual(undefined);
  });

  /**
  * @tc.number:TEST_GET_004
   * @tc.name: testGet004
   * @tc.desc: Gets the element corresponding to the specified index. For example: linkedList.get("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGet004", 0, function () {
    let linkedList = new LinkedList();
    try {
      //@ts-ignore
      linkedList.get("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
  * @tc.number:TEST_ADDFIRST_001
   * @tc.name: testAddFirst001
   * @tc.desc: Add element to LinkedList instance header. For example: linkedList.addFirst("e").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testAddFirst001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("e");
    let res = linkedList.get(0);
    expect(res).assertEqual("e");
  });

  /**
  * @tc.number:TEST_ADDFIRST_002
   * @tc.name: testAddFirst002
   * @tc.desc: Add element to LinkedList instance header. For example: linkedList.addFirst("h").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testAddFirst002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("h");
    let res = linkedList.get(0);
    expect(res).assertEqual("h");
  });

  /**
  * @tc.number:TEST_ADDFIRST_003
   * @tc.name: testAddFirst003
   * @tc.desc: Add element to LinkedList instance header. For example: linkedList.addFirst("m").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testAddFirst003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("m");
    let res = linkedList.get(0);
    expect(res).assertEqual("m");
  });

  /**
  * @tc.number:TEST_ADDFIRST_004
   * @tc.name: testAddFirst004
   * @tc.desc: Add element to LinkedList instance header. For example: linkedList.addFirst("k").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testAddFirst004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("k");
    let res = linkedList.get(0);
    expect(res).assertEqual("k");
  });

  /**
  * @tc.number:TEST_ADDFIRST_005
   * @tc.name: testAddFirst005
   * @tc.desc: Add element to LinkedList instance header. For example: linkedList.addFirst("w").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testAddFirst005", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("w");
    let res = linkedList.get(0);
    expect(res).assertEqual("w");
  });

  /**
  * @tc.number:TEST_REMOVEFIRST_001
   * @tc.name: testRemoveFirst001
   * @tc.desc: Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirst001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    let res = linkedList.removeFirst();
    expect(res).assertEqual("a");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEFIRST_002
   * @tc.name: testRemoveFirst002
   * @tc.desc: Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirst002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("m");
    linkedList.add("b");
    linkedList.add("c");
    let res = linkedList.removeFirst();
    expect(res).assertEqual("m");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEFIRST_003
   * @tc.name: testRemoveFirst003
   * @tc.desc: Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirst003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("h");
    linkedList.add("b");
    linkedList.add("c");
    let res = linkedList.removeFirst();
    expect(res).assertEqual("h");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEFIRST_004
   * @tc.name: testRemoveFirst004
   * @tc.desc: Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirst004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("k");
    linkedList.add("b");
    linkedList.add("c");
    let res = linkedList.removeFirst();
    expect(res).assertEqual("k");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEFIRST_005
   * @tc.name: testRemoveFirst005
   * @tc.desc: Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirst005", 0, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.removeFirst();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200010);
      expect(err.message).assertEqual(`Container is empty`);
    }
  });

  /**
  * @tc.number:TEST_REMOVELAST_001
   * @tc.name: testRemoveLast001
   * @tc.desc: Delete the end element of a LinkedList instance. linkedList.removeLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLast001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual("c");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVELAST_002
   * @tc.name: testRemoveLast002
   * @tc.desc: Delete the end element of a LinkedList instance. linkedList.removeLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLast002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("d");
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual("d");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["e", "a", "b","c"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVELAST_003
   * @tc.name: testRemoveLast003
   * @tc.desc: Delete the end element of a LinkedList instance. linkedList.removeLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLast003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("h");
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual("h");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
  
  /**
  * @tc.number:TEST_REMOVELAST_004
   * @tc.name: testRemoveLast004
   * @tc.desc: Delete the end element of a LinkedList instance. linkedList.removeLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLast004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("m");
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual("m");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVELAST_005
   * @tc.name: testRemoveLast005
   * @tc.desc: Delete the end element of a LinkedList instance. linkedList.removeLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLast061", 0, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.removeLast();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200010);
      expect(err.message).assertEqual(`Container is empty`);
    }
  });

  /**
  * @tc.number:TEST_HAS_001
   * @tc.name: testHas001
   * @tc.desc: Check whether the LinkedList contains a specified element. For example: linkedList.has("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testHas001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    let res = linkedList.has("a");
    expect(res).assertEqual(true);
    let res1 = linkedList.has("d");
    expect(res1).assertEqual(false);
  });

  /**
  * @tc.number:TEST_HAS_002
   * @tc.name: testHas002
   * @tc.desc: Check whether the LinkedList contains a specified element. For example: linkedList.has("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testHas002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("m");
    let res = linkedList.has("m");
    expect(res).assertEqual(true);
    let res1 = linkedList.has("k");
    expect(res1).assertEqual(false);
  });

  /**
  * @tc.number:TEST_HAS_003
   * @tc.name: testHas003
   * @tc.desc: Check whether the LinkedList contains a specified element. For example: linkedList.has(1).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testHas003", 0, function () {
    let linkedList = new LinkedList();
    let res = linkedList.has(1);
    expect(res).assertEqual(false);
  });

  /**
  * @tc.number:TEST_GETINDEXOF_001
   * @tc.name: testGetIndexOf001
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. 
   * For example: linkedList.getIndexOf("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetIndexOf001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getIndexOf("b");
    expect(res).assertEqual(1);
  });

  /**
  * @tc.number:TEST_GETINDEXOF_002
   * @tc.name: testGetIndexOf002
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. 
   * For example: linkedList.getIndexOf("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetIndexOf002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getIndexOf("a");
    expect(res).assertEqual(0);
  });

  /**
  * @tc.number:TEST_GETINDEXOF_003
   * @tc.name: testGetIndexOf003
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. 
   * For example: linkedList.getIndexOf("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetIndexOf003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getIndexOf("c");
    expect(res).assertEqual(2);
  });
    
  /**
  * @tc.number:TEST_GETINDEXOF_004
   * @tc.name: testGetIndexOf004
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. 
   * For example: linkedList.getIndexOf("f").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetIndexOf004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getIndexOf("f");
    expect(res).assertEqual(-1);
  });

  /**
  * @tc.number:TEST_GETINDEXOF_005
   * @tc.name: testGetIndexOf005
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from front to back, 
   * and return the index found for the first time. If not found, return -1. For example: linkedList.getIndexOf(1).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetIndexOf005", 0, function () {
    let linkedList = new LinkedList();
    let res = linkedList.getIndexOf(1);
    expect(res).assertEqual(-1);
  });

  /**
  * @tc.number:TEST_REMOVEBYINDEX_001
   * @tc.name: testRemoveByIndex001
   * @tc.desc: In the linkedList instance, delete the element based on its index. 
   * For example: linkedList.removeByIndex(2).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveByIndex001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeByIndex(2);
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEBYINDEX_002
   * @tc.name: testRemoveByIndex002
   * @tc.desc: In the linkedList instance, delete the element based on its index. 
   * For example: linkedList.removeByIndex(3).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveByIndex002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeByIndex(3);
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
  * @tc.number:TEST_REMOVEBYINDEX_003
   * @tc.name: testRemoveByIndex003
   * @tc.desc: In the linkedList instance, delete the element based on its subscript index. 
   * For example: linkedList.removeByIndex(10).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveByIndex003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    try {
      let res = linkedList.removeByIndex(10);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 10`);
    }
  });

  /**
  * @tc.number:TEST_REMOVEBYINDEX_004
   * @tc.name: testRemoveByIndex004
   * @tc.desc: In the linkedList instance, delete the element based on its subscript index. 
   * For example: linkedList.removeByIndex(1).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveByIndex004", 0, function () {
    let linkedList = new LinkedList();
    try {
      let res = linkedList.removeByIndex(1);
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 0. Received value is: 1`);
    }
  });

  /**
  * @tc.number:TEST_REMOVEBYINDEX_005
   * @tc.name: testRemoveByIndex005
   * @tc.desc: In the linkedList instance, delete the element based on its subscript index. 
   * For example: linkedList.removeByIndex("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveByIndex005", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    try {
      //@ts-ignore
      linkedList.removeByIndex("a");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
  * @tc.number:TEST_REMOVE_001
   * @tc.name: testRemove001
   * @tc.desc: Delete the specified element. For example: linkedList.remove("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemove001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.remove("a");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVE_002
   * @tc.name: testRemove002
   * @tc.desc: Delete the specified element. For example: linkedList.remove("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemove002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.remove("c");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVE_003
   * @tc.name: testRemove003
   * @tc.desc: Delete the specified element. For example: linkedList.remove("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemove003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.remove("b");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
    
  /**
  * @tc.number:TEST_REMOVE_004
   * @tc.name: testRemove004
   * @tc.desc: Delete the specified element. For example: linkedList.remove("d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemove004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.remove("d");
    expect(res).assertEqual(false);
  });
    
  /**
  * @tc.number:TEST_REMOVE_005
   * @tc.name: testRemove005
   * @tc.desc: Delete the specified element. For example: linkedList.remove("d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemove005", 0, function () {
    let linkedList = new LinkedList();
    let res = linkedList.remove("d");
    expect(res).assertEqual(false);
  });

  /**
  * @tc.number:TEST_REMOVEFIRSTFOUND_001
   * @tc.name: testRemoveFirstFound001
   * @tc.desc: Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirstFound001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeFirstFound("b");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEFIRSTFOUND_002
   * @tc.name: testRemoveFirstFound002
   * @tc.desc: Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirstFound002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeFirstFound("a");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["b", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEFIRSTFOUND_003
   * @tc.name: testRemoveFirstFound003
   * @tc.desc: Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirstFound003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeFirstFound("c");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEFIRSTFOUND_004
   * @tc.name: testRemoveFirstFound004
   * @tc.desc: Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirstFound004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("m");
    let res = linkedList.removeFirstFound("m");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "a"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVEFIRSTFOUND_005
   * @tc.name: testRemoveFirstFound005
   * @tc.desc: Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveFirstFound005", 0, function () {
    let linkedList = new LinkedList();
    try {
      linkedList.removeFirstFound("b");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200010);
      expect(err.message).assertEqual(`Container is empty`);
    }
  });

  /**
  * @tc.number:TEST_REMOVELASTFOUND_001
   * @tc.name: testRemoveLastFound001
   * @tc.desc: Delete the specified element found for the last time. For example: linkedList.removeLastFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLastFound001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeLastFound("b");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "a"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVELASTFOUND_002
   * @tc.name: testRemoveLastFound002
   * @tc.desc: Delete the specified element found for the last time. For example: linkedList.removeLastFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLastFound002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeLastFound("a");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "c", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVELASTFOUND_003
   * @tc.name: testRemoveLastFound003
   * @tc.desc: Delete the specified element found for the last time. For example: linkedList.removeLastFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLastFound003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.removeLastFound("c");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVELASTFOUND_004
   * @tc.name: testRemoveLastFound004
   * @tc.desc: Delete the specified element found for the last time. For example: linkedList.removeLastFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLastFound004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("m");
    let res = linkedList.removeLastFound("m");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b","c","a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_REMOVELASTFOUND_005
   * @tc.name: testRemoveLastFound005
   * @tc.desc: Delete the specified element found for the last time. For example: linkedList.removeLastFound("b").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testRemoveLastFound005", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("m");
    let res = linkedList.removeLastFound("a");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["a", "b","c","b", "m"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_GETLASTINDEXOF_001
   * @tc.name: testGetLastIndexOf001
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1.
   * For example: linkedList.getLastIndexOf("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLastIndexOf001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getLastIndexOf("a");
    expect(res).assertEqual(3);
  });

  /**
  * @tc.number:TEST_GETLASTINDEXOF_002
   * @tc.name: testGetLastIndexOf002
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1.
   * For example: linkedList.getLastIndexOf("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLastIndexOf002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getLastIndexOf("b");
    expect(res).assertEqual(5);
  });

  /**
  * @tc.number:TEST_GETLASTINDEXOF_003
   * @tc.name: testGetLastIndexOf003
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1.
   * For example: linkedList.getLastIndexOf("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLastIndexOf003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getLastIndexOf("c");
    expect(res).assertEqual(2);
  });

  /**
  * @tc.number:TEST_GETLASTINDEXOF_004
   * @tc.name: testGetLastIndexOf004
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1.
   * For example: linkedList.getLastIndexOf("a").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLastIndexOf004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("k");
    linkedList.add("b");
    linkedList.add("k");
    linkedList.add("b");
    let res = linkedList.getLastIndexOf("k");
    expect(res).assertEqual(6);
  });
    
  /**
  * @tc.number:TEST_GETLASTINDEXOF_005
   * @tc.name: testGetLastIndexOf005
   * @tc.desc:  In the LinkedList instance, find the index of a specified element from brack to front, 
   * and return the index found for the first time. If not found, return -1. 
   * For example: linkedList.getLastIndexOf("f").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLastIndexOf005", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("b");
    let res = linkedList.getLastIndexOf("f");
    expect(res).assertEqual(-1);
  });

  /**
  * @tc.number:TEST_GETFIRST_001
   * @tc.name: testGetFirst001
   * @tc.desc: Get the header element of the linkedList instance. For example: linkedList.getFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetFirst001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.getFirst();
    expect(res).assertEqual("a");
  });

  /**
  * @tc.number:TEST_GETFIRST_002
   * @tc.name: testGetFirst002
   * @tc.desc: Get the header element of the linkedList instance. For example: linkedList.getFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetFirst002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("m");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.getFirst();
    expect(res).assertEqual("m");
  });

  /**
  * @tc.number:TEST_GETFIRST_003
   * @tc.name: testGetFirst003
   * @tc.desc: Get the header element of the linkedList instance. For example: linkedList.getFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetFirst003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("k");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.getFirst();
    expect(res).assertEqual("k");
  });

   /**
   * @tc.number:TEST_GETFIRST_004
   * @tc.name: testGetFirst004
   * @tc.desc: Get the header element of the linkedList instance. For example: linkedList.getFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetFirst004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("h");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.getFirst();
    expect(res).assertEqual("h");
  });

   /**
   * @tc.number:TEST_GETFIRST_005
   * @tc.name: testGetFirst005
   * @tc.desc: Get the header element of the linkedList instance. For example: linkedList.getFirst().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetFirst005", 0, function () {
    let linkedList = new LinkedList();
    let res = linkedList.getFirst();
    expect(res).assertEqual(undefined);
  });

  /**
  * @tc.number:TEST_GETLAST_001
   * @tc.name: testGetLast001
   * @tc.desc: Get the end element of the linkedList instance. For example: linkedList.getLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLast001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("b");
    let res = linkedList.getLast();
    expect(res).assertEqual("b");
  });

  /**
  * @tc.number:TEST_GETLAST_002
   * @tc.name: testGetLast002
   * @tc.desc: Get the end element of the linkedList instance. For example: linkedList.getLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLast002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("m");
    let res = linkedList.getLast();
    expect(res).assertEqual("m");
  });

  /**
  * @tc.number:TEST_GETLAST_003
   * @tc.name: testGetLast003
   * @tc.desc: Get the end element of the linkedList instance. For example: linkedList.getLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLast003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("h");
    let res = linkedList.getLast();
    expect(res).assertEqual("h");
  });

  /**
  * @tc.number:TEST_GETLAST_004
   * @tc.name: testGetLast004
   * @tc.desc: Get the end element of the linkedList instance. For example: linkedList.getLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLast004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    linkedList.add("k");
    let res = linkedList.getLast();
    expect(res).assertEqual("k");
  });

  /**
  * @tc.number:TEST_GETLAST_005
   * @tc.name: testGetLast005
   * @tc.desc: Get the end element of the linkedList instance. For example: linkedList.getLast().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testGetLast005", 0, function () {
    let linkedList = new LinkedList();
    let res = linkedList.getLast();
    expect(res).assertEqual(undefined);
  });

  /**
  * @tc.number:TEST_SET_001
   * @tc.name: testSet001
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList.set(2, "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testSet001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    let res = linkedList.set(2, "d");
    let res1 = linkedList.get(2);
    expect(res1).assertEqual("d");
  });

  /**
  * @tc.number:TEST_SET_002
   * @tc.name: testSet002
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList.set(2, "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testSet002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    let res = linkedList.set(1, "m");
    let res1 = linkedList.get(1);
    expect(res1).assertEqual("m");
  });

  /**
  * @tc.number:TEST_SET_003
   * @tc.name: testSet003
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList.set(2, "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testSet003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    let res = linkedList.set(3, "k");
    let res1 = linkedList.get(3);
    expect(res1).assertEqual("k");
  });

  /**
  * @tc.number:TEST_SET_004
   * @tc.name: testSet004
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList.set(6, "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testSet004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("a");
    try {
      linkedList.set(6, "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200001);
      expect(err.message).assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 3. Received value is: 6`);
    }
  });

  /**
  * @tc.number:TEST_SET_005
   * @tc.name: testSet005
   * @tc.desc: Modify the element corresponding to the specified index. For example: linkedList.set("a", "d").
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testSet005", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    try {
      //@ts-ignore
      linkedList.set("a", "d");
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(401);
      expect(err.message).assertEqual(`The type of "index" must be number. Received value is: a`);
    }
  });

  /**
  * @tc.number:TEST_FOREACH_001
   * @tc.name: testForEach001
   * @tc.desc: Traversing elements in an LinkedList instance. 
   * For example: linkedList.forEach((item, index) => {arr.push(item);}).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testForEach001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(8);
    linkedList.add("一");
    linkedList.add("二");
    linkedList.add(5);
    let c = [1, 2, 3, 4];
    linkedList.add(c);
    linkedList.add(6);
    linkedList.add("三");
    linkedList.add("四");
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_FOREACH_002
   * @tc.name: testForEach002
   * @tc.desc: Traversing elements in an LinkedList instance. 
   * For example: linkedList.forEach((item, index) => {arr.push(item);}).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testForEach002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(8);
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(5);
    let c = [1, 2, 3, 4];
    linkedList.add(c);
    linkedList.add(6);
    linkedList.add(3);
    linkedList.add(4);
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, 1, 2, 5, c, 6, 3, 4];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

   /**
   * @tc.number:TEST_FOREACH_003
   * @tc.name: testForEach003
   * @tc.desc: Traversing elements in an LinkedList instance. 
   * For example: linkedList.forEach((item, index) => {arr.push(item);}).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testForEach003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(8);
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    let c = [1, 2, 3, 4];
    linkedList.add("c");
    linkedList.add(6);
    linkedList.add(3);
    linkedList.add(4);
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, "a", "b", "c", "c", 6, 3, 4];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

   /**
   * @tc.number:TEST_FOREACH_004
   * @tc.name: testForEach004
   * @tc.desc: Traversing elements in an LinkedList instance. 
   * For example: linkedList.forEach((item, index) => {arr.push(item);}).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testForEach004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("m");
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    let c = [1, 2, 3, 4];
    linkedList.add("m");
    linkedList.add(6);
    linkedList.add(3);
    linkedList.add(4);
    let arr = [];
    linkedList.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["m", "a", "b", "c", "m", 6, 3, 4];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_FOREACH_005
   * @tc.name: testForEach005
   * @tc.desc: Traversing elements in an LinkedList instance. 
   * For example: linkedList.forEach((item, index) => { num++; }).
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testForEach005", 0, function () {
    let linkedList = new LinkedList();
    let num = 0;
    linkedList.forEach((item, index) => {
      num++;
    });
    expect(num).assertEqual(0);
  });

  /**
  * @tc.number:TEST_CLEAR_001
   * @tc.name: testClear001
   * @tc.desc: Clear all elements in the linkedList instance. For example: linkedList.clear().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testClear001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(4);
    linkedList.add(3);
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(14);
    linkedList.clear();
    let res = linkedList.length;
    expect(res).assertEqual(0);
  });

  /**
  * @tc.number:TEST_CLEAR_002
   * @tc.name: testClear002
   * @tc.desc: Clear all elements in the linkedList instance. For example: linkedList.clear().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testClear002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("d");
    linkedList.add(20);
    linkedList.clear();
    let res = linkedList.length;
    expect(res).assertEqual(0);
  });

  /**
  * @tc.number:TEST_CLEAR_003
   * @tc.name: testClear003
   * @tc.desc: Clear all elements in the LinkedList instance. For example: linkedList.clear().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testClear003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.clear();
    const len = linkedList.length;
    expect(len).assertEqual(0);
  });

  /**
  * @tc.number:TEST_CLONE_001
   * @tc.name: testClone001
   * @tc.desc: Clone an LinkedList instance. For example: linkedList.clone().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testClone001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    let linkedList1 = linkedList.clone();
    linkedList1.addFirst("e");
    let res = linkedList1.removeLast();
    expect(res).assertEqual("c");
    let arr = [];
    linkedList1.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_CLONE_002
   * @tc.name: testClone002
   * @tc.desc: Clone an LinkedList instance. For example: linkedList.clone().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testClone002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);
    let linkedList1 = linkedList.clone();
    linkedList1.addFirst("e");
    let res = linkedList1.removeLast();
    expect(res).assertEqual(3);
    let arr = [];
    linkedList1.forEach((item, index) => {
      arr.push(item);
    });
    let a = ["e", 1, 2];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_CLONE_003
   * @tc.name: testClone003
   * @tc.desc: Clone an LinkedList instance. For example: linkedList.clone().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testClone003", 0, function () {
    let linkedList = new LinkedList();
    let newlinkedList = linkedList.clone();
    let res = true
    for (let i = 0; i < linkedList.length; i++) {
      if (linkedList[i] !== newlinkedList[i]) {
        res = false
      }
    }
    expect(res).assertEqual(true);
  });

  /**
  * @tc.number:TEST_CONVERTTOARRAY_001
   * @tc.name: testConvertToArray001
   * @tc.desc: Convert an LinkedList instance to an array. For example: linkedList.convertToArray().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testConvertToArray001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(4);
    linkedList.add(3);
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(14);
    let res = linkedList.convertToArray();
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
      expect(res[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_CONVERTTOARRAY_002
   * @tc.name: testConvertToArray002
   * @tc.desc: Convert an LinkedList instance to an array. For example: linkedList.convertToArray().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testConvertToArray002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);
    linkedList.add(4);
    linkedList.add(5);
    linkedList.add(6);
    let res = linkedList.convertToArray();
    let a = [1,2,3,4,5,6];
    for (let i = 0; i < a.length; i++) {
      expect(res[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_CONVERTTOARRAY_003
   * @tc.name: testConvertToArray003
   * @tc.desc: Convert an LinkedList instance to an array. For example: linkedList.convertToArray().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testConvertToArray003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(2);
    linkedList.add(4);
    linkedList.add(3);
    linkedList.add(10);
    linkedList.add(12);
    linkedList.add(16);
    let res = linkedList.convertToArray();
    let a = [2,4,3,10,12,16];
    for (let i = 0; i < a.length; i++) {
      expect(res[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_CONVERTTOARRAY_004
   * @tc.name: testConvertToArray004
   * @tc.desc: Convert an LinkedList instance to an array. For example: linkedList.convertToArray().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testConvertToArray004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.add("d");
    linkedList.add("e");
    linkedList.add("f");
    let res = linkedList.convertToArray();
    let a = ["a","b","c","d","e","f"];
    for (let i = 0; i < a.length; i++) {
      expect(res[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_CONVERTTOARRAY_005
   * @tc.name: testConvertToArray005
   * @tc.desc: Convert an LinkedList instance to an array. For example: linkedList.convertToArray().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testConvertToArray005", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("m");
    linkedList.add("k");
    linkedList.add("c");
    linkedList.add("d");
    linkedList.add("e");
    linkedList.add("f");
    let res = linkedList.convertToArray();
    let a = ["m","k","c","d","e","f"];
    for (let i = 0; i < a.length; i++) {
      expect(res[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_ITERATOR_001
   * @tc.name: testIterator001
   * @tc.desc: Iterates over all elements in an LinkedList instance. For example: linkedList[Symbol.iterator]().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testIterator001", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual(3);
    let arr = [];
    let itr = linkedList[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = ["e", 1, 2];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_ITERATOR_002
   * @tc.name: testIterator002
   * @tc.desc: Iterates over all elements in an LinkedList instance. For example: linkedList[Symbol.iterator]().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testIterator002", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(5);
    linkedList.add(10);
    linkedList.add(15);
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual(15);
    let arr = [];
    let itr = linkedList[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = ["e", 5, 10];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_ITERATOR_003
   * @tc.name: testIterator003
   * @tc.desc: Iterates over all elements in an LinkedList instance. For example: linkedList[Symbol.iterator]().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testIterator003", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("k");
    linkedList.add("h");
    linkedList.add("m");
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual("m");
    let arr = [];
    let itr = linkedList[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = ["e", "k", "h"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

   /**
   * @tc.number:TEST_ITERATOR_004
   * @tc.name: testIterator004
   * @tc.desc: Iterates over all elements in an LinkedList instance. For example: linkedList[Symbol.iterator]().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testIterator004", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);
    linkedList.addFirst(10);
    let res = linkedList.removeLast();
    expect(res).assertEqual(3);
    let arr = [];
    let itr = linkedList[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = [10, 1, 2];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
  * @tc.number:TEST_ITERATOR_005
   * @tc.name: testIterator005
   * @tc.desc: Iterates over all elements in an LinkedList instance. For example: linkedList[Symbol.iterator]().
   * @tc.size:  MediumTest
   * @tc.type:  Method
   * @tc.level: level 2
   */
  it("testIterator005", 0, function () {
    let linkedList = new LinkedList();
    linkedList.add("a");
    linkedList.add("b");
    linkedList.add("c");
    linkedList.addFirst("e");
    let res = linkedList.removeLast();
    expect(res).assertEqual("c");
    let arr = [];
    let itr = linkedList[Symbol.iterator]();
    let tmp = undefined;
    do {
      tmp = itr.next().value;
      arr.push(tmp);
    } while (tmp != undefined);
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });
  });
}