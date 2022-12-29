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
import {CustomContainer} from '../common/CanvasCustomContainer1'
import FirstDialog from '../model/FirstDialog'
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State name: string = 'CanvasTextAlign';
  @State StepTips: string = '操作步骤：点击不同的文本对齐方式控件'+'\n'+'预期结果：原本默认的对齐方式会随点击变化';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Text('start').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300)
            this.context.lineWidth = 2
            this.context.moveTo(180, 10)
            this.context.lineTo(180, 310)
            this.context.stroke()
            this.context.textAlign = 'start'
            this.context.fillText('textAlign=start', 180, 160)
          })
        Text('end').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300)
            this.context.lineWidth = 2
            this.context.moveTo(180, 10)
            this.context.lineTo(180, 310)
            this.context.stroke()
            this.context.textAlign = 'end'
            this.context.fillText('textAlign=end', 180, 160)
          })
        Text('left').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300)
            this.context.lineWidth = 2
            this.context.moveTo(180, 10)
            this.context.lineTo(180, 310)
            this.context.stroke()
            this.context.textAlign = 'left'
            this.context.fillText('textAlign=left', 180, 160)
          })
        Text('center').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300)
            this.context.lineWidth = 2
            this.context.moveTo(180, 10)
            this.context.lineTo(180, 310)
            this.context.stroke()
            this.context.textAlign = 'center'
            this.context.fillText('textAlign=center', 180, 160)
          })
        Text('right').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=> {
            this.context.clearRect(0, 10, 350, 300)
            this.context.lineWidth = 2
            this.context.moveTo(180, 10)
            this.context.lineTo(180, 310)
            this.context.stroke()
            this.context.textAlign = 'right'
            this.context.fillText('textAlign=right', 180, 160)
          })
      }.width('90%').height('30%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#ffffffff')
          .onReady(() =>{
            this.context.lineWidth = 2
            this.context.moveTo(180, 10)
            this.context.lineTo(180, 310)
            this.context.stroke()

            this.context.font = '60px sans-serif'

            this.context.textAlign = 'start'
            this.context.fillText('textAlign=start', 180, 160)
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
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}