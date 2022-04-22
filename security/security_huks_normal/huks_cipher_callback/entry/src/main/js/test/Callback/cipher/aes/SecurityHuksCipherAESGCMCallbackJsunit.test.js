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
import {
  HuksCipherAES,
  genHuksOptions,
} from '../../../../../../../../../utils/param/cipher/publicCipherParam.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';
import { publicCipherFunc } from '../../../../../../../../../utils/param/cipher/publicCipherCallback.js';
import { HksTag } from '../../../../../../../../../utils/param/publicParam.js';

let AAD = '0000000000000000';
let NONCE = '000000000000';
let AEAD = '0000000000000000';

let srcData65 =
  'Hks_AES_Cipher_Test_00000000000000000000000000000000000000000000000000000_string';
let srcData65Kb = stringToUint8Array(srcData65);

let srcData63 =
  'Hks_AES_Cipher_Test_00000000000000000000000000000000000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let updateResult = new Array();

describe('SecurityHuksCipherAESCallbackJsunit', function () {
  it('testCipherAESSize128PADDINGNONEMODEGCM001', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias001';
    genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherAES.HuksKeyAESBLOCKMODEGCM
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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
    console.log(`test updateResult ${updateResult.length}`);
    HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeDECRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        {
          tag: HksTag.HKS_TAG_AE_TAG,
          value: new Uint8Array(
            updateResult.splice(updateResult.length - 16, updateResult.length)
          ),
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

  it('testCipherAESSize128PADDINGNONEMODEGCM002', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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

  it('testCipherAESSize128PADDINGNONEMODEGCM003', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias001';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        {
          tag: HksTag.HKS_TAG_AE_TAG,
          value: new Uint8Array(
            updateResult.splice(updateResult.length - 16, updateResult.length)
          ),
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

  it('testCipherAESSize128PADDINGNONEMODEGCM004', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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

  it('testCipherAESSize192PADDINGNONEMODEGCM001', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias001';
    genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherAES.HuksKeyAESBLOCKMODEGCM
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize192,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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
        HuksCipherAES.HuksKeyAESSize192,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        {
          tag: HksTag.HKS_TAG_AE_TAG,
          value: new Uint8Array(
            updateResult.splice(updateResult.length - 16, updateResult.length)
          ),
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

  it('testCipherAESSize192PADDINGNONEMODEGCM002', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize192,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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

  it('testCipherAESSize192PADDINGNONEMODEGCM003', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias001';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize192,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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
        HuksCipherAES.HuksKeyAESSize192,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        {
          tag: HksTag.HKS_TAG_AE_TAG,
          value: new Uint8Array(
            updateResult.splice(updateResult.length - 16, updateResult.length)
          ),
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

  it('testCipherAESSize192PADDINGNONEMODEGCM004', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize192,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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

  it('testCipherAESSize256PADDINGNONEMODEGCM001', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias001';
    genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
    genHuksOptions.properties.splice(
      3,
      1,
      HuksCipherAES.HuksKeyAESBLOCKMODEGCM
    );
    genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize256,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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
        HuksCipherAES.HuksKeyAESSize256,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        {
          tag: HksTag.HKS_TAG_AE_TAG,
          value: new Uint8Array(
            updateResult.splice(updateResult.length - 16, updateResult.length)
          ),
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

  it('testCipherAESSize256PADDINGNONEMODEGCM002', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize256,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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

  it('testCipherAESSize256PADDINGNONEMODEGCM003', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias001';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize256,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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
        HuksCipherAES.HuksKeyAESSize256,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        {
          tag: HksTag.HKS_TAG_AE_TAG,
          value: new Uint8Array(
            updateResult.splice(updateResult.length - 16, updateResult.length)
          ),
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

  it('testCipherAESSize256PADDINGNONEMODEGCM004', 0, async function (done) {
    const srcKeyAlies = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESSize256,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
          value: stringToUint8Array(AAD),
        },
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
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
});
