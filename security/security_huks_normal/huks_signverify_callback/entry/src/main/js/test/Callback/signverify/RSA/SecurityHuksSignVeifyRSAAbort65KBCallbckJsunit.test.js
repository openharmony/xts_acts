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
import { HuksSignVerifyRSA } from '../../../../../../../../../utils/param/signverify/publicSignverifyParam.js';
import { publicSignVerifyFunc } from '../../../../../../../../../utils/param/signverify/publicSignverifyCallback.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';

let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);

let srcData65B = Data.data65B;
let srcData65Byte = stringToUint8Array(srcData65B);

describe('SecurityHuksSignVerifyRSACallbackJsunit', function () {
  it('testSignVerifyRSASize512SIGNPKCS1MD5104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Kb,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      true
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1NONE104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1NONEKeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );

    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1SHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1SHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1SHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1SHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1SHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1SHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1PSSSHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1PSSSHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1PSSSHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1PSSSHA384104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA384KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize512
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1MD5104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1MD5KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1NONE104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1NONEKeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA384104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA384KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA512104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA512KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA384104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA384KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA512104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA512KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1MD5104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1MD5KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1NONE104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1NONEKeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA384104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA384KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA512104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA512KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1PSSSHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1PSSSHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize1024
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it(
    'testSignVerifyRSASize1024SIGNPKCS1PSSSHA224104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize1024SIGNPKCS1PSSSHA224KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize1024
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize1024SIGNPKCS1PSSSHA256104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize1024SIGNPKCS1PSSSHA256KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize1024
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize1024SIGNPKCS1PSSSHA384104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize1024SIGNPKCS1PSSSHA384KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize1024
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize1024SIGNPKCS1PSSSHA512104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize1024SIGNPKCS1PSSSHA512KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize1024
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it('testSignVerifyRSASize2048SIGNPKCS1MD5104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1MD5KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1NONE104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1NONEKeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA384104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA384KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA512104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA512KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1PSSSHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1PSSSHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize2048
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it(
    'testSignVerifyRSASize2048SIGNPKCS1PSSSHA224104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize2048SIGNPKCS1PSSSHA224KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize2048
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize2048SIGNPKCS1PSSSHA256104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize2048SIGNPKCS1PSSSHA256KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize2048
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize2048SIGNPKCS1PSSSHA384104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize2048SIGNPKCS1PSSSHA384KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize2048
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize2048SIGNPKCS1PSSSHA512104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize2048SIGNPKCS1PSSSHA512KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize2048
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it('testSignVerifyRSASize3072SIGNPKCS1MD5104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1MD5KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1NONE104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1NONEKeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA384104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA384KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA512104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA512KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1PSSSHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1PSSSHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize3072
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it(
    'testSignVerifyRSASize3072SIGNPKCS1PSSSHA224104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize3072SIGNPKCS1PSSSHA224KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize3072
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize3072SIGNPKCS1PSSSHA256104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize3072SIGNPKCS1PSSSHA256KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize3072
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize3072SIGNPKCS1PSSSHA384104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize3072SIGNPKCS1PSSSHA384KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize3072
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize3072SIGNPKCS1PSSSHA512104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize3072SIGNPKCS1PSSSHA512KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize3072
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it('testSignVerifyRSASize4096SIGNPKCS1MD5104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1MD5KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1NONE104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1NONEKeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA224104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA256104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA384104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA384KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA512104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1PSSSHA1104', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1PSSSHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Byte,
    };
    await publicSignVerifyFunc(
      srcKeyAlies,
      srcKeyAlies + 'New',
      HuksOptions,
      'abort',
      true,
      false
    );
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it(
    'testSignVerifyRSASize4096SIGNPKCS1PSSSHA224104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize4096SIGNPKCS1PSSSHA224KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize4096SIGNPKCS1PSSSHA256104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize4096SIGNPKCS1PSSSHA256KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize4096SIGNPKCS1PSSSHA384104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize4096SIGNPKCS1PSSSHA384KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize4096SIGNPKCS1PSSSHA512104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize4096SIGNPKCS1PSSSHA512KeyAlias004';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize4096
        ),
        inData: srcData65Byte,
      };
      await publicSignVerifyFunc(
        srcKeyAlies,
        srcKeyAlies + 'New',
        HuksOptions,
        'abort',
        true,
        false
      );
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );
});
