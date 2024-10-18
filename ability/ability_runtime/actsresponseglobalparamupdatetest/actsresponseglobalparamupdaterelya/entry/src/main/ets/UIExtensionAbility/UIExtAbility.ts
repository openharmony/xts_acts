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

import commonEventManager from '@ohos.commonEventManager';
import { Configuration } from '@ohos.app.ability.Configuration';
import hilog from '@ohos.hilog';
import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import Want from '@ohos.app.ability.Want';

const TAG: string = 'UIExtAbilityA';

export default class UIExtAbility extends UIExtensionAbility {
  onForeground() {
    hilog.info(0x0000, TAG, '%{public}s', 'onForeground');
  }

  onBackground() {
    hilog.info(0x0000, TAG, '%{public}s', 'onBackground');
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    let storage: LocalStorage = new LocalStorage({
      'session': session
    });
    session.loadContent('pages/Extension', storage);
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    hilog.info(0x0000, TAG, '%{public}s', 'onConfigurationUpdate');
    let publishData: commonEventManager.CommonEventPublishData = {
      parameters: newConfig
    };
    hilog.info(0x0000, TAG, 'publishData: %{public}s', JSON.stringify(publishData.parameters) ?? '');
    commonEventManager.publish(
      'RelyA_UIExtAbility_ConfigurationUpdateEvent', publishData, (err) => {
      if (err) {
        hilog.info(0x0000, TAG,
          'RelyA_UIExtAbility_ConfigurationUpdateEvent publish failed, Cause: %{public}s', JSON.stringify(err) ?? '');
      } else {
        hilog.info(0x0000, TAG, '%{public}s', 'RelyA_UIExtAbility_ConfigurationUpdateEvent publish successful');
      }
    });
  }
}