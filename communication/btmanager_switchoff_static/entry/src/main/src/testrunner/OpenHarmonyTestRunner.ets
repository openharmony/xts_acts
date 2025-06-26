/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import { TestRunner } from '@kit.TestKit';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Hypium } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import testsuite from '../test/List.test';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;

let domain: number = 0x0000;
let tag: string = 'testTag';

export class OpenHarmonyTestRunner implements TestRunner {
  constructor() {}

  onPrepare() {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  }

  onRun() {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');

    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    if (abilityDelegatorArguments != undefined) {
      hilog.info(domain, tag, 'abilityDelegatorArguments is not undefined1');
      Hypium.set('abilityDelegatorArguments', abilityDelegatorArguments);
      let temp: abilityDelegatorRegistry.AbilityDelegatorArgs = Hypium.get('abilityDelegatorArguments') as abilityDelegatorRegistry.AbilityDelegatorArgs;
      if (temp != undefined) {
        hilog.info(0x0000, 'testTag', 'temp is not undefined');
      } else {
        hilog.info(0x0000, 'testTag', 'temp is undefined');
      }

    } else {
      hilog.info(domain, tag, 'abilityDelegatorArguments is undefined');
    }

    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    abilityDelegator.addAbilityMonitor({
      abilityName: 'EntryAbility',
      moduleName:'entry',
    }, (err : BusinessError<void> |null) : void => {
      if (err != null ) {
        hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
      }
      hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
    });
    abilityDelegator.executeShellCommand('aa start -a EntryAbility -b ohos.acts.communication.bluetooth.bluetoothhost.static')
    hilog.info(domain, tag, 'onRun end');

  }
}