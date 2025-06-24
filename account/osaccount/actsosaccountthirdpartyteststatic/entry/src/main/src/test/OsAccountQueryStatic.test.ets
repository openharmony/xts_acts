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
import bundle from '@ohos.bundle.bundleManager'
import { BusinessError } from '@ohos.base';
import {describe, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
hilog.info(domain, tag, "====>get os AccountManager finish====");

export default function ActsOsAccountThirdPartyTest_third_4_Static() {
  describe('ActsOsAccountThirdPartyTest_third_4', (): void => {

    /*
    * @tc.number  : ActsOsAccountQueryIdFormUid_0100
    * @tc.name    : ActsOsAccountQueryIdFormUidStatic_0100
    * @tc.desc    : Verify that the user localId is obtained by uid
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountQueryIdFormUidStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUid_0100 start====");
        try {
          accountManager.getOsAccountLocalIdForUid(3058, (err: BusinessError<void>, localId: int) => {
            hilog.info(domain, tag, "====>get localId err: " + JSON.stringify(err));
            hilog.info(domain, tag, "====>localId obtained by uid:" + localId);
            try {
              expect(err.code + '' == '0').assertTrue();
              expect(localId + '' == '0').assertTrue();
              hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUid_0100 end====");
            } catch (err: BusinessError<void>) {
              hilog.info(domain, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            done();
          });
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>ActsOsAccountQueryIdFormUid_0100 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountQueryIdFormUid_0200
    * @tc.name    : ActsOsAccountQueryIdFormUidStatic_0200
    * @tc.desc    : Verify that the user localId is obtained by uid
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountQueryIdFormUidStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUid_0200 start====");
        try {
          let localId: int = await accountManager.getOsAccountLocalIdForUid(3058);
          hilog.info(domain, tag, "====>localId obtained by uid:" + localId);
          expect(localId + '' == '0').assertTrue();
          hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUid_0200 end====");
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>ActsOsAccountQueryIdFormUid_0200 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountQueryIdFormUid_0300
    * @tc.name    : ActsOsAccountQueryIdFormUidStatic_0300
    * @tc.desc    : Authentication failed to query user by uid -1
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountQueryIdFormUidStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUid_0300 start====");
        let incorrectUid: int = -1;
        try {
          accountManager.getOsAccountLocalIdForUid(incorrectUid, (err: BusinessError<void>, localId: int) => {
            hilog.info(domain, tag, "====>get localId err: " + JSON.stringify(err));
            hilog.info(domain, tag, "====>localId obtained by uid:" + localId);
            try {
              expect(err.code + '' == '12300002').assertTrue();
              hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUid_0300 end====");
            } catch (err: BusinessError<void>) {
              hilog.info(domain, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            done();
          });
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>ActsOsAccountQueryIdFormUid_0300 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountQueryIdFormUid_0400
    * @tc.name    : ActsOsAccountQueryIdFormUidStatic_0400
    * @tc.desc    : Authentication failed to query user by uid -1
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountQueryIdFormUidStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUid_0400 start====");
        let incorrectUid: int = -1;
        try {
          let localId: int = await accountManager.getOsAccountLocalIdForUid(incorrectUid);
          hilog.info(domain, tag, "====>localId obtained by uid:" + localId);
          expect().assertFail();
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, "====>get localId by uid err:" + JSON.stringify(err));
          expect(err.code + '' == '12300002').assertTrue();
          hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUid_0400 end====");
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountQueryIdFormUidSync_0100
    * @tc.name    : ActsOsAccountQueryIdFormUidSyncStatic_0100
    * @tc.desc    : Verify that the user localId is obtained by uid
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountQueryIdFormUidSyncStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUidSync_0100 start====");
        try {
          let localId: int = accountManager.getOsAccountLocalIdForUidSync(3058);
          hilog.info(domain, tag, 'getOsAccountLocalIdForUidSync successfully, localId: ' + localId);
          expect(localId + '' == '0').assertTrue();
          hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUidSync_0100 end====");
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, "====>get localId err: " + JSON.stringify(err));
          hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUidSync_0100 end====");
          expect().assertFalse()
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountQueryIdFormUidSync_0200
    * @tc.name    : ActsOsAccountQueryIdFormUidSyncStatic_0200
    * @tc.desc    : Authentication failed to query user by uid -1
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountQueryIdFormUidSyncStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUidSync_0200 start====");
        let incorrectUid: int = -1;
        try {
          let localId: int = accountManager.getOsAccountLocalIdForUidSync(incorrectUid);
          hilog.info(domain, tag, "====>localId obtained by uid:" + localId);
          expect().assertFail();
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, "====>get localId err: " + JSON.stringify(err));
          expect(err.code + '' == '12300002').assertTrue();
          hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormUidSync_0200 end====");
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountQueryIdFormProcess_0100
    * @tc.name    : ActsOsAccountQueryIdFormProcessStatic_0100
    * @tc.desc    : Verify that the user localId obtained from the current process uid
    * @tc.level   : Level0
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountQueryIdFormProcessStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormProcess_0100 start====");
        try {
          accountManager.getOsAccountLocalId((err: BusinessError<void>, localId: int) => {
            hilog.info(domain, tag, "====>get localId err: " + JSON.stringify(err));
            hilog.info(domain, tag, "====>localId obtained by process:" + localId);
            try {
              expect(err.code + '' == '0').assertTrue();
              expect(localId + '' == '100').assertTrue();
              hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormProcess_0100 end====");
            } catch (err: BusinessError<void>) {
              hilog.info(domain, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            done();
          });
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>ActsOsAccountQueryIdFormProcess_0100 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountQueryIdFormProcess_0200
    * @tc.name    : ActsOsAccountQueryIdFormProcessStatic_0200
    * @tc.desc    : Verify that the user localId obtained from the current process uid
    * @tc.level   : Level0
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountQueryIdFormProcessStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormProcess_0200 start====");
        try {
          let localId: int = await accountManager.getOsAccountLocalId();
          hilog.info(domain, tag, "====>localId obtained by process:" + localId);
          expect(localId + '' == '100').assertTrue();
          hilog.info(domain, tag, "====>ActsOsAccountQueryIdFormProcess_0200 end====");
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>getOsAccountDistributedInfoStatic_test0100 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountgetType_0100
    * @tc.name    : ActsOsAccountgetTypeStatic_0100
    * @tc.desc    : Verify that the user type obtained from the current process uid
    * @tc.level   : Level0
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountgetTypeStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountgetType_0100 start====");
        try {
          accountManager.getOsAccountType((err: BusinessError<void>, accountType: osAccount.OsAccountType) => {
            hilog.info(domain, tag, "====>get type err: " + JSON.stringify(err));
            hilog.info(domain, tag, "====>type obtained by process:" + JSON.stringify(accountType));
            try {
              expect(err.code + '' == '0').assertTrue();
              expect(accountType == osAccount.OsAccountType.ADMIN).assertTrue();
              hilog.info(domain, tag, "====>ActsOsAccountgetType_0100 end====");
            } catch (err: BusinessError<void>) {
              hilog.info(domain, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            done();
          });
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>ActsOsAccountQueryIdFormProcess_0100 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountgetType_0200
    * @tc.name    : ActsOsAccountgetTypeStatic_0200
    * @tc.desc    : Verify that the user type obtained from the current process uid
    * @tc.level   : Level0
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountgetTypeStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountgetType_0200 start====");
        try {
          let accountType: osAccount.OsAccountType = await accountManager.getOsAccountType();
          hilog.info(domain, tag, "====>type obtained by process:" + JSON.stringify(accountType));
          expect(accountType == osAccount.OsAccountType.ADMIN).assertTrue();
          hilog.info(domain, tag, "====>ActsOsAccountgetType_0200 end====");
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, '====>ActsOsAccountgetType_0200 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountGetActivedOsAccountIds_0100
    * @tc.name    : ActsOsAccountGetActivedOsAccountIdsStatic_0100
    * @tc.desc    : query activated osAccount Ids
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetActivedOsAccountIdsStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountGetActivedOsAccountIds_0100 start====");
        try {
          accountManager.getActivatedOsAccountLocalIds((err: BusinessError<void>, dataArray: Array<int>): void => {
            hilog.info(domain, tag, "====>getActivatedOsAccountIds_0100 dataArray: " + dataArray);
            hilog.info(domain, tag, "====>getActivatedOsAccountIds_0100 err :" + JSON.stringify(err));
            try {
              expect(dataArray.length + '' == '1').assertTrue();
              expect(err.code + '' == '0').assertTrue();
            } catch (err: BusinessError<void>) {
              hilog.info(domain, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            done();
          });
        } catch (err: BusinessError<void>) {
          hilog.info(domain, tag, "====>ActsOsAccountGQueryActicedOsAccountIds_0100 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /*
    * @tc.number  : ActsOsAccountGetActivedOsAccountIds_0200
    * @tc.name    : ActsOsAccountGetActivedOsAccountIdsStatic_0200
    * @tc.desc    : query activated osAccount Ids
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetActivedOsAccountIdsStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 start====");
        try {
          let dataArray: Array<int> = await accountManager.getActivatedOsAccountLocalIds();
          hilog.info(domain, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 data: " + dataArray);
          expect(dataArray.length + '' == '1').assertTrue();
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  })
}