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

import { describe, it, expect } from 'deccjsunit/index';
import huks from '@ohos.security.huks';

let IV = '0000000000000000';
let AAD = '0000000000000000';
let NONCE = '000000000000';
let AEAD = '0000000000000000';

let HksKeyAlg = {
  HKS_ALG_AES: 20,
  HKS_ALG_HMAC: 50,
};

let HksKeyPurpose = {
  HKS_KEY_PURPOSE_ENCRYPT: 1,
  HKS_KEY_PURPOSE_DECRYPT: 2,
};

let HksKeyPadding = {
  HKS_PADDING_NONE: 0,
  HKS_PADDING_PKCS7: 5,
};

let HksKeyDigest = {
  HKS_DIGEST_NONE: 0,
  HKS_DIGEST_MD5: 1,
  HKS_DIGEST_SHA1: 10,
  HKS_DIGEST_SHA224: 11,
  HKS_DIGEST_SHA256: 12,
  HKS_DIGEST_SHA384: 13,
  HKS_DIGEST_SHA512: 14,
};

let HksKeySize = {
  HKS_AES_KEY_SIZE_128: 128,
  HKS_AES_KEY_SIZE_192: 192,
  HKS_AES_KEY_SIZE_256: 256,
};

let HksTagType = {
  HKS_TAG_TYPE_UINT: 2 << 28,
  HKS_TAG_TYPE_BYTES: 5 << 28,
};

let HksCipherMode = {
  HKS_MODE_ECB: 1,
  HKS_MODE_CBC: 2,
  HKS_MODE_CTR: 3,
  HKS_MODE_OFB: 4,
  HKS_MODE_CCM: 31,
  HKS_MODE_GCM: 32,
};

let HksTag = {
  HKS_TAG_ALGORITHM: HksTagType.HKS_TAG_TYPE_UINT | 1,
  HKS_TAG_PURPOSE: HksTagType.HKS_TAG_TYPE_UINT | 2,
  HKS_TAG_KEY_SIZE: HksTagType.HKS_TAG_TYPE_UINT | 3,
  HKS_TAG_DIGEST: HksTagType.HKS_TAG_TYPE_UINT | 4,
  HKS_TAG_PADDING: HksTagType.HKS_TAG_TYPE_UINT | 5,
  HKS_TAG_BLOCK_MODE: HksTagType.HKS_TAG_TYPE_UINT | 6,
  HKS_TAG_ASSOCIATED_DATA: HksTagType.HKS_TAG_TYPE_BYTES | 8,
  HKS_TAG_NONCE: HksTagType.HKS_TAG_TYPE_BYTES | 9,
  HKS_TAG_IV: HksTagType.HKS_TAG_TYPE_BYTES | 10,
  HKS_TAG_AGREE_PUBLIC_KEY: HksTagType.HKS_TAG_TYPE_BYTES | 22,
  HKS_TAG_AE_TAG: HksTagType.HKS_TAG_TYPE_BYTES | 10009,
};

