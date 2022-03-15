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

import hks from '@ohos.security.huks'

export var alias = 'alias';
export var aliasEmpty = '';
export var aliasTooLong = '01234567890123456789012345678901234567890123456789012345678901234';
export var aliasCritical = '0123456789012345678901234567890123456789012345678901234567890123';
export var aliasNotExist = 'aliasNotExist';
export var emptyOption = makeEmptyOption();
export var plainTextSize64 = makeRandomArr(64);
export var plainTextSize16 = makeRandomArr(16);
export var plainTextSize8 = makeRandomArr(8);
export var invalidValue = 99999;

export var generateAesCBCKeyOption = makeGenerateKeyOption(
  hks.HksKeyAlg.HKS_ALG_AES,
  hks.HksKeySize.HKS_AES_KEY_SIZE_128,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  hks.HksCipherMode.HKS_MODE_CBC,
  null
);

export var generateAesGCMKeyOption = makeGenerateKeyOption(
  hks.HksKeyAlg.HKS_ALG_AES,
  hks.HksKeySize.HKS_AES_KEY_SIZE_128,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  hks.HksCipherMode.HKS_MODE_GCM,
  null
);

export var generateRSAKeyOption = makeGenerateKeyOption(
  hks.HksKeyAlg.HKS_ALG_RSA,
  hks.HksKeySize.HKS_RSA_KEY_SIZE_512,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | hks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  hks.HksKeyPadding.HKS_PADDING_PKCS1_V1_5,
  null,
  hks.HksKeyDigest.HKS_DIGEST_SHA1
);

export var generateECCKeyOption = makeGenerateKeyOption(
  hks.HksKeyAlg.HKS_ALG_ECC,
  hks.HksKeySize.HKS_ECC_KEY_SIZE_224,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
  null,
  null,
  hks.HksKeyDigest.HKS_DIGEST_NONE
);

export var generateMACKeyOption = makeGenerateKeyOption(
  hks.HksKeyAlg.HKS_ALG_HMAC,
  160,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  null,
  null,
  hks.HksKeyDigest.HKS_DIGEST_SHA1
);

export function makeEmptyOption() {
  var emptyOptions = {
    properties: []
  };
  return emptyOptions;
};

export function makeRandomArr(size) {
  var arr = new Uint8Array(size);
  for (var i = 0; i < size; i++) {
    arr[i] = Math.floor(Math.random() * 10);
  }
  return arr;
};

function makeAlgTag(alg){
  var tag = {
    tag: hks.HksTag.HKS_TAG_ALGORITHM,
    value: alg
  };
  return tag;
};

function makeSizeTag(size){
  var tag = {
    tag: hks.HksTag.HKS_TAG_KEY_SIZE,
    value: size
  };
  return tag;
};

function makePurposeTag(purpose){
  var tag = {
    tag: hks.HksTag.HKS_TAG_PURPOSE,
    value: purpose
  };
  return tag;
};

function makePaddingTag(padding){
  var tag = {
    tag: hks.HksTag.HKS_TAG_PADDING,
    value: padding
  };
  return tag;
};

function makeDigestTag(digest){
  var tag = {
    tag: hks.HksTag.HKS_TAG_DIGEST,
    value: digest
  };
  return tag;
};

function makeModeTag(mode){
  var tag = {
    tag: hks.HksTag.HKS_TAG_BLOCK_MODE,
    value: mode
  };
  return tag;
};

export function makeGenerateKeyOption(alg, size, purpose, padding, mode, digest) {
  var properties = new Array();
  properties[0] = makeAlgTag(alg);
  properties[1] = makeSizeTag(size);
  properties[2] = makePurposeTag(purpose);
  if (purpose == (hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT)) {
    properties[3] = makePaddingTag(padding);
    properties[4] = makeModeTag(mode);
  } else if (purpose == (hks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | hks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY)) {
    properties[3] = makePaddingTag(padding);
    properties[4] = makeDigestTag(digest);
  } else {
    properties[3] = makeDigestTag(digest);
  }
  var option = {
    properties: properties
  };
  return option;
};

export function makeEncryptAndDecryptOption(mode){
  var properties = new Array();
  properties[0] = makeAlgTag(hks.HksKeyAlg.HKS_ALG_AES);
  properties[1] = makePurposeTag(hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT);
  properties[2] = makeModeTag(mode);
  properties[3] = makePaddingTag(hks.HksKeyPadding.HKS_PADDING_NONE);
  if (mode == hks.HksCipherMode.HKS_MODE_CBC) {
    properties[4] = {
      tag: hks.HksTag.HKS_TAG_IV,
      value: new Uint8Array(16)
    };
  } else {
    properties[4] = {
      tag: hks.HksTag.HKS_TAG_NONCE,
      value: new Uint8Array(16)
    };
    properties[5] = {
      tag: hks.HksTag.HKS_TAG_ASSOCIATED_DATA,
      value: new Uint8Array(16)
    };
  }
  var option = {
    properties: properties,
    inData: plainTextSize64
  };
  return option;
};

export function makeSignVerifyAndImportOption(text){
  var properties = new Array();
  properties[0] = makeAlgTag(hks.HksKeyAlg.HKS_ALG_RSA);
  properties[1] = makePurposeTag(hks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | hks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY);
  properties[2] = makePaddingTag(hks.HksKeyPadding.HKS_PADDING_NONE);
  properties[3] = makeDigestTag(hks.HksKeyDigest.HKS_DIGEST_SHA1);
  var option = {
    properties: properties,
    inData: text
  };
  return option;
};

export function makeAgreeOption() {
  var properties = new Array();
  properties[0] = makeAlgTag(hks.HksKeyAlg.HKS_ALG_ECDH);
  properties[1] = makeSizeTag(hks.HksKeySize.HKS_ECC_KEY_SIZE_224);
  var options = {
    properties: properties,
    inData: new Uint8Array(76)
  };
  return options;
};

export function makeMacOption() {
  var properties = new Array();
  properties[0] = {
    tag: hks.HksTag.HKS_TAG_PURPOSE,
    value: hks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC
  };
  properties[1] = {
    tag: hks.HksTag.HKS_TAG_DIGEST,
    value: hks.HksKeyDigest.HKS_DIGEST_SHA1
  };
  var options = {
    properties: properties,
    inData: plainTextSize16
  };
  return options;
};
