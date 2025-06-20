import { describe, it, expect, TestType, Size, Level, beforeEach } from "../../index";
import hilog from '@ohos.hilog'

import huks from '@ohos.security.huks';
import { BusinessError } from '@ohos.base';
import { SetParam } from './utils/HuksOptionUtil';
import { GetAesGenerateOption, GetEccGenerateOption } from './options/GenerateKeyOptions';
import { BuildWrappedKeyData } from './utils/ImportWrappedKeyUtil';
import { GetAesCbcOptions } from './options/CipherOptions';



export default function SecurityHuksImportKeyTest() {

  let genKeyOption: huks.HuksOptions;
  let encryptOption: huks.HuksOptions;

  describe("SecurityHuksImportKeyTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', 'describe start');

    beforeEach((): void => {
      genKeyOption = GetAesGenerateOption(256);
      encryptOption = GetAesCbcOptions();
    })

    it('SUB_Security_HUKS_ImportKey_API18_Func_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
      let testNumber: string = "SUB_Security_HUKS_ImportKey_API18_Func_0100";
      try {
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize = 192;
        let genKeyPairOptions = GetEccGenerateOption(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption = GetAesGenerateOption(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        MergeOption(importWrappedKeyOption, GetAccessControlOptions());
        importWrappedKeyOption.inData = wrappedKeyData;
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST);
        }
      }
    })
  })
}