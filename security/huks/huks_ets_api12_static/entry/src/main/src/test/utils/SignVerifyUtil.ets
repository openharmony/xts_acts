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
import huks from '@ohos.security.huks';
import { SetParam } from './HuksOptionUtil';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

export async function SignVerify(keyAlias: string, signVerifyOption: huks.HuksOptions, signVerifyData: SignVerifyData): Promise<boolean> {
  try {
    SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);
    signVerifyData.signatureData = await DoSign(keyAlias, signVerifyOption, signVerifyData);
    SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
    await DoVerify(keyAlias, signVerifyOption, signVerifyData);
    return true;
  } catch (err: BusinessError) {
    hilog.info(0x0000, 'testTag', '%{public}s', `xxxx catch error ${JSON.stringify(err)}`);
    throw err;
  }
}

export async function DoSign(keyAlias: string, signVerifyOption: huks.HuksOptions, signVerifyData: SignVerifyData): Promise<Uint8Array> {
  try {
    let handle = (await huks.initSession(keyAlias, signVerifyOption)).handle;
    if (signVerifyData.updateDataArr != null) {
      let updateData: Array<Uint8Array> = signVerifyData.updateDataArr as Array<Uint8Array>;
      for (let i = 0; i < updateData.length; i++) {
        signVerifyOption.inData = updateData[i];
        await huks.updateSession(handle, signVerifyOption);
      }
    }
    signVerifyOption.inData = signVerifyData.finishData as Uint8Array;
    return (await huks.finishSession(handle, signVerifyOption)).outData as Uint8Array;
  } catch (err: BusinessError) {
    hilog.info(0x0000, 'testTag', '%{public}s', `xxxx catch error ${JSON.stringify(err)}`);
    throw err;
  }
}

export async function DoVerify(keyAlias: string, signVerifyOption: huks.HuksOptions, signVerifyData: SignVerifyData): Promise<void> {
  try {
    let handle = (await huks.initSession(keyAlias, signVerifyOption)).handle;
    if (signVerifyData.updateDataArr != null) {
      let updateData: Array<Uint8Array> = signVerifyData.updateDataArr as Array<Uint8Array>;
      for (let i = 0; i < updateData.length; i++) {
        signVerifyOption.inData = updateData[i];
        await huks.updateSession(handle, signVerifyOption);
      }
    }
    signVerifyOption.inData = signVerifyData.finishData as Uint8Array;
    await huks.updateSession(handle, signVerifyOption);
    signVerifyOption.inData = signVerifyData.signatureData as Uint8Array;
    await huks.finishSession(handle, signVerifyOption);
  } catch (err: BusinessError) {
    hilog.info(0x0000, 'testTag', '%{public}s', `xxxx catch error ${JSON.stringify(err)}`);
    throw err;
  }
}

export interface SignVerifyData {
  updateDataArr: Array<Uint8Array> | null,
  finishData: Uint8Array | null,
  signatureData: Uint8Array | null
}