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

import certManager from '@ohos.security.certManager';
import * as commonParameter from './utils/common/common_parameter';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function api16CertFuncTestUnit() {
  describe('api16CertFuncTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_Security_CertManager_GetCertificateStorePath_Func_0010
     * @tc.name certType is a system preset, while cerScope is a device public
     * @tc.desc normal test
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetCertificateStorePath_Func_0010', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0010: started ");
      let property: certManager.CertStoreProperty = {
        certType: certManager.CertType.CA_CERT_SYSTEM,
        certScope: certManager.CertScope.GLOBAL_USER,
      }
      try {
        let userCACurrentPath = certManager.getCertificateStorePath(property);
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0010: userCACurrentPath " + userCACurrentPath);
        expect(userCACurrentPath).assertEqual('/etc/security/certificates');
      } catch (err) {
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0010: e.code " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_GetCertificateStorePath_Func_0011
     * @tc.name certType is 2 and cerScope is the current user
     * @tc.desc abnormal test
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetCertificateStorePath_Func_0011', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0011: started ");
      let property: certManager.CertStoreProperty = {
        certType: 2,
        certScope: certManager.CertScope.CURRENT_USER,
      }
      try {
        let userCACurrentPath = certManager.getCertificateStorePath(property);
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0011: userCACurrentPath " + userCACurrentPath);
        expect(null).assertFail();
      } catch (err) {
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0011: e.code " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_GetCertificateStorePath_Func_0012
     * @tc.name certType is preset by the system, while cerScope is set for the current user
     * @tc.desc normal test
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetCertificateStorePath_Func_0012', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0012: started ");
      let property: certManager.CertStoreProperty = {
        certType: certManager.CertType.CA_CERT_SYSTEM,
        certScope: certManager.CertScope.CURRENT_USER,
      }
      try {
        let userCACurrentPath = certManager.getCertificateStorePath(property);
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0012: userCACurrentPath " + userCACurrentPath);
        expect(userCACurrentPath).assertEqual('/etc/security/certificates');
      } catch (err) {
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0012: e.code " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_GetCertificateStorePath_Func_0013
     * @tc.name certType is set to the system with a preset cerScope of 3
     * @tc.desc abnormal test
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetCertificateStorePath_Func_0013', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0013: started ");
      let property: certManager.CertStoreProperty = {
        certType: certManager.CertType.CA_CERT_SYSTEM,
        certScope: 3,
      }
      try {
        let userCACurrentPath = certManager.getCertificateStorePath(property);
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0013: userCACurrentPath " + userCACurrentPath);
        expect(null).assertFail();
      } catch (err) {
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0013: e.code " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_GetCertificateStorePath_Func_0014
     * @tc.name certType is the system preset cerScope is null
     * @tc.desc normal test
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetCertificateStorePath_Func_0014', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0014: started ");
      let property: certManager.CertStoreProperty = {
        certType: certManager.CertType.CA_CERT_SYSTEM,
      }
      try {
        let userCACurrentPath = certManager.getCertificateStorePath(property);
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0014: userCACurrentPath " + userCACurrentPath);
        expect(userCACurrentPath).assertEqual('/etc/security/certificates');
      } catch (err) {
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0014: e.code " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_GetCertificateStorePath_Func_0015
     * @tc.name certType is CA certificate, cerScope is device public
     * @tc.desc normal test
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetCertificateStorePath_Func_0015', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0015: started ");
      let property: certManager.CertStoreProperty = {
        certType: certManager.CertType.CA_CERT_USER,
        certScope: certManager.CertScope.GLOBAL_USER,
      }
      try {
        let userCACurrentPath = certManager.getCertificateStorePath(property);
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0015: userCACurrentPath " + userCACurrentPath);
        expect(userCACurrentPath).assertEqual('/data/certificates/user_cacerts/0');
      } catch (err) {
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0015: e.code " + err.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_GetCertificateStorePath_Func_0016
     * @tc.name certType is CA certificate, cerScope is the current user
     * @tc.desc normal test
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it('SUB_Security_CertManager_GetCertificateStorePath_Func_0016', 0, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0016: started ");
      let property: certManager.CertStoreProperty = {
        certType: certManager.CertType.CA_CERT_USER,
        certScope: certManager.CertScope.CURRENT_USER,
      }
      try {
        let userCACurrentPath = certManager.getCertificateStorePath(property);
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0016: userCACurrentPath " + userCACurrentPath);
        expect(userCACurrentPath).assertEqual('/data/certificates/user_cacerts/100');
      } catch (err) {
        console.log("SUB_Security_CertManager_GetCertificateStorePath_Func_0016: e.code " + err.code);
        expect(null).assertFail();
      }
      done();
    });

  })
}