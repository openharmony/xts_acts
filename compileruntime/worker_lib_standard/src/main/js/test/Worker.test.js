/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

// @ts-nocheck
import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import worker from "@ohos.worker";

describe('workerTest', function () {

    afterAll(function () {
        console.info('total case over')
    })

    function promiseCase() {
        let p = new Promise(function (resolve, reject) {
            setTimeout(function () {
                resolve()
            }, 100);
        }).then(undefined, (error) => {
        })
        return p
    }

    // check worker constructor is ok
    it('worker_constructor_test_001', 0, function () {
        var ss = new worker.Worker("workers/worker.js")
        expect(ss != null).assertTrue()
    })

    it('worker_constructor_test_002', 0, function () {
        var ss = new worker.Worker("workers/worker.js",{name:"second worker",shared:"False"})
        expect(ss != null).assertTrue()
    })

    it('worker_constructor_test_003', 0, function () {
        var ss = new worker.Worker("workers/worker.js",{type:"classic",name:"second worker",shared:"false"})
        expect(ss != null).assertTrue()
    })

    it('worker_constructor_test_004', 0, function () {
        var ss = new worker.Worker("workers/worker.js",{type:"classic",name:"third worker",shared:"true"})
        expect(ss != null).assertTrue()
    })

    // check postMessage is ok
    // main post "hello world", will receive "hello world worker"
    it('worker_postMessage_test_001', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_002.js");

        var res = undefined
        var flag = false

        ss.onmessage = function (e) {
            res = e.data;
            flag = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual("hello world worker")
        done()
    })

    // check postMessage is ok
    // main post 12 , will receive 12 * 2 + 1
    it('worker_postMessage_test_002', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_003.js");

        var res = undefined
        var flag = false

        ss.onmessage = function (e) {
            res = e.data;
            flag = true
        }

        ss.postMessage(12)
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(25)
        done()
    })

    // check postMessage is ok
    // main post {message:"hello world"} , will receive {message:"hello world worker"}
    it('worker_postMessage_test_003', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_004.js");

        var res = undefined
        var flag = false

        ss.onmessage = function (e) {
            res = e.data.message;
            flag = true
        }

        ss.postMessage({"message":"hello world"})
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual("hello world worker")
        done()
    })

    // check worker name is ok
    it('worker_postMessage_test_004', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_005.js", {name: "zhangsan"});

        var res = undefined
        var flag = false

        ss.onmessage = function (e) {
            res = e.data;
            flag = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual("zhangsan")
        done()
    })

    // check worker transfer buffer is ok
    it('worker_postMessage_test_005', 0, function () {
        var ss = new worker.Worker("workers/worker_006.js");

        const buffer = new ArrayBuffer(8)
        expect(buffer.byteLength).assertEqual(8)
        ss.postMessage(buffer, [buffer])
        var length = undefined;
        var exception = undefined;
        try {
            length = buffer.byteLength;
        } catch (e) {
            exception = e.message;
        }

        console.log("worker:: length is " + length)
        console.log("worker:: exception is " + exception)

        if (typeof exception == "undefined") {
            expect(length).assertEqual(0)
        } else {
            expect(exception).assertEqual("IsDetachedBuffer")
        }
    })

    // check worker handle error is ok
    it('worker_postMessage_test_006', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_007.js");

        var res = undefined
        var flag = false

        ss.onerror = function (e) {
            res = e.message;
            flag = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual("Error: 123")
        done()
    })

    // check worker terminate is ok
    it('worker_terminate_test_001', 0, async function (done) {
        var ss = new worker.Worker("workers/worker.js");
        var res = 0
        var flag = false

        ss.onexit = function () {
            flag = true
            res++;
        }
        ss.terminate()
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(1)
        done()
    })

    // check worker terminate is ok
    it('worker_terminate_test_002', 0, async function (done) {
        var ss = new worker.Worker("workers/worker.js");
        var res = 0
        var flag = false

        ss.onexit = function () {
            flag = true
            res++;
        }

        // Repeated execution terminate
        ss.terminate()
        ss.terminate()

        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(1)
        done()
    })

    // check worker terminate is ok
    it('worker_terminate_test_003', 0, async function (done) {
        var ss = new worker.Worker("workers/worker.js");
        var res = 0
        var flag = false

        ss.onexit = function () {
            flag = true
            res++;
        }

        ss.onmessage = function (e) {
            res++;
        }

        ss.terminate()
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(1)

        ss.postMessage("hello world")
        await promiseCase()
        expect(res).assertEqual(1)
        done()
    })

    // check worker on function is ok
    it('worker_on_test_001', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.on("zhangsan", ()=>{
            times++;
        })

        ss.dispatchEvent({type: "zhangsan"})

        expect(times).assertEqual(1)
    })

    // check worker on function is ok
    it('worker_on_test_002', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.on("zhangsan", ()=>{
            times--;
        })

        ss.on("lisi", ()=>{
            times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "lisi"})

        expect(times).assertEqual(0)
    })

    // check worker on function is ok
    it('worker_on_test_003', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.on("zhangsan", ()=>{
            times++;
        })

        for (var i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan"})
        }
        console.log("times " + times);
        expect(times).assertEqual(10)
    })

    // check worker once function is ok
    it('worker_once_test_001', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.once("zhangsan", ()=>{
            times++;
        })
        ss.dispatchEvent({type: "zhangsan"})
        expect(times).assertEqual(1)
    })

    // check worker once function is ok
    it('worker_once_test_002', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.once("zhangsan", ()=>{
            times++;
        })

        for (var i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan"})
        }

        expect(times).assertEqual(1)
    })

    it('worker_once_test_003', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.once("zhangsan", ()=>{
            times--;
        })

        ss.once("lisi", ()=>{
            times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "lisi"})

        expect(times).assertEqual(0)
    })

    // check worker addEventListener function is ok
    it('worker_addEventListener_test_001', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.addEventListener("zhangsan", ()=>{
            times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "zhangsan"})

        expect(times).assertEqual(2)
    })

    // check worker addEventListener function is ok
    it('worker_addEventListener_test_002', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.addEventListener("zhangsan", ()=>{
            times++;
        })

        ss.addEventListener("lisi", ()=>{
            times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "lisi"})

        expect(times).assertEqual(2)
    })

    // check worker addEventListener function is ok
    it('worker_addEventListener_test_003', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var times = 0;
        ss.addEventListener("zhangsan", ()=>{
            times++;
        })

        for (var i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan"})
        }

        expect(times).assertEqual(10)
    })

    // check worker off function is ok
    it('worker_off_test_001', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var zhangsan_times = 0;
        ss.on("zhangsan", ()=>{
            zhangsan_times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(1)

        ss.off("zhangsan")

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(1)
    })

    // check worker off function is ok
    it('worker_off_test_002', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var zhangsan_times = 0;
        ss.on("zhangsan", ()=>{
            zhangsan_times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(2)

        for (var i=0;i<3;i++)
        {
            ss.off("zhangsan")
        }

        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(2)
    })

    // check worker removeEventListener function is ok
    it('worker_removeListener_test_001', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var zhangsan_times = 0;
        ss.addEventListener("zhangsan", ()=>{
            zhangsan_times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(1)

        ss.removeEventListener("zhangsan")

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(1)
    })

    // check worker removeEventListener function is ok
    it('worker_removeListener_test_002', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var zhangsan_times = 0;
        ss.addEventListener("zhangsan", ()=>{
            zhangsan_times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(2)

        for (var i=0;i<3;i++)
        {
            ss.removeEventListener("zhangsan")
        }

        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(2)

    })

    // check worker removeAllListener function is ok
    it('worker_removeListener_test_003', 0, function () {
        var ss = new worker.Worker("workers/worker.js");

        var zhangsan_times = 0;
        ss.addEventListener("zhangsan", ()=>{
            zhangsan_times++;
        })

        var lisi_times = 0;
        ss.addEventListener("lisi", ()=>{
            lisi_times++;
        })

        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(2)

        ss.dispatchEvent({type: "lisi"})
        ss.dispatchEvent({type: "lisi"})
        expect(lisi_times).assertEqual(2)

        ss.removeAllListener()
        ss.dispatchEvent({type: "zhangsan"})
        ss.dispatchEvent({type: "zhangsan"})
        expect(zhangsan_times).assertEqual(2)

        ss.dispatchEvent({type: "lisi"})
        ss.dispatchEvent({type: "lisi"})
        expect(lisi_times).assertEqual(2)
    })

    // check parentPort.close is ok
    it('worker_parentPortClose_test_001', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_008.js");
        var res = 0
        var flag = false;

        ss.onexit = function (e) {
            res++;
            flag = true;
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(1)
        done()
    })

    // check parentPort.close is ok
    it('worker_parentPortClose_test_002', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_008.js");
        var res = 0
        var flag = false;

        ss.onexit = function () {
            flag = true
        }

        ss.onmessage = function (e) {
            res++;
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }

        ss.postMessage("hello")
        await promiseCase()
        expect(res).assertEqual(0)
        done()
    })

    // check onmessageerror is ok
    it('worker_onmessageerror_test_001', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_008.js");
        var res = 0
        var flag = false;

        ss.onexit = function () {
            flag = true
        }

        ss.onmessageerror = function (e) {
            res++;
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(0)
        done()
    })

    // check onmessageerror is ok
    it('worker_onmessageerror_test_002', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_008.js");
        var res = 0
        var flag = false;

        ss.onmessageerror = function (e) {
            flag = true;
            res++;
        }
        function foo() {
        }
        ss.postMessage(foo)
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(1)
        done()
    })

    // check new second worker is ok
    it('worker_new_second_worker_test_001', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_009.js");
        var flag = false;
        var res = undefined;

        ss.onmessage = function (e) {
            flag = true;
            res = e.data;
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            console.log("worker:: foo wait")
            await promiseCase();
        }
        console.log("worker:: " + res)
        expect(res).assertTrue();
        done();
    })

    // check new third worker is ok
    it('worker_new_second_worker_test_002', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_012.js");
        var flag = false;
        var res = undefined;

        ss.onmessage = function (e) {
            flag = true;
            res = e.data;
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12});
        while (!flag) {
            console.log("worker:: worker_second_worker_postMessage_test_001 wait");
            ss.postMessage({type: "wait"});
            await promiseCase();
        }
        expect(res).assertTrue();
        done();
    })

    // check second worker postMessage number is ok
    it('worker_second_worker_postMessage_test_001', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_010.js");
        var flag = false;
        var res = undefined;

        ss.onmessage = function (e) {
            flag = true;
            res = e.data;
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12});
        while (!flag) {
            console.log("worker:: worker_second_worker_postMessage_test_001 wait");
            ss.postMessage({type: "wait"});
            await promiseCase();
        }
        expect(res).assertEqual(25);
        done();
    })

    // check second worker postMessage string is ok
    it('worker_second_worker_postMessage_test_002', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_013.js");
        var flag = false;
        var res = undefined;

        ss.onmessage = function (e) {
            flag = true;
            res = e.data;
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: "hello world"});
        while (!flag) {
            console.log("worker:: worker_second_worker_postMessage_test_002 wait")
            ss.postMessage({type: "wait"});
            await promiseCase();
        }
        expect(res).assertEqual("hello world worker");
        done();
    })

    // check second worker postMessage array is ok
    it('worker_second_worker_postMessage_test_003', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_014.js");
        var flag = false;
        var res = undefined;

        ss.onmessage = function (e) {
            flag = true;
            res = e.data;
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: [1, 2]});
        while (!flag) {
            console.log("worker:: worker_second_worker_postMessage_test_003 wait")
            ss.postMessage({type: "wait"});
            await promiseCase();
        }
        expect(res[0]).assertEqual(2);
        expect(res[1]).assertEqual(2);
        done();
    })

    // check third worker postMessage is ok
    it('worker_second_worker_postMessage_test_004', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_015.js");
        var flag = false;
        var res = undefined;

        ss.onmessage = function (e) {
            flag = true;
            res = e.data;
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 10});
        while (!flag) {
            console.log("worker:: worker_second_worker_postMessage_test_003 wait")
            ss.postMessage({type: "wait"});
            await promiseCase();
        }
        expect(res).assertEqual(16);
        done();
    })

    // check second worker terminate is ok
    it('worker_second_worker_terminate_test_001', 0, async function (done) {
        var ss = new worker.Worker("workers/worker_011.js");
        var flag = false;
        var res = undefined;

        ss.onmessage = function (e) {
            flag = true;
            res = e.data;
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12});
        while (!flag) {
            ss.postMessage({type: "wait"});
            await promiseCase();
        }

        flag = false;
        ss.postMessage({type: "terminate"});
        while (!flag) {
            ss.postMessage({type: "wait"});
            await promiseCase();
        }

        expect(res).assertEqual("terminate");
        done();
    })
})