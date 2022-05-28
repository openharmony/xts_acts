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
import { describe, expect, it } from 'deccjsunit/index.ets';

export const getAllFormsInfoTest = (describeName, filterParameter) => {
  const ERR_OK_CODE = 0;
  const ERR_OK = `success`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_0500 callback`;
    const promiseName = `FMS_getFormsInfo_0500 promise`;

    const expectDataB = {
      bundleName: 'com.ohos.st.formsystemproviderb',
      moduleName: 'form_module_b',
      abilityName: 'com.ohos.st.formsystemproviderb.MainAbility',
      name: 'FormB_Js001',
      description: 'form_description_FormB_Js001',
      descriptionId: 20,
      type: 1,
      jsComponentName: 'card_b',
      colorMode: -1,
      isDefault: 1,
      updateEnabled: 1,
      formVisibleNotify: 1,
      formConfigAbility: 'abilityb',
      updateDuration: 3,
      scheduledUpdateTime: '10:30',
      defaultDimension: 2,
      supportDimensions: [1, 2],
      metaData: { customizeData: [{ name: 'originWidgetNameB', value: 'valueB' }] },
    };

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
     * @tc.number: FMS_getFormsInfo_0500
     * @tc.desc: Query all form configuration information (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getAllFormsInfo((error, data) => {
          console.log(`${callbackName} getAllFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          console.log(`${callbackName} forms amount: ${data.length}`);

          const dataB = data.filter((form) => {
            return `com.ohos.st.formsystemproviderb` === form.bundleName;
          });
          console.log(`${callbackName} form dataB: ${JSON.stringify(dataB)}`);
          console.log(`${callbackName} formB amount: ${dataB.length}`);
          const dataC = data.filter((form) => {
            return `com.ohos.st.formsystemproviderc` === form.bundleName;
          });
          console.log(`${callbackName} form dataC: ${JSON.stringify(dataC)}`);
          console.log(`${callbackName} formC amount: ${dataC.length}`);

          expect(dataB.length).assertEqual(1);
          expect(dataC.length).assertEqual(1);
          expect(JSON.stringify(dataB[0])).assertEqual(JSON.stringify(expectDataB));
          expect(JSON.stringify(dataC[0])).assertEqual(JSON.stringify(expectDataC));
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
     * @tc.number FMS_getFormsInfo_0500
     * @tc.desc: Query all form configuration information (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getAllFormsInfo();
        console.log(`${promiseName} getAllFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} forms amount: ${data.length}`);

        const dataB = data.filter((form) => {
          return `com.ohos.st.formsystemproviderb` === form.bundleName;
        });
        console.log(`${promiseName} form dataB: ${JSON.stringify(dataB)}`);
        console.log(`${promiseName} formB amount: ${dataB.length}`);
        const dataC = data.filter((form) => {
          return `com.ohos.st.formsystemproviderc` === form.bundleName;
        });
        console.log(`${promiseName} form dataC: ${JSON.stringify(dataC)}`);
        console.log(`${promiseName} formC amount: ${dataC.length}`);

        expect(dataB.length).assertEqual(1);
        expect(dataC.length).assertEqual(1);
        expect(JSON.stringify(dataB[0])).assertEqual(JSON.stringify(expectDataB));
        expect(JSON.stringify(dataC[0])).assertEqual(JSON.stringify(expectDataC));
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
      }
    });
  });
};
