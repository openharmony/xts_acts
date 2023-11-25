/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { reg } from './commonParam';
import { DataUint8Array, IAnyObj } from './commonType';

function stringToArray(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return arr;
}

//字节流转成可理解的字符串
function uInt8ArrayToString(fileData: Uint8Array) {
  let dataString = "";
  for (let i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}

//可理解的字符串转成自字节流
function stringTouInt8Array(str: string): Uint8Array {
  if (str.length == 0) {
    console.error("stringTouInt8Array length is 0");
  }
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  let tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
}

//字节流以16进制形式输出
function uInt8ArrayToShowStr(uInt8Array: Uint8Array): string {
  if (uInt8Array.length == 0) {
    console.error("uInt8ArrayToShowStr length is 0");
  }
  const list: string[] = [];
  for (let index = 0; index < uInt8Array.length; index++) {
    const element = uInt8Array[index];
    const temp = ("00" + element.toString(16)).slice(-2);
    list.push(temp);
  }
  return list.join("");
}

function genIvParamsSpec(n: number) {
  let arr: number[];
  if (n == 8) {
    arr = [0, 0, 0, 0, 0, 0, 0, 0];
  } else if (n == 16) {
    arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  } else {
    console.error("genIvParamsSpec error: n = " + n);
    return null;
  }
  let dataIv = new Uint8Array(arr);
  let dataBlob: DataUint8Array = { data: dataIv };
  let ivParamSpec: IAnyObj = {
    iv: dataBlob,
    algoName: "IvParamsSpec",
  };
  return ivParamSpec;
}

function genGcmParamsSpec() {
  let arr: number[] = [0, 0, 0, 0, 0, 0, 0, 0];
  let dataAad = new Uint8Array(arr);
  let aadBlob: DataUint8Array = { data: dataAad };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataIv = new Uint8Array(arr);
  let ivBlob: DataUint8Array = { data: dataIv };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag = new Uint8Array(arr);
  let tagBlob: IAnyObj = { data: dataTag };
  let gcmParamsSpec: IAnyObj = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algoName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}

function genCcmParamsSpec() {
  let arr = [0, 0, 0, 0, 0, 0, 0];
  let dataIv = new Uint8Array(arr);
  let ivBlob: DataUint8Array = { data: dataIv };
  arr = [0, 0, 0, 0, 0, 0, 0, 0];
  let dataAad = new Uint8Array(arr);
  let aadBlob: DataUint8Array = { data: dataAad };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag = new Uint8Array(arr);
  let tagBlob: DataUint8Array = { data: dataTag };
  let ccmParamsSpec: IAnyObj = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algoName: "CcmParamsSpec",
  };
  return ccmParamsSpec;
}

function genKeyMaterialBlob(keyLen: number) {
  let arr: number[];
  if (keyLen == 128) {
    //16字节
    arr = [
      0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56, 0xad, 0x47, 0xfc, 0x5a,
      0x46, 0x39, 0xee, 0x7c,
    ];
  } else if (keyLen == 192) {
    //24字节
    arr = [
      0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56, 0xad, 0x47, 0xfc, 0x5a,
      0x46, 0x39, 0xee, 0x7c, 0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56,
    ];
  } else if (keyLen == 256) {
    //32字节
    arr = [
      0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56, 0xad, 0x47, 0xfc, 0x5a,
      0x46, 0x39, 0xee, 0x7c, 0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56,
      0xad, 0x47, 0xfc, 0x5a, 0x46, 0x39, 0xee, 0x7c,
    ];
  } else {
    console.error("genKeyMaterialBlob: KeyLen may be error");
    arr = [];
    for (let i = 0; i < keyLen; i++) {
      arr[i] = 0xba;
    }
  }

  let keyMaterial = new Uint8Array(arr);
  let keyMaterialBlob: DataUint8Array = { data: keyMaterial };
  return keyMaterialBlob;
}

function convertToUint8Array(str: string) {
  const match = str.match(reg);
  let temp: number[] = [];
  if(match) {
    temp = match.map((h) => {
      return Number("0x" + h);
    });
  }
  return new Uint8Array(
    temp
  );
}


export {
  stringToArray,
  uInt8ArrayToString,
  stringTouInt8Array,
  uInt8ArrayToShowStr,
  genGcmParamsSpec,
  genIvParamsSpec,
  genCcmParamsSpec,
  genKeyMaterialBlob,
  convertToUint8Array
};
