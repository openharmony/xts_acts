/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { router, BuilderNode } from '@kit.ArkUI';
import promptAction from '@ohos.promptAction'

@Preview
@Component
export struct MyComponent {
  title: string = 'test'
  func: () => void = () => {
  }

  @Styles
  pressedStyle(){
    .backgroundColor(0x238E23)
  }

  @Styles
  normalStyles() {
    .backgroundColor(0x0000ff)
  }

  build() {
    Text(this.title)
      .key(this.title)
      .fontSize(10)
      .backgroundColor(0x0000ff)
      .fontColor(0xffffff)
      .padding(5)
      .onClick(this.func)
      .stateStyles({ pressed: this.pressedStyle, normal: this.normalStyles })
  }
}

@Extend(Text)
function paramTextStyle() {
  .fontSize(9)
  .width('100%')
}

@Extend(Text)
function componentTextStyle() {
  .fontSize(15)
  .backgroundColor(Color.Orange)
  .margin(3)
  .padding(3)
  .borderWidth(1.0)
}

@Extend(Column)
function columnStyle() {
  .borderWidth(1.0)
  .padding(10)
  .width('100%')
  .backgroundColor(Color.Pink)
}


@Entry
@Component
struct openCustomDialogMode {
  scroller: Scroller = new Scroller()
  @State showInSubWindow: boolean = false
  @State levelMode: LevelMode | undefined | null = 0
  node: BuilderNode<Object[]> | null = null;
  frameNode: FrameNode | null = null;
  @State levelUniqueId: number | undefined= this.getUniqueId()
  @State immersiveMode: ImmersiveMode | undefined | null  = 0
  @State isModal: boolean = true
  @State maskRect: Rectangle = {
    x: 0,
    y: 130,
    width: '100%',
    height: '100%'
  }
  @State customDialogComponentId: number = 0
  WillAppear: Callback<void> = () => {
    console.info('---1237---    dialog onWillAppear')
  }
  DidAppear: Callback<void> = () => {
    console.info('---1237---    dialog onDidAppear')
  }
  willDisappear: Callback<void> = () => {
    console.info('---1237---    dialog onWillDisappear')
  }
  DidDisappear: Callback<void> = () => {
    console.info('---1237---    dialog onDidDisappear')
  }

  @Builder
  customDialogPresent() {
    Column({ space: 5 }) {
      Text('自定义弹窗')
      Button('确认')
        .height('8%')
        .id('close')
        .onClick(() => {
          promptAction.closeCustomDialog(this.customDialogComponentId)
        })
      Button('取消')
        .height('8%')
        .onClick(() => {
          promptAction.closeCustomDialog(this.customDialogComponentId)
        })
    }.borderRadius(10)
    .backgroundColor(Color.White)
  }

  aboutToAppear() {
    this.levelUniqueId = this.getUniqueId();
  }

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 }) {
        Text('返回首页')
          .componentTextStyle()
          .onClick(() => {
            router.pushUrl({
              url: 'MainAbility/pages/actionSheet/index'
            }, router.RouterMode.Standard)
          })
          .id('back')

        Column({ space: 5 }) {
          Row({ space: 3 }) {
            MyComponent({
              title: 'levelMode: OVERLAY', func: () => {
                this.levelMode = 0
              }
            })
            MyComponent({
              title: 'levelMode: EMBEDDED', func: () => {
                this.levelMode = 1
              }
            })
          }

          Row({ space: 3 }) {
            MyComponent({
              title: 'undefined', func: () => {
                this.levelMode = undefined
              }
            })
            MyComponent({
              title: 'null', func: () => {
                this.levelMode = null
              }
            })
          }


          Row({ space: 3 }) {
            MyComponent({
              title: 'uniqId: Normal value', func: () => {
                const node: FrameNode | null = this.getUIContext().getFrameNodeById('pageCol') || null;
                this.levelUniqueId = node?.getUniqueId();
              }
            })
            MyComponent({
              title: 'uniqId: Abnormal value', func: () => {
                this.levelUniqueId = 1237
              }
            })
          }


          Row({ space: 3 }) {
            MyComponent({
              title: 'imMode: default', func: () => {
                this.immersiveMode = 0
              }
            })
            MyComponent({
              title: 'imMode: extend', func: () => {
                this.immersiveMode = 1
              }
            })
            MyComponent({
              title: 'imMode: invalid', func: () => {
                this.immersiveMode = 7
              }
            })
          }
        }
        .columnStyle()

        Column({ space: 5 }) {
          Text(`prompt_openCustomDialog`)
            .id('openCustomDialog')
            .componentTextStyle()
            .onClick(() => {
              promptAction.openCustomDialog({
                builder: () => {
                  this.customDialogPresent()
                },

                levelMode: this.levelMode,
                levelUniqueId: this.levelUniqueId,
                immersiveMode: this.immersiveMode,

                showInSubWindow: this.showInSubWindow,
                isModal: this.isModal,

                onWillAppear: this.WillAppear,
                onDidAppear: this.DidAppear,
                onWillDisappear: this.willDisappear,
                onDidDisappear: this.DidDisappear,

                maskRect: this.maskRect,
                alignment: DialogAlignment.Bottom
              })
                .then((dialogId: number) => {
                  this.customDialogComponentId = dialogId
                })
            })

        }
        .id('pageCol')
        .width('100%')
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}