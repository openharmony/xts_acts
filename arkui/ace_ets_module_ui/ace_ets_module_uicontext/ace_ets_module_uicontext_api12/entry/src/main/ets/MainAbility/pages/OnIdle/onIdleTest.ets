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
import { FrameCallback } from "@ohos.arkui.UIContext"
let message = "init"
class CallBack extends FrameCallback {
  private uiContext: UIContext
  private tag: string

  constructor(tag: string, context: UIContext) {
    super()
    this.tag = tag
    this.uiContext = context
  }

  onIdle(idleTimeInNano: number): void {
    message = 'onIdle'
  }
}

@Entry
@Component
struct onIdleTest {
  @State message: string = message
  @State switch: boolean = false
  callBack: CallBack = new CallBack('normTask', this.getUIContext())

  build() {
    Column() {
      Text(this.message)
        .id("OnIdleText")
      Button("OnIdle CallBack")
        .id('OnIdle')
        .onClick(() => {
          this.switch = !this.switch
          if (this.switch) {
            this.getUIContext().postFrameCallback(this.callBack)
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}