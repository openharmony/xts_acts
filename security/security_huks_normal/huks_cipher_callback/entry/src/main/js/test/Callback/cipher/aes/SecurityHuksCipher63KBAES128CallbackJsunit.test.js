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
import * as Control from '../../../switchControl.js';
import {
  HuksCipherAES,
  genHuksOptions,
} from '../../../../../../../../../utils/param/cipher/publicCipherParam.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';
import { publicCipherFunc } from '../../../../../../../../../utils/param/cipher/publicCipherCallback.js';
import { HksTag } from '../../../../../../../../../utils/param/publicParam.js';
let IV = '0000000000000000';

let srcData65 =
  'Hks_AES_Cipher_Test_00000000000000000000000000000000000000000000000000000_string';
let srcData65Kb = stringToUint8Array(srcData65);

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let updateResult = new Array();

describe('SecurityHuksCipherAESCallbackJsunit', function () {
  it('testCipherAESSize128PADDINGNONEMODECBC001', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias001';
    genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
    genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
    genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeDECRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherAESSize128PADDINGNONEMODECBC002', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherAESSize128PADDINGPKCS7MODECBC001', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGPKCS7MODECBCKeyAlias001';
    genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherAES.HuksKeyAESPADDINGPKCS7
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGPKCS7,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData65Kb,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeDECRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGPKCS7,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherAESSize128PADDINGPKCS7MODECBC002', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGPKCS7MODECBCKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGPKCS7,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherAESSize128PADDINGNONEMODECTR001', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECTRKeyAlias001';
    genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
    genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESSize128);
    genHuksOptions.properties.splice(
      4,
      1,
      HuksCipherAES.HuksKeyAESBLOCKMODECTR
    );
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODECTR,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeDECRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODECTR,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherAESSize128PADDINGNONEMODECTR002', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECTRKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODECTR,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  it('testCipherAESSize128PADDINGNONEMODEECB001', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODEECBKeyAlias001';
    genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherAES.HuksKeyAESBLOCKMODEECB
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEECB,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      true
    );
    HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeDECRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEECB,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: new Uint8Array(updateResult),
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'finish',
      false
    );
    done();
  });

  it('testCipherAESSize128PADDINGNONEMODEECB002', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODEECBKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEECB,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
      outData: stringToUint8Array('0'),
    };
    updateResult = await publicCipherFunc(
      srcKeyAlies,
      genHuksOptions,
      HuksOptions,
      'abort',
      true
    );
    done();
  });

  if (Control.isOpenSSL) {
    it('testCipherAESSize128PADDINGPKCS7MODEECB001', 0, async function (done) {
      const srcKeyAlies = 'testCipherAESSize128PADDINGPKCS7MODEECBKeyAlias001';
      genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
      genHuksOptions.properties.splice(
        3,
        1,
        HuksCipherAES.HuksKeyAESPADDINGPKCS7
      );
      genHuksOptions.properties.splice(
        4,
        1,
        HuksCipherAES.HuksKeyAESBLOCKMODEECB
      );
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeENCRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGPKCS7,
          HuksCipherAES.HuksKeyAESBLOCKMODEECB,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          {
            tag: HksTag.HKS_TAG_IV,
            value: stringToUint8Array(IV),
          }
        ),
        inData: srcData65Kb,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        true
      );
      HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeDECRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGPKCS7,
          HuksCipherAES.HuksKeyAESBLOCKMODEECB,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          {
            tag: HksTag.HKS_TAG_IV,
            value: stringToUint8Array(IV),
          }
        ),
        inData: new Uint8Array(updateResult),
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'finish',
        false
      );
      done();
    });

    it('testCipherAESSize128PADDINGPKCS7MODEECB002', 0, async function (done) {
      const srcKeyAlies = 'testCipherAESSize128PADDINGPKCS7MODEECBKeyAlias002';
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeENCRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGPKCS7,
          HuksCipherAES.HuksKeyAESBLOCKMODEECB,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          {
            tag: HksTag.HKS_TAG_IV,
            value: stringToUint8Array(IV),
          }
        ),
        inData: srcData65Kb,
        outData: stringToUint8Array('0'),
      };
      updateResult = await publicCipherFunc(
        srcKeyAlies,
        genHuksOptions,
        HuksOptions,
        'abort',
        true
      );
      done();
    });
  }
});
