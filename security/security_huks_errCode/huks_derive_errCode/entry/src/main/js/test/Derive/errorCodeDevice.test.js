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
import Data from '../../../../../../../utils/data.json';

let handle = {};
let handle1;
let handle2;
let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let HksKeyAlg = {
  HKS_ALG_HKDF: 51,
  HKS_ALG_AES: 20,
  HKS_ALG_DH: 103,
  HKS_ALG_HMAC: 50,
};

let HksKeyPurpose = {
  HKS_KEY_PURPOSE_AGREE: 256,
  HKS_KEY_PURPOSE_DERIVE: 16,
  HKS_KEY_PURPOSE_ENCRYPT: 1,
  HKS_KEY_PURPOSE_DECRYPT: 2,
  HKS_KEY_PURPOSE_MAC: 128,
};

let HksKeySize = {
  HKS_AES_KEY_SIZE_128: 128,
  HKS_AES_KEY_SIZE_192: 192,
  HKS_AES_KEY_SIZE_256: 256,
  HKS_AES_KEY_SIZE_512: 512,
  DERIVE_KEY_SIZE_32: 32,
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

let HksTagType = {
  HKS_TAG_TYPE_UINT: 2 << 28,
  HKS_TAG_TYPE_BOOL: 4 << 28,
  HKS_TAG_TYPE_BYTES: 5 << 28,
};

let HksTag = {
  HKS_TAG_ALGORITHM: HksTagType.HKS_TAG_TYPE_UINT | 1,
  HKS_TAG_PURPOSE: HksTagType.HKS_TAG_TYPE_UINT | 2,
  HKS_TAG_KEY_SIZE: HksTagType.HKS_TAG_TYPE_UINT | 3,
  HKS_TAG_DIGEST: HksTagType.HKS_TAG_TYPE_UINT | 4,
  HKS_TAG_PADDING: HksTagType.HKS_TAG_TYPE_UINT | 5,
  HKS_TAG_BLOCK_MODE: HksTagType.HKS_TAG_TYPE_UINT | 6,
  HKS_TAG_DERIVE_KEY_SIZE: HksTagType.HKS_TAG_TYPE_UINT | 24,
  HKS_TAG_IS_KEY_ALIAS: HksTagType.HKS_TAG_TYPE_BOOL | 1001,
  HKS_TAG_KEY_STORAGE_FLAG: HksTagType.HKS_TAG_TYPE_UINT | 1002,
  HKS_TAG_KEY_ALIAS: HksTagType.HKS_TAG_TYPE_BYTES | 23,
};

let HuksDeriveAES = {
  HuksKeyAlgHKDF: {
    tag: HksTag.HKS_TAG_ALGORITHM,
    value: HksKeyAlg.HKS_ALG_HKDF,
  },
  HuksKeyAlgAES: {
    tag: HksTag.HKS_TAG_ALGORITHM,
    value: HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyPurposeHKDF: {
    tag: HksTag.HKS_TAG_PURPOSE,
    value: HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksTagHKDFDigestSHA256: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksKeyHKDFSize128: {
    tag: HksTag.HKS_TAG_KEY_SIZE,
    value: HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyDERIVEKEYSIZE: {
    tag: HksTag.HKS_TAG_DERIVE_KEY_SIZE,
    value: HksKeySize.DERIVE_KEY_SIZE_32,
  },
  HuksKeyPurposeENCRYPTDECRYPT: {
    tag: HksTag.HKS_TAG_PURPOSE,
    value:
      HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
};

function stringToUint8Array(str) {
  var arr = [];
  for (var i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  var tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
}

async function publicDeriveGenFunc(srcKeyAlies, HuksOptions, errorCode) {
  await huks
    .generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == errorCode).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeriveInitFunc(srcKeyAlies, HuksOptions, errorcode) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data ${JSON.stringify(data)}`);
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

describe('errorCodeDevice', function () {
  it('security_huks_third_errorCode_1003', 0, async function (done) {
    let srcKeyAlies_1 =
      'testAgreeDHKeyAlias_01_003sakjncznxcbzmxncbohdaoisudzxcnbzmncadhaskdjbzxcnzbcasdasdsa';
    let HuksOptions1 = {
      properties: new Array(
        HuksDeriveAES.HuksKeyAlgAES,
        HuksDeriveAES.HuksKeyPurposeHKDF,
        HuksDeriveAES.HuksTagHKDFDigestSHA256,
        HuksDeriveAES.HuksKeyHKDFSize128
      ),
      inData: srcData63Kb,
    };
    await publicDeriveGenFunc(srcKeyAlies_1, HuksOptions1, -3);
    HuksOptions1.properties.splice(0, 1, HuksDeriveAES.HuksKeyAlgHKDF);
    HuksOptions1.properties.splice(3, 1, HuksDeriveAES.HuksKeyDERIVEKEYSIZE);
    await publicDeriveInitFunc(srcKeyAlies_1, HuksOptions1, -3);
    done();
  });
});
