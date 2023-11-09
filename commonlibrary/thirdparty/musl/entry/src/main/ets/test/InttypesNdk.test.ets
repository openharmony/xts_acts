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
import inttypes from 'libinttypesndk.so'

export default function inttypesNdkTest() {
  describe('MuslInttypesTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_STRTOIMAX_0100
     * @tc.name       : testMuslInttypesStrtoimax001
     * @tc.desc       : test strtoimax
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesStrtoimax001',0,async (done:Function) => {
      let a = '1000xyz';
      let b = 'a';
      let c = 10;
      let strtoimaxResult = inttypes.strtoimax(a,b,c);
      console.info("Test strtoimaxResult= " + strtoimaxResult);
      expect(strtoimaxResult).assertEqual(1000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_STRTOIMAX_0200
     * @tc.name       : testMuslInttypesStrtoimax002
     * @tc.desc       : test strtoimax
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesStrtoimax002',0,async (done:Function) => {
      let a = 'ff';
      let b = 'xyz';
      let c = 16;
      let strtoimaxResult = inttypes.strtoimax(a,b,c);
      console.info("Test strtoimaxResult= " + strtoimaxResult);
      expect(strtoimaxResult).assertEqual(255);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_STRTOUMAX_0100
     * @tc.name       : testMuslInttypesStrtoumax001
     * @tc.desc       : test strtoumax
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesStrtoumax001',0,async (done:Function) => {
      let a = '1000xyz';
      let b = 'a';
      let c = 10;
      let strtoumaxResult = inttypes.strtoumax(a,b,c);
      console.info("Test strtoumaxResult= " + strtoumaxResult);
      expect(strtoumaxResult).assertEqual(1000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_INTTYPES_STRTOUMAX_0200
     * @tc.name       : testMuslInttypesStrtoumax002
     * @tc.desc       : test strtoimax
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslInttypesStrtoumax002',0,async (done:Function) => {
      let a = 'ff';
      let b = 'xyz';
      let c = 16;
      let strtoumaxResult = inttypes.strtoumax(a,b,c);
      console.info("Test strtoumaxResult= " + strtoumaxResult);
      expect(strtoumaxResult).assertEqual(255);
      done();
    });


  })

}