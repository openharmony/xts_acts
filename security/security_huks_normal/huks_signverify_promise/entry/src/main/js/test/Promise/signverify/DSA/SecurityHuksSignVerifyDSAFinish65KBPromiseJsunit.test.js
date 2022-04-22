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

import { describe, it } from 'deccjsunit/index';
import Data from '../../../../../../../../../utils/data.json';
import { HuksSignVerifyDSA } from '../../../../../../../../../utils/param/signverify/publicSignverifyParam.js';
import { publicSignVerifyFunc } from '../../../../../../../../../utils/param/signverify/publicSignverifyPromise.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';

let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);

let srcData65B = Data.data65B;
let srcData65Byte = stringToUint8Array(srcData65B);

describe('SecurityHuksSignVerifyDSAPromiseJsunit', function () {
  it('testSignVerifyDSASIGNSHA1103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias103';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAliasNew103';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA1
      ),
      inData: srcData65Kb,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      true,
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
        HuksSignVerifyDSA.HuksTagDSADigestSHA1,
        HuksSignVerifyDSA.HuksKeySIZE1024
      ),
      inData: srcData65Kb,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      false,
      true
    );
    done();
  });

  it('testSignVerifyDSASIGNSHA224103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA224KeyAlias103';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA224KeyAliasNew103';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
        HuksSignVerifyDSA.HuksTagDSADigestSHA224,
        HuksSignVerifyDSA.HuksKeySIZE1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyDSASIGNSHA256103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA256KeyAlias103';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA256KeyAliasNew103';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
        HuksSignVerifyDSA.HuksTagDSADigestSHA256,
        HuksSignVerifyDSA.HuksKeySIZE1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyDSASIGNSHA384103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA384KeyAlias103';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA384KeyAliasNew103';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
        HuksSignVerifyDSA.HuksTagDSADigestSHA384,
        HuksSignVerifyDSA.HuksKeySIZE1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyDSASIGNSHA512103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA512KeyAlias103';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA512KeyAliasNew103';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
        HuksSignVerifyDSA.HuksTagDSADigestSHA512,
        HuksSignVerifyDSA.HuksKeySIZE1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });
});
