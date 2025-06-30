import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import  buffer  from '@ohos.buffer';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtils from './utils/common/commonUtils';
import * as hkdfUtils from './utils/hkdf/hkdfUtils';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwHkdfTestUnit() {
  describe("SecurityCryptoFwHkdfTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0100
     * @tc.name Test HKDF derived algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let algName: string = "HKDF";
      try {
        for (let mdName of hkdfUtils.HKDF_DIGEST_SPEC) {
          for ( let modeName of hkdfUtils.HKDF_MODE_SPEC) {
            let keySize: int = 128;
            let mdInfo: hkdfUtils.mdData = hkdfUtils.getMdLen(mdName, modeName);
            keySize = mdInfo.isExtract ? mdInfo.mdSize : keySize;
            let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
            let kdfAlgName: string = algName + "|" + mdName;
            if (modeName) {
              kdfAlgName = kdfAlgName + "|" + modeName;
            }
            let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfCallback(kdfAlgName, spec);
            expect(secret.data.length).assertEqual(keySize);
          }
        }
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0200
     * @tc.name Test HKDF derived algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let algName: string = "HKDF";
      try {
        for (let mdName of hkdfUtils.HKDF_DIGEST_SPEC) {
          for ( let modeName of hkdfUtils.HKDF_MODE_SPEC) {
            let keySize: int = 128;
            let mdInfo: hkdfUtils.mdData = hkdfUtils.getMdLen(mdName, modeName);
            keySize = mdInfo.isExtract ? mdInfo.mdSize : keySize;
            let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
            let kdfAlgName: string = algName + "|" + mdName;
            if (modeName) {
              kdfAlgName = kdfAlgName + "|" + modeName;
            }
            let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
            expect(secret.data.length).assertEqual(keySize);
          }
        }
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0300
     * @tc.name Test HKDF algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let algName: string = "HKDF";
      try {
        for (let mdName of hkdfUtils.HKDF_DIGEST_SPEC) {
          for ( let modeName of hkdfUtils.HKDF_MODE_SPEC) {
            let keySize: int = 128;
            let mdInfo: hkdfUtils.mdData = hkdfUtils.getMdLen(mdName, modeName);
            keySize = mdInfo.isExtract ? mdInfo.mdSize : keySize;
            let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
            let kdfAlgName: string = algName + "|" + mdName;
            if (modeName) {
              kdfAlgName = kdfAlgName + "|" + modeName;
            }
            let secret: cryptoFramework.DataBlob = hkdfUtils.hkdfSync(kdfAlgName, spec);
            expect(secret.data.length).assertEqual(keySize);
          }
        }
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0400
     * @tc.name Test HKDF derived algorithm traversal test, keySize = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 0;
      let algName: string = "HKDF";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      let kdfAlgName: string = algName + "|SHA1|EXTRACT_AND_EXPAND";
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0500
     * @tc.name Test HKDF derived algorithm traversal test, keySize = 1. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 1;
      let kdfAlgName: string = "HKDF|SHA256|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0600
     * @tc.name Test HKDF derived algorithm traversal test, keySize = 31. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 31;
      let kdfAlgName: string = "HKDF|SHA256|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0700
     * @tc.name Test HKDF derived algorithm traversal test, keySize = 33. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 65;
      let kdfAlgName: string = "HKDF|SHA512|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfCallback(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0800
     * @tc.name Test HKDF derived algorithm traversal test, keySize = mdSize * 255 + 1. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 28 * 255 + 1;
      let kdfAlgName: string = "HKDF|SHA224|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfCallback(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0900
     * @tc.name Test HKDF derived algorithm traversal test, keySize = mdSize * 255 + 1. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 48 * 255 + 1;
      let kdfAlgName: string = "HKDF|SHA384|EXPAND_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1000
     * @tc.name Test HKDF derived algorithm traversal test, keySize = mdSize * 255 + 1. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 64 * 255 + 1;
      let kdfAlgName: string = "HKDF|SHA512";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1100
     * @tc.name Test HKDF derived algorithm traversal test, saltLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "";
      let info: string = "kdf test";
      let keySize: int = 128;
      let kdfAlgName: string = "HKDF|SHA224|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1200
     * @tc.name Test HKDF derived algorithm traversal test, keyLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 128;
      let kdfAlgName: string = "HKDF|SHA256|EXPAND_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1300
     * @tc.name Test HKDF derived algorithm traversal test, keyLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 64;
      let kdfAlgName: string = "HKDF|SHA512|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1400
     * @tc.name Test HKDF derived algorithm traversal test, keyLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: int = 128;
      let kdfAlgName: string = "HKDF|SHA256|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1500
     * @tc.name Test HKDF derived algorithm traversal test, infoLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "";
      let keySize: int = 128;
      let kdfAlgName: string = "HKDF|SHA256|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1600
     * @tc.name Test HKDF derived algorithm traversal test, infoLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "";
      let keySize: int = 32;
      let kdfAlgName: string = "HKDF|SHA256|EXPAND_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1700
     * @tc.name Test HKDF derived algorithm traversal test, saltLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "";
      let info: string = "0123456789";
      let keySize: int = 20;
      let kdfAlgName: string = "HKDF|SHA1|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1800
     * @tc.name Test HKDF derived algorithm traversal test, saltLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "";
      let info: string = "0123456789";
      let keySize: int = 128;
      let kdfAlgName: string = "HKDF|SHA1|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1900
     * @tc.name Test HKDF derived algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let kdfAlgName: string = "HKDF|MD5";
        cryptoFramework.createKdf(kdfAlgName);
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_2000
     * @tc.name Test HKDF derived algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let kdfAlgName: string = "SCRYPT|SHA256";
        cryptoFramework.createKdf(kdfAlgName);
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_2100
     * @tc.name Test HKDF derived algorithm traversal test, KAT. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let vectors of hkdfUtils.KAT_VECTOR_DATA) {
          let key = vectors.key;
          let salt = vectors.salt;
          let info = vectors.info;
          let keySize = vectors.keySize;
          let expectSecret = vectors.expectSecret;
          let hashName = vectors.hashName;
          let spec: cryptoFramework.HKDFSpec = {
            algName: "HKDF",
            key: new Uint8Array(key),
            salt: new Uint8Array(salt),
            info: new Uint8Array(info),
            keySize: keySize
          };
          let kdfAlgName: string = "HKDF|" + hashName + "|EXTRACT_AND_EXPAND";
          let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
          let hexSecret: string = commonUtils.decToHexString(secret);
          let hkdfSecret: number[] = commonUtils.convertToUint8Array(hexSecret);
          let ret: boolean = commonUtils.compareNumber(hkdfSecret, expectSecret);
          expect(ret).assertTrue();
          expect(secret.data.length).assertEqual(keySize);
        }
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_2200
     * @tc.name Test HKDF derived algorithm traversal test, KAT. Callback style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let vectors of hkdfUtils.KAT_VECTOR_DATA) {
          let key = vectors.key;
          let salt = vectors.salt;
          let info = vectors.info;
          let keySize = vectors.keySize;
          let expectSecret = vectors.expectSecret;
          let hashName = vectors.hashName;
          let spec: cryptoFramework.HKDFSpec = {
            algName: "HKDF",
            key: new Uint8Array(key),
            salt: new Uint8Array(salt),
            info: new Uint8Array(info),
            keySize: keySize
          };
          let kdfAlgName: string = "HKDF|" + hashName + "|EXTRACT_AND_EXPAND";
          let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfCallback(kdfAlgName, spec);
          let hexSecret: string = commonUtils.decToHexString(secret);
          let hkdfSecret: number[] = commonUtils.convertToUint8Array(hexSecret);
          let ret: boolean = commonUtils.compareNumber(hkdfSecret, expectSecret);
          expect(ret).assertTrue();
          expect(secret.data.length).assertEqual(keySize);
        }
      } catch (error: BusinessError) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
  });
}