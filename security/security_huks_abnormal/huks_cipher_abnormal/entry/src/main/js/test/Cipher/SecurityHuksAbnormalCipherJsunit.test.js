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

import { describe, it, expect, beforeEach } from 'deccjsunit/index';
import huks from '@ohos.security.huks';
import * as Params from '../../../../../../../utils/Base/data/params';
import * as Tools from '../../../../../../../utils/Base/tools';

let ginData32 = 'RSA_32_ttttttttttttttttttttttttt';
let HuksCipherRSA = {
  HuksKeyAlgRSA: {
    tag: Params.HksTag.HKS_TAG_ALGORITHM,
    value: Params.HksKeyAlg.HKS_ALG_RSA,
  },
  HuksKeyPurpose: {
    tag: Params.HksTag.HKS_TAG_PURPOSE,
    value:
      Params.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      Params.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPurposeENCRYPT: {
    tag: Params.HksTag.HKS_TAG_PURPOSE,
    value: Params.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
  },
  HuksKeyPurposeDECRYPT: {
    tag: Params.HksTag.HKS_TAG_PURPOSE,
    value: Params.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyRSASize512: {
    tag: Params.HksTag.HKS_TAG_KEY_SIZE,
    value: Params.HksKeySize.HKS_KEY_SIZE_512,
  },
  HuksKeyRSAPADDINGPKCS1V15: {
    tag: Params.HksTag.HKS_TAG_PADDING,
    value: Params.HksKeyPadding.HKS_PADDING_PKCS1_V1_5,
  },
  HuksKeyRSABLOCKMODEECB: {
    tag: Params.HksTag.HKS_TAG_BLOCK_MODE,
    value: Params.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyRSADIGESTSHA256: {
    tag: Params.HksTag.HKS_TAG_DIGEST,
    value: Params.HksKeyDigest.HKS_DIGEST_SHA256,
  },
};

let ginData32array = Tools.stringToUint8Array(ginData32);

let encryptedData;
var handle = {};
let updateResult = new Array();
let exportKey;

let genHuksOptions;
let HuksOptions;

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

async function publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC, Type) {
  await huks
    .exportKey(srcKeyAlies, genHuksOptionsNONC)
    .then((data) => {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      exportKey = data.outData;
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicImportKeyFunc(srcKeyAlies, HuksOptions, Type) {
  HuksOptions.inData = exportKey;
  await huks
    .importKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test importKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicInitFunc(srcKeyAlies, HuksOptions, Type) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      handle = {
        handle1: data.handle1,
        handle2: data.handle2,
      };
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicUpdateFunc(handle, HuksOptions, Type) {
  let dateSize = 64;
  let tempHuksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await update(handle, HuksOptions, Type);
    HuksOptions.inData = Tools.stringToUint8Array('0');
  } else {
    let count = Math.floor(Array.from(inDataArray).length / dateSize);
    let remainder = Array.from(inDataArray).length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        Array.from(tempHuksOptionsInData).slice(
          dateSize * i,
          dateSize * (i + 1)
        )
      );
      await update(handle, HuksOptions, Type);
      HuksOptions.inData = tempHuksOptionsInData;
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(tempHuksOptionsInData).slice(
          dateSize * count,
          Tools.uint8ArrayToString(inDataArray).length
        )
      );
      await update(handle, HuksOptions, Type);
    }
  }
}

async function update(handle, HuksOptions, Type) {
  await huks
    .update(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data: ${JSON.stringify(data)}`);
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test update err information: ' + err);
      expect(null).assertFail();
    });
}

async function publicFinishAbortFunc(
  handle,
  HuksOptions,
  thirdInderfaceName,
  isEncrypt,
  Type
) {
  if (thirdInderfaceName == 'finish') {
    HuksOptions.outData = new Uint8Array(new Array(1024));
    HuksOptions.inData = new Uint8Array(new Array());
    await finish(handle, HuksOptions, isEncrypt, Type);
  } else if (thirdInderfaceName == 'abort') {
    await abort(handle, HuksOptions, Type);
  }
}

async function finish(handle, HuksOptions, isEncrypt, Type) {
  await huks
    .finish(handle, HuksOptions)
    .then((data) => {
      console.log(`test finish data: ${JSON.stringify(data)}`);
      if (Type !== 0) {
        expect(data.errorCode == Type).assertTrue();
      } else {
        if (isEncrypt) {
          updateResult = Array.from(data.outData);
          if (
            Tools.uint8ArrayToString(data.outData) ===
            Tools.uint8ArrayToString(encryptedData)
          ) {
            expect(null).assertFail();
          } else {
            expect(data.errorCode == Type).assertTrue();
          }
        }
        if (!isEncrypt) {
          if (
            Tools.uint8ArrayToString(data.outData) ===
            Tools.uint8ArrayToString(encryptedData)
          ) {
            expect(data.errorCode == Type).assertTrue();
          } else {
            expect(null).assertFail();
          }
        }
      }
    })
    .catch((err) => {
      console.log('test finish err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function abort(handle, HuksOptions, Type) {
  await huks
    .abort(handle, HuksOptions)
    .then((data) => {
      console.log(`test abort data: ${JSON.stringify(data)}`);
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test abort err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC, Type) {
  await huks
    .deleteKey(srcKeyAlies, genHuksOptionsNONC)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicCipher(
  srcKeyAlies,
  newSrcKeyAlies,
  genHuksOptions,
  HuksOptions
) {
  let inputInData = HuksOptions.inData;
  await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
  await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
  HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
  await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);

  HuksOptions.inData = inputInData;
  await publicInitFunc(newSrcKeyAlies, HuksOptions, 0);
  await publicUpdateFunc(handle, HuksOptions, 0);
  await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, 0);
}

describe('SecurityHuksAbnormalCipherJsunit', function () {
  beforeEach(function () {
    handle = {};
    encryptedData = ginData32array;
    updateResult = new Array();
    exportKey = {};
    genHuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurpose,
        HuksCipherRSA.HuksKeyRSASize512,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: Tools.stringToUint8Array('0'),
    };
    HuksOptions = {
      properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyRSASize512,
        HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
        HuksCipherRSA.HuksKeyRSADIGESTSHA256
      ),
      inData: ginData32array,
      outData: Tools.stringToUint8Array('0'),
    };
  });

  it('security_huks_third_abnormal_cipher_1015', 0, async function (done) {
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1015';
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicInitFunc(newSrcKeyAlies, HuksOptions, -13);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    done();
  });

  it('security_huks_third_abnormal_cipher_1016', 0, async function (done) {
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    done();
  });

  it('security_huks_third_abnormal_cipher_1017', 0, async function (done) {
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    done();
  });

  it('security_huks_third_abnormal_cipher_1018', 0, async function (done) {
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    done();
  });

  it('security_huks_third_abnormal_cipher_1019', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1019';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1019';
    let inputInData = HuksOptions.inData;
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    HuksOptions.inData = inputInData;
    await publicInitFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -3);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1020', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1020';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1020';
    let inputInData = HuksOptions.inData;
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    HuksOptions.inData = inputInData;
    await publicInitFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1021', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1021';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1021';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1022', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1022';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1022';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1023', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1023';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1023';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1024', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1024';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1024';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1025', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1025';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1025';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1026', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1026';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1026';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1027', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1027';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1027';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1028', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1028';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1028';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1029', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1029';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1029';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1030', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1030';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1030';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1031', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1031';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1031';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1032', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1032';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1032';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1033', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1033';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1033';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1034', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1034';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1034';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, -14);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1035', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1035';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1035';
    let inputInData = HuksOptions.inData;
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    HuksOptions.inData = inputInData;
    await publicInitFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1036', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1036';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1036';
    let inputInData = HuksOptions.inData;
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    HuksOptions.inData = inputInData;
    await publicInitFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', true, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1037', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1037';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1037';
    let inputInData = HuksOptions.inData;
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    HuksOptions.inData = inputInData;
    await publicInitFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlies, HuksOptions, 0);
    HuksOptions.inData = inputInData;
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1038', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1038';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1038';
    await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlies, genHuksOptions, 0);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlies, HuksOptions, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', true, -31);
    done();
  });

  it('security_huks_third_abnormal_cipher_1039', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1039';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1039';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicInitFunc(srcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1040', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1040';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1040';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1041', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1041';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1041';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1042', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1042';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1042';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1043', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1043';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1043';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicInitFunc(srcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -3);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1044', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1044';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1044';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicInitFunc(srcKeyAlies, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1045', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1045';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1045';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1046', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1046';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1046';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1047', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1047';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1047';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1048', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1048';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1048';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1049', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1049';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1049';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1050', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1050';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1050';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1051', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1051';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1051';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1052', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1052';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1052';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1053', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1053';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1053';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1054', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1054';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1054';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1055', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1055';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1055';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1056', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1056';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1056';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1057', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1057';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1057';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1058', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1058';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1058';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1059', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1059';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1059';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicInitFunc(srcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1060', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1060';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1060';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicInitFunc(srcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'abort', false, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1061', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1061';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1061';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    HuksOptions.inData = new Uint8Array(updateResult);
    HuksOptions.outData = Tools.stringToUint8Array('0');
    await publicInitFunc(srcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicInitFunc(srcKeyAlies, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_cipher_1062', 0, async function (done) {
    const srcKeyAlies = 'security_huks_third_abnormal_cipher_1062';
    const newSrcKeyAlies = 'security_huks_third_abnormal_cipher_new_1062';
    await publicCipher(
      srcKeyAlies,
      newSrcKeyAlies,
      genHuksOptions,
      HuksOptions
    );
    HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
    await publicInitFunc(srcKeyAlies, HuksOptions, 0);
    HuksOptions.inData = new Uint8Array(updateResult);
    await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions, 0);
    await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicFinishAbortFunc(handle, HuksOptions, 'finish', false, 0);
    done();
  });
});
