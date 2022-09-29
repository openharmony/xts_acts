/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from 'hypium/index';
import bundleManager from '@ohos.bundle';
import account from '@ohos.account.osAccount'

const BUNDLE_NAME = 'com.example.myapplication1';
const MODULE_NAME = 'entry';
const ABILITY_NAME = 'com.example.myapplication1.MainAbility';
const PATH = '/data/test/bmsJstest1.hap';
const FLAG1 = bundleManager.BundleFlag.GET_BUNDLE_WITH_ABILITIES;
const FLAG2 = bundleManager.BundleFlag.GET_ALL_APPLICATION_INFO;
const FLAG3 = bundleManager.BundleFlag.GET_BUNDLE_DEFAULT;
let userId = 0;

export default function GetResourceTest() {

  describe('GetResourceTest', function () {

    beforeAll(async function (done) {
      await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
        console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
        userId = account;
        done();
      }).catch(err => {
        console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
        done();
      })
    });

    /*
     * @tc.number: SUB_BMS_APPINFO_GETAPPICON_0001
     * @tc.name: getBundleInfoForResource
     * @tc.desc: get Resource by getBundleInfo
     */
    it('getBundleInfoForResource', 0, async function (done) {
      await bundleManager.getBundleInfo(BUNDLE_NAME, FLAG1).then(data => {
        let applicationInfo = data.appInfo;
        expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.iconResource.id).assertLarger(0)
        expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.labelResource.id).assertLarger(0)
        expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.descriptionResource.id).assertLarger(0)
      }).catch(err => {
        expect().assertFail();
      })
      bundleManager.getBundleInfo(BUNDLE_NAME, FLAG1, (err, data) => {
        let applicationInfo = data.appInfo;
        expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.iconResource.id).assertLarger(0)
        expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.labelResource.id).assertLarger(0)
        expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.descriptionResource.id).assertLarger(0)
        expect(err).assertEqual(0)
        done()
      })
    });

    /*
     * @tc.number: SUB_BMS_APPINFO_GETAPPICON_0002
     * @tc.name: getAllBundleInfoForResource
     * @tc.desc: get Resource by getAllBundleInfo
     */
    it('getAllBundleInfoForResource', 0, async function (done) {
      await bundleManager.getAllBundleInfo(FLAG1).then(data => {
        if (data.length > 0) {
          for (let i = 0; i < data.length; i++) {
            if (data[i].name == BUNDLE_NAME) {
              let applicationInfo = data[i].appInfo;
              expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.iconResource.id).assertLarger(0)
              expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.labelResource.id).assertLarger(0)
              expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.descriptionResource.id).assertLarger(0)
            }
          }
        } else {
          expect().assertFail();
        }
      }).catch(err => {
        expect().assertFail();
      });
      bundleManager.getAllBundleInfo(FLAG1, (err, data) => {
        if (data.length > 0) {
          for (let i = 0; i < data.length; i++) {
            if (data[i].name == BUNDLE_NAME) {
              let applicationInfo = data[i].appInfo;
              expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.iconResource.id).assertLarger(0)
              expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.labelResource.id).assertLarger(0)
              expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.descriptionResource.id).assertLarger(0)
            }
          }
        } else {
          expect().assertFail();
        }
        expect(err).assertEqual(0)
        done();
      })
    });

    /*
     * @tc.number: SUB_BMS_APPINFO_GETAPPICON_0004
     * @tc.name: getAllApplicationInfoForResource
     * @tc.desc: get Resource by getAllApplicationInfo
     */
    it('getAllApplicationInfoForResource', 0, async function (done) {
      await bundleManager.getAllApplicationInfo(FLAG2).then(data => {
        if (data.length > 0) {
          for (let i = 0; i < data.length; i++) {
            if (data[i].name == BUNDLE_NAME) {
              let applicationInfo = data[i];
              expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.iconResource.id).assertLarger(0)
              expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.labelResource.id).assertLarger(0)
              expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.descriptionResource.id).assertLarger(0)
            }
          }
        } else {
          expect().assertFail();
        }
      }).catch(err => {
        expect().assertFail();
      });
      bundleManager.getAllApplicationInfo(FLAG2, (err, data) => {
        if (data.length > 0) {
          for (let i = 0; i < data.length; i++) {
            if (data[i].name == BUNDLE_NAME) {
              let applicationInfo = data[i];
              expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.iconResource.id).assertLarger(0)
              expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.labelResource.id).assertLarger(0)
              expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
              expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
              expect(applicationInfo.descriptionResource.id).assertLarger(0)
            }
          }
        } else {
          expect().assertFail();
        }
        expect(err.code).assertEqual(0)
        done();
      })
    });


    /*
     * @tc.number: SUB_BMS_APPINFO_GETAPPICON_0005
     * @tc.name: getAbilityInfoForResource
     * @tc.desc: get Resource by getAbilityInfo
     */
    it('getAbilityInfoForResource', 0, async function (done) {
      await bundleManager.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME).then(data => {
        let applicationInfo = data.applicationInfo;
        expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.iconResource.id).assertLarger(0)
        expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.labelResource.id).assertLarger(0)
        expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.descriptionResource.id).assertLarger(0)
      }).catch(error => {
        expect().assertFail();
      });
      bundleManager.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME, (err, data) => {
        let applicationInfo = data.applicationInfo;
        expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.iconResource.id).assertLarger(0)
        expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.labelResource.id).assertLarger(0)
        expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.descriptionResource.id).assertLarger(0)
        expect(err).assertEqual(0)
        done();
      })
    });

    /*
     * @tc.number: SUB_BMS_APPINFO_GETAPPICON_0006
     * @tc.name: queryAbilityByWantForResource
     * @tc.desc:  get Resource by queryAbilityByWant
     */
    it('queryAbilityByWantForResource', 0, async function (done) {
      await bundleManager.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      }, FLAG3, userId).then((data) => {
        let applicationInfo = data[0].applicationInfo;
        expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.iconResource.id).assertLarger(0)
        expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.labelResource.id).assertLarger(0)
        expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.descriptionResource.id).assertLarger(0)
      }).catch((error) => {
        expect().assertFail();
      });
      bundleManager.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      }, FLAG3, userId, (err, data) => {
        let applicationInfo = data[0].applicationInfo;
        expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.iconResource.id).assertLarger(0)
        expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.labelResource.id).assertLarger(0)
        expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.descriptionResource.id).assertLarger(0)
        expect(err).assertEqual(0)
        done();
      })
    });

    /*
     * @tc.number: SUB_BMS_APPINFO_GETAPPICON_0007
     * @tc.name: getBundleArchiveInfoForResource
     * @tc.desc: get Resource by getBundleArchiveInfo
     */
    it('getBundleArchiveInfoForResource', 0, async function (done) {
      await bundleManager.getBundleArchiveInfo(PATH, FLAG1).then((data) => {
        let applicationInfo = data.appInfo;
        expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.iconResource.id).assertLarger(0)
        expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.labelResource.id).assertLarger(0)
        expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.descriptionResource.id).assertLarger(0)
      }).catch((err) => {
        expect().assertFail();
      })
      bundleManager.getBundleArchiveInfo(PATH, FLAG1, (err, data) => {
        let applicationInfo = data.appInfo;
        expect(applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.iconResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.iconResource.id).assertLarger(0)
        expect(applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.labelResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.labelResource.id).assertLarger(0)
        expect(applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME)
        expect(applicationInfo.descriptionResource.moduleName).assertEqual(MODULE_NAME)
        expect(applicationInfo.descriptionResource.id).assertLarger(0)
        expect(err.code).assertEqual(0)
        done();
      })
    });

  });
}