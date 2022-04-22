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

let g_inData_64 =
  'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let HksKeyAlg = {
  HKS_ALG_RSA: 1,
};

let HksKeyPurpose = {
  HKS_KEY_PURPOSE_SIGN: 4,
  HKS_KEY_PURPOSE_ENCRYPT: 1,
  HKS_KEY_PURPOSE_DECRYPT: 2,
};

let HksKeyPadding = {
  HKS_PADDING_PKCS7: 5,
  HKS_PADDING_NONE: 0,
  HKS_PADDING_PSS: 2,
  HKS_PADDING_OAEP: 1,
  HKS_PADDING_PKCS1_V1_5: 3,
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
  HKS_RSA_KEY_SIZE_512: 512,
  HKS_RSA_KEY_SIZE_768: 768,
  HKS_RSA_KEY_SIZE_1024: 1024,
  HKS_RSA_KEY_SIZE_2048: 2048,
  HKS_RSA_KEY_SIZE_3072: 3072,
  HKS_RSA_KEY_SIZE_4096: 4096,
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
};

let HuksCipherRSA = {
  HuksKeyAlgRSA: {
    tag: HksTag.HKS_TAG_ALGORITHM,
    value: HksKeyAlg.HKS_ALG_RSA,
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
  HuksKeyPurposeSIGN: {
    tag: HksTag.HKS_TAG_PURPOSE,
    value: HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyRSASize512: {
    tag: HksTag.HKS_TAG_KEY_SIZE,
    value: HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksKeyRSAPADDINGNONE: {
    tag: HksTag.HKS_TAG_PADDING,
    value: HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyRSAPADDINGPSS: {
    tag: HksTag.HKS_TAG_PADDING,
    value: HksKeyPadding.HKS_PADDING_PSS,
  },
  HuksKeyRSAPADDINGPKCS7: {
    tag: HksTag.HKS_TAG_PADDING,
    value: HksKeyPadding.HKS_PADDING_PKCS7,
  },
  HuksKeyRSAPADDINGPKCS1_V1_5: {
    tag: HksTag.HKS_TAG_PADDING,
    value: HksKeyPadding.HKS_PADDING_PKCS1_V1_5,
  },
  HuksKeyRSAPADDINGOAEP: {
    tag: HksTag.HKS_TAG_PADDING,
    value: HksKeyPadding.HKS_PADDING_OAEP,
  },
  HuksKeyRSABLOCKMODEECB: {
    tag: HksTag.HKS_TAG_BLOCK_MODE,
    value: HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyRSADIGESTNONE: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyRSADIGESTSHA1: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksKeyRSADIGESTSHA224: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksKeyRSADIGESTSHA256: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksKeyRSADIGESTSHA384: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksKeyRSADIGESTSHA512: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA512,
  },
};
var handle = {};
var handle1;
var handle2;
let exportKey;

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .generateKey(srcKeyAlies, genHuksOptionsNONC)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .exportKey(srcKeyAlies, genHuksOptionsNONC)
    .then((data) => {
      console.log(`test ExportKey data: ${JSON.stringify(data)}`);
      exportKey = data.outData;
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicImportKeyFunc(srcKeyAlies, HuksOptions) {
  HuksOptions.inData = exportKey;
  await huks
    .importKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test ImportKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicInitFunc(srcKeyAlies, HuksOptions, errorcode) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      handle1 = data.handle1;
      handle2 = data.handle2;
      handle = {
        handle1: handle1,
        handle2: handle2,
      };
      expect(data.errorCode).assertEqual(errorcode);
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .deleteKey(srcKeyAlies, genHuksOptionsNONC)
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
  it('security_huks_third_errorCode_1007', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_007';
    let HuksOptions1 = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize512,
        HuksCipherRSA.HuksKeyRSAPADDINGNONE,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: g_inData_64,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize512,
        HuksCipherRSA.HuksKeyRSAPADDINGNONE,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        { tag: HksTag.HKS_TAG_DIGEST, value: HksKeyDigest.HKS_DIGEST_SHA384 }
      ),
      inData: g_inData_64,
    };
    await publicGenerateKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicExportKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicImportKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicInitFunc(srcKeyAlies_1, HuksOptions2, -3);
    await publicDeleteKeyFunc(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1014', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_014';
    let HuksOptions1 = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize512,
        HuksCipherRSA.HuksKeyRSAPADDINGNONE,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: g_inData_64,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize512,
        HuksCipherRSA.HuksKeyRSAPADDINGPKCS7,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: g_inData_64,
    };
    await publicGenerateKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicExportKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicImportKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicInitFunc(srcKeyAlies_1, HuksOptions2, -3);
    await publicDeleteKeyFunc(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1019', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_019';
    let HuksOptions1 = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize512,
        HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: g_inData_64,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurposeENCRYPT,
        HuksCipherRSA.HuksKeyRSASize512,
        HuksCipherRSA.HuksKeyRSAPADDINGPKCS7,
        HuksCipherRSA.HuksKeyRSADIGESTNONE
      ),
      inData: g_inData_64,
    };
    await publicGenerateKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicExportKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicImportKeyFunc(srcKeyAlies_1, HuksOptions1);
    await publicInitFunc(srcKeyAlies_1, HuksOptions2, -3);
    await publicDeleteKeyFunc(srcKeyAlies_1, HuksOptions1);
    done();
  });
});
