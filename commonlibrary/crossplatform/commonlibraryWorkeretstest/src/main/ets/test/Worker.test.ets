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

import worker from "@ohos.worker";
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
} from "@ohos/hypium";
export default function WorkerTest() {
  describe("WorkerTest", function () {
    afterAll(function () {
      console.info("total case over");
    });

    function promiseCase() {
      let p = new Promise(function (resolve, reject) {
        setTimeout(function () {
          resolve(0);
        }, 100);
      }).then(undefined, (error) => {});
      return p;
    }

    /**
     * @tc.number: TEST_WORKEREVENTLISTENER_001
     * @tc.name  : test_WorkerEventListener_WorkerEventListener_001
     * @tc.desc  : Add an event listener to the Worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_WorkerEventListener_WorkerEventListener_001",0,async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_036.js");

        let times = 0;
        let isTerminate = false;

        ss.onexit = function () {
          isTerminate = true;
        };
        ss.addEventListener("zhangsan", () => {
          times++;
        });

        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });

        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }

        expect(times).assertEqual(2);
        done();
      }
    );

    /**
     * @tc.number: TEST_DISPATCHEVENT_001
     * @tc.name  : test_WorkerEventTarget_DispatchEvent_001
     * @tc.desc  : Distribute the events defined in the Worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_WorkerEventTarget_DispatchEvent_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_033.js");

      let zhangSanTimes = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.on("zhangsan", () => {
        zhangSanTimes++;
      });

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      expect(zhangSanTimes).assertEqual(1);

      ss.removeEventListener("zhangsan");

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      expect(zhangSanTimes).assertEqual(1);
      done();
    });

    /**
     * @tc.number: TEST_REMOVEVENTELISTENER_001
     * @tc.name  : test_WorkerEventTarget_RemoveEventListener_001
     * @tc.desc  : Removes an event defined for the worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_WorkerEventTarget_RemoveEventListener_001",0,async function (done) {
        let ss = new worker.ThreadWorker(
          "entry_test/ets/workers/newworker_033.js"
        );

        let zhangSanTimes = 0;
        let isTerminate = false;

        ss.onexit = function () {
          isTerminate = true;
        };
        ss.addEventListener("zhangsan", () => {
          zhangSanTimes++;
        });

        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        expect(zhangSanTimes).assertEqual(1);

        ss.removeEventListener("zhangsan");

        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });

        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }

        expect(zhangSanTimes).assertEqual(1);
        done();
      }
    );

    /**
     * @tc.number: TEST_REMOVEALLLISTENER_001
     * @tc.name  : test_WorkerEventTarget_RemoveAllListener_001
     * @tc.desc  : Delete all event listeners for Worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it(
      "test_WorkerEventTarget_RemoveAllListener_001",
      0,
      async function (done) {
        let ss = new worker.ThreadWorker(
          "entry_test/ets/workers/newworker_033.js"
        );

        let zhangSanTimes = 0;
        let isTerminate = false;

        ss.onexit = function () {
          isTerminate = true;
        };
        ss.addEventListener("zhangsan", () => {
          zhangSanTimes++;
        });

        let liSiTimes = 0;
        ss.addEventListener("lisi", () => {
          liSiTimes++;
        });

        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        expect(zhangSanTimes).assertEqual(2);

        ss.dispatchEvent({ type: "lisi", timeStamp: 0 });
        ss.dispatchEvent({ type: "lisi", timeStamp: 0 });
        expect(liSiTimes).assertEqual(2);

        ss.removeAllListener();
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        expect(zhangSanTimes).assertEqual(2);

        ss.dispatchEvent({ type: "lisi", timeStamp: 0 });
        ss.dispatchEvent({ type: "lisi", timeStamp: 0 });

        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }

        expect(liSiTimes).assertEqual(2);
        done();
      }
    );

    /**
     * @tc.number: TEST_ONERROR_001
     * @tc.name  : test_GlobalScope_OnError_001
     * @tc.desc  : Called when an exception occurs during execution in the Worker thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_GlobalScope_OnError_001", 0, async function (done) {
      const ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_035.js"
      );
      let res = undefined;
      let flag = false;

      ss.onmessage = function (e) {
        res = e.data;
        flag = true;
      };

      ss.postMessage({ type: "new" });
      while (!flag) {
        await promiseCase();
      }
      expect(res).assertEqual("Error: 123");

      done();
    });

    /**
     * @tc.number: TEST_ONMESSAGE_001
     * @tc.name  : test_ThreadWorkerGlobalScope_OnMessage_001
     * @tc.desc  : Receive information sent by the main thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorkerGlobalScope_OnMessage_001", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_010.js"
      );
      let flag = false;
      let res = undefined;

      ss.onmessage = function (e) {
        flag = true;
        res = e.data;
      };

      ss.postMessage({ type: "new", value: 12 });
      while (!flag) {
        await promiseCase();
      }
      expect(res).assertEqual(25);

      ss.terminate();

      done();
    });

    /**
     * @tc.number: TEST_ONMESSAGEERROR_001
     * @tc.name  : test_ThreadWorkerGlobalScope_OnMessageError_001
     * @tc.desc  : Worker object receives a message that cannot be deserialized
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it(
      "test_ThreadWorkerGlobalScope_OnMessageError_001",
      0,
      async function (done) {
        let ss = new worker.ThreadWorker(
          "entry_test/ets/workers/newworker_028.js"
        );
        let res = undefined;
        let flag = false;
        ss.onmessage = function (d) {
          res = d.data;
          flag = true;
        };

        ss.postMessage({ type: "new" });
        while (!flag) {
          await promiseCase();
        }
        ss.terminate();

        expect(res).assertEqual(1);
        done();
      }
    );

    /**
     * @tc.number: TEST_CLOSE_001
     * @tc.name  : test_ThreadWorkerGlobalScope_Close_001
     * @tc.desc  : Destroy the worker thread and stop the worker from receiving messages.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorkerGlobalScope_Close_001", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_030.js"
      );
      let res = 0;
      let flag = false;

      ss.onexit = function () {
        flag = true;
        res++;
      };

      ss.postMessage(10);
      while (!flag) {
        await promiseCase();
      }
      expect(res).assertEqual(1);
      done();
    });

    /**
     * @tc.number: TEST_POSTMESSAGE_001
     * @tc.name  : test_ThreadWorkerGlobalScope_PostMessage_001
     * @tc.desc  : Sends a message to the worker thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it(
      "test_ThreadWorkerGlobalScope_PostMessage_001",
      0,
      async function (done) {
        let ss = new worker.ThreadWorker(
          "entry_test/ets/workers/newworker_0151.js"
        );
        let res = undefined;
        let flag = false;
        ss.onmessage = function (e) {
          flag = true;
          res = e.data;
        };
        ss.postMessage({ type: "new", value: 11 });
        while (!flag) {
          await promiseCase();
        }
        ss.terminate();
        expect(res).assertEqual(16);
        done();
      }
    );

    /**
     * @tc.number: TEST_POSTMESSAGE_001
     * @tc.name  : test_ThreadWorkerGlobalScope_PostMessage_001
     * @tc.desc  : Sends a message to the worker thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it(
      "test_ThreadWorkerGlobalScope_PostMessage_001",
      0,
      async function (done) {
        let ss = new worker.ThreadWorker(
          "entry_test/ets/workers/newworker_032.js"
        );
        let isTerminate = false;
        let flag = false;
        let res = undefined;

        ss.onexit = function () {
          isTerminate = true;
        };
        ss.onmessage = function (e) {
          flag = true;
          res = e.data;
        };
        ss.postMessage({ type: "new" });

        while (!flag) {
          await promiseCase();
        }

        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("IsDetachedBuffer");
        done();
      }
    );

    /**
     * @tc.number: TEST_CONSTRUCTOR_001
     * @tc.name  : test_ThreadWorker_Constructor_001
     * @tc.desc  : worker constructor to Creates a worker instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Constructor_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };

      expect(ss != null).assertTrue();

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      done();
    });

    /**
     * @tc.number: TEST_CONSTRUCTOR_002
     * @tc.name  : test_ThreadWorker_Constructor_002
     * @tc.desc  : worker constructor to Creates a worker instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Constructor_002", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {
        name: "1st worker",
        shared: false,
      });
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };

      expect(ss != null).assertTrue();

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      done();
    });

    /**
     * @tc.number: TEST_CONSTRUCTOR_003
     * @tc.name  : test_ThreadWorker_Constructor_003
     * @tc.desc  : worker constructor to Creates a worker instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Constructor_003", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {
        type: "classic",
        name: "2st worker",
        shared: false,
      });
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };

      expect(ss != null).assertTrue();

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      done();
    });

    /**
     * @tc.number: TEST_CONSTRUCTOR_004
     * @tc.name  : test_ThreadWorker_Constructor_004
     * @tc.desc  : worker constructor to Creates a worker instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Constructor_004", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {
        type: "classic",
        name: "3st worker",
        shared: true,
      });
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };

      expect(ss != null).assertTrue();

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      done();
    });

    /**
     * @tc.number: TEST_CONSTRUCTOR_005
     * @tc.name  : test_ThreadWorker_Constructor_005
     * @tc.desc  : worker constructor to Creates a worker instance.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Constructor_005", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "@bundle:com.example.threadWorkertest/entry_test/ets/workers/newworker.js"
      );
      let isTerminate = false;
      ss.onexit = function () {
        isTerminate = true;
      };
      expect(ss != null).assertTrue();
      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      done();
    });

    /**
     * @tc.number: TEST_ONEXIT_001
     * @tc.name  : test_ThreadWorker_OnExit_001
     * @tc.desc  : Monitor whether the worker is destroyed
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_OnExit_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("/entry_test/ets/workers/newworker.js");
      let isTerminate = false;
      ss.onexit = function () {
        isTerminate = true;
      };
      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertTrue();
      done();
    });

    /**
     * @tc.number: TEST_ONERROR_001
     * @tc.name  : test_ThreadWorker_OnError_001
     * @tc.desc  : Listen to the worker for any exceptions during execution
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_OnError_001", 0, async function (done) {
      const ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_007.js"
      );
      let res = undefined;
      let flag = false;
      ss.onerror = function (e) {
        res = e.message;
        expect(e.filename).assertEqual(
          "entry_test/ets/workers/newworker_007.js"
        );
        expect(e.lineno).assertEqual(0);
        expect(e.colno).assertEqual(0);
        expect(e.error == "Error: 123").assertTrue();
        flag = true;
      };

      ss.postMessage("hello world");
      while (!flag) {
        await promiseCase();
      }

      expect(res).assertEqual("Error: 123");
      done();
    });

    /**
     * @tc.number: TEST_ONMESSAGE_001
     * @tc.name  : test_ThreadWorker_OnMessage_001
     * @tc.desc  : Receives information from child threads
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_OnMessage_001", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_002.js"
      );
      let res = undefined;
      let flag = false;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };

      ss.onmessage = function (e) {
        res = e.data;
        flag = true;
      };

      ss.postMessage("hello world");
      while (!flag) {
        await promiseCase();
      }
      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(res).assertEqual("hello world worker");
      done();
    });

    /**
     * @tc.number: TEST_ONMESSAGEERROR_001
     * @tc.name  : test_ThreadWorker_OnMessageError_001
     * @tc.desc  : Listening for worker object to receive a message that cannot be serialized
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_OnMessageError_001", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_008.js"
      );
      let res = 0;
      let flag = false;

      ss.onexit = function () {
        flag = true;
      };

      ss.onmessageerror = function (e) {
        res++;
      };

      ss.postMessage("abc");
      while (!flag) {
        await promiseCase();
      }
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number: TEST_ONMESSAGEERROR_002
     * @tc.name  : test_ThreadWorker_OnMessageError_002
     * @tc.desc  : Listening for worker object to receive a message that cannot be serialized
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_OnMessageError_002", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_021.js"
      );
      let flag = false;
      let isTerminate = false;
      ss.onmessageerror = function (d) {
        flag = true;
      };
      ss.onexit = function () {
        isTerminate = true;
      };
      try {
        const data = Symbol();
        ss.postMessage(data);
      } catch (error) {
        console.info("worker:: recv error message: " + error.message);
        while (!flag) {
          await promiseCase();
        }
        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }
      }
      expect(flag).assertTrue();
      done();
    });

    /**
     * @tc.number: TEST_POSTMESSAGE_001
     * @tc.name  : test_ThreadWorker_PostMessage_001
     * @tc.desc  : Sends a message to the worker thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_PostMessage_001", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_002.js"
      );

      let res = undefined;
      let flag = false;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.onmessage = function (e) {
        res = e.data;
        flag = true;
      };

      ss.postMessage("hello world");
      while (!flag) {
        await promiseCase();
      }

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(res).assertEqual("hello world worker");
      done();
    });

    /**
     * @tc.number: TEST_POSTMESSAGE_002
     * @tc.name  : test_ThreadWorker_PostMessage_002
     * @tc.desc  : Sends a message to the worker thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_PostMessage_002", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_003.js"
      );

      let res = undefined;
      let flag = false;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.onmessage = function (e) {
        res = e.data;
        flag = true;
      };

      ss.postMessage(12);
      while (!flag) {
        await promiseCase();
      }

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(res).assertEqual(25);
      done();
    });

    /**
     * @tc.number: TEST_POSTMESSAGE_003
     * @tc.name  : test_ThreadWorker_PostMessage_003
     * @tc.desc  : Sends a message to the worker thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_PostMessage_003", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_004.js"
      );

      let res = undefined;
      let flag = false;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.onmessage = function (e) {
        res = e.data.message;
        flag = true;
      };

      ss.postMessage({ message: "hello world" });
      while (!flag) {
        await promiseCase();
      }

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(res).assertEqual("hello world worker");
      done();
    });

    /**
     * @tc.number: TEST_POSTMESSAGE_004
     * @tc.name  : test_ThreadWorker_PostMessage_004
     * @tc.desc  : Sends a message to the worker thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_PostMessage_004", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_005.js",
        { name: "zhangsan" }
      );

      let res = undefined;
      let flag = false;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.onmessage = function (e) {
        res = e.data;
        console.info("worker:: type " + e.type);
        console.info("worker:: timeStamp " + e.timeStamp);
        flag = true;
      };

      ss.postMessage("hello world");
      while (!flag) {
        await promiseCase();
      }

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(res).assertEqual("zhangsan");
      done();
    });

    /**
     * @tc.number: TEST_POSTMESSAGE_001
     * @tc.name  : test_ThreadWorker_PostMessage_001
     * @tc.desc  : Sends a message to the worker thread.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_PostMessage_001", 0, async function (done) {
      let ss = new worker.ThreadWorker(
        "entry_test/ets/workers/newworker_006.js"
      );
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };

      const buffer = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(8);
      ss.postMessage(buffer, [buffer]);
      let length = undefined;
      let exception = undefined;
      try {
        length = buffer.byteLength;
      } catch (e) {
        exception = e.message;
      }

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      console.log("worker:: length is " + length);
      console.log("worker:: exception is " + exception);

      if (typeof exception == "undefined") {
        expect(length).assertEqual(0);
      } else {
        expect(exception).assertEqual("IsDetachedBuffer");
      }
      done();
    });

    /**
     * @tc.number: TEST_ONCE_001
     * @tc.name  : test_ThreadWorker_Once_001
     * @tc.desc  : Add an event listener.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Once_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let times = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.once("zhangsan", () => {
        times++;
      });
      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(times).assertEqual(1);
      done();
    });

    /**
     * @tc.number: TEST_ONCE_002
     * @tc.name  : test_ThreadWorker_Once_002
     * @tc.desc  : Add an event listener.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Once_002", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let times = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.once("zhangsan", () => {
        times++;
      });

      for (let i = 0; i < 10; i++) {
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      }

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(times).assertEqual(1);
      done();
    });

    /**
     * @tc.number: TEST_ONCE_003
     * @tc.name  : test_ThreadWorker_Once_003
     * @tc.desc  : Add an event listener.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Once_003", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let times = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.once("zhangsan", () => {
        times--;
      });

      ss.once("lisi", () => {
        times++;
      });

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      ss.dispatchEvent({ type: "lisi", timeStamp: 0 });

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(times).assertEqual(0);
      done();
    });

    /**
     * @tc.number: TEST_ONCE_004
     * @tc.name  : test_ThreadWorker_Once_004
     * @tc.desc  : Add an event listener.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Once_004", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let isTerminate = false;
      let times = 0;

      try {
        ss.once("zhangsan", () => {
          times++;
        });
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        ss.onexit = function () {
          isTerminate = true;
        };
        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }
        ss.once("lisi", () => {
          times++;
        });
        expect(times).assertEqual(1);
      } catch (error) {
        expect(error.name).assertEqual("BusinessError");
        expect(error.message).assertEqual(
          "Worker instance is not running, maybe worker is terminated"
        );

        done();
      }
    });

    /**
     * @tc.number: TEST_TERMINATE_001
     * @tc.name  : test_ThreadWorker_Terminate_001
     * @tc.desc  : Terminates the worker thread to stop the worker from receiving messages.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Terminate_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");
      let res = 0;
      let flag = false;

      ss.onexit = function () {
        flag = true;
        res++;
      };

      ss.terminate();
      while (!flag) {
        await promiseCase();
      }

      expect(res).assertEqual(1);
      done();
    });

    /**
     * @tc.number: TEST_TERMINATE_002
     * @tc.name  : test_ThreadWorker_Terminate_002
     * @tc.desc  : Terminates the worker thread to stop the worker from receiving messages.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Terminate_002", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");
      let res = 0;
      let flag = false;

      ss.onexit = function () {
        flag = true;
        res++;
      };

      ss.terminate();
      ss.terminate();

      while (!flag) {
        await promiseCase();
      }

      expect(res).assertEqual(1);
      done();
    });

    /**
     * @tc.number: TEST_TERMINATE_003
     * @tc.name  : test_ThreadWorker_Terminate_003
     * @tc.desc  : Terminates the worker thread to stop the worker from receiving messages.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_Terminate_003", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");
      let res = 0;
      let flag = false;

      ss.onexit = function () {
        flag = true;
        res++;
      };
      ss.onmessage = function (e) {
        res++;
      };

      ss.terminate();
      while (!flag) {
        await promiseCase();
      }
      expect(res).assertEqual(1);

      try {
        ss.postMessage("hello world");
        await promiseCase();
      } catch (error) {
        let msg =
          "Worker instance is not running, maybe worker is terminated when PostMessage";
        expect(error.name).assertEqual("BusinessError");
        expect(error.message).assertEqual(msg);
        done();
      }
    });

    /**
     * @tc.number: TEST_ADDEVENTLISTENER_001
     * @tc.name  : test_ThreadWorker_AddEventListener_001
     * @tc.desc  : Add an event listener to the Worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_AddEventListener_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let times = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.addEventListener("zhangsan", () => {
        times++;
      });

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(times).assertEqual(2);
      done();
    });

    /**
     * @tc.number: TEST_ADDEVENTLISTENER_002
     * @tc.name  : test_ThreadWorker_AddEventListener_002
     * @tc.desc  : Add an event listener to the Worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_AddEventListener_002", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let times = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.addEventListener("zhangsan", () => {
        times++;
      });
      ss.addEventListener("lisi", () => {
        times++;
      });

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      ss.dispatchEvent({ type: "lisi", timeStamp: 0 });

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(times).assertEqual(2);
      done();
    });

    /**
     * @tc.number: TEST_ADDEVENTLISTENER_003
     * @tc.name  : test_ThreadWorker_AddEventListener_003
     * @tc.desc  : Add an event listener to the Worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_AddEventListener_003", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let times = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.addEventListener("zhangsan", () => {
        times++;
      });

      for (let i = 0; i < 10; i++) {
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      }

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(times).assertEqual(10);
      done();
    });

    /**
     * @tc.number: TEST_ADDEVENTLISTENER_004
     * @tc.name  : test_ThreadWorker_AddEventListener_004
     * @tc.desc  : Add an event listener to the Worker when throw error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_AddEventListener_004", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let times = 0;
      let isTerminate = false;

      try {
        ss.addEventListener("zhangsan", () => {
          times++;
        });

        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });

        ss.onexit = function () {
          isTerminate = true;
        };
        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }

        ss.addEventListener("lisi", () => {
          times++;
        });
        expect(times).assertEqual(1);
      } catch (error) {
        expect(error.name).assertEqual("BusinessError");
        expect(error.message).assertEqual(
          "Worker instance is not running, maybe worker is terminated"
        );
        done();
      }
    });

    /**
     * @tc.number: TEST_ADDEVENTLISTENER_005
     * @tc.name  : test_ThreadWorker_AddEventListener_005
     * @tc.desc  : Add an event listener to the Worker when throw error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_AddEventListener_005", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let times = 0;
      let isTerminate = false;

      try {
        ss.addEventListener("zhangsan", () => {
          times++;
        });

        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });

        ss.onexit = function () {
          isTerminate = true;
        };
        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }
        ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
        expect(times).assertEqual(1);
      } catch (error) {
        expect(error.name).assertEqual("BusinessError");
        expect(error.message).assertEqual(
          "Worker instance is not running, maybe worker has been terminated"
        );
        done();
      }
    });

    /**
     * @tc.number: TEST_DISPATCHEVENT_001
     * @tc.name  : test_ThreadWorker_DispatchEvent_001
     * @tc.desc  : Distribute the events defined in the Worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_DispatchEvent_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let zhangSanTimes = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.on("zhangsan", () => {
        zhangSanTimes++;
      });

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      expect(zhangSanTimes).assertEqual(1);

      ss.removeEventListener("zhangsan");

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      expect(zhangSanTimes).assertEqual(1);
      done();
    });

    /**
     * @tc.number: TEST_REMOVEVENTELISTENER_001
     * @tc.name  : test_ThreadWorker_RemoveEventListener_001
     * @tc.desc  : Removes an event defined for the worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_RemoveEventListener_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let zhangSanTimes = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.addEventListener("zhangsan", () => {
        zhangSanTimes++;
      });

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      expect(zhangSanTimes).assertEqual(1);

      ss.removeEventListener("zhangsan");

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(zhangSanTimes).assertEqual(1);
      done();
    });

    /**
     * @tc.number: TEST_REMOVEVENTELISTENER_002
     * @tc.name  : test_ThreadWorker_RemoveEventListener_002
     * @tc.desc  : Removes an event defined for the worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_RemoveEventListener_002", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let zhangSanTimes = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.addEventListener("zhangsan", () => {
        zhangSanTimes++;
      });

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      expect(zhangSanTimes).assertEqual(2);

      for (let i = 0; i < 3; i++) {
        ss.removeEventListener("zhangsan");
      }

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(zhangSanTimes).assertEqual(2);
      done();
    });

    /**
     * @tc.number: TEST_REMOVELISTENER_003
     * @tc.name  : test_ThreadWorker_RemoveEventListener_003
     * @tc.desc  : Removes an event defined for the worker when throw error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_RemoveEventListener_003", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let zhangSanTimes = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.addEventListener("zhangsan", () => {
        zhangSanTimes++;
      });
      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      try {
        ss.removeEventListener("zhangsan");
      } catch (error) {
        expect(error.name).assertEqual("BusinessError");
        expect(error.message).assertEqual(
          "Worker instance is not running, maybe worker is terminated"
        );
        done();
      }
    });

    /**
     * @tc.number: TEST_REMOVEALLLISTENER_001
     * @tc.name  : test_ThreadWorker_RemoveAllListener_001
     * @tc.desc  : Delete all event listeners for Worker.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_RemoveAllListener_001", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let zhangSanTimes = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.addEventListener("zhangsan", () => {
        zhangSanTimes++;
      });

      let liSiTimes = 0;
      ss.addEventListener("lisi", () => {
        liSiTimes++;
      });

      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      expect(zhangSanTimes).assertEqual(2);

      ss.dispatchEvent({ type: "lisi", timeStamp: 0 });
      ss.dispatchEvent({ type: "lisi", timeStamp: 0 });
      expect(liSiTimes).assertEqual(2);

      ss.removeAllListener();
      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      ss.dispatchEvent({ type: "zhangsan", timeStamp: 0 });
      expect(zhangSanTimes).assertEqual(2);

      ss.dispatchEvent({ type: "lisi", timeStamp: 0 });
      ss.dispatchEvent({ type: "lisi", timeStamp: 0 });

      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }

      expect(liSiTimes).assertEqual(2);
      done();
    });

    /**
     * @tc.number: TEST_REMOVEALLLISTENER_002
     * @tc.name  : test_ThreadWorker_RemoveAllListener_002
     * @tc.desc  : Delete all event listeners for Worker when throw error.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("test_ThreadWorker_RemoveAllListener_002", 0, async function (done) {
      let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js");

      let zhangSanTimes = 0;
      let isTerminate = false;

      ss.onexit = function () {
        isTerminate = true;
      };
      ss.addEventListener("zhangsan", () => {
        zhangSanTimes++;
      });
      ss.terminate();
      while (!isTerminate) {
        await promiseCase();
      }
      try {
        ss.removeAllListener();
      } catch (error) {
        expect(error.name).assertEqual("BusinessError");
        expect(error.message).assertEqual(
          "Worker instance is not running, maybe worker is terminated"
        );
        done();
      }
    });
  });
}
