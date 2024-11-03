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
import { describe, it } from '@ohos/hypium';
import Data from './utils/data.json';
import { HuksSignVerifyRSA } from './utils/param/signverify/publicSignverifyParam.js';
import { stringToUint8Array } from './utils/param/publicFunc.js';
import { publicSignVerifyFunc } from './utils/param/signverify/publicSignverifyPromise.js';

let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;

export default function SecurityHuksSignVerifyRSACallbackJsunit() {
  describe('SecurityHuksSignVerifyRSACallbackJsunit', function () {
    it('Security_HUKS_SignVerify_API8_RSA_001', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias001';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: srcData63Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData63Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData63Kb);
      done();
    });

    it('Security_HUKS_SignVerify_API8_RSA_002', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: srcData63Kb,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63Kb);
      done();
    });

    it('Security_HUKS_SignVerify_API8_RSA_003', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias003';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: srcData65Kb,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      done();
    });

    it('Security_HUKS_SignVerify_API8_RSA_004', 0, async function (done) {
      const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: srcData65Kb,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData65Kb);
      done();
    });
  });
}
