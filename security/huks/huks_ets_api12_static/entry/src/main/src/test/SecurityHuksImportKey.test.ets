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

import { SetParam, MergeOption } from './utils/HuksOptionUtil';
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

    /**
     * @tc.number : SUB_Security_HUKS_ImportKey_API18_Func_0100
     * @tc.name   : SUB_Security_HUKS_ImportKey_API18_Func_0100
     * @tc.desc   : test importWrappedKeyItem
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
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
        importWrappedKeyOption.inData = wrappedKeyData;
        await huks.importWrappedKeyItem(testNumber, deviceAKeyPairAlias, importWrappedKeyOption);
      } catch (err: BusinessError) {
        console.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(null).assertFail();
        }
      }
    })
  })
}