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
import * as rsaTest from './utils/rsa/rsaSignRecoverUtils'
import * as commonUtil from './utils/common/commonUtils';
import * as rsa from './utils/pkcs1Topkcs8/pkcs1topkcs8';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwSignRecoverRSARecoverTestUnit() {
  describe("SecurityCryptoFwSignRecoverRSARecoverTestUnit", (): void => {
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
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0100
     * @tc.name Test SignRecover algName with RSA2048|NoPadding|NoHash|OnlySign. Promise style. Process success
     * @tc.desc digest is RSA2048|NoPadding|NoHash|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "RSA2048";
      let paddingName: string = "NoPadding";
      let isOnlySign: boolean = true;
      let mdName: string = "NoHash";
      let dataLen: int = 256;
      let isSync: boolean = false;
      let isPadding: boolean = true;
      try {
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0200
     * @tc.name Test SignRecover algName with NoPadding|NoHash|OnlySign. Sync style. Process success
     * @tc.desc digest is RSA4096|NoPadding|NoHash|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let algName: string = "RSA8192";
      let paddingName: string = "NoPadding";
      let isOnlySign: boolean = true;
      let mdName: string = "NoHash";
      let dataLen: int = 1024;
      let isSync: boolean = true;
      let isPadding: boolean = true;
      try {
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0300
     * @tc.name Test SignRecover algName with RSA1024|PKCS1|NoHash|OnlySign. Promise style. Process success
     * @tc.desc digest is RSA1024|PKCS1|NoHash|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let mdName: string = "NoHash";
        let RSA_PKCS1_PADDING_SIZE: int = 11;
        let dataLen: int = 128 - RSA_PKCS1_PADDING_SIZE;
        let isSync: boolean = false;
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0400
     * @tc.name Test SignRecover algName with RSA2048|PKCS1|NoHash|OnlySign. Sync style. Process success
     * @tc.desc digest is RSA2048|PKCS1|NoHash|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let mdName: string = "NoHash";
        let RSA_PKCS1_PADDING_SIZE: int = 11;
        let dataLen: int = 256 - RSA_PKCS1_PADDING_SIZE;
        let isSync: boolean = true;
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0500
     * @tc.name Test SignRecover algName with RSA2048|PKCS1|SHA512|OnlySign. Promise style. Process success
     * @tc.desc digest is RSA2048|PKCS1|SHA512|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 64;
        let isSync: boolean = false;
        let mdName: string = "SHA512";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });
	
	/**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0600
     * @tc.name Test SignRecover algName with RSA512|PKCS1|MD5|OnlySign. Promise style. Process success
     * @tc.desc digest is RSA512|PKCS1|MD5|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA512";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 16;
        let isSync: boolean = false;
        let mdName: string = "MD5";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0700
     * @tc.name Test SignRecover algName with RSA768|PKCS1|SHA1|OnlySign. Sync style. Process success
     * @tc.desc digest is RSA768|PKCS1|SHA1|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 20;
        let isSync: boolean = true;
        let mdName: string = "SHA1";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0800
     * @tc.name Test SignRecover algName with RSA1024|PKCS1|SHA224|OnlySign. Promise style. Process success
     * @tc.desc digest is RSA1024|PKCS1|SHA224|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 28;
        let isSync: boolean = false;
        let mdName: string = "SHA224";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_0900
     * @tc.name Test SignRecover algName with RSA4096|PKCS1|SHA256|OnlySign. Sync style. Process success
     * @tc.desc digest is RSA4096|PKCS1|SHA256|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA4096";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 32;
        let isSync: boolean = true;
        let mdName: string = "SHA256";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1000
     * @tc.name Test SignRecover algName with RSA4096|PKCS1|SHA256|OnlySign. Sync style. Process success
     * @tc.desc digest is RSA4096|PKCS1|SHA256|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA4096";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 32;
        let isSync: boolean = false;
        let mdName: string = "SHA256";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1100
     * @tc.name Test SignRecover algName with RSA8192|PKCS1|SHA512|OnlySign. Promise style. Process success
     * @tc.desc digest is RSA8192|PKCS1|SHA512|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA8192";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 64;
        let isSync: boolean = false;
        let mdName: string = "SHA512";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1200
     * @tc.name Test SignRecover algName with RSA3072|PKCS1|SHA384|OnlySign. Sync style. Process success
     * @tc.desc digest is RSA3072|PKCS1|SHA384|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA3072";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 48;
        let isSync: boolean = true;
        let mdName: string = "SHA384";
        let isPadding: boolean = true;
        let ret: boolean = await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(ret).assertTrue();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1300
     * @tc.name Test SignRecover algName with RSA2048|PKCS1|SHA512|OnlySign and plainTextLen gt mdLen. Sync style. Process success
     * @tc.desc digest is RSA2048|PKCS1|SHA512|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 65;
        let isSync: boolean = true;
        let mdName: string = "SHA512";
        let isPadding: boolean = true;
        await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1400
     * @tc.name Test SignRecover algName with RSA3072|PKCS1|SHA384|OnlySign and plainTextLen lt mdLen.. Promise style. Process success
     * @tc.desc digest is RSA3072|PKCS1|SHA384|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA3072";
        let paddingName = "PKCS1";
        let isOnlySign: boolean = true;
        let dataLen: int = 47;
        let isSync: boolean = false;
        let mdName: string = "SHA384";
        let isPadding: boolean = true;
        await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1500
     * @tc.name Test SignRecover algName with RSA1024|PSS|SHA256|MGF1_SHA256|OnlySign. Sync style. Process success
     * @tc.desc digest is RSA1024|PSS|SHA256|MGF1_SHA256|OnlySign
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let paddingName = "PSS";
        let isOnlySign: boolean = true;
        let dataLen: int = 32;
        let isSync: boolean = true;
        let mdName: string = "SHA256|MGF1_SHA256";
        let isPadding: boolean = true;
        await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1600
     * @tc.name Test SignRecover algName with SM2_256|SM3 with OnlySign. Promise style. Process success
     * @tc.desc digest is SM3
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 32;
      let algName: string = "SM2_256";
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      try {
        let signAlg: string = algName + "|SM3|OnlySign";
        await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1700
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "RSA1024"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|NoPadding|NoHash|OnlySign";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|NoPadding|Recover";
      try {
        await rsaTest.verifyRSARecoverWithUpdate(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1800
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "RSA1024";
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|NoPadding|NoHash|OnlySign";
      try {
        await rsaTest.signPromiseWithUpdate(signAlg, keyPair.priKey, rawData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_1900
     * @tc.name Test SignRecover algName with DSA2048|NoPadding|SHA256. Promise style. Process success
     * @tc.desc digest is DSA2048|NoPadding|SHA256|Recover
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "DSA2048";
        let paddingName: string = "";
        let isPadding: boolean = false;
        let isOnlySign: boolean = false;
        let dataLen: int = 32;
        let isSync: boolean = false;
        let mdName: string = "SHA256";
        await rsaTest.createSignRecover(algName, paddingName, mdName, dataLen, isOnlySign, isSync, isPadding);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`“${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2000
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA384";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|SHA384";
      try {
        await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2100
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA384";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|SHA384";
      try {
        await rsaTest.verifyRSARecoverWithUpdate(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2200
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding/Recover
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA384";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|SHA384|Recover";
      try {
        await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2300
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "RSA4096"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str4096, rsa.priKeyPkcs1Str4096);
      let signAlg: string = algName + "|PSS|MD5|MGF1_MD5";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromiseWithUpdate(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|PSS|MD5|MGF1_MD5|Recover";
      try {
        await rsaTest.verifyRSARecoverWithUpdate(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2400
     * @tc.name Test signRecover algName with SHA512 with OnlySign and plainText data is empty. Promise style. Process success
     * @tc.desc digest is SHA512
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048"
        let data: string = "";
        let dataArray: Uint8Array = commonUtil.stringToUint8Array(data);
        let rawData: cryptoFramework.DataBlob = {
          data: dataArray
        };
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        let signAlg: string = algName + "|PKCS1|SHA512";
        let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
        let verifyAlg: string = algName + "|PKCS1|SHA512|Recover";
        let verifyData: cryptoFramework.DataBlob | null = await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        let mdData = await rsaTest.doMd("SHA512", rawData);
        if (verifyData != null) {
          let ret: boolean = commonUtil.compareDataBlob(verifyData, mdData);
          expect(ret).assertTrue();
        } else {
          expect(null).assertFail();
        }
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2500
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA256";
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName + "|SHA256";
      try {
        await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2600
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "ECC_BrainPoolP256t1"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName + "|SHA256|OnlySign";
      try {
        await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_RSASignRecover_Func_2700
     * @tc.name Test SignRecover algName with NoPadding with OnlySign. Promise style. Process success
     * @tc.desc digest is NoPadding
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_RSASignRecover_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let dataLen: int = 128;
      let algName: string = "Ed25519"
      let rawData: cryptoFramework.DataBlob = await commonUtil.createData(dataLen);
      let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
      let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
      let signAlg: string = algName;
      let signData: cryptoFramework.DataBlob = await rsaTest.signPromise(signAlg, keyPair.priKey, rawData);
      let verifyAlg: string = algName;
      try {
        await rsaTest.verifyRSARecover(verifyAlg, keyPair.pubKey, signData);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });
  })
}