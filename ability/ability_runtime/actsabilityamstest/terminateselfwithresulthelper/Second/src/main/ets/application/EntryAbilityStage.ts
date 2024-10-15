/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import AbilityStage from '@ohos.app.ability.AbilityStage';
import commonEvent from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';

let Acts_EntryOnDestroy = 'Acts_EntryOnDestroy';
let Acts_EntryCreate = 'Acts_EntryCreate'
let tag = '[ACTS_StartAbility EntryAbilityStage]';

function sleep(delay: number){
  let start = (new Date()).getTime();
  while ((new Date()).getTime() - start < delay) {
    continue;
  }
}

let commonEventData: commonEvent.CommonEventPublishData = {
  parameters: {
    num: 2,
  }
};

export default class EntryAbilityStage extends AbilityStage {
  onCreate(): void{
    hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbilityStage SecondAbility onCreate`);
    commonEvent.publish(Acts_EntryCreate, commonEventData, (err) => {
      hilog.info(0x0000, tag, '%{public}s', `Acts_EntryOnDestroy SecondAbility publish err:  ${JSON.stringify(err)}`);
    })

  }

  onDestroy(): void{
    hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbilityStage SecondAbility onDestroy`);
    commonEvent.publish(Acts_EntryOnDestroy, commonEventData, (err) => {
      hilog.info(0x0000, tag, '%{public}s', `Acts_EntryOnDestroy SecondAbility publish err:  ${JSON.stringify(err)}`);
    })
    sleep(1000);
  }
}