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
import ArrayList from '@ohos.util.ArrayList';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';


export default function ArraylistTest() {
    describe("ArraylistTest", function () {
        /**
         * @tc.number: SUB_Arraylist_JSTest_0010
         * @tc.name: testConstructor001
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: testConstructor
         */
        it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0020
         * @tc.name: testAdd002
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a string type element to the end of the ArrayList instance. For example: arrayList.add("四").
         */
        it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            let arrayList = new ArrayList();
            arrayList.add("四");
            let res = arrayList.has("四");
            expect(res).assertEqual(true);
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0030
         * @tc.name: testAdd003
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a number type element to the end of the ArrayList instance. For example: arrayList.add(8).
         */
        it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            let arrayList = new ArrayList();
            arrayList.add(8);
            let res = arrayList.has(8);
            expect(res).assertEqual(true);
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0040
         * @tc.name: testAdd004
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a object type element to the end of the ArrayList instance.
         */
        it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            let arrayList = new ArrayList();
            let a = {
                name: "lala", age: "13岁"
            };
            arrayList.add(a);
            let res = arrayList.has(a);
            expect(res).assertEqual(true);
        });


        /**
         * @tc.number: SUB_Arraylist_JSTest_0050
         * @tc.name: testAdd005
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a array type element to the end of the ArrayList instance.
         */
        it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            let arrayList = new ArrayList();
            let a = [1, 2, 3, 4];
            arrayList.add(a);
            let res = arrayList.has(a);
            expect(res).assertEqual(true);
        });


        /**
         * @tc.number: SUB_Arraylist_JSTest_0060
         * @tc.name: testAdd006
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a boolean type element to the end of the ArrayList instance.
         */
        it("testAdd006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            let arrayList = new ArrayList();
            let a = true;
            arrayList.add(a);
            let res = arrayList.has(a);
            expect(res).assertEqual(true);
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0070
         * @tc.name: testInsert007
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a boolean type element to the end of the ArrayList instance.
         */
        it("testInsert007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0080
         * @tc.name: testLength008
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Get the number of elements contained in the ArrayList instance. For example: arrayList.length.
         */
        it("testLength008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0090
         * @tc.name: testHas009
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Get the number of elements contained in the ArrayList instance. For example: arrayList.length.
         */
        it("testHas009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0010
         * @tc.name: testGetIndexOf010
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: In the ArrayList instance, find the index of a specified element from front to back,
         */
        it("testGetIndexOf010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0011
         * @tc.name: testRemoveByIndex011
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: In the ArrayList instance, delete the element based on its index.
         */
        it("testRemoveByIndex011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0012
         * @tc.name: testRemove012
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: In the ArrayList instance, delete the element based on its index.
         */
        it("testRemove012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0013
         * @tc.name: testGetLastIndexOf013
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: In the ArrayList instance, find the index of a specified element from brack to front,
         */
        it("testGetLastIndexOf013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0014
         * @tc.name: testRemoveByRange014
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Deletes elements from a specified range, including elements at the start position and
         */
        it("testRemoveByRange014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0015
         * @tc.name: testReplaceAllElements015
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Deletes elements from a specified range, including elements at the start position and
         */
        it("testReplaceAllElements015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            let arrayList = new ArrayList();
            arrayList.add(4);
            arrayList.add(3);
            arrayList.add(1);
            arrayList.add(2);
            arrayList.add(14);
            arrayList.replaceAllElements((item, index) => {
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
         * @tc.number: SUB_Arraylist_JSTest_0016
         * @tc.name: testForEach016
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Traversing elements in an ArrayList instance.
         */
        it("testForEach016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0017
         * @tc.name: testSubArrayList017
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Traversing elements in an ArrayList instance.
         */
        it("testSubArrayList017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0018
         * @tc.name: testClear018
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Traversing elements in an ArrayList instance.
         */
        it("testClear018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0019
         * @tc.name: testConvertToArray19
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Traversing elements in an ArrayList instance.
         */
        it("testConvertToArray19", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0020
         * @tc.name: testClone020
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Clone an ArrayList instance. For example: arrayList.clone().
         */
        it("testClone020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0021
         * @tc.name: testGetCapacity021
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: testGetCapacity
         */
        it("testGetCapacity021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0022
         * @tc.name: testGetCapacity022
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Get the capacity of the ArrayList instance after capacity expansion.
         */
        it("testGetCapacity022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0023
         * @tc.name: testIncreaseCapacityTo023
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Get the capacity of the ArrayList instance after capacity expansion.
         */
        it("testIncreaseCapacityTo023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0024
         * @tc.name: testTrimToCurrentLength024
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Get the capacity of the ArrayList instance after capacity expansion.
         */
        it("testTrimToCurrentLength024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0025
         * @tc.name: testIterator025
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Iterates over all elements in an ArrayList instance.
         */
        it("testIterator025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            let arrayList = new ArrayList();
            arrayList.add(8);
            arrayList.add("一");
            arrayList.add("二");
            arrayList.add(5);
            let c = [1, 2, 3, 4];
            arrayList.add(c);
            arrayList.add(6);
            arrayList.add("三");
            arrayList.add("四");
            let arr = [];
            for (let item of arrayList) {
                arr.push(item);
            }
            let a = [8, "一", "二", 5, c, 6, "三", "四"];
            for (let i = 0; i < a.length; i++) {
                expect(arr[i]).assertEqual(a[i]);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0026
         * @tc.name: testSort026
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Arrange the elements in the ArrayList instance in descending order.
         */
        it("testSort026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            let arrayList = new ArrayList();
            arrayList.add(4);
            arrayList.add(3);
            arrayList.add(1);
            arrayList.add(2);
            arrayList.add(14);
            arrayList.sort((a, b) => a - b);
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
         * @tc.number: SUB_Arraylist_JSTest_0027
         * @tc.name: testInsert0027
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Inserting an element with an index less than 0 will throw an exception.
         */
        it("testInsert0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: -1`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0028
         * @tc.name: testInsert028
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Inserting an element with an index greater than or equal to the length of
         */
        it("testInsert028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 10`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0029
         * @tc.name: testInsert029
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Inserting an element with an index greater than or equal to the length of
         */
        it("testInsert029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 11`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0030
         * @tc.name: testIsEmpty030
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Inserting an element with an index greater than or equal to the length of
         */
        it("testIsEmpty030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0031
         * @tc.name: testIsEmpty031
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Inserting an element with an index greater than or equal to the length of
         */
        it("testIsEmpty031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0032
         * @tc.name: testHas032
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Check whether the ArrayList contains a specified element. For example: arrayList.has("二").
         */
        it("testHas032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0033
         * @tc.name: testGetIndexOf033
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: In the ArrayList instance, find the index of a specified element from front to back,
         * and return the index found for the first time. If not found, return -1. For example: arrayList.getIndexOf("A").
         */
        it("testGetIndexOf033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0034
         * @tc.name: testRemove034
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Delete the specified element.For example: arrayList.remove("A").
         */
        it("testRemove034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add("四");
            arrayList.add("三");
            arrayList.add(1);
            arrayList.add("a");
            let res = arrayList.remove("A");
            expect(res).assertEqual(false);
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0035
         * @tc.name: testRemove035
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Delete the specified element.
         */
        it("testRemove035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0036
         * @tc.name: testRemoveByIndex036
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: In the ArrayList instance, delete the element based on its index index.
         */
        it("testRemoveByIndex036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 5`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0037
         * @tc.name: testRemoveByRange037
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a string element to the end of the ArrayList instance. For example: arrayList.add("四").
         */
        it("testRemoveByRange037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 0. Received value is: 3`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0038
         * @tc.name: testRemoveByRange038
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: In the ArrayList instance, delete the element based on its index index.
         */
        it("testRemoveByRange038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0039
         * @tc.name: testRemoveByRange039
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Deletes elements from a specified range, including elements at the start position and
         * elements at the end position. For example: removeByRange(0, 7).
         */
        it("testRemoveByRange039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0040
         * @tc.name: testSubArrayList040
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Intercepts an element within the specified range, including the element with the
         * starting index but not the element with the ending index. For example: arrayList.subArrayList(4, 2).
         */
        it("testSubArrayList040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 1. Received value is: 4`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0041
         * @tc.name: testSubArrayList041
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Intercepts an element within the specified range, including the element with the
         * starting index but not the element with the ending index. For example: arrayList.subArrayList(0 ,6).
         */
        it("testSubArrayList041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0042
         * @tc.name: testSubArrayList042
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: testRemoveByRange
         */
        it("testSubArrayList042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0043
         * @tc.name: testIncreaseCapacityTo043
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Expand the ArrayList instance capacity to the specified value.
         */
        it("testIncreaseCapacityTo043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0044
         * @tc.name: testIncreaseCapacityTo044
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Expand the ArrayList instance capacity to the specified value.
         */
        it("testIncreaseCapacityTo044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add(4);
            arrayList.add(3);
            arrayList.add(1);
            arrayList.add(2);
            arrayList.add(14);
            try {
                let res = arrayList.increaseCapacityTo();
                expect(true).assertEqual(false);
            } catch (err) {
                expect(err.name).assertEqual("BusinessError");
                expect(err.code).assertEqual(401);
                expect(err.message)
                    .assertEqual(`The type of "newCapacity" must be number. Received value is: undefined`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0045
         * @tc.name: testAdd045
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a string element to the end of the ArrayList instance.
         */
        it("testAdd045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0046
         * @tc.name: testAdd046
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a symbol type element to the end of the ArrayList instance.
         */
        it("testAdd046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            let a = "*";
            arrayList.add(a);
            let res = arrayList.has(a);
            expect(res).assertEqual(true);
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0047
         * @tc.name: testAdd047
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: Add a decimal type to the end of the ArrayList instance. For example: let a = "3.14";arrayList.add(a).
         */
        it("testAdd047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            let a = "3.14";
            arrayList.add(a);
            let res = arrayList.has(a);
            expect(res).assertEqual(true);
        });


        /**
         * @tc.number: SUB_Arraylist_JSTest_0048
         * @tc.name: testAdd048
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Add a null character element to the end of the ArrayList instance.
         */
        it("testAdd048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            let a = "";
            arrayList.add(a);
            let res = arrayList.has(a);
            expect(res).assertEqual(true);
        });


        /**
         * @tc.number: SUB_Arraylist_JSTest_0049
         * @tc.name: testSort049
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Arrange the elements in the ArrayList instance in descending order.
         */
        it("testSort049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add("刘");
            arrayList.add("张三");
            arrayList.add(1);
            arrayList.add(2);
            arrayList.add("李四");
            arrayList.sort((a, b) => a - b);
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
         * @tc.number: SUB_Arraylist_JSTest_0050
         * @tc.name: testSort050
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Arrange the elements in the ArrayList instance in descending order.
         */
        it("testSort050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add("c");
            arrayList.add("a");
            arrayList.add("b");
            arrayList.add("e");
            arrayList.add("d");
            arrayList.sort((a, b) => a - b);
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
         * @tc.number: SUB_Arraylist_JSTest_0051
         * @tc.name: testIterator051
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: testIterator
         */
        it("testIterator051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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

        /**
         * @tc.number: SUB_Arraylist_JSTest_0052
         * @tc.name: testRemoveByRange052
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Deletes elements from a specified range, including elements at the start position and
         * elements at the end position. For example: removeByRange(0, 8).
         */
        it("testRemoveByRange052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
                expect(err.message)
                    .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: 9`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0053
         * @tc.name: testAdd053
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Add a boolean type element to the end of the ArrayList instance.
         */
        it("testAdd053 ", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0054
         * @tc.name: testInsert054
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Inserting an element with an index greater than or equal to the length of
         * the ArrayList instance will throw an exception. For example: arrayList.insert("a", -2).
         */
        it("testInsert054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add(1);
            try {
                let res = arrayList.insert("a", "b");
                expect(true).assertEqual(false);
            } catch (err) {
                expect(err.name).assertEqual("BusinessError");
                expect(err.code).assertEqual(401);
                expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: b`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0055
         * @tc.name: testRemoveByIndex055
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: In the ArrayList instance, delete the element based on its index index..
         */
        it("testRemoveByIndex055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add("a");
            arrayList.add("b");
            arrayList.add("c");
            arrayList.add("a");
            arrayList.add("b");
            try {
                let res = arrayList.removeByIndex("a");
                expect(true).assertEqual(false);
            } catch (err) {
                expect(err.name).assertEqual("BusinessError");
                expect(err.code).assertEqual(401);
                expect(err.message).assertEqual(`The type of "index" must be small integer. Received value is: a`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0056
         * @tc.name: testRemoveByRange056
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Deletes elements from a specified range, including elements at the start position and
         * elements at the end position. For example: arrayList.removeByRange(-3, 9).
         */
        it("testRemoveByRange056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add(1);
            arrayList.add("a");
            try {
                arrayList.removeByRange("a", 9);
                expect(true).assertEqual(false);
            } catch (err) {
                expect(err.name).assertEqual("BusinessError");
                expect(err.code).assertEqual(401);
                expect(err.message).assertEqual(`The type of "fromIndex" must be number. Received value is: a`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0057
         * @tc.name: testReplaceAllElements057
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Perform some operation on the elements in the ArrayList instance and return the ArrayList instance
         * after the operation. For example: arrayList.replaceAllElements(123).
         */
        it("testReplaceAllElements057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add(4);
            arrayList.add(3);
            try {
                arrayList.replaceAllElements(123);
                expect(true).assertEqual(false);
            } catch (err) {
                expect(err.name).assertEqual("BusinessError");
                expect(err.code).assertEqual(401);
                expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 123`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0058
         * @tc.name: testSubArrayList058
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Intercepts an element within the specified range, including the element with the
         * starting index but not the element with the ending index. For example: arrayList.subArrayList("a", 2).
         */
        it("testSubArrayList058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            arrayList.add(4);
            arrayList.add(3);
            arrayList.add(1);
            arrayList.add(2);
            arrayList.add(14);
            try {
                arrayList.subArrayList("a", 2);
                expect(true).assertEqual(false);
            } catch (err) {
                expect(err.name).assertEqual("BusinessError");
                expect(err.code).assertEqual(401);
                expect(err.message).assertEqual(`The type of "fromIndex" must be number. Received value is: a`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0059
         * @tc.name: testHas059
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Check whether the ArrayList contains a specified element.
         */
        it('testHas059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0060
         * @tc.name: testRemoveByIndex060
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: In the ArrayList instance, delete the element based on its index.
         */
        it('testRemoveByIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0061
         * @tc.name: testRemove061
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: In the ArrayList instance, delete the element based on its subscript index.
         * For example: linkedList.removeByIndex(0).
         */
        it('testRemove061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0062
         * @tc.name: testForEach062
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Traversing elements in an ArrayList instance.
         */
        it('testForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0063
         * @tc.name: testForEach063
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc:Traversing elements in an ArrayList instance.
         */
        it('testForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            try {
                arrayList.forEach(11);
                expect(true).assertEqual(false);
            } catch (err) {
                expect(err.name).assertEqual("BusinessError");
                expect(err.code).assertEqual(401);
                expect(err.message).assertEqual(`The type of "callbackfn" must be callable. Received value is: 11`);
            }
        });

        /**
         * @tc.number: SUB_Arraylist_JSTest_0064
         * @tc.name: testClear064
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Clear all elements in the ArrayList instance. For example: arrayList.clear.bind({}, "a")().
         */
        it('testClear064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0065
         * @tc.name: testIsEmpty065
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 1
         * @tc.desc: Determine whether the ArrayList instance is empty. For example: arrayList.isEmpty.bind({}, "a")().
         */
        it('testIsEmpty065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
         * @tc.number: SUB_Arraylist_JSTest_0066
         * @tc.name: testRemoveByIndex066
         * @tc.size: MEDIUMTEST
         * @tc.type: Function
         * @tc.level: Level 0
         * @tc.desc: In the ArrayList instance, delete the element based on its subscript index.
         * For example: linkedList.removeByIndex(0).
         */
        it("testRemoveByIndex066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            let arrayList = new ArrayList();
            try {
                let res = arrayList.removeByIndex(0);
                expect(true).assertEqual(false);
            } catch (err) {
                expect(err.name).assertEqual("BusinessError");
                expect(err.code).assertEqual(10200001);
                expect(err.message).assertEqual("Container is empty");
            }
        });
    }
    );
}
