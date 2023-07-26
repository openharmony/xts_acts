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

import { describe, it, expect } from '@ohos/hypium'
import userAuth from '@ohos.userIAM.userAuth'

const authParamDefault = {
  challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
  authType: [userAuth.UserAuthType.PIN],
  authTrustLevel: userAuth.AuthTrustLevel.ATL1,
};
const widgetParamDefault = {
  title: '使用密码验证',
  navigationButtonText: '确定',
};

export default function signNormalAccessBiometricExecute() {
  describe('signNormalAccessBiometricExecute', function () {
    function userAuthPromise(...args){
      return new Promise((resolve, reject) => {
        try {
          const userAuthInstance = userAuth.getUserAuthInstance(args[0], args[1]);
          userAuthInstance.on('result', {
            callback: (onResult) => {
              console.info(`${args[2]} callback ${onResult.result}`);
              expect(onResult.result).assertEqual(args[3]);
              resolve();
            }
          });
          userAuthInstance.start();
        } catch (e) {
          console.info(`${args[2]} fail ${e.code}`);
          expect(null).assertFail();
          reject();
        }
      })
    }

          /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0007
        * @tc.name      : execute_userAuthInstance_start_is_aaaa_null
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_UserAuthInstance_Func_0007', 0, async function (done) {
        console.info("Security_IAM_UserAuthInstance_Func_0007 start");
        const startParams = [ "aaaa", null ];
        for (let index = 0; index < startParams.length; index++) {
          try {
            const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
            userAuthInstance.start(startParams[index]);
            console.info(`Security_IAM_UserAuthInstance_Func_0007 step${index + 1} success`);
            expect(null).assertFail();
          } catch (e) {
            console.info(`Security_IAM_UserAuthInstance_Func_0007 step${index + 1} fail ${e.code}`);
            expect(e.code).assertEqual(401);
          }
        }
        done();
      });
  
      /*
          * @tc.number    : Security_IAM_UserAuthInstance_Func_0009
          * @tc.name      : execute_userAuthInstance_cancel_is_aaaa_null
          * @tc.size      : MediumTest
          * @tc.type      : Function
          * @tc.level     : Level 0
      */
      it('Security_IAM_UserAuthInstance_Func_0009', 0, async function (done) {
        console.info("Security_IAM_UserAuthInstance_Func_0009 start");
        const cancelParams = [ "aaaa", null ];
        for (let index = 0; index < cancelParams.length; index++) {
          try {
            const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
            userAuthInstance.start();
            userAuthInstance.cancel(cancelParams[index]);
            console.info(`Security_IAM_UserAuthInstance_Func_0009 step${index + 1} success`);
            expect(null).assertFail();
          } catch (e) {
            console.info(`Security_IAM_UserAuthInstance_Func_0009 step${index + 1} fail ${e.code}`);
            expect(e.code).assertEqual(401);
          }
        }
        done();
      });

        /*
        * @tc.number    : Security_IAM_getUserAuthInstance_Func_0088
        * @tc.name      : execute_userAuthInstance_off
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
        it('Security_IAM_getUserAuthInstance_Func_0088', 0, async function (done) {
          console.info("Security_IAM_getUserAuthInstance_Func_0088 start");
          try {
            const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
            userAuthInstance.off();
            console.info(`Security_IAM_getUserAuthInstance_Func_0088 step1 success`);
            expect(null).assertFail();
          } catch (e) {
            console.info(`Security_IAM_getUserAuthInstance_Func_0088 step1 fail ${e.code}`);
            expect(e.code).assertEqual(401);
          }
          done();
        });

      /*
          * @tc.number    : Security_IAM_widgetNotice_Kit_Func_0085
          * @tc.name      : execute_enum_windowModeType
          * @tc.size      : MediumTest
          * @tc.type      : Function
          * @tc.level     : Level 0
      */
      it('Security_IAM_widgetNotice_Kit_Func_0085', 0, async function (done) {
        console.info('Security_IAM_widgetNotice_Kit_Func_0085 start');
        expect(1).assertEqual(userAuth.WindowModeType.DIALOG_BOX);
        expect(2).assertEqual(userAuth.WindowModeType.FULLSCREEN);
        console.info('Security_IAM_widgetNotice_Kit_Func_0085 end');
        done();
      })
  
      /*
          * @tc.number    : Security_IAM_widgetNotice_Kit_Func_0086
          * @tc.name      : execute_enum_noticeType
          * @tc.size      : MediumTest
          * @tc.type      : Function
          * @tc.level     : Level 0
      */
      it('Security_IAM_widgetNotice_Kit_Func_0086', 0, async function (done) {
        console.info('testFace Security_IAM_widgetNotice_Kit_Func_0086 start');
        expect(1).assertEqual(userAuth.NoticeType.WIDGET_NOTICE);
        console.info('Security_IAM_widgetNotice_Kit_Func_0086 end');
        done();
      })
});
};