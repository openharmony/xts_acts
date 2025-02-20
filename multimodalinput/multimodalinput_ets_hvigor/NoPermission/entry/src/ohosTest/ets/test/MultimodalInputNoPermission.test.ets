/*
 * Copyright (C) 2024 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium';
import { inputDevice } from '@kit.InputKit';
import { BusinessError }  from '@ohos.base';

export default function MultimodalInputNoPermissionTest() {
  describe("MultimodalInputNoPermissionTest", ()=> {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0500
     * @tc.name: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0500
     * @tc.desc: Test promise setFunctionKeyEnabled interface to set non-permission.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0500", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0500";
      try {
        let CAPS_LOCK = 1;
        await inputDevice.setFunctionKeyEnabled(CAPS_LOCK, true).then(() => {
          console.info(`${caseName} Set capslock state success`);
          ExpectFalse(true);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
          ExpectTrue(error.code == 201);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Failed to set capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}