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

import commonEvent from '@ohos.commonEventManager';
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

    if (want.action === 'StartAbilityForResultAsCaller_0100') {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] want.action == StartAbilityForResultAsCaller_0100');
      this.context.startAbilityForResultAsCaller({
        bundleName: 'com.example.uiextensionforresultascaller',
        abilityName: 'CalledAbility',
        moduleName: 'entry',
        action: 'StartAbilityForResultAsCaller_0100'
      }, {
        windowMode: 0,
        displayId: 0
      }).then((data) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0100 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0100 err: ' + error.code);
      });
    } else if (want.action === 'StartAbilityForResultAsCaller_0200') {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] want.action == StartAbilityForResultAsCaller_0200');
      this.context.startAbilityForResultAsCaller({
        bundleName: 'com.example.uiextensionforresultascallerother',
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        action: 'StartAbilityForResultAsCaller_0200'
      }).then((data) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0200 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0200 err: ' + error.code);
      });
    } else if (want.action === 'StartAbilityForResultAsCaller_0300') {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] want.action == StartAbilityForResultAsCaller_0300');
      this.context.startAbilityForResultAsCaller({
        bundleName: 'com.example.uiextensionforresultascaller',
        abilityName: 'CalledAbility',
        moduleName: 'entry',
        action: 'StartAbilityForResultAsCaller_0300'
      }).then((data) => {
        console.info('====>[UIExtensionForResultAsCallerUIAbility] 0300 ok: ' + JSON.stringify(data));
        let commonEventData = {
          parameters: {
            str: data.want.parameters.action,
            result: data.resultCode
          }
        };
        commonEvent.publish('0300', commonEventData, (err) => {
          console.debug('====>[UIExtensionForResultAsCallerUIAbility] 0300 publish err:' + JSON.stringify(err));
        });
      }).catch((error) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0300 err: ' + error.code);
      });
    } else if (want.action === 'StartAbilityForResultAsCaller_0400') {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] want.action == StartAbilityForResultAsCaller_0400');
      try {
        this.context.startAbilityForResultAsCaller(undefined).then((data) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 ok: ' + JSON.stringify(data));
        }).catch((error) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 err: ' + error.code);
        });
      } catch (err) {
        console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 start try err:' + JSON.stringify(err));
        let commonEventData = {
          parameters: {
            result: err.code
          }
        };
        commonEvent.publish('0400', commonEventData, (err) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 publish err:' + JSON.stringify(err));
        });
      }
    } else if (want.action === 'StartAbilityForResultAsCaller_0600') {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] want.action == StartAbilityForResultAsCaller_0600');
      this.context.startAbilityForResultAsCaller({
        action: 'ohos.caller.test.action',
        entities: ['entity.system.home']
      }).then((data) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0600 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 0600 err: ' + error.code);
      });
    } else if (want.action === 'StartAbilityForResultAsCaller_0800') {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] want.action == StartAbilityForResultAsCaller_0800');
      setTimeout(() => {
        this.context.startAbility({
          moduleName: 'entry',
          bundleName: 'com.example.uiextensionforresultascallerother',
          abilityName: 'CalledAbility',
          action: 'StartAbilityForResultAsCaller_0800_2'
        }).then((data) => {
          console.log('====>[UIExtensionForResultAsCallerUIAbility] 0800 ok: ' + JSON.stringify(data));
        }).catch((error) => {
          console.log('====>[UIExtensionForResultAsCallerUIAbility] 0800 err: ' + error.code);
          let commonEventData = {
            parameters: {
              result: error.code
            }
          };
          commonEvent.publish('0800', commonEventData, (err) => {
            console.debug('====>[UIExtensionForResultAsCallerUIAbility] 0800 publish err:' + JSON.stringify(err));
          });
        });
      }, 2000);
    } else if (want.action === 'StartAbilityForResultAsCaller_1100') {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] want.action == StartAbilityForResultAsCaller_1100');
      this.context.startAbilityForResultAsCaller({
        bundleName: 'com.example.uiextensionforresultascaller',
        abilityName: 'xxxxxxxxxx',
        moduleName: 'entry',
        action: 'StartAbilityForResultAsCaller_1100'
      }).then((data) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 1100 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 1100 err: ' + error.code);
        let commonEventData = {
          parameters: {
            result: error.code
          }
        };
        commonEvent.publish('1100', commonEventData, (err) => {
          console.debug('====>[UIExtensionForResultAsCallerUIAbility] 1100 publish err:' + JSON.stringify(err));
        });
      });
    } else if (want.action === 'StartAbilityForResultAsCaller_1300') {
      console.info('====>[UIExtensionForResultAsCallerUIAbility] want.action == StartAbilityForResultAsCaller_1300');
      this.context.startAbilityForResultAsCaller({
        bundleName: 'com.example.uiextensionforresultascaller',
        action: 'StartAbilityForResultAsCaller_1300'
      }).then((data) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 1300 ok: ' + JSON.stringify(data));
      }).catch((error) => {
        console.log('====>[UIExtensionForResultAsCallerUIAbility] 1300 err: ' + error.code);
        let commonEventData = {
          parameters: {
            result: error.code
          }
        };
        commonEvent.publish('1300', commonEventData, (err) => {
          console.debug('====>[UIExtensionForResultAsCallerUIAbility] 1300 publish err:' + JSON.stringify(err));
        });
      });
    }
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
