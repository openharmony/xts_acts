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
let DSA_COMMON_SIZE = 1024;

let HuksSignVerifyRSA = {
  HuksKeySIZE: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksKeyAlgRSA: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_RSA,
  },
  HuksKeyRSASize512: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksKeyRSASize768: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_RSA_KEY_SIZE_768,
  },
  HuksKeyRSASize1024: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_RSA_KEY_SIZE_1024,
  },
  HuksKeyRSASize2048: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_RSA_KEY_SIZE_2048,
  },
  HuksKeyRSASize3072: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_RSA_KEY_SIZE_3072,
  },
  HuksKeyRSASize4096: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_RSA_KEY_SIZE_4096,
  },
  HuksKeyRSAPurposeSIGN: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyRSAPurposeVERIFY: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksKeyRSAPurposeSINGVERIFY: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value:
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN |
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksKeyRSAPADDINGPKCS1V15: {
    tag: Param.HksTag.HKS_TAG_PADDING,
    value: Param.HksKeyPadding.HKS_PADDING_PKCS1_V1_5,
  },
  HuksKeyRSAPADDINGPSS: {
    tag: Param.HksTag.HKS_TAG_PADDING,
    value: Param.HksKeyPadding.HKS_PADDING_PSS,
  },
  HuksTagPKCS1DigestMD5: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_MD5,
  },
  HuksTagPKCS1DigestNONE: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksTagPKCS1DigestSHA1: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagPKCS1DigestSHA224: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagPKCS1DigestSHA256: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagPKCS1DigestSHA384: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagPKCS1DigestSHA512: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksTagPSSDigestSHA1: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagPSSDigestSHA224: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagPSSDigestSHA256: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagPSSDigestSHA384: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagPSSDigestSHA512: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
};
let HuksSignVerifyDSA = {
  HuksKeySIZE: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_DSA_KEY_SIZE_512,
  },
  HuksKeySIZE1024: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_DSA_KEY_SIZE_1024,
  },
  HuksKeyAlgDSA: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_DSA,
  },
  HuksKeyDSAPurposeSIGN: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyDSAPurposeVERIFY: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagDSADigestSHA1: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagDSADigestSHA224: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagDSADigestSHA256: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagDSADigestSHA384: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagDSADigestSHA512: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyRSAPurposeSINGVERIFY: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value:
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN |
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagDSACOMMONSIZE: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: DSA_COMMON_SIZE,
  },
};

let HuksSignVerifyECC = {
  HuksKeySIZE: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_ECC_KEY_SIZE_521,
  },
  HuksKeyAlgECC: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_ECC,
  },
  HuksKeyECCPurposeSIGN: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyECCPurposeVERIFY: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagECCDigestNONE: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksTagECCDigestSHA1: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagECCDigestSHA224: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagECCDigestSHA256: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagECCDigestSHA384: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagECCDigestSHA512: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyECCSize224: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_ECC_KEY_SIZE_224,
  },
  HuksKeyECCSize256: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_ECC_KEY_SIZE_256,
  },
  HuksKeyECCSize384: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_ECC_KEY_SIZE_384,
  },
  HuksKeyECCSize521: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_ECC_KEY_SIZE_521,
  },
  HuksKeyECCPurposeSINGVERIFY: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value:
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN |
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
};

let HuksSignVerifyED25519 = {
  HuksKeySIZE: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_ED25519_KEY_SIZE_512,
  },
  HuksKeyAlgED25519: {
    tag: Param.HksTag.HKS_TAG_ALGORITHM,
    value: Param.HksKeyAlg.HKS_ALG_ED25519,
  },
  HuksKeyED25519Size256: {
    tag: Param.HksTag.HKS_TAG_KEY_SIZE,
    value: Param.HksKeySize.HKS_CURVE25519_KEY_SIZE_256,
  },
  HuksKeyED25519PurposeSIGN: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyED25519PurposeVERIFY: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value: Param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksKeyRSAPurposeSINGVERIFY: {
    tag: Param.HksTag.HKS_TAG_PURPOSE,
    value:
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN |
      Param.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagDigestSHA1: {
    tag: Param.HksTag.HKS_TAG_DIGEST,
    value: Param.HksKeyDigest.HKS_DIGEST_SHA1,
  },
};

export {
  HuksSignVerifyRSA,
  HuksSignVerifyDSA,
  HuksSignVerifyECC,
  HuksSignVerifyED25519,
};
