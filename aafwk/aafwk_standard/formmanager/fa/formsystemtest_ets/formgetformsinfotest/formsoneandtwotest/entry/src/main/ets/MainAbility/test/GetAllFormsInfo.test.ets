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
    const callbackName = `FMS_getFormsInfo_0600 callback`;
    const promiseName = `FMS_getFormsInfo_0600 promise`;

    const expectDataA01 = {
      bundleName: 'com.ohos.st.formsystemprovidera',
      moduleName: 'form_module_a',
      abilityName: 'com.ohos.st.formsystemprovidera.MainAbility',
      name: 'FormA_Js001',
      description: 'form_description_FormA_Js001',
      descriptionId: 0,
      type: 1,
      jsComponentName: 'card_a01',
      colorMode: 0,
      isDefault: 1,
      updateEnabled: 1,
      formVisibleNotify: 1,
      formConfigAbility: 'abilitya01',
      updateDuration: 1,
      scheduledUpdateTime: '5:30',
      defaultDimension: 1,
      supportDimensions: [1, 3],
      metaData: { customizeData: [{ name: 'originWidgetNameA01', value: 'valueA01' }] },
    };

    const expectDataA02 = {
      bundleName: 'com.ohos.st.formsystemprovidera',
      moduleName: 'form_module_a',
      abilityName: 'com.ohos.st.formsystemprovidera.MainAbility',
      name: 'FormA_Js002',
      description: 'form_description_FormA_Js002',
      descriptionId: 10,
      type: 1,
      jsComponentName: 'card_a02',
      colorMode: 1,
      isDefault: 0,
      updateEnabled: 0,
      formVisibleNotify: 0,
      formConfigAbility: 'abilitya02',
      updateDuration: 2,
      scheduledUpdateTime: '20:30',
      defaultDimension: 4,
      supportDimensions: [1, 2, 3, 4],
      metaData: { customizeData: [{ name: 'originWidgetNameA02', value: 'valueA02' }] },
    };

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

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_0600
     * @tc.desc: Query all form configuration information (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done) => {
      console.log(`==========${callbackName} ${describeName} start==========`);

      try {
        formHost.getAllFormsInfo((error, data) => {
          console.log(`${callbackName} getAllFormsInfo data: ${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
          console.log(`${callbackName} forms amount: ${data.length}`);

          const dataA = data.filter((form) => {
            return `com.ohos.st.formsystemprovidera` === form.bundleName;
          });
          console.log(`${callbackName} form dataA: ${JSON.stringify(dataA)}`);
          console.log(`${callbackName} formA amount: ${dataA.length}`);
          const dataB = data.filter((form) => {
            return `com.ohos.st.formsystemproviderb` === form.bundleName;
          });
          console.log(`${callbackName} form dataB: ${JSON.stringify(dataB)}`);
          console.log(`${callbackName} formB amount: ${dataB.length}`);

          expect(dataA.length).assertEqual(2);
          expect(dataB.length).assertEqual(1);
          expect(JSON.stringify(dataA[0])).assertEqual(JSON.stringify(expectDataA01));
          expect(JSON.stringify(dataA[1])).assertEqual(JSON.stringify(expectDataA02));
          expect(JSON.stringify(dataB[0])).assertEqual(JSON.stringify(expectDataB));
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
     * @tc.number FMS_getFormsInfo_0600
     * @tc.desc: Query all form configuration information (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done) => {
      console.log(`==========${promiseName} ${describeName} start==========`);

      try {
        const data = await formHost.getAllFormsInfo();
        console.log(`${promiseName} getAllFormsInfo data: ${JSON.stringify(data)}`);
        console.log(`${promiseName} forms amount: ${data.length}`);

        const dataA = data.filter((form) => {
          return `com.ohos.st.formsystemprovidera` === form.bundleName;
        });
        console.log(`${promiseName} form dataA: ${JSON.stringify(dataA)}`);
        console.log(`${promiseName} formA amount: ${dataA.length}`);
        const dataB = data.filter((form) => {
          return `com.ohos.st.formsystemproviderb` === form.bundleName;
        });
        console.log(`${promiseName} form dataB: ${JSON.stringify(dataB)}`);
        console.log(`${promiseName} formB amount: ${dataB.length}`);

        expect(dataA.length).assertEqual(2);
        expect(dataB.length).assertEqual(1);
        expect(JSON.stringify(dataA[0])).assertEqual(JSON.stringify(expectDataA01));
        expect(JSON.stringify(dataA[1])).assertEqual(JSON.stringify(expectDataA02));
        expect(JSON.stringify(dataB[0])).assertEqual(JSON.stringify(expectDataB));
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
