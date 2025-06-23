import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import cpFw from '@ohos.security.cryptoFramework';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc.test';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc.test';
import * as specUtil from './utils/common/keyGenSpecUtil.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwKeyGenerateSM2TestUnit() {
  describe("SecurityCryptoFwKeyGenerateSM2TestUnit", (): void => {
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
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100
     * @tc.name Test createAsyKeyGeneratorBySpec error params process is fail
     * @tc.desc 1. AsyKeyGenerator with algName SM2_512
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        spec.algName = "SM2_512";
        cryptoFramework.createAsyKeyGeneratorBySpec(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100: createAsyKeyGeneratorBySpec succeed.");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0100: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200
     * @tc.name Test createAsyKeyGeneratorBySpec error type. process is fail
     * @tc.desc 1. AsyKeyGenerator with algName SM2_512
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.SM2CommonSpec();
        spec.specType = cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC;
        cryptoFramework.createAsyKeyGeneratorBySpec(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200: createAsyKeyGeneratorBySpec succeed.");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0200: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300
     * @tc.name Test keyGenerateBySpec sm2. process is success
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300: generatePriKey succeed.");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0300: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400
     * @tc.name Test keyGenerateBySpec sm2. process is success
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 2. Test interface with AsyncCallback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400: generatePriKey succeed.");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0400: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500
     * @tc.name Test keyGenerateBySpec sm2. process is success
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500: generatePriKey succeed.");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0500: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600
     * @tc.name Test keyGenerateBySpec sm2. process is success
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 2. Test interface with AsyncCallback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPubKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600: generatePriKey succeed.");
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0600: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700
     * @tc.name Test priKeyGenerate By pub Spec sm2. process is success
     * @tc.desc 1. AsyKeyGenerator with algName SM2
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenPromiseFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700: generatePriKey succeed.");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0700: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800
     * @tc.name Test priKeyGenerate By pub Spec sm2. process is fail
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 2. Test interface with AsyncCallback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC);
        await asyKeyGenCallbackFunc.genPriKey(spec);
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800: generatePriKey succeed.");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(401);
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800 catch error: “${err}“, error code: ${err.code}`);
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_0800: success.");
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000
     * @tc.name Test getAsyKeySpec sm2. process is success
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(true, spec, "SM2");
        console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: generatePriKey succeed.");
        // for (let i = 201; i < 214; ++i) {
        //   if (i != 208) {
        //     keyPair.pubKey.getAsyKeySpec(i);
        //     console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: getPriParam " + i + " succeed.");
        //   }
        //   if (i != 209 && i != 210) {
        //     keyPair.priKey.getAsyKeySpec(i);
        //     console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: getPubParam " + i + " succeed.");
        //   }
        // } // 构建失败
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log("Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1000: success.");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1200
     * @tc.name Test getAsyKeySpec sm2. get format,algName. process success
     * @tc.desc AsyKeyGenerator with spec
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_AsyKeyGenerator_SM2_Func_1200";
      console.log(testNumber + ": started");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let keyPair: cryptoFramework.KeyPair = await asyKeyGenPromiseFunc.genKeyPair(true, spec, "SM2");
        console.log(testNumber + ": generateKeyPair succeed.");
        expect(keyPair.pubKey.format == "X.509").assertTrue();
        expect(keyPair.pubKey.algName == "SM2").assertTrue();
        expect(keyPair.priKey.format == "PKCS#8").assertTrue();
        expect(keyPair.priKey.algName == "SM2").assertTrue();
      } catch (err: BusinessError) {
        console.error(testNumber + `: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success.");
      done();
    });


  })
}