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
@Entry
@ComponentV2
struct Provider2 {
  @Provider() str: string = 'hello'

  build() {
    Column() {
      Button(this.str)
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.str = '0'
        })
        .id('button1')
      Child1()
    }
  }
}

@ComponentV2
struct Child1 {
  @Consumer() str: string = 'world'

  build() {
    Button(this.str)
      .width('10%')
      .height('3%')
      .fontSize(9)
      .onClick(() => {
        this.str = '1'
      })
      .id('button2')
  }
}