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
import Deque from "@ohos.util.Deque";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
export default function DequeTest() {
  describe("DequeTest", function () {
    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : testConstructor001
     * @tc.desc  : Create an Deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testConstructor001", 0, function () {
      let deque = new Deque();
      expect(deque != null).assertTrue();
    });

    /**
     * @tc.number: TEST_LENGTH_001
     * @tc.name  : testLength001
     * @tc.desc  : Get the number of elements in the deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 0
     */
    it("testLength001", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      deque.insertEnd(9);
      let size = deque.length;
      expect(size).assertEqual(2);
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_001
     * @tc.name  : testInsertFront001
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront001", 0, function () {
      let deque = new Deque();
      deque.insertFront("一");
      let res = deque.getFirst();
      expect(res).assertEqual("一");
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_002
     * @tc.name  : testInsertFront002
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront002", 0, function () {
      let deque = new Deque();
      deque.insertFront(8);
      let res = deque.getFirst();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_003
     * @tc.name  : testInsertFront003
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront003", 0, function () {
      let deque = new Deque();
      let a = { name: "lala", age: "15" };
      deque.insertFront(a);
      let res = deque.getFirst();
      expect(res).assertEqual(a);
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_004
     * @tc.name  : testInsertFront004
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront004", 0, function () {
      let deque = new Deque();
      deque.insertFront("$");
      let res = deque.getFirst();
      expect(res).assertEqual("$");
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_005
     * @tc.name  : testInsertFront005
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront005", 0, function () {
      let deque = new Deque();
      deque.insertFront(" ");
      let res = deque.getFirst();
      expect(res).assertEqual(" ");
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_006
     * @tc.name  : testInsertFront006
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront006", 0, function () {
      let deque = new Deque();
      deque.insertFront(null);
      let res = deque.getFirst();
      expect(res).assertEqual(null);
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_007
     * @tc.name  : testInsertFront007
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront007", 0, function () {
      let deque = new Deque();
      deque.insertFront(undefined);
      let res = deque.getFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_008
     * @tc.name  : testInsertFront008
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront008", 0, function () {
      let deque = new Deque();
      for (let i = 0; i < 100; i++) {
        deque.insertFront(i);
        let res = deque.getFirst();
        expect(res).assertEqual(i);
      }
      let res1 = deque.length;
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_009
     * @tc.name  : testInsertFront009
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront009", 0, function () {
      let deque = new Deque();
      let a = [1, 2, 3, 4];
      deque.insertFront(a);
      let res = deque.getFirst();
      expect(res).assertEqual(a);
    });

    /**
     * @tc.number: TEST_INSERT_FRONT_010
     * @tc.name  : testInsertFront010
     * @tc.desc  : Add element to deque instance header.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertFront010", 0, function () {
      let deque = new Deque();
      try {
        deque.insertFront.bind({}, "a")();
        expect(true).assertEqual(false);
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The insertFront method cannot be bound`);
      }
    });

    /**
     * @tc.number: TEST_INSERT_END_001
     * @tc.name  : testInsertEnd001
     * @tc.desc  : Add element to deque instance end.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertEnd001", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      let res = deque.getLast();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.number: TEST_INSERT_END_002
     * @tc.name  : testInsertEnd002
     * @tc.desc  : Add element to deque instance end.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertEnd002", 0, function () {
      let deque = new Deque();
      let a = ["a", "b", "c"];
      deque.insertEnd(a);
      let res = deque.getLast();
      expect(res).assertEqual(a);
    });

    /**
     * @tc.number: TEST_INSERT_END_003
     * @tc.name  : testInsertEnd003
     * @tc.desc  : Add element to deque instance end.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertEnd003", 0, function () {
      let deque = new Deque();
      let a = { class: "6班", say: "we" };
      deque.insertEnd(a);
      let res = deque.getLast();
      expect(res).assertEqual(a);
    });

    /**
     * @tc.number: TEST_INSERT_END_004
     * @tc.name  : testInsertEnd004
     * @tc.desc  : Add element to deque instance end.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertEnd004", 0, function () {
      let deque = new Deque();
      deque.insertEnd("$");
      let res = deque.getLast();
      expect(res).assertEqual("$");
    });

    /**
     * @tc.number: TEST_INSERT_END_005
     * @tc.name  : testInsertEnd005
     * @tc.desc  : Add element to deque instance end.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertEnd005", 0, function () {
      let deque = new Deque();
      deque.insertEnd(" ");
      let res = deque.getLast();
      expect(res).assertEqual(" ");
    });

    /**
     * @tc.number: TEST_INSERT_END_006
     * @tc.name  : testInsertEnd006
     * @tc.desc  : Add element to deque instance end.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertEnd006", 0, function () {
      let deque = new Deque();
      deque.insertEnd(null);
      let res = deque.getLast();
      expect(res).assertEqual(null);
    });

    /**
     * @tc.number: TEST_INSERT_END_007
     * @tc.name  : testInsertEnd007
     * @tc.desc  : Add element to deque instance end.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertEnd007", 0, function () {
      let deque = new Deque();
      deque.insertEnd(undefined);
      let res = deque.getLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_INSERT_END_008
     * @tc.name  : testInsertEnd008
     * @tc.desc  : Add element to deque instance end.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testInsertEnd008", 0, function () {
      let deque = new Deque();
      for (let i = 0; i < 100; i++) {
        deque.insertEnd(i);
        let res = deque.getLast();
        expect(res).assertEqual(i);
      }
      let res1 = deque.length;
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.number: TEST_HAS_001
     * @tc.name  : testHas001
     * @tc.desc  : Determine whether the deque instance contains the specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas001", 0, function () {
      let deque = new Deque();
      deque.insertEnd(6);
      let res = deque.has(6);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number: TEST_HAS_002
     * @tc.name  : testHas002
     * @tc.desc  : Determine whether the deque instance contains the specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas002", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      let res = deque.has(6);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_HAS_003
     * @tc.name  : testHas003
     * @tc.desc  : Determine whether the deque instance contains the specified element.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testHas003", 0, function () {
      let deque = new Deque();
      let res = deque.has(6);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number: TEST_GET_FIRST_001
     * @tc.name  : testGetFirst001
     * @tc.desc  : Get the header element of the deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetFirst001", 0, function () {
      let deque = new Deque();
      deque.insertEnd("四");
      deque.insertEnd("三");
      let res = deque.getFirst();
      expect(res).assertEqual("四");
    });

    /**
     * @tc.number: TEST_GET_FIRST_002
     * @tc.name  : testGetFirst002
     * @tc.desc  : Get the header element of the deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetFirst002", 0, function () {
      let deque = new Deque();
      let res = deque.getFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_GET_LAST_001
     * @tc.name  : testGetLast001
     * @tc.desc  : Get the end element of the deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetLast001", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      deque.insertEnd("三");
      let res = deque.getLast();
      expect(res).assertEqual("三");
    });

    /**
     * @tc.number: TEST_GET_LAST_002
     * @tc.name  : testGetLast002
     * @tc.desc  : Get the end element of the deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testGetLast002", 0, function () {
      let deque = new Deque();
      let res = deque.getLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_POP_FIRST_001
     * @tc.name  : testPopFirst001
     * @tc.desc  : Delete the header element of a deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testPopFirst001", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      deque.insertFront("一");
      let res = deque.popFirst();
      expect(res).assertEqual("一");
    });

    /**
     * @tc.number: TEST_POP_FIRST_002
     * @tc.name  : testPopFirst002
     * @tc.desc  : Delete the header element of a deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testPopFirst002", 0, function () {
      let deque = new Deque();
      let res = deque.popFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_POP_LAST_001
     * @tc.name  : testPopLast001
     * @tc.desc  : Delete the end element of a deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testPopLast001", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      deque.insertFront("一");
      deque.insertFront("二");
      let res = deque.popLast();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.number: TEST_POP_LAST_002
     * @tc.name  : testPopLast002
     * @tc.desc  : Delete the end element of a deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testPopLast002", 0, function () {
      let deque = new Deque();
      let res = deque.popLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number: TEST_FOR_EACH_001
     * @tc.name  : testForEach001
     * @tc.desc  : Traversing elements in deque instances.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach001", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      deque.insertFront("一");
      deque.insertFront("二");
      deque.insertEnd(1);
      deque.insertEnd(2);
      deque.insertEnd(3);
      deque.insertEnd(4);
      deque.insertEnd(5);
      deque.insertEnd(6);
      deque.insertFront("三");
      deque.insertFront("四");
      let arr = [];
      deque.forEach((item, index) => {
        arr.push(item);
      });
      let a = ["四", "三", "二", "一", 8, 1, 2, 3, 4, 5, 6];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_FOR_EACH_002
     * @tc.name  : testForEach002
     * @tc.desc  : Traversing elements in deque instances.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testForEach002", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      deque.insertEnd(1);
      deque.insertEnd(2);
      deque.insertEnd(3);
      deque.insertEnd(3);
      deque.insertEnd(4);
      deque.insertEnd(5);
      deque.insertEnd(6);
      deque.popFirst();
      deque.popLast();
      deque.insertFront(8);
      deque.insertEnd(6);
      let arr = [];
      deque.forEach((item, index) => {
        arr.push(item);
      });
      let a = [8, 1, 2, 3, 3, 4, 5, 6];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.number: TEST_ITERATOR_001
     * @tc.name  : testIterator001
     * @tc.desc  : Iterate over all elements in the deque instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("testIterator001", 0, function () {
      let deque = new Deque();
      deque.insertEnd(8);
      deque.insertFront("a");
      deque.insertFront("b");
      deque.insertEnd(5);
      deque.insertEnd(6);
      deque.insertFront("s");
      deque.insertFront("z");
      deque.popFirst();
      deque.popLast();
      deque.insertFront("g");
      deque.insertEnd(6);
      let size = deque.length;
      let arr = [];
      let itr = deque[Symbol.iterator]();
      for (let i = 0; i < size; i++) {
        arr.push(itr.next().value);
      }
      let a = ["g", "s", "b", "a", 8, 5, 6];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });
  });
}
