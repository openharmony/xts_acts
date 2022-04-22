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
import { publicSignVerifyFunc } from '../../../../../../../../../utils/param/signverify/publicSignverifyCallback.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let srcData63B = Data.data63B;
let srcData63Byte = stringToUint8Array(srcData63B);

describe('SecurityHuksSignVerifyDSACallbackJsunit', function () {
  it('testSignVerifyDSASIGNSHA1101', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias001';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAliasNew101';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA1
      ),
      inData: srcData63Kb,
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
        HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
      ),
      inData: srcData63Kb,
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

  it('testSignVerifyDSASIGNSHA224101', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA224KeyAlias001';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA224KeyAliasNew101';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA224
      ),
      inData: srcData63Byte,
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
        HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
      ),
      inData: srcData63Byte,
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

  it('testSignVerifyDSASIGNSHA256101', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA256KeyAlias001';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA256KeyAliasNew101';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA256
      ),
      inData: srcData63Byte,
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
        HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
      ),
      inData: srcData63Byte,
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

  it('testSignVerifyDSASIGNSHA384101', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA384KeyAlias001';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA384KeyAliasNew101';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA384
      ),
      inData: srcData63Byte,
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
        HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
      ),
      inData: srcData63Byte,
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

  it('testSignVerifyDSASIGNSHA512101', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA512KeyAlias001';
    const newSrcKeyAlies = 'testSignVerifyDSASIGNSHA512KeyAliasNew101';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA512
      ),
      inData: srcData63Byte,
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
        HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
      ),
      inData: srcData63Byte,
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
