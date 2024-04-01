/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export async function varibleWithinHap( ): Promise<boolean> {
  let filePath = '../Calc';
  let lib: ESObject = await import(filePath);
  let res: boolean = false;
  if (lib.add(3, 5) == 8) {
    res = true;
  }
  return res;
}
export async function variableImportRemoteHar( ): Promise<boolean> {
  let packageName = '@ohos/crypto-js';
  let lib: ESObject = await import(packageName);
  let value: string = lib.CryptoJS.MD5("123456").toString();
  let res: boolean = false;
  if (value == 'e10adc3949ba59abbe56e057f20f883e') {
    res = true;
  }
  return res;
}
export async function variableImportOhpm( ): Promise<boolean> {
  let packageName = '@yunkss/eftool';
  let lib: ESObject = await import(packageName);
  let value: string = lib.IdCardUtil.convert15To18("420106640901234").getDataRow();
  let res: boolean = false;
  if (value == '420106194201062348') {
    res = true;
  }
  return res;
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}