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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundle from '@ohos.bundle';
import account from '@ohos.account.osAccount';
import { describe,beforeAll, it, expect } from 'hypium/index';

const BUNDLE_NAME1 = "ohos.acts.bundle.stage";
const BUNDLE_NAME2 = "com.noexit.com";
const BUNDLE_NAME3 = 'com.example.third1';
const ABILITY_NAME1 = "ExtensionAbility1";
const ABILITY_NAME2 = "noexitAbility";
const ABILITY_NAME3 = "ServiceAbility";
let userId = 0;

export default function QueryExtensionAbilityInfos() {

  describe('QueryExtensionAbilityInfos', function () {

    beforeAll(async function (done) {
      await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
          console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
          userId = account;
          done();
        }).catch(err=>{
          console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
          done();
        })
  });

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0001
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos with invalid userId 
  */
    it('SUB_BMS_APPINFO_EXTENSION_0001', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME1
        }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT, 1001).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME1
        }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT, 1001, (err, data) => {
          if (err) {
            expect(err).assertEqual(1);
            done();
            return;
          }
          expect(data).assertFail();
          done();
        })
    })

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0002
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos get permissions flag
  */
    it('SUB_BMS_APPINFO_EXTENSION_0002', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "abilityName": ABILITY_NAME1
      }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_PERMISSION, userId).then(data => {
        expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
        expect(data[0].moduleName).assertEqual("phone");
        expect(data[0].name).assertEqual("ExtensionAbility1");
        expect(data[0].labelId).assertLarger(0);
        expect(data[0].descriptionId).assertLarger(0);
        expect(data[0].iconId).assertEqual(0);
        expect(data[0].isVisible).assertFalse();
        expect(data[0].extensionAbilityType).assertEqual(0);
        expect(data[0].permissions[0]).assertEqual("ohos.permission.GET_BUNDLE_INFO");
        expect(data[0].enabled).assertTrue();
        expect(data[0].readPermission).assertEqual("");
        expect(data[0].writePermission).assertEqual("");
        expect(data[0].metadata.length).assertEqual(0);
      }).catch(err => {
        expect(err).assertFail();
      });
      bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "abilityName": ABILITY_NAME1
      }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_PERMISSION, userId, (err, data) => {
        if (err) {
          expect(err).assertFail();
          done();
          return;
        }
        expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
        expect(data[0].moduleName).assertEqual("phone");
        expect(data[0].name).assertEqual("ExtensionAbility1");
        expect(data[0].labelId).assertLarger(0);
        expect(data[0].descriptionId).assertLarger(0);
        expect(data[0].iconId).assertEqual(0);
        expect(data[0].isVisible).assertFalse();
        expect(data[0].extensionAbilityType).assertEqual(0);
        expect(data[0].permissions[0]).assertEqual("ohos.permission.GET_BUNDLE_INFO");
        expect(data[0].enabled).assertTrue();
        expect(data[0].readPermission).assertEqual("");
        expect(data[0].writePermission).assertEqual("");
        expect(data[0].metadata.length).assertEqual(0);
        done();
      })
    })

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0003
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos with default flag
  */
    it('SUB_BMS_APPINFO_EXTENSION_0003', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME1
        }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId).then(data => {
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("ExtensionAbility1");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
        }).catch(err => {
          expect(err).assertFail();
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME1
        }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId, (err, data) => {
          if (err) {
            expect(err).assertFail();
            done();
            return;
          }
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("ExtensionAbility1");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
          done();
        })
    })

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0004
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos with get application flag
  */
    it('SUB_BMS_APPINFO_EXTENSION_0004', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "abilityName": ABILITY_NAME1
      }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_APPLICATION,
        userId).then(data => {
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("ExtensionAbility1");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
          checkApplication(data);
        }).catch(err => {
          expect(err).assertFail();
        });
      bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "abilityName": ABILITY_NAME1
      }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_APPLICATION,
        userId, (err, data) => {
          if (err) {
            expect(err).assertFail();
            done();
            return;
          }
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("ExtensionAbility1");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
          checkApplication(data);
          done();
        })
    })

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0005
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos with invalid bundleName 
  */
    it('SUB_BMS_APPINFO_EXTENSION_0005', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME2,
          "abilityName": ABILITY_NAME1
        }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT, userId).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME2,
          "abilityName": ABILITY_NAME1
        }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT, userId, (err, data) => {
          if (err) {
            expect(err).assertEqual(1);
            done();
            return;
          }
          expect(data).assertFail();
          done();
        })
    })

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0006
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos with invalid abilityName 
  */
    it('SUB_BMS_APPINFO_EXTENSION_0006', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME2
        }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT, userId).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME2
        }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT, userId, (err, data) => {
          if (err) {
            expect(err).assertEqual(1);
            done();
            return;
          }
          expect(data).assertFail();
          done();
        })
    })

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0007
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos with invalid param 
  */
    it('SUB_BMS_APPINFO_EXTENSION_0007', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME1
        }, bundle.ExtensionAbilityType.FORM, null, userId).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME1
        }, bundle.ExtensionAbilityType.FORM, null, userId, (err, data) => {
          expect(err).assertEqual(1);
          expect(data).assertEqual("type mismatch");
          done();
        })
    })

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0008
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos with get metaData flag and no userId
  */
    it('SUB_BMS_APPINFO_EXTENSION_0008', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "abilityName": ABILITY_NAME1
      }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_METADATA).then(data => {
        expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
        expect(data[0].moduleName).assertEqual("phone");
        expect(data[0].name).assertEqual("ExtensionAbility1");
        expect(data[0].labelId).assertLarger(0);
        expect(data[0].descriptionId).assertLarger(0);
        expect(data[0].iconId).assertEqual(0);
        expect(data[0].isVisible).assertFalse();
        expect(data[0].extensionAbilityType).assertEqual(0);
        expect(data[0].permissions.length).assertEqual(0);
        expect(data[0].enabled).assertTrue();
        expect(data[0].readPermission).assertEqual("");
        expect(data[0].writePermission).assertEqual("");
        expect(data[0].metadata[0].name).assertEqual("ohos.extension.form");
        expect(data[0].metadata[0].value).assertEqual("testExtensionAbilities");
        expect(data[0].metadata[0].resource).assertEqual("$profile:form_config");
      }).catch(err => {
        expect(err).assertFail();
      });
      bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "abilityName": ABILITY_NAME1
      }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_METADATA, (err, data) => {
        if (err) {
          expect(err).assertFail();
          done();
          return;
        }
        expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
        expect(data[0].moduleName).assertEqual("phone");
        expect(data[0].name).assertEqual("ExtensionAbility1");
        expect(data[0].labelId).assertLarger(0);
        expect(data[0].descriptionId).assertLarger(0);
        expect(data[0].iconId).assertEqual(0);
        expect(data[0].isVisible).assertFalse();
        expect(data[0].extensionAbilityType).assertEqual(0);
        expect(data[0].permissions.length).assertEqual(0);
        expect(data[0].enabled).assertTrue();
        expect(data[0].readPermission).assertEqual("");
        expect(data[0].writePermission).assertEqual("");
        expect(data[0].metadata[0].name).assertEqual("ohos.extension.form");
        expect(data[0].metadata[0].value).assertEqual("testExtensionAbilities");
        expect(data[0].metadata[0].resource).assertEqual("$profile:form_config");
        done();
      })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0009
    * @tc.name: test queryExtensionAbilityInfos api
    * @tc.desc: test queryExtensionAbilityInfos get service extensionAbility
    */
    it('SUB_BMS_APPINFO_EXTENSION_0009', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME3
        }, bundle.ExtensionAbilityType.SERVICE, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId).then(data => {
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual(ABILITY_NAME3);
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(3);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "abilityName": ABILITY_NAME3
        }, bundle.ExtensionAbilityType.SERVICE, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId, (err, data) => {
          if (err) {
            expect(err).assertEqual(1);
            done();
            return;
          }
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual(ABILITY_NAME3);
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(3);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
          done();
        })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0010
    * @tc.name: test queryExtensionAbilityInfos api
    * @tc.desc: test queryExtensionAbilityInfos with invalid bundleName 
    */
    it('SUB_BMS_APPINFO_EXTENSION_0010', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME2
        }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT, userId).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME2
        }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT, userId, (err, data) => {
          if (err) {
            expect(err).assertEqual(1);
            done();
            return;
          }
          expect(data).assertFail();
          done();
        })
    })

    /*
  * @tc.number: SUB_BMS_APPINFO_EXTENSION_0011
  * @tc.name: test queryExtensionAbilityInfos api
  * @tc.desc: test queryExtensionAbilityInfos of Implicit query with get permission flag
  */
    it('SUB_BMS_APPINFO_EXTENSION_0011', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "action": "actionY"
        }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_PERMISSION,
        userId).then(data => {
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("ExtensionAbility1");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions[0]).assertEqual("ohos.permission.GET_BUNDLE_INFO");
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
        }).catch(err => {
          expect(err).assertFail();
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "action": "actionY"
        }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_PERMISSION,
        userId, (err, data) => {
          if (err) {
            expect(err).assertFail();
            done();
            return;
          }
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("ExtensionAbility1");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions[0]).assertEqual("ohos.permission.GET_BUNDLE_INFO");
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
          done();
        })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0012
    * @tc.name: test queryExtensionAbilityInfos api
    * @tc.desc: test queryExtensionAbilityInfos of Implicit query with get permission flag
    */
    it('SUB_BMS_APPINFO_EXTENSION_0012', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "action": "actionY12", "uri": "https://www.test.com/query/student/name"
      }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_METADATA,
        userId).then(data => {
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("ExtensionAbility1");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].metadata[0].name).assertEqual("ohos.extension.form");
          expect(data[0].metadata[0].value).assertEqual("testExtensionAbilities");
          expect(data[0].metadata[0].resource).assertEqual("$profile:form_config");
        }).catch(err => {
          expect(err).assertFail();
        });
      bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "action": "actionY12", "uri": "https://www.test.com/query/student/name"
      }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_WITH_METADATA,
        userId, (err, data) => {
          if (err) {
            expect(err).assertFail();
            done();
            return;
          }
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("ExtensionAbility1");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata[0].name).assertEqual("ohos.extension.form");
          expect(data[0].metadata[0].value).assertEqual("testExtensionAbilities");
          expect(data[0].metadata[0].resource).assertEqual("$profile:form_config");
          done();
        })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0013
    * @tc.name: test queryExtensionAbilityInfos api
    * @tc.desc: test queryExtensionAbilityInfos of Implicit query with uri get failed 
    */
    it('SUB_BMS_APPINFO_EXTENSION_0013', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "action": "actionY12",
          "uri": "https://www.test.com/query/teacher/name"
        }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {
          "bundleName": BUNDLE_NAME1,
          "action": "actionY12",
          "uri": "https://www.test.com/query/teacher/name"
        }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId, (err, data) => {
          if (err) {
            expect(err).assertEqual(1);
            done();
            return;
          }
          expect(data).assertFail();
          done();
        })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0014
    * @tc.name: test queryExtensionAbilityInfos api
    * @tc.desc: test queryExtensionAbilityInfos of Implicit query with entities
    */
    it('SUB_BMS_APPINFO_EXTENSION_0014', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "action": "",
        "entities": ["entitiesCommon"],
      }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId).then(data => {
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("myfeature");
          expect(data[0].name).assertEqual("ExtensionAbilityW");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(3);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
        }).catch(err => {
          expect(err).assertFail();
        });
      bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "action": "",
        "entities": ["entitiesCommon"]
      }, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId, (err, data) => {
          if (err) {
            expect(err).assertFail();
            done();
            return;
          }
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("myfeature");
          expect(data[0].name).assertEqual("ExtensionAbilityW");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(3);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
          done();
        })
    })
    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0015
    * @tc.name: test queryExtensionAbilityInfos api
    * @tc.desc: test queryExtensionAbilityInfos of Implicit query with invalid param
    */
    it('SUB_BMS_APPINFO_EXTENSION_0015', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        null, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {}, bundle.ExtensionAbilityType.UNSPECIFIED, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId, (err, data) => {
          if (err) {
            expect(err).assertEqual(1);
            done();
            return;
          }
          expect(data).assertFail();
          done();
        })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0016
    * @tc.name: test queryExtensionAbilityInfos api
    * @tc.desc: test queryExtensionAbilityInfos of Implicit query with entities 
    */
    it('SUB_BMS_APPINFO_EXTENSION_0016', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "action": "",
        "entities": ["entitiesCommon"],
      }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId).then(data => {
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("FormAbility");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
        }).catch(err => {
          expect(err).assertFail();
        });
      bundle.queryExtensionAbilityInfos({
        "bundleName": BUNDLE_NAME1,
        "action": "",
        "entities": ["entitiesCommon"]
      }, bundle.ExtensionAbilityType.FORM, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId, (err, data) => {
          if (err) {
            expect(err).assertFail();
            done();
            return;
          }
          expect(data[0].bundleName).assertEqual("ohos.acts.bundle.stage");
          expect(data[0].moduleName).assertEqual("phone");
          expect(data[0].name).assertEqual("FormAbility");
          expect(data[0].labelId).assertLarger(0);
          expect(data[0].descriptionId).assertLarger(0);
          expect(data[0].iconId).assertEqual(0);
          expect(data[0].isVisible).assertFalse();
          expect(data[0].extensionAbilityType).assertEqual(0);
          expect(data[0].permissions.length).assertEqual(0);
          expect(data[0].enabled).assertTrue();
          expect(data[0].readPermission).assertEqual("");
          expect(data[0].writePermission).assertEqual("");
          expect(data[0].metadata.length).assertEqual(0);
          done();
        })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0017
    * @tc.name: test queryExtensionAbilityInfos api
    * @tc.desc: test queryExtensionAbilityInfos of Implicit query with uri get failed 
    */
    it('SUB_BMS_APPINFO_EXTENSION_0017', 0, async function (done) {
      await bundle.queryExtensionAbilityInfos(
        {
          "type": "",
          "uri": "https://www.test.com/abbc"
        }, bundle.ExtensionAbilityType.WINDOW, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId).then(data => {
          expect(data).assertFail();
        }).catch(err => {
          expect(err).assertEqual(1);
        });
      bundle.queryExtensionAbilityInfos(
        {
          "type": "",
          "uri": "https://www.test.com/abbc"
        }, bundle.ExtensionAbilityType.WINDOW, bundle.ExtensionFlag.GET_EXTENSION_INFO_DEFAULT,
        userId, (err, data) => {
          if (err) {
            expect(err).assertEqual(1);
            done();
            return;
          }
          expect(data).assertFail();
          done();
        })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0020
    * @tc.name: test getBundleInfo api
    * @tc.desc: test getBundleInfo get extensionAbilityInfos success 
    */
    it('SUB_BMS_APPINFO_EXTENSION_0020', 0, async function (done) {
      await bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_EXTENSION_ABILITY).then(data => {
        expect(data.extensionAbilityInfo.length).assertEqual(7);
        expect(data.extensionAbilityInfo[0].name).assertEqual("ExtensionAbilityA");
        expect(data.extensionAbilityInfo[1].name).assertEqual("ExtensionAbilityB");
        expect(data.extensionAbilityInfo[2].name).assertEqual("ExtensionAbilityQ");
        expect(data.extensionAbilityInfo[3].name).assertEqual("ExtensionAbilityW");
        expect(data.extensionAbilityInfo[4].name).assertEqual("ExtensionAbility1");
        expect(data.extensionAbilityInfo[5].name).assertEqual("FormAbility");
        expect(data.extensionAbilityInfo[6].name).assertEqual("ServiceAbility");
      }).catch(err => {
        expect(err).assertFail();
      });
      bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_EXTENSION_ABILITY, (err, data) => {
        if (err) {
          expect(err).assertFail();
          done();
          return;
        }
        expect(data.extensionAbilityInfo.length).assertEqual(7);
        expect(data.extensionAbilityInfo[0].name).assertEqual("ExtensionAbilityA");
        expect(data.extensionAbilityInfo[1].name).assertEqual("ExtensionAbilityB");
        expect(data.extensionAbilityInfo[2].name).assertEqual("ExtensionAbilityQ");
        expect(data.extensionAbilityInfo[3].name).assertEqual("ExtensionAbilityW");
        expect(data.extensionAbilityInfo[4].name).assertEqual("ExtensionAbility1");
        expect(data.extensionAbilityInfo[5].name).assertEqual("FormAbility");
        expect(data.extensionAbilityInfo[6].name).assertEqual("ServiceAbility");
        done();
      })
    })

    /*
    * @tc.number: SUB_BMS_APPINFO_EXTENSION_0021
    * @tc.name: test getBundleInfo api
    * @tc.desc: test getBundleInfo with extensionAbilityInfos flag  get failed 
    */
    it('SUB_BMS_APPINFO_EXTENSION_0021', 0, async function (done) {
      await bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_EXTENSION_ABILITY).then(data => {
        expect(data.extensionAbilityInfo.length).assertEqual(0);
      }).catch(err => {
        expect(err).assertEqual(1);
      });
      bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_EXTENSION_ABILITY, (err, data) => {
        if (err) {
          expect(err).assertEqual(1);
          done();
          return;
        }
        expect(data.extensionAbilityInfo.length).assertEqual(0);
        done();
      })
    })

    function checkApplication(data) {
      expect(data[0].applicationInfo.name).assertEqual("ohos.acts.bundle.stage");
      expect(data[0].applicationInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage");
      expect(data[0].applicationInfo.accessTokenId).assertLarger(0);
      expect(data[0].applicationInfo.description).assertEqual("$string:description_application");
      expect(data[0].applicationInfo.descriptionId).assertLarger(0);
      expect(data[0].applicationInfo.icon).assertEqual("$media:icon");
      expect(data[0].applicationInfo.iconId).assertLarger(0);
      expect(data[0].applicationInfo.label).assertEqual("$string:app_name");
      expect(data[0].applicationInfo.labelId).assertLarger(0);
      expect(data[0].applicationInfo.systemApp).assertTrue();
      expect(data[0].applicationInfo.supportedModes).assertEqual(0);
      expect(data[0].applicationInfo.process).assertEqual("");
      expect(data[0].applicationInfo.entryDir).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage/phone");
      expect(data[0].applicationInfo.permissions.length).assertEqual(0);
      expect(data[0].applicationInfo.moduleSourceDirs[1]).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage/phone");
      expect(data[0].applicationInfo.moduleInfos[1].moduleName).assertEqual("phone");
      expect(data[0].applicationInfo.moduleInfos[1].moduleSourceDir).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage/phone");
      expect(JSON.stringify(data[0].applicationInfo.metaData)).assertEqual("{}");
      expect(JSON.stringify(data[0].applicationInfo.metadata)).assertEqual("{}");
      expect(data[0].applicationInfo.enabled).assertTrue();
      expect(data[0].applicationInfo.uid).assertLarger(0);
      expect(data[0].applicationInfo.entityType).assertEqual("unspecified");
      expect(data[0].applicationInfo.removable).assertTrue();
      expect(data[0].applicationInfo.fingerprint).assertEqual("");
    }

  })
}
