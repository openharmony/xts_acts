/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct imageAnimator02 {
  private surfaceId: string = ''
  private xComponentContext: Record<string, () => void> = {}
  xComponentController: XComponentController = new XComponentController()

  build() {
    Column() {
      ImageAnimator()
        .images([
          {
            src: 'images/test1.jpg'
          },
          {
            src: 'images/test1.jpg',
            left:'30px'
          },
          {
            src: 'images/test1.jpg',
            left:30
          },
          {
            src: 'images/test1.jpg',
            top:'30px'
          },
          {
            src: 'images/test1.jpg',
            top:30
          },
        ])
        .fillMode(FillMode.None)
        .width(340)
        .height(240)
        .onStart(() => {
          console.info('imageAnimator02 Start')
        })
        .onPause(() => {
          console.info('imageAnimator02 Pause')
        })
        .onRepeat(() => {
          console.info('imageAnimator02 Repeat')
        })
        .onCancel(() => {
          console.info('imageAnimator02 Cancel')
        })
        .onFinish(() => {
          console.info('imageAnimator02 Finish')
        })
        .id('imageAnimator02')
    }
    .backgroundColor(Color.Black)
  }
}