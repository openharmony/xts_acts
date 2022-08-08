/**
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
import router from '@system.router';
import featureAbility from '@ohos.ability.featureAbility'
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';

const BUNDLE_NAME = 'com.example.qianyiyingyong.hmservice';
const ABILITY_NAME1 = 'com.example.hm2.MainAbility';

async function routePage() {
  let options = {
    uri: 'pages/second'
  }
  try {
    await router.push(options)
  } catch (err) {
    console.error(`fail callback, code: ${err.code}, msg: ${err.msg}`)
  }
}

@Entry
@Component
struct Index {

  private backgroundColor = Color.Grey;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('HNM2 next page')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        routePage()
      })

      Text('fAStartAbilityPromiseSameBundleName1 本设备，feature覆盖安装')
        .height(70)
        .width('100%')
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .backgroundColor(this.backgroundColor)
        .onClick(() => {
          var str = {
            'want': {
              'bundleName': BUNDLE_NAME,
              'abilityName': ABILITY_NAME1,
              'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
            }
          };
          this.fAStartAbilityPromise('fAStartAbilityPromiseSameBundleName1', str);

        });

      Button() {
        Text('StartAbilityForResult')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        this.terminateSelfWithResult();
      })
    }
    .width('100%')
    .height('100%')
  }

  async aboutToAppear() {
    var permissions = ["ohos.permission.DISTRIBUTED_DATASYNC"];
    featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
      console.info("start requestPermissionsFromUser!!!!")
    })
  }

  async terminateSelfWithResult() {
    console.info('fAStartAbilityForResultPromise terminateSelfWithResult START');
    await featureAbility.terminateSelfWithResult(
      {
        resultCode: 1,
        want:
        {
          bundleName: "com.example.qianyiyingyong.hmservice",
          abilityName: "com.example.hm2.MainAbility",
        },
      }
    );
    await featureAbility.terminateSelf();
    console.info('fAStartAbilityForResultPromise terminateSelfWithResult END');
  }

  async fAStartAbilityPromise(tag, str) {
    console.info(tag + ' startAbility fAStartAbilityPromise START' + JSON.stringify(str));
    let code;
    await featureAbility.startAbility(str)
      .then((data) => {
        console.info(tag + ' startAbility Operation successful. Promise Data: ' + JSON.stringify(data))
        code = data;
      }).catch((error) => {
        console.info(tag + ' startAbility Operation failed. Promise Cause: ' + JSON.stringify(error));
        code = error;
      })
    console.info(tag + ' startAbility Operation code Promise: ' + JSON.stringify(code));
    if (code === 0) {
      this.tips('成功');
    } else {
      this.tips('错误码：' + code.code);
    }
    console.info(tag + ' startAbility fAStartAbilityPromise END');
  }

  tips(msg) {
    Prompt.showToast({
      message: msg,
      duration: 2000,
      bottom: '150px'
    });
  }
}