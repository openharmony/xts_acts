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
import cryptoFramework from '@ohos.security.cryptoFramework'

interface dataKeyPair {
  dataPubKey: cryptoFramework.DataBlob;
  dataPriKey: cryptoFramework.DataBlob
}

interface dataStyle {
  dataPubKey: string;
  dataPriKey: string
}

async function generateRfc5915KeyPair(algName: string): Promise<cryptoFramework.KeyPair> {
  try {
    let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();

    return keyPair;
  } catch (error) {
    console.error(`generateRfc5915KeyPair “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function generateRfc5915KeyPairEncoded(algName: string): Promise<dataKeyPair> {
  try {
    let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
    let convertPubKey: cryptoFramework.DataBlob = keyPair.pubKey.getEncoded();
    let convertPriKey: cryptoFramework.DataBlob = keyPair.priKey.getEncoded();

    return {dataPubKey: convertPubKey, dataPriKey: convertPriKey};
  } catch (error) {
    console.error(`generateRfc5915KeyPairEncoded “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function convertDataKeyPairToKeyPair(algName: string, data: dataKeyPair): Promise<cryptoFramework.KeyPair> {
  try {
    let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = await cipher.convertKey(data.dataPubKey, data.dataPriKey);

    return keyPair;
  } catch (error) {
    console.error(`convertDataKeyPairToKeyPair “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function generateRfc5208KeyPair(algName: string, dataKeyPair: dataKeyPair) {
  try {
    let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = await cipher.convertKey(dataKeyPair.dataPubKey, dataKeyPair.dataPriKey);

    return keyPair;
  } catch (error) {
    console.error(`generateRfc5208KeyPair “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function generatePriKeyDerData(keyPair: cryptoFramework.KeyPair): cryptoFramework.DataBlob {
  try {
    let dataPriKey = keyPair.priKey.getEncodedDer("PKCS8");

    return dataPriKey;
  } catch (error) {
    console.error(`generateDerData “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

let ASY_ECC_KEY_SPEC = [
  "ECC224", "ECC256", "ECC384", "ECC521", "ECC_BrainPoolP160r1", "ECC_BrainPoolP160t1",
  "ECC_BrainPoolP192r1", "ECC_BrainPoolP192t1", "ECC_BrainPoolP224r1", "ECC_BrainPoolP224t1",
  "ECC_BrainPoolP256r1", "ECC_BrainPoolP256t1", "ECC_BrainPoolP320r1", "ECC_BrainPoolP320t1",
  "ECC_BrainPoolP384r1", "ECC_BrainPoolP384t1", "ECC_BrainPoolP512r1", "ECC_BrainPoolP512t1",
]

export {
  generateRfc5915KeyPair,
  generateRfc5915KeyPairEncoded,
  convertDataKeyPairToKeyPair,
  generateRfc5208KeyPair,
  generatePriKeyDerData,
  dataKeyPair,
  dataStyle,
  ASY_ECC_KEY_SPEC
}