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
import * as digCallback from './utils/digestalgorithm/publicDigestCallback.test';
import * as digPromise from './utils/digestalgorithm/publicDigestPromise.test';
import * as commons from './utils/common/publicDoString.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function cryptoHmacOptParaJsTestUnit() {
  describe("cryptoHmacOptParaJsTestUnit", (): void => {
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
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0100
     * @tc.name Test symKey with HMAC|SHA1, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA1
     * @tc.desc 2. MAC with algName SHA1
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA1", "HMAC|SHA1");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 20).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0200
     * @tc.name Test symKey with HMAC|SHA224, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA224
     * @tc.desc 2. MAC with algName SHA224
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA224", "HMAC|SHA224");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 28).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0300
     * @tc.name Test symKey with HMAC|SHA256, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA256
     * @tc.desc 2. MAC with algName SHA256
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA256", "HMAC|SHA256");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0400
     * @tc.name Test symKey with HMAC|SHA384, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA384
     * @tc.desc 2. MAC with algName SHA384
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA384", "HMAC|SHA384");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0500
     * @tc.name Test symKey with HMAC|SHA512, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA512
     * @tc.desc 2. MAC with algName SHA512
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA512", "HMAC|SHA512");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0600
     * @tc.name Test symKey with HMAC|SM3, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SM3
     * @tc.desc 2. MAC with algName SM3
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SM3", "HMAC|SM3");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0700
     * @tc.name Test symKey with invalid parameters or MAC with invalid  parameters, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with invalid  parameters or MAC with invalid  parameters
     * @tc.desc 2. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await digCallback.HmacDigestProcess("SM3", "hmac|SM3");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error1: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(801);
      }
      try {
        await digCallback.HmacDigestProcess("sm3", "HMAC|SM3");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error2: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0800
     * @tc.name Test symKey with HMAC and symkey with any length[1,4096], HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SHA512
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array("123ab")
      };
      try {
        let retData = await digCallback.HmacAnyLengthKeyDigestProcess("SHA512", keyBlob);
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0900
     * @tc.name Test symKey with HMAC and symkey with superlarge length, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SM3
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strLen: number = 4097;
      let srcStr: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      let randomStr: string = "";
      for (let i = 0; i < strLen; i++) {
        randomStr += srcStr.charAt(Math.floor(Math.random() * srcStr.length));
      }
      commons.sliceAndPrintString(randomStr, 500);
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array(randomStr)
      };
      try {
        await digCallback.HmacAnyLengthKeyDigestProcess("SM3", keyBlob);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1000
     * @tc.name Test symKey with HMAC and symkey with 0 length, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SM3
     * @tc.desc 3. Test interface with AsyncCallback style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array("")
      };
      try {
        await digCallback.HmacAnyLengthKeyDigestProcess("SM3", keyBlob);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1100
     * @tc.name Test symKey with HMAC|SHA1, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA1
     * @tc.desc 2. MAC with algName SHA1
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA1", "HMAC|SHA1");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 20).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1200
     * @tc.name Test symKey with HMAC|SHA224, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA224
     * @tc.desc 2. MAC with algName SHA224
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA224", "HMAC|SHA224");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 28).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1300
     * @tc.name Test symKey with HMAC|SHA256, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA256
     * @tc.desc 2. MAC with algName SHA256
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA256", "HMAC|SHA256");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1400
     * @tc.name Test symKey with HMAC|SHA384, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA384
     * @tc.desc 2. MAC with algName SHA384
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA384", "HMAC|SHA384");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1500
     * @tc.name Test symKey with HMAC|SHA512, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SHA512
     * @tc.desc 2. MAC with algName SHA512
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA512", "HMAC|SHA512");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1600
     * @tc.name Test symKey with HMAC|SM3, HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC|SM3
     * @tc.desc 2. MAC with algName SM3
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SM3", "HMAC|SM3");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1700
     * @tc.name Test symKey with invalid parameters or MAC with invalid  parameters, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with invalid  parameters or MAC with invalid  parameters
     * @tc.desc 2. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await digPromise.HmacDigestProcess("SM3", "HMAC|Sha256");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error1: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(801);
      }
      try {
        await digPromise.HmacDigestProcess("sha384", "HMAC|SHA384");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1700 catch error2: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1800
     * @tc.name Test symKey with HMAC and symkey with any length[1,4096], HMAC process is successful
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SHA384
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array("123ab")
      };
      try {
        let retData = await digPromise.HmacAnyLengthKeyDigestProcess("SHA384", keyBlob);
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1900
     * @tc.name Test symKey with HMAC and symkey with superlarge length, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SHA256
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strLen: number = 4097;
      let srcStr: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      let randomStr: string = "";
      for (let i = 0; i < strLen; i++) {
        randomStr += srcStr.charAt(Math.floor(Math.random() * srcStr.length));
      }
      commons.sliceAndPrintString(randomStr, 500);
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array(randomStr)
      };
      try {
        await digPromise.HmacAnyLengthKeyDigestProcess("SHA256", keyBlob);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1900 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_2000
     * @tc.name Test symKey with HMAC and symkey with 0 length, HMAC process is failed
     * @tc.desc 1. SymKeyGenerator with algName HMAC
     * @tc.desc 2. MAC with algName SHA1
     * @tc.desc 3. Test interface with Promise style
     */
    it("Security_CryptoFramework_HmacOptPara_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array("")
      };
      try {
        await digPromise.HmacAnyLengthKeyDigestProcess("SHA1", keyBlob);
      } catch (err: BusinessError) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_2000 catch error: “${err}“, error code: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });
  })
}