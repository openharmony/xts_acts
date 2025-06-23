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
import * as agreementAsyCallbackFunc from './utils/agreement/agreementAsyCallbackFunc.test';
import * as agreementAsyPromiseFunc from './utils/agreement/agreementAsyPromiseFunc.test';
import * as specUtil from './utils/common/keyGenSpecUtil.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function SecurityCryptoFwAgreementDHTestUnit() {

  describe("SecurityCryptoFwAgreementDHTestUnit", (): void => {
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
     * @tc.number Security_CryptoFramework_Agreement_DH_Func_0100
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp1536
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level0
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0100";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp1536";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0200
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp2048
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0200";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp2048";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0300
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp3072
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0300";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp3072";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0400
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp4096
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0400";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp4096";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0500
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp6144
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0500";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp6144";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0600
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_modp8192
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0600";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp8192";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0700
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe2048
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0700";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe2048";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0800
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe3072
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0800";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe3072";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_0900
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe4096
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_0900";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe4096";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1000
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe6144
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1000";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe6144";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1100
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGenerator with algName DH_ffdhe8192
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1100";
      console.log(testNumber + ": started.");
      let param: string = "DH_ffdhe8192";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1200
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGeneratorBySpec with algName DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1300";
      console.log(testNumber + ": started.");
      let param: string = "DH";
      let spec: cryptoFramework.AsyKeySpec = specUtil.genDHKeySpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, true, spec, "DH");
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1300
     * @tc.name Test agreement with dh, Promise style, process success
     * @tc.desc AsyKeyGeneratorByCommonSpec with algName DH
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1300";
      console.log(testNumber + ": started.");
      let param: string = "DH";
      let spec: cryptoFramework.AsyKeySpec = cryptoFramework.DHKeyUtil.genDHCommonParamsSpec(512, 128);
      try {
        let res: boolean = await agreementAsyPromiseFunc.normalProcess(param, true, spec, "DH");
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1400
     * @tc.name Test agreement with dh, Callback style, process success
     * @tc.desc AsyKeyGeneratorBySpec with algName DH_modp1536
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level2
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1400";
      console.log(testNumber + ": started.");
      let param: string = "DH_modp1536";
      let spec: cpFw.AsyKeySpec = {
        algName: "ECC",
        specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
      };
      try {
        let res: boolean = await agreementAsyCallbackFunc.normalProcess(param, false, spec, param);
        expect(res).assertTrue();
        console.log(testNumber + ": agreement succeed");
      } catch (err: BusinessError) {
        console.error(testNumber + ` catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Agreement_DH_Func_1500
     * @tc.name Test Agreement algName with dh. Process success
     * @tc.desc create Agreement by DH_modp1536
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Agreement_DH_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let testNumber: string = "SUB_Security_CryptoFramework_Agreement_DH_Func_1500";
      console.log(testNumber + ": started");
      let agreementAlg: string = "DH_modp1536";
      try {
        let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(agreementAlg);
        expect(agreement.algName == agreementAlg).assertTrue();
      } catch (err: BusinessError) {
        console.error(testNumber + `: catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      console.log(testNumber + ": succeed");
      done();
    });


  })

}