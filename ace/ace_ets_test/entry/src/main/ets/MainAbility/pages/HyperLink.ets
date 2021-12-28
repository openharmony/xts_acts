/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
 
@Entry
@Component
struct hyperLink_testcase {
  @State active: boolean = false

  build() {
    Column() {
      Column() {
        Hyperlink('https://developer.harmonyos.com/', 'Go to the developer website') {
          Text("click to link to developer page")
            .fontSize(30)
        }.color("#008000")
        .key('hyperlink1')
      }.width('100%').margin({ top: 5 })
    }
    .width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}
