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
import { HuksCipherRSA } from '../../../../../../../../../utils/param/cipher/publicCipherParam.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';
import { publicCipherFunc } from '../../../../../../../../../utils/param/cipher/publicCipherPromiseRSA.js';
import * as Control from '../../../switchControl.js';

let gInData32 = 'RSA_32_ttttttttttttttttttttttttt';
let gInData384 =
  'RSA_384_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
  'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
  'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
  'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
  'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
  'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let defaultData = '0';

let gInData32Array = stringToUint8Array(gInData32);

let gInData384Array = stringToUint8Array(gInData384);

let updateResult = new Array();

let genHuksOptions = {
  properties: new Array(
    HuksCipherRSA.HuksKeyAlgRSA,
    HuksCipherRSA.HuksKeyPurpose,
    HuksCipherRSA.HuksKeyRSASize3072
  ),
  inData: new Uint8Array(defaultData),
};

describe('SecurityHuksCipherRSAPromiseJsunit', function () {
  if (Control.isOpenSSL) {
    it('testCipherRSASize3072PADDINGNONESHA256101', 0, async function (done) {
      const srcKeyAlies = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias101';
      const newSrcKeyAlies =
        'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias101';
      genHuksOptions.properties.splice(
        3,
        1,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB
      );
      genHuksOptions.properties.splice(
        4,
        1,
        HuksCipherRSA.HuksKeyRSAPADDINGNONE
      );
      genHuksOptions.properties.splice(
        5,
        1,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      );

      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData384Array,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        true
      );
      HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: new Uint8Array(updateResult),
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        false
      );
      done();
    });

    it('testCipherRSASize3072PADDINGNONESHA256102', 0, async function (done) {
      const srcKeyAlies = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias102';
      const newSrcKeyAlies =
        'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias101';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData384Array,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'abort',
        true
      );
      done();
    });

    it('testCipherRSASize3072PADDINGNONESHA256103', 0, async function (done) {
      const srcKeyAlies = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias101';
      const newSrcKeyAlies =
        'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias101';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData384Array,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        true
      );
      HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: new Uint8Array(updateResult),
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        false
      );
      done();
    });

    it('testCipherRSASize3072PADDINGNONESHA256104', 0, async function (done) {
      const srcKeyAlies = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias102';
      const newSrcKeyAlies =
        'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias101';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData384Array,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'abort',
        true
      );
      done();
    });
  }

  it(
    'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256101',
    0,
    async function (done) {
      const srcKeyAlies =
        'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256KeyAlias101';
      const newSrcKeyAlies =
        'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
      genHuksOptions.properties.splice(
        3,
        1,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB
      );
      genHuksOptions.properties.splice(
        4,
        1,
        HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15
      );
      genHuksOptions.properties.splice(
        5,
        1,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      );

      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData32Array,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        true
      );
      HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: new Uint8Array(updateResult),
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        false
      );
      done();
    }
  );

  it(
    'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256102',
    0,
    async function (done) {
      const srcKeyAlies =
        'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256KeyAlias102';
      const newSrcKeyAlies =
        'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData32Array,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'abort',
        true
      );
      done();
    }
  );

  it(
    'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256103',
    0,
    async function (done) {
      const srcKeyAlies =
        'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256KeyAlias101';
      const newSrcKeyAlies =
        'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData32Array,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        true
      );
      HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: new Uint8Array(updateResult),
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        false
      );
      done();
    }
  );

  it(
    'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256104',
    0,
    async function (done) {
      const srcKeyAlies =
        'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256KeyAlias102';
      const newSrcKeyAlies =
        'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize3072,
          HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData32Array,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        newSrcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'abort',
        true
      );
      done();
    }
  );

  it('testCipherRSASize3072PADDINGOAEPSHA1101', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA1KeyAlias101';
    const newSrcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA1NewKeyAlias101';
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherRSA.HuksKeyRSABLOCKMODEECB
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
    genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);

    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA1
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA1
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA1102', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA1
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA1103', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA1KeyAlias101';
    const newSrcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA1NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA1
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA1
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA1104', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA1KeyAlias102';
    const newSrcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA1NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA1
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA224101', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA224KeyAlias101';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA224NewKeyAlias101';
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherRSA.HuksKeyRSABLOCKMODEECB
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
    genHuksOptions.properties.splice(
      5,
      1,
      HuksCipherRSA.HuksKeyRSADIGESTSHA224
    );

    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA224
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA224
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA224102', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA224
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA224103', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA224KeyAlias101';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA224NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA224
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA224
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA224104', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA224KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA224NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA224
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA256101', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias101';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias101';
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherRSA.HuksKeyRSABLOCKMODEECB
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
    genHuksOptions.properties.splice(
      5,
      1,
      HuksCipherRSA.HuksKeyRSADIGESTSHA256
    );

    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA256102', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA256103', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias101';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA256104', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA384101', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA384KeyAlias101';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA384NewKeyAlias101';
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherRSA.HuksKeyRSABLOCKMODEECB
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
    genHuksOptions.properties.splice(
      5,
      1,
      HuksCipherRSA.HuksKeyRSADIGESTSHA384
    );

    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA384
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA384
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA384102', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA384KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA384NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA384
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA384103', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA384KeyAlias101';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA384NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA384
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA384
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA384104', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA384KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA384NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA384
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA512101', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA512KeyAlias101';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA512NewKeyAlias101';
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherRSA.HuksKeyRSABLOCKMODEECB
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
    genHuksOptions.properties.splice(
      5,
      1,
      HuksCipherRSA.HuksKeyRSADIGESTSHA512
    );

    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA512
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA512
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA512102', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA512KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA512NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA512
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA512103', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA512KeyAlias101';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA512NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA512
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeDECRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA512
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherRSASize3072PADDINGOAEPSHA512104', 0, async function (done) {
    const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA512KeyAlias102';
    const newSrcKeyAlies =
      'testCipherRSASize3072PADDINGOAEPSHA512NewKeyAlias101';
    let HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize3072,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA512
      ),
      inData: gInData32Array,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });
});
