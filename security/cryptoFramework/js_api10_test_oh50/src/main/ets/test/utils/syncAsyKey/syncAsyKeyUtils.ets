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

function createAsyKeySync(algName: string): cryptoFramework.KeyPair {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = asyKeyGenerator.generateKeyPairSync();

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function convertAsyKeySync(algName: string, pubKeyData: cryptoFramework.DataBlob|null,
                           priKeyData: cryptoFramework.DataBlob|null): cryptoFramework.KeyPair {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = asyKeyGenerator.convertKeySync(pubKeyData, priKeyData);

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createAsyKeyPromise(algName: string): Promise<cryptoFramework.KeyPair> {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function convertAsyKeyPromise(algName: string, pubKeyData: cryptoFramework.DataBlob, priKeyData: cryptoFramework.DataBlob): Promise<cryptoFramework.KeyPair> {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = await  asyKeyGenerator.convertKey(pubKeyData, priKeyData);

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function genRsaPubKeySpec(nIn: bigint, eIn: bigint): cryptoFramework.RSAPubKeySpec {
  let rsaCommSpec: cryptoFramework.RSACommonParamsSpec = {
    n: nIn,
    algName: 'RSA',
    specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC
  };
  let rsaPubKeySpec: cryptoFramework.RSAPubKeySpec = {
    params: rsaCommSpec,
    pk: eIn,
    algName: 'RSA',
    specType: cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC
  };
  return rsaPubKeySpec;
}


function genRsa2048PubKeySpec() {
  let nIn = BigInt('0x9260d0750ae117eee55c3f3deaba74917521a262ee76007cdf8a56755ad73a1598a1408410a01434c3f5bc54a88b57fa19fc4328daea0750a4c44e88cff3b2382621b80f670464433e4336e6d003e8cd65bff211da144b88291c2259a00a72b711c116ef7686e8fee34e4d933c868187bdc26f7be071493c86f7a5941c3510806ad67b0f94d88f5cf5c02a092821d8626e8932b65c5bd8c92049c210932b7afa7ac59c0e886ae5c1edb00d8ce2c57633db26bd6639bff73cee82be9275c402b4cf2a4388da8cf8c64eefe1c5a0f5ab8057c39fa5c0589c3e253f0960332300f94bea44877b588e1edbde97cf2360727a09b775262d7ee552b3319b9266f05a25');
  let eIn = BigInt('0x010001');
  return genRsaPubKeySpec(nIn, eIn);
}

function compareRsaPubKeyBySpec(rsaKeySpec: cryptoFramework.RSAPubKeySpec, n: bigint | string | number, e: bigint | string | number) {
  if (typeof n === 'string' || typeof e === 'string') {
    console.error('type is string');
    return false;
  }
  if (typeof n === 'number' || typeof e === 'number') {
    console.error('type is number');
    return false;
  }
  if (rsaKeySpec.params.n != n) {
    return false;
  }
  if (rsaKeySpec.pk != e) {
    return false;
  }
  return true;
}

function genEccCommonSpec(): cryptoFramework.ECCCommonParamsSpec {
  let fieldFp: cryptoFramework.ECFieldFp = {
    fieldType: 'Fp',
    p: BigInt('0xffffffffffffffffffffffffffffffff000000000000000000000001')
  }
  let G: cryptoFramework.Point = {
    x: BigInt('0xb70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21'),
    y: BigInt('0xbd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34')
  }
  let eccCommonSpec: cryptoFramework.ECCCommonParamsSpec = {
    algName: 'ECC',
    specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt('0xfffffffffffffffffffffffffffffffefffffffffffffffffffffffe'),
    b: BigInt('0xb4050a850c04b3abf54132565044b0b7d7bfd8ba270b39432355ffb4'),
    g: G,
    n: BigInt('0xffffffffffffffffffffffffffff16a2e0b8f03e13dd29455c5c2a3d'),
    h: 1
  }
  return eccCommonSpec;
}

function genSM2KeyPairSpec() {
  let sm2CommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec('NID_sm2');
  let sm2KeyPairSpec: cryptoFramework.ECCKeyPairSpec = {
    algName: "SM2",
    specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
    params: sm2CommonParamsSpec,
    sk: BigInt('0x6330B599ECD23ABDC74B9A5B7B5E00E553005F72743101C5FAB83AEB579B7074'),
    pk: {
      x: BigInt('0x67F3B850BDC0BA5D3A29D8A0883C4B17612AB84F87F18E28F77D824A115C02C4'),
      y: BigInt('0xD48966CE754BBBEDD6501A1385E1B205C186E926ADED44287145E8897D4B2071')
    },
  };
  return sm2KeyPairSpec;
}

function showBigIntInfo(bnName: string, bnValue: bigint | string | number) {
  if (typeof bnValue === 'string') {
    console.error('type is string');
    return;
  }
  if (typeof bnValue === 'number') {
    console.error('type is number');
    return;
  }
  console.info(bnName + ':');
  console.info('. Decimal: ' + bnValue.toString());
  console.info('. Hexadecimal: ' + bnValue.toString(16));
  console.info('. Length (bits): ' + bnValue.toString(2).length);
}

function showEccSpecDetailInfo(key: cryptoFramework.PubKey | cryptoFramework.PriKey, keyType: string) {
  console.info('show detail of ' + keyType + ':');
  try {
    let p = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN);
    showBigIntInfo('--- p', p);
    let a = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_A_BN);
    showBigIntInfo('--- a', a);
    let b = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_B_BN);
    showBigIntInfo('--- b', b);
    let gX = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
    showBigIntInfo('--- gX', gX);
    let gY = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN);
    showBigIntInfo('--- gY', gY);
    let n = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_N_BN);
    showBigIntInfo('--- n', n);
    let h = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_H_NUM);
    console.warn('--- h: ' + h);
    let fieldType = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR);
    console.warn('--- field type: ' + fieldType);
    let fieldSize = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM);
    console.warn('--- field size: ' + fieldSize);
    let curveName = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
    console.warn('--- curve name: ' + curveName);
    if (keyType == 'priKey') {
      let sk = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_SK_BN);
      showBigIntInfo('--- sk', sk);
    } else if (keyType == 'pubKey') {
      let pkX = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN);
      showBigIntInfo('--- pkX', pkX);
      let pkY = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN);
      showBigIntInfo('--- pkY', pkY);
    }
  } catch (e) {
    console.error(`getAsyKeySpec failed, ${e.code}, ${e.message}`);
  }
}

