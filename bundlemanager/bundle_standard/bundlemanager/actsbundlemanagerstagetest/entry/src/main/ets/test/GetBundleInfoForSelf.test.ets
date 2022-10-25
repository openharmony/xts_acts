/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundle from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const VENDOR = "huawei";
const MODULE_NAME = "testModule";
const SOURCE_DIR = "/data/app/el1/bundle/public/ohos.acts.bundle.stage.test/testModule";
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility";
const ABILITY_NAME1 = "ohos.acts.bundle.stage.test.MainAbility1";
const APPID = "ohos.acts.bundle.stage.test_BNtg4JBClbl92Rgc3jm/RfcAdrHXaM8F0QO" +
"iwVEhnV5ebE5jNIYnAx+weFRT3QTyUjRNdhmc2aAzWyi+5t5CoBM=";
const FINGERPRINT = "8E93863FC32EE238060BF69A9B37E2608FFFB21F93C862DD511CBAC9F30024B5";

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', function () {
    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0118
     * @tc.name: getBundleInfoForSelfPro
     * @tc.desc: Test getBundleInfoForSelf with default flag(by promise).
     */
    it('getBundleInfoForSelfPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then(data => {
        console.info("getBundleInfoForSelfPro" + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode).assertEqual(1000000);
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode).assertEqual(1000000);
        expect(data.targetVersion).assertEqual(8);
        expect(data.installTime).assertLarger(0);
        expect(data.updateTime).assertLarger(0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0119
     * @tc.name: getBundleInfoForSelfCal
     * @tc.desc: Test getBundleInfoForSelf with default flag(by callback).
     */
    it('getBundleInfoForSelfCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err, data) => {
        console.info("getBundleInfoForSelfCal" + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode).assertEqual(1000000);
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode).assertEqual(1000000);
        expect(data.targetVersion).assertEqual(8);
        expect(data.installTime).assertLarger(0);
        expect(data.updateTime).assertLarger(0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0120
     * @tc.name: getBundleInfoForSelfApplicationPro
     * @tc.desc: Test getBundleInfoForSelf with application flag(by promise).
     */
    it('getBundleInfoForSelfApplicationPro', 0, async function (done) {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).then(data => {
        console.info("getBundleInfoForSelfApplicationPro" + JSON.stringify(data.appInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.description).assertEqual("$string:description_application");
        expect(data.appInfo.descriptionId).assertLarger(0);
        expect(data.appInfo.enabled).assertTrue();
        expect(data.appInfo.label).assertEqual("$string:app_name");
        expect(data.appInfo.labelId).assertLarger(0);
        expect(data.appInfo.icon).assertEqual("$media:icon");
        expect(data.appInfo.iconId).assertLarger(0);
        expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.entryDir).assertEqual(SOURCE_DIR);
        expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
        expect(data.appInfo.removable).assertTrue(0);
        expect(data.appInfo.accessTokenId).assertLarger(0);
        expect(data.appInfo.uid).assertLarger(0);
        expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.iconResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
        expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.labelResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
        expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.descriptionResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
        expect(data.appInfo.appDistributionType).assertEqual("os_integration");
        expect(data.appInfo.appProvisionType).assertEqual("release");
        expect(data.appInfo.permissions.length).assertEqual(0);
        expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0121
     * @tc.name: getBundleInfoForSelfApplicationCal
     * @tc.desc: Test getBundleInfoForSelf with application flag(by callback).
     */
    it('getBundleInfoForSelfApplicationCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION, (err, data) => {
        console.info("ApplicationCal" + JSON.stringify(data.appInfo));
        for (let i in data.appInfo) {
          console.info("name" + JSON.stringify(i));
          console.info("name" + JSON.stringify(data.appInfo[i]));
        }
        checkCommonBundleInfo(data);
        expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.description).assertEqual("$string:description_application");
        expect(data.appInfo.descriptionId).assertLarger(0);
        expect(data.appInfo.enabled).assertTrue();
        expect(data.appInfo.label).assertEqual("$string:app_name");
        expect(data.appInfo.labelId).assertLarger(0);
        expect(data.appInfo.icon).assertEqual("$media:icon");
        expect(data.appInfo.iconId).assertLarger(0);
        expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.entryDir).assertEqual(SOURCE_DIR);
        expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
        expect(data.appInfo.removable).assertTrue(0);
        expect(data.appInfo.accessTokenId).assertLarger(0);
        expect(data.appInfo.uid).assertLarger(0);
        expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.iconResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
        expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.labelResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
        expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.descriptionResource.moduleName).assertEqual("testModule");
        expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
        expect(data.appInfo.appDistributionType).assertEqual("os_integration");
        expect(data.appInfo.appProvisionType).assertEqual("release");
        expect(data.appInfo.permissions.length).assertEqual(0);
        expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0122
     * @tc.name: getBundleInfoForSelfModulePro
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by promise).
     */
    it('getBundleInfoForSelfModulePro', 0, async function (done) {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE).then(data => {
        console.info("ModulePro" + JSON.stringify(data.hapModulesInfo[0]));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(1);
        expect(data.hapModulesInfo[0].name).assertEqual("testModule");
        //        expect(data.hapModulesInfo[0].icon).assertEqual("");
        //        expect(data.hapModulesInfo[0].iconId).assertEqual(0);
        expect(data.hapModulesInfo[0].label).assertEqual("$string:entry_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].description).assertEqual("$string:testModule_entry_dsc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].mainElementName).assertEqual("MainAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(1);
        expect(data.hapModulesInfo[0].deviceTypes[0]).assertEqual("default");
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue).assertEqual("");
        expect(data.hapModulesInfo[0].moduleSourceDir).assertEqual(SOURCE_DIR);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0123
     * @tc.name: getBundleInfoForSelfModuleCal
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by callback).
     */
    it('getBundleInfoForSelfModuleCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE, (err, data) => {
        console.info("getBundleInfoForSelfPro" + JSON.stringify(data.hapModulesInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(1);
        expect(data.hapModulesInfo[0].name).assertEqual("testModule");
        //        expect(data.hapModulesInfo[0].icon).assertEqual("");
        //        expect(data.hapModulesInfo[0].iconId).assertEqual(0);
        expect(data.hapModulesInfo[0].label).assertEqual("$string:entry_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].description).assertEqual("$string:testModule_entry_dsc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].mainElementName).assertEqual("MainAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(1);
        expect(data.hapModulesInfo[0].deviceTypes[0]).assertEqual("default");
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue).assertEqual("");
        expect(data.hapModulesInfo[0].moduleSourceDir).assertEqual(SOURCE_DIR);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0124
     * @tc.name: getBundleInfoForSelfAbilityPro
     * @tc.desc: Test getBundleInfoForSelf with ability flag(by promise).
     */
    it('getBundleInfoForSelfAbilityPro', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY
      ).then(data => {
        console.info("AbilityPro" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0]));
        checkCommonBundleInfo(data);
        checkCommonHapModuleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(2);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("testModule");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:entry_label");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:testModule_entry_main");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:icon");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].isVisible).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].type).assertEqual(1);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(2);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].readPermission).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].writePermission).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].uri).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(1);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[0]).assertEqual("default");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].applicationInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[0]).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[1]).assertEqual(1);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[2]).assertEqual(2);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0);
        expect(data.hapModulesInfo[0].abilitiesInfo[1].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility1");
        checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[1])
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0125
     * @tc.name: getBundleInfoForSelfAbilityCal
     * @tc.desc: Test getBundleInfoForSelf with ability flag(by callback).
     */
    it('getBundleInfoForSelfAbilityCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY,
        (err, data) => {
          console.info("AbilityCal" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[0]));
          console.info("AbilityCal" + JSON.stringify(data.hapModulesInfo[0].abilitiesInfo[1]));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(2);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("testModule");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:entry_label");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:testModule_entry_main");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:icon");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].isVisible).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].type).assertEqual(1);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(2);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].readPermission).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].writePermission).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].uri).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(1);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes[0]).assertEqual("default");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].applicationInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[0]).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[1]).assertEqual(1);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes[2]).assertEqual(2);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0);
          expect(data.hapModulesInfo[0].abilitiesInfo[1].name).assertEqual("ohos.acts.bundle.stage.test.MainAbility1");
          checkCommonAbilityInfo(data.hapModulesInfo[0].abilitiesInfo[1])
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          expect(err).assertEqual(null);
          done();
        })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0126
     * @tc.name: getBundleInfoForSelfExtensionPro
     * @tc.desc: Test getBundleInfoForSelf with extensionAbility flag(by promise).
     */
    it('getBundleInfoForSelfExtensionPro', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
      ).then(data => {
        console.info("ExtensionPro" + JSON.stringify(data.hapModulesInfo[0].extensionAbilitiesInfo));
        checkCommonBundleInfo(data);
        checkCommonHapModuleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(2);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].moduleName).assertEqual("testModule");
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].name).assertEqual("Form");
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].iconId).assertLarger(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].isVisible).assertTrue();
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].extensionAbilityType).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].permissions.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].applicationInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].enabled).assertTrue();
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].readPermission).assertEqual("");
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].writePermission).assertEqual("");
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].bundleName).assertEqual(BUNDLE_NAME);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].moduleName).assertEqual("testModule");
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].name).assertEqual("Form1");
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].labelId).assertLarger(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].descriptionId).assertLarger(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].iconId).assertLarger(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].isVisible).assertTrue();
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].extensionAbilityType).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].permissions.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].applicationInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].metadata.length).assertEqual(0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].enabled).assertTrue();
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].readPermission).assertEqual("");
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].writePermission).assertEqual("");
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0127
     * @tc.name: getBundleInfoForSelfExtensionCal
     * @tc.desc: Test getBundleInfoForSelf with extensionAbility flag(by callback).
     */
    it('getBundleInfoForSelfExtensionCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY,
        (err, data) => {
          console.info("ExtensionCal" + JSON.stringify(data.hapModulesInfo[0].extensionAbilitiesInfo));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(2);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(2);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].moduleName).assertEqual("testModule");
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].name).assertEqual("Form");
                  expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].labelId).assertLarger(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].descriptionId).assertLarger(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].iconId).assertLarger(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].isVisible).assertTrue();
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].extensionAbilityType).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].permissions.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].applicationInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].metadata.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].enabled).assertTrue();
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].readPermission).assertEqual("");
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[0].writePermission).assertEqual("");
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].bundleName).assertEqual(BUNDLE_NAME);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].moduleName).assertEqual("testModule");
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].name).assertEqual("Form1");
                  expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].labelId).assertLarger(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].descriptionId).assertLarger(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].iconId).assertLarger(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].isVisible).assertTrue();
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].extensionAbilityType).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].permissions.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].applicationInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].metadata.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].enabled).assertTrue();
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].readPermission).assertEqual("");
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo[1].writePermission).assertEqual("");
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          expect(err).assertEqual(null);
          done();
        })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0128
     * @tc.name: getBundleInfoForSelfPermissionPro
     * @tc.desc: Test getBundleInfoForSelf with permission flag(by promise).
     */
    it('getBundleInfoForSelfPermissionPro', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION).then(data => {
        console.info("PermissionPro" + JSON.stringify(data.reqPermissionDetails));
        console.info("PermissionPro" + JSON.stringify(data.permissionGrantStates));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(1);
        expect(data.reqPermissionDetails[0].name).assertEqual("ohos.permission.GET_BUNDLE_INFO");
        expect(data.reqPermissionDetails[0].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[0].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[0].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[0].usedScene.when).assertEqual("inuse");
        expect(data.permissionGrantStates[0]).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0129
     * @tc.name: getBundleInfoForSelfPermissionCal
     * @tc.desc: Test getBundleInfoForSelf with permission flag(by callback).
     */
    it('getBundleInfoForSelfPermissionCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION, (err, data) => {
        console.info("PermissionPro" + JSON.stringify(data.reqPermissionDetails));
        console.info("PermissionPro" + JSON.stringify(data.permissionGrantStates));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(1);
        expect(data.reqPermissionDetails[0].name).assertEqual("ohos.permission.GET_BUNDLE_INFO");
        expect(data.reqPermissionDetails[0].reason).assertEqual("$string:permission_reason");
        expect(data.reqPermissionDetails[0].reasonId).assertLarger(0);
        expect(data.reqPermissionDetails[0].usedScene.abilities.length).assertEqual(1);
        expect(data.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual("MainAbility");
        expect(data.reqPermissionDetails[0].usedScene.when).assertEqual("inuse");
        expect(data.permissionGrantStates[0]).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0130
     * @tc.name: getBundleInfoForSelfMetaPro
     * @tc.desc: Test getBundleInfoForSelf with metadata flag(by promise).
     */
    it('getBundleInfoForSelfMetaPro', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA)
        .then(data => {
          console.info("MetaPro" + JSON.stringify(data.hapModulesInfo[0].metadata));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(1);
          expect(data.hapModulesInfo[0].metadata[0].name).assertEqual("MetaData1");
          expect(data.hapModulesInfo[0].metadata[0].value).assertEqual("MetaDataValue");
          expect(data.hapModulesInfo[0].metadata[0].resource).assertEqual("$profile:shortcuts_config");
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          done();
        })
        .catch(err => {
          console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0131
     * @tc.name: getBundleInfoForSelfMetaCal
     * @tc.desc: Test getBundleInfoForSelf with metadata flag(by callback).
     */
    it('getBundleInfoForSelfMetaCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA,
        (err, data) => {
          console.info("MetaPro" + JSON.stringify(data.hapModulesInfo[0].metadata));
          checkCommonBundleInfo(data);
          checkCommonHapModuleInfo(data);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(1);
          expect(data.hapModulesInfo[0].metadata[0].name).assertEqual("MetaData1");
          expect(data.hapModulesInfo[0].metadata[0].value).assertEqual("MetaDataValue");
          expect(data.hapModulesInfo[0].metadata[0].resource).assertEqual("$profile:shortcuts_config");
          expect(data.reqPermissionDetails.length).assertEqual(0);
          expect(data.permissionGrantStates.length).assertEqual(0);
          expect(data.signatureInfo).assertEqual(null);
          expect(err).assertEqual(null);
          done();
        })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0132
     * @tc.name: getBundleInfoForSelfSigPro
     * @tc.desc: Test getBundleInfoForSelf with signatureInfo flag(by promise).
     */
    it('getBundleInfoForSelfSigPro', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO).then(data => {
        console.info("SigPro" + JSON.stringify(data.signatureInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo.appId).assertEqual(APPID);
        expect(data.signatureInfo.fingerprint).assertEqual(FINGERPRINT);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0133
     * @tc.name: getBundleInfoForSelfSigCal
     * @tc.desc: Test getBundleInfoForSelf with signatureInfo flag(by callback).
     */
    it('getBundleInfoForSelfSigCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO, (err, data) => {
        console.info("SigCal" + JSON.stringify(data.signatureInfo));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo.appId).assertEqual(APPID);
        expect(data.signatureInfo.fingerprint).assertEqual(FINGERPRINT);
        expect(err).assertEqual(null);
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0134
     * @tc.name: getBundleInfoForSelfDisPro
     * @tc.desc: Test getBundleInfoForSelf with disable flag(by promise).
     */
    it('getBundleInfoForSelfDisPro', 0, async function (done) {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE).then(data => {
        console.info("DisPro" + JSON.stringify(data));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_QUERY_0135
     * @tc.name: getBundleInfoForSelfDisCal
     * @tc.desc: Test getBundleInfoForSelf with disable flag(by callback).
     */
    it('getBundleInfoForSelfDisCal', 0, async function (done) {
      bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE, (err, data) => {
        console.info("DisCal" + JSON.stringify(data));
        checkCommonBundleInfo(data);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        expect(err).assertEqual(null);
        done();
      })
    })

    function checkCommonBundleInfo(data) {
      expect(data.name).assertEqual(BUNDLE_NAME);
      expect(data.vendor).assertEqual(VENDOR);
      expect(data.versionCode).assertEqual(1000000);
      expect(data.versionName).assertEqual("1.0.0");
      expect(data.minCompatibleVersionCode).assertEqual(1000000);
      expect(data.targetVersion).assertEqual(8);
      expect(data.installTime).assertLarger(0);
      expect(data.updateTime).assertLarger(0);
      console.info("checkCommonBundleInfo end");
    }

    function checkCommonApplicationInfo(data) {
      expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.description).assertEqual("$string:description_application");
      expect(data.appInfo.descriptionId).assertLarger(0);
      expect(data.appInfo.enabled).assertTrue();
      expect(data.appInfo.label).assertEqual("$string:app_name");
      expect(data.appInfo.labelId).assertLarger(0);
      expect(data.appInfo.icon).assertEqual("$media:icon");
      expect(data.appInfo.iconId).assertLarger(0);
      expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.entryDir).assertEqual(SOURCE_DIR);
      expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test");
      expect(data.appInfo.removable).assertTrue(0);
      expect(data.appInfo.accessTokenId).assertLarger(0);
      expect(data.appInfo.uid).assertLarger(0);
      expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.iconResource.moduleName).assertEqual("testModule");
      expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
      expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.labelResource.moduleName).assertEqual("testModule");
      expect(data.appInfo.labelResource.id).assertEqual(data.appInfo.labelId);
      expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
      expect(data.appInfo.descriptionResource.moduleName).assertEqual("testModule");
      expect(data.appInfo.descriptionResource.id).assertEqual(data.appInfo.descriptionId);
      expect(data.appInfo.appDistributionType).assertEqual("os_integration");
      expect(data.appInfo.appProvisionType).assertEqual("release");
      expect(JSON.stringify(data.appInfo.metadata)).assertEqual("{}");
      console.info("checkCommonApplicationInfo end");
    }

    function checkCommonHapModuleInfo(data) {
      expect(data.hapModulesInfo.length).assertEqual(1);
      expect(data.hapModulesInfo[0].name).assertEqual("testModule");
      //        expect(data.hapModulesInfo[0].icon).assertEqual("");
      //        expect(data.hapModulesInfo[0].iconId).assertEqual(0);
      expect(data.hapModulesInfo[0].label).assertEqual("$string:entry_label");
      expect(data.hapModulesInfo[0].labelId).assertLarger(0);
      expect(data.hapModulesInfo[0].description).assertEqual("$string:testModule_entry_dsc");
      expect(data.hapModulesInfo[0].descriptionId).assertLarger(0);
      expect(data.hapModulesInfo[0].mainElementName).assertEqual("MainAbility");
      expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(1);
      expect(data.hapModulesInfo[0].deviceTypes[0]).assertEqual("default");
      expect(data.hapModulesInfo[0].installationFree).assertFalse();
      expect(data.hapModulesInfo[0].hashValue).assertEqual("");
      expect(data.hapModulesInfo[0].moduleSourceDir).assertEqual(SOURCE_DIR);
      console.info("checkCommonHapModuleInfo end");
    }

    function checkCommonAbilityInfo(data) {
      expect(data.bundleName).assertEqual(BUNDLE_NAME);
      expect(data.moduleName).assertEqual("testModule");
      expect(data.label).assertEqual("$string:entry_label");
      expect(data.labelId).assertLarger(0);
      expect(data.description).assertEqual("$string:testModule_entry_main");
      expect(data.descriptionId).assertLarger(0);
      expect(data.icon).assertEqual("$media:icon");
      expect(data.iconId).assertLarger(0);
      expect(data.process).assertEqual("");
      expect(data.isVisible).assertTrue();
      expect(data.type).assertEqual(1);
      expect(data.orientation).assertEqual(2);
      expect(data.launchType).assertEqual(0);
      expect(data.permissions.length).assertEqual(0);
      expect(data.readPermission).assertEqual("");
      expect(data.writePermission).assertEqual("");
      expect(data.uri).assertEqual("");
      expect(data.deviceTypes.length).assertEqual(1);
      expect(data.deviceTypes[0]).assertEqual("default");
      expect(data.applicationInfo).assertEqual(null);
      expect(data.metadata.length).assertEqual(0);
      expect(data.enabled).assertTrue();
      expect(data.supportWindowModes.length).assertEqual(3);
      expect(data.supportWindowModes[0]).assertEqual(0);
      expect(data.supportWindowModes[1]).assertEqual(1);
      expect(data.supportWindowModes[2]).assertEqual(2);
      expect(data.windowSize.maxWindowRatio).assertEqual(0);
      expect(data.windowSize.minWindowRatio).assertEqual(0);
      expect(data.windowSize.maxWindowWidth).assertEqual(0);
      expect(data.windowSize.minWindowWidth).assertEqual(0);
      expect(data.windowSize.maxWindowHeight).assertEqual(0);
      expect(data.windowSize.minWindowHeight).assertEqual(0);
      console.info("checkCommonAbilityInfo end");
    }
  })
}