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

import {CustomContainer} from '../common/ExperienceCustomContainer';
import FirstDialog from '../model/FirstDialog';
import context from '@ohos.app.ability.common';
import router from '@ohos.router';

let abilityContext = getContext(this) as context.UIAbilityContext;

@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'DeskFps';
  @State toSP_daemon: string = 'SP_daemon -editor fpsohtest com.ohos.launcher 桌面';
  @State StepTips: string = '操作步骤：根据操作提示滑动系统桌面测试帧率'+'\n'+'预期结果：帧率大于55帧测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State Fps: string = '0';
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
              Text(`测试步骤:`+ '\n' + '\n' + '\n' + '\n' + `1.点击开始键进入系统桌面`+ '\n' + '\n' + `2.左右滑动系统桌面连续10s以上`
              + '\n' + '\n' + '3.回到DeskFps测试项点击结束键' + '\n' + '\n' + `4.若测试最高帧率大于55帧则通过测试`
              + '\n' + '\n' + '\n' + '\n' + '\n' + '\n' + '\n' + '\n' )
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
                    let str = {
                      bundleName:"com.ohos.launcher",
                      abilityName: "com.ohos.launcher.MainAbility",
                    }
                    abilityContext.startAbility(str).then((data) => {

                    }).catch((error) => {

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
                    this.StartEnable = !this.StartEnable
                    let report = globalThis.resultNum;
//                    let headList = new Array();
//                    let endList = new Array();
//                    let head = report.indexOf(":");
//                    let end = report.indexOf('|');
//                    let Fps = new Array();
//
//                    while(head > -1){
//                      headList.push(head);
//                      head = report.indexOf(":",head + 1);
//                    }
//                    while(end > -1){
//                      endList.push(end);
//                      end = report.indexOf("|",end + 1);
//                    }
//                    for(let i = 0; i < headList.length; i++) {
//                      Fps[i] = Number(report.substring(headList[i]+1,endList[i]));
//                    }
                    let reg = /fps:(\d+)/g;
                    let matches = report.match(reg);
                    let fpsValues = matches.map(match => parseInt(match.substring(4)));
                    let maxFps = Math.max(...fpsValues);
                    this.Fps = maxFps.toString();
                    if(maxFps >= 55) {
                      this.Vue = true;
                    }
                    globalThis.HideFloatingWindow();
                  })
              }
            }
            Row(){
              Text('\n' + '\n' + '\n' + '\n'+ '\n' + '\n' + '\n' + '\n' + `测试结果：` + this.Fps + '帧' )
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
        Fps: $Fps
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Experience/Experience_index',
    })
  }
}
