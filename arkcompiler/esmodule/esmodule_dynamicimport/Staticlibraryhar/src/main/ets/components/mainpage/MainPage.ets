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

export async function withinHarTest( ): Promise<boolean> {
  let lib = await import('../../Calc')
  let res: boolean = false
  if (lib.add(3, 5) == 8) {
    res = true;
  }
  return res;
}
export async function varibleWithinHarPath( ): Promise<boolean> {
  let filePath = '../../Calc'
  let lib: ESObject = await import(filePath)
  let res: boolean = false
  if (lib.add(3, 5) == 8) {
    res = true;
  }
  return res;
}
@Component
export struct MainPage {
  @State message: string = 'I am a har';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
