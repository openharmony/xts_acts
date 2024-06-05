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

import { CustomContainer } from '../common/PCSCustomContainer';
import FirstDialog from '../model/FirstDialog';
import context from '@ohos.app.ability.common';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import screenLock from '@ohos.screenLock';
import power from '@ohos.power';

let abilityContext = getContext(this) as context.UIAbilityContext;

/*
* @tc.number: C-STD-SECURITY-0409
* @tc.name: testRebootScreenUnlock
* @tc.desc: 【C-STD-SECURITY-0409】如果设备设置了锁屏口令，设备重启后，用户首次解锁屏幕，系统仅允许使用锁屏口令认证。
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
@Entry
@Component
struct testRebootScreenUnlock {
  @State name: string = 'RebootScreenUnlock';
  @State stepTips: string = '操作步骤：设置锁屏密码，若支持其他认证方式，设置其他认证方式开启' + '\n' + '重启设备，查看首次解锁是否只可使用口令认证解锁' + '\n' +
                            '预期结果：重启后首次解锁只可以使用口令认证，不可以使用其他认证方式，如人脸、指纹等';
  @State testResult: boolean = false;
  @State startEnable: boolean = true;
  @State result: string = 'UNDEFINED';
  scroller: Scroller = new Scroller();

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.stepTips, this.name);
    this.testResult = false;
    this.startEnable = true;
    this.result = 'UNDEFINED';
  }

  @Builder
  specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Scroll(this.scroller) {
          Column() {
            Button(`设备不支持其他认证方式`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('50%')
              .margin('10vp')
              .onClick(async () => {
                this.testResult = true
              })

            Row() {
              Text('\n' + '\n' + `根据以下操作步骤完成测试` + '\n' + '\n')
                .fontColor(Color.White)
                .fontSize('24fp')
            }

            Row() {
              Text(`测试步骤:` + '\n' + '\n' + '\n' + '\n' + `1.若设备除口令认证外，不支持其他认证方式，点击\'设备不支持其他认证方式\'按钮结束测试` + '\n' + '\n' +
                `2.进入设置应用，生物识别和密码页面，设置锁屏密码，同时设置其他认证方式，如人脸认证、指纹认证等` + '\n' + '\n' + 
                `3.返回validator，点击\'设置锁屏认证完成\'按钮` + '\n' + '\n' +
                `4.自行重启设备，重启后，解锁屏幕：若可以使用除口令外的其他认证方式，则测试失败；否则测试通过。点击\'重启设备完成\'按钮` + '\n' + '\n')
                
                .fontColor(Color.White)
                .fontSize('20fp')
            }

            Row() {
              Column() {
                Button(`设置锁屏认证完成`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .onClick(async () => {
                    this.startEnable = true
                  })
                Blank('10%')
                Button(`重启设备完成`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .enabled(this.startEnable)
                  .opacity(this.startEnable ? 1 : 0.4)
                  .onClick(async () => {
                    this.testResult = true
                  })
              }
            }

            Row() {
              Text('\n' + '\n' + `重启口令验证测试结果：` + this.result)
                .fontColor(Color.White)
                .fontSize('24fp')
            }
          }
          .width('100%')
        }
        .scrollBarColor(Color.White) // 滚动条颜色
        .scrollBarWidth(10)
      }
    }
    .width('100%')
    .height('80%')
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        url: 'pages/PCS/PCS_index',
        stepTips: this.stepTips,
        content: this.specificNoParam,
        name: $name,
        testResult: $testResult,
        startEnable: $startEnable,
        result: $result,
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/PCS/PCS_index',
    })
  }
}
