/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import cryptoFramework from '@ohos.security.cryptoFramework';

function genGcmOrCcmParamsSpec(iv: number[], aad: number[], tag: number[], algName: string): cryptoFramework.GcmParamsSpec {
  let dataIv = new Uint8Array(iv);
  let ivBlob: cryptoFramework.DataBlob = { data: dataIv };
  let dataAad = new Uint8Array(aad);
  let aadBlob: cryptoFramework.DataBlob = { data: dataAad };
  let dataTag = new Uint8Array(tag);
  let tagBlob: cryptoFramework.DataBlob = { data: dataTag };
  let gcmParamsSpec: cryptoFramework.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: algName
  };
  return gcmParamsSpec;
}

function genIvParamsSpec(iv: number[]) {
  let dataIv = new Uint8Array(iv);
  let ivBlob: cryptoFramework.DataBlob = { data: dataIv };
  let ivParamsSpec: cryptoFramework.IvParamsSpec = {
    algName: "IvParamsSpec",
    iv: ivBlob
  };
  return ivParamsSpec;
}

interface dataSpec {
  data: cryptoFramework.DataBlob;
  paramSpec: cryptoFramework.IvParamsSpec
}

interface dataGcmOrCCMSpec {
  data: cryptoFramework.DataBlob;
  paramSpec: cryptoFramework.GcmParamsSpec|cryptoFramework.CcmParamsSpec
}

function tagEncryptDecryptMessageSync(algName: string, isEnc: boolean, symKey: cryptoFramework.SymKey, data: cryptoFramework.DataBlob,
                                   paramsSpec: cryptoFramework.GcmParamsSpec|cryptoFramework.CcmParamsSpec): dataGcmOrCCMSpec {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramsSpec);
    }
    let updateOutput = cipher.updateSync(data);
    if (isEnc) {
      let authTag = cipher.doFinalSync(null);
      paramsSpec.authTag = authTag;
    }
    return {data:updateOutput, paramSpec:paramsSpec};
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function encryptDecryptMessageSync(algName: string, isEnc: boolean, symKey: cryptoFramework.SymKey, data: cryptoFramework.DataBlob,
                                    paramsSpec: cryptoFramework.IvParamsSpec): dataSpec {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramsSpec);
    }
    let updateOutput = cipher.doFinalSync(data);
    return {data:updateOutput, paramSpec:paramsSpec};
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function createSymKeySync(algName: string): cryptoFramework.SymKey {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = symKeyGenerator.generateSymKeySync();

    return syncSymKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createAsymKeySync(algName: string): Promise<cryptoFramework.KeyPair> {
  try {
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
    let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();

    return keyPair;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function encryptDecryptAsymMessageSync(algName: string, keyPair: cryptoFramework.KeyPair, data: cryptoFramework.DataBlob, isEnc: Boolean) {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null);
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.priKey, null);
    }
    let encryptCipher = cipher.doFinalSync(data);

    return encryptCipher;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function encryptDecryptAsymOAaepMessageSync(algName: string, keyPair: cryptoFramework.KeyPair, data: cryptoFramework.DataBlob, isEnc: Boolean) {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null)
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.priKey, null)
    }
    let pSource = new Uint8Array([1, 2, 3, 4]);
    cipher.setCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR, pSource);
    let encryptCipher = cipher.doFinalSync(data);

    return encryptCipher;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

let STREAM_CIPHER_SPEC = [
  [["AES"], ["ECB", "CBC"], ["0", "128", "192", "256"], ["NoPadding"]],
  [["3DES"], ["ECB", "CBC"], ["0", "192"], ["NoPadding"]],
  [["SM4"], ["ECB", "CBC"], ["0", "128"], ["NoPadding"]],
]

let MODE_OFB_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["3DES"], ["0", "192"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_GCM_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_CCM_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_CFB_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["3DES"], ["0", "192"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_CFB128_CIPHER_SEPC = [
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_ECB_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7"]],
  [["3DES"], ["0", "192"], ["PKCS5", "PKCS7"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7"]],
]

let MODE_CBC_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7"]],
  [["3DES"], ["0", "192"], ["PKCS5", "PKCS7"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7"]],
]

let MODE_CTR_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let ASY_CIPHER_SPEC = [
  [["RSA512"], ["NoPadding", "PKCS1"], ["64", "53"]],
  [["RSA768"], ["NoPadding", "PKCS1"], ["96", "85"]],
  [["RSA1024"], ["NoPadding", "PKCS1"], ["128", "117"]],
  [["RSA"], ["NoPadding", "PKCS1"], ["256", "245"]],
];

let ASY_CIPHER_OAEP_SPEC = [
  [["RSA512"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_MD5"], ["30"]],
  [["RSA512"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_SHA1"], ["22"]],
  [["RSA512"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_SHA224"], ["6"]],

  [["RSA768"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_SHA256"], ["62"]],
  [["RSA768"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_SHA384"], ["54"]],
  [["RSA768"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_SHA512"], ["38"]],
  [["RSA768"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5"], ["30"]],

  [["RSA1024"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_SHA1"], ["94"]],
  [["RSA1024"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_SHA224"], ["86"]],
  [["RSA1024"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_SHA256"], ["70"]],
  [["RSA1024"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_SHA384"], ["62"]],
  [["RSA1024"], ["PKCS1_OAEP"], ["SHA384"], ["MGF1_SHA512"], ["30"]],
]

let ASY_RSA3072_CIPHER_OAEP_SPEC = [
  [["RSA3072"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_SHA256"], ["318"]],
]

let ASY_RSA4096_CIPHER_OAEP_SPEC = [
  [["RSA4096"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5"], ["446"]],
]

let ASY_SM2_CIPHER_OAEP_SPEC = [
  [["SM2_256"], ["SHA256"]],
  [["SM2"], ["SM3"]]
]

export {
  genGcmOrCcmParamsSpec,
  genIvParamsSpec,
  createSymKeySync,
  createAsymKeySync,
  encryptDecryptMessageSync,
  tagEncryptDecryptMessageSync,
  dataSpec,
  dataGcmOrCCMSpec,
  encryptDecryptAsymMessageSync,
  encryptDecryptAsymOAaepMessageSync,
  ASY_CIPHER_SPEC,
  ASY_CIPHER_OAEP_SPEC,
  ASY_RSA3072_CIPHER_OAEP_SPEC,
  ASY_RSA4096_CIPHER_OAEP_SPEC,
  ASY_SM2_CIPHER_OAEP_SPEC,
  STREAM_CIPHER_SPEC,
  MODE_ECB_CIPHER_SEPC,
  MODE_CBC_CIPHER_SEPC,
  MODE_CTR_CIPHER_SEPC,
  MODE_OFB_CIPHER_SEPC,
  MODE_CFB_CIPHER_SEPC,
  MODE_CFB128_CIPHER_SEPC,
  MODE_GCM_CIPHER_SEPC,
  MODE_CCM_CIPHER_SEPC
}