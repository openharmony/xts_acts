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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import account from '@ohos.account.distributedAccount'
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsDANoPermissionTestStatic() {
  describe('ActsDANoPermissionTestStatic', () => {

    /**
     * @tc.number  : SUB_Account_DistributedAccount_NoPermission_0100
     * @tc.name    : SUB_Account_DistributedAccount_NoPermission_static_0100
     * @tc.desc    : no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_DistributedAccount_NoPermission_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>SUB_Account_DistributedAccount_NoPermission_0100 start====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          accountAbility.getOsAccountDistributedInfo((err: BusinessError, data: account.DistributedInfo) => {
            hilog.info(domain, tag, "====>getOsAccountDistributedInfo err: " + JSON.stringify(err));
            hilog.info(domain, tag, "====>getOsAccountDistributedInfo data: " + JSON.stringify(data));
            try {
              expect(err.code + '' == '201').assertTrue();
            } catch (err) {
              hilog.info(domain, tag, "====>Assert err: " + JSON.stringify(err));
            }
            done();
          });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, "====>getOsAccountDistributedInfo catch err: " + JSON.stringify(err));
          expect(err.code + '' == '201').assertTrue();
          done();
        }
      });

    /**
     * @tc.number  : SUB_Account_DistributedAccount_NoPermission_0200
     * @tc.name    : SUB_Account_DistributedAccount_NoPermission_static_0200
     * @tc.desc    : no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Account_DistributedAccount_NoPermission_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>SUB_Account_DistributedAccount_NoPermission_0200 start====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          await accountAbility.getOsAccountDistributedInfo();
          expect().assertFail();
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, "====>getOsAccountDistributedInfo err: " + JSON.stringify(err));
          expect(err.code + '' == '201').assertTrue();
          done();
        }
      });
  });
}