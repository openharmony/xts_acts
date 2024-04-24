/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { ENTINFO1, SELFHAPNAME, SELFWANT } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import securityManager from '@ohos.enterprise.securityManager';

export default function securityManagerTest() {
  describe('securityManager_test', () => {
    testGetSecurityStatus();

    testSetPasswordPolicy();
    testGetPasswordPolicy();

    testInstallUserCertificate();
    testUninstallUserCertificate();
  })
}

function testGetSecurityStatus() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0100
   * @tc.name      : test_get_security_status_0100
   * @tc.desc      : test securityManager without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_security_status_0100", 0, async (done: Function) => {
    try {
      securityManager.getSecurityStatus(SELFWANT, 'patch');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0200
   * @tc.name      : test_get_security_status_0200
   * @tc.desc      : test securityManager with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_security_status_0200", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      securityManager.getSecurityStatus(SELFWANT, 'patch');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0300
   * @tc.name      : test_get_security_status_0300
   * @tc.desc      : test securityManager unsupported item
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_security_status_0300", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getSecurityStatus(SELFWANT, '123');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0400
   * @tc.name      : test_get_security_status_0400
   * @tc.desc      : test securityManager get patch tag
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_security_status_0400", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: string = securityManager.getSecurityStatus(SELFWANT, 'patch');
      expect(result).not().assertUndefined();
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0500
   * @tc.name      : test_get_security_status_0500
   * @tc.desc      : test securityManager get encryption status
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_security_status_0500", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: string = securityManager.getSecurityStatus(SELFWANT, 'encryption');
      expect(JSON.parse(result)).not().assertUndefined();
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0600
   * @tc.name      : test_get_security_status_0600
   * @tc.desc      : test securityManager get root status
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_security_status_0600", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getSecurityStatus(SELFWANT, 'root');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetPasswordPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0100
   * @tc.name      : test_set_password_policy_0100
   * @tc.desc      : test securityManager setPasswordPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_password_policy_0100", 0, async (done: Function) => {
    try {
      securityManager.setPasswordPolicy(SELFWANT, {
        complexityRegex: 'g',
        validityPeriod: 180,
        additionalDescription: '123'
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testGetPasswordPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0100
   * @tc.name      : test_get_password_policy_0100
   * @tc.desc      : test securityManager getPasswordPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_password_policy_0100", 0, async (done: Function) => {
    try {
      securityManager.getPasswordPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testInstallUserCertificate() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0100
   * @tc.name      : test_install_user_certificate_0100
   * @tc.desc      : test securityManager installUserCertificate without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_install_user_certificate_0100", 0, async (done: Function) => {
    try {
      await securityManager.installUserCertificate(SELFWANT, {
        inData: new Uint8Array([0x30, 0x82, 0x04]),
        alias: 'test'
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testUninstallUserCertificate() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0100
   * @tc.name      : test_uninstall_user_certificate_0100
   * @tc.desc      : test securityManager uninstallUserCertificate without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_uninstall_user_certificate_0100", 0, async (done: Function) => {
    try {
      await securityManager.uninstallUserCertificate(SELFWANT, 'test');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}