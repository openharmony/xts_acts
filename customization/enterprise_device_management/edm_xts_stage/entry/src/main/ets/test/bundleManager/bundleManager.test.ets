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
import {
  WANT1,
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  SUBSCRIBE_EVENTS,
  APP_IDS_1,
  DEFAULT_USER_ID,
  HAP_FILE_PATH,
  EDM_INSTALL_PARAM
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import bundleManager from '@ohos.enterprise.bundleManager';

export default function bundleManagerTest() {
  describe('bundleManager_test', function () {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_addAllowedInstallBundlesSync_0100
     * @tc.desc      : test addAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAllowedInstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_removeAllowedInstallBundlesSync_0100
     * @tc.desc      : test removeAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAllowedInstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_getAllowedInstallBundlesSync_0100
     * @tc.desc      : test getAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedInstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_addDisallowedInstallBundlesSync_0100
     * @tc.desc      : test addDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedInstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_removeDisallowedInstallBundlesSync_0100
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedInstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_getDisallowedInstallBundlesSync_0100
     * @tc.desc      : test getDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedInstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_addDisallowedUninstallBundlesSync_0100
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedUninstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_0100
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedUninstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_0100
     * @tc.name      : test_getDisallowedUninstallBundlesSync_0100
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedUninstallBundlesSync_0100", 0, async function (done) {
      try {
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_0100
     * @tc.name      : test_uninstall_0100
     * @tc.desc      : test uninstall method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_0100", 0, async function (done) {
      try {
        await bundleManager.uninstall(SELFWANT, WANT1.bundleName, DEFAULT_USER_ID, true);
        console.info(' --- test_uninstall_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_uninstall_0100 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- test_uninstall_0100  -------- END --------');
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_0100
     * @tc.name      : test_install_0100
     * @tc.desc      : test install method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_install_0100", 0, async function (done) {
      try {
        await bundleManager.install(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        console.info(' --- test_install_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
        console.info(' --- test_install_0100 error 9200001 is expected, actually catch: ' + error.code);
      }
      done();
      console.info(' --- test_install_0100  -------- END --------');
    })
  })
}