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
import {CustomContainer} from '../common/StartExperienceCustomContainer';
import FirstDialog from '../model/FirstDialog';
import context from '@ohos.app.ability.common';

let abilityContext = getContext(this) as context.UIAbilityContext;
@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'ContactsHotStart';
  @State toSP_daemon: string = 'SP_daemon -editor hotStart com.ohos.contacts 联系人 ohtest';
  @State StepTips: string = '操作步骤：根据操作提示运行脚本文件，启动应用'+'\n'+'预期结果：应用热启动时延小于600ms则测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State num: number = 0;
  @State setNum: number = 0;
  @State photosNum: number = 0;
  @State mmsNum: number = 0;
  @State cameraNum: number = 0;
  @State contactsNum: number = 0;
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
              Text(`根据以下操作步骤完成测试`+ '\n' + '\n' )
                .fontColor(Color.White).fontSize('24fp')
            }
            Row(){
              Text(`测试步骤:`+ '\n' + '\n' + '\n' + '\n' + `1.点击开始键进入系统桌面`+ '\n' + '\n'
              + `2.开启联系人应用回退到桌面，保证此时后台应用存在` + '\n' + '\n' + `3.再次启动桌面联系人应用`+ '\n' + '\n' +
              `4.测试应用拉起后返回validator界面` + '\n' + '\n' + '5.点击结束键观察测试结果' + '\n' + '\n'
              + `6.若联系人热启动测试在规定时延内完成则通过测试` + '\n' + '\n' + '\n' + '\n' )
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
                    this.num = 0;
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
                    this.StartEnable = !this.StartEnable;
                    /*
                              Contacts
                     */
                    let ContactsReport = globalThis.resultNum;
                    let ContactsHead = ContactsReport.indexOf(':');
                    let ContactsTime = ContactsReport.substring(ContactsHead+1);
                    this.contactsNum = parseFloat(ContactsTime);
                    if( 0 < this.contactsNum && this.contactsNum < 600 ) {
                      this.num++
                    } else if ( isNaN(this.contactsNum )){
                      this.contactsNum = -1000;
                    }
                    if( this.num === 1 ) {
                      this.Vue = true;
                    }
                    globalThis.HideFloatingWindow();
                  })
              }
            }
            Row(){
              Text('\n' + '\n' + '\n' + '\n' + `测试结果：` + '\n' + '\n' + '联系人热启动时延' + this.contactsNum + 'ms')
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
        num: $num,
        setNum: $setNum,
        photosNum: $photosNum,
        mmsNum: $mmsNum,
        cameraNum: $cameraNum,
        contactsNum: $contactsNum,
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Experience/Experience_index',
    })
  }
}
