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

import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import { Hypium } from '@ohos/hypium'
import testsuite from '../test/List.test'

@Entry
@Component
struct Index {
  aboutToAppear() {
    console.info('MainAbility index aboutToAppear')
    console.info('start run testcase!!!')
    let cmd: any
    let abilityDelegatorArguments: any
    let abilityDelegator: any

    function sleep(delay) {
      let start = (new Date()).getTime();
      while ((new Date()).getTime() - start < delay) {
        continue;
      }
    }
    function test(time) {
      sleep(time);
    }

    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()

    cmd = 'aa test -b com.example.aacommandprintsync -m entry_test  -s class ' +
      'ACTS_AACommand_01_3#ACTS_AACommand_printSync_01_0100 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_printSync_01_0100 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_printSync_01_0100 stdResult = ' + data.stdResult)
      globalThis.stdResult1 = data.stdResult;
      console.log('ACTS_AACommand_printSync_01_0100 - executeShellCommand: end ')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
      'ACTS_AACommand_01_3#ACTS_AACommand_printSync_01_0200 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_printSync_01_0200 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_printSync_01_0200 stdResult = ' + data.stdResult)
      globalThis.stdResult2 = data.stdResult;
      console.log('ACTS_AACommand_printSync_01_0200 - executeShellCommand: end ')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
      'ACTS_AACommand_01_3#ACTS_AACommand_printSync_01_0300 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_printSync_01_0300 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_printSync_01_0300 stdResult = ' + data.stdResult)
      globalThis.stdResult3 = data.stdResult;
      console.log('ACTS_AACommand_printSync_01_0300 - executeShellCommand: end ')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandprintsync -s class ' +
      'ACTS_AACommand_01_3#ACTS_AACommand_printSync_01_0400 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_printSync_01_0400 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_printSync_01_0400 stdResult = ' + data.stdResult)
      globalThis.stdResult4 = data.stdResult;
      console.log('ACTS_AACommand_printSync_01_0400 - executeShellCommand: end ')
    })

    test(3000)

    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)

    }, 15000)

  }
  @State message: string = 'Hello World'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('next page')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('35%')
          .height('5%')
          .onClick(() => {
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}