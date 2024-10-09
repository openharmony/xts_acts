/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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


import { describe, it, beforeAll } from '@ohos/hypium';
import { stringToUint8Array } from '../../../../../../../utils/param/publicFunc';
import { HuksAgreeDH } from '../../../../../../../utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from '../../../../../../../utils/param/agree/publicAgreePromise';
import { HksTag } from '../../../../../../../utils/param/publicParam';



let HuksOptions63kb = {
  properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize2048),
};

export default function SecurityHuksAgreeDHBasicAbort63KBPromiseJsunit() {
  describe('SecurityHuksAgreeDHBasicAbort63KBPromiseJsunit', function () {
    beforeAll(async function (done) {
      done();
    })
    it('Security_HUKS_Agree_API8_DH_102', 0, async function (done) {
      const srcKeyAliesFirst = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_101';
      const srcKeyAliesSecond = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_101';
      let huksOptionsFinish = {
        properties: new Array(
          HuksAgreeDH.HuksKeySTORAGE,
          HuksAgreeDH.HuksKeyISKEYALIAS,
          HuksAgreeDH.HuksKeyALGORITHMAES,
          HuksAgreeDH.HuksKeySIZE256,
          HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
          HuksAgreeDH.HuksKeyDIGESTNONE,
          {
            tag: HksTag.HKS_TAG_KEY_ALIAS,
            value: stringToUint8Array(srcKeyAliesFirst),
          },
          HuksAgreeDH.HuksKeyPADDINGNONE,
          HuksAgreeDH.HuksKeyBLOCKMODEECB
        ),
      };
      await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'abort');
      done();
    });
  });
}
