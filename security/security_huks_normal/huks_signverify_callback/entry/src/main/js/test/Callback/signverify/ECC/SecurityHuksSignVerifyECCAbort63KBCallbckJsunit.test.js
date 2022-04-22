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

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let srcData63B = Data.data63B;
let srcData63Byte = stringToUint8Array(srcData63B);

describe('SecurityHuksSignVerifyECCCallbackJsunit', function () {
  it('testSignVerifyECCSize224SIGNNONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNNONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData63Kb,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      true
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNNONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNNONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNNONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );

    done();
  });

  it('testSignVerifyECCSize224SIGNSHA1002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA1002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA1002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA1002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA1,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA224002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNSHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA224002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA224002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA224002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNSHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA224,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA256002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNSHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA256002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA256002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA256002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNSHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA256,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA384002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNSHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA384002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA384002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA384002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNSHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA384,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize224SIGNSHA512002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize224SIGNSHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize224
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize256SIGNSHA512002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize384SIGNSHA512002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize384
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });

  it('testSignVerifyECCSize521SIGNSHA512002', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize521SIGNSHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestSHA512,
        HuksSignVerifyECC.HuksKeyECCSize521
      ),
      inData: srcData63Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    done();
  });
});
