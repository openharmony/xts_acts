/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import {CustomContainer} from '../common/TimeExperienceCustomContainer';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'ViewPhoto';
  @State toSP_daemon: string = 'SP_daemon -editor responseTime com.ohos.photos ohtest';
  @State StepTips: string = '操作步骤：根据操作提示点击图片等待加载'+'\n'+'预期结果：图片响应时延小于150ms测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State time: number = 0;
  scroller: Scroller = new Scroller();
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
    this.Vue = false;
    globalThis.SendMessage = this.toSP_daemon;
    globalThis.HideFloatingWindow();
  }

  @Builder specificNoParam() {
    Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Scroll(this.scroller) {
          Column(){
            Row(){
              Text(`根据以下操作步骤完成测试`+ '\n' + '\n' + '\n' + '\n'+ '\n' + '\n' + '\n' + '\n')
                .fontColor(Color.White).fontSize('24fp')
            }
            Row(){
              Text(`测试步骤:`+ '\n' + '\n' + '\n' + '\n' + `1.在图库中预置500张图片`+ '\n' + '\n' + `2.点击开始键进入图库`
              + '\n' + '\n' + `3.点击一张图库缩略图等待响应` + '\n' + '\n' + '4.待测试执行结束回到Validator点击结束键'
              + '\n' + '\n' + `5.若图片响应时延小于或等于150ms则通过测试` + '\n' + '\n' + '\n' + '\n' )
                .fontColor(Color.White).fontSize('20fp')
            }
            Row(){
              Column(){
                Button(`开始`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(this.StartEnable)
                  .opacity(this.StartEnable? 1 : 0.4)
                  .onClick(async () => {
                    globalThis.ShowFloatingWindow();
                    this.StartEnable = !this.StartEnable;
                    let bundleName=new String("com.ohos.photos").toString();
                    let abilityName=new String("com.ohos.photos.MainAbility").toString();
                    let str = {
                      "bundleName": bundleName,
                      "abilityName": abilityName,
                    }

                    globalThis.abilityContext.startAbility(str, (err, data) => {
                      if(err) {
                        return;
                      }
                    })
                  })
              }
              Column(){
                Button(`结束`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(!this.StartEnable)
                  .opacity(!this.StartEnable? 1 : 0.4)
                  .onClick(() => {
                    this.StartEnable = !this.StartEnable;
                    let report = globalThis.resultNum;
                    let head = report.indexOf(":");
                    this.time = report.substring(head+1);
                    // let time = parseFloat(this.time)
                    let time = this.time;
                    if( 0 < time && time < 150 ) {
                      this.Vue = true;
                    } else if ( isNaN(this.time) ){
                      this.time = -1000;
                    }
                    globalThis.HideFloatingWindow();
                  })
              }
            }
            Row(){
              Text('\n' + '\n' + '\n' + '\n'+ '\n' + '\n' + '\n' + '\n' + `图片响应时延：` + this.time + 'ms' )
                .fontColor(Color.White).fontSize('24fp')
            }
          }
        }
      }
    }.width('100%').height('80%').backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/Experience/Experience_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        name:$name,
        Vue: $Vue,
        StartEnable: $StartEnable,
        time: $time
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Experience/Experience_index',
    })
  }
}