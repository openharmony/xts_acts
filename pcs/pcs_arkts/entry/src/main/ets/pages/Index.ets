/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router'

let mXComponentController: XComponentController = new XComponentController()

@Entry
@Component
struct Index {
  @State message: string = 'Next Page'
  @State imageLoadSuccess: string = "LoadFalse"

  build() {
    Row() {
      Column() {
        Button(this.message)
          .id('firstButton')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.pushUrl({ url: "pages/SecondPage" })
          })
        Text($r('app.string.Multilingual_Text'))
          .id('multilingualText')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Image($rawfile('test.png'))
          .id('image')
          .height('20%')
          .onComplete((event) => {
            this.imageLoadSuccess = "LoadSuccess"
          })
        Text(this.imageLoadSuccess.toString())
          .id('imageLoadSuccess')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        XComponent({
          id: '',
          type: 'surface',
          libraryname: '',
          controller: mXComponentController
        }).onLoad(() => {
          mXComponentController.setXComponentSurfaceSize({ surfaceWidth: 500, surfaceHeight: 500 })
        })
          .width('30%')
          .height('30%')

        Text(mXComponentController.getXComponentSurfaceId())
          .id("surfaceId")
      }
      .width('100%')
    }
    .height('100%')
  }
}