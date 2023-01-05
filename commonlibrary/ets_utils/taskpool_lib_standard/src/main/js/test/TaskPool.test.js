/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import worker from "@ohos.worker"
export default function TaskPoolTest() {
describe('ActsAbilityTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    it('TaskPoolTestClass001', 0,  async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var result = await taskpool.execute(Sum, 10, 20);
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass002', 0,  async function () {
        function Add(value1, value2) {
            if (value1 & value2)
                return true;
            else
                return false;
        }
        var result = await taskpool.execute(Add, true, true);
        expect(result).assertEqual(true);
        done();
    })

    it('TaskPoolTestClass003', 0,  async function () {
        function StrCat(value1, value2) {
            return value1 + value2;
        }
        var result = await taskpool.execute(StrCat, "abc", "def");
        expect(result).assertEqual("abcdef");
        done();
    })

    it('TaskPoolTestClass004', 0,  async function () {
        function StrCat(value1, value2) {
            return value1 + value2;
        }
        var result = await taskpool.execute(StrCat, "abc", "def");
        result = await taskpool.execute(StrCat, "abc", "def");
        expect(result).assertEqual("abcdef");
        done();
    })

    it('TaskPoolTestClass005', 0,  async function () {
        function Sum(value1, value2) {
            function StrCat(value1, value2) {
                return value1 + value2;
            }
            return value1+StrCat(value2,"hello");
        }
        var result = await taskpool.execute(Sum, "abc", "def");
        expect(result).assertEqual("abcdefhello");
        done();
    })

    it('TaskPoolTestClass006', 0,  async function () {
        function Sum(arg1, arg2) {
            let value = [];
            value[0] = arg1[0] + arg2[0];
            value[1] = arg1[1] + arg2[1];
            return value;
        }
        var result = await taskpool.execute(Sum, [1,2], [3,4]);
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
        done();
    })

    it('TaskPoolTestClass007', 0,  async function () {
        function Sum(arg1, arg2) {
            let value = arg1;
            value.a = arg1.a + arg2.a;
            value.b = arg1.b + arg2.b;
            return value;
        }
        var result = await taskpool.execute(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4});
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
        done();
    })

    it('TaskPoolTestClass008', 0,  async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var result = await taskpool.execute(Sum, 10);
        expect(result.toString()).assertEqual("NaN");
        done();
    })

    it('TaskPoolTestClass009', 0,  async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var result = await taskpool.execute(Sum, 10, 20, 30);
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass010', 0,  async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var result1 = await taskpool.execute(Sum, 10, 20);
        var result2 = await taskpool.execute(Sum, 30, 40);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
        done();
    })

    it('TaskPoolTestClass011', 0,  async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var result1 = await taskpool.execute(Sum, 10, 20);
        var result2 = await taskpool.execute(Sum, 10, 20);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass012', 0,  async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        function Multi(value1, value2) {
            return value1 * value2;
        }
        var result1 = await taskpool.execute(Sum, 10, 20);
        var result2 = await taskpool.execute(Multi, 10, 20);
        var result3 = await taskpool.execute(Sum, 10, 30);
        var result4 = await taskpool.execute(Multi, 20, 20);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(200);
        expect(result3).assertEqual(40);
        expect(result4).assertEqual(400);
        done();
    })

    it('TaskPoolTestClass013', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20);
        var result = await taskpool.execute(task);
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass014', 0, async function () {
        function Add(value1, value2) {
            if (value1 & value2)
                return true;
            else
                return false;
        }
        var task = new taskpool.Task(Add, true, true);
        var result = await taskpool.execute(task);
        expect(result).assertEqual(true);
        done();
    })

    it('TaskPoolTestClass015', 0,  async function () {
        function StrCat(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(StrCat, "abc", "def");
        var result = await taskpool.execute(task);
        expect(result).assertEqual("abcdef");
        done();
    })

    it('TaskPoolTestClass016', 0,  async function () {
        function Sum(value1, value2) {
            function StrCat(value1, value2) {
                return value1 + value2;
            }
            return value1+StrCat(value2,"hello");
        }
        var task = new taskpool.Task(Sum, "abc", "def");
        var result = await taskpool.execute(task);
        expect(result).assertEqual("abcdefhello");
        done();
    })

    it('TaskPoolTestClass017', 0, async function () {
        function Sum(arg1, arg2) {
            let value = [];
            value[0] = arg1[0] + arg2[0];
            value[1] = arg1[1] + arg2[1];
            return value;
        }
        var task = new taskpool.Task(Sum, [1,2], [3,4]);
        var result = await taskpool.execute(task);
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
        done();
    })

    it('TaskPoolTestClass018', 0, async function () {
        function Sum(arg1, arg2) {
            let value = arg1;
            value.a = arg1.a + arg2.a;
            value.b = arg1.b + arg2.b;
            return value;
        }
        var task = new taskpool.Task(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4});
        var result = await taskpool.execute(task);
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
        done();
    })

    it('TaskPoolTestClass019', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10);
        var result = await taskpool.execute(task);
        expect(result.toString()).assertEqual("NaN");
        done();
    })

    it('TaskPoolTestClass020', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20, 30);
        var result = await taskpool.execute(task);
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass021', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20);
        var result1 = await taskpool.execute(task);
        var result2 = await taskpool.execute(task);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass022', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20);
        var task2 = new taskpool.Task(Sum, 30, 40);
        var result1 = await taskpool.execute(task1);
        var result2 = await taskpool.execute(task2);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
        done();
    })

    it('TaskPoolTestClass023', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20);
        var task2 = new taskpool.Task(Sum, 10, 20);
        var result1 = await taskpool.execute(task1);
        var result2 = await taskpool.execute(task2);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass024', 0,  async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        function Multi(value1, value2) {
            return value1 * value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20);
        var result1 = await taskpool.execute(task1);
        var task2 = new taskpool.Task(Multi, 10, 20);
        var result2 = await taskpool.execute(task2);
        var task3 = new taskpool.Task(Sum, 10, 30);
        var result3 = await taskpool.execute(task3);
        var task4 = new taskpool.Task(Multi, 20, 20);
        var result4 = await taskpool.execute(task4);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(200);
        expect(result3).assertEqual(40);
        expect(result4).assertEqual(400);
        done();
    })

    it('TaskPoolTestClass025', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task).then((ret) => {
            expect(ret).assertEqual(30);
        })
        done();
    })

    it('TaskPoolTestClass026', 0, async function () {
        function Add(value1, value2) {
            if (value1 & value2)
                return true;
            else
                return false;
        }
        var task = new taskpool.Task(Add, true, true)
        taskpool.execute(task).then((ret) => {
            expect(ret).assertEqual(true);
        })
        done();
    })

    it('TaskPoolTestClass027', 0, async function () {
        function StrCat(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(StrCat, "abc", "def")
        taskpool.execute(task).then((ret) => {
            expect(ret).assertEqual("abcdef");
        })
        done();
    })

    it('TaskPoolTestClass028', 0,  async function () {
        function Sum(value1, value2) {
            function StrCat(value1, value2) {
                return value1 + value2;
            }
            return value1+StrCat(value2,"hello");
        }
        var task = new taskpool.Task(Sum, "abc", "def");
        taskpool.execute(task).then((ret) => {
            expect(ret).assertEqual("abcdefhello");
        })
        done();
    })

    it('TaskPoolTestClass029', 0, async function () {
        function Sum(arg1, arg2) {
            let value = [];
            value[0] = arg1[0] + arg2[0];
            value[1] = arg1[1] + arg2[1];
            return value;
        }
        var task = new taskpool.Task(Sum, [1,2], [3,4]);
        taskpool.execute(task).then((ret) => {
            expect(ret[0]).assertEqual(4);
            expect(ret[1]).assertEqual(6);
        })
        done();
    })

    it('TaskPoolTestClass030', 0, async function () {
        function Sum(arg1, arg2) {
            let value = arg1;
            value.a = arg1.a + arg2.a;
            value.b = arg1.b + arg2.b;
            return value;
        }
        var task = new taskpool.Task(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4});
        taskpool.execute(task).then((ret) => {
            expect(JSON.stringify(ret)).assertEqual("{\"a\":4,\"b\":6}");
        })
        done();
    })

    it('TaskPoolTestClass031', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10);
        taskpool.execute(task).then((ret) => {
            expect(ret).assertEqual(NaN);
        })
        done();
    })

    it('TaskPoolTestClass032', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20, 30);
        taskpool.execute(task).then((ret) => {
            expect(ret).assertEqual(30);
        })
        done();
    })

    it('TaskPoolTestClass033', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20);
        taskpool.execute(task1).then((ret1) => {
            expect(ret1).assertEqual(30);
        })

        var task2 = new taskpool.Task(Sum, 30, 40);
        taskpool.execute(task2).then((ret2) => {
            expect(ret2).assertEqual(70);
        })
        done();
    })

    it('TaskPoolTestClass034', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task1).then((ret1) => {
            expect(ret1).assertEqual(30);
        })

        var task2 = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task2).then((ret2) => {
            expect(ret2).assertEqual(30);
        })
        done();
    })

    it('TaskPoolTestClass035', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task).then((ret1) => {
            expect(ret1).assertEqual(30);
        })
        taskpool.execute(task).then((ret2) => {
            expect(ret2).assertEqual(30);
        })
        done();
    })

    it('TaskPoolTestClass036', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        function Multi(value1, value2) {
            return value1 * value2;
        }

        var task1 = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task1).then((ret1) => {
            expect(ret1).assertEqual(30);
        })
        var task2 = new taskpool.Task(Multi, 10, 20)
        taskpool.execute(task2).then((ret2) => {
            expect(ret2).assertEqual(200);
        })
        var task3 = new taskpool.Task(Sum, 10, 30)
        taskpool.execute(task3).then((ret3) => {
            expect(ret3).assertEqual(40);
        })
        var task4 = new taskpool.Task(Multi, 20, 20)
        taskpool.execute(task4).then((ret4) => {
            expect(ret4).assertEqual(400);
        })
        done();
    })

    it('TaskPoolTestClass037', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        taskpool.execute(Sum, 10, 20).then((ret) => {
            expect(ret).assertEqual(30);
        })
        done();
    })

    it('TaskPoolTestClass038', 0, async function () {
        function Add(value1, value2) {
            if (value1 & value2)
                return true;
            else
                return false;
        }
        taskpool.execute(Add, true, false).then((ret) => {
            expect(ret).assertEqual(false);
        })
        done();
    })

    it('TaskPoolTestClass039', 0, async function () {
        function StrCat(value1, value2) {
            return value1 + value2;
        }
        taskpool.execute(StrCat, "abc", "def").then((ret) => {
            expect(ret).assertEqual("abcdef");
        })
        done();
    })

    it('TaskPoolTestClass040', 0,  async function () {
        function Sum(value1, value2) {
            function StrCat(value1, value2) {
                return value1 + value2;
            }
            return value1+StrCat(value2,"hello");
        }
        taskpool.execute(Sum, "abc", "def").then((ret) => {
            expect(ret).assertEqual("abcdefhello");
        })
        done();
    })

    it('TaskPoolTestClass041', 0, async function () {
        function Sum(arg1, arg2) {
            let value = [];
            value[0] = arg1[0] + arg2[0];
            value[1] = arg1[1] + arg2[1];
            return value;
        }
        taskpool.execute(Sum, [1,2], [3,4]).then((ret) => {
            expect(ret[0]).assertEqual(4);
            expect(ret[1]).assertEqual(6);
        })
        done();
    })

    it('TaskPoolTestClass042', 0, async function () {
        function Sum(arg1, arg2) {
            let value = arg1;
            value.a = arg1.a + arg2.a;
            value.b = arg1.b + arg2.b;
            return value;
        }
        taskpool.execute(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4}).then((ret) => {
            expect(JSON.stringify(ret)).assertEqual("{\"a\":4,\"b\":6}");
        })
        done();
    })

    it('TaskPoolTestClass043', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        taskpool.execute(Sum, 10).then((ret) => {
            expect(ret).assertEqual(NaN);
        })
        done();
    })

    it('TaskPoolTestClass044', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        taskpool.execute(Sum, 10, 20, 30).then((ret) => {
            expect(ret).assertEqual(30);
        })
        done();
    })

    it('TaskPoolTestClass045', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        taskpool.execute(Sum, 10, 20).then((ret1) => {
            expect(ret1).assertEqual(30);
        })
        taskpool.execute(Sum, 30, 40).then((ret2) => {
            expect(ret2).assertEqual(70);
        })
        done();
    })

    it('TaskPoolTestClass046', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        taskpool.execute(Sum, 10, 20).then((ret1) => {
            expect(ret1).assertEqual(30);
        })
        taskpool.execute(Sum, 10, 20).then((ret2) => {
            expect(ret2).assertEqual(30);
        })
        done();
    })

    it('TaskPoolTestClass047', 0, async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        function Multi(value1, value2) {
            return value1 * value2;
        }

        taskpool.execute(Sum, 10, 20).then((ret1) => {
            expect(ret1).assertEqual(30);
        })
        taskpool.execute(Multi, 10, 20).then((ret2) => {
            expect(ret2).assertEqual(200);
        })
        taskpool.execute(Sum, 10, 30).then((ret3) => {
            expect(ret3).assertEqual(40);
        })
        taskpool.execute(Multi, 20, 20).then((ret4) => {
            expect(ret4).assertEqual(400);
        })
        done();
    })

    it('TaskPoolTestClass048', 0,  async function () {
        function Sum(value1, value2) {
            return value1 + value2;
        }
        try {
            var result = await taskpool.execute(Sum);
        } catch(e) {
            expect(e.toString()).assertEqual("BusinessError: taskpool:: first param must be object when argc is one");
        }
        done();
    })
})
}