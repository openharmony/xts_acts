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
import { describe, expect, it } from '@ohos/hypium'
import FormInfo from '@ohos.application.formInfo';

function sleep(time: number): Promise<void> {
  return new Promise((resolve)=>setTimeout(resolve,time));
}

export const getFormsInfoTest = (describeName: string, filterParameter: number) => {
  const ERR_OK_CODE = 0;
  const ERR_OK = `success`;
  const ERR_GET_BUNDLE_FAILED_CODE = 5;
  const ERR_GET_BUNDLE_FAILED = `failed to obtain the bundle information`;
  const ERR_ADD_INVALID_PARAM_CODE = 7;
  const ERR_ADD_INVALID_PARAM = `invalid input parameter during form operation`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_Callback_0900`;
    const promiseName = `FMS_getFormsInfo_Promise_0900`;
    const bundleName = ``;
    const callbackName1 = `FMS_getFormsInfo_Callback_1000 `;
    const bundleName1 = `wrong.bundle.name`;
    const callbackName2 = `FMS_getFormsInfo_Callback_1100`;
    const bundleName2 = `com.ohos.st.formsystemproviderb`;
    const callbackName3 = `FMS_getFormsInfo_Callback_1400`;
    const promiseName3 = `FMS_getFormsInfo_Promise_1400`;
    const bundleName3 = ``;
    const moduleName = `form_module_c`;
    const callbackName4 = `FMS_getFormsInfo_Callback_1500`;
    const promiseName4 = `FMS_getFormsInfo_Promise_1500`;
    const bundleName4 = `wrong.bundle.name`;
    const moduleName1 = `form_module_c`;
    const callbackName5 = `FMS_getFormsInfo_Callback_1600`;
    const promiseName5 = `FMS_getFormsInfo_promise_1600`;
    const bundleName5 = `com.ohos.st.formsystemproviderc`;
    const moduleName2 = ``;
    const callbackName6 = `FMS_getFormsInfo_Callback_1700`;
    const bundleName6 = `com.ohos.st.formsystemproviderc`;
    const moduleName3 = `wrong.module.name`;
    const callbackName7 = `FMS_getFormsInfo_Callback_1800`;
    const bundleName7 = `com.ohos.st.formsystemproviderc`;
    const moduleName4 = `form_module_c`;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_0900
     * @tc.desc: Query specific form configuration information by empty bundle name (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done: () => void) => {
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
    it(`${promiseName}`, filterParameter, async (done: () => void) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName);
        console.log(`${promiseName} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} should not reach here`);
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1000
     * @tc.desc: Query specific form configuration information by wrong bundle name (by AsyncCallback)
     */
    it(`${callbackName1}`, filterParameter, async (done: () => void) => {
      console.log(`==========${callbackName1} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName1, (error, data) => {
          console.log(`${callbackName1} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
          expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
          done();
          console.log(`==========${callbackName1} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName1} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName1} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1100
     * @tc.desc: Query specific form configuration information by correct bundle name (by AsyncCallback)
     */
    it(`${callbackName2}`, filterParameter, async (done: () => void) => {
      console.log(`==========${callbackName2} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName2, (error, data) => {
          console.log(`${callbackName2} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          if(!data) {
            console.log(`${callbackName2} getFormsInfo data is: ${JSON.stringify(data)}`);
            return;
          }

          const dataB = data.filter((form) => {
            return `com.ohos.st.formsystemproviderb` === form.bundleName;
          });
          console.log(`${callbackName2} form dataB: ${JSON.stringify(dataB)}`);
          console.log(`${callbackName2} formB amount: ${dataB.length}`);

          expect(data.length).assertEqual(1);
          expect(dataB.length).assertEqual(1);
          expect(error.code).assertEqual(ERR_OK_CODE);
          console.log(`==========${callbackName2} ${describeName} end==========`);
        });
        await sleep(2000)
        done()
      } catch (error) {
        console.log(`${callbackName2} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName2} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1400
     * @tc.desc: Query specific form configuration information by empty bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName3}`, filterParameter, async (done: () => void) => {
      console.log(`==========${callbackName3} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName3, moduleName, (error, data) => {
          console.log(`${callbackName3} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
          console.log(`==========${callbackName3} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName3} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName3} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1400
     * @tc.desc: Query specific form configuration information by empty bundle name and correct module name (by Promise)
     */
    it(`${promiseName3}`, filterParameter, async (done: () => void) => {
      console.log(`==========${promiseName3} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName3, moduleName);
        console.log(`${promiseName3} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName3} should not reach here`);
      } catch (error) {
        console.log(`${promiseName3} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        done();
        console.log(`==========${promiseName3} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1500
     * @tc.desc: Query specific form configuration information by wrong bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName4}`, filterParameter, async (done: () => void) => {
      console.log(`==========${callbackName4} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName4, moduleName1, (error, data) => {
          console.log(`${callbackName4} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
          expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
          done();
          console.log(`==========${callbackName4} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName4} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName4} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1500
     * @tc.desc: Query specific form configuration information by wrong bundle name and correct module name (by Promise)
     */
    it(`${promiseName4}`, filterParameter, async (done: () => void) => {
      console.log(`==========${promiseName4} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName4, moduleName1);
        console.log(`${promiseName4} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName4} should not reach here`);
      } catch (error) {
        console.log(`${promiseName4} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_GET_BUNDLE_FAILED_CODE);
        // expect(error.message).assertEqual(ERR_GET_BUNDLE_FAILED);
        done();
        console.log(`==========${promiseName4} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1600
     * @tc.desc: Query specific form configuration information by correct bundle name and empty module name (by AsyncCallback)
     */
    it(`${callbackName5}`, filterParameter, async (done: () => void) => {
      console.log(`==========${callbackName5} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName5, moduleName2, (error, data) => {
          console.log(`${callbackName5} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
          expect(error.message).assertEqual(ERR_ADD_INVALID_PARAM);
          done();
          console.log(`==========${callbackName5} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName5} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName5} should not reach here`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_1600
     * @tc.desc: Query specific form configuration information by correct bundle name and empty module name (by Promise)
     */
    it(`${promiseName5}`, filterParameter, async (done: () => void) => {
      console.log(`==========${promiseName5} ${describeName} start==========`);

      try {
        const data = await formHost.getFormsInfo(bundleName5, moduleName2);
        console.log(`${promiseName5} getFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName5} should not reach here`);
      } catch (error) {
        console.log(`${promiseName5} exception caught: ${JSON.stringify(error)})`);
        expect(error.code).assertEqual(ERR_ADD_INVALID_PARAM_CODE);
        done();
        console.log(`==========${promiseName5} ${describeName} end==========`);
      }
    });

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1700
     * @tc.desc: Query specific form configuration information by correct bundle name and wrong module name (by AsyncCallback)
     */
    it(`${callbackName6}`, filterParameter, async (done: () => void) => {
      console.log(`==========${callbackName6} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName6, moduleName3, (error, data) => {
          console.log(`${callbackName6} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);

          if(!data) {
            expect(data).assertUndefined();
            console.log(`==========${callbackName6} ${describeName} data is:${JSON.stringify(data)} end==========`);
            done();
            return;
          }

          expect(JSON.stringify(data)).assertEqual(`[]`);
          expect(error.code).assertEqual(ERR_OK_CODE);
          done();
          console.log(`==========${callbackName6} ${describeName} end==========`);
        });
      } catch (error) {
        console.log(`${callbackName6} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName6} should not reach here`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_1800
     * @tc.desc: Query specific form configuration information by correct bundle name and correct module name (by AsyncCallback)
     */
    it(`${callbackName7}`, filterParameter, async (done: () => void) => {
      console.log(`==========${callbackName7} ${describeName} start==========`);

      try {
        formHost.getFormsInfo(bundleName7, moduleName4, (error, data) => {
          console.log(`${callbackName7} getFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          if(!data) {
            expect(data).assertUndefined();
            done();
            console.log(`==========${callbackName7} ${describeName} data is: ${JSON.stringify(data)} end==========`);
            return;
          }
          console.log(`${callbackName7} forms amount: ${data.length}`);
          const dataC = data.filter((form) => {
            return `com.ohos.st.formsystemproviderc` === form.bundleName;
          });
          console.log(`${callbackName7} form dataC: ${JSON.stringify(dataC)}`);
          console.log(`${callbackName7} formC amount: ${dataC.length}`);

          expect(data.length).assertEqual(1);
          expect(dataC.length).assertEqual(1);
          expect(error.code).assertEqual(ERR_OK_CODE);
          console.log(`==========${callbackName7} ${describeName} end==========`);
        });
        await sleep(2000);
        done();
      } catch (error) {
        console.log(`${callbackName7} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName7} should not reach here`);
        expect().assertFail();
      }
    });
  });
};