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
import { ENTINFO1, SELFWANT, SELFHAPNAME, SUBSCRIBE_EVENTS, APP_IDS_1, DEFAULT_USER_ID } from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';
import Want from '@ohos.app.ability.Want';

export default function applicationManagerTest() {
  describe('applicationManager_test', function () {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_0100
     * @tc.name      : test_addDisallowedRunningBundlesSync_0100
     * @tc.desc      : test addDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedRunningBundlesSync_0100", 0, async function (done) {
      try {
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_0100
     * @tc.name      : test_removeDisallowedRunningBundlesSync_0100
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedRunningBundlesSync_0100", 0, async function (done) {
      try {
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_0100
     * @tc.name      : test_getDisallowedRunningBundlesSync_0100
     * @tc.desc      : test getDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedRunningBundlesSync_0100", 0, async function (done) {
      try {
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_0100
     * @tc.name      : test_addAutoStartApps_0100
     * @tc.desc      : test addAutoStartApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartApps_0100", 0, async function (done) {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_0100
     * @tc.name      : test_removeAutoStartApps_0100
     * @tc.desc      : test removeAutoStartApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartApps_0100", 0, async function (done) {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_0100
     * @tc.name      : test_getAutoStartApps_0100
     * @tc.desc      : test getAutoStartApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartApps_0100", 0, async function (done) {
      try {
        applicationManager.getAutoStartApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })
  })
}