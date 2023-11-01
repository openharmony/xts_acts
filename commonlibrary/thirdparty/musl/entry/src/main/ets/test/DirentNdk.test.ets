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
import dirent from 'libdirentndk.so'

export default function direntNdkTest() {
  describe('MuslDirentTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SELECT_0100
     * @tc.name       : testMuslDirentSelect001
     * @tc.desc       : select
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentSelect001', 0, async (done: Function) => {
      let b = 0
      let a = dirent.select(b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SELECT_0200
     * @tc.name       : testMuslDirentSelect002
     * @tc.desc       : select
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentSelect002', 0, async (done: Function) => {
      let a = dirent.select(1);
      expect(a).assertEqual(1);
      done()
    });
  })
}