/*
 * Copyright (C) 2024 HiHope Open Source Organization
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
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import EmbeddableUIAbility from '@ohos.app.ability.EmbeddableUIAbility';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

const TAG: string = 'MoveAbilityToBackground';
const DOMAIN_NUMBER: number = 0xFF00;

export default class MoveAbilityToBackground extends EmbeddableUIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onCreate1');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/moveability', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTAG', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTAG', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onForeground in embeddableUIAbility');
    let key:number=0;
    this.context.moveAbilityToBackground().then(() => {
      console.log(`moveAbilityToBackground success.`);
      key++;
      console.log(`moveAbilityToBackground success.`+key);
      let options: commonEventManager.CommonEventPublishData = {
        code: 2,
        data: JSON.stringify(key),
      };
      console.log('this moveAbilityToBackground' +options.data)
      commonEventManager.publish('moveAbilityToBackground', options, async (err: BusinessError) => {
        if (err) {
          hilog.error(DOMAIN_NUMBER, TAG, 'PublishCallBack err = ' + JSON.stringify(err));
        } else {
          hilog.info(DOMAIN_NUMBER, TAG, 'this push data success moveAbilityToBackground');
        }
      });
    }).catch((err: BusinessError) => {
      console.log(`moveAbilityToBackground error: ${JSON.stringify(err)}.`);
      let options: commonEventManager.CommonEventPublishData = {
        code: err?.code,
        data: JSON.stringify(key),
      };
      commonEventManager.publish('moveAbilityToBackground', options, async (err: BusinessError) => {
        if (err) {
          hilog.error(DOMAIN_NUMBER, TAG, 'PublishCallBack err = ' + JSON.stringify(err));
        } else {
          hilog.info(DOMAIN_NUMBER, TAG, 'this push data success moveAbilityToBackground');
        }
      });
    });
    setTimeout(() => {
      this.context.terminateSelf(()=>{
      });
    }, 2000);
    console.info(`moveabilitytobackground state is ${key}`);


  }

  onBackground(): void {
    hilog.info(0x0000, 'testTAG', '%{public}s', 'Ability onBackground');
  }
}
