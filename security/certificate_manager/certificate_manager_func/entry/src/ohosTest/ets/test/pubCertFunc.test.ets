/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import certManager from '@ohos.security.certManager';
import type common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { GlobalContext } from '../../../../src/main/ets/pages/HomePage';
import certManagerDialog from '@ohos.security.certManagerDialog';
import * as commonParameter from './utils/common/common_parameter';

export default function certManagerPubCertJsAPIFunctionTestUnit() {
  describe('certManagerPubCertJsAPIFunctionTestUnit', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0400
     * @tc.name test getPublicCertificate with parameter keyUri empty
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0400', 0, async (done: Function) => {
      try {
        await certManager.getPublicCertificate('');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0500
     * @tc.name test getPublicCertificate with parameter keyUri invalid
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0500', 0, async (done: Function) => {
      try {
        await certManager.getPublicCertificate('aabb');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0900
     * @tc.name test isAuthorizedApp with parameter keyUri empty
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0900', 0, async (done: Function) => {
      try {
        await certManager.isAuthorizedApp('');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_1000
     * @tc.name test isAuthorizedApp with parameter keyUri invalid
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_1000', 0, async (done: Function) => {
      try {
        await certManager.isAuthorizedApp('aabb');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0010
     * @tc.name the interface for obtaining private credentials was tested normally
     * @tc.desc normal test
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0010', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias).then((cmResult: certManager.CMResult) => {
        expect(cmResult != null).assertTrue();
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.uri: " + cmResult.uri);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.certList: " + cmResult.certList);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.certInfo: " + cmResult.certInfo);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.credentialList: " + cmResult.credentialList);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.credential: " + cmResult.credential);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.appUidList: " + cmResult.appUidList);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.outData: " + cmResult.outData);
        keyUri = cmResult.uri;
      }).catch((err: BusinessError) => {
        console.error("[Promise] installPrivateCertificate err: " + err.code);
        expect(null).assertFail();
      });
      try {
        let Result : certManager.CMResult = await certManager.getPrivateCertificates();
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010: Result = " + JSON.stringify(Result.credentialList));
      } catch (err) {
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010: e.code " + err.code);
        expect(null).assertFail()
      }
      if (keyUri != undefined) {
        await certManager.uninstallPrivateCertificate(keyUri);
      } else {
        console.error("SUB_Security_CertManager_PriCertJsApi_Func_0200 keyUri is undefined!");
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0030
     * @tc.name get 256 private credentials for normal testing
     * @tc.desc normal test
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0030', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: started.");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let keyUri: string | undefined;
      let message = '';
      let Uris : (string | undefined)[] = [];

      try {
        for (let i = 1; i < 257; i++) {
          let certAlias : string = 'appCertAliasDemoRsa' + i;
          await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias).then((cmResult: certManager.CMResult) => {
            expect(cmResult != null).assertTrue();
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.uri: " + cmResult.uri);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.certList: " + cmResult.certList);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.certInfo: " + cmResult.certInfo);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.credentialList: " + cmResult.credentialList);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.credential: " + cmResult.credential);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.appUidList: " + cmResult.appUidList);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.outData: " + cmResult.outData);
            keyUri = cmResult.uri;
            Uris.push(keyUri)
          }).catch((err: BusinessError) => {
            console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] installPrivateCertificate err: " + err.code);
            expect(null).assertFail();
          });
        }
        let Result: certManager.CMResult = await certManager.getPrivateCertificates();
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: Result = " + JSON.stringify(Result.credentialList));

        if (Result.credentialList != undefined) {
          message += 'result:';
          message += 'count' + Result.credentialList.length;
          message += '\n';
          for (let index = 0; index < Result.credentialList.length; index++) {
            message += 'index ' + index + ': ';
            message += JSON.stringify(Result.credentialList[index]);
            message += '\n';
          }
        } else {
          message += 'credentialList is null';
        }
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: message = " + message);
        let credentialList = Result.credentialList;
        if (credentialList) {
          expect(credentialList.length).assertEqual(256);
        } else {
          console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: Result.credentialList is undefind ");
          expect(null).assertFail();
        }
      } catch (err) {
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: e.code = " + err.code);
        expect(null).assertFail();
      }
      if (keyUri != undefined) {
        for (let i = 0; i < Uris.length; i++) {
          await certManager.uninstallPrivateCertificate(Uris[i]);
          console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: keyUri "  + i  + "= " + Uris[i]);
        }
      } else {
        console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0030 keyUri is undefined!");
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CertManager_OpenCertDialogCertJsApi_Func_0030
     * @tc.name test getPublicCertificate with normal parameters
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('Security_CertManager_OpenCertDialogCertJsApi_Func_0030', 0, async (done: Function) => {
      const context : common.Context = GlobalContext.getContext()
      try {
        await certManagerDialog.openCertificateManagerDialog(null, certManagerDialog.CertificateDialogPageType.PAGE_MAIN);

        expect(null).assertFail();
      } catch (err) {
        console.log("SUB_Security_CertManager_PubCertJsApi_Func_0201: e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      try {
        await certManagerDialog.openCertificateManagerDialog(context, null);
        expect(null).assertFail();
      } catch (err) {
        console.log("SUB_Security_CertManager_PubCertJsApi_Func_0201: e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      try {
        await certManagerDialog.openCertificateManagerDialog(context, 9);
        expect(null).assertFail();
      } catch (err) {
        console.log("SUB_Security_CertManager_PubCertJsApi_Func_0201: e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_OpenCertDialogCertJsApi_Func_0100
     * @tc.name test Enumeration
     * @tc.desc
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_OpenCertDialogCertJsApi_Func_0100', 0, async (done: Function) => {
      expect(certManagerDialog.CertificateDialogErrorCode.ERROR_GENERIC).assertEqual(29700001);
      expect(certManagerDialog.CertificateDialogPageType.PAGE_MAIN).assertEqual(1);
      expect(certManagerDialog.CertificateDialogPageType.PAGE_CA_CERTIFICATE).assertEqual(2);
      expect(certManagerDialog.CertificateDialogPageType.PAGE_CREDENTIAL).assertEqual(3);
      expect(certManagerDialog.CertificateDialogPageType.PAGE_INSTALL_CERTIFICATE).assertEqual(4);
      done();
    });
  })
}