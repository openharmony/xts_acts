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

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0700 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0700 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0700 stdResult = ' + data.stdResult)
      globalThis.stdResult1 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_0700 - executeShellCommand: end ')
    })

    test(3000)
    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
        globalThis.stdResult2 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0700 end');
      })

    test(3000)

    cmd = 'aa test -b com.example.aacommandrelyhap -m entry_test  -s class ACTS_AACommand_01_3#ACTS_AACo' +
      'mmand_print_01_0100 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_print_01_0100 - executeShellCommand: start ')
      console.log('ACTS_AACommand_print_01_0100 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_print_01_0100 stdResult = ' + data.stdResult)
      globalThis.stdResult3 = data.stdResult;
      console.log('ACTS_AACommand_print_01_0100 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_AAComm' +
      'and_print_01_0200 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_print_01_0200 - executeShellCommand: start ')
      console.log('ACTS_AACommand_print_01_0200 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_print_01_0200 stdResult = ' + data.stdResult)
      globalThis.stdResult4 = data.stdResult;
      console.log('ACTS_AACommand_print_01_0200 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_' +
      'AACommand_print_01_0300 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_print_01_0300 - executeShellCommand: start ')
      console.log('ACTS_AACommand_print_01_0300 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_print_01_0300 stdResult = ' + data.stdResult)
      globalThis.stdResult5 = data.stdResult;
      console.log('ACTS_AACommand_print_01_0300 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_AAComma' +
      'nd_print_01_0400 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_print_01_0400 - executeShellCommand: start ')
      console.log('ACTS_AACommand_print_01_0400 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_print_01_0400 stdResult = ' + data.stdResult)
      globalThis.stdResult6 = data.stdResult;
      console.log('ACTS_AACommand_print_01_0400 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_AAComm' +
      'and_print_01_0500 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_print_01_0500 - executeShellCommand: start ')
      console.log('ACTS_AACommand_print_01_0500 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_print_01_0500 stdResult = ' + data.stdResult)
      globalThis.stdResult7 = data.stdResult;
      console.log('ACTS_AACommand_print_01_0500 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ACTS_AACommand_01_3#ACTS_AA' +
      'Command_print_01_0600 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_print_01_0600 - executeShellCommand: start ')
      console.log('ACTS_AACommand_print_01_0600 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_print_01_0600 stdResult = ' + data.stdResult)
      globalThis.stdResult8 = data.stdResult;
      console.log('ACTS_AACommand_print_01_0600 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
      'ACTS_AACommand_01_3#ACTS_AACommand_print_01_0700 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_print_01_0700 - executeShellCommand: start ')
      console.log('ACTS_AACommand_print_01_0700 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_print_01_0700 stdResult = ' + data.stdResult)
      globalThis.stdResult9 = data.stdResult;
      console.log('ACTS_AACommand_print_01_0700 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class ACTS_AACommand_01_3#ACTS_AACommand_print_01_0800 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_print_01_0800 - executeShellCommand: start ')
      console.log('ACTS_AACommand_print_01_0800 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_print_01_0800 stdResult = ' + data.stdResult)
      globalThis.stdResult10 = data.stdResult;
      console.log('ACTS_AACommand_print_01_0800 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
      'ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0400 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0400 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_0400 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0400 stdResult = ' + data.stdResult)
      globalThis.stdResult11 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_0400 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
        globalThis.stdResult12 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0700 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0100 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0100 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_0100 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0100 stdResult = ' + data.stdResult)
      globalThis.stdResult13 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_0100 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0700 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0700 : data : ' + JSON.stringify(data));
        globalThis.stdResult14 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0700 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s class ' +
      'ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0500 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0500 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_0500 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0500 stdResult = ' + data.stdResult)
      globalThis.stdResult15 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_0500 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0500 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0500 : data : ' + JSON.stringify(data));
        globalThis.stdResult16 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0500 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0600 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0600 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_0600 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0600 stdResult = ' + data.stdResult)
      globalThis.stdResult17 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_0600 - executeShellCommand: end')
    })

    test(3000)
    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0600 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0600 : data : ' + JSON.stringify(data));
        globalThis.stdResult18 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0600 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0900 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0900 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_0900 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0900 stdResult = ' + data.stdResult)
      globalThis.stdResult19 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_0900 - executeShellCommand: end')
    })


    test(3000)
    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0900 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0900 : data : ' + JSON.stringify(data));
        globalThis.stdResult20 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0900 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap' +
      ' -s class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_1200 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_1200 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_1200 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_1200 stdResult = ' + data.stdResult)
      globalThis.stdResult21 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_1200 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_1200 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_1200 : data : ' + JSON.stringify(data));
        globalThis.stdResult22 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_1200 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_1300 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_1300 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_1300 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_1300 stdResult = ' + data.stdResult)
      globalThis.stdResult23 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_1300 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_1300 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_1300 : data : ' + JSON.stringify(data));
        globalThis.stdResult24 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_1300 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_1400 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_1400 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_1400 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_1400 stdResult = ' + data.stdResult)
      globalThis.stdResult25 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_1400 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_1400 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_1400 : data : ' + JSON.stringify(data));
        globalThis.stdResult26 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_1400 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_1500 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_1500 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_1500 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_1500 stdResult = ' + data.stdResult)
      globalThis.stdResult27 = data.stdResult;
      console.log('ACTS_AACommand_finish_01_1500 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_1500 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_1500 : data : ' + JSON.stringify(data));
        globalThis.stdResult28 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_1500 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0200 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0200 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_0200 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0200 stdResult = ' + data.stdResult)
      console.log('ACTS_AACommand_finish_01_0200 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0200 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0200 : data : ' + JSON.stringify(data));
        globalThis.stdResult29 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0200 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0300 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0300 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_0300 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0300 stdResult = ' + data.stdResult)
      console.log('ACTS_AACommand_finish_01_0300 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0300 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0300 : data : ' + JSON.stringify(data));
        globalThis.stdResult30 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0300 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_0800 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_0800 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_0800 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_0800 stdResult = ' + data.stdResult)
      console.log('ACTS_AACommand_finish_01_0800 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_0800 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_0800 : data : ' + JSON.stringify(data));
        globalThis.stdResult31 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_0800 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap -s ' +
      'class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_1000 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_1000 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_1000 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_1000 stdResult = ' + data.stdResult)
      console.log('ACTS_AACommand_finish_01_1000 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_1000 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_1000 : data : ' + JSON.stringify(data));
        globalThis.stdResult32 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_1000 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap ' +
      '-s class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_1100 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_1100 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_1100 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_1100 stdResult = ' + data.stdResult)
      console.log('ACTS_AACommand_finish_01_1100 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_1100 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_1100 : data : ' + JSON.stringify(data));
        globalThis.stdResult33 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_1100 end');
      })

    test(3000)

    cmd = 'aa test -m entry_test -b com.example.aacommandrelyhap' +
      ' -s class ACTS_AACommand_01_3#ACTS_AACommand_finish_01_1600 -s unittest OpenHarmonyTestRunner'
    globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
      console.log('ACTS_AACommand_finish_01_1600 - executeShellCommand: start ')
      console.log('ACTS_AACommand_finish_01_1600 start err: ' + JSON.stringify(err))
      console.log('ACTS_AACommand_finish_01_1600 stdResult = ' + data.stdResult)
      console.log('ACTS_AACommand_finish_01_1600 - executeShellCommand: end')
    })

    test(3000)

    cmd = 'aa dump -a'
    abilityDelegator.executeShellCommand(cmd,
      (err, data) => {
        console.info('ACTS_AACommand_finish_01_1600 : err : ' + JSON.stringify(err));
        console.info('ACTS_AACommand_finish_01_1600 : data : ' + JSON.stringify(data));
        globalThis.stdResult34 = data["stdResult"];
        console.info('ACTS_AACommand_finish_01_1600 end');
      })

    test(3000)

    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    }, 12000)

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