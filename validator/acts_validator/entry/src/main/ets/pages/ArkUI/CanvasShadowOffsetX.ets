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
import { CustomContainer } from '../common/CanvasCustomContainer2';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'CanvasShadowOffsetX';
  @State StepTips: string = '操作步骤：拖动滑块向右移动' + '\n' + '预期结果：阴影会随着拖动距离增大而向右偏移，并显示偏移数值';
  @State Vue: boolean = false;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            Row() {
              Slider({
                value: this.X,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet,
              })
                .trackColor('#4DCB26')
                .selectedColor('#00A7FA')
                .trackThickness('8vp')
                .blockBorderColor('#07B9A2')
                .blockBorderWidth('1vp')
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.context.clearRect(10, 50, 400, 300);
                  this.X = value;
                  this.context.shadowBlur = 10;
                  this.context.shadowOffsetX = (this.X) * 0.1;
                  this.context.shadowColor = 'rgb(0,0,0)';
                  this.context.fillStyle = 'rgb(255,0,0)';
                  this.context.fillRect(150, 150, 100, 100);
                  if (value >= 100) {
                    this.Vue = true;
                  }
                })
            }
          }.width('70%').height('25%')

          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Text('阴影偏移: ' + (this.X) * 0.05)
          }.width('100%').height('20%')

          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Canvas(this.context)
              .width('100%')
              .height('100%')
              .backgroundColor('#ffffffff')
              .onReady(() => {
                this.context.shadowBlur = 10;
                this.context.shadowOffsetX = 0;
                this.context.shadowColor = 'rgb(0,0,0)';
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 100, 100);
              })
          }
          .width('100%')
          .height('55%')
        }
      }
      .scrollBarWidth('6vp')
      .scrollBarColor('#cccccc')
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
        X: $X,
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