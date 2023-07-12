/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Queue from "@ohos.util.Queue";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function QueueTest() {
describe("QueueTest", function () {

  /**
   * @tc.number: TEST_CONSTRUCTOR_001
   * @tc.name: testConstructor001
   * @tc.desc: Create an Queue instance. For example: let queue = new Queue().
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testConstructor001", 0, function () {
    try {
      let queue = new Queue();
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200012);
      expect(err.message).assertEqual("The Queue's constructor cannot be directly invoked");
    }
  });
  
  /**
   * @tc.number: TEST_ADD_001
   * @tc.name: testAdd001
   * @tc.desc: Add element to Queue instance end. For example: queue.add("四").
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd001", 0, function () {
    let queue = new Queue();
    queue.add("四");
    let res = queue.getFirst();
    expect(res).assertEqual("四");
  });
  
  /**
   * @tc.number: TEST_ADD_002
   * @tc.name: testAdd002
   * @tc.desc: Add element to Queue instance end. For example: queue.add(8).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd002", 0, function () {
    let queue = new Queue();
    queue.add(8);
    let res = queue.getFirst();
    expect(res).assertEqual(8);
  });
  
  /**
   * @tc.number: TEST_ADD_003
   * @tc.name: testAdd003
   * @tc.desc: Add element to Queue instance end. For example: queue.add(8).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd003", 0, function () {
    let queue = new Queue();
    let a = ["a", "b", "c"];
    queue.add(a);
    let res = queue.getFirst();
    expect(res).assertEqual(a);
  });

  /**
   * @tc.number: TEST_ADD_004
   * @tc.name: testAdd004
   * @tc.desc: Add element to Queue instance end. For example: queue.add("$").
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd004", 0, function () {
    let queue = new Queue();
    queue.add("$");
    let res = queue.getFirst();
    expect(res).assertEqual("$");
  });

  /**
   * @tc.number: TEST_ADD_005
   * @tc.name: testAdd005
   * @tc.desc: Add element to Queue instance end. For example: queue.add(" ").
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd005", 0, function () {
    let queue = new Queue();
    queue.add(" ");
    let res = queue.getFirst();
    expect(res).assertEqual(" ");
  });

  /**
   * @tc.number: TEST_ADD_006
   * @tc.name: testAdd006
   * @tc.desc: Add element to Queue instance end. For example: queue.add(null).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd006", 0, function () {
    let queue = new Queue();
    queue.add(null);
    let res = queue.getFirst();
    expect(res).assertEqual(null);
  });

  /**
   * @tc.number: TEST_ADD_007
   * @tc.name: testAdd007
   * @tc.desc: Add element to Queue instance end. For example: queue.add(undefined).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd007", 0, function () {
    let queue = new Queue();
    queue.add(undefined);
    let res = queue.getFirst();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_ADD_008
   * @tc.name: testAdd008
   * @tc.desc: Add element to Queue instance end. For example: for (let i = 0; i < 100; i++) { queue.add(i);}.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd008", 0, function () {
    let queue = new Queue();
    for (let i = 0; i < 100; i++) {
      queue.add(i);
    }
    let res = queue.length;
    expect(res).assertEqual(100);
  });

  /**
   * @tc.number: TEST_ADD_009
   * @tc.name: testAdd009
   * @tc.desc: Add element to Queue instance end. For example: queue.add.bind({}, 10)().
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testAdd009", 0, function () {
    let queue = new Queue();
    try {
      queue.add.bind({}, 10)();
      expect(true).assertEqual(false);
    } catch (err) {
      expect(err.name).assertEqual("BusinessError");
      expect(err.code).assertEqual(10200011);
      expect(err.message).assertEqual(`The add method cannot be bound`);
    }
  });

  /**
   * @tc.number: TEST_GET_FIRST_001
   * @tc.name: testGetFirst001
   * @tc.desc: Get the header element of the queue instance. For example: queue.getFirst().
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testGetFirst001", 0, function () {
    let queue = new Queue();
    queue.add(6);
    queue.add("四");
    let res = queue.getFirst();
    expect(res).assertEqual(6);
  });

  /**
   * @tc.number: TEST_GET_FIRST_002
   * @tc.name: testGetFirst002
   * @tc.desc: Get the header element of the queue instance. For example: queue.getFirst().
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testGetFirst002", 0, function () {
    let queue = new Queue();
    let res = queue.getFirst();
    expect(res).assertEqual(undefined);
  });

  /**
   * @tc.number: TEST_POP_001
   * @tc.name: testPop001
   * @tc.desc: Delete the header element of a queue instance. For example: queue.pop().
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testPop001", 0, function () {
    let queue = new Queue();
    queue.add(6);
    queue.add("四");
    let res = queue.pop();
    let res1 = queue.getFirst();
    expect(res).assertEqual(6);
    expect(res1).assertEqual("四");
  });

  /**
   * @tc.number: TEST_POP_002
   * @tc.name: testPop002
   * @tc.desc: Delete the header element of a queue instance. For example: queue.pop().
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testPop002", 0, function () {
    let queue = new Queue();
    let res = queue.pop();
    expect(res).assertEqual(undefined);
  });
  
  /**
   * @tc.number: TEST_FOREACH_001
   * @tc.name: testForEach001
   * @tc.desc: Traversing elements in queue instances. For example: queue.forEach((item, index) => {arr.push(item);}).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testForEach001", 0, function () {
    let queue = new Queue();
    queue.add(8);
    queue.add("一");
    queue.add("二");
    queue.add(1);
    queue.add(2);
    queue.add(3);
    queue.add(4);
    queue.add(5);
    queue.add(6);
    let c = ["a", "b", "c", "d"];
    queue.add(c);
    let arr = [];
    queue.forEach((item, index) => {
      arr.push(item);
    });
    let a = [8, "一", "二", 1, 2, 3, 4, 5, 6, c];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
   * @tc.number: TEST_FOREACH_002
   * @tc.name: testForEach002
   * @tc.desc: Traversing elements in queue instances. For example: queue.forEach((item, index) => {arr.push(item);}).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testForEach002", 0, function () {
    let queue = new Queue();
    let arr = [];
    queue.forEach((item, index) => {
      arr.push(item);
    });
    expect(arr.length).assertEqual(0);
  });

  /**
   * @tc.number: TEST_ITERATOR_001
   * @tc.name: testIterator001
   * @tc.desc: Iterate over all elements in the queue instance. For example: for (let item of queue) { arr.push(item);}.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIterator001", 0, function () {
    let queue = new Queue();
    queue.add(8);
    queue.add("一");
    queue.add("二");
    queue.add(5);
    queue.add(6);
    queue.add("三");
    queue.add("四");
    let arr = [];
    for (let item of queue) {
      arr.push(item);
    }
    let a = [8, "一", "二", 5, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
   * @tc.number: TEST_ITERATOR_002
   * @tc.name: testIterator002
   * @tc.desc: Iterate over all elements in the queue instance. For example: for (let item of queue) { arr.push(item);}.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIterator002", 0, function () {
    let queue = new Queue();
    let arr = [];
    for (let item of queue) {
      arr.push(item);
    }
    expect(arr.length).assertEqual(0);
  });

  /**
   * @tc.number: TEST_ITERATOR_003
   * @tc.name: testIterator003
   * @tc.desc: Iterate over all elements in the queue instance. For example: queue[Symbol.iterator]().
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
  it("testIterator003", 0, function () {
    let queue = new Queue();
    queue.add(8);
    queue.add("一");
    queue.add("二");
    queue.add(5);
    queue.add(6);
    queue.add("三");
    queue.add("四");
    let arr = [];
    let size = queue.length;
    let itr = queue[Symbol.iterator]();
    for (let i = 0; i < size; i++) {
      arr.push(itr.next().value);
    }
    let a = [8, "一", "二", 5, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
      expect(arr[i]).assertEqual(a[i]);
    }
  });

  /**
   * @tc.number: TEST_LENGTH_001
   * @tc.name: testLength001
   * @tc.desc: Get the number of elements in the queue instance. For example: queue.length.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 0
   */
  it("testLength001", 0, function () {
    let queue = new Queue();
    queue.add(8);
    queue.add("一");
    queue.add("二");
    queue.add(1);
    queue.add(2);
    queue.add(3);
    queue.add(4);
    queue.add(5);
    queue.add(6);
    let res = queue.length;
    expect(9).assertEqual(res);
  });

  /**
   * @tc.number: TEST_LENGTH_002
   * @tc.name: testLength002
   * @tc.desc: Get the number of elements in the queue instance. For example: queue.length.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 0
   */
  it("testLength001", 0, function () {
    let queue = new Queue();
    let res = queue.length;
    expect(0).assertEqual(res);
  });
});
}
