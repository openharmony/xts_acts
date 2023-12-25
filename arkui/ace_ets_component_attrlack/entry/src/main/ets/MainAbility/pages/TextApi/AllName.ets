/**
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

@Extend(Menu)
function MenuStyles() {
  .clip(true)
  .backgroundColor('#F0F0F0')
}
@Entry
@Component
struct buttonExample {
  @State message: string = 'Hello World'
  @State text: string = '3145897936@QQ.COM'
  @Builder
  LongPressImageCustomMenu() {
    Column() {
      Menu() {
        MenuItemGroup() {
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Long Press Image Menu 1", labelInfo: "" })
            .onClick((event) => {
            })
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "SLong Press Image Menu 2", labelInfo: "" })
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Long Press Image Menu 3", labelInfo: "" })
        }
      }
      .MenuStyles()
    }
  }
  build() {
    Column({space:5}) {
      Text('TextDataDetectorType.EMAIL')
        .id('TextKeyAllName')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({width:1})
        .padding(10)
        .width('100%')
        .enableDataDetector(true)
        .selection(0,3)
        .ellipsisMode(EllipsisMode.START)
        .dataDetectorConfig({types: [TextDataDetectorType.EMAIL],onDetectResultUpdate: (result: string) => {}})
      // .bindSelectionMenu(TextSpanType.IMAGE, this.LongPressImageCustomMenu, TextResponseType.SELECT, {
      //   onDisappear: () => {
      //     console.info(`自定义选择菜单关闭时回调`);
      //   },
      //   onAppear: () => {
      //     console.info(`自定义选择菜单弹出时回调`);
      //   }
      // })

      Text('TextDataDetectorType.URL')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({width:1})
        .padding(10)
        .width('100%')
        .enableDataDetector(true)
        .selection(0,3)
        .ellipsisMode(EllipsisMode.START)
        .dataDetectorConfig({types: [TextDataDetectorType.URL],onDetectResultUpdate: (result: string) => {}})

      Text('TextDataDetectorType.ADDRESS')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({width:1})
        .padding(10)
        .width('100%')
        .enableDataDetector(true)
        .selection(0,3)
        .ellipsisMode(EllipsisMode.START)
        .dataDetectorConfig({types: [TextDataDetectorType.ADDRESS],onDetectResultUpdate: (result: string) => {}})


      Text('TextDataDetectorType.PHONE_NUMBER')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({width:1})
        .padding(10)
        .width('100%')
        .enableDataDetector(true)
        .selection(0,3)
        .ellipsisMode(EllipsisMode.START)
        .dataDetectorConfig({types: [TextDataDetectorType.PHONE_NUMBER],onDetectResultUpdate: (result: string) => {}})

      Button('OK')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          console.log('ButtonType.Normal')
        })
        .buttonStyle(ButtonStyleMode.EMPHASIZED)


      Search({placeholder: 'Type to Search'})
        .searchButton('SEARCH')
        .width('90%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({size: 14,weight: 400})
        .type(SearchType.PHONE_NUMBER)

      Search({placeholder: 'Type 23222'})
        .searchButton('SEARCH')
        .width('90%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({size: 14,weight: 400})
        .type(SearchType.EMAIL)


      Tabs({ barPosition: BarPosition.Start}) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Red)
        }.tabBar(new SubTabBarStyle("red"))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar(new SubTabBarStyle("blue"))

      }
      .width(300)
      .height(200)
      .backgroundColor('#F1F3F5')
      // .customContentTransition( (from: number, to: number) => {
      //   return {timeout: 1000, transition:(proxy: TabContentTransitionProxy) => {}}
      // });

      TextArea({
        text: this.text,
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(36)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .type(TextAreaType.EMAIL)



      TextArea({
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(236)
        .height(36)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .type(TextAreaType.PHONE_NUMBER)


    }.width('100%')
  }

}
