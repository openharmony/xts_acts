/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { Component, Driver, ON, loadAndSetUpUiTest } from '@ohos.UiTest'
const DOMAIN_NUMBER: number = 0xFF00;
let bundle_name:string = "com.example.actssubscribertestunorder.static"
let testAbilityContext:common.UIAbilityContext;

export default function ActsSubscriberTestUnorder() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST', () : void => {
    let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST ===>';
    hilog.info(DOMAIN_NUMBER, TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST START`)
    beforeAll(() => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll start');
      loadAndSetUpUiTest();
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError) : void => {
        if (err != null ) {
          hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll end');
    })

  
    hilog.info(DOMAIN_NUMBER, TAG,` SUB_NOTIFICATION_CES_SUBSCRIBER_UNORDER_TEST END`)
  })
}
