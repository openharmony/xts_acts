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
  @State name: string = 'CanvasFillStyle';
  @State StepTips: string = '操作步骤：点击不同的字体控件'+'\n'+'预期结果：原本默认字体会改变';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Row(){
          Text('').fontSize(0).border({width:0}).size({width:'0%',height:'1%'})
        }
        Row({space:10}){
          Text('font-style').fontSize(13).border({width:0}).size({width:'24%',height:'18%'})

          Text('normal').fontSize(13).border({width:2}).size({width:'24%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('italic').fontSize(13).border({width:2}).size({width:'24%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'italic normal 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
        }
        Row({space:8}) {
          Text('font-weight').fontSize(13).border({ width: 0 }).size({ width: '24%', height: '18%' })

          Text('normal').fontSize(13).border({ width: 2 }).size({ width: '16%', height: '18%' })
            .onClick(() => {
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('bold').fontSize(13).border({width:2}).size({width:'16%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal bold 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('bolder').fontSize(13).border({width:2}).size({width:'16%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal bolder 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('lighter').fontSize(13).border({width:2}).size({width:'16%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal lighter 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
        }
        Row({space:5}) {

          Text('100').fontSize(13).border({ width: 2 }).size({ width: '10%', height: '18%' })
            .onClick(() => {
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 100 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('200').fontSize(13).border({width:2}).size({width:'10%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 200 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('300').fontSize(13).border({width:2}).size({width:'10%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 300 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('400').fontSize(13).border({width:2}).size({width:'10%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 400 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('500').fontSize(13).border({width:2}).size({width:'10%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 500 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('600').fontSize(13).border({width:2}).size({width:'10%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 600 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('700').fontSize(13).border({width:2}).size({width:'10%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 700 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('800').fontSize(13).border({width:2}).size({width:'10%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 800 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('900').fontSize(13).border({width:2}).size({width:'10%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal 900 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
        }
        Row({space:10}){
          Text('font-family').fontSize(13).border({width:0}).size({width:'24%',height:'18%'})

          Text('sans-serif').fontSize(13).border({width:2}).size({width:'24%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('serif').fontSize(13).border({width:2}).size({width:'24%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 120px serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('monospace').fontSize(13).border({width:2}).size({width:'24%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 120px monospace'
              this.context.fillText("Hello World", 80, 120)
            })
        }
        Row({space:10}) {
          Text('font-size').fontSize(13).border({ width: 0 }).size({ width: '18%', height: '18%' })

          Text('small').fontSize(13).border({ width: 2 }).size({ width: '18%', height: '18%' })
            .onClick(() => {
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 10px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('medium').fontSize(13).border({width:2}).size({width:'18%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 50px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('large').fontSize(13).border({width:2}).size({width:'18%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 80px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
          Text('extra').fontSize(13).border({width:2}).size({width:'18%',height:'18%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300)
              this.context.font = 'normal normal 120px sans-serif'
              this.context.fillText("Hello World", 80, 120)
            })
        }

      }.width('90%').height('30%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#ffffffff')
          .onReady(() =>{
            this.context.font = '120px sans-serif'
            this.context.fillText("Hello World", 80, 120)
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
