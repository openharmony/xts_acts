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
import commonEventManager from '@ohos.commonEventManager'
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import deviceInfo from '@ohos.deviceInfo';
import hilog from '@ohos.hilog'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let deviceType: string = deviceInfo.deviceType;
hilog.info(domain, tag, "====>the value of the deviceinfo deviceType is: " + deviceType);

let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
hilog.info(domain, tag, "====>get os AccountManager finish====");

export default function ActsOsAccountTestStatic() {
  describe('ActsOsAccountTestStatic', () => {

    /*
    * @tc.number  : ActsOsAccountGetForegroundOsAccountLocalId_0100
    * @tc.name    : ActsOsAccountGetForegroundOsAccountLocalIdStatic_0100
    * @tc.desc    : Gets the local ID of the foreground OS account.
    * @tc.level   : Level0
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetForegroundOsAccountLocalIdStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountGetForegroundOsAccountLocalId_0100 start====");
        try {
          let localId: int = await accountManager.getForegroundOsAccountLocalId();
          hilog.info(domain, tag, "====>ActsOsAccountGetForegroundOsAccountLocalId_0100 localId: " + localId);
          expect(localId + '' == '100').assertTrue();
          hilog.info(domain, tag, "====>ActsOsAccountGetForegroundOsAccountLocalId_0100 end====");
          done();
        } catch (err) {
          hilog.info(domain, tag, "====>ActsOsAccountGetForegroundOsAccountLocalId_0100 catch err:" + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  });
}
