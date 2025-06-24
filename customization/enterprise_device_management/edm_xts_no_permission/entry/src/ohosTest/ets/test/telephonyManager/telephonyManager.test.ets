/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import telephonyManager from '@ohos.enterprise.telephonyManager';

export default function telephonyManagerTest() {
  describe('telephonyManager_test', () => {
    testSetSimDisabled();
    testSetSimEnabled();
    testIsSimDisabled();
  })
}

function testSetSimDisabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_DISABLED_0100
   * @tc.name      : test_set_sim_disabled_0100
   * @tc.desc      : test telephonyManager setSimDisabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_disabled_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.setSimDisabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetSimEnabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_ENABLED_0100
   * @tc.name      : test_set_sim_enabled_0100
   * @tc.desc      : test telephonyManager setSimEnabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_enabled_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.setSimEnabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testIsSimDisabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_SIM_DISABLED_0100
   * @tc.name      : test_is_sim_disabled_0100
   * @tc.desc      : test telephonyManager isSimDisabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_sim_disabled_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.isSimDisabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

