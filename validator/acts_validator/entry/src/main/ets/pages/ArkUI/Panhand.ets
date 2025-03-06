/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { CustomContainer } from '../common/CanvasCustomContainer1';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct Panhand {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State name: string = 'Panhand';
  @State StepTips: string = '操作步骤：1、左手拿手机，左手滑动' + '\n' +'2、左手拿手机，右手滑动' + '\n' +'3、右手拿手机，左手滑动' + '\n' +'4、右手拿手机，右手滑动' + '\n' +'预期结果：1、打印1'+ '\n' +'2、打印2'+ '\n' +'3、打印1'+ '\n' +'4、打印2,关键字hand';
  @State Vue: boolean = false;
  @State myHand:number | undefined= undefined;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Button("PanGesture")
        .width('100%')
        .height(200)
        .gesture(PanGesture()
          .onActionStart((event) => {
            this.Vue = true;
            console.log("start hand" + event.fingerList[0].hand)
          })
          .onActionUpdate((event) => {
            console.log("update hand" + event.fingerList[0].hand)
          })
          .onActionEnd((event) => {
            if (event.fingerList[0]?.hand == undefined) {
              return
            }
            console.log("end hand" + event.fingerList[0]?.hand)
          })
          )


    }
    .width('100%')
    .height('80%')
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/ArkUI/ArkUI_index',
        StepTips: this.StepTips,
        content: this.specificNoParam,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue,
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/ArkUI/ArkUI_index',
    })
  }
}