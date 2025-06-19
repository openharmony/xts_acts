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
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';
import account from '@ohos.account.distributedAccount'
import hilog from '@ohos.hilog'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


let deviceType: string = deviceInfo.deviceType;
hilog.info(domain, tag, "====>the value of the deviceinfo deviceType is: " + deviceType);

export default function ActsDAGetSetTestStatic() {
  describe('ActsDAGetSetTestStatic', () => {
    hilog.info(domain, tag, '%{public}s', '====>describe start');

    /**
     * @tc.number   : getDistributedAccountAbility_test
     * @tc.name     : getDistributedAccountAbilityStatic_test
     * @tc.desc     : Test distributedAccount.getDistributedAccountAbility API functionality.
     * @tc.level    : Level0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     */
    it('getDistributedAccountAbilityStatic_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>start getDistributedAccountAbility_test====");
        let ret: boolean = false;
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        hilog.info(domain, tag, "====>getDistributedAccountAbility_test result:" + JSON.stringify(accountAbility));
        if (accountAbility !== null) {
          ret = true;
        }
        expect(ret).assertTrue();
        done();
      });

    /**
     * @tc.number   : getOsAccountDistributedInfo_test001
     * @tc.name     : getOsAccountDistributedInfoStatic_test0100
     * @tc.desc     : Test distributedAccount.getOsAccountDistributedInfo API functionality.
     * @tc.level    : Level0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     */
    it('getOsAccountDistributedInfoStatic_test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>start getOsAccountDistributedInfoStatic_test0100====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          hilog.info(domain, tag, "====>start getOsAccountDistributedInfo promise");
          let data: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo();
          hilog.info(domain, tag, '====>getOsAccountDistributedInfoStatic_test0100 data:' + JSON.stringify(data));
          expect(data.name == 'ohosAnonymousName').assertTrue();
          expect(data.id == 'ohosAnonymousUid').assertTrue();
          expect(data.event == '').assertTrue();
          expect(data.status == account.DistributedAccountStatus.NOT_LOGGED_IN).assertTrue();
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>getOsAccountDistributedInfoStatic_test0100 err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number   : getOsAccountDistributedInfo_test002
     * @tc.name     : getOsAccountDistributedInfoStatic_test0200
     * @tc.desc     : Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
     * @tc.level    : Level0
     * @tc.size     : MediumTest
     * @tc.type     : Function
     */
    it('getOsAccountDistributedInfoStatic_test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>start getOsAccountDistributedInfoStatic_test0200====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          hilog.info(domain, tag, "====>start getOsAccountDistributedInfo callback");
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined) => {
            hilog.info(domain, tag, '====>getOsAccountDistributedInfoStatic_test0200 err:' + JSON.stringify(err));
            hilog.info(domain, tag, '====>getOsAccountDistributedInfoStatic_test0200 data:' + JSON.stringify(data));
            try {
              if (err && data) {
                expect(err.code + '' == '0').assertTrue();
                expect(data.name == 'ohosAnonymousName').assertTrue();
                expect(data.id == 'ohosAnonymousUid').assertTrue();
                expect(data.event == '').assertTrue();
                expect(data.status == account.DistributedAccountStatus.NOT_LOGGED_IN).assertTrue();
                hilog.info(domain, tag, "====>getOsAccountDistributedInfoStatic_test0200 success");
              } else {
                hilog.info(domain, tag, '====>getOsAccountDistributedInfo fail');
                expect().assertFail();
              }
            } catch (err: BusinessError<void>) {
              hilog.info(domain, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            done();
          });
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>getOsAccountDistributedInfo_test002 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  });
}
