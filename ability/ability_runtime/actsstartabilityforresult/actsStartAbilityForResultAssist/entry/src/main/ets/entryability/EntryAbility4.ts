/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import app, { AppResponse } from '@system.app'
import { common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

let backSet:number = 0;

export default class EntryAbility4 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onCreate');
    globalThis.abilityAssist4 = this.context;
    commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish ACTS_LIFE_CYCLE');
    });
  }

  onDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage):void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onWindowStageCreate');
    commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish ACTS_LIFE_CYCLE');
    });
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy():void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onWindowStageDestroy');
  }

  onForeground():void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onForeground');
    let want: Want = {
      bundleName: 'com.example.mytest1',
      abilityName: 'startAbilityForResult03'
    };
    if (backSet === 0) {
      try {
        commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
          hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish ACTS_LIFE_CYCLE');
        });
        globalThis.abilityAssist4.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
            return;
          }
          // 执行正常业务
          hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success!');
        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
      }
    }else if (backSet === 1) {
      commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish ACTS_LIFE_CYCLE');
      });
      hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 execute router.back!');
      try {
        router.back();
        hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 router.back success!');
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility4 router.back failed, error.code: ${code}, error.message: ${message}`);
      }
    }
    backSet++;
  }

  onBackground():void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onBackground');
    commonEventManager.publish('ACTS_LIFE_CYCLE', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish ACTS_LIFE_CYCLE');
    });
  }
}
