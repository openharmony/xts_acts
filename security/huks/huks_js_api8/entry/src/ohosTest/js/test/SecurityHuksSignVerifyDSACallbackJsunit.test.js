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
import { describe, it, TestType, Size, Level } from '@ohos/hypium';
import Data from './utils/data.json';
import { HuksSignVerifyDSA } from './utils/param/signverify/publicSignverifyParam.js';
import { stringToUint8Array, checkSoftware } from './utils/param/publicFunc.js';
import { publicSignVerifyFunc } from './utils/param/signverify/publicSignverifyPromise.js';
let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
export default function SecurityHuksSignVerifyDSACallbackJsunit() {
  describe('SecurityHuksSignVerifyDSACallbackJsunit', function () {
    it('Security_HUKS_SignVerify_API8_DSA_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias001';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1
        ),
        inData: srcData63Kb,
      };
      let useSoftware = await checkSoftware();
      if (useSoftware) {
        finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData63Kb);
        HuksOptions = {
          properties: new Array(
            HuksSignVerifyDSA.HuksKeyAlgDSA,
            HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
            HuksSignVerifyDSA.HuksTagDSADigestSHA1,
            HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
          ),
          inData: finishOutData,
        };
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData63Kb);
      }
      done();
    });

    it('Security_HUKS_SignVerify_API8_DSA_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1
        ),
        inData: srcData63Kb,
      };
      let useSoftware = await checkSoftware();
      if (useSoftware) {
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63Kb);
      }
      done();
    });

    it('Security_HUKS_SignVerify_API8_DSA_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias003';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1
        ),
        inData: srcData65Kb,
      };
      let useSoftware = await checkSoftware();
      if (useSoftware) {
        finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
        HuksOptions = {
          properties: new Array(
            HuksSignVerifyDSA.HuksKeyAlgDSA,
            HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
            HuksSignVerifyDSA.HuksTagDSADigestSHA1,
            HuksSignVerifyDSA.HuksKeySIZE1024
          ),
          inData: finishOutData,
        };
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
      }
      done();
    });

    it('Security_HUKS_SignVerify_API8_DSA_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyDSA.HuksKeyAlgDSA,
          HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
          HuksSignVerifyDSA.HuksTagDSADigestSHA1
        ),
        inData: srcData65Kb,
      };
      let useSoftware = await checkSoftware();
      if (useSoftware) {
        await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData65Kb);
      }
      done();
    });
  });
}
