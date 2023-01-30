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
import {CustomContainer} from '../common/CanvasCustomContainer2';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'CanvasMiterLimit';
  @State StepTips: string = '操作步骤：向右拖动MiterLimit按键'+'\n'+'预期结果：斜接面限制值会随拖动距离变化，并显示限制值大小';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
          Text('MiterLimit').fontSize(18).border({width:2}).size({width:'40%',height:'30%'})
            .translate({ x: this.X, y: 20, z: 5 })
            .gesture(
            PanGesture({})
              .onActionStart((event: GestureEvent) => {
                this.context.clearRect(100, 100, 250, 200);
                console.info('Pan start');
              })
              .onActionUpdate((event: GestureEvent) => {
                this.X = event.offsetX;
              })
              .onActionEnd(() => {
                console.info('Pan end');
              })
            )
          Text('边框粗细: ' + (this.X)*0.05 )
        }.width('70%').height('30%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#ffffffff')
          .onReady(() =>{
            this.context.lineWidth = 8;
            this.context.lineJoin = 'miter';
            this.context.miterLimit = (this.X)*0.05;
            this.context.moveTo(160, 100);
            this.context.lineTo(190, 105);
            this.context.lineTo(160, 107);
            this.context.stroke();
          })
      }.width('100%').height('70%')
    }.width('100%').height('80%').backgroundColor(Color.White)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/ArkUI/ArkUI_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        FillColor:$FillColor,
        X:$X,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}