let HuksCipherAES = {
  HuksKeyAlgAES: {
    tag: HksTag.HKS_TAG_ALGORITHM,
    value: HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyTAGNONCE: {
    tag: HksTag.HKS_TAG_NONCE,
    value: stringToUint8Array(NONCE),
  },
  HuksKeyTAGASS: {
    tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
    value: stringToUint8Array(IV),
  },
  HuksKeyPurpose: {
    tag: HksTag.HKS_TAG_PURPOSE,
    value:
      HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPurposeENCRYPT: {
    tag: HksTag.HKS_TAG_PURPOSE,
    value: HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
  },
  HuksKeyPurposeDECRYPT: {
    tag: HksTag.HKS_TAG_PURPOSE,
    value: HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyAESSize128: {
    tag: HksTag.HKS_TAG_KEY_SIZE,
    value: HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyAESSize192: {
    tag: HksTag.HKS_TAG_KEY_SIZE,
    value: HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyAESSize256: {
    tag: HksTag.HKS_TAG_KEY_SIZE,
    value: HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeyAESPADDINGNONE: {
    tag: HksTag.HKS_TAG_PADDING,
    value: HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyAESPADDINGPKCS7: {
    tag: HksTag.HKS_TAG_PADDING,
    value: HksKeyPadding.HKS_PADDING_PKCS7,
  },
  HuksKeyAESBLOCKMODE: {
    tag: HksTag.HKS_TAG_BLOCK_MODE,
    value: HksCipherMode.HKS_MODE_CBC,
  },
  HuksKeyAESBLOCKMODECTR: {
    tag: HksTag.HKS_TAG_BLOCK_MODE,
    value: HksCipherMode.HKS_MODE_CTR,
  },
  HuksKeyAESBLOCKMODEECB: {
    tag: HksTag.HKS_TAG_BLOCK_MODE,
    value: HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyAESBLOCKMODECCM: {
    tag: HksTag.HKS_TAG_BLOCK_MODE,
    value: HksCipherMode.HKS_MODE_CCM,
  },
  HuksKeyAESBLOCKMODEGCM: {
    tag: HksTag.HKS_TAG_BLOCK_MODE,
    value: HksCipherMode.HKS_MODE_GCM,
  },
  HuksKeyAESDIGESTNONE: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyTAG_IV: { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) },
};

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);

function stringToUint8Array(str) {
  var arr = [];
  for (var i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  var tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
}

var handle = {};
var handle1;
var handle2;

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  console.log(
    `test GenerateHuksOptions: ${JSON.stringify(genHuksOptionsNONECBC)}`
  );
  await huks
    .generateKey(srcKeyAlies, genHuksOptionsNONECBC)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicInitFunc(srcKeyAlies, HuksOptions, errorcode) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      console.log(
        `test init data.errorCode: ${JSON.stringify(data.errorCode)}`
      );
      console.log(`test init errorcode: ${JSON.stringify(errorcode)}`);
      handle1 = data.handle1;
      handle2 = data.handle2;
      handle = {
        handle1: handle1,
        handle2: handle2,
      };
      expect(data.errorCode == errorcode).assertTrue();
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  await huks
    .deleteKey(srcKeyAlies, genHuksOptionsNONECBC)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

describe('errorCodeAESCipher', function () {
  it('security_huks_third_errorCode_1006', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_006';
    let HuksOptions1 = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurpose,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESPADDINGNONE
      ),
      inData: srcData63Kb,
    };
    let HuksOptions2 = {
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
    await publicGenerateKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicInitFunc(srcKeyAlies_1, HuksOptions2, -3);
    await publicDeleteKeyFunc(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1009', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_009';
    let HuksOptions1 = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE
      ),
      inData: srcData63Kb,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyPurposeDECRYPT,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODE,
        HuksCipherAES.HuksKeyAESDIGESTNONE,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
      ),
      inData: srcData63Kb,
      outData: stringToUint8Array('0'),
    };
    await publicGenerateKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicInitFunc(srcKeyAlies_1, HuksOptions2, -3);
    await publicDeleteKeyFunc(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1020', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_020';
    let HuksOptions1 = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        { tag: HksTag.HKS_TAG_ASSOCIATED_DATA, value: stringToUint8Array(AAD) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
      ),
      inData: srcData63Kb,
    };
    await publicGenerateKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicInitFunc(srcKeyAlies_1, HuksOptions2, -30);
    await publicDeleteKeyFunc(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1021', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_021';
    let HuksOptions1 = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksCipherAES.HuksKeyAlgAES,
        HuksCipherAES.HuksKeyAESSize128,
        HuksCipherAES.HuksKeyPurposeENCRYPT,
        HuksCipherAES.HuksKeyAESPADDINGNONE,
        HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
        { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) },
        { tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD) }
      ),
      inData: srcData63Kb,
    };
    await publicGenerateKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicInitFunc(srcKeyAlies_1, HuksOptions2, -30);
    await publicDeleteKeyFunc(srcKeyAlies_1, HuksOptions1);
    done();
  });
});
