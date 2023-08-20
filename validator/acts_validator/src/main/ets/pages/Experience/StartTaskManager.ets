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
import context from '@ohos.app.ability.common';

let abilityContext = getContext(this) as context.UIAbilityContext;

@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'StartTaskManager';
  @State toSP_daemon: string = 'SP_daemon -editor completeTime com.ohos.launcher ohtest';
  @State StepTips: string = '操作步骤：根据操作提示打开任务管理器'+'\n'+'预期结果：打开任务管理器时延小于1000ms测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State time: string = '0';
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
              Text(`测试步骤:`+ '\n' + '\n' + '\n' + '\n' + `1.点击开始键进入桌面` + '\n' + '\n' + '\n' + '\n' +
              `2.点击右下角方框开启任务管理器` + '\n' + '\n' + '3.待测试执行结束回到Validator点击结束键' + '\n' + '\n'
              + `4.若启动任务管理器时延小于或等于1000ms则通过测试` + '\n' + '\n' + '\n' + '\n' )
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
                    let head = report.indexOf(":");
                    this.time = report.substring(head+1);
                    let time = parseFloat(this.time)
                    if( 0 < time && time < 1000 ) {
                      this.Vue = true;
                    }
                    globalThis.HideFloatingWindow();
                  })
              }
            }
            Row(){
              Text('\n' + '\n' + '\n' + '\n'+ '\n' + '\n' + '\n' + '\n' + `启动任务管理器时延：` + this.time + 'ms' )
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