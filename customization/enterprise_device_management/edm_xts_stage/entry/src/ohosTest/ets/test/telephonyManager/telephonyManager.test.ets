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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE, INVALID_WANT } from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import telephonyManager from '@ohos.enterprise.telephonyManager';
import restrictions from '@ohos.enterprise.restrictions';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

const PARAM_DISABLE_SLOT0: string = "persist.edm.disable_slot_0";
const PARAM_DISABLE_SLOT1: string = "persist.edm.disable_slot_1";

export default function telephonyManagerTest() {
  describe('telephonyManager_test', () => {
    testSetSimDisabled();
    testSetSimEnabled();
    testIsSimDisabled();
  })
}

function testSetSimDisabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_DISABLED_JS_0100
   * @tc.name      : test_set_sim_disabled_0100
   * @tc.desc      : test telephonyManager setSimDisabled without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_disabled_0100", Level.LEVEL2, async (done: Function) => {
    try {
      telephonyManager.setSimDisabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_DISABLED_JS_0101
   * @tc.name      : test_set_sim_disabled_0101
   * @tc.desc      : test telephonyManager setSimDisabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_disabled_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.setSimDisabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_DISABLED_JS_0102
   * @tc.name      : test_set_sim_disabled_0102
   * @tc.desc      : test telephonyManager setSimDisabled with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_disabled_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.setSimDisabled(INVALID_WANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_DISABLED_JS_0103
   * @tc.name      : test_set_sim_disabled_0103
   * @tc.desc      : test telephonyManager setSimDisabled with invalid slotId param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_disabled_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.setSimDisabled(SELFWANT, 3);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_DISABLED_JS_0104
   * @tc.name      : test_set_sim_disabled_0104
   * @tc.desc      : test telephonyManager setSimDisabled
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_disabled_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.setSimDisabled(SELFWANT, 0);
      let info: string = systemParameterEnhance.getSync(PARAM_DISABLE_SLOT0, "");
      expect(info == "true").assertTrue();
      telephonyManager.setSimEnabled(SELFWANT, 0);
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_DISABLED_JS_0105
   * @tc.name      : test_set_sim_disabled_0105
   * @tc.desc      : test telephonyManager setSimDisabled
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_disabled_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.setSimDisabled(SELFWANT, 1);
      let info: string = systemParameterEnhance.getSync(PARAM_DISABLE_SLOT1, "");
      expect(info == "true").assertTrue();
      telephonyManager.setSimEnabled(SELFWANT, 1);
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetSimEnabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_ENABLED_JS_0100
   * @tc.name      : test_set_sim_enabled_0100
   * @tc.desc      : test telephonyManager setSimEnabled without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_enabled_0100", Level.LEVEL2, async (done: Function) => {
    try {
      telephonyManager.setSimEnabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_ENABLED_JS_0101
   * @tc.name      : test_set_sim_enabled_0101
   * @tc.desc      : test telephonyManager setSimEnabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_enabled_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.setSimEnabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_ENABLED_JS_0102
   * @tc.name      : test_set_sim_enabled_0102
   * @tc.desc      : test telephonyManager setSimEnabled with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_enabled_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.setSimEnabled(INVALID_WANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_ENABLED_JS_0103
   * @tc.name      : test_set_sim_enabled_0103
   * @tc.desc      : test telephonyManager setSimEnabled with invalid slotId param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_enabled_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.setSimEnabled(SELFWANT, 3);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_ENABLED_JS_0104
   * @tc.name      : test_set_sim_enabled_0104
   * @tc.desc      : test telephonyManager setSimEnabled
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_enabled_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.setSimEnabled(SELFWANT, 0);
      let info: string = systemParameterEnhance.getSync(PARAM_DISABLE_SLOT0, "");
      expect(info == "false").assertTrue();
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_ENABLED_JS_0105
   * @tc.name      : test_set_sim_enabled_0105
   * @tc.desc      : test telephonyManager setSimEnabled
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_enabled_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.setSimEnabled(SELFWANT, 1);
      let info: string = systemParameterEnhance.getSync(PARAM_DISABLE_SLOT1, "");
      expect(info == "false").assertTrue();
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testIsSimDisabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_SIM_DISABLED_JS_0100
   * @tc.name      : test_is_sim_disabled_0100
   * @tc.desc      : test telephonyManager isSimDisabled without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_sim_disabled_0100", Level.LEVEL2, async (done: Function) => {
    try {
      telephonyManager.isSimDisabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_SIM_DISABLED_JS_0101
   * @tc.name      : test_is_sim_disabled_0101
   * @tc.desc      : test telephonyManager isSimDisabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_sim_disabled_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.isSimDisabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_SIM_DISABLED_JS_0102
   * @tc.name      : test_is_sim_disabled_0102
   * @tc.desc      : test telephonyManager isSimDisabled with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_sim_disabled_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.isSimDisabled(INVALID_WANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_SIM_DISABLED_JS_0103
   * @tc.name      : test_is_sim_disabled_0103
   * @tc.desc      : test telephonyManager isSimDisabled with invalid slotId param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_sim_disabled_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      telephonyManager.isSimDisabled(SELFWANT, 3);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_SIM_DISABLED_JS_0104
   * @tc.name      : test_is_sim_disabled_0104
   * @tc.desc      : test telephonyManager isSimDisabled
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_sim_disabled_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = telephonyManager.isSimDisabled(SELFWANT, 0);
      expect(result !== undefined).assertTrue();
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_SIM_DISABLED_JS_0105
   * @tc.name      : test_is_sim_disabled_0105
   * @tc.desc      : test telephonyManager isSimDisabled
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_sim_disabled_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = telephonyManager.isSimDisabled(SELFWANT, 1);
      expect(result !== undefined).assertTrue();
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

