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
import { BusinessError } from '@ohos.base';
import { StringToUint8Array, Uint8ArrayToString } from './CommonUtil';
import { SetParam } from './HuksOptionUtil';
import * as huksCallback from './HuksCallbackUtil';

import hilog from '@ohos.hilog'

export async function Cipher(keyAlias: string, cipherOption: huks.HuksOptions, cipherData: CipherData): Promise<boolean> {
  let encryptResult: CipherData;
  let decryptResult: CipherData;
  try {
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    encryptResult = await DoCipher(keyAlias, cipherOption, cipherData);
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    decryptResult = await DoCipher(keyAlias, cipherOption, encryptResult);
    return CompareCipherData(cipherData, decryptResult);
  } catch (err) {
    throw err as Error
  }
}

export async function DoCipher(keyAlias: string, cipherOption: huks.HuksOptions, cipherData: CipherData): Promise<CipherData> {
  let cipherResult: CipherData = {
    updateDataArr: null,
    finishData: null
  };
  try {
    let handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    if (cipherData.updateDataArr != null) {
      let updateData: Array<Uint8Array> = cipherData.updateDataArr as Array<Uint8Array>;
      cipherResult.updateDataArr = new Array<Uint8Array>();
      for (let i = 0; i < updateData.length; i++) {
        cipherOption.inData = updateData[i];
        cipherResult.updateDataArr?.push((await huks.updateSession(handle, cipherOption)).outData as Uint8Array);
      }
    }
    cipherOption.inData = cipherData.finishData as Uint8Array;
    cipherResult.finishData = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    return cipherResult;
  } catch (err: BusinessError) {
    hilog.info(0x0000, 'testTag', '%{public}s', `xxxx catch error ${JSON.stringify(err)}`);
    throw err;
  }
}

export async function cipherWithText(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let preFinishText: Uint8Array = StringToUint8Array(keyAlias);
  let encryptUpdateData: Uint8Array;
  let encryptFinishData: Uint8Array;
  let postUpdateText: Uint8Array;
  let postFinishText: Uint8Array;
  let handle: long;
  try {
    await huks.generateKeyItem(keyAlias, genKeyOption);
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preUpdateText;
    encryptUpdateData = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
    cipherOption.inData = preFinishText;
    encryptFinishData = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptUpdateData;
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    postUpdateText = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
    cipherOption.inData = encryptFinishData;
    postFinishText = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    if (Uint8ArrayToString(postUpdateText) + Uint8ArrayToString(postFinishText) == text + keyAlias) {
      return true;
    } else {
      return false;
    }
  } catch (err) {
    throw err as Error;
  }
}

export async function cipherOnlyFinishWithText(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preText: Uint8Array = StringToUint8Array(text);
  let encryptData: Uint8Array;
  let postText: Uint8Array;
  let handle: long;
  try {
    await huks.generateKeyItem(keyAlias, genKeyOption);
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preText;
    encryptData = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptData;
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    postText = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    if (Uint8ArrayToString(postText) == text) {
      return true;
    } else {
      return false;
    }
  } catch (err) {
    throw err as Error;
  }
}

export async function cipherAbortWithText(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let encryptUpdateData: Uint8Array;
  let postUpdateText: Uint8Array;
  let handle: long;
  try {
    await huks.generateKeyItem(keyAlias, genKeyOption);
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preUpdateText;
    encryptUpdateData = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
    await huks.abortSession(handle, cipherOption);
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptUpdateData;
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    postUpdateText = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
    await huks.abortSession(handle, cipherOption);
    if (Uint8ArrayToString(postUpdateText) == text) {
      return true;
    } else {
      return false;
    }
  } catch (err) {
    throw err as Error;
  }
}

export interface CipherData {
  updateDataArr: Array<Uint8Array> | null,
  finishData: Uint8Array | null
}

export function CompareCipherData(preData: CipherData, postData: CipherData): boolean {
  if (preData.updateDataArr != null) {
    if (postData.updateDataArr == null) {
      return false;
    }
    let preDataArr = preData.updateDataArr as Array<Uint8Array>;
    let postDataArr = postData.updateDataArr as Array<Uint8Array>;
    for (let i: int = 0; i < Double.toInt(preDataArr.length); i++) {
      if (Uint8ArrayToString(postDataArr[i]) != Uint8ArrayToString(preDataArr[i])) {
        return false;
      }
    }
  }
  return Uint8ArrayToString(postData.finishData as Uint8Array) == Uint8ArrayToString(preData.finishData as Uint8Array);
}
