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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import List from '@ohos.util.List'
export default function TaskPoolTest() {
    describe('TaskPoolTest', function () {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.

        function promiseCase() {
            let p = new Promise<void>(function (resolve, reject) {
                setTimeout(function () {
                    resolve()
                }, 100)
            }).then(undefined, (error) => {
            })
            return p
        }

        /**
         * @tc.number    : TEST_TASK_CONSTRUCTOR_001
         * @tc.name      : testTaskConstructor001
         * @tc.desc      : Create a Task instance. For example: let task = new taskpool.Task(function, args).
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskConstructor001', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10,20);
            var result = await taskpool.execute(task);
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_CONSTRUCTOR_002
         * @tc.name      : testTaskConstructor001
         * @tc.desc      : Create a Task instance. For example: let task = new taskpool.Task(function, args).
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskConstructor002', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10);
            var result = await taskpool.execute(task);
            expect(result.toString()).assertEqual("NaN");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_CONSTRUCTOR_003
         * @tc.name      : testTaskConstructor003
         * @tc.desc      : Create a Task instance. For example: let task = new taskpool.Task(function, args).
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskConstructor003', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10,20,30);
            var result = await taskpool.execute(task);
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_SET_TRANSFER_LIST_001
         * @tc.name      : testTaskSetTransferList001
         * @tc.desc      : To test Task SetTransferLis
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskSetTransferList001', 0,  async function (done) {
            let buffer = new ArrayBuffer(8);
            let view = new Uint8Array(buffer);
            let buffer1 = new ArrayBuffer(16);
            let view1 = new Uint8Array(buffer1);

            function testTransfer(arg1, arg2) {
                "use concurrent"
                return arg1.byteLength + arg2.byteLength;
            }
            let task = new taskpool.Task(testTransfer, view, view1);
            task.setTransferList([view.buffer, view1.buffer]);
            taskpool.execute(task).then((res)=>{
                expect(res).assertEqual(24);
            });
            done();
        })

        /**
         * @tc.number    : TEST_TASK_GROUP_CONSTRUCTOR_001
         * @tc.name      : testTaskGroupConstructor001
         * @tc.desc      : Create a TaskGroup instance
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskGroupConstructor001', 0,  async function (done) {
            try {
                let taskgroup = new taskpool.TaskGroup();
                expect(taskgroup != undefined).assertEqual(true);
                done();
            } catch (err) {
                expect(err.name).assertEqual("TypeError");
                expect(err.code).assertEqual(undefined);
                expect(err.message).assertEqual("Constructor is false");
            }
        })

        /**
         * @tc.number    : TEST_TASK_GROUP_ADD_TASK_001
         * @tc.name      : testTaskGroupAddTask001
         * @tc.desc      : To test TaskGroup function addTask
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskGroupAddTask001', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            let task1 = new taskpool.Task(Sum,10,20);
            let task2 = new taskpool.Task(Sum,10,20);
            let task3 = new taskpool.Task(Sum,10,20);
            let taskgroup = new taskpool.TaskGroup();
            taskgroup.addTask(task1);
            taskgroup.addTask(task2);
            taskgroup.addTask(task3);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_GROUP_ADD_TASK_002
         * @tc.name      : testTaskGroupAddTask002
         * @tc.desc      : To test TaskGroup function addTask
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskGroupAddTask002', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            let taskgroup = new taskpool.TaskGroup();
            taskgroup.addTask(Sum,10,20);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_001
         * @tc.name      : testTaskPoolExecute001
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute001', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result = await taskpool.execute(Sum, 10, 20);
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_002
         * @tc.name      : testTaskPoolExecute002
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute002', 0,  async function (done) {
            function Add(value1, value2) {
                "use concurrent"
                if (value1 & value2)
                    return true;
                else
                    return false;
            }
            var result = await taskpool.execute(Add, true, true);
            expect(result).assertEqual(true);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_003
         * @tc.name      : testTaskPoolExecute003
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute003', 0,  async function (done) {
            function StrCat(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result = await taskpool.execute(StrCat, "abc", "def");
            expect(result).assertEqual("abcdef");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_004
         * @tc.name      : testTaskPoolExecute004
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute004', 0,  async function (done) {
            function StrCat(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result = await taskpool.execute(StrCat, "abc", "def");
            result = await taskpool.execute(StrCat, "abc", "def");
            expect(result).assertEqual("abcdef");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_005
         * @tc.name      : testTaskPoolExecute002
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute005', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                function StrCat(value1, value2) {
                    return value1 + value2;
                }
                return value1+StrCat(value2,"hello");
            }
            var result = await taskpool.execute(Sum, "abc", "def");
            expect(result).assertEqual("abcdefhello");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_006
         * @tc.name      : testTaskPoolExecute006
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute006', 0,  async function (done) {
            function Sum(arg1, arg2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_007
         * @tc.name      : testTaskPoolExecute007
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute007', 0,  async function (done) {
            function Sum(arg1, arg2) {
                "use concurrent"
                let value = arg1;
                value.a = arg1.a + arg2.a;
                value.b = arg1.b + arg2.b;
                return value;
            }
            var result = await taskpool.execute(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4});
            expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_008
         * @tc.name      : testTaskPoolExecute008
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute008', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result = await taskpool.execute(Sum, 10);
            expect(result.toString()).assertEqual("NaN");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_009
         * @tc.name      : testTaskPoolExecute009
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute009', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result = await taskpool.execute(Sum, 10, 20, 30);
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_010
         * @tc.name      : testTaskPoolExecute010
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute010', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result1 = await taskpool.execute(Sum, 10, 20);
            var result2 = await taskpool.execute(Sum, 30, 40);
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(70);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_011
         * @tc.name      : testTaskPoolExecute011
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute011', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result1 = await taskpool.execute(Sum, 10, 20);
            var result2 = await taskpool.execute(Sum, 10, 20);
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_012
         * @tc.name      : testTaskPoolExecute012
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute012', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            function Multi(value1, value2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_013
         * @tc.name      : testTaskPoolExecute013
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute013', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10, 20);
            var result = await taskpool.execute(task);
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_014
         * @tc.name      : testTaskPoolExecute014
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute014', 0, async function (done) {
            function Add(value1, value2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_015
         * @tc.name      : testTaskPoolExecute015
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute015', 0,  async function (done) {
            function StrCat(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(StrCat, "abc", "def");
            var result = await taskpool.execute(task);
            expect(result).assertEqual("abcdef");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_016
         * @tc.name      : testTaskPoolExecute016
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute016', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_017
         * @tc.name      : testTaskPoolExecute017
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute017', 0, async function (done) {
            function Sum(arg1, arg2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_018
         * @tc.name      : testTaskPoolExecute018
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute018', 0, async function (done) {
            function Sum(arg1, arg2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_019
         * @tc.name      : testTaskPoolExecute019
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute019', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10);
            var result = await taskpool.execute(task);
            expect(result.toString()).assertEqual("NaN");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_020
         * @tc.name      : testTaskPoolExecute020
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute020', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10, 20, 30);
            var result = await taskpool.execute(task);
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_021
         * @tc.name      : testTaskPoolExecute021
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute021', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10, 20);
            var result1 = await taskpool.execute(task);
            var result2 = await taskpool.execute(task);
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_022
         * @tc.name      : testTaskPoolExecute022
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute022', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_023
         * @tc.name      : testTaskPoolExecute023
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute023', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_024
         * @tc.name      : testTaskPoolExecute024
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute024', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            function Multi(value1, value2) {
                "use concurrent"
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

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_025
         * @tc.name      : testTaskPoolExecute025
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute025', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result;
            var isTerminate = false;
            var task = new taskpool.Task(Sum, 10, 20)
            taskpool.execute(task).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_026
         * @tc.name      : testTaskPoolExecute026
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute026', 0, async function (done) {
            function Add(value1, value2) {
                "use concurrent"
                if (value1 & value2)
                    return true;
                else
                    return false;
            }
            var task = new taskpool.Task(Add, true, true)
            var isTerminate = false;
            var result;
            taskpool.execute(task).then((ret) => {
                isTerminate = true;
                result = ret;
            });

            while (!isTerminate) {
                await promiseCase();
            }

            expect(result).assertEqual(true);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_027
         * @tc.name      : testTaskPoolExecute027
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute027', 0, async function (done) {
            function StrCat(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(StrCat, "abc", "def")
            var result;
            var isTerminate = false;
            taskpool.execute(task).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual("abcdef");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_028
         * @tc.name      : testTaskPoolExecute028
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute028', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                function StrCat(value1, value2) {
                    return value1 + value2;
                }
                return value1+StrCat(value2,"hello");
            }
            var task = new taskpool.Task(Sum, "abc", "def");
            var result;
            var isTerminate = false;
            taskpool.execute(task).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual("abcdefhello");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_029
         * @tc.name      : testTaskPoolExecute029
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute029', 0, async function (done) {
            function Sum(arg1, arg2) {
                "use concurrent"
                let value = [];
                value[0] = arg1[0] + arg2[0];
                value[1] = arg1[1] + arg2[1];
                return value;
            }
            var task = new taskpool.Task(Sum, [1,2], [3,4]);
            var result;
            var isTerminate = false;
            taskpool.execute(task).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result[0]).assertEqual(4);
            expect(result[1]).assertEqual(6);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_030
         * @tc.name      : testTaskPoolExecute030
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute030', 0, async function (done) {
            function Sum(arg1, arg2) {
                "use concurrent"
                let value = arg1;
                value.a = arg1.a + arg2.a;
                value.b = arg1.b + arg2.b;
                return value;
            }
            var task = new taskpool.Task(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4});
            var result;
            var isTerminate = false;
            taskpool.execute(task).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_031
         * @tc.name      : testTaskPoolExecute031
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('TaskPoolTestClass031', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10);
            var result;
            var isTerminate = false;
            taskpool.execute(task).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result.toString()).assertEqual("NaN");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_032
         * @tc.name      : testTaskPoolExecute032
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute032', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task = new taskpool.Task(Sum, 10, 20, 30);
            var result;
            var isTerminate = false;
            taskpool.execute(task).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_033
         * @tc.name      : testTaskPoolExecute033
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute033', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result1;
            var result2;
            var isTerminate1 = false;
            var isTerminate2 = false;

            var task1 = new taskpool.Task(Sum, 10, 20);
            taskpool.execute(task1).then((ret1) => {
                result1 = ret1;
                isTerminate1 = true;
            })

            var task2 = new taskpool.Task(Sum, 30, 40);
            taskpool.execute(task2).then((ret2) => {
                result2 = ret2;
                isTerminate2 = true;
            })
            while (!isTerminate1 || !isTerminate2) {
                await promiseCase()
            }
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(70);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_034
         * @tc.name      : testTaskPoolExecute034
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute034', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result1;
            var result2;
            var isTerminate1 = false;
            var isTerminate2 = false;

            var task1 = new taskpool.Task(Sum, 10, 20)
            taskpool.execute(task1).then((ret1) => {
                result1 = ret1;
                isTerminate1 = true;
            })
            var task2 = new taskpool.Task(Sum, 10, 20)
            taskpool.execute(task2).then((ret2) => {
                result2 = ret2;
                isTerminate2 = true;
            })
            while (!isTerminate1 || !isTerminate2) {
                await promiseCase()
            }
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_035
         * @tc.name      : testTaskPoolExecute035
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute035', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result1;
            var result2;
            var isTerminate1 = false;
            var isTerminate2 = false;

            var task = new taskpool.Task(Sum, 10, 20)
            taskpool.execute(task).then((ret1) => {
                result1 = ret1;
                isTerminate1 = true;
            })
            taskpool.execute(task).then((ret2) => {
                result2 = ret2;
                isTerminate2 = true;
            })
            while (!isTerminate1 || !isTerminate2) {
                await promiseCase()
            }
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_036
         * @tc.name      : testTaskPoolExecute036
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute036', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            function Multi(value1, value2) {
                "use concurrent"
                return value1 * value2;
            }

            var result1;
            var result2;
            var result3;
            var result4;
            var isTerminate1 = false;
            var isTerminate2 = false;
            var isTerminate3 = false;
            var isTerminate4 = false;

            var task1 = new taskpool.Task(Sum, 10, 20)
            taskpool.execute(task1).then((ret1) => {
                result1 = ret1;
                isTerminate1 = true;
            })
            var task2 = new taskpool.Task(Multi, 10, 20)
            taskpool.execute(task2).then((ret2) => {
                result2 = ret2;
                isTerminate2 = true;
            })
            var task3 = new taskpool.Task(Sum, 10, 30)
            taskpool.execute(task3).then((ret3) => {
                result3 = ret3;
                isTerminate3 = true;
            })
            var task4 = new taskpool.Task(Multi, 20, 20)
            taskpool.execute(task4).then((ret4) => {
                result4 = ret4;
                isTerminate4 = true;
            })

            while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
                await promiseCase()
            }
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(200);
            expect(result3).assertEqual(40);
            expect(result4).assertEqual(400);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_037
         * @tc.name      : testTaskPoolExecute037
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute037', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result;
            var isTerminate = false;
            taskpool.execute(Sum, 10, 20).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_038
         * @tc.name      : testTaskPoolExecute038
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute038', 0, async function (done) {
            function Add(value1, value2) {
                "use concurrent"
                if (value1 & value2)
                    return true;
                else
                    return false;
            }
            var result;
            var isTerminate = false;
            taskpool.execute(Add, true, false).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual(false);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_039
         * @tc.name      : testTaskPoolExecute039
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute039', 0, async function (done) {
            function StrCat(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result;
            var isTerminate = false;
            taskpool.execute(StrCat, "abc", "def").then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual("abcdef");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_040
         * @tc.name      : testTaskPoolExecute040
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute040', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                function StrCat(value1, value2) {
                    return value1 + value2;
                }
                return value1+StrCat(value2,"hello");
            }
            var result;
            var isTerminate = false;
            taskpool.execute(Sum, "abc", "def").then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual("abcdefhello");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_041
         * @tc.name      : testTaskPoolExecute041
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute041', 0, async function (done) {
            function Sum(arg1, arg2) {
                "use concurrent"
                let value = [];
                value[0] = arg1[0] + arg2[0];
                value[1] = arg1[1] + arg2[1];
                return value;
            }
            var result;
            var isTerminate = false;
            taskpool.execute(Sum, [1,2], [3,4]).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result[0]).assertEqual(4);
            expect(result[1]).assertEqual(6);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_042
         * @tc.name      : testTaskPoolExecute042
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute042', 0, async function (done) {
            function Sum(arg1, arg2) {
                "use concurrent"
                let value = arg1;
                value.a = arg1.a + arg2.a;
                value.b = arg1.b + arg2.b;
                return value;
            }
            var result;
            var isTerminate = false;
            taskpool.execute(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4}).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_043
         * @tc.name      : testTaskPoolExecute043
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute043', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result;
            var isTerminate = false;
            taskpool.execute(Sum, 10).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result.toString()).assertEqual("NaN");
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_044
         * @tc.name      : testTaskPoolExecute044
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute044', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result;
            var isTerminate = false;
            taskpool.execute(Sum, 10, 20, 30).then((ret) => {
                result = ret;
                isTerminate = true;
            })
            while (!isTerminate) {
                await promiseCase()
            }
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_045
         * @tc.name      : testTaskPoolExecute045
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute045', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result1;
            var result2;
            var isTerminate1 = false;
            var isTerminate2 = false;

            taskpool.execute(Sum, 10, 20).then((ret1) => {
                result1 = ret1;
                isTerminate1 = true;
            })
            taskpool.execute(Sum, 30, 40).then((ret2) => {
                result2 = ret2;
                isTerminate2 = true;
            })
            while (!isTerminate1 || !isTerminate2) {
                await promiseCase()
            }
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(70);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_046
         * @tc.name      : testTaskPoolExecute046
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute046', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var result1;
            var result2;
            var isTerminate1 = false;
            var isTerminate2 = false;

            taskpool.execute(Sum, 10, 20).then((ret1) => {
                result1 = ret1;
                isTerminate1 = true;
            })
            taskpool.execute(Sum, 10, 20).then((ret2) => {
                result2 = ret2;
                isTerminate2 = true;
            })
            while (!isTerminate1 || !isTerminate2) {
                await promiseCase()
            }
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_047
         * @tc.name      : testTaskPoolExecute047
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute047', 0, async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            function Multi(value1, value2) {
                "use concurrent"
                return value1 * value2;
            }

            var result1;
            var result2;
            var result3;
            var result4;
            var isTerminate1 = false;
            var isTerminate2 = false;
            var isTerminate3 = false;
            var isTerminate4 = false;

            taskpool.execute(Sum, 10, 20).then((ret1) => {
                result1 = ret1;
                isTerminate1 = true;
            })
            taskpool.execute(Multi, 10, 20).then((ret2) => {
                result2 = ret2;
                isTerminate2 = true;
            })
            taskpool.execute(Sum, 10, 30).then((ret3) => {
                result3 = ret3;
                isTerminate3 = true;
            })
            taskpool.execute(Multi, 20, 20).then((ret4) => {
                result4 = ret4;
                isTerminate4 = true;
            })
            while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
                await promiseCase()
            }
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(200);
            expect(result3).assertEqual(40);
            expect(result4).assertEqual(400);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_048
         * @tc.name      : testTaskPoolExecute048
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute048', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            try {
                var result = await taskpool.execute(Sum);
            } catch(e) {
                expect(e.toString()).assertEqual("BusinessError: taskpool:: first param must be object when argc is one");
            }
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_049
         * @tc.name      : testTaskPoolExecute049
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute049', 0,  async function (done) {
            function Sum(value1, value2) {
                "use concurrent"
                return value1 + value2;
            }
            var task1 = new taskpool.Task(Sum, 10, 20);
            var task2 = new taskpool.Task(Sum, 30, 40);
            var task3 = new taskpool.Task(Sum, 50, 60);
            var result1 = await taskpool.execute(task1,taskpool.Priority.LOW);
            var result2 = await taskpool.execute(task2,taskpool.Priority.HIGH);
            var result3 = await taskpool.execute(task3,taskpool.Priority.MEDIUM);
            expect(result1).assertEqual(30);
            expect(result2).assertEqual(70);
            expect(result3).assertEqual(110);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_050
         * @tc.name      : testTaskPoolExecute050
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute050', 0,  async function (done) {
            async function func(value1, value2) {
                "use concurrent"
                let result = await new Promise((resolve, reject) => {
                    let value = value1 + value2;
                    resolve(value);
                })
                return result;
            }
            var result = await taskpool.execute(func, 10, 20);
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_EXECUTE_051
         * @tc.name      : testTaskPoolExecute051
         * @tc.desc      : Place the pending function into the taskpool internal task queue and wait for the thread to execute.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolExecute051', 0,  async function (done) {
            async function func(value1, value2) {
                "use concurrent"
                let result = await new Promise((resolve, reject) => {
                    let value = value1 + value2;
                    resolve(value);
                })
                return result;
            }
            var task = new taskpool.Task(func, 10, 20);
            var result = await taskpool.execute(task);
            expect(result).assertEqual(30);
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_Cancel_001
         * @tc.name      : testTaskPoolCancel001
         * @tc.desc      : Cancel tasks that have not been executed
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolCancel001', 0, async function (done) {
            function addition(arg) {
                "use concurrent"
                return arg + 1;
            }
            function additionDelay(arg) {
                "use concurrent"
                var start = new Date().getTime();
                while (new Date().getTime() - start < 200) {
                    continue;
                }
                return arg + 1;
            }
            try {
                var task1 = new taskpool.Task(additionDelay, 100);
                var task2 = new taskpool.Task(additionDelay, 200);
                var task3 = new taskpool.Task(additionDelay, 200);
                var task4 = new taskpool.Task(additionDelay, 200);
                var task5 = new taskpool.Task(additionDelay, 200);
                var task6 = new taskpool.Task(additionDelay, 200);
                var task7 = new taskpool.Task(additionDelay, 200);
                var task8 = new taskpool.Task(additionDelay, 200);
                var task9 = new taskpool.Task(additionDelay, 200);
                var task10 = new taskpool.Task(additionDelay, 200);
                var task11 = new taskpool.Task(addition, 300);

                var result1 = taskpool.execute(task1);
                var result2 = taskpool.execute(task2);
                var result3 = taskpool.execute(task3);
                var result4 = taskpool.execute(task4);
                var result5 = taskpool.execute(task5);
                var result6 = taskpool.execute(task6);
                var result7 = taskpool.execute(task7);
                var result8 = taskpool.execute(task8);
                var result9 = taskpool.execute(task9);
                var result10 = taskpool.execute(task10);
                var result11 = taskpool.execute(task11);

                var start = new Date().getTime();
                while (new Date().getTime() - start < 20) {
                    continue;
                }

                taskpool.cancel(task11);
            }
            catch (e) {
                expect(e.toString()).assertEqual("");
            }
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_Cancel_002
         * @tc.name      : testTaskPoolCancel002
         * @tc.desc      : Cancel the task in progress
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolCancel002', 0, async function (done) {
            function addition(arg) {
                "use concurrent"
                return arg + 1;
            }
            function additionDelay(arg) {
                "use concurrent"
                var start = new Date().getTime();
                while (new Date().getTime() - start < 3000) {
                    continue;
                }
                return arg + 1;
            }
            try {
                var task1 = new taskpool.Task(additionDelay, 100);
                var task2 = new taskpool.Task(additionDelay, 200);
                var task3 = new taskpool.Task(addition, 300);

                var result1 = taskpool.execute(task1);
                var result2 = taskpool.execute(task2);
                var result3 = taskpool.execute(task3);

                var start = new Date().getTime();
                while (new Date().getTime() - start < 1000) {
                    continue;
                }

                taskpool.cancel(task1);
            }
            catch (e) {
                expect(e.toString()).assertEqual(
                    "BusinessError: The task is executing when it is canceled, taskpool:: can not cancel the running task");
            }
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_Cancel_003
         * @tc.name      : testTaskPoolCancel003
         * @tc.desc      : Cancel the executed task
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolCancel003', 0, async function (done) {
            function addition(arg) {
                "use concurrent"
                return arg + 1;
            }
            try {
                var task1 = new taskpool.Task(addition, 100);
                var task2 = new taskpool.Task(addition, 200);
                var task3 = new taskpool.Task(addition, 300);

                var result1 = taskpool.execute(task1);
                var result2 = taskpool.execute(task2);
                var result3 = taskpool.execute(task3);

                var start = new Date().getTime();
                while (new Date().getTime() - start < 1000) {
                    continue;
                }

                taskpool.cancel(task1);
            }
            catch (e) {
                expect(e.toString()).assertEqual(
                    "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
            }
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_Cancel_004
         * @tc.name      : testTaskPoolCancel004
         * @tc.desc      : Cancel nonexistent task
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolCancel004', 0, async function (done) {
            function addition(arg) {
                "use concurrent"
                return arg + 1;
            }
            try {
                var task1 = new taskpool.Task(addition, 100);
                var task2 = new taskpool.Task(addition, 200);
                var task3 = new taskpool.Task(addition, 300);

                var result1 = taskpool.execute(task1);
                var result2 = taskpool.execute(task2);

                taskpool.cancel(task3);
            }
            catch (e) {
                expect(e.toString()).assertEqual(
                    "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
            }
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_Cancel_005
         * @tc.name      : testTaskPoolCancel005
         * @tc.desc      : Canceling unexecuted tasks multiple times
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolCancel005', 0, async function (done) {
            function addition(arg) {
                "use concurrent"
                return arg + 1;
            }
            function additionDelay(arg) {
                "use concurrent"
                var start = new Date().getTime();
                while (new Date().getTime() - start < 3000) {
                    continue;
                }
                return arg + 1;
            }
            try {
                var task1 = new taskpool.Task(additionDelay, 100);
                var task2 = new taskpool.Task(additionDelay, 200);
                var task3 = new taskpool.Task(addition, 300);

                var result1 = taskpool.execute(task1);
                var result2 = taskpool.execute(task2);
                var result3 = taskpool.execute(task3);

                var start = new Date().getTime();
                while (new Date().getTime() - start < 1000) {
                    continue;
                }

                taskpool.cancel(task3);
                taskpool.cancel(task3);
            }
            catch (e) {
                expect(e.toString()).assertEqual(
                    "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
            }
            done();
        })

        /**
         * @tc.number    : TEST_TASK_POOL_Cancel_006
         * @tc.name      : testTaskPoolCancel006
         * @tc.desc      : Cancel all tasks in sequence
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('testTaskPoolCancel006', 0, async function (done) {
            function addition(arg) {
                "use concurrent"
                return arg + 1;
            }
            try {
                var task1 = new taskpool.Task(addition, 100);
                var task2 = new taskpool.Task(addition, 200);
                var task3 = new taskpool.Task(addition, 300);
                var task4 = new taskpool.Task(addition, 400);
                var task5 = new taskpool.Task(addition, 500);
                var task6 = new taskpool.Task(addition, 600);

                var result1 = taskpool.execute(task1);
                var result2 = taskpool.execute(task2);
                var result3 = taskpool.execute(task3);
                var result4 = taskpool.execute(task4);
                var result5 = taskpool.execute(task5);
                var result6 = taskpool.execute(task6);

                var start = new Date().getTime();
                while (new Date().getTime() - start < 100) {
                    continue;
                }

                taskpool.cancel(task6);
                taskpool.cancel(task5);
                taskpool.cancel(task4);
                taskpool.cancel(task3);
                taskpool.cancel(task2);
            }
            catch (e) {
                expect(e.toString()).assertEqual(
                    "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
            }
            done();
        })
    })
}