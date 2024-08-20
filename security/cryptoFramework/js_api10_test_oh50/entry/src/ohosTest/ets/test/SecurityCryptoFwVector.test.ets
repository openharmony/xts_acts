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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtils from './utils/common/commonUtils';
import * as v from './utils/vectors/vectors';


export default function SecurityCryptoFwVectorTestUnit() {
  describe('SecurityCryptoFwVectorTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0100
     * @tc.name Test digest algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is digest
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0100", 0, async (done: Function) => {
      try {
        let digestVectors: v.mdVectorData[] = v.digestVectors;
        for (let vector of digestVectors) {
          let algName: string = vector.algName;
          for (let data of vector.mdVectorSpec) {
            let plainUint8Array = commonUtils.stringToUint8Array(data.plainText);
            let plainText: cryptoFramework.DataBlob = v.uint8ArrayToDataBlob(plainUint8Array);
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            await md.update(plainText);
            let digest: cryptoFramework.DataBlob = await md.digest();
            let expectDigest: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.expectDigest);
            let ret: boolean = commonUtils.compareDataBlob(digest, expectDigest);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0200
     * @tc.name Test Hmac algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is Hmac
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0200", 0, async (done: Function) => {
      try {
        let hmacVectors: v.macVectorData[] = v.hmacVectors;
        for (let vector of hmacVectors) {
          let algName: string = vector.algName;
          for (let data of vector.macVectorSpec) {
            let plainUint8Array = commonUtils.stringToUint8Array(data.plainText);
            let plainText: cryptoFramework.DataBlob = v.uint8ArrayToDataBlob(plainUint8Array);
            let symKey: cryptoFramework.SymKey = await v.convertSymKey(vector.macAlgName, data);
            let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
            await mac.init(symKey);
            await mac.update(plainText);
            let digest: cryptoFramework.DataBlob = await mac.doFinal();
            let expectMac: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.expectMac);
            let ret: boolean = commonUtils.compareDataBlob(digest, expectMac);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0300
     * @tc.name Test pbkdf2 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is pbkdf2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0300", 0, async (done: Function) => {
      try {
        let pbkdf2Vectors: v.pbkdf2VectorData[] = v.pbkdf2Vectors;
        for (let vector of pbkdf2Vectors) {
          let digestAlgName: string = vector.algName;
          let kdfAlgName: string = vector.kdfAlgName;
          for (let data of vector.kdfVectorSpec) {
            let password: number[] = data.password;
            let salt: number[] = data.salt;
            let iterations: number = data.iterations;
            let keySize: number = data.keySize;
            let kdfSpec: cryptoFramework.PBKDF2Spec = v.getKdfSpec(password, salt, iterations, keySize);
            let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName + "|" + digestAlgName);
            let secret: cryptoFramework.DataBlob = await kdf.generateSecret(kdfSpec);

            let expectKdf: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.expectKdf);
            let ret: boolean = commonUtils.compareDataBlob(secret, expectKdf);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_VectorTest_Func_0400
     * @tc.name Test hkdf algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is hkdf
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("SUB_Security_CryptoFramework_VectorTest_Func_0400", 0, async (done: Function) => {
      try {
        let hkdfVectors: v.hkdfVectorData[] = v.hkdfVectors;
        for (let vector of hkdfVectors) {
          let digestAlgName: string = vector.algName;
          let kdfAlgName: string = vector.kdfAlgName;
          for (let data of vector.kdfVectorSpec) {
            let key: number[] = data.key;
            let salt: number[] = data.salt;
            let info: number[] = data.info;
            let keySize: number = data.keySize;
            let kdfSpec: cryptoFramework.HKDFSpec = v.getHkdfSpec(key, salt, info, keySize);
            let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName + "|" + digestAlgName);
            let secret: cryptoFramework.DataBlob = await kdf.generateSecret(kdfSpec);

            let expectKdf: cryptoFramework.DataBlob = v.numberArrayToDataBlob(data.expectKdf);
            let ret: boolean = commonUtils.compareDataBlob(secret, expectKdf);
            expect(ret).assertTrue();
          }
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}