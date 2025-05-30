/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { buffer } from '@kit.ArkTS';
import * as symKeySyncUtils from './utils/syncSymKey/syncSymKeyUtils'
import * as signVerifySyncUtils from './utils/signVerify/signVerifySyncUtils';
import * as hkdfUtils from './utils/hkdf/hkdfUtils';

export default function SecurityCryptoFwErrCodeTestUnit() {
  describe('SecurityCryptoFwErrCodeTestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0100
     * @tc.name 传人损坏的私钥数据，convertKey返回17630001
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let pubKeyArray = new Uint8Array([48, 89, 48, 19, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 8, 42, 134, 72, 206, 61, 3, 1, 7, 3, 66, 0, 4, 83, 96, 142, 9, 86, 214, 126, 106, 247, 233, 92, 125, 4, 128, 138, 105, 246, 162, 215, 71, 81, 58, 202, 121, 26, 105, 211, 55, 130, 45, 236, 143, 55, 16, 248, 75, 167, 160, 167, 106, 2, 152, 243, 44, 68, 66, 0, 167, 99, 92, 235, 215, 159, 239, 28, 106, 124, 171, 34, 145, 124, 174, 57, 92]);
        let priKeyArray = new Uint8Array([32, 115, 56, 137, 35, 207, 0, 60, 191, 90, 61, 136, 105, 210, 16, 27, 4, 171, 57, 10, 61, 123, 40, 189, 28, 34, 207, 236, 22, 45, 223, 10, 189, 160, 10, 6, 8, 42, 134, 72, 206, 61, 3, 1, 7]);
        let pubKeyBlob: cryptoFramework.DataBlob = { data: pubKeyArray };
        let priKeyBlob: cryptoFramework.DataBlob = { data: priKeyArray };
        let asyKeyGenerator = cryptoFramework.createAsyKeyGenerator('ECC256');
        await asyKeyGenerator.convertKey(pubKeyBlob, priKeyBlob);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0100 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0200
     * @tc.name 传人损坏的私钥数据，convertKeySync返回17630001
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let pubKeyArray = new Uint8Array([48, 89, 48, 19, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 8, 42, 134, 72, 206, 61, 3, 1, 7, 3, 66, 0, 4, 83, 96, 142, 9, 86, 214, 126, 106, 247, 233, 92, 125, 4, 128, 138, 105, 246, 162, 215, 71, 81, 58, 202, 121, 26, 105, 211, 55, 130, 45, 236, 143, 55, 16, 248, 75, 167, 160, 167, 106, 2, 152, 243, 44, 68, 66, 0, 167, 99, 92, 235, 215, 159, 239, 28, 106, 124, 171, 34, 145, 124, 174, 57, 92]);
        let priKeyArray = new Uint8Array([32, 115, 56, 137, 35, 207, 0, 60, 191, 90, 61, 136, 105, 210, 16, 27, 4, 171, 57, 10, 61, 123, 40, 189, 28, 34, 207, 236, 22, 45, 223, 10, 189, 160, 10, 6, 8, 42, 134, 72, 206, 61, 3, 1, 7]);
        let pubKeyBlob: cryptoFramework.DataBlob = { data: pubKeyArray };
        let priKeyBlob: cryptoFramework.DataBlob = { data: priKeyArray };
        let generator = cryptoFramework.createAsyKeyGenerator('ECC256');
        generator.convertKeySync(pubKeyBlob, priKeyBlob);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0200 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0300
     * @tc.name convertKeySync返回401
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let generator = cryptoFramework.createAsyKeyGenerator('ECC256');
        generator.convertKeySync(null, null);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0300 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0400
     * @tc.name convertKey 中KeyBlob值为空；期望 返回401
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let arr = [];
      try {
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator('3DES192');
        let keyMaterialBlob = new Uint8Array(arr);
        let KeyBlob: cryptoFramework.DataBlob = { data: keyMaterialBlob };
        await symKeyGenerator.convertKey(KeyBlob);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0400 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0500
     * @tc.name convertKey 中KeyBlob值为空；期望 返回401
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let keyMessage = '';
        let keyBlob: cryptoFramework.DataBlob = {
          data : new Uint8Array(buffer.from(keyMessage, 'utf-8').buffer)
        }
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator('HMAC');
        let key = symKeyGenerator.convertKeySync(keyBlob);
        key.getEncoded();
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0500 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0600
     * @tc.name generateRandom返回17620001错误码
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let rand = cryptoFramework.createRandom();
        console.info("[createRandom success]");
        rand.generateRandom(2147483647, (err, randData) => {
          if (err) {
            console.error('[Callback] err: , errCode: ' + err.code + ', errMsg: ' + err.message);
          } else {
            console.info('[Callback]: generate random result: ' + randData.data);
          }
        });
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0600 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_OUT_OF_MEMORY);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_0900
     * @tc.name doFinalSync返回17630001
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let gcmParams = symKeySyncUtils.genGcmParamsSpec();
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator('AES128');
        let cipher = cryptoFramework.createCipher('AES128|CCM|PKCS7');
        let symKey = await symKeyGenerator.generateSymKey();
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, gcmParams);
        let message = "";
        let plainText: cryptoFramework.DataBlob = { data: new Uint8Array(buffer.from(message, 'utf-8').buffer) };
        cipher.updateSync(plainText);
        console.info("updateSync success");
        gcmParams.authTag = cipher.doFinalSync(plainText);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_0900 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1000
     * @tc.name updateSync为空数组
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let gcmParams = symKeySyncUtils.genGcmParamsSpec();
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator('AES128');
        let cipher = cryptoFramework.createCipher('AES128|CCM|PKCS7');
        let symKey = await symKeyGenerator.generateSymKey();
        let keyMaterialBlob = new Uint8Array([]);
        let plainText: cryptoFramework.DataBlob = { data: keyMaterialBlob };
        await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, gcmParams);
        cipher.updateSync(plainText);
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1000 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1100
     * @tc.name setCipherSpec返回801
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let cipher = cryptoFramework.createCipher('AES128|CCM|PKCS7');
        let pSource = new Uint8Array([1,2,3,4]);
        cipher.setCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR, pSource);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1100 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1200
     * @tc.name getCipherSpec 返回801
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let cipher = cryptoFramework.createCipher('AES128|CCM|PKCS7');
        cipher.getCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1200 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1300
     * @tc.name initSync 返回17630001
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "X25519";
        let signAlgName: string = "Ed25519";
        let keyPair = await signVerifySyncUtils.generateSignKey(algName);
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signAlgName);
        sign.initSync(keyPair.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1300 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1400
     * @tc.name priKey.getAsyKeySpec 返回 17630001
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let fieldFp: cryptoFramework.ECFieldFp = {
          fieldType: 'Fp',
          p: BigInt('0xffffffffffffffffffffffffffffffff000000000000000000000001')
        }
        let G: cryptoFramework.Point = {
          x: BigInt('02'),
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
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccCommonSpec); // 使用密钥参数对象创建生成器
        console.info("[createAsyKeyGeneratorBySpec success]");
        let keyPair = generatorBySpec.generateKeyPairSync();
        console.info("[generateKeyPairSync success]");
        let gX = keyPair.priKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
        expect(null).assertFail(); // length is 224, hex : b70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1400 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1500
     * @tc.name pubKey.getAsyKeySpec 返回 17630001
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let fieldFp: cryptoFramework.ECFieldFp = {
          fieldType: 'Fp',
          p: BigInt('0xffffffffffffffffffffffffffffffff000000000000000000000001')
        }
        let G: cryptoFramework.Point = {
          x: BigInt('02'),
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
        let generatorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(eccCommonSpec); // 使用密钥参数对象创建生成器
        console.info("[createAsyKeyGeneratorBySpec success]");
        let keyPair = generatorBySpec.generateKeyPairSync();
        console.info("[generateKeyPairSync success]");
        let gX = keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
        console.info('--- gX', gX);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_CryptoFramework_ErrCode_Func_1500 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1600
     * @tc.name hkdf 返回 801
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 0;
      let algName: string = "HMAC";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      let kdfAlgName: string = algName + "|SHA1|EXTRACT_AND_EXPAND";
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1700
     * @tc.name hkdf 返回 401
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let kdfAlgName: string = "HKDF" + "|SHA1|EXTRACT_AND_EXPAND";
      try {
        let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(kdfAlgName);
        let spec: cryptoFramework.HKDFSpec = {
          salt: new Uint8Array(),
          info: new Uint8Array(),
          key: "",
          keySize: 0,
          algName: 'HKDF'
        };
        kdf.generateSecretSync(spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1800
     * @tc.name ECCKeyUtil 返回 401
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let generator = cryptoFramework.createAsyKeyGenerator('ECC_BrainPoolP256r1');
        let keyPair = await generator.generateKeyPair();
        let eccPkX = keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN);
        let eccPkY = keyPair.pubKey.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN);
        console.info('ECC_PK_X_BN 16：' + eccPkX.toString(16));
        console.info('ECC_PK_Y_BN 16：' + eccPkY.toString(16));
        // 将eccPkX.toString(16)结果放入x，eccPkY.toString(16)结果放入y。
        let returnPoint: cryptoFramework.Point = {
          x: BigInt('0x1' + eccPkX.toString(16)),
          y: BigInt('0x1' + eccPkY.toString(16))
        };
        let returnData = cryptoFramework.ECCKeyUtil.getEncodedPoint('NID_brainpoolP258r1', returnPoint, 'UNCOMPRESSED');
        console.info('returnData: ' + returnData);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_1900
     * @tc.name ECCKeyUtil 返回 401
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let pkData = new Uint8Array([4]);
        let returnPoint = cryptoFramework.ECCKeyUtil.convertPoint('NID_brainpoolP257r1', pkData);
        console.info('returnPoint: ' + returnPoint.x.toString(16));
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_2000
     * @tc.name getEncoded判断是否返回801
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let generator = cryptoFramework.createSymKeyGenerator("AES128");
        let symKey = await generator.generateSymKey();
        symKey.getEncoded();
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_2100
     * @tc.name setSignSpec判断是否返回801
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let sign = cryptoFramework.createSign("RSA512|PKCS1|SHA1")
      let setN = 20;
      let setUint8Array = new Uint8Array([0x20]);
      try {
        sign.setSignSpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, setN);
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      try {
        sign.setSignSpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, setUint8Array);
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      try {
        sign.getSignSpec(cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM);
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ErrCode_Func_2200
     * @tc.name genECCCommonParamsSpec判断是否返回801
     * @tc.desc convertKey
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ErrCode_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec('NID_brainpoolP256r1');
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      try {
        cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(16);
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
        console.error(`N############### ${error}, error code: ${error.code}`);
      }
      try {
        cryptoFramework.createAsyKeyGeneratorBySpec({
          algName: "ECC521", specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC});
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      try {
        cryptoFramework.createKdf("HKDF");
      } catch (error) {
        if (error.code == cryptoFramework.Result.NOT_SUPPORT) {
          console.error(`Not Support ${error}, error code: ${error.code}`);
        }
      }
      done();
    });

  });
}