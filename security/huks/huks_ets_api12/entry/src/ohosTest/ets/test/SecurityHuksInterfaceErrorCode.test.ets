/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import { GenParam } from './utils/HuksOptionUtil';
import { StringToUint8Array } from './utils/CommonUtil';
import * as huksCallback from './utils/HuksCallbackUtil';


export default function SecurityHuksInterfaceErrorCodeTest() {
  let genKeyOption: huks.HuksOptions;
  let genKeyOptionMultiAlg: huks.HuksOptions;
  let genKeyOptionNoAlg: huks.HuksOptions;
  let genKeyOptionErrorAlg: huks.HuksOptions;
  let encryptOption: huks.HuksOptions;
  let encryptOptionMultiAlg: huks.HuksOptions;
  let encryptOptionNoAlg: huks.HuksOptions;
  let encryptOptionErrorAlg: huks.HuksOptions;

  describe('SecurityHuksInterfaceErrorCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      genKeyOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ]
      };
      genKeyOptionMultiAlg = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ]
      };
      genKeyOptionNoAlg = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ]
      };
      genKeyOptionErrorAlg = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, 4),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT)
        ]
      };
      encryptOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
          GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("120123456789")),

        ]
      }
      encryptOptionMultiAlg = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_AES),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
          GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("120123456789")),
        ]
      }
      encryptOptionNoAlg = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
          GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("120123456789")),
        ]
      }
      encryptOptionErrorAlg = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, 4),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
          GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
          GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
          GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array("120123456789")),
        ]
      }
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0100
     * @tc.name   : test deleteKeyItem, error code 401
     * @tc.desc   : generate key, delete
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0100";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.deleteKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0200
     * @tc.name   : test deleteKeyItem, error code 12000011
     * @tc.desc   : generate key, delete
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0200";
      try {
        await huks.deleteKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0300
     * @tc.name   : test deleteKeyItem, error code 401
     * @tc.desc   : generate key, delete
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0300";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.deleteKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0400
     * @tc.name   : test deleteKeyItem, error code 12000011
     * @tc.desc   : generate key, delete
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0400";
      try {
        await huksCallback.deleteKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0500
     * @tc.name   : test importKeyItem, error code 12000002
     * @tc.desc   : import key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0500";
      genKeyOptionNoAlg.inData = StringToUint8Array('32012345678901234567890123456789')
      try {
        await huks.importKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0600
     * @tc.name   : test importKeyItem, error code 12000002
     * @tc.desc   : import key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0600";
      genKeyOptionNoAlg.inData = StringToUint8Array('32012345678901234567890123456789')
      try {
        await huksCallback.importKeyItem(testNumber, genKeyOptionNoAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0700
     * @tc.name   : test exportKeyItem, error code 401
     * @tc.desc   : generate key, export key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0700";
      genKeyOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_ECC_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY)
        ]
      };
      genKeyOptionMultiAlg = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC),
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_ECC_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY)
        ]
      };
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.exportKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0800
     * @tc.name   : test exportKeyItem, error code 12000011
     * @tc.desc   : export key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0800";
      try {
        await huks.exportKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_0900
     * @tc.name   : test exportKeyItem, error code 401
     * @tc.desc   : generate key, export key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_0900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_0900";
      genKeyOption = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_ECC_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY)
        ]
      };
      genKeyOptionMultiAlg = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC),
          GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECC),
          GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_ECC_KEY_SIZE_256),
          GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY)
        ]
      };
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.exportKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1000
     * @tc.name   : test exportKeyItem, error code 12000011
     * @tc.desc   : export key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1000";
      try {
        await huksCallback.exportKeyItem(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1100
     * @tc.name   : test getKeyItemProperties, error code 401
     * @tc.desc   : generate key, get key properties
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1100";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.getKeyItemProperties(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1200
     * @tc.name   : test getKeyItemProperties, error code 12000011
     * @tc.desc   : get key properties
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1200";
      try {
        await huks.getKeyItemProperties(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1300
     * @tc.name   : test getKeyItemProperties, error code 401
     * @tc.desc   : generate key, get key properties
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1300";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.getKeyItemProperties(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1400
     * @tc.name   : test getKeyItemProperties, error code 12000011
     * @tc.desc   : get key properties
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1400";
      try {
        await huksCallback.getKeyItemProperties(testNumber, genKeyOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1500
     * @tc.name   : test hasKeyItem, error code 401
     * @tc.desc   : generate key, query Key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1500";
      await huks.generateKeyItem(testNumber, genKeyOption);
      try {
        await huks.hasKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1600
     * @tc.name   : test hasKeyItem, error code 401
     * @tc.desc   : generate key, query Key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1600";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      try {
        await huksCallback.hasKeyItem(testNumber, genKeyOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1700
     * @tc.name   : test initSession, error code 12000011
     * @tc.desc   : init session
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1700";
      try {
        await huks.initSession(testNumber, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1800
     * @tc.name   : test initSession, error code 12000011
     * @tc.desc   : init session
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1800";
      try {
        await huksCallback.initSession(testNumber, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_1900
     * @tc.name   : test updateSession, error code 401
     * @tc.desc   : generate key, init, update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_1900', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_1900";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.updateSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2000
     * @tc.name   : test updateSession, error code 12000011
     * @tc.desc   : update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2000', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2000";
      let handle = 0;
      try {
        await huks.updateSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2100
     * @tc.name   : test updateSession, error code 401
     * @tc.desc   : generate key, init, update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2100";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.updateSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2200
     * @tc.name   : test updateSession, error code 12000011
     * @tc.desc   : update
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2200', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2200";
      let handle = 0;
      try {
        await huksCallback.updateSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2300
     * @tc.name   : test finishSession, error code 401
     * @tc.desc   : generate key, init, finish
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2300";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.finishSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2400
     * @tc.name   : test finishSession, error code 12000011
     * @tc.desc   : finish
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2400";
      let handle = 0;
      try {
        await huks.finishSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2500
     * @tc.name   : test finishSession, error code 401
     * @tc.desc   : generate key, init, finish
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2500', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2500";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.finishSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2600
     * @tc.name   : test finishSession, error code 12000011
     * @tc.desc   : finish
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2600', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2600";
      let handle = 0;
      try {
        await huksCallback.finishSession(handle, encryptOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2700
     * @tc.name   : test abortSession, error code 401
     * @tc.desc   : generate key, init, abort
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2700', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2700";
      await huks.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huks.initSession(testNumber, encryptOption)).handle;
      try {
        await huks.abortSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_2800
     * @tc.name   : test abortSession, error code 401
     * @tc.desc   : generate key, init, abort
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_2800', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_2800";
      await huksCallback.generateKeyItem(testNumber, genKeyOption);
      let handle = (await huksCallback.initSession(testNumber, encryptOption)).handle;
      try {
        await huksCallback.abortSession(handle, encryptOptionMultiAlg);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3300
     * @tc.name   : test anonAttestKeyItem, error code 12000011
     * @tc.desc   : attest key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3300', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3300";
      let attestOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, StringToUint8Array('securityLevel')),
          GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, StringToUint8Array('challenge')),
          GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO, StringToUint8Array('versionInfo')),
          GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS, StringToUint8Array('alias')),
        ]
      }
      try {
        await huks.anonAttestKeyItem(testNumber, attestOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })

    /**
     * @tc.number : SUB_Security_HUKS_ErrorCode_API16_Interface_3400
     * @tc.name   : test anonAttestKeyItem, error code 12000011
     * @tc.desc   : attest key
     * @tc.type   : Safety
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_ErrorCode_API16_Interface_3400', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async () => {
      let testNumber: string = "SUB_Security_HUKS_ErrorCode_API16_Interface_3400";
      let attestOption: huks.HuksOptions = {
        properties: [
          GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, StringToUint8Array('securityLevel')),
          GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE, StringToUint8Array('challenge')),
          GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO, StringToUint8Array('versionInfo')),
          GenParam(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS, StringToUint8Array('alias')),
        ]
      }
      try {
        await huksCallback.anonAttestKeyItem(testNumber, attestOption);
        expect(null).assertFail();
      } catch (err) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST);
        }
      }
    })
  }
  )
}