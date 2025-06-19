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
import * as specUtil from './utils/common/keyGenSpecUtil.test';
import * as signVerifyPromiseFunc from './utils/signVerify/signVerifyAsyPromiseFunc.test';
import * as signVerifyCallbackFunc from './utils/signVerify/signVerifyAsyCallbackFunc.test';
import * as asyKeyGenCallbackFunc from './utils/keyGenerate/asyKeyGenCallbackFunc.test';
import * as asyKeyGenPromiseFunc from './utils/keyGenerate/asyKeyGenPromiseFunc.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwSignVerifySM2TestUnit() {
  describe("SecurityCryptoFwSignVerifySM2TestUnit", (): void => {
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
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0100
     * @tc.name Test signVerify with SM2|SM3, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName SM2
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0100: started.");
      let signVerifyAlg: string = "SM2|SM3";
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0100: getSpec succeed`);
        let res: boolean = await signVerifyPromiseFunc.normalProcess(signVerifyAlg, true, spec, "SM2");
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0100: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0100: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0200
     * @tc.name Test signVerify with SM2_256|SM3, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 2. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level1
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0200: started.");
      let signVerifyAlg: string = "SM2_256|SM3";
      let curveName: string = "NID_sm2";
      try {
        let spec: cryptoFramework.ECCKeyPairSpec = {
          algName: "SM2",
          specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
          params: cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec(curveName),
          sk: specUtil.SM2Sk(),
          pk: specUtil.SM2Pk(),
        };
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0200: getSpec succeed`);
        let res: boolean = await signVerifyCallbackFunc.normalProcess(signVerifyAlg, true, spec, "SM2");
        expect(res).assertTrue();
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0200: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0200: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0300
     * @tc.name Test signVerify with SM2_256|SM3, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 2. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0300: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let signVerifyAlg: string = "SM2_256|SM3";
        let userid: string = "1234567812345678";
        let res: boolean = await signVerifyPromiseFunc.setUseridProcess(signVerifyAlg, true, spec, "SM2", userid, null);
        expect(res).assertEqual(true);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0300: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0300: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0400
     * @tc.name Test signVerify with SM2_256|SM3, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName SM2
     * @tc.desc 3. Test interface with Callback style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0400: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let signVerifyAlg: string = "SM2|SM3";
        let userid: string = "1234567812345678";
        let res: boolean = await signVerifyCallbackFunc.setUseridProcess(signVerifyAlg, true, spec, "SM2", userid, userid);
        expect(res).assertEqual(true);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0400: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0400: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0500
     * @tc.name Test signVerify with SM2_256|SM3, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0500: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let signVerifyAlg: string = "SM2_256|SM3";
        let userid: string = "12345678";
        let res: boolean = await signVerifyPromiseFunc.setUseridProcess(signVerifyAlg, true, spec, "SM2", userid, null);
        expect(res).assertEqual(false);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0500: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0500: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0600
     * @tc.name Test signVerify with SM2_256|SM3, process is successful
     * @tc.desc 1. AsyKeyGenerator with algName SM2_256
     * @tc.desc 3. Test interface with Promise style
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("Security_CryptoFramework_SignVerify_SM2_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log("Security_CryptoFramework_SignVerify_SM2_Func_0600: started.");
      try {
        let spec: cryptoFramework.AsyKeySpec = specUtil.genSM2KeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
        let signVerifyAlg: string = "SM2_256|SM3";
        let userid: string = "";
        let res: boolean = await signVerifyPromiseFunc.setUseridProcess(signVerifyAlg, true, spec, "SM2", userid, null);
        expect(res).assertEqual(false);
        console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0600: signVerify succeed`);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_SignVerify_SM2_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(`Security_CryptoFramework_SignVerify_SM2_Func_0600: success`);
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_SignVerify_SM2_Func_0800
     * @tc.name Test signVerify algName with SM2_256. Promise style. Process success
     * @tc.desc digest is SM3
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_SignVerify_SM2_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "Security_CryptoFramework_SignVerify_SM2_Func_0800";
      console.log(testNumber + ": started");
      let signVerifyAlg: string = "SM2_256|SM3";
      try {
        let sign: cryptoFramework.Sign = cryptoFramework.createSign(signVerifyAlg);
        let verify: cryptoFramework.Verify = cryptoFramework.createVerify(signVerifyAlg);
        expect(sign.algName == signVerifyAlg).assertTrue();
        expect(verify.algName == signVerifyAlg).assertTrue();
      } catch (err: BusinessError) {
        console.error(testNumber + `: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": success");
      done();
    });
  })
}