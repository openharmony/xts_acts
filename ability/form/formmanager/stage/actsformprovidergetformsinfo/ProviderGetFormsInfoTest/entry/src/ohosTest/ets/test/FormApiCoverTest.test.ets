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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import FormInfo from '@ohos.application.formInfo';
import formInfoNew from '@ohos.app.form.formInfo';
import formError from '@ohos.application.formError';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

const INTERVAL_TIME = 2500;

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

export default function FormApiCoverTest() {
  describe('FormApiCoverTestTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, INTERVAL_TIME);
    })

    /*
     * @tc.number  SUB_AA_Form_provider_TestFormErr_0100
     * @tc.name    Get all FormError types.
     * @tc.desc    Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_Form_provider_TestFormErr_0100', 0, async (done: Function) => {
      console.info("SUB_AA_Form_provider_TestFormErr_0100");
      expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM);
      expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED);
      expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID);
      expect(1).assertEqual(formError.FormError.ERR_COMMON);
      expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED);
      expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED);
      expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY);
      expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION);
      expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE);
      expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED);
      expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED);
      expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED);
      expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY);
      expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT);
      expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM);
      expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS);
      expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS);
      expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID);
      expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF);
      expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY);
      expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL);
      expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED);
      done();
    })
  })
}