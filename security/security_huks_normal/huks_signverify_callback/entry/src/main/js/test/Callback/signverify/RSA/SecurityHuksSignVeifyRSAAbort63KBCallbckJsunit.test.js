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

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let srcData63B = Data.data63B;
let srcData63Byte = stringToUint8Array(srcData63B);

describe('SecurityHuksSignVerifyRSACallbackJsunit', function () {
  it('testSignVerifyRSASize512SIGNPKCS1MD5102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1NONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1NONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1SHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1SHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1SHA224102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1SHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1SHA256102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1SHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1PSSSHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1PSSSHA224102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1PSSSHA256102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize512SIGNPKCS1PSSSHA384102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize512
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1MD5102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1MD5KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1NONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1NONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA224102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA256102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA384102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1SHA512102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1SHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA224102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA256102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA384102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize768SIGNPKCS1PSSSHA512102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize768
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1MD5102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1MD5KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1NONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1NONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA224102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA256102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA384102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1SHA512102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1SHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize1024
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize1024SIGNPKCS1PSSSHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize1024SIGNPKCS1PSSSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize1024
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it(
    'testSignVerifyRSASize1024SIGNPKCS1PSSSHA224102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize1024SIGNPKCS1PSSSHA224KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize1024
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize1024SIGNPKCS1PSSSHA256102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize1024SIGNPKCS1PSSSHA256KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize1024
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize1024SIGNPKCS1PSSSHA384102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize1024SIGNPKCS1PSSSHA384KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize1024
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize1024SIGNPKCS1PSSSHA512102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize1024SIGNPKCS1PSSSHA512KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize1024
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it('testSignVerifyRSASize2048SIGNPKCS1MD5102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1MD5KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1NONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1NONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA224102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA256102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA384102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1SHA512102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize2048
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize2048SIGNPKCS1PSSSHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1PSSSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize2048
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it(
    'testSignVerifyRSASize2048SIGNPKCS1PSSSHA224102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize2048SIGNPKCS1PSSSHA224KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize2048
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize2048SIGNPKCS1PSSSHA256102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize2048SIGNPKCS1PSSSHA256KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize2048
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize2048SIGNPKCS1PSSSHA384102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize2048SIGNPKCS1PSSSHA384KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize2048
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize2048SIGNPKCS1PSSSHA512102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize2048SIGNPKCS1PSSSHA512KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize2048
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it('testSignVerifyRSASize3072SIGNPKCS1MD5102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1MD5KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1NONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1NONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA224102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA256102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA384102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1SHA512102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize3072
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize3072SIGNPKCS1PSSSHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1PSSSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize3072
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it(
    'testSignVerifyRSASize3072SIGNPKCS1PSSSHA224102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize3072SIGNPKCS1PSSSHA224KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize3072
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize3072SIGNPKCS1PSSSHA256102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize3072SIGNPKCS1PSSSHA256KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize3072
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize3072SIGNPKCS1PSSSHA384102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize3072SIGNPKCS1PSSSHA384KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize3072
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize3072SIGNPKCS1PSSSHA512102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize3072SIGNPKCS1PSSSHA512KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize3072
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it('testSignVerifyRSASize4096SIGNPKCS1MD5102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1MD5KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1NONE102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1NONEKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA224102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA256102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA384102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1SHA512102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it('testSignVerifyRSASize4096SIGNPKCS1PSSSHA1102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1PSSSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
        HuksSignVerifyRSA.HuksKeyRSASize4096
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
    finishOutData = 0;
    exportKey = 0;
    done();
  });

  it(
    'testSignVerifyRSASize4096SIGNPKCS1PSSSHA224102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize4096SIGNPKCS1PSSSHA224KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize4096
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize4096SIGNPKCS1PSSSHA256102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize4096SIGNPKCS1PSSSHA256KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize4096
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize4096SIGNPKCS1PSSSHA384102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize4096SIGNPKCS1PSSSHA384KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize4096
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );

  it(
    'testSignVerifyRSASize4096SIGNPKCS1PSSSHA512102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testSignVerifyRSASize4096SIGNPKCS1PSSSHA512KeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksSignVerifyRSA.HuksKeyAlgRSA,
          HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
          HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
          HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
          HuksSignVerifyRSA.HuksKeyRSASize4096
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
      finishOutData = 0;
      exportKey = 0;
      done();
    }
  );
});
