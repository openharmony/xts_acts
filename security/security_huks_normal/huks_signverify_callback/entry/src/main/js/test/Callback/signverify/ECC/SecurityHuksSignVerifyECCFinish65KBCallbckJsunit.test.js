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
import { HuksSignVerifyECC } from '../../../../../../../../../utils/param/signverify/publicSignverifyParam.js';
import { publicSignVerifyFunc } from '../../../../../../../../../utils/param/signverify/publicSignverifyCallback.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';

let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);

let srcData65B = Data.data65B;
let srcData65Byte = stringToUint8Array(srcData65B);

describe('SecurityHuksSignVerifyECCCallbackJsunit', function () {
  it('testSignVerifyECCSize224SIGNNONE103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Kb,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Kb,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      true
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNNONE103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNNONE103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNNONE103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA1103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA1103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA1103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA1103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA224103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA224103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA224103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA224103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA256103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA256103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA256103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA256103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA384103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA384103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA384103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA384103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA512103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA512103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA512103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA512103', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      true,
      false
    );

    HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'finish',
      false,
      false
    );
    done();
  });
});
