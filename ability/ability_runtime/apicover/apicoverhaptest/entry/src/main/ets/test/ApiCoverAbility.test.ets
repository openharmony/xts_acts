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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"

import formProvider from '@ohos.application.formProvider';
import FormInfo from '@ohos.application.formInfo';
import formError from '@ohos.application.formError';
var EXTENSION_INFO_ERR = 2097152
var USERID_ERR = 2097177
var trueInfo;
var array = new Array();
function sleep(time) {
  return new Promise((resolve)=>setTimeout(resolve,time));
}
export default function ApiCoverTest(abilityContext) {
  describe('ApiCoverTestTest', function () {

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_001
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_001', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension1"
      };
      await abilityContext.startServiceExtensionAbility(want).then((data) => {
        console.log('Ability: startServiceExtensionAbility success:' + JSON.stringify(data));
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: startServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        expect(EXTENSION_INFO_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_002
     * @tc.name    StopServiceExtensionAbility with incorrect bundleName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_002', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      await abilityContext.stopServiceExtensionAbility(want).then((data) => {
        console.log(`Ability: stopServiceExtensionAbility success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: stopServiceExtensionAbility failed: ${JSON.stringify(error)}`);
        expect(EXTENSION_INFO_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_003
     * @tc.name    startServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_003', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await abilityContext.startServiceExtensionAbilityWithAccount(want, 999).then((data) => {
        console.log(`Ability: startServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual("data");
      }).catch((error) => {
        console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(error)}`);
        expect(USERID_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_004
     * @tc.name    stopServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_004', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await abilityContext.stopServiceExtensionAbilityWithAccount(want, 999).then((data) => {
        console.log(`Ability: stopServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
        expect("case execute failed").assertEqual(data);
      }).catch((error) => {
        console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(error)}`);
        expect(USERID_ERR).assertEqual(error.code);
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_005
     * @tc.name    StartServiceExtensionAbility with incorrect abilityName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_005', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension1"
      }
      await abilityContext.startServiceExtensionAbility(want, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: startServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_006
     * @tc.name    StopServiceExtensionAbility with incorrect bundleName.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_006', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest1",
        abilityName: "FirstExtension"
      };
      await abilityContext.stopServiceExtensionAbility(want, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbility failed: ${JSON.stringify(err)}`);
          expect(EXTENSION_INFO_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: stopServiceExtensionAbility success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
      done()
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_007
     * @tc.name    startServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_007', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      await abilityContext.startServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: startServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          expect(USERID_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: startServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_008
     * @tc.name    stopServiceExtensionAbilityWithAccount with incorrect userId.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_008', 0, async function (done) {
      await sleep(2000);
      let want = {
        bundleName: "com.example.extensionapitest",
        abilityName: "FirstExtension"
      };
      abilityContext.stopServiceExtensionAbilityWithAccount(want, 999, (err, data) => {
        if (err.code) {
          console.error(`Ability: stopServiceExtensionAbilityWithAccount failed: ${JSON.stringify(err)}`);
          expect(USERID_ERR).assertEqual(err.code);
        } else {
          console.log(`Ability: stopServiceExtensionAbilityWithAccount success: ${JSON.stringify(data)}`);
          expect("case execute failed").assertEqual(data);
        }
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_AMS_Context_0100
     * @tc.name    Get the resource and path of the context.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Context_0100', 0, async function (done) {
      expect("/data/storage/el2/base/haps/phone/cache").assertEqual(abilityContext.cacheDir)
      expect("/data/storage/el2/base/haps/phone/temp").assertEqual(abilityContext.tempDir)
      expect("/data/storage/el2/base/haps/phone/files").assertEqual(abilityContext.filesDir)
      expect("/data/storage/el2/database/phone").assertEqual(abilityContext.databaseDir)
      expect("/data/storage/el2/base/haps/phone/preferences").assertEqual(abilityContext.preferencesDir)
      expect("/data/storage/el1/bundle").assertEqual(abilityContext.bundleCodeDir)
      expect("/data/storage/el2/distributedfiles").assertEqual(abilityContext.distributedFilesDir)
      expect(1).assertEqual(abilityContext.area)
	  let moduleContext = abilityContext.createModuleContext("module1")
      expect("/data/storage/el2/base/cache").assertEqual(moduleContext.cacheDir)
	  abilityContext.resourceManager.getConfiguration((err, data) => {
		if(err == undefined){
          console.log(`Ability: getConfiguration success: ${JSON.stringify(data)}`);
		  console.log(`Ability: getConfiguration success: JSON.stringify(data.direction)`);
          expect(0).assertEqual(data.direction)
          done()
		}else{
		  expect().assertFail()
          done()
		}
	  })
    })

	/*
     * @tc.number  SUB_AA_AMS_Context_0200
     * @tc.name    Register the listener of Ability and cancel the listener.
     * @tc.desc    Function test
     * @tc.level   3
     */
	it('SUB_AA_AMS_Context_0200', 0, async function (done) {
      await abilityContext.eventHub.on("contextEvent", func1)
      abilityContext.eventHub.emit("contextEvent", "aa", "bb")
      await sleep(500)
      expect("aa").assertEqual(array[0])
      expect("bb").assertEqual(array[1])
      array = []
      await abilityContext.eventHub.off("contextEvent", func1)
      abilityContext.eventHub.emit("contextEvent", "cc", "dd")
      await sleep(500)
      expect(array.length).assertEqual(0)
      array = [];
      function func1(a, b){
        array.push(a)
        array.push(b)
      }
      await sleep(2000)
      done()
    })

    /*
     * @tc.number  SUB_AA_Form_provider_getFormsInfo_0100
     * @tc.name    The provider calls the getFormsInfo interface to obtain form information.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_getFormsInfo_0100', 0, async function (done) {
      console.info("SUB_AA_Form_provider_getFormsInfo_0100");
      formProvider.getFormsInfo((err, value) => {
        console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
        console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
        if (err.code != 0) {
          expect(0).assertEqual(2)
        } else {
          for(let i = 0; i < value.length; i++){
            if(value[i].bundleName == "com.example.apicoverhaptest" && value[i].name == "widget"){
              trueInfo = value[i]
              console.info("formProvider::GetFormsInfoTest trueInfo: " + JSON.stringify(trueInfo));
            }
          }
        }
        checkFormInfo(trueInfo)
        done()
      })
    })

    /*
     * @tc.number  SUB_AA_Form_provider_getFormsInfo_0200
     * @tc.name    The provider calls the getFormsInfo interface to obtain form information in the module1.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_getFormsInfo_0200', 0, async function (done) {
      console.info("SUB_AA_Form_provider_getFormsInfo_0200");
      const filter: FormInfo.FormInfoFilter = {
        moduleName: "module1"
      };
      formProvider.getFormsInfo(filter, (err, value) => {
        console.info("formProvider::GetFormsInfoTest err: " + JSON.stringify(err));
        console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(value));
        if (err.code != 0) {
          expect(0).assertEqual(2)
        } else {
          if(value.length == 0){
            expect(1).assertEqual(0)
          }else{
            for(let i = 0; i < value.length; i++){
              if(value[i].bundleName == "com.example.apicoverhaptest" && value[i].name == "widget1"){
                trueInfo = value[i]
                console.info("formProvider::GetFormsInfoTest trueInfo: " + JSON.stringify(trueInfo));
              }
            }
          }
        }
        checkFormInfoModule1(trueInfo)
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormErr_0100
     * @tc.name    Get all FormError types.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormErr_0100', 0, async function (done) {
      console.info("SUB_AA_Form_provider_TestFormErr_0100");
      expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM)
      expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED)
      expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID)
      expect(1).assertEqual(formError.FormError.ERR_COMMON)
      expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED)
      expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED)
      expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY)
      expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION)
      expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE)
      expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED)
      expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED)
      expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED)
      expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY)
      expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT)
      expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM)
      expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS)
      expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS)
      expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID)
      expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF)
      expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY)
      expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL)
      expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED)
      done()
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormInfo_0100
     * @tc.name     Get all FormInfo types
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormInfo_0100', 0, async function (done) {
      console.info("SUB_AA_Form_provider_TestFormInfo_0100");
      expect("ohos.extra.param.key.form_dimension").assertEqual(FormInfo.FormParam.DIMENSION_KEY)
      expect("ohos.extra.param.key.form_height").assertEqual(FormInfo.FormParam.HEIGHT_KEY)
      expect("ohos.extra.param.key.module_name").assertEqual(FormInfo.FormParam.MODULE_NAME_KEY)
      expect("ohos.extra.param.key.form_name").assertEqual(FormInfo.FormParam.NAME_KEY)
      expect("ohos.extra.param.key.form_temporary").assertEqual(FormInfo.FormParam.TEMPORARY_KEY)
      expect("ohos.extra.param.key.form_width").assertEqual(FormInfo.FormParam.WIDTH_KEY)
      expect(0).assertEqual(FormInfo.FormState.DEFAULT)
      expect(1).assertEqual(FormInfo.FormState.READY)
      expect(-1).assertEqual(FormInfo.FormState.UNKNOWN)
      expect(0).assertEqual(FormInfo.ColorMode.MODE_DARK)
      expect(1).assertEqual(FormInfo.ColorMode.MODE_LIGHT)
      done();
    });
  })
}
function checkFormInfoModule1(formInfo){
  console.info("formProvider::GetFormsInfoTest value: " + JSON.stringify(formInfo));
  expect("com.example.apicoverhaptest").assertEqual(formInfo.bundleName)
  expect("module1").assertEqual(formInfo.moduleName)
  expect("FormAbility").assertEqual(formInfo.abilityName)
  expect("widget1").assertEqual(formInfo.name)
  expect("This is a service widget.").assertEqual(formInfo.description)
  expect(FormInfo.FormType.JS).assertEqual(formInfo.type)
  expect(FormInfo.ColorMode.MODE_DARK).assertEqual(formInfo.colorMode)
  expect(1).assertEqual(formInfo.isDefault)
  expect(1).assertEqual(formInfo.updateEnabled)
  expect(0).assertEqual(formInfo.formVisibleNotify)
  expect(undefined).assertEqual(formInfo.relatedBundleName)
  expect("ability://xxxxx").assertEqual(formInfo.formConfigAbility)
  expect(1).assertEqual(formInfo.updateDuration)
  expect(2).assertEqual(formInfo.defaultDimension)
  expect(2).assertEqual(formInfo.supportDimensions[0])
}
function checkFormInfo(formInfo){
  console.info("formProvider::GetFormsInfoTest formInfo: " + JSON.stringify(formInfo));
  expect("com.example.apicoverhaptest").assertEqual(formInfo.bundleName)
  expect("phone").assertEqual(formInfo.moduleName)
  expect("FormAbility").assertEqual(formInfo.abilityName)
  expect("widget").assertEqual(formInfo.name)
  expect("This is a service widget.").assertEqual(formInfo.description)
  expect(FormInfo.FormType.JS).assertEqual(formInfo.type)
  expect(FormInfo.ColorMode.MODE_AUTO).assertEqual(formInfo.colorMode)
  expect(1).assertEqual(formInfo.isDefault)
  expect(1).assertEqual(formInfo.updateEnabled)
  expect(0).assertEqual(formInfo.formVisibleNotify)
  expect(undefined).assertEqual(formInfo.relatedBundleName)
  expect("ability://xxxxx").assertEqual(formInfo.formConfigAbility)
  expect(1).assertEqual(formInfo.updateDuration)
  expect(2).assertEqual(formInfo.defaultDimension)
  expect(2).assertEqual(formInfo.supportDimensions[0])
}