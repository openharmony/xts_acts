/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import componentUtils from '@ohos.componentUtils';

@Entry
@Component
struct getcomponent {
  @State message: string = 'Hello World'

  getcomponentRect(key){
    let modePosition = componentUtils.getRectangleById(key)
    let widthSize = modePosition.size.width
    let heightSize = modePosition.size.height
    let localOffsetX = modePosition.localOffset.x
    let localOffsetY = modePosition.localOffset.y
    let windowOffsetX = modePosition.windowOffset.x
    let windowOffsetY = modePosition.windowOffset.y
    let screenOffsetX = modePosition.screenOffset.x
    let screenOffsetY = modePosition.screenOffset.y
    let Matrix4Result1 = modePosition.transform
    return {
      "sizeWidth": widthSize,
      "sizeHeight": heightSize,
      "localOffsetX": localOffsetX,
      "localOffsetY": localOffsetY,
      "windowOffsetX": windowOffsetX,
      "windowOffsetY": windowOffsetY,
      "screenOffsetX": screenOffsetX,
      "screenOffsetY": screenOffsetY,
      "Matrix4Result1": Matrix4Result1
    }
  }

  build() {
    Column() {
      Button('next page')
        .size({ width: 90, height: 90 })
        .fontWeight(FontWeight.Bold)
        .id('ArkUX_Get_component_0010')
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')

      Button("返回值").margin(30)
        .onClick(()=>{
          let Rectangle = this.getcomponentRect("ArkUX_Get_component_0010")
          this.message = "sizeWidth: " + Rectangle.sizeWidth + "\n sizeHeight: " + Rectangle.sizeHeight
          + "\n localOffsetX: " + Rectangle.localOffsetX + "\n localOffsetY: " + Rectangle.localOffsetY
          + "\n windowOffsetX: " + Rectangle.windowOffsetX + "\n windowOffsetY: " + Rectangle.windowOffsetY
          + "\n screenOffsetX: " + Rectangle.screenOffsetX + "\n screenOffsetY: " + Rectangle.screenOffsetY
          + "\n Matrix4Result: " + Rectangle.Matrix4Result1.toString()
        })

      Text(this.message).fontSize(25).padding(15).fontWeight(FontWeight.Bold).margin(10)
    }.width("100%").height("100%")
  }
}