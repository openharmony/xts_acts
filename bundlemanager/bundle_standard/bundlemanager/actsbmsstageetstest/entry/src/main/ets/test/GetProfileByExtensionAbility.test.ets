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
const ABILITY_NAME = "Form"
const ABILITY_NAME1 = "Form1"
const ABILITY_NAME_TEST = "FromTest"
const METADATA_NAME = "ohos.extension.form"
const METADATA_NAME1 = "ohos.extension.form1"
const METADATA_NAME2 = "ohos.extension.form2"
const METADATA_NAME3 = "ohos.extension.form3"
const METADATA_NAME4 = "ohos.extension.form4"
const METADATA_NAME_TEST = "ohos.test.form"
const PROFILE_JSON_STRING = "{\"src\":[\"MainAbility/pages/index/index\",\"MainAbility/pages/second/second\"]}"

export default function getProfileByExtensionAbility() {
  describe('getProfileByExtensionAbility', function () {
   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0021
    * @tc.name: getProfileByExtensionInvalidModulePro
    * @tc.desc: Check the invalid moduleName (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionInvalidModulePro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionInvalidModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByExtensionInvalidModulePro failed" + JSON.stringify(err))
        expect(err).assertEqual(1)
        done()
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0031
    * @tc.name: getProfileByExtensionEmptyModulePro
    * @tc.desc: Check the Empty moduleName (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionEmptyModulePro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionEmptyModulePro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByExtensionEmptyModulePro failed" + JSON.stringify(err))
        expect(err).assertEqual(1)
        done()
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0028
    * @tc.name: getProfileByExtensionEmptyModuleCall
    * @tc.desc: Check the invalid moduleName (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionEmptyModuleCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionEmptyModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByExtensionEmptyModuleCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0037
    * @tc.name: getProfileByExtensionEmptyModuleCall
    * @tc.desc: Check the Empty moduleName (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionEmptyModuleCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionEmptyModuleCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByExtensionEmptyModuleCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0013
    * @tc.name: getProfileByExtensionInvalidAbilityPro
    * @tc.desc: Check the invalid abilityName (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionInvalidAbilityPro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME).then(data => {
        console.info("getProfileByExtensionInvalidAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByExtensionInvalidAbilityPro failed" + JSON.stringify(err))
        expect(err).assertEqual(1)
        done()
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0032
    * @tc.name: getProfileByExtensionEmptyAbilityPro
    * @tc.desc: Check the Empty abilityName (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionEmptyAbilityPro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME).then(data => {
        console.info("getProfileByExtensionEmptyAbilityPro success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.info("getProfileByExtensionEmptyAbilityPro failed" + JSON.stringify(err))
        expect(err).assertEqual(1)
        done()
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0023
    * @tc.name: getProfileByExtensionInvalidAbilityCall
    * @tc.desc: Check the invalid abilityName (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionInvalidAbilityCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionInvalidAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByExtensionInvalidAbilityCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0038
    * @tc.name: getProfileByExtensionEmptyAbilityCall
    * @tc.desc: Check the Empty abilityName (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionEmptyAbilityCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionEmptyAbilityCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByExtensionEmptyAbilityCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0025
    * @tc.name: getProfileByExtensionAbilityCallback
    * @tc.desc: Check the valid metadataName (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionAbilityCallback', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME, (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionAbilityCallback]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByExtensionAbilityCallback] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0027
    * @tc.name: getProfileByExtensionInvalidMetaDataCall
    * @tc.desc: Check the invalid metadataName (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionInvalidMetaDataCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionInvalidMetaDataCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByExtensionInvalidMetaDataCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0039
    * @tc.name: getProfileByExtensionEmptyMetaDataCall
    * @tc.desc: Check the empty metadataName (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionEmptyMetaDataCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, '', (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionEmptyMetaDataCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByExtensionEmptyMetaDataCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0003
    * @tc.name: getProfileByExtensionAbilityPromise
    * @tc.desc: Check the valid metadataName (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionAbilityPromise', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME).then(data => {
        console.info('[getProfileByExtensionAbilityPromise] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityPromise]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0016
    * @tc.name: getProfileByExtensionInvalidMetaDataPro
    * @tc.desc: Check the invalid metadataName (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionInvalidMetaDataPro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST).then(data => {
        console.info('[getProfileByExtensionInvalidMetaDataPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(data).assertFail()
        done()
      }).catch(err => {
        console.error('[getProfileByExtensionInvalidMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0033
    * @tc.name: getProfileByExtensionEmptyMetaDataPro
    * @tc.desc: Check the empty metadataName (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionEmptyMetaDataPro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, '').then(data => {
        console.info('[getProfileByExtensionEmptyMetaDataPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionEmptyMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })
  
   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0010
    * @tc.name: getProfileByExtensionAbilityNoMetaDataPro
    * @tc.desc: without metadataName (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionAbilityNoMetaDataPro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME).then(data => {
        console.info('[getProfileByExtensionAbilityNoMetaDataPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        expect(data[0]).assertEqual(PROFILE_JSON_STRING);
        expect(typeof data[1]).assertEqual("string");
        expect(data[1]).assertEqual(PROFILE_JSON_STRING);
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityNoMetaDataPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0049
    * @tc.name: getProfileByExtensionAbilityNoProfilePro
    * @tc.desc: no profile configured under the ability (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionAbilityNoProfilePro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME1).then(data => {
        console.info('[getProfileByExtensionAbilityNoProfilePro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(data).assertFail()
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionAbilityNoProfilePro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0043
    * @tc.name: getProfileByExtensionNotPrefixPro
    * @tc.desc: resource has no prefix '$profile:' (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionNotPrefixPro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME2).then(data => {
        console.info('[getProfileByExtensionNotPrefixPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(data).assertFail()
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionNotPrefixPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0042
    * @tc.name: getProfileByExtensionNotPrefixCall
    * @tc.desc: resource has no prefix '$profile:' (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionNotPrefixCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME2, (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionNotPrefixCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err).assertEqual(1);
        }
        console.info('[getProfileByExtensionNotPrefixCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0019
    * @tc.name: getProfileByExtensionNotSuffixPro
    * @tc.desc: profile is .txt suffix (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionNotSuffixPro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3).then(data => {
        console.info('[getProfileByExtensionNotSuffixPro] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionNotSuffixPro]Operation failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0041
    * @tc.name: getProfileByExtensionNotSuffixCall
    * @tc.desc: profile is .txt suffix (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionNotSuffixCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3, (err, data) => {
        if (err) {
          console.error('[getProfileByExtensionNotSuffixCall]Operation failed. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        console.info('[getProfileByExtensionNotSuffixCall] getApplicationInfo callback data is: ' + JSON.stringify(data));
        expect(Array.isArray(data)).assertTrue();
        expect(typeof data[0]).assertEqual("string");
        done();
      });
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0020
    * @tc.name: getProfileByExtensionNoJsonPro
    * @tc.desc: profile is invalid json format (by promise)
    * @tc.level   0
    */
    it('getProfileByExtensionNoJsonPro', 0, async function (done) {
      await bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4).then(data => {
        console.info('[getProfileByExtensionNoJsonPro] data is: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch(err => {
        console.error('[getProfileByExtensionNoJsonPro] Operation failed. Cause: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        done();
      })
    })

   /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMETAFILE_0047
    * @tc.name: getProfileByExtensionNoJsonCall
    * @tc.desc: profile is invalid json format (by callback)
    * @tc.level   0
    */
    it('getProfileByExtensionNoJsonCall', 0, async function (done) {
      bundle.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err, data) => {
        console.info('[getProfileByExtensionNoJsonCall] err: ' + JSON.stringify(err));
        expect(err).assertEqual(1);
        console.info('[getProfileByExtensionNoJsonCall] data is: ' + JSON.stringify(data));
        expect(typeof data).assertEqual("string");
        expect(data).assertEqual("GetProfile failed");
        done();
      });
    })
  })
}