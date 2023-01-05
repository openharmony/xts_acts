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
import {CustomContainer} from '../common/CanvasCustomContainer1';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State name: string = 'CanvasGlobalCompositeOperation';
  @State StepTips: string = '操作步骤：点击不同的合成操作的方式'+'\n'+'预期结果：原本默认合成方式会随点击变化';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Row(){
          Text('').fontSize(0).border({width:0}).size({width:'0%',height:'2%'})
        }
        Row({space:10}){
          Text('s-over').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300);
            this.context.fillStyle = 'rgb(255,0,0)';
            this.context.fillRect(150, 150, 50, 50);
            this.context.globalCompositeOperation = 'source-over';
            this.context.fillStyle = 'rgb(0,0,255)';
            this.context.fillRect(180, 180, 50, 50);
          })
          Text('s-atop').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'source-atop';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
          Text('s-in').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'source-in';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
          Text('s-out').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=>{
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'source-out';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
        }
        Row({space:10}){
          Text('d-over').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=> {
            this.context.clearRect(0, 10, 350, 300);
            this.context.fillStyle = 'rgb(255,0,0)';
            this.context.fillRect(150, 150, 50, 50);
            this.context.globalCompositeOperation = 'destination-over';
            this.context.fillStyle = 'rgb(0,0,255)';
            this.context.fillRect(180, 180, 50, 50);
          })
          Text('d-atop').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=> {
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'destination-atop';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
          Text('d-in').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=> {
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'destination-in';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
          Text('d-out').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=> {
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'destination-out';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
        }
        Row({space:10}){
          Text('lighter').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=> {
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'lighter';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
          Text('copy').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=> {
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'copy';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
          Text('xor').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
            .onClick(()=> {
              this.context.clearRect(0, 10, 350, 300);
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(150, 150, 50, 50);
              this.context.globalCompositeOperation = 'xor';
              this.context.fillStyle = 'rgb(0,0,255)';
              this.context.fillRect(180, 180, 50, 50);
            })
          Text('').fontSize(0).border({width:0}).size({width:'18%',height:'20%'})
        }
      }.width('90%').height('30%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#ffffffff')
          .onReady(() =>{
            this.context.fillStyle = 'rgb(255,0,0)';
            this.context.fillRect(150, 150, 50, 50);
            this.context.globalCompositeOperation = 'source-over';
            this.context.fillStyle = 'rgb(0,0,255)';
            this.context.fillRect(180, 180, 50, 50);
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