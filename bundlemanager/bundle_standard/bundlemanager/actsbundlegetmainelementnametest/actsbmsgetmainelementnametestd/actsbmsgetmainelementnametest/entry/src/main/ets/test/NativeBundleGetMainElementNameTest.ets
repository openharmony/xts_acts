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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import commonEventManager from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';

const BUNDLE_NAME = 'com.example.bundlenativegetmainelementnamerely';
const MODULE_NAME = 'entry';
const ABILITY_NAME = 'AbilityOne';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

export default function bundlenativegetmainelementnameTest() {
  describe('bundlenativegetmainelementnameTest', function () {

    /**
     * @tc.number: SUB_BMS_OH_NativeBundle_GetMainElementName_0400
     * @tc.name: SUB_BMS_OH_NativeBundle_GetMainElementName_0400
     * @tc.desc: The mainElement entry is not configured in module.json within the project,
     *           and a single module has the ability to be called by the application
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_BMS_OH_NativeBundle_GetMainElementName_0400', 0, async function (done) {
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['GetMainElementName']
      };
      let subscriber = commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
          expect().assertFail();
          done();
        }

        let bundleName: string = data.parameters?.bundleName;
        expect(bundleName).assertEqual(BUNDLE_NAME);
        let moduleName: string = data.parameters?.moduleName;
        expect(moduleName).assertEqual(MODULE_NAME);
        let abilityName: string = data.parameters?.abilityName;
        expect(abilityName).assertEqual(ABILITY_NAME);
        setTimeout(() => {
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          });
        }, 2000);
      }
      commonEventManager.subscribe(subscriber, subscribeCallBack);
      await sleep(1000);
      abilityDelegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility'
      })
      await sleep(2000);
    });

  })
}
