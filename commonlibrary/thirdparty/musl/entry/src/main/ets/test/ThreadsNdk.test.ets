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

import { describe, expect, it } from '@ohos/hypium'
import threads from 'libthreadsndk.so'

export default function threadsNdkTest() {
  describe('MuslthreadsNdkTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_CREATE_0100
     * @tc.name       : testMuslThreadsThrdCreate001
     * @tc.desc       : test thrd_create
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdCreate001', 0, async (done: Function) => {
      let a = 1;
      let c: number = threads.thrd_create(a);
      expect(c).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_CURRENT_0100
     * @tc.name       : testMuslThreadsThrdCurrent001
     * @tc.desc       : test thrd_current
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdCurrent001', 0, async (done: Function) => {
      let a = 1;
      let c: number = threads.thrd_current(a);
      expect(c).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_SLEEP_0100
     * @tc.name       : testMuslThreadsThrdSleep001
     * @tc.desc       : test thrd_sleep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdSleep001', 0, async (done: Function) => {
      let a = 1;
      let c: number = threads.thrd_sleep(a);
      expect(c).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_DETACH_0100
     * @tc.name       : testMuslThreadsThrdDetach001
     * @tc.desc       : test thrd_detach
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdDetach001', 0, async (done: Function) => {
      let a = 1;
      let c: number = threads.thrd_detach(a);
      expect(c).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_EQUAL_0100
     * @tc.name       : testMuslThreadsThrdEqual001
     * @tc.desc       : test thrd_equal
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdEqual001', 0, async (done: Function) => {
      let a = 1;
      let c: number = threads.thrd_equal(a);
      expect(c).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_JOIN_0100
     * @tc.name       : testMuslThreadsThrdJoin001
     * @tc.desc       : test thrd_join
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdJoin001', 0, async (done: Function) => {
      let a = 1;
      let c: number = threads.thrd_join(a);
      expect(c).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_EXIT_0100
     * @tc.name       : testMuslThreadsThrdExit001
     * @tc.desc       : test thrd_exit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdExit001', 0, async (done: Function) => {
      let a = 1;
      let c: number = threads.thrd_exit(a);
      expect(c).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_YIELD_0100
     * @tc.name       : testMuslThreadsThrdYield001
     * @tc.desc       : test thrd_yield
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdYield001', 0, async (done: Function) => {
      let a = 1;
      let c: number = threads.thrd_yield(a);
      expect(c).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_TSS_CREATE_0100
     * @tc.name       : testMuslThreadsTssCreate001
     * @tc.desc       : test tss_create
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsTssCreate001', 0, async (done: Function) => {
      let b = 1;
      let result: number = threads.tss_create(b);
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_TSS_SET_0100
     * @tc.name       : testMuslThreadsTssSet001
     * @tc.desc       : test tss_set
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsTssSet001', 0, async (done: Function) => {
      let b = 1;
      let result: number = threads.tss_set(b);
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_TSS_GET_0100
     * @tc.name       : testMuslThreadsTssGet001
     * @tc.desc       : test tss_get
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsTssGet001', 0, async (done: Function) => {
      let b = 1;
      let result: number = threads.tss_get(b);
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_TSS_DELETE_0100
     * @tc.name       : testMuslThreadsTssDelete001
     * @tc.desc       : test tss_delete
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsTssDelete001', 0, async (done: Function) => {
      let b = 1;
      let result: number = threads.tss_delete(b);
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_INIT_0100
     * @tc.name       : testMuslThreadsCndInit001
     * @tc.desc       : test cnd_init
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsCndInit001', 0, async (done: Function) => {
      expect(threads.cnd_init()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_SIGNAL_0100
     * @tc.name       : testMuslThreadsCndSignal001
     * @tc.desc       : test cnd_signal
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsCndSignal001', 0, async (done: Function) => {
      expect(threads.cnd_signal()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_DESTROY_0100
     * @tc.name       : testMuslThreadsCndDestroy001
     * @tc.desc       : test cnd_destroy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsCndDestroy001', 0, async (done: Function) => {
      expect(threads.cnd_destroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_BROADCAST_0100
     * @tc.name       : testMuslThreadsCndBroadcast001
     * @tc.desc       : test cnd_broadcast
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsCndBroadcast001', 0, async (done: Function) => {
      expect(threads.cnd_broadcast()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CALL_ONCE_0100
     * @tc.name       : testMuslThreadsCallOnce001
     * @tc.desc       : test call_once
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsCallOnce001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = threads.callOnce();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXDESTORY_0100
     * @tc.name       : testMuslThreadsMtxDestroy001
     * @tc.desc       : mtx_destroy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxDestroy001', 0, async (done: Function) => {
      let a: number = threads.mtxDestroy();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXINIT_0100
     * @tc.name       : testMuslThreadsMtxInit001
     * @tc.desc       : mtx_init
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxInit001', 0, async (done: Function) => {
      let a: number = threads.mtxInit();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXLOCK_0100
     * @tc.name       : testMuslThreadsMtxLock001
     * @tc.desc       : mtx_lock
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxLock001', 0, async (done: Function) => {
      let a: number = threads.mtxLock();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXTIMEDLOCK_0100
     * @tc.name       : testMuslThreadsMtxTimedLock001
     * @tc.desc       : mtx_timedlock
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxTimedLock001', 0, async (done: Function) => {
      let a: number = threads.mtxTimedLock();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXTRYLOCK_0100
     * @tc.name       : testMuslThreadsMtxTryLock001
     * @tc.desc       : mtx_trylock
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxTryLock001', 0, async (done: Function) => {
      let a: number = threads.mtxTryLock();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXUNLOCK_0100
     * @tc.name       : testMuslThreadsMtxUnLock001
     * @tc.desc       : mtx_unlock
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxUnLock001', 0, async (done: Function) => {
      let a: number = threads.mtxUnLock();
      expect(a).assertEqual(0);
      done()
    });
  })
}
