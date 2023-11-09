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
import time from 'libtimendk.so'


export default function timeNdkTest() {
  describe('MuslTimeTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETITIMER_0100
     * @tc.name       : testMuslTimeGetITimer001
     * @tc.desc       : test getitimer
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeGetITimer001', 0, async (done: Function) => {
      let data = time.getITimer();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETTIMEOFDAY_0100
     * @tc.name       : testMuslTimeGetTimeOfDay001
     * @tc.desc       : test getitimer
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeGetTimeOfDay001', 0, async (done: Function) => {
      let data = time.getTimeOfDay();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0100
     * @tc.name       : testMuslTimeSetitimer001
     * @tc.desc       : test setitimer
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeSetitimer001', 0, async (done: Function) => {
      let a = time.setitimer(0, 100000, 0, 100000);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0200
     * @tc.name       : testMuslTimeSetitimer002
     * @tc.desc       : test setitimer
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeSetitimer002', 0, async (done: Function) => {
      let a = time.setitimer(0, 0, 0, 100000);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0300
     * @tc.name       : testMuslTimeSetitimer003
     * @tc.desc       : test setitimer
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeSetitimer003', 0, async (done: Function) => {
      let a = time.setitimer(0, 100000, 0, 0);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0400
     * @tc.name       : testMuslTimeSetitimer004
     * @tc.desc       : test setitimer
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeSetitimer004', 0, async (done: Function) => {
      let a = time.setitimer(100000, 100000, 100000, 0);
      expect(a).assertEqual(0);
      done()
    });

  })
}
