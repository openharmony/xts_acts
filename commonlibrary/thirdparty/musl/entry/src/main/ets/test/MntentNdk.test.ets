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
import mntent from 'libmntentndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function mntentNdkTest() {
  describe('MuslMntentTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MNTENT_SETMNTENT_0100
     * @tc.name       : testMuslMntentSetmntent001
     * @tc.desc       : test setmntent
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMntentSetmntent001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);

      let a: number = mntent.setmntent();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MNTENT_GETMNTENT_0100
     * @tc.name     : testMuslMntentGetMnTent001
     * @tc.desc     : test getmntent
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    //Block comment


    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MNTENT_GETMNTENT_R_0100
     * @tc.name     : testMuslMntentGetMnTentR001
     * @tc.desc     : test getmntent_r
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    //Block comment

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MNTENT_HASMNTOPT_0100
     * @tc.name     : testMuslMntentHasmntopt001
     * @tc.desc     : test hasmntopt
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslMntentHasmntopt001', 0, async (done: Function) => {
      let result: number = mntent.hasmntopt();
      expect(result).assertEqual(0)
      done()
    });
  })
}