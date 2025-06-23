/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
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

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0100
     * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0100
     * @tc.desc   : test generateKeyItem, error code 401
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_ErrorCode_API18_Interface_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0100";
      try {
        await huks.generateKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0200
     * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0200
     * @tc.desc   : test generateKeyItem, error code 12000002
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_ErrorCode_API18_Interface_0200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0200";
      try {
        await huks.generateKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT));
        }
      }

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0300
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0300
       * @tc.desc   : test generateKeyItem, error code 12000003
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0300";
        try {
          await huks.generateKeyItem(testNumber, genKeyOptionErrorAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0400
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0400
       * @tc.desc   : test generateKeyItem, error code 12000013
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0400";
        try {
          MergeOption(genKeyOption, GetAccessControlOptions());
          await huks.generateKeyItem(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0500
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0500
       * @tc.desc   : test deleteKeyItem, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0500";
        await huks.generateKeyItem(testNumber, genKeyOption);
        try {
          await huks.deleteKeyItem(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0600
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0600
       * @tc.desc   : test deleteKeyItem, error code 12000011
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0600";
        try {
          await huks.deleteKeyItem(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0700
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0700
       * @tc.desc   : test importKeyItem, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0700";
        genKeyOption.inData = GetAesImportData(256);
        try {
          await huks.importKeyItem(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0800
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0800
       * @tc.desc   : test importKeyItem, error code 12000002
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0800";
        genKeyOptionNoAlg.inData = GetAesImportData(256);
        try {
          await huks.importKeyItem(testNumber, genKeyOptionNoAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_0900
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_0900
       * @tc.desc   : test importKeyItem, error code 12000003
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_0900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_0900";
        genKeyOptionErrorAlg.inData = GetAesImportData(256);
        try {
          await huks.importKeyItem(testNumber, genKeyOptionErrorAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1000
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1000
       * @tc.desc   : test importKeyItem, error code 12000013
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1100
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1100
       * @tc.desc   : test importWrappedKeyItem, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1200
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1200
       * @tc.desc   : test importWrappedKeyItem, error code 12000002
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1300
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1300
       * @tc.desc   : test importWrappedKeyItem, error code 12000003
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1400
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1400
       * @tc.desc   : test importWrappedKeyItem, error code 12000011
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1500
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1500
       * @tc.desc   : test importWrappedKeyItem, error code 12000013
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1600
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1600
       * @tc.desc   : test exportKeyItem, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1700
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1700
       * @tc.desc   : test exportKeyItem, error code 12000011
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1700";
        try {
          await huks.exportKeyItem(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1800
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1800
       * @tc.desc   : test isKeyItemExist, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1800";
        await huks.generateKeyItem(testNumber, genKeyOption);
        try {
          await huks.isKeyItemExist(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_1900
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_1900
       * @tc.desc   : test isKeyItemExist, error code 12000011
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_1900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_1900";
        try {
          let res = await huks.isKeyItemExist(testNumber, genKeyOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_2000
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_2000
       * @tc.desc   : test initSession, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2000";
        await huks.generateKeyItem(testNumber, genKeyOption);
        try {
          await huks.initSession(testNumber, genKeyOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_2100
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_2100
       * @tc.desc   : test initSession, error code 12000011
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2100";
        try {
          await huks.initSession(testNumber, encryptOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_2200
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_2200
       * @tc.desc   : test updateSession, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2200";
        await huks.generateKeyItem(testNumber, genKeyOption);
        let handle: long = 0;
        let init = huks.initSession(testNumber, encryptOption);
        await init.then<void, void>((data: huks.HuksSessionHandle): void => {
          handle = data.handle;
        });
        try {
          await huks.updateSession(handle, encryptOptionMultiAlg);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_2300
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_2300
       * @tc.desc   : test updateSession, error code 12000011
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2300";
        let handle: long = 0;
        try {
          await huks.updateSession(handle, encryptOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_2400
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_2400
       * @tc.desc   : test finishSession, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_2500
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_2500
       * @tc.desc   : test finishSession, error code 12000011
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
      it('SUB_Security_HUKS_ErrorCode_API18_Interface_2500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
        let testNumber: string = "SUB_Security_HUKS_ErrorCode_API18_Interface_2500";
        let handle: long = 0;
        try {
          await huks.finishSession(handle, encryptOption);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
          if (err.code != 801 && err.code != 12000001) {
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST));
          }
        }
      })

      /**
       * @tc.number : SUB_Security_HUKS_ErrorCode_API18_Interface_2600
       * @tc.name   : SUB_Security_HUKS_ErrorCode_API18_Interface_2600
       * @tc.desc   : test abortSession, error code 401
       * @tc.size   : SmallTest
       * @tc.type   : Function
       * @tc.level  : Level2
       */
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
            expect(String(err.code)).assertEqual(String(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT));
          }
        }
      })

    })
  })
}

