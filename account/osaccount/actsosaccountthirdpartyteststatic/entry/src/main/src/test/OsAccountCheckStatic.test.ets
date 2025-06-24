/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import osAccount from '@ohos.account.osAccount'
import distributedAccount from '@ohos.account.distributedAccount'
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let accountManager: osAccount.AccountManager = osAccount.getAccountManager();

export default function ActsOsAccountThirdPartyTest_third_3_Static() {
  describe('ActsOsAccountThirdPartyTest_third_3', (): void => {

    /*
    * @tc.number  : ActsOsAccountIsOsAccountUnlocked_0100
    * @tc.name    : ActsOsAccountIsOsAccountUnlockedStatic_0100
    * @tc.desc    : Verify that the initial state query is unlocked to false
    * @tc.level   : Level0
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountIsOsAccountUnlockedStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountIsOsAccountUnlocked_0100 start====");
        try {
          let isOsAccountUnlocked: boolean = await accountManager.isOsAccountUnlocked();
          hilog.info(domain, tag, "====>isOsAccountUnlocked data:" + JSON.stringify(isOsAccountUnlocked));
          expect(isOsAccountUnlocked).assertTrue();
          hilog.info(domain, tag, "====>ActsOsAccountIsOsAccountUnlocked_0100 end====");
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>ActsOsAccountIsOsAccountUnlocked_0100 err:' + JSON.stringify(err));
          expect().assertFail();
          done()
        }
      })
  })
}