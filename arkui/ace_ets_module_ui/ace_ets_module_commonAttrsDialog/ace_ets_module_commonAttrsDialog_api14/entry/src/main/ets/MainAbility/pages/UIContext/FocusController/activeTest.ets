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
struct activeTest {
  @State active: boolean = false
  @State autoInactive: boolean = false

  aboutToAppear() {
    this.getUIContext().getFocusController().activate(this.active, this.autoInactive)
  }

  aboutToDisappear() {
    this.getUIContext().getFocusController().activate(false)
  }

  build() {
    Column({ space: 20 }) {
      Column({ space: 10 }) {
        Button('Button1')
          .id('button1')
          .width(200)
          .height(70)
          .defaultFocus(true)


        Button('Button2')
          .width(200)
          .height(70)

        Button('Button3')
          .width(200)
          .height(70)
      }

      Column({ space: 10 }) {
        Text(this.active +' '+ this.autoInactive).id('text')
        Button('change active: ' + this.active)
          .id('active1')
          .onClick(() => {
            this.active = !this.active
            this.getUIContext().getFocusController().activate(this.active, this.autoInactive)
          })
        Button('change autoInactive: ' + this.autoInactive)
          .id('active2')
          .onClick(() => {
            this.autoInactive = !this.autoInactive
            this.getUIContext().getFocusController().activate(this.active, this.autoInactive)
          })

        Button('no autoInactive: ' + this.active)
          .id('active3')
          .onClick(() => {
            this.active = !this.active
            this.getUIContext().getFocusController().activate(this.active)
          })
        Button('init')
          .id('init')
          .onClick(() => {
            this.active = false
            this.autoInactive = false
          })

      }
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}