function genEccPriKeySpec(xIn: bigint, yIn: bigint, aIn: bigint, bIn: bigint, pIn: bigint,
                          nIn: bigint, hIn: number, skIn: bigint): cryptoFramework.ECCPriKeySpec {
  let field: cryptoFramework.ECFieldFp = {
    fieldType: "Fp",
    p: pIn
  };
  let g: cryptoFramework.Point = {
    x: xIn,
    y: yIn
  };
  let params: cryptoFramework.ECCCommonParamsSpec = {
    field: field,
    a: aIn,
    b: bIn,
    g: g,
    n: nIn,
    h: hIn,
    algName: "ECC",
    specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC
  };

  let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = {
    params: params,
    sk: skIn,
    algName: "ECC",
    specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC
  }

  return eccPriKeySpec;
}

let ASY_RSA_KEY_SPEC = [
  [["RSA512"], ["PRIMES_2"]],
  [["RSA768"], ["PRIMES_2"]],
  [["RSA1024"], ["PRIMES_2", "PRIMES_3"]],
]

let ASY_ECC_KEY_SPEC = [
  "ECC224", "ECC256", "ECC384", "ECC521", "ECC_BrainPoolP160r1", "ECC_BrainPoolP160t1",
  "ECC_BrainPoolP192r1", "ECC_BrainPoolP192t1", "ECC_BrainPoolP224r1", "ECC_BrainPoolP224t1",
  "ECC_BrainPoolP256r1", "ECC_BrainPoolP256t1", "ECC_BrainPoolP320r1", "ECC_BrainPoolP320t1",
  "ECC_BrainPoolP384r1", "ECC_BrainPoolP384t1", "ECC_BrainPoolP512r1", "ECC_BrainPoolP512t1",
]

let ASY_DSA_KEY_SPEC = [
  "DSA1024", "DSA2048"
]

let ASY_SM2_KEY_SPEC = [
  "SM2_256"
]

let ASY_25519_KEY_SPEC = [
  "Ed25519", "X25519"
]

let ASY_DH_KEY_SPEC = [
  "DH_modp1536", "DH_modp2048", "DH_modp3072", "DH_modp4096",
  "DH_modp6144", "DH_modp8192", "DH_ffdhe2048", "DH_ffdhe3072",
  "DH_ffdhe4096", "DH_ffdhe6144", "DH_ffdhe8192"
]

export {
  createAsyKeySync,
  convertAsyKeySync,
  createAsyKeyPromise,
  convertAsyKeyPromise,
  genSM2KeyPairSpec,
  genRsa2048PubKeySpec,
  compareRsaPubKeyBySpec,
  genEccCommonSpec,
  genEccPriKeySpec,
  showEccSpecDetailInfo,
  ASY_RSA_KEY_SPEC,
  ASY_ECC_KEY_SPEC,
  ASY_DSA_KEY_SPEC,
  ASY_SM2_KEY_SPEC,
  ASY_25519_KEY_SPEC,
  ASY_DH_KEY_SPEC
}