/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';
const TAG = 'ets_apiLack_add';

@Entry
@Component
export default struct PanelBackgroundMask {
  @State show1: boolean = false
  @State show2: boolean = false

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear PanelBackgroundMask start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear PanelBackgroundMask end`)
  }

  build() {
    //    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
    Column() {
      Text("panel-BackgroundMask")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("backgroundMaskText")
        .onClick(() => {
          this.show1 = !this.show1
        })

      Text("panel-OnHeightChange")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onHeightChangeText")
        .onClick(() => {
          this.show2 = !this.show2
        })

      Panel(this.show1) {
        Column() {
          Text("panel-BackgroundMask").fontSize(30)
        }
      }
      .backgroundColor('green')
      .type(PanelType.Foldable)
      .mode(PanelMode.Half)
      .dragBar(false)
      .halfHeight(300)
      .onChange((width: number, height: number, mode: PanelMode) => {
        Log.showInfo(TAG, `width:${width},height:${height},mode:${mode}`)
      })
      .backgroundMask('red')

      Panel(this.show2) {
        Column() {
          Text("panel-OnHeightChange").fontSize(30)
        }
      }
      .backgroundColor('red')
      .type(PanelType.Foldable)
      .mode(PanelMode.Half)
      .dragBar(false)
      .halfHeight(300)
      .onChange((width: number, height: number, mode: PanelMode) => {
        console.log(`width:${width},height:${height},mode:${mode}`)
      })
      .onHeightChange((value: number) => {
        Log.showInfo(TAG, 'onHeightChange: ' + value)
      })
    }.width("100%").height("100%")
  }
}
