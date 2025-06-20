import { describe, it, expect, TestType, Size, Level, beforeEach } from "../../index";
import hilog from '@ohos.hilog'

import huks from '@ohos.security.huks';
import { BusinessError } from '@ohos.base';
import { SetParam } from './utils/HuksOptionUtil';
import { StringToUint8Array } from './utils/CommonUtil';
import { GetEccGenerateOption } from './options/GenerateKeyOptions';
import { SignVerify, SignVerifyData } from './utils/SignVerifyUtil';

export default function SecurityHuksSignVerifyEccTest() {

  let genKeyOption: huks.HuksOptions;
  let signVerifyOption: huks.HuksOptions;

  describe("SecurityHuksSignVerifyEccTest", (): void => {

    beforeEach((): void => {
      genKeyOption = GetEccGenerateOption(256);
      signVerifyOption = GetEccGenerateOption(256);
      SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
    })

    it('SUB_Security_HUKS_SignVerify_Ecc_API18_Func_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_Ecc_API18_Func_0100";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let signVerifyData: SignVerifyData = {
        updateDataArr: null,
        finishData: StringToUint8Array("123456"),
        signatureData: null
      }
      try {
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(null).assertFail();
        }
      }
    })
  })
}