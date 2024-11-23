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
@Component
struct SearchAutoDisable {
  controller: SearchController = new SearchController()
  @State changeValue: string = ''
  @State autoDisable: boolean = false
  options: SearchButtonOptions = { autoDisable: this.autoDisable };

  build() {
    Column({ space: 10 }) {
      Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
        .searchButton('SEARCH')
        .width('90%')
        .height('10%')
        .backgroundColor('#F5F5F5')
        .textFont({ size: 14 })
        .id('SearchAutoDisable_1')

      Button('add changeValue')
        .width('90%')
        .height('10%')
        .id('SearchAutoDisable_button1')
        .onClick(()=>{
          this.changeValue = 'Hello'
        })
      
      Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
        .searchButton('SEARCH', this.options)
        .width('90%')
        .height('10%')
        .backgroundColor('#F5F5F5')
        .textFont({ size: 14 })
        .id('SearchAutoDisable_2')

      Button('Change autoDisable')
        .width('90%')
        .height('10%')
        .id('SearchAutoDisable_button2')
        .onClick(()=>{
          this.autoDisable = !this.autoDisable
        })
    }
    .width('100%')
    .height('100%')
  }
}