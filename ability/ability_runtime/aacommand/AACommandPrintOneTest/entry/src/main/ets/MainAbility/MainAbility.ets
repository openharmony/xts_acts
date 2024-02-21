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

import Ability from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

async function startAbilityTest(TAG: string, context: common.UIAbilityContext) {
  let wantInfo: Want = {
    bundleName: "com.example.aacommandprintonetest",
    abilityName: "MainAbility"
  };
  await context.startAbility(wantInfo).then((data) => {
    console.log(TAG + "startAbility data : " + JSON.stringify(data));
  }).catch((err: BusinessError) => {
    console.log(TAG + "startAbility err : " + JSON.stringify(err));
  });
};

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
};

export default class MainAbility extends Ability {
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    AppStorage.setOrCreate<common.UIAbilityContext>("abilityContext", this.context);
    console.log('MainAbility onCreate')
    let cmd: string;
    let abilityDelegatorArguments: ESObject;
    let abilityDelegator: ESObject;

    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();

    cmd = 'aa test -b com.example.aacommandrelyhap -m entry_test  -s class AACommandPrintOneTest#ACTS_AACo' +
      'mmand_print_01_0100 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: ESObject, data: ESObject) => {
      console.log('ACTS_AACommand_print_01_0100 - executeShellCommand: start ');
      console.log('ACTS_AACommand_print_01_0100 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_print_01_0100 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult3", data.stdResult);
      console.log('ACTS_AACommand_print_01_0100 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_print_01_0100', this.context);
    });

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class AACommandPrintOneTest#ACTS_AAComm' +
      'and_print_01_0200 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: ESObject, data: ESObject) => {
      console.log('ACTS_AACommand_print_01_0200 - executeShellCommand: start ');
      console.log('ACTS_AACommand_print_01_0200 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_print_01_0200 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult4", data.stdResult);
      console.log('ACTS_AACommand_print_01_0200 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_print_01_0200', this.context);
    });

    await sleep(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class AACommandPrintOneTest#ACTS_' +
      'AACommand_print_01_0300 -s unittest OpenHarmonyTestRunner'
    abilityDelegator.executeShellCommand(cmd, async (err: ESObject, data: ESObject) => {
      console.log('ACTS_AACommand_print_01_0300 - executeShellCommand: start ');
      console.log('ACTS_AACommand_print_01_0300 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_print_01_0300 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult5", data.stdResult);
      console.log('ACTS_AACommand_print_01_0300 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_print_01_0300', this.context);
    });

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class AACommandPrintOneTest#ACTS_AAComma' +
      'nd_print_01_0400 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: ESObject, data: ESObject) => {
      console.log('ACTS_AACommand_print_01_0400 - executeShellCommand: start ');
      console.log('ACTS_AACommand_print_01_0400 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_print_01_0400 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult6", data.stdResult);
      console.log('ACTS_AACommand_print_01_0400 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_print_01_0400', this.context);
    });

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class AACommandPrintOneTest#ACTS_AAComm' +
      'and_print_01_0500 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: ESObject, data: ESObject) => {
      console.log('ACTS_AACommand_print_01_0500 - executeShellCommand: start ');
      console.log('ACTS_AACommand_print_01_0500 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_print_01_0500 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult7", data.stdResult);
      console.log('ACTS_AACommand_print_01_0500 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_print_01_0500', this.context);
    });

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class AACommandPrintOneTest#ACTS_AA' +
      'Command_print_01_0600 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: ESObject, data: ESObject) => {
      console.log('ACTS_AACommand_print_01_0600 - executeShellCommand: start ');
      console.log('ACTS_AACommand_print_01_0600 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_print_01_0600 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult8", data.stdResult);
      console.log('ACTS_AACommand_print_01_0600 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_print_01_0600', this.context);
    });

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
      'AACommandPrintOneTest#ACTS_AACommand_print_01_0700 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: ESObject, data: ESObject) => {
      console.log('ACTS_AACommand_print_01_0700 - executeShellCommand: start ');
      console.log('ACTS_AACommand_print_01_0700 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_print_01_0700 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult9", data.stdResult);
      console.log('ACTS_AACommand_print_01_0700 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_print_01_0700', this.context);
    });

    await sleep(3000);

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class AACommandPrintOneTest#ACTS_AACommand_print_01_0800 -s unittest OpenHarmonyTestRunner';
    abilityDelegator.executeShellCommand(cmd, async (err: ESObject, data: ESObject) => {
      console.log('ACTS_AACommand_print_01_0800 - executeShellCommand: start ');
      console.log('ACTS_AACommand_print_01_0800 start err: ' + JSON.stringify(err));
      console.log('ACTS_AACommand_print_01_0800 stdResult = ' + data.stdResult);
      AppStorage.setOrCreate<string>("stdResult10", data.stdResult);
      console.log('ACTS_AACommand_print_01_0800 - executeShellCommand: end');
      await startAbilityTest('ACTS_AACommand_print_01_0800', this.context);
    });

    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, 6000);
  };

  onDestroy() {
    console.log('MainAbility onDestroy');
  };

  onWindowStageCreate(windowStage: ESObject) {
    console.log('MainAbility onWindowStageCreate');
    windowStage.setUIContent(this.context, 'pages/index', null);

  };

  onWindowStageDestroy() {
    console.log('MainAbility onWindowStageDestroy');
  };

  onForeground() {
    console.log('MainAbility onForeground');
  };

  onBackground() {
    console.log('MainAbility onBackground');
  };
};