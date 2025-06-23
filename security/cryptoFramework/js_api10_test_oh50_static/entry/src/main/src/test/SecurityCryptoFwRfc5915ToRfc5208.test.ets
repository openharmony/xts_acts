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
import * as pkcs8Utils from './utils/pkcs8/pkcs8Utils';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwECCRfc5208TestUnit() {
  describe("SecurityCryptoFwECCRfc5208TestUnit", (): void => {
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
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0100
     * @tc.name Test ECC RFC5915 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let algName of pkcs8Utils.ASY_ECC_KEY_SPEC_1) {
          let dataKeyPair: pkcs8Utils.dataKeyPair = await pkcs8Utils.generateRfc5915KeyPairEncoded(algName);
          let keyPair: cryptoFramework.KeyPair = await pkcs8Utils.convertDataKeyPairToKeyPair(algName, dataKeyPair);
          pkcs8Utils.generatePriKeyDerData(keyPair);
          expect(null).assertNull();
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0200
     * @tc.name Test ECC RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let algName of pkcs8Utils.ASY_ECC_KEY_SPEC_1) {
          let keyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5915KeyPair(algName);
          let dataDerKeyPair: cryptoFramework.DataBlob = pkcs8Utils.generatePriKeyDerData(keyPair);
          let convertRFC5208KeyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5208KeyPair(algName,
            {dataPubKey:keyPair.pubKey.getEncoded(), dataPriKey: dataDerKeyPair});
          let convertPubKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.pubKey.getEncoded();
          let convertPriKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.priKey.getEncoded();
          await pkcs8Utils.convertDataKeyPairToKeyPair(algName, {
            dataPriKey: convertPriKey, dataPubKey: convertPubKey
          });
          expect(null).assertNull();
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0201
     * @tc.name Test ECC RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let algName of pkcs8Utils.ASY_ECC_KEY_SPEC_2) {
          let keyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5915KeyPair(algName);
          let dataDerKeyPair: cryptoFramework.DataBlob = pkcs8Utils.generatePriKeyDerData(keyPair);
          let convertRFC5208KeyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5208KeyPair(algName,
            {dataPubKey:keyPair.pubKey.getEncoded(), dataPriKey: dataDerKeyPair});
          let convertPubKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.pubKey.getEncoded();
          let convertPriKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.priKey.getEncoded();
          await pkcs8Utils.convertDataKeyPairToKeyPair(algName, {
            dataPriKey: convertPriKey, dataPubKey: convertPubKey
          });
          expect(null).assertNull();
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0202
     * @tc.name Test ECC RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is ECC
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let algName of pkcs8Utils.ASY_ECC_KEY_SPEC_3) {
          let keyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5915KeyPair(algName);
          let dataDerKeyPair: cryptoFramework.DataBlob = pkcs8Utils.generatePriKeyDerData(keyPair);
          let convertRFC5208KeyPair: cryptoFramework.KeyPair = await pkcs8Utils.generateRfc5208KeyPair(algName,
            {dataPubKey:keyPair.pubKey.getEncoded(), dataPriKey: dataDerKeyPair});
          let convertPubKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.pubKey.getEncoded();
          let convertPriKey: cryptoFramework.DataBlob = convertRFC5208KeyPair.priKey.getEncoded();
          await pkcs8Utils.convertDataKeyPairToKeyPair(algName, {
            dataPriKey: convertPriKey, dataPubKey: convertPubKey
          });
          expect(null).assertNull();
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0300
     * @tc.name Test RSA RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is RSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024|PRIMES_2";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.pubKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`RSA PubKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0400
     * @tc.name Test DSA RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is DSA
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "DSA1024";
        let keyPair: cryptoFramework.KeyPair;
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        if (pkcs8Utils.keys.key_1024) {
          let priKey: cryptoFramework.DataBlob = {data: new Uint8Array(pkcs8Utils.keys.key_1024.pri)}
          let pubKey: cryptoFramework.DataBlob = {data: new Uint8Array(pkcs8Utils.keys.key_1024.pub)};
          keyPair = await cipher.convertKey(pubKey, priKey)
        }
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`DSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error: BusinessError) {
        console.error(`DSA “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0500
     * @tc.name Test SM2_256 RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is SM2_256
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM2_256";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0600
     * @tc.name Test Ed25519 RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is Ed25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "Ed25519";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0700
     * @tc.name Test DH_modp2048 RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is DH_modp2048
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "DH_modp2048";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_ECCRFC5915_Func_0800
     * @tc.name Test X25519 RFC5208 algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is X25519
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_ECCRFC5915_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "X25519";
        let cipher: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await cipher.generateKeyPair();
        try {
          keyPair.priKey.getEncodedDer("PKCS8");
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`RSA PriKey “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
      } catch (error: BusinessError) {
        console.error(`ECC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}