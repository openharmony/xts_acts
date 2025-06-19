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
import * as pbkdf2Utils from './utils/pbkdf2/pbkdf2Utils';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwPbkdf2TestUnit() {
  describe("SecurityCryptoFwPbkdf2TestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          // let str1:string = abilitys.context.filesDir
          // hilog.info(domain, tag, '%{public}s', 'beforeAll fileDir' + str1);
          // if (abilitys.context) {
          //     hilog.info(domain, tag, '%{public}s', 'beforeAll context');
          //     if (abilitys.context.resourceManager) {}
          // }
          // abilityss.context.terminateSelf()
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError) : void => {
        if (err != null ) {
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.helloworld")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0100
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 128;
      let iterations: int = 10000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(secret.data.byteLength).assertEqual(keySize);
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0200
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 0;
      let iterations: int = 10000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(null).assertFail();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0201
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 1;
      let iterations: int = 10000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(secret.data.byteLength).assertEqual(keySize);
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0300
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "";
      let keySize: int = 16;
      let iterations: int = 20000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(secret.data.byteLength).assertEqual(keySize);
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0400
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 16;
      let iterations: int = 20000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(secret.data.byteLength).assertEqual(keySize);
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0500
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 16;
      let iterations: int = 0;
      let algName: string = "PBKDF2|SHA256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        pbkdf2Utils.generateKdfKey(algName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0501
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 16;
      let iterations: int = 1;
      let algName: string = "PBKDF2|SHA256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(algName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error: BusinessError) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0502
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0502", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 16;
      let iterations: int = -1;
      let algName: string = "PBKDF2|SHA256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        pbkdf2Utils.generateKdfKey(algName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0600
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 16;
      let iterations: int = 10000;
      let algName: string = "PBKDF2|SHA3-256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        pbkdf2Utils.generateKdfKey(algName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0700
     * @tc.name Test PBKDF2 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: int = 16;
      let iterations: int = 10000;
      let algName: string = "SCRYPT|SHA256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        pbkdf2Utils.generateKdfKey(algName, spec);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });


  });
}