/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Qrcode, QrcodeOptions, QrcodeState } from '@ohos.arkui.advanced.Qrcode'
import { LengthMetrics,ColorMetrics } from '@ohos.arkui.node';

@Entry
@ComponentV2
struct Index {
  @Local qrOptions: QrcodeOptions = new QrcodeOptions({})
  @Local state: QrcodeState = QrcodeState.NORMAL
  @Local value: string = 'Test Qrcode'
  build() {
    Column({space:6}) {
      Qrcode({
        options: this.qrOptions,
        value:this.value,
        state:this.state,
      }).key('qrcode01')
        .onClick(()=>{
          console.info('1111111111111111')
          this.state = QrcodeState.LOADING
        })

      Column({space:6}) {
        Row({space:4}) {
          Button('失效')
            .onClick(() => {
              this.state = QrcodeState.EXPIRED
              console.info('失效' + this.state)
            })
            .margin({ top: 10 })

          Button('正常')
            .onClick(() => {
              this.state = QrcodeState.NORMAL
              this.value = '1111111111111111111'
              this.qrOptions.edgeLength = LengthMetrics.vp(125)
              this.qrOptions.color = ColorMetrics.resourceColor(Color.Black)
              this.qrOptions. textContent = '失效'
              this.qrOptions.textColor = ColorMetrics.resourceColor(Color.White)
              console.info('正常' + this.state)
            })
            .margin({ top: 10 })

          Button('刷新')
            .onClick(() => {
              this.state = QrcodeState.LOADING
              console.info('刷新' + this.state)
            })
            .margin({ top: 10 })
        }
        Row({space:4}){
          Button('失效提示').onClick(()=>{
            this.qrOptions.textContent ='The QR code has expired, please refresh'
          })
        }
      }

    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
