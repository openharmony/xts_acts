/*
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

import bundle from '@ohos.bundle'
import image from '@ohos.multimedia.image'
import account from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'

const ABILITY_NAME = 'com.example.bmsmodulename.MainAbility';
const ABILITY_NAME1 = 'com.example.myapplication2.MainAbility';
const BUNDLE_NAME = 'com.example.bmsmodulename';
const BUNDLE_NAME1 = 'com.example.myapplication2';
const MODULE_NAME1 = '';
const MODULE_NAME2 = 'noModule';
const MODULE_NAME3 = 'entry';
const MODULE_NAME4 = undefined;
const MODULE_NAME5 = null;
const MODULE_NAME6 = 'feature';
const DEFAULT_FLAG = bundle.BundleFlag.GET_BUNDLE_DEFAULT;
const SUCCESS_CODE = 0;
const INVALID_CODE = 1;
const INVALID_PARAM = 2;
const ABILITY_INFO_ONE = {
  bundleName: BUNDLE_NAME,
  moduleName: MODULE_NAME1,
  name: ABILITY_NAME
};
const ABILITY_INFO_TWO = {
  bundleName: BUNDLE_NAME,
  moduleName: MODULE_NAME2,
  name: ABILITY_NAME
};
const ABILITY_INFO_THREE = {
  bundleName: BUNDLE_NAME,
  moduleName: MODULE_NAME3,
  name: ABILITY_NAME
};
const ABILITY_INFO_FOUR = {
  bundleName: BUNDLE_NAME,
  moduleName: MODULE_NAME4,
  name: ABILITY_NAME
};
let userId = 0;

export default function actsBmsJsModuleNameTest() {

  describe('actsBmsJsModuleNameTest', function () {

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
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0030
    * @tc.name: getAbilityInfoEmptyModule
    * @tc.desc: test empty moduleName
    */
    it('getAbilityInfoEmptyModule', 0, async function (done) {
      await bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          console.error('[getAbilityInfoEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertEqual(INVALID_CODE);
        });
      bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME, (err, data) => {
        expect(err).assertEqual(INVALID_CODE);
        if (err) {
          console.error('[getAbilityInfoEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        console.info("'[getAbilityInfoEmptyModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0020
    * @tc.name: getAbilityInfoInvalidModule
    * @tc.desc: test non-existent moduleName
    */
    it('getAbilityInfoInvalidModule', 0, async function (done) {
      await bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          console.error('[getAbilityInfoInvalidModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertEqual(INVALID_CODE);
        });
      bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME, (err, data) => {
        expect(err).assertEqual(INVALID_CODE);
        if (err) {
          console.error('[getAbilityInfoInvalidModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        console.info("'[getAbilityInfoInvalidModule]Return data : " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0018
    * @tc.name: getAbilityInfoHasModule
    * @tc.desc: test existent moduleName
    */
    it('getAbilityInfoHasModule', 0, async function (done) {
      await bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME)
        .then(data => {
          console.info('[getAbilityInfoHasModule]Return data successful: ' + JSON.stringify(data));
          checkDataInfo(data);
        }).catch((err) => {
          console.error('[getAbilityInfoHasModule]Operation . Err: ' + JSON.stringify(err));
          expect(err).assertFail();
        });
      bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME, (err, data) => {
        checkDataInfo(data);
        expect(err).assertEqual(SUCCESS_CODE);
        if (err) {
          console.error('[getAbilityInfoHasModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        console.info("'[getAbilityInfoHasModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0031
    * @tc.name: getAbilityIconEmptyModule
    * @tc.desc: test empty moduleName
    */
    it('getAbilityIconEmptyModule', 0, async function (done) {
      await bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          console.error('[getAbilityIconEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertEqual(INVALID_CODE);
        });
      bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME, (err, data) => {
        expect(err).assertEqual(INVALID_CODE);
        if (err) {
          console.error('[getAbilityIconEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        console.info("'[getAbilityIconEmptyModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0028
    * @tc.name: getAbilityIconInvalidModule
    * @tc.desc: test non-existent moduleName
    */
    it('getAbilityIconInvalidModule', 0, async function (done) {
      await bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          console.error('[getAbilityIconInvalidModule]Operation successful. Err: ' + JSON.stringify(err));
          expect(err).assertEqual(INVALID_CODE);
        });
      bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME, (err, data) => {
        expect(err).assertEqual(INVALID_CODE);
        if (err) {
          console.error('[getAbilityIconInvalidModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        console.info("'[getAbilityIconInvalidModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0026
    * @tc.name: getAbilityIconHasModule
    * @tc.desc: test existent moduleName
    */
    it('getAbilityIconHasModule', 0, async function (done) {
      await bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME)
        .then(data => {
          console.info('[getAbilityIconHasModule]Return data successful: ' + JSON.stringify(data));
          expect(data.getBytesNumberPerRow()).assertLarger(0);
        }).catch((err) => {
          console.error('[getAbilityIconHasModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertFail();
        });
      bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME, (err, data) => {
        expect(err).assertEqual(SUCCESS_CODE);
        expect(data.getBytesNumberPerRow()).assertLarger(0);
        if (err) {
          console.error('[getAbilityIconHasModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        console.info("'[getAbilityIconHasModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0032
    * @tc.name: getAbilityLabelEmptyModule
    * @tc.desc: test empty moduleName
    */
    it('getAbilityLabelEmptyModule', 0, async function (done) {
      await bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          console.error('[getAbilityLabelEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertEqual(INVALID_CODE);
        });
      bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME1, ABILITY_NAME, (err, data) => {
        expect(err).assertEqual(INVALID_CODE);
        if (err) {
          console.error('[getAbilityLabelEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        console.info("'[getAbilityLabelEmptyModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0024
    * @tc.name: getAbilityLabelInvalidModule
    * @tc.desc: test non-existent moduleName
    */
    it('getAbilityLabelInvalidModule', 0, async function (done) {
      await bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          console.error('[getAbilityLabelInvalidModule]Operation . Err: ' + JSON.stringify(err));
          expect(err).assertEqual(INVALID_CODE);
        });
      bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME2, ABILITY_NAME, (err, data) => {
        expect(err).assertEqual(INVALID_CODE);
        if (err) {
          console.error('[getAbilityLabelInvalidModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        console.info("'[getAbilityLabelInvalidModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0022
    * @tc.name: getAbilityLabelHasModule
    * @tc.desc: test existent moduleName
    */
    it('getAbilityLabelHasModule', 0, async function (done) {
      await bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME)
        .then(data => {
          console.info('[getAbilityLabelHasModule]Return data successful: ' + JSON.stringify(data));
          expect(data).assertEqual("bmsfirstright");
        }).catch((err) => {
          console.error('[getAbilityLabelHasModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertFail();
        });
      bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME3, ABILITY_NAME, (err, data) => {
        expect(err).assertNull();
        if (err) {
          console.error('[getAbilityLabelHasModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        expect(data).assertEqual("bmsfirstright");
        console.info("'[getAbilityLabelHasModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0010
    * @tc.name: isAbilityEnabledEmptyModule
    * @tc.desc: test empty moduleName
    */
    it('isAbilityEnabledEmptyModule', 0, async function (done) {
      let abilityInfo = generateAbilityInfoForTest(ABILITY_INFO_ONE.bundleName, ABILITY_INFO_ONE.name, ABILITY_INFO_ONE.moduleName);
      await bundle.isAbilityEnabled(abilityInfo)
        .then(data => {
          console.info('[isAbilityEnabledEmptyModule]Return data successful: ' + JSON.stringify(data));
          expect(data).assertTrue();
        }).catch((err) => {
          console.error('[isAbilityEnabledEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertFail();
        });
      bundle.isAbilityEnabled(abilityInfo, (err, data) => {
        expect(err.code).assertEqual(SUCCESS_CODE);
        if (err) {
          console.error('[isAbilityEnabledEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        expect(data).assertTrue();
        console.info("'[isAbilityEnabledEmptyModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0011
    * @tc.name: isAbilityEnabledInvalidModule
    * @tc.desc: test non-existent moduleName
    */
    it('isAbilityEnabledInvalidModule', 0, async function (done) {
      let abilityInfo = generateAbilityInfoForTest(ABILITY_INFO_TWO.bundleName, ABILITY_INFO_TWO.name, ABILITY_INFO_TWO.moduleName);
      await bundle.isAbilityEnabled(abilityInfo)
        .then(data => {
          expect(data).assertEqual(false);
        }).catch((err) => {
          console.error('[isAbilityEnabledInvalidModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertFail();
        });
      bundle.isAbilityEnabled(abilityInfo, (err, data) => {
        expect(data).assertEqual(false);
        if (err) {
          console.error('[isAbilityEnabledInvalidModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        expect(err.code).assertEqual(SUCCESS_CODE);
        console.info("'[isAbilityEnabledInvalidModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0008
    * @tc.name: isAbilityEnabledHasModule
    * @tc.desc: test existent moduleName
    */
    it('isAbilityEnabledHasModule', 0, async function (done) {
      let abilityInfo = generateAbilityInfoForTest(ABILITY_INFO_THREE.bundleName, ABILITY_INFO_THREE.name, ABILITY_INFO_THREE.moduleName);
      await bundle.isAbilityEnabled(abilityInfo)
        .then(data => {
          console.info('[isAbilityEnabledHasModule]Return data successful: ' + JSON.stringify(data));
          expect(data).assertTrue();
        }).catch((err) => {
          console.error('[isAbilityEnabledHasModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err).assertFail();
        });
      bundle.isAbilityEnabled(abilityInfo, (err, data) => {
        expect(err.code).assertEqual(SUCCESS_CODE);
        if (err) {
          console.error('[isAbilityEnabledHasModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        expect(data).assertTrue();
        console.info("'[isAbilityEnabledHasModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0012
    * @tc.name: isAbilityEnabledUndefinedModule
    * @tc.desc: test empty moduleName
    */
    it('isAbilityEnabledUndefinedModule', 0, async function (done) {
      let abilityInfo = generateAbilityInfoForTest(ABILITY_INFO_FOUR.bundleName, ABILITY_INFO_FOUR.name, ABILITY_INFO_FOUR.moduleName);
      await bundle.isAbilityEnabled(abilityInfo)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          console.error('[isAbilityEnabledUndefinedModule]Operation failed. Err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(INVALID_PARAM);
        });
      bundle.isAbilityEnabled(abilityInfo, (err, data) => {
        expect(data).assertEqual(undefined);
        if (err) {
          console.error('[isAbilityEnabledUndefinedModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        expect(err.code).assertEqual(INVALID_PARAM);
        console.info("'[isAbilityEnabledUndefinedModule]Return data: " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0033
    * @tc.name: queryAbilityByWantEmptyModule
    * @tc.desc: test empty moduleName
    */
    it('queryAbilityByWantEmptyModule', 0, async function (done) {
      await bundle.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        moduleName: MODULE_NAME1
      }, DEFAULT_FLAG, userId).then(data => {
        checkDataInfo(data[0]);
        console.info("'[queryAbilityByWantEmptyModule]Return data : " + JSON.stringify(data));
      }).catch(err => {
        console.info("[queryAbilityByWantEmptyModule]Operation failed. Err: " + JSON.stringify(err));
        expect(err).assertFail();
      });
      bundle.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        moduleName: MODULE_NAME1
      }, DEFAULT_FLAG, userId, (err, data) => {
        expect(err).assertEqual(SUCCESS_CODE);
        if (err) {
          console.error('[queryAbilityByWantEmptyModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        checkDataInfo(data[0]);
        console.info("'[queryAbilityByWantEmptyModule]Return data : " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0002
    * @tc.name: queryAbilityByWantInvalidModule
    * @tc.desc: test non-existent moduleName
    */
    it('queryAbilityByWantInvalidModule', 0, async function (done) {
      await bundle.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        moduleName: MODULE_NAME2
      }, DEFAULT_FLAG, userId).then(data => {
        expect(data).assertFail();
      }).catch(err => {
        console.error('[queryAbilityByWantInvalidModule]Operation failed. Err: ' + JSON.stringify(err));
        expect(err).assertEqual(INVALID_CODE);
      });
      bundle.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        moduleName: MODULE_NAME2
      }, DEFAULT_FLAG, userId, (err, data) => {
        console.info("'[queryAbilityByWantInvalidModule]Return data " + JSON.stringify(data));
        expect(data).assertEqual("QueryAbilityInfos failed");
        console.error('[queryAbilityByWantInvalidModule]Operation failed. Err: ' + JSON.stringify(err));
        expect(err).assertEqual(INVALID_CODE);
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0001
    * @tc.name: queryAbilityByWantHasModule
    * @tc.desc: test existent moduleName
    */
    it('queryAbilityByWantHasModule', 0, async function (done) {
      await bundle.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        moduleName: MODULE_NAME3
      }, DEFAULT_FLAG, userId).then(data => {
        checkDataInfo(data[0]);
        console.info("'[queryAbilityByWantHasModule]Return data : " + JSON.stringify(data));
      }).catch(err => {
        console.info("[queryAbilityByWantHasModule]Operation failed. Err: " + JSON.stringify(err));
        expect(err).assertFail();
      });
      bundle.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        moduleName: MODULE_NAME3
      }, DEFAULT_FLAG, userId, (err, data) => {
        expect(err).assertEqual(SUCCESS_CODE);
        if (err) {
          console.error('[queryAbilityByWantHasModule]Operation failed. Err: ' + JSON.stringify(err));
        }
        checkDataInfo(data[0]);
        console.info("'[queryAbilityByWantHasModule]Return data : " + JSON.stringify(data));
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0022
    * @tc.name: getAbilityInfoUndefinedModule
    * @tc.desc: test undefined moduleName
    */
    it('getAbilityInfoUndefinedModule', 0, async function (done) {
      await bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME4, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          expect(err).assertEqual(INVALID_PARAM);
          bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME4, ABILITY_NAME, (error, data) => {
            expect(error).assertEqual(INVALID_PARAM);
          });
        });
      await bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME5, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
          done();
        }).catch((err) => {
          expect(err).assertEqual(INVALID_PARAM);
          bundle.getAbilityInfo(BUNDLE_NAME, MODULE_NAME5, ABILITY_NAME, (error, data) => {
            expect(error).assertEqual(INVALID_PARAM);
            done();
          });
        });
    });


    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0029
    * @tc.name: getAbilityIconUndefinedModule
    * @tc.desc: test undefined moduleName
    */
    it('getAbilityIconUndefinedModule', 0, async function (done) {
      await bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME4, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          expect(err).assertEqual(INVALID_PARAM);
          bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME4, ABILITY_NAME, (error, data) => {
            expect(error).assertEqual(INVALID_PARAM);
          });
        });
      await bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME5, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
          done();
        }).catch((err) => {
          expect(err).assertEqual(INVALID_PARAM);
          bundle.getAbilityIcon(BUNDLE_NAME, MODULE_NAME5, ABILITY_NAME, (error, data) => {
            expect(error).assertEqual(INVALID_PARAM);
            done();
          });
        });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0025
    * @tc.name: getAbilityLabelUndefinedModule
    * @tc.desc: test undefined moduleName
    */
    it('getAbilityLabelUndefinedModule', 0, async function (done) {
      await bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME4, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
        }).catch((err) => {
          expect(err).assertEqual(INVALID_PARAM);
          bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME4, ABILITY_NAME, (error, data) => {
            expect(error).assertEqual(INVALID_PARAM);
          });
        });
      await bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME5, ABILITY_NAME)
        .then(data => {
          expect(data).assertFail();
          done();
        }).catch((err) => {
          expect(err).assertEqual(INVALID_PARAM);
          bundle.getAbilityLabel(BUNDLE_NAME, MODULE_NAME5, ABILITY_NAME, (error, data) => {
            expect(error).assertEqual(INVALID_PARAM);
            done();
          });
        });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0004
    * @tc.name: queryAbilityByWantUndefinedModule
    * @tc.desc: test undefined moduleName
    */
    it('queryAbilityByWantUndefinedModule', 0, async function (done) {
      await bundle.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        moduleName: MODULE_NAME4
      }, DEFAULT_FLAG, userId).then(data => {
        checkDataInfo(data[0]);
        bundle.queryAbilityByWant({
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME,
          moduleName: MODULE_NAME4
        }, DEFAULT_FLAG, userId, (err1, data1) => {
          checkDataInfo(data1[0]);
          expect(err1).assertEqual(SUCCESS_CODE);
        });
      }).catch(err => {
        expect().assertFail();
      });
      await bundle.queryAbilityByWant({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        moduleName: MODULE_NAME5
      }, DEFAULT_FLAG, userId).then(data => {
        checkDataInfo(data[0]);
        bundle.queryAbilityByWant({
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME,
          moduleName: MODULE_NAME5
        }, DEFAULT_FLAG, userId, (err1, data1) => {
          checkDataInfo(data1[0]);
          expect(err1).assertEqual(SUCCESS_CODE);
          done();
        });
      }).catch(err => {
        expect().assertFail();
        done();
      });
    });


    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0027
    * @tc.name: getAbilityIconMultiHap
    * @tc.desc: test existent moduleName
    */
    it('getAbilityIconMultiHap', 0, async function (done) {
      await bundle.getAbilityIcon(BUNDLE_NAME1, MODULE_NAME6, ABILITY_NAME1)
        .then(data => {
          expect(data.getBytesNumberPerRow()).assertLarger(0);
        }).catch((err) => {
          expect(err).assertFail();
        });
      bundle.getAbilityIcon(BUNDLE_NAME1, MODULE_NAME6, ABILITY_NAME1, (err, data) => {
        expect(err).assertEqual(SUCCESS_CODE);
        expect(data.getBytesNumberPerRow()).assertLarger(0);
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0019
    * @tc.name: getAbilityInfoMultiHap
    * @tc.desc: test existent moduleName
    */
    it('getAbilityInfoMultiHap', 0, async function (done) {
      await bundle.getAbilityInfo(BUNDLE_NAME1, MODULE_NAME6, ABILITY_NAME1)
        .then(data => {
          checkAbilityInfo(data);
        }).catch((err) => {
          expect(err).assertFail();
        });
      bundle.getAbilityInfo(BUNDLE_NAME1, MODULE_NAME6, ABILITY_NAME1, (err, data) => {
        checkAbilityInfo(data);
	expect(err).assertEqual(SUCCESS_CODE);
        done();
      });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERYMODULE_0023
    * @tc.name: getAbilityLabelMultiHap
    * @tc.desc: test existent moduleName
    */
    it('getAbilityLabelMultiHap', 0, async function (done) {
      await bundle.getAbilityLabel(BUNDLE_NAME1, MODULE_NAME6, ABILITY_NAME1)
        .then(data => {
          expect(data).assertEqual("bmsscenethree");
        }).catch((err) => {
          expect(err).assertFail();
        });
      bundle.getAbilityLabel(BUNDLE_NAME1, MODULE_NAME6, ABILITY_NAME1, (err, data) => {
        expect(data).assertEqual("bmsscenethree");
        expect(err).assertNull();
        done();
      });
    });


    function checkDataInfo(data) {
      expect(typeof (data.bundleName)).assertEqual("string");
      expect(data.bundleName).assertEqual("com.example.bmsmodulename");
      expect(typeof (data.name)).assertEqual("string");
      expect(data.name).assertEqual("com.example.bmsmodulename.MainAbility");
      expect(data.label).assertEqual("$string:app_name");
      expect(typeof (data.label)).assertEqual("string");
      expect(data.description).assertEqual("$string:mainability_description");
      expect(typeof (data.description)).assertEqual("string");
      expect(data.icon).assertEqual("$media:icon");
      expect(typeof (data.icon)).assertEqual("string");
      expect(data.isVisible).assertEqual(false);
      expect(data.deviceTypes[0]).assertEqual("default");
      expect(typeof (data.process)).assertEqual("string");
      expect(data.process).assertEqual("com.example.bmsmodulename");
      expect(typeof (data.uri)).assertEqual("string");
      expect(data.uri).assertEqual("");
      expect(data.moduleName).assertEqual("entry");
      expect(typeof (data.moduleName)).assertEqual("string");
      expect(typeof (data.applicationInfo)).assertEqual("object");
      let info = data.applicationInfo;
      expect(typeof (info)).assertEqual("object");
      expect(typeof (info.name)).assertEqual("string");
      expect(info.name).assertEqual("com.example.bmsmodulename");
      expect(typeof (info.codePath)).assertEqual("string");
      expect(info.codePath).assertEqual("/data/app/el1/bundle/public/com.example.bmsmodulename");
      expect(typeof (info.accessTokenId)).assertEqual("number");
      expect(info.accessTokenId > 0).assertTrue();
      expect(typeof (info.description)).assertEqual("string");
      expect(info.description).assertEqual("");
      expect(typeof (info.descriptionId)).assertEqual("number");
      expect(info.descriptionId).assertEqual(0);
      expect(typeof (info.icon)).assertEqual("string");
      expect(info.icon).assertEqual("$media:icon");
      expect(typeof (info.iconId)).assertEqual("number");
      expect(info.iconId > 0).assertTrue();
      expect(typeof (info.label)).assertEqual("string");
      expect(info.label).assertEqual("$string:app_name");
      expect(typeof (info.labelId)).assertEqual("number");
      expect(info.labelId > 0).assertTrue();
      expect(info.systemApp).assertEqual(false);
      expect(typeof (info.entryDir)).assertEqual("string");
      expect(info.entryDir)
        .assertEqual("/data/app/el1/bundle/public/com.example.bmsmodulename/com.example.bmsmodulenamedentry");
      expect(typeof (info.process)).assertEqual("string");
      expect(info.process).assertEqual("com.example.bmsmodulename");
      expect(Array.isArray(info.permissions)).assertEqual(true);
      console.log("---checkDataInfo End---  ");
    }

    function checkAbilityInfo(data) {
      expect(typeof (data.bundleName)).assertEqual("string");
      expect(data.bundleName).assertEqual("com.example.myapplication2");
      expect(typeof (data.name)).assertEqual("string");
      expect(data.name).assertEqual("com.example.myapplication2.MainAbility");
      expect(data.label).assertEqual("$string:app_name");
      expect(typeof (data.label)).assertEqual("string");
      expect(data.description).assertEqual("$string:mainability_description");
      expect(typeof (data.description)).assertEqual("string");
      expect(data.icon).assertEqual("$media:icon");
      expect(typeof (data.icon)).assertEqual("string");
      expect(data.isVisible).assertEqual(false);
      expect(data.deviceTypes[0]).assertEqual("default");
      expect(typeof (data.process)).assertEqual("string");
      expect(data.process).assertEqual("com.example.myapplication2");
      expect(typeof (data.uri)).assertEqual("string");
      expect(data.uri).assertEqual("");
      expect(data.moduleName).assertEqual("feature");
      expect(typeof (data.moduleName)).assertEqual("string");
      expect(typeof (data.applicationInfo)).assertEqual("object");
      let info = data.applicationInfo;
      expect(typeof (info)).assertEqual("object");
      expect(typeof (info.name)).assertEqual("string");
      expect(info.name).assertEqual("com.example.myapplication2");
      expect(typeof (info.codePath)).assertEqual("string");
      expect(info.codePath).assertEqual("/data/app/el1/bundle/public/com.example.myapplication2");
      expect(typeof (info.accessTokenId)).assertEqual("number");
      expect(info.accessTokenId > 0).assertTrue();
      expect(typeof (info.description)).assertEqual("string");
      expect(info.description).assertEqual("$string:entry_description");
      expect(typeof (info.descriptionId)).assertEqual("number");
      expect(info.descriptionId).assertLarger(0);
      expect(typeof (info.icon)).assertEqual("string");
      expect(info.icon).assertEqual("$media:icon");
      expect(typeof (info.iconId)).assertEqual("number");
      expect(info.iconId > 0).assertTrue();
      expect(typeof (info.label)).assertEqual("string");
      expect(info.label).assertEqual("$string:app_name");
      expect(typeof (info.labelId)).assertEqual("number");
      expect(info.labelId > 0).assertTrue();
      expect(info.systemApp).assertEqual(false);
      expect(typeof (info.entryDir)).assertEqual("string");
      expect(info.entryDir)
        .assertEqual("/data/app/el1/bundle/public/com.example.myapplication2/com.example.myapplication1");
      expect(typeof (info.process)).assertEqual("string");
      expect(info.process).assertEqual("com.example.myapplication2");
      expect(Array.isArray(info.permissions)).assertEqual(true);
      console.log("---checkDataInfo End---  ");
    }
        function generateAbilityInfoForTest(bundleName, name, moduleName) {
            let map1 = new Map([
                ["", [{
                    "name": "", "value": "", "extra": ""
                }]]
            ]);
            let map2 = new Map([
                ["", [{
                    "name": "", "value": "", "resource": ""
                }]]
            ]);
            let resource = {
                "bundleName": "", "moduleName": "", "id": 0
            }
            let abilityInfo = {
                bundleName: bundleName,
                name: name,
                label: "",
                description: "",
                icon: "",
                labelId: 0,
                descriptionId: 0,
                iconId: 0,
                moduleName: moduleName,
                process: "",
                targetAbility: "",
                backgroundModes: 0,
                isVisible: true,
                formEnabled: true,
                type: 0,
                subType: 0,
                orientation: 0,
                launchMode: 0,
                permissions: [], deviceTypes: [], deviceCapabilities: [], readPermission: "", writePermission: "",
                applicationInfo: {
                    name: "", description: "", descriptionId: 0, systemApp: true, enabled: true, label: "",
                    labelId: "", labelIndex: 0, icon: "", iconId: "", iconIndex: 0, process: "", supportedModes: 0, moduleSourceDirs: [],
                    permissions: [], moduleInfos: [], entryDir: "", codePath: "", metaData: map1, metadata: map2,
                    removable: true, accessTokenId: 0, uid: 0, entityType: "", fingerprint: "",
                    iconResource: resource, labelResource: resource, descriptionResource: resource,
                    appDistributionType :"" ,appProvisionType :""
                },
                uri: "", metaData: [], metadata: [], enabled: true, supportWindowMode: [],
                maxWindowRatio: 0, minWindowRatio: 0, maxWindowWidth: 0, minWindowWidth: 0, maxWindowHeight: 0, minWindowHeight: 0
            };
            return abilityInfo;
        }

  });
}
