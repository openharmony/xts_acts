/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

import userAuth from '@ohos.userIAM.userAuth'
import { checkSupportOrNot } from './utils/commonFunc';

// import { cryptoFramework } from '@ohos.security.cryptoFramework';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let format: string = '%{public}s'
let testAbilityContext:common.UIAbilityContext;



export default function userauthTest_API9() {
  describe('userauthTest_API9', (): void => {
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
        },
      }, (err : BusinessError) : void => {
        if (err != null ) {
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.myapplication102.static")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.number    : Security_IAM_Func_Static_0102
     * @tc.name      : Security_IAM_Func_Static_0102
     * @tc.desc      : Abnormal testing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('Security_IAM_Func_Static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,'testFace Security_IAM_Func_Static_0102 start');
      let authType:userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT, userAuth.UserAuthType.PIN]
      let level:userAuth.AuthTrustLevel[] = [userAuth.AuthTrustLevel.ATL1, userAuth.AuthTrustLevel.ATL2, userAuth.AuthTrustLevel.ATL3]
      for (let idx0 = 0; idx0 < authType.length; idx0++) {
        let checkSupport = checkSupportOrNot(authType[idx0]);
        if (checkSupport == 0) {
          for (let idx1 = 0; idx1 < level.length; idx1++) {
            try {
              hilog.info(domain, tag, format,'Security_IAM_Func_Static_0102 authtype:' + authType[idx0] + 'trustlevel:' + level[idx1])
              userAuth.getAvailableStatus(authType[idx0], level[idx1]);
            } catch (e:BusinessError) {
              hilog.info(domain, tag, format,"Security_IAM_Func_Static_0102 fail " + 'authType:' + authType[idx0] + 'trustlevel:' + level[idx1] + 'e.code:' + e.code);
              expect((e.code == userAuth.UserAuthResultCode.NOT_ENROLLED) || (e.code == userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT)).assertTrue();
              done();
            }
          }
        }
      }
      let authType1:userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT, userAuth.UserAuthType.PIN];
      let level1:userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL4;
      for (let idx2 = 0; idx2 < authType1.length; idx2++) {
        let checkSupport1 = checkSupportOrNot(authType1[idx2]);
        if (checkSupport1 == 0) {
          try {
            hilog.info(domain, tag, format,'Security_IAM_Func_Static_0102 authtype:' + authType1[idx2] + 'trustlevel:' + level1)
            userAuth.getAvailableStatus(authType1[idx2], level1);
          } catch (e:BusinessError) {
            hilog.info(domain, tag, format,"Security_IAM_Func_Static_0102 fail " + 'authType:' + authType1[idx2] + 'trustlevel:' + level1 + 'e.code:' + e.code);
            expect((e.code == userAuth.UserAuthResultCode.NOT_ENROLLED) || (e.code == userAuth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT)).assertTrue();
            done();
          }
        }

      }
      let authType2:userAuth.UserAuthType = userAuth.UserAuthType.FACE;
      let checkFace = checkSupportOrNot(authType2);
      if (checkFace == 0) {
        try {
          hilog.info(domain, tag, format,'Security_IAM_Func_Static_0102 authtype:' + authType2 + 'trustlevel:' + level1)
          userAuth.getAvailableStatus(authType2, level1);
        } catch (e:BusinessError) {
          hilog.info(domain, tag, format,"Security_IAM_Func_Static_0102 fail " + 'authType:' + authType2 + 'trustlevel:' + level1 + 'e.code:' + e.code);
          expect((e.code == userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT) ||
            (e.code == userAuth.UserAuthResultCode.NOT_ENROLLED) || (e.code == userAuth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT)).assertTrue();
          done();
        }
      }
      done();
    })





    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_Static_0104
        * @tc.name      : Security_IAM_PIN_Kit_Func_Static_0104
        * @tc.desc      : Enumeration testing
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_Static_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,'testFace Security_IAM_PIN_Kit_Func_Static_0104 start');
      expect('10000').assertEqual(''+userAuth.AuthTrustLevel.ATL1);
      expect('20000').assertEqual(''+userAuth.AuthTrustLevel.ATL2);
      expect('30000').assertEqual(''+userAuth.AuthTrustLevel.ATL3);
      expect('40000').assertEqual(''+userAuth.AuthTrustLevel.ATL4);
      hilog.info(domain, tag, format,'testFace Security_IAM_PIN_Kit_Func_Static_0104 end');
      done();
    })



    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_Static_0106
        * @tc.name      : Security_IAM_PIN_Kit_Func_Static_0106
        * @tc.desc      : Enumeration testing
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_Static_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,'testFace Security_IAM_PIN_Kit_Func_Static_0106 start');
      expect('2').assertEqual(''+userAuth.UserAuthType.FACE);
      expect('4').assertEqual(''+userAuth.UserAuthType.FINGERPRINT);
      hilog.info(domain, tag, format,'testFace Security_IAM_PIN_Kit_Func_Static_0106 end');
      done();
    })

    /*
        * @tc.number    : Security_IAM_Func_Static_0107
        * @tc.name      : Security_IAM_Func_Static_0107
        * @tc.desc      : Enumeration testing
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_Func_Static_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,'testFace Security_IAM_Func_Static_0107 start');
      expect('12500000').assertEqual(''+userAuth.UserAuthResultCode.SUCCESS);
      expect('12500001').assertEqual(''+userAuth.UserAuthResultCode.FAIL);
      expect('12500002').assertEqual(''+userAuth.UserAuthResultCode.GENERAL_ERROR);
      expect('12500003').assertEqual(''+userAuth.UserAuthResultCode.CANCELED);
      expect('12500004').assertEqual(''+userAuth.UserAuthResultCode.TIMEOUT);
      expect('12500005').assertEqual(''+userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
      expect('12500006').assertEqual(''+userAuth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT);
      expect('12500007').assertEqual(''+userAuth.UserAuthResultCode.BUSY);
      expect('12500009').assertEqual(''+userAuth.UserAuthResultCode.LOCKED);
      expect('12500010').assertEqual(''+userAuth.UserAuthResultCode.NOT_ENROLLED);
      expect('12500011').assertEqual(''+userAuth.UserAuthResultCode.CANCELED_FROM_WIDGET);
      expect('12500013').assertEqual(''+userAuth.UserAuthResultCode.PIN_EXPIRED);
      hilog.info(domain, tag, format,'testFace Security_IAM_Func_Static_0107 end');
      done();
    })



  });
};

