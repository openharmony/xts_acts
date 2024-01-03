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


@Entry
@Component
struct buttonExample {

  build() {
    Column() {
      Button('OK')
        .id('buttonStyle')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          console.log('1111111111111' + JSON.parse(getInspectorByKey('TextKeyAllNUMBER8898888888')).$attrs)
          // let text1 = JSON.parse(getInspectorByKey('searchType777777'));
          // let Obj1 = JSON.parse(text1);
          // expect(Obj1.$attrs.ellipsisMode).assertEqual('EllipsisMode.START');

        })
        .buttonStyle(ButtonStyleMode.EMPHASIZED)


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



    }.width('100%')
  }

}
