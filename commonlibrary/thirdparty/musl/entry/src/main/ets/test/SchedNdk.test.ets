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
import sched from 'libschedndk.so'

export default function schedNdkTest() {
  describe('MuslSchedTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPRIORITYMAX_0100
     * @tc.name       : testMuslSchedSchedGetPriorityMax001
     * @tc.desc       : test sched_get_priority_max
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSchedSchedGetPriorityMax001', 0, async (done: Function) => {
      let b = 1
      let a = sched.schedGetPriorityMax(b);
      expect(a).assertEqual(99);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPRIORITYMAX_0200
     * @tc.name       : testMuslSchedSchedGetPriorityMax002
     * @tc.desc       : test sched_get_priority_max
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSchedSchedGetPriorityMax002', 0, async (done: Function) => {
      let b = 100
      let a = sched.schedGetPriorityMax(b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPRIORITYMIX_0100
     * @tc.name       : testMuslSchedSchedGetPriorityMin001
     * @tc.desc       : test sched_get_priority_min
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSchedSchedGetPriorityMin001', 0, async (done: Function) => {
      let b = 1
      let a = sched.schedGetPriorityMin(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPRIORITYMIN_0200
     * @tc.name       : testMuslSchedSchedGetPriorityMin002
     * @tc.desc       : test sched_get_priority_min
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSchedSchedGetPriorityMin002', 0, async (done: Function) => {
      let b = 100
      let a = sched.schedGetPriorityMin(b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDYIELD_0100
     * @tc.name       : testMuslSchedSchedYield001
     * @tc.desc       : test sched_yield
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSchedSchedYield001', 0, async (done: Function) => {
      let a = sched.sched_yield();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDSETPARAM_0100
     * @tc.name       : testMuslSchedSchedSetparam001
     * @tc.desc       : test sched_setparam
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testMuslSchedSchedSetparam001', 0, async (done: Function) => {
      let a = sched.sched_setparam(-1);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDSETPARAM_0200
     * @tc.name       : testMuslSchedSchedSetparam002
     * @tc.desc       : test sched_setparam
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSchedSchedSetparam002', 0, async (done: Function) => {
      let a = sched.sched_setparam(0);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDSETSCHEDULER_0100
     * @tc.name       : testMuslSchedSchedSetscheduler001
     * @tc.desc       : test sched_setscheduler
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSchedSchedSetscheduler001', 0, async (done: Function) => {
      let a = sched.sched_setscheduler(-1);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDSETSCHEDULER_0200
     * @tc.name       : testMuslSchedSchedSetscheduler002
     * @tc.desc       : test sched_setscheduler
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSchedSchedSetscheduler002', 0, async (done: Function) => {
      let a = sched.sched_setscheduler(0);
      expect(a).assertEqual(-1);
      done()
    });
  })
}