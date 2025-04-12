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
import { HuksSignVerifyECC } from './utils/param/signverify/publicSignverifyParam.js';
import { stringToUint8Array } from './utils/param/publicFunc.js';
import { publicSignVerifyFunc } from './utils/param/signverify/publicSignverifyPromise.js';
let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
let srcData63AfterSha256 = new Uint8Array([
  0xD2, 0xE1, 0x24, 0x8F, 0x0D, 0xBB, 0x2F, 0x98, 0x64, 0x13, 0x27, 0xE0, 0x0D, 0xEA, 0x34, 0xBB,
  0x1D, 0x1C, 0xC2, 0xA1, 0xBE, 0x10, 0xF0, 0xB1, 0x6F, 0x8E, 0xDF, 0x9B, 0x42, 0xBA, 0x38, 0x5D,
]);
const srcData65Sha256 = new Uint8Array([
  0x23, 0xF8, 0x94, 0xEA, 0xEE, 0x1C, 0x70, 0xA9, 0x33, 0x82, 0x6C, 0xCF, 0xEF, 0x2D, 0x41, 0x6F,
  0x64, 0xF6, 0x46, 0xD4, 0xCD, 0xD4, 0x5C, 0x33, 0x84, 0x4D, 0x53, 0x4A, 0x1D, 0xF0, 0xE7, 0xDF,
]);
export default function SecurityHuksSignVerifyECCCallbackJsunit() {
  describe('SecurityHuksSignVerifyECCCallbackJsunit', function () {
    it('Security_HUKS_SignVerify_API8_ECC_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias001';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData63AfterSha256,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData63AfterSha256);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData63AfterSha256);
      done();
    });

    it('Security_HUKS_SignVerify_API8_ECC_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData63AfterSha256,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63AfterSha256);
      done();
    });

    it('Security_HUKS_SignVerify_API8_ECC_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias003';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData65Sha256,
      };
      finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Sha256);
      HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: finishOutData,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Sha256);
      done();
    });

    it('Security_HUKS_SignVerify_API8_ECC_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyECC.HuksKeyAlgECC,
          HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
          HuksSignVerifyECC.HuksTagECCDigestNONE,
          HuksSignVerifyECC.HuksKeyECCSize256
        ),
        inData: srcData65Sha256,
      };
      await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData65Sha256);
      done();
    });
  });
}
