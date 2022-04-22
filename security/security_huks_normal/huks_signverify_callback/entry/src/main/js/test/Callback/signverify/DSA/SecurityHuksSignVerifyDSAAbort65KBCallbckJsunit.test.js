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

let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);

let srcData65B = Data.data65B;
let srcData65Byte = stringToUint8Array(srcData65B);

describe('SecurityHuksSignVerifyDSACallbackJsunit', function () {
  it('testSignVerifyDSASIGNSHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias004';
    const NewSrcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAliasNew104';
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
      NewSrcKeyAlies,
      HuksOptions,
      'abort',
      true,
      true
    );
    done();
  });

  it('testSignVerifyDSASIGNSHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA224KeyAlias004';
    const NewSrcKeyAlies = 'testSignVerifyDSASIGNSHA224KeyAliasNew104';
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
      NewSrcKeyAlies,
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyDSASIGNSHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA256KeyAlias004';
    const NewSrcKeyAlies = 'testSignVerifyDSASIGNSHA256KeyAliasNew104';
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
      NewSrcKeyAlies,
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyDSASIGNSHA384104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA384KeyAlias004';
    const NewSrcKeyAlies = 'testSignVerifyDSASIGNSHA384KeyAliasNew104';
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
      NewSrcKeyAlies,
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyDSASIGNSHA512104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyDSASIGNSHA512KeyAlias004';
    const NewSrcKeyAlies = 'testSignVerifyDSASIGNSHA512KeyAliasNew104';
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
      NewSrcKeyAlies,
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });
});
