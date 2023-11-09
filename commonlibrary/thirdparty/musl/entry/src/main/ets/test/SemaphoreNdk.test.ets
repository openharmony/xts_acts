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
import semaphore from 'libsemaphorendk.so'

export default function semaphoreNdkTest() {
  describe('MuslSemaphoreTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_Semaphore_SEMGETVALUE_0100
     * @tc.name       : testMuslSemaphoreSemGetvalue001
     * @tc.desc       : test sem_getvalue
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemGetvalue001', 0, async (done: Function) => {
      let b = 1
      let a = semaphore.sem_getvalue(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMOPEN_0100
     * @tc.name       : testMuslSemaphoreSemOpen001
     * @tc.desc       : test sem_open
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemOpen001', 0, async (done: Function) => {
      let a = semaphore.sem_open(1);
      expect(a).assertEqual(-1000);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMINIT_0100
     * @tc.name       : testMuslSemaphoreSemInit001
     * @tc.desc       : test sem_init
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemInit001', 0, async (done: Function) => {
      let b = 0
      let a = semaphore.sem_init(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMINIT_0200
     * @tc.name       : testMuslSemaphoreSemInit002
     * @tc.desc       : test sem_init
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemInit002', 0, async (done: Function) => {
      let b = -1
      let a = semaphore.sem_init(b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMDESTROY_0100
     * @tc.name       : testMuslSemaphoreSemDestroy001
     * @tc.desc       : test sem_destroy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemDestroy001', 0, async (done: Function) => {

      let a = semaphore.sem_destroy();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMPOST_0100
     * @tc.name       : testMuslSemaphoreSemPost001
     * @tc.desc       : test sem_post
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemPost001', 0, async (done: Function) => {
      let a = semaphore.sem_post();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMWAIT_0100
     * @tc.name       : testMuslSemaphoreSemWait001
     * @tc.desc       : test sem_wait
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testMuslSemaphoreSemWait001', 0, async (done: Function) => {
      let b = 1
      let a = semaphore.sem_wait(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMTRYWAIT_0100
     * @tc.name       : testMuslSemaphoreSemTrywait001
     * @tc.desc       : test sem_trywait
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemTrywait001', 0, async (done: Function) => {
      let b = 0
      let a = semaphore.sem_trywait(b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMTRYWAIT_0200
     * @tc.name       : testMuslSemaphoreSemTrywait002
     * @tc.desc       : test sem_trywait
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemTrywait002', 0, async (done: Function) => {
      let b = 1
      let a = semaphore.sem_trywait(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMTIMEDWAIT_0100
     * @tc.name       : testMuslSemaphoreSemTimedwait001
     * @tc.desc       : test sem_timedwait
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemTimedwait001', 0, async (done: Function) => {
      let b = 0
      let a = semaphore.sem_timedwait(b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMTIMEDWAIT_0200
     * @tc.name       : testMuslSemaphoreSemTimedwait002
     * @tc.desc       : test sem_timedwait
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemTimedwait002', 0, async (done: Function) => {
      let b = 1
      let a = semaphore.sem_timedwait(b);
      expect(a).assertEqual(0);
      done()
    });
  })
}