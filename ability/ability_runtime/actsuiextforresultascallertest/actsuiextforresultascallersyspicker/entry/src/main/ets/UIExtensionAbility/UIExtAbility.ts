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

import hilog from '@ohos.hilog';
import ShareExtensionAbility from '@ohos.app.ability.ShareExtensionAbility';

export default class UiExtAbility extends ShareExtensionAbility {
  onCreate() {
    hilog.info(0x0000, 'testTag', 'UIExtAbility onCreate  want: %{public}s');
    console.info('=======>UIExtAbility onCreate======>');
  }

  onSessionCreate(want, session) {
    console.log(`want: ${JSON.stringify(want)}}`);
    let storage: LocalStorage = new LocalStorage({
      'session': session
    });
    session.loadContent('pages/Page', storage);
    console.info('=======>UIExtAbility onSessionCreate======>');

    this.context.startAbilityForResultAsCaller({
      bundleName: 'com.example.uiextensionforresultascaller',
      abilityName: 'CalledAbility',
      moduleName: 'entry',
      action: 'StartAbilityForResultAsCaller_1000'
    }).then((data) => {
      console.log('====>[SysPickerUIExtAbility] startAbilityForResultAsCaller 1000 ok: ' + JSON.stringify(data));
    }).catch((error) => {
      console.log('====>[SysPickerUIExtAbility] startAbilityForResultAsCaller 1000 err: ' + error.code);
    });
  }

  onSessionDestroy(session) {
    console.log('onSessionDestroy');
  }

  onDestroy() {
    console.info('=======>UIExtensionAbility onDestroy ======>');
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('=====> UIExtAbility onForeground =====> ');
  }
};
