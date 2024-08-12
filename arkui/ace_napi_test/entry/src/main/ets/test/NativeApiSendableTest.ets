/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "hypium/index"

import napitest from 'libnapitest.so'
import taskpool from '@ohos.taskpool'
import utils from '@ohos.arkts.utils'

function createInt(): SendableUint32Array {
  let buf = new SendableUint32Array(new SendableArrayBuffer(4))
  buf[0] = 0;
  return buf;
}

function exchange(buf: SendableUint32Array, oldVal: number, newVal: number) {
  expect(buf[0]).assertEqual(oldVal);
  buf[0] = newVal;
}

export default function nativeApiSendableJsunit() {

  describe('napiSendableTest', () => {
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiSendableTest] after each called')
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0001
     * @tc.name napiSendableTest001
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest001', 0, async (done: Function) => {
      console.info('napiSendableTest001 START');
      class Class {
        constructor() {}
      }
      class SendableClass {
        constructor() {
          'use sendable';
        }
      }
      let value = napitest.NapiIsSendable(Class);
      expect(value).assertEqual(false);
      let value0 = napitest.NapiIsSendable(SendableClass);
      expect(value0).assertEqual(true);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0002
     * @tc.name napiSendableTest002
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest002', 0, async (done: Function) => {
      console.info('napiSendableTest002 START');
      let value = napitest.NapiDefineSendableClass();
      expect(napitest.NapiIsSendable(value)).assertEqual(true);
      expect(value.staticStr).assertEqual('static str');
      expect(value.staticFunc()).assertEqual('static func');
      let instance = new value();
      expect(napitest.NapiIsSendable(instance)).assertEqual(true);
      expect(instance.str).assertEqual('instance str');
      expect(instance.func()).assertEqual('instance func');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0003
     * @tc.name napiSendableTest003
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest003', 0, async (done: Function) => {
      console.info('napiSendableTest003 START');
      let value = napitest.NapiCreateSendableObject();
      expect(napitest.NapiIsSendable(value)).assertEqual(true);
      expect(value.x).assertEqual(true);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0004
     * @tc.name napiSendableTest004
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest004', 0, async (done: Function) => {
      console.info('napiSendableTest004 START');
      let value = napitest.NapiCreateSendableArray();
      expect(napitest.NapiIsSendable(value)).assertEqual(true);
      expect(value.length).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0005
     * @tc.name napiSendableTest005
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest005', 0, async (done: Function) => {
      console.info('napiSendableTest005 START');
      let value = napitest.NapiCreateSendableArrayWithLength();
      expect(napitest.NapiIsSendable(value)).assertEqual(true);
      expect(value.length).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0006
     * @tc.name napiSendableTest006
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest006', 0, async (done: Function) => {
      console.info('napiSendableTest006 START');
      let value = napitest.NapiCreateSendableArrayBuffer();
      expect(napitest.NapiIsSendable(value)).assertEqual(true);
      expect(value.byteLength).assertEqual(1024);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0007
     * @tc.name napiSendableTest007
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest007', 0, async (done: Function) => {
      console.info('napiSendableTest007 START');
      let value = napitest.NapiCreateSendableTypedArray();
      expect(napitest.NapiIsSendable(value)).assertEqual(true);
      expect(value.byteLength).assertEqual(1024);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0008
     * @tc.name napiSendableTest008
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest008', 0, async (done: Function) => {
      console.info('napiSendableTest008 START');
      let value = napitest.NapiCreateSendableObject();
      napitest.NapiWrapSendable(value, "data");
      expect(napitest.NapiUnwrapSendable(value)).assertEqual("data");
      expect(napitest.NapiRemoveWrapSendable(value)).assertEqual("data");
      expect(napitest.NapiUnwrapSendable(value)).assertEqual(undefined);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0009
     * @tc.name napiSendableTest009
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest009', 0, async (done: Function) => {
      console.info('napiSendableTest009 START');
      let value = napitest.NapiCreateSendableObject();
      napitest.NapiWrapSendableWithSize(value, "data");
      expect(napitest.NapiUnwrapSendable(value)).assertEqual("data");
      expect(napitest.NapiRemoveWrapSendable(value)).assertEqual("data");
      expect(napitest.NapiUnwrapSendable(value)).assertEqual(undefined);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0010
     * @tc.name napiSendableTest010
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest010', 0, async (done: Function) => {
      console.info('napiSendableTest010 START');
      let flag = createInt()
      let lock = new utils.locks.AsyncLock;
      let p = lock.lockAsync(async () => {
        exchange(flag, 0, 1);
        await Promise.resolve();
        exchange(flag, 1, 0);

      })
      let p0 = lock.lockAsync(async () => {
        exchange(flag, 0, 2);
        await Promise.resolve();
        exchange(flag, 2, 0);
      })
      await Promise.all([p, p0])
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0011
     * @tc.name napiSendableTest011
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest011', 0, async (done: Function) => {
      console.info('napiSendableTest011 START');
      let flag = createInt()
      let lock = new utils.locks.AsyncLock;
      let p = lock.lockAsync(async () => {
        exchange(flag, 0, 1);
        lock.lockAsync(async () => {
          exchange(flag, 1, 2);
        }, utils.locks.AsyncLockMode.SHARED);
        exchange(flag, 2, 0);
      }, utils.locks.AsyncLockMode.SHARED);
      await Promise.all([p]);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0012
     * @tc.name napiSendableTest012
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest012', 0, async (done: Function) => {
      console.info('napiSendableTest012 START');
      let lockName = "queryTestLock";
      let lock = utils.locks.AsyncLock.request(lockName);
      let p = lock.lockAsync(async () => {
        let states = utils.locks.AsyncLock.queryAll();
        expect(states.length != 0).assertTrue();
        let state = utils.locks.AsyncLock.query(lock.name);
        expect(state.pending == 0).assertTrue();
        expect(state.held.length == 1).assertTrue();
        expect(state.held[0].name == lockName);
        expect(state.held[0].mode == utils.locks.AsyncLockMode.EXCLUSIVE);
      })
      await Promise.all([p])
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0013
     * @tc.name napiSendableTest013
     * @tc.desc aceNapiEtsTest
     */
    it('napiSendableTest013', 0, async (done: Function) => {
      console.info('napiSendableTest013 START');
      let lock = new utils.locks.AsyncLock;
      let s: utils.locks.AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new utils.locks.AsyncLockOptions<string>();
      options.isAvailable = false;
      options.signal = s;
      let p = lock.lockAsync(async () => {
        return;
      }, utils.locks.AsyncLockMode.EXCLUSIVE, options);
      s.aborted = true;
      let p0 = p.then(() => {
        expect(true).assertFalse();
      }, () => {
        expect(true).assertTrue();
      })
      await Promise.all([p0])
      done();
    });
  })
}
