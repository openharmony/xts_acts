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
import setjmp from 'libsetjmpndk.so'

export default function setjmpNdkTest() {

  describe('MuslSetjmpTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SETJMP_SETJMP_0100
     * @tc.name       : testMuslSetjmpSetjmp001
     * @tc.desc       : test setjmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSetjmpSetjmp001', 0, async (done: Function) => {
      let a = setjmp.setjmp(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SETJMP_SETJMP_0200
     * @tc.name       : testMuslSetjmpSetjmp002
     * @tc.desc       : test setjmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSetjmpSetjmp002', 0, async (done: Function) => {
      let a = setjmp.setjmp(-1,3);
      expect(a).assertEqual(3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SETJMP_SIGSETJMP_0100
     * @tc.name       : testMuslSetjmpsigSetjmp001
     * @tc.desc       : test sigsetjmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSetjmpsigSetjmp001', 0, async (done: Function) => {
      let a = setjmp.sigsetjmp(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SETJMP_SIGSETJMP_0200
     * @tc.name       : testMuslSetjmpsigSetjmp002
     * @tc.desc       : test sigsetjmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSetjmpsigSetjmp002', 0, async (done: Function) => {
      let a = setjmp.sigsetjmp(-1,3);
      expect(a).assertEqual(3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SETJMP_SIGLONGJMP_0100
     * @tc.name       : testMuslSetjmpsigLongjmp001
     * @tc.desc       : test siglongjmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSetjmpSiglongjmp001', 0, async (done: Function) => {
      let a = setjmp.siglongjmp(3);
      expect(a).assertEqual(3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SETJMP_SIGLONGJMP_0200
     * @tc.name       : testMuslSetjmpsigLongjmp002
     * @tc.desc       : test siglongjmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSetjmpSiglongjmp002', 0, async (done: Function) => {
      let a = setjmp.siglongjmp(0);
      expect(a).assertEqual(1);
      done()
    });
  })
}