import { describe, it, expect, TestType, Size, Level, beforeEach } from "../../index";
import hilog from '@ohos.hilog'

import huks from '@ohos.security.huks';
import { BusinessError } from '@ohos.base';
import { AddParam, DeleteParam, MergeOption, SetParam } from './utils/HuksOptionUtil';
import { GetAesGenerateOption, GetEccGenerateOption } from './options/GenerateKeyOptions';
import { GetAesImportData } from './options/ImportOptions';
import { GetAccessControlOptions } from './options/AccessControlOptions';
import { BuildWrappedKeyData } from './utils/ImportWrappedKeyUtil';
import { GetAesCbcOptions } from './options/CipherOptions';



export default function SecurityHuksInterfaceErrorCodeTest() {

  let genKeyOption: huks.HuksOptions;
  let genKeyOptionMultiAlg: huks.HuksOptions;
  let genKeyOptionNoAlg: huks.HuksOptions;
  let genKeyOptionErrorAlg: huks.HuksOptions;
  let encryptOption: huks.HuksOptions;
  let encryptOptionMultiAlg: huks.HuksOptions;
  let encryptOptionNoAlg: huks.HuksOptions;
  let encryptOptionErrorAlg: huks.HuksOptions;

  describe("SecurityHuksInterfaceErrorCodeTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', 'describe start');

    beforeEach((): void => {
      genKeyOption = GetAesGenerateOption(256);
      genKeyOptionMultiAlg = AddParam(GetAesGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      genKeyOptionNoAlg = DeleteParam(GetAesGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM);
      genKeyOptionErrorAlg = SetParam(GetAesGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
      encryptOption = GetAesCbcOptions();
      encryptOptionMultiAlg = AddParam(GetAesCbcOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
      encryptOptionNoAlg = DeleteParam(GetAesCbcOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM);
      encryptOptionErrorAlg = SetParam(GetAesCbcOptions(), huks.HuksTag.HUKS_TAG_ALGORITHM, 4);

    })
    //generateKeyItem
    it('SUB_Security_HUKS_ErrorCode_API18_Interface_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0100";
      try {
        await huks.generateKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    it('SUB_Security_HUKS_ErrorCode_API18_Interface_0200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0200";
      try {
        await huks.generateKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(12000002);
        }
      }

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0300";
        try {
          await huks.generateKeyItem(testNumber, genKeyOptionErrorAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000003);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0400";
        try {
          MergeOption(genKeyOption, GetAccessControlOptions());
          await huks.generateKeyItem(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000013);
          }
        }
      })
      //deleteKeyItem
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0500";
        await huks.generateKeyItem(testNumber, genKeyOption);
        try {
          await huks.deleteKeyItem(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0600";
        try {
          await huks.deleteKeyItem(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000011);
          }
        }
      })

      //importKeyItem
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0700";
        genKeyOption.inData = GetAesImportData(256);
        try {
          await huks.importKeyItem(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0800";
        genKeyOptionNoAlg.inData = GetAesImportData(256);
        try {
          await huks.importKeyItem(testNumber, genKeyOptionNoAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000002);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0900";
        genKeyOptionErrorAlg.inData = GetAesImportData(256);
        try {
          await huks.importKeyItem(testNumber, genKeyOptionErrorAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000003);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1000";
        MergeOption(genKeyOption, GetAccessControlOptions());
        genKeyOption.inData = GetAesImportData(256);
        try {
          await huks.importKeyItem(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000013);
          }
        }
      })

      //importWrappedKeyItem
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1100";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize: int = 192;
        let genKeyPairOptions: huks.HuksOptions = GetEccGenerateOption(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData: Uint8Array = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData: Uint8Array = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption: huks.HuksOptions = GetAesGenerateOption(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          AddParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES);
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1200";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize: int = 192;
        let genKeyPairOptions: huks.HuksOptions = GetEccGenerateOption(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData: Uint8Array = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData: Uint8Array = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption: huks.HuksOptions = GetAesGenerateOption(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        MergeOption(importWrappedKeyOption, GetAccessControlOptions());
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          DeleteParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM);
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000002);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1300";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize: int = 192;
        let genKeyPairOptions: huks.HuksOptions = GetEccGenerateOption(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData: Uint8Array = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData: Uint8Array = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption: huks.HuksOptions = GetAesGenerateOption(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_ALGORITHM, 4);
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000003);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1400";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize: int = 192;
        let genKeyPairOptions: huks.HuksOptions = GetEccGenerateOption(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData: Uint8Array = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData: Uint8Array = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption: huks.HuksOptions = GetAesGenerateOption(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias + "emptyKey", importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000011);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1500";
        let deviceAKeyPairAlias: string = testNumber + "_deviceAKeyPairAlias";
        let wrappedKeySize: int = 192;
        let genKeyPairOptions: huks.HuksOptions = GetEccGenerateOption(256);
        SetParam(genKeyPairOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP);
        await huks.generateKeyItem(deviceAKeyPairAlias, genKeyPairOptions);
        let deviceAPubKeyData: Uint8Array = (await huks.exportKeyItem(deviceAKeyPairAlias, genKeyPairOptions)).outData as Uint8Array;
        let wrappedKeyData: Uint8Array = await BuildWrappedKeyData(deviceAPubKeyData);
        let importWrappedKeyOption: huks.HuksOptions = GetAesGenerateOption(wrappedKeySize);
        SetParam(importWrappedKeyOption, huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE, huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING);
        MergeOption(importWrappedKeyOption, GetAccessControlOptions());
        importWrappedKeyOption.inData = wrappedKeyData;
        try {
          await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000013);
          }
        }
      })

      //exportKeyItem
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1600";
        genKeyOption = GetEccGenerateOption(256);
        genKeyOptionMultiAlg = AddParam(GetEccGenerateOption(256), huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC);
        await huks.generateKeyItem(testNumber, genKeyOption);
        try {
          await huks.exportKeyItem(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1700";
        try {
          await huks.exportKeyItem(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000011);
          }
        }
      })

      //isKeyItemExist
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1800";
        await huks.generateKeyItem(testNumber, genKeyOption);
        try {
          await huks.isKeyItemExist(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1900";
        try {
          let res = await huks.isKeyItemExist(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000011);
          }
        }
      })

      //initSession
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2000";
        await huks.generateKeyItem(testNumber, genKeyOption);
        try {
          await huks.initSession(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2100";
        try {
          await huks.initSession(testNumber, encryptOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000011);
          }
        }
      })

      //updateSession
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2200";
        await huks.generateKeyItem(testNumber, genKeyOption);
        let handle: long = 0;
        let init = huks.initSession(testNumber, encryptOption);
        await init.then<void, void>((data: huks.HuksSessionHandle): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(data)}`);
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(data.handle)}`);
          handle = data.handle;
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(handle)}`);
        }
        );
        hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch handle ${JSON.stringify(handle)}`);
        try {
          await huks.updateSession(handle, encryptOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2300";
        let handle: long = 0;
        try {
          await huks.updateSession(handle, encryptOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000011);
          }
        }
      })

      //finishSession
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2400";
        await huks.generateKeyItem(testNumber, genKeyOption);
        let handle: long = 0;
        await huks.initSession(testNumber, encryptOption).then((data: huks.HuksSessionHandle): void => {
          handle = data.handle;
        });
        try {
          await huks.finishSession(handle, encryptOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2500";
        let handle: long = 0;
        try {
          await huks.finishSession(handle, encryptOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(12000011);
          }
        }
      })

      //abortSession
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2600";
        await huks.generateKeyItem(testNumber, genKeyOption);
        let handle: long = 0;
        await huks.initSession(testNumber, encryptOption).then((data: huks.HuksSessionHandle): void => {
          handle = data.handle;
        });
        try {
          await huks.abortSession(handle, encryptOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(err.code).assertEqual(401);
          }
        }
      })

    })
  })
}

