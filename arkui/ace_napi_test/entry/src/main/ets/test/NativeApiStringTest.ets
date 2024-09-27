/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"

import napitest from 'libnapitest.so'
import worker, { MessageEvents } from '@ohos.worker';

function promiseCase() {
  let p: Promise<number | void> = new Promise<number | void>((resolve, reject) => {
      setTimeout(() => {
          resolve(0)
      }, 100)
  }).then(undefined, (error: Error) => {
  })
  return p
}

function testFunc() {
  let a = 0
}
function test1() {
  "use concurrent"
}
function test2() {}

export default function nativeApiStringJsunit() {

  describe('napiStringTest', () => {
    const empty = 'hh';
    let value: ESObject;

    /**
    * run after testcase
    */
    afterEach(async () => {
      console.info('[napiStringTest] after each called')
      value == '';
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0007
     * @tc.name      napiRunScriptPath007
     * @tc.desc      aceNapiEtsTest
     */
     it('napiRunScriptPath007', 0, async (done: Function) => {
       console.info('napiRunScriptPath START');
       value = napitest.napiRunScriptPath();
       console.info('napiRunScriptPath testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
     });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0038
    * @tc.name      aceNapiTest038
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest038', 0, async (done: Function) => {
      console.info('aceNapiTest038 START');
      value = napitest.getPrototype();
      console.info('aceNapiTest038 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();

      value = napitest.getPrototype2(testFunc);
      console.info('aceNapiTest038 testString result is: ' + value + "--" + JSON.stringify(value));
      //console.info('aceNapiTest038 testString Object.getPrototypeOf(testObj) is: ' + Object.getPrototypeOf(testFunc) + "--" + JSON.stringify(Object.getPrototypeOf(testFunc)));
      expect(value === /*Object.getPrototypeOf(testFunc)*/ undefined).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0116
     * @tc.name      aceNapiTest0116
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0116', 0, async (done: Function) => {
      console.info('aceNapiTest0116 START');
      value = napitest.coerceToNativeBindingObject();
      console.info('aceNapiTest0116 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(2000);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0121
     * @tc.name      aceNapiTest0121
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0121', 0, async (done: Function) => {
    console.info('aceNapiTest0121 START');
      value = napitest.runEventLoop(0)
      console.info('aceNapiTest0121 testString result is: ' + value);
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0121
     * @tc.name      aceNapiTest0122
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0122', 0, async (done: Function) => {
    console.info('aceNapiTest0122 START');
      value = napitest.runEventLoop(1)
      console.info('aceNapiTest0122 testString result is: ' + value);
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0137
     * @tc.name aceNapiTest0137
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0137', 0, async (done: Function) => {
      console.info('aceNapiTest0137 START');
      value = napitest.runEventLoop(2);
      console.info('aceNapiTest0137 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0138
     * @tc.name aceNapiTest0138
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0138', 0, async (done: Function) => {
      console.info('aceNapiTest0138 START');
      value = napitest.runEventLoop(3);
      console.info('aceNapiTest0138 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0139
     * @tc.name aceNapiTest0139
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0139', 0, async (done: Function) => {
      console.info('aceNapiTest0139 START');
      const workerInstance = new worker.Worker('workers/worker.js');
      let isTerminate = false;
      workerInstance.onexit = () => {
        isTerminate = true;
      }
      expect(workerInstance != null).assertTrue();
      let res = undefined;
      workerInstance.onmessage = async (e: MessageEvents) => {
        console.info('aceNapiTest0139 testString result is: ' + e.data);
        res = e.data;
        workerInstance.terminate();
      }
      workerInstance.postMessage("call napi_run_event_loop with nowait");
      while (!isTerminate) {
        await promiseCase()
      }
      expect(res).assertEqual("success")
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0140
     * @tc.name aceNapiTest0140
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0140', 0, async (done: Function) => {
      console.info('aceNapiTest0140 START');
      const workerInstance = new worker.Worker('workers/worker.js');
      let isTerminate = false;
      workerInstance.onexit = () => {
        isTerminate = true;
      }
      expect(workerInstance != null).assertTrue();
      let res = undefined;
      workerInstance.onmessage = async (e: MessageEvents) => {
        console.info('aceNapiTest0140 testString result is: ' + e.data);
        res = e.data;
        workerInstance.terminate();
      }
      workerInstance.postMessage("call napi_run_event_loop with nowait");
      while (!isTerminate) {
        await promiseCase()
      }
      expect(res).assertEqual("success")
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0141
     * @tc.name aceNapiTest0141
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0141', 0, async (done: Function) => {
      console.info('aceNapiTest0141 START');
      let value: number = napitest.runEventLoop(6);
      console.info('aceNapiTest0141 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0142
     * @tc.name aceNapiTest0142
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0142', 0, async (done: Function) => {
      console.info('aceNapiTest0142 START');
      let value: number = napitest.runEventLoop(7);
      console.info('aceNapiTest0142 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0143
     * @tc.name aceNapiTest0143
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0143', 0, async (done: Function) => {
      console.info('aceNapiTest0143 START');
      let value: number = napitest.runEventLoop(8);
      console.info('aceNapiTest0143 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0144
     * @tc.name aceNapiTest0144
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0144', 0, async (done: Function) => {
      console.info('aceNapiTest0144 START');
      let value: number = napitest.runEventLoop(9);
      console.info('aceNapiTest0144 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0148
     * @tc.name aceNapiTest0148
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0148', 0, async (done: Function) => {
      console.info('aceNapiTest0148 START');
      let value: number = napitest.stopEventLoop(4);
      console.info('aceNapiTest0148 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0159
     * @tc.name aceNapiTest0159
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0159', 0, async (done: Function) => {
      console.info('aceNapiTest0159 START');
      let value: boolean = napitest.isConcurrentFunction(test1);
      expect(value).assertEqual(true);
      console.info('aceNapiTest0159 testString result is: ' + value);
      value = napitest.isConcurrentFunction(test2);
      expect(value).assertEqual(false);
      console.info('aceNapiTest0159 testString result is: ' + value);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0167
     * @tc.name aceNapiTest0167
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0167', 0, async (done: Function) => {
      console.info('aceNapiTest0167 START');
      let value: ArrayBuffer = napitest.createSendableArrayBufferTest();
      console.info('aceNapiTest0167 testString result is: ' + JSON.stringify(value));
      expect(value instanceof ArrayBuffer).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0168
     * @tc.name aceNapiTest0168
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0168', 0, async (done: Function) => {
      console.info('aceNapiTest0168 START');
      let value: Int32Array = napitest.createSendableTypedArrayTest();
      console.info('aceNapiTest0168 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Int32Array).assertTrue();
      expect(value.length).assertEqual(4);
      done();
    });
  })
}
