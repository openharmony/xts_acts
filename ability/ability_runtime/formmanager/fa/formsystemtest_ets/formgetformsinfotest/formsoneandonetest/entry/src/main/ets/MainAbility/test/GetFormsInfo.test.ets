/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import formHost from '@ohos.application.formHost';
import { describe, expect, it } from 'deccjsunit/index';
import FormInfo from '@ohos.application.formInfo';

export const getFormsInfoTest = (describeName, filterParameter) => {
  const ERR_OK_CODE = 0;
  const ERR_OK = `success`;
  const ERR_GET_BUNDLE_FAILED_CODE = 5;
  const ERR_GET_BUNDLE_FAILED = `failed to obtain the bundle information`;
  const ERR_ADD_INVALID_PARAM_CODE = 7;
  const ERR_ADD_INVALID_PARAM = `invalid input parameter during form operation`;
  function sleep(time) {
    return new Promise((resolve)=>setTimeout(resolve,time));
  }

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_0900 callback`;
    const promiseName = `FMS_getFormsInfo_0900 promise`;
    const bundleName = ``;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_0900
     * @tc.desc: Query specific form configuration information by empty bundle name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_0900
     * @tc.desc: Query specific form configuration information by empty bundle name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      }
    });
  });

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_1000 callback`;
    const promiseName = `FMS_getFormsInfo_1000 promise`;
    const bundleName = `wrong.bundle.name`;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1000
     * @tc.desc: Query specific form configuration information by wrong bundle name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
          expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1000
     * @tc.desc: Query specific form configuration information by wrong bundle name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
        expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      }
    });
  });

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_1100 callback`;
    const promiseName = `FMS_getFormsInfo_1100 promise`;
    const bundleName = `com.ohos.st.formsystemproviderb`;
    var tempDataB = undefined;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1100
     * @tc.desc: Query specific form configuration information by correct bundle name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          console.log(`${callbackName} forms amount: ${data.length}`);

          const dataB = data.filter((form) => {
            return `com.ohos.st.formsystemproviderb` === form.bundleName;
          });
          console.log(`${callbackName} form dataB: ${JSON.stringify(dataB)}`);
          console.log(`${callbackName} formB amount: ${dataB.length}`);

          expect(data.length).assertEqual(1);
          expect(dataB.length).assertEqual(1);
          tempDataB = dataB[0]
          expect(error.code).assertEqual(ERR_OK_CODE);
          expect(error.message).assertEqual(ERR_OK);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
        await sleep(2000)
        checkDataB(tempDataB)
        done()
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1100
     * @tc.desc: Query specific form configuration information by correct bundle name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} forms amount: ${data.length}`);

        const dataB = data.filter((form) => {
          return `com.ohos.st.formsystemproviderb` === form.bundleName;
        });
        console.log(`${promiseName} form dataB: ${JSON.stringify(dataB)}`);
        console.log(`${promiseName} formB amount: ${dataB.length}`);

        expect(data.length).assertEqual(1);
        expect(dataB.length).assertEqual(1);
        tempDataB = dataB[0]
        checkDataB(tempDataB)
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      }
    });
    function checkDataB(formInfo){
         expect("com.ohos.st.formsystemproviderb").assertEqual(formInfo.bundleName)
         expect("form_module_b").assertEqual(formInfo.moduleName)
         expect("com.ohos.st.formsystemproviderb.MainAbility").assertEqual(formInfo.abilityName)
         expect("FormB_Js001").assertEqual(formInfo.name)
         expect("form_description_FormB_Js001").assertEqual(formInfo.description)
         expect(FormInfo.FormType.JS).assertEqual(formInfo.type)
         expect('card_b').assertEqual(formInfo.jsComponentName)
         expect(FormInfo.ColorMode.MODE_AUTO).assertEqual(formInfo.colorMode)
         expect(1).assertEqual(formInfo.isDefault)
         expect(1).assertEqual(formInfo.updateEnabled)
         expect(1).assertEqual(formInfo.formVisibleNotify)
         expect(undefined).assertEqual(formInfo.relatedBundleName)
         expect("abilityb").assertEqual(formInfo.formConfigAbility)
         expect(3).assertEqual(formInfo.updateDuration)
         expect(2).assertEqual(formInfo.defaultDimension)
         expect('10:30').assertEqual(formInfo.scheduledUpdateTime)
         expect(1).assertEqual(formInfo.supportDimensions[0])
         expect(2).assertEqual(formInfo.supportDimensions[1])
         expect('originWidgetNameB').assertEqual(formInfo.metaData.customizeData[0].name)
         expect('valueB').assertEqual(formInfo.metaData.customizeData[0].value)
      }
  });

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_1400 callback`;
    const promiseName = `FMS_getFormsInfo_1400 promise`;
    const bundleName = ``;
    const moduleName = `form_module_c`;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1400
     * @tc.desc: Query specific form configuration information by empty bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, moduleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1400
     * @tc.desc: Query specific form configuration information by empty bundle name and correct module name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName, moduleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      }
    });
  });

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_1500 callback`;
    const promiseName = `FMS_getFormsInfo_1500 promise`;
    const bundleName = `wrong.bundle.name`;
    const moduleName = `form_module_c`;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1500
     * @tc.desc: Query specific form configuration information by wrong bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, moduleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
          expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1500
     * @tc.desc: Query specific form configuration information by wrong bundle name and correct module name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName, moduleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
        expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      }
    });
  });

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_1600 callback`;
    const promiseName = `FMS_getFormsInfo_1600 promise`;
    const bundleName = `com.ohos.st.formsystemproviderc`;
    const moduleName = ``;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1600
     * @tc.desc: Query specific form configuration information by correct bundle name and empty module name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, moduleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1600
     * @tc.desc: Query specific form configuration information by correct bundle name and empty module name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName, moduleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      }
    });
  });

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_1700 callback`;
    const promiseName = `FMS_getFormsInfo_1700 promise`;
    const bundleName = `com.ohos.st.formsystemproviderc`;
    const moduleName = `wrong.module.name`;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1700
     * @tc.desc: Query specific form configuration information by correct bundle name and wrong module name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, moduleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(JSON.stringify(data)).assertEqual(`[]`);
          expect(error.code).assertEqual(ERR_OK_CODE);
          expect(error.message).assertEqual(ERR_OK);
          done();
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1700
     * @tc.desc: Query specific form configuration information by correct bundle name and wrong module name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName, moduleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        expect(JSON.stringify(data)).assertEqual(`[]`);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      }
    });
  });

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_1800 callback`;
    const promiseName = `FMS_getFormsInfo_1800 promise`;
    const bundleName = `com.ohos.st.formsystemproviderc`;
    const moduleName = `form_module_c`;
    var tempDataC = undefined;

    const expectDataC = {
      bundleName: 'com.ohos.st.formsystemproviderc',
      moduleName: 'form_module_c',
      abilityName: 'com.ohos.st.formsystemproviderc.MainAbility',
      name: 'FormC_Js001',
      description: 'form_description_FormC_Js001',
      descriptionId: 30,
      type: 1,
      jsComponentName: 'card_c',
      colorMode: 1,
      isDefault: 1,
      updateEnabled: 1,
      isStatic:true,
      window:{"autoDesignWidth":false,"designWidth":720},
      formVisibleNotify: 1,
      formConfigAbility: 'abilityc',
      updateDuration: 4,
      scheduledUpdateTime: '15:30',
      defaultDimension: 3,
      supportDimensions: [3, 4],
      metaData: { customizeData: [{ name: 'originWidgetNameC', value: 'valueC' }] },
    };

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1800
     * @tc.desc: Query specific form configuration information by correct bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName, moduleName, (error, data) => {
          console.log(`${callbackName} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          console.log(`${callbackName} forms amount: ${data.length}`);

          const dataC = data.filter((form) => {
            return `com.ohos.st.formsystemproviderc` === form.bundleName;
          });
          console.log(`${callbackName} form dataC: ${JSON.stringify(dataC)}`);
          console.log(`${callbackName} formC amount: ${dataC.length}`);
          tempDataC = dataC[0];
          expect(data.length).assertEqual(1);
          expect(dataC.length).assertEqual(1);
          //expect(JSON.stringify(dataC[0])).assertEqual(JSON.stringify(expectDataC));
          expect(error.code).assertEqual(ERR_OK_CODE);
          expect(error.message).assertEqual(ERR_OK);
          console.log(`==========${callbackName} ${describeName} end==========`);
        });
        await sleep(2000)
        checkDataC(tempDataC)
        tempDataC = undefined;
        done();
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1800
     * @tc.desc: Query specific form configuration information by correct bundle name and correct module name (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName, moduleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} forms amount: ${data.length}`);

        const dataC = data.filter((form) => {
          return `com.ohos.st.formsystemproviderc` === form.bundleName;
        });
        console.log(`${promiseName} form dataC: ${JSON.stringify(dataC)}`);
        console.log(`${promiseName} formC amount: ${dataC.length}`);

        expect(data.length).assertEqual(1);
        expect(dataC.length).assertEqual(1);
        //expect(JSON.stringify(dataC[0])).assertEqual(JSON.stringify(expectDataC));
        tempDataC = dataC[0];
        console.log(`==========${promiseName} ${describeName} end==========`);
        checkDataC(tempDataC)
        done()
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      }
    });
    
      function checkDataC(formInfo){
         expect("com.ohos.st.formsystemproviderc").assertEqual(formInfo.bundleName)
         expect("form_module_c").assertEqual(formInfo.moduleName)
         expect("com.ohos.st.formsystemproviderc.MainAbility").assertEqual(formInfo.abilityName)
         expect("FormC_Js001").assertEqual(formInfo.name)
         expect("form_description_FormC_Js001").assertEqual(formInfo.description)
         expect(FormInfo.FormType.JS).assertEqual(formInfo.type)
         expect('card_c').assertEqual(formInfo.jsComponentName)
         expect(FormInfo.ColorMode.MODE_LIGHT).assertEqual(formInfo.colorMode)
         expect(1).assertEqual(formInfo.isDefault)
         expect(1).assertEqual(formInfo.updateEnabled)
         expect(1).assertEqual(formInfo.formVisibleNotify)
         expect(undefined).assertEqual(formInfo.relatedBundleName)
         expect("abilityc").assertEqual(formInfo.formConfigAbility)
         expect(4).assertEqual(formInfo.updateDuration)
         expect(3).assertEqual(formInfo.defaultDimension)
         expect(3).assertEqual(formInfo.supportDimensions[0])
         expect(4).assertEqual(formInfo.supportDimensions[1])
         expect('originWidgetNameC').assertEqual(formInfo.metaData.customizeData[0].name)
         expect('valueC').assertEqual(formInfo.metaData.customizeData[0].value)
      }
  });
};
