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
export const getAllFormsInfoTest = (describeName: string, filterParameter: number) => {
  const ERR_OK_CODE = 0;
  const ERR_OK = `success`;

  describe(`${describeName}`, () => {
    const callbackName = `FMS_getFormsInfo_0400_callback`;
    const promiseName = `FMS_getFormsInfo_0400_promise`;

    /**
     * @tc.name: getFormsInfo
     * @tc.number: FMS_getFormsInfo_0400
     * @tc.desc: Query all form configuration information (by AsyncCallback)
     */
    it(`${callbackName}`, filterParameter, async (done: () => void) => {
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
          if(dataB.length !== 0) {
            expect(dataB.length).assertEqual(1);
          }

          const dataD = data.filter((form) => {
            return `com.ohos.st.formsystemproviderd` === form.bundleName;
          });
          console.log(`${callbackName} form dataD: ${JSON.stringify(dataD)}`);
          console.log(`${callbackName} formD amount: ${dataD.length}`);
          if(dataD.length !== 0) {
            expect(dataD.length).assertEqual(0);
          }

          console.log(`==========${callbackName} ${describeName} end==========`);
        });
        await sleep(2000)
        expect().not().assertFail();
        done()
      } catch (error) {
        console.log(`${callbackName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${callbackName} should not reach here`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name getFormsInfo
     * @tc.number FMS_getFormsInfo_0400
     * @tc.desc: Query all form configuration information (by Promise)
     */
    it(`${promiseName}`, filterParameter, async (done: () => void) => {
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

        if(dataB.length !== 0) {
          expect(dataB.length).assertEqual(1);
        }

        const dataD = data.filter((form) => {
          return `com.ohos.st.formsystemproviderd` === form.bundleName;
        });
        console.log(`${promiseName} form dataD: ${JSON.stringify(dataD)}`);
        console.log(`${promiseName} formD amount: ${dataD.length}`);
        if(dataD.length == 0) {
          expect(dataD.length).assertEqual(0);
          expect(JSON.stringify(dataD)).assertEqual(`[]`);
        }

        expect().not().assertFail();
        done();
        console.log(`==========${promiseName} ${describeName} end==========`);
      } catch (error) {
        console.log(`${promiseName} exception caught: ${JSON.stringify(error)})`);
        console.log(`${promiseName} should not reach here`);
        expect().assertFail();
        done()
      }
    });
  });
};
