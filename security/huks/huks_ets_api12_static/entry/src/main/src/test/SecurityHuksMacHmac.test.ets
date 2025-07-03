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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import huks from '@ohos.security.huks';
import { BusinessError } from '@ohos.base';

import { SetParam } from './utils/HuksOptionUtil';
import { StringToUint8Array } from './utils/CommonUtil';

export default function SecurityHuksMacHmacTest() {

  let macOption: huks.HuksOptions;

  describe("SecurityHuksMacHmacTest", (): void => {

    beforeEach((): void => {
      macOption = {
        properties: new Array<huks.HuksParam>()
      }
      SetParam(macOption, huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_HMAC);
      SetParam(macOption, huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_AES_KEY_SIZE_256);
      SetParam(macOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC);
      SetParam(macOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Mac_Hmac_API18_Func_0100
     * @tc.name   : SUB_Security_HUKS_Mac_Hmac_API18_Func_0100
     * @tc.desc   : test hmac
     * @tc.size   : SmallTest
     * @tc.type   : Function
     * @tc.level  : Level2
     */
    it('SUB_Security_HUKS_Mac_Hmac_API18_Func_0100', TestType.SAFETY | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
      let testNumber: string = "SUB_Security_HUKS_Mac_Hmac_API18_Func_0100";
      await huks.generateKeyItem(testNumber, macOption);
      try {
        let handle: long = (await huks.initSession(testNumber, macOption)).handle as long;
        macOption.inData = StringToUint8Array("123456");
        await huks.updateSession(handle, macOption);
        await huks.finishSession(handle, macOption);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', testNumber + `: catch error ${JSON.stringify(err)}`);
        if (err.code != 801 && err.code != 12000001) {
          expect(null).assertFail();
        }
      }
    })
  })
}