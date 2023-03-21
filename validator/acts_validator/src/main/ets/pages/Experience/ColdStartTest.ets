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
import fileio from '@ohos.fileio';
import {CustomContainer} from '../common/StartExperienceCustomContainer';
import FirstDialog from '../model/FirstDialog';
import context from '@ohos.app.ability.common';

let abilityContext = getContext(this) as context.UIAbilityContext;
let path = globalThis.dir;
let SettingsColdPath = path + '/ColdStartSetting.log';
let PhotosColdPath = path + '/ColdStartPhotos.log';
let MmsColdPath = path + '/ColdStartMms.log';
let CameraColdPath = path + '/ColdStartCamera.log';
let ContactsColdPath = path + '/ColdStartContacts.log';
@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'ColdStart';
  @State StepTips: string = '操作步骤：根据操作提示运行脚本文件，启动应用'+'\n'+'预期结果：所有应用冷启动时延低于2000ms则测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State num: number = 0;
  @State setNum: number = 0;
  @State photosNum: number = 0;
  @State mmsNum: number = 0;
  @State cameraNum: number = 0;
  @State contactsNum: number = 0;
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
    this.Vue = false;
  }

  @Builder specificNoParam() {
    Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Column(){
          Row(){
            Text(`根据以下操作步骤完成测试`+ '\n' + '\n' )
              .fontColor(Color.White).fontSize('24fp')
          }
          Row(){
            Text(`测试步骤:`+ '\n' + '\n' + `1.点击开始键进入系统桌面`+ '\n' + '\n' + `2.清空后台应用`+ '\n' + '\n'
            + `3.双击执行.bat选择冷启动测试输入待测应用编号`+ '\n' + '\n' +`4.依次测试完所有应用冷启动返回validator界面`
            + '\n' + '\n' + '5.点击停止键观察测试结果' + '\n' + '\n' + `6.若所有冷启动测试均在规定时延内完成则通过测试`
            + '\n' + '\n' )
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
                  this.StartEnable = !this.StartEnable
                  /*
                            settings
                   */
                  let setFd = fileio.openSync(SettingsColdPath, 0o100 | 0o2002, 0o664);
                  let setBuf = new ArrayBuffer(4096);
                  fileio.readSync(setFd,setBuf);
                  let setReport = String.fromCharCode.apply(null,new Uint8Array(setBuf));
                  let setHead = setReport.indexOf(':');
                  let setTime = setReport.substring(setHead+1);
                  this.setNum = parseFloat(setTime);
                  if( this.setNum < 2000 ) {
                    this.num++
                  }
                  /*
                            photos
                   */
                  let photosFd = fileio.openSync(PhotosColdPath, 0o100 | 0o2002, 0o664);
                  let photosBuf = new ArrayBuffer(4096);
                  fileio.readSync(photosFd,photosBuf);
                  let photosReport = String.fromCharCode.apply(null,new Uint8Array(photosBuf));
                  let photosHead = photosReport.indexOf(':');
                  let photosTime = photosReport.substring(photosHead+1);
                  this.photosNum = parseFloat(photosTime);
                  if( this.photosNum < 2000 ) {
                    this.num++
                  }
                  /*
                            mms
                   */
                  let MmsFd = fileio.openSync(MmsColdPath, 0o100 | 0o2002, 0o664);
                  let MmsBuf = new ArrayBuffer(4096);
                  fileio.readSync(MmsFd,MmsBuf);
                  let MmsReport = String.fromCharCode.apply(null,new Uint8Array(MmsBuf));
                  let MmsHead = MmsReport.indexOf(':');
                  let MmsTime = MmsReport.substring(MmsHead+1);
                  this.mmsNum = parseFloat(MmsTime);
                  if( this.mmsNum < 2000 ) {
                    this.num++
                  }
                  /*
                            camera
                   */
                  let CameraFd = fileio.openSync(CameraColdPath, 0o100 | 0o2002, 0o664);
                  let CameraBuf = new ArrayBuffer(4096);
                  fileio.readSync(CameraFd,CameraBuf);
                  let CameraReport = String.fromCharCode.apply(null,new Uint8Array(CameraBuf));
                  let CameraHead = CameraReport.indexOf(':');
                  let CameraTime = CameraReport.substring(CameraHead+1);
                  this.cameraNum = parseFloat(CameraTime);
                  if( this.cameraNum < 2000 ) {
                    this.num++
                  }
                  /*
                            mms
                   */
                  let ContactsFd = fileio.openSync(ContactsColdPath, 0o100 | 0o2002, 0o664);
                  let ContactsBuf = new ArrayBuffer(4096);
                  fileio.readSync(ContactsFd,ContactsBuf);
                  let ContactsReport = String.fromCharCode.apply(null,new Uint8Array(ContactsBuf));
                  let ContactsHead = ContactsReport.indexOf(':');
                  let ContactsTime = ContactsReport.substring(ContactsHead+1);
                  this.contactsNum = parseFloat(ContactsTime);
                  if( this.contactsNum < 2000 ) {
                    this.num++
                  }
                  if( this.num === 5 ) {
                    this.Vue = true;
                  }
                })
            }
          }
          Row(){
            Text('\n' + '\n' + `测试结果：` + '\n' + '设置冷启动时延' + this.setNum + 'ms' + '\n' + '图库冷启动时延' + this.photosNum
            + 'ms' + '\n'+ '信息冷启动时延' + this.mmsNum + 'ms' + '\n' + '相机冷启动时延' + this.cameraNum + 'ms' + '\n'
            + '联系人冷启动时延' + this.contactsNum + 'ms' + '\n' + '通过冷启动测试项' + this.num + '个')
              .fontColor(Color.White).fontSize('24fp')
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
}
