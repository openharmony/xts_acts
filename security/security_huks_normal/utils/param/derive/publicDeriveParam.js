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

import * as Param from '../publicParam.js';

let HuksDeriveHKDF = {
  HuksKeySIZE: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_512,
  },
  HuksKeyAlgHKDF: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_HKDF,
  },
  HuksKeyAlgAES: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyPurposeHKDF: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksTagHKDFDigestSHA256: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagHKDFDigestSHA384: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagHKDFDigestSHA512: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyHKDFSize128: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyHKDFSize192: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyHKDFSize256: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeyDERIVEKEYSIZE: {
    tag: Param.HksTag.HKS_TAG_DERIVE_KEY_SIZE,
    value: Param.HksKeySize.DERIVE_KEY_SIZE_32,
  },

  HuksKeyISKEYALIAS: { tag: Param.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
  HuksKeySTORAGE: {
    tag: Param.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
    value: Param.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
  },
  HuksKeyALGORITHMAES: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyALGORITHMHMAC: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_HMAC,
  },
  HuksKeySIZE256: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeySIZE128: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeySIZE192: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyPurposeDERIVE: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksKeyPurposeMAC: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  },
  HuksKeyPurposeENCRYPTDECRYPT: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value:
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPADDINGNONE: {
    tag: Param.HksTag.HKS_TAG_PADDING,
    value: Param.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyPADDINGPKCS7: {
    tag: Param.HksTag.HKS_TAG_PADDING,
    value: Param.HksKeyPadding.HKS_PADDING_PKCS7,
  },
  HuksKeyDIGESTNONE: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyDIGESTSHA1: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksKeyDIGESTSHA224: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksKeyDIGESTSHA256: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksKeyDIGESTSHA384: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksKeyDIGESTSHA512: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyBLOCKMODECBC: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_CBC,
  },
  HuksKeyBLOCKMODECCM: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_CCM,
  },
  HuksKeyBLOCKMODEECB: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyBLOCKMODECTR: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_CTR,
  },
  HuksKeyBLOCKMODEGCM: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_GCM,
  },
};

let HuksDerivePBDKF2 = {
  HuksKeySIZE: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_512,
  },
  HuksKeyAlgPBKDF2: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_PBKDF2,
  },
  HuksKeyAlgAES: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyPurposePBKDF2: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksTagPBKDF2DigestSHA256: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagPBKDF2DigestSHA384: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagPBKDF2DigestSHA512: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyPBKDF2Size128: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyPBKDF2Size192: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyPBKDF2Size256: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeyDERIVEKEYSIZE: {
    tag: Param.HksTag.HKS_TAG_DERIVE_KEY_SIZE,
    value: Param.HksKeySize.DERIVE_KEY_SIZE_32,
  },

  HuksKeyISKEYALIAS: { tag: Param.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
  HuksKeySTORAGE: {
    tag: Param.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
    value: Param.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
  },
  HuksKeyALGORITHMAES: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyALGORITHMHMAC: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_HMAC,
  },
  HuksKeySIZE256: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeySIZE128: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeySIZE192: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_AES_KEY_SIZE_192,
  },
  HuksKeyPurposeDERIVE: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksKeyPurposeMAC: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  },
  HuksKeyPurposeENCRYPTDECRYPT: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value:
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPADDINGNONE: {
    tag: Param.HksTag.HKS_TAG_PADDING,
    value: Param.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyPADDINGPKCS7: {
    tag: Param.HksTag.HKS_TAG_PADDING,
    value: Param.HksKeyPadding.HKS_PADDING_PKCS7,
  },
  HuksKeyDIGESTNONE: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyDIGESTSHA1: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksKeyDIGESTSHA224: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksKeyDIGESTSHA256: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksKeyDIGESTSHA384: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksKeyDIGESTSHA512: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyBLOCKMODECBC: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_CBC,
  },
  HuksKeyBLOCKMODECCM: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_CCM,
  },
  HuksKeyBLOCKMODEECB: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyBLOCKMODECTR: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_CTR,
  },
  HuksKeyBLOCKMODEGCM: {
    tag: Param.HksTag.HKS_TAG_BLOCK_MODE,
    value: Param.HksCipherMode.HKS_MODE_GCM,
  },
};

export { HuksDeriveHKDF, HuksDerivePBDKF2 };
