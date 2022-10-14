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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

const MODULE_NAME = "entry"
const MODULE_NAME_TEST = "phone1"
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility"
const ABILITY_NAME1 = "ohos.acts.bundle.stage.test.MainAbility1"
const ABILITY_NAME_TEST = "ohos.acts.bundle.stage.test.MainAbilityTest"
const METADATA_NAME = "ohos.ability.form"
const METADATA_NAME1 = "ohos.ability.form1"
const METADATA_NAME2 = "ohos.ability.form2"
const METADATA_NAME3 = "ohos.ability.form3"
const METADATA_NAME4 = "ohos.ability.form4"
const METADATA_NAME_TEST = "ohos.test.form"
const PROFILE_JSON_STRING = "{\"src\":[\"MainAbility/pages/index/index\",\"MainAbility/pages/second/second\"]}"

export default function getProfileByAbility() {
  describe('getProfileByAbility', function () {
   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0011
    * @tc.name: getProfileByAbilityInvalidModulePro
    * @tc.desc: Check the invalid moduleName (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityInvalidModulePro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByAbilityInvalidModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByAbilityInvalidModulePro failed" + JSON.stringify(err))
        expect(err).assertEqual(1)
        done()
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0015
    * @tc.name: getProfileByAbilityEmptyModulePro
    * @tc.desc: Check the empty moduleName (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityEmptyModulePro', 0, async function (done) {
      await bundle.getProfileByAbility('', ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByAbilityEmptyModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByAbilityEmptyModulePro failed" + JSON.stringify(err))
        expect(err).assertEqual(1)
        done()
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0017
    * @tc.name: getProfileByAbilityInvalidModuleCall
    * @tc.desc: Check the invalid moduleName (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityInvalidModuleCall', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityInvalidModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByAbilityInvalidModuleCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0034
    * @tc.name: getProfileByAbilityEmptyModuleCall
    * @tc.desc: Check the empty moduleName (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityEmptyModuleCall', 0, async function (done) {
      bundle.getProfileByAbility('', ABILITY_NAME, METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityEmptyModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByAbilityEmptyModuleCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0012
    * @tc.name: getProfileByAbilityInvalidAbilityPro
    * @tc.desc: Check the invalid abilityName (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityInvalidAbilityPro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME).then(data => {
        console.info("getProfileByAbilityInvalidAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByAbilityInvalidAbilityPro failed" + JSON.stringify(err))
        expect(err).assertEqual(1)
        done()
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0029
    * @tc.name: getProfileByAbilityEmptyAbilityPro
    * @tc.desc: Check the empty abilityName (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityEmptyAbilityPro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, '', METADATA_NAME).then(data => {
        console.info("getProfileByAbilityEmptyAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByAbilityEmptyAbilityPro failed" + JSON.stringify(err))
        expect(err).assertEqual(1)
        done()
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0022
    * @tc.name: getProfileByAbilityInvalidAbilityCall
    * @tc.desc: Check the invalid abilityName (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityInvalidAbilityCall', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityInvalidAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByAbilityInvalidAbilityCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0029
    * @tc.name: getProfileByAbilityEmptyAbilityCall
    * @tc.desc: Check the empty abilityName (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityEmptyAbilityCall', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME, '', METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityEmptyAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByAbilityEmptyAbilityCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0024
    * @tc.name: getProfileByAbilityCallback
    * @tc.desc: Check the valid metadataName (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityCallback', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityCallback]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByAbilityCallback] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0026
    * @tc.name: getProfileByAbilityInvalidMetaDataCall
    * @tc.desc: Check the invalid metadataName (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityInvalidMetaDataCall', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityInvalidMetaDataCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByAbilityInvalidMetaDataCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0036
    * @tc.name: getProfileByAbilityEmptyMetaDataCall
    * @tc.desc: Check the empty metadataName (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityEmptyMetaDataCall', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, '', (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityEmptyMetaDataCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByAbilityEmptyMetaDataCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0002
    * @tc.name: getProfileByAbilityPromise
    * @tc.desc: Check the valid metadataName (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityPromise', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info('[getProfileByAbilityPromise] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByAbilityPromise]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0004
    * @tc.name: getProfileByAbilityInvalidMetaDataPro
    * @tc.desc: Check the invalid metadataName (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityInvalidMetaDataPro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST).then(data => {
        console.info('[getProfileByAbilityInvalidMetaDataPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.error('[getProfileByAbilityInvalidMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0030
    * @tc.name: getProfileByAbilityEmptyMetaDataPro
    * @tc.desc: Check the empty metadataName (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityEmptyMetaDataPro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, '').then(data => {
        console.info('[getProfileByAbilityEmptyMetaDataPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByAbilityEmptyMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })
  
   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0009
    * @tc.name: getProfileByAbilityNoMetaDataPro
    * @tc.desc: without metadataName (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityNoMetaDataPro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME).then(data => {
        console.info('[getProfileByAbilityNoMetaDataPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByAbilityNoMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0048
    * @tc.name: getProfileByAbilityNoProfilePro
    * @tc.desc: no profile configured under the ability (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityNoProfilePro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME1).then(data => {
        console.info('[getProfileByAbilityNoProfilePro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(data).assertFail()
        done();
      }).catch(err => {
        console.error('[getProfileByAbilityNoProfilePro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0045
    * @tc.name: getProfileByAbilityNotPrefixPro
    * @tc.desc: resource has no prefix '$profile:' (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityNotPrefixPro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME2).then(data => {
        console.info('[getProfileByAbilityNotPrefixPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(data).assertFail()
        done();
      }).catch(err => {
        console.error('[getProfileByAbilityNotPrefixPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0044
    * @tc.name: getProfileByAbilityNotPrefixCall
    * @tc.desc: resource has no prefix '$profile:' (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityNotPrefixCall', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME2, (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityNotPrefixCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByAbilityNotPrefixCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0007
    * @tc.name: getProfileByAbilityNotSuffixPro
    * @tc.desc: profile is .txt suffix (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityNotSuffixPro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3).then(data => {
        console.info('[getProfileByAbilityNotSuffixPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        done();
      }).catch(err => {
        console.error('[getProfileByAbilityNotSuffixPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0040
    * @tc.name: getProfileByAbilityNotSuffixCall
    * @tc.desc: profile is .txt suffix (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityNotSuffixCall', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3, (err, data) => {
        if (err) {
          console.error('[getProfileByAbilityNotSuffixCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        console.info('[getProfileByAbilityNotSuffixCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0008
    * @tc.name: getProfileByAbilityNoJsonPro
    * @tc.desc: profile is invalid json format (by promise)
    * @tc.level   0
    */
    it('getProfileByAbilityNoJsonPro', 0, async function (done) {
      await bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4).then(data => {
        console.info('[getProfileByAbilityNoJsonPro] data is: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch(err => {
        console.error('[getProfileByAbilityNoJsonPro] Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0046
    * @tc.name: getProfileByAbilityNoJsonCall
    * @tc.desc: profile is invalid json format (by callback)
    * @tc.level   0
    */
    it('getProfileByAbilityNoJsonCall', 0, async function (done) {
      bundle.getProfileByAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err, data) => {
        console.info('[getProfileByAbilityNoJsonCall] err: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        console.info('[getProfileByAbilityNoJsonCall] data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })
  })
}