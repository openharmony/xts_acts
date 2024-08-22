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

import abilityManager from '@ohos.app.ability.abilityManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';

const TAG: string = 'Test';
let bundleNameArray: Array<string> = [
  'com.example.actsresponseglobalparamupdaterelya',
  'com.example.actsresponseglobalparamupdaterelyb',
  'com.example.actsresponseglobalparamupdaterelyc',
  'com.example.actsresponseglobalparamupdaterelyd',
  'com.example.actsresponseglobalparamupdaterelye'
];
let isSupportOnBackground: boolean = false;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let caseStr: string = 'null'
let currentLanguage: string = 'zh';
let currentFontSizeScale: number = 1.0;
let currentFontWeightScale: number = 1.0;
let currentColorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
let result: number = 0;

/* Received events flag
 * flag[0] --> Successfully received events of actsresponseglobalparamupdaterelya.
 * flag[1] --> Successfully received events of actsresponseglobalparamupdaterelyb.
 * flag[2] --> Successfully received events of actsresponseglobalparamupdaterelyc.
 * flag[3] --> Successfully received events of actsresponseglobalparamupdaterelyd.
 * flag[4] --> Successfully received events of actsresponseglobalparamupdaterelye.
 */
let flag: Array<number> = [
  2**0 * 7,
  2**3 * 7,
  2**6 * 7,
  2**9 * 7,
  2**12 * 7
];
let onBackgroundEventInfo: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    'RelyA_Ability_OnBackground'
  ]
};
let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    'RelyA_Ability_ConfigurationUpdateEvent',
    'RelyA_UIExtAbility_ConfigurationUpdateEvent',
    'RelyA_PopupUIExtAbility_ConfigurationUpdateEvent',
    'RelyB_Ability_ConfigurationUpdateEvent',
    'RelyB_UIExtAbility_ConfigurationUpdateEvent',
    'RelyB_PopupUIExtAbility_ConfigurationUpdateEvent',
    'RelyC_Ability_ConfigurationUpdateEvent',
    'RelyC_UIExtAbility_ConfigurationUpdateEvent',
    'RelyC_PopupUIExtAbility_ConfigurationUpdateEvent',
    'RelyD_Ability_ConfigurationUpdateEvent',
    'RelyD_UIExtAbility_ConfigurationUpdateEvent',
    'RelyD_PopupUIExtAbility_ConfigurationUpdateEvent',
    'RelyE_Ability_ConfigurationUpdateEvent',
    'RelyE_UIExtAbility_ConfigurationUpdateEvent',
    'RelyE_PopupUIExtAbility_ConfigurationUpdateEvent'
  ]
};
let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
  hilog.info(0x0000, TAG, 'Received %{public}s', data.event);
  hilog.info(0x0000, TAG, 'currentLanguage: %{public}s receivedLanguage: %{public}s',
    currentLanguage, data.parameters.language);
  expect(currentLanguage).assertEqual(data.parameters.language);
  hilog.info(0x0000, TAG, 'currentFontSizeScale: %{public}s receivedFontSizeScale: %{public}s',
    currentFontSizeScale.toString(), data.parameters.fontSizeScale.toString());
  expect(currentFontSizeScale).assertEqual(data.parameters.fontSizeScale);
  hilog.info(0x0000, TAG, 'currentFontWeightScale: %{public}s receivedFontWeightScale: %{public}s',
    currentFontWeightScale.toString(), data.parameters.fontWeightScale.toString());
  expect(currentFontWeightScale).assertEqual(data.parameters.fontWeightScale);
  hilog.info(0x0000, TAG, 'currentColorMode: %{public}d receivedColorMode: %{public}d',
    currentColorMode, data.parameters.colorMode);
  expect(currentColorMode).assertEqual(data.parameters.colorMode);

  if (data.event == 'RelyA_Ability_ConfigurationUpdateEvent') {
    result ^= 2**0;
  } else if (data.event == 'RelyA_UIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**1;
  } else if (data.event == 'RelyA_PopupUIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**2;
  } else if (data.event == 'RelyB_Ability_ConfigurationUpdateEvent') {
    result ^= 2**3;
  } else if (data.event == 'RelyB_UIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**4;
  } else if (data.event == 'RelyB_PopupUIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**5;
  } else if (data.event == 'RelyC_Ability_ConfigurationUpdateEvent') {
    result ^= 2**6;
  } else if (data.event == 'RelyC_UIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**7;
  } else if (data.event == 'RelyC_PopupUIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**8;
  } else if (data.event == 'RelyD_Ability_ConfigurationUpdateEvent') {
    result ^= 2**9;
  } else if (data.event == 'RelyD_UIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**10;
  } else if (data.event == 'RelyD_PopupUIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**11;
  } else if (data.event == 'RelyE_Ability_ConfigurationUpdateEvent') {
    result ^= 2**12;
  } else if (data.event == 'RelyE_UIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**13;
  } else if (data.event == 'RelyE_PopupUIExtAbility_ConfigurationUpdateEvent') {
    result ^= 2**14;
  }
};

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let driver = Driver.create();
    let onBackgroundSubscriber: commonEventManager.CommonEventSubscriber;
    beforeAll(async () => {
      try {
        abilityManager.updateConfiguration({
          language: 'zh',
          fontSizeScale: 1.0,
          fontWeightScale: 1.0,
          colorMode: ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT
        });
        currentLanguage = 'zh';
        currentFontSizeScale = 1.0;
        currentFontWeightScale = 1.0;
        currentColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
        hilog.info(0x0000, TAG, '%{public}s',
          'init Configuration language: zh, fontSizeScale: 1.0, fontWeightScale: 1.0, colorMode: COLOR_MODE_LIGHT');
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', 'call updateConfiguration, error code: ' + JSON.stringify(err));
      }
      hilog.info(0x0000, TAG, '%{public}s', 'start ActsAbilityTest');
      await commonEventManager.createSubscriber(onBackgroundEventInfo).then(async (data) => {
        onBackgroundSubscriber = data;
        commonEventManager.subscribe(onBackgroundSubscriber,
          (err: BusinessError, data: commonEventManager.CommonEventData) => {
            if (data.event == 'RelyA_Ability_OnBackground' && !isSupportOnBackground) {
              isSupportOnBackground = true;
              hilog.info(0x0000, TAG, '%{public}s', 'Received RelyA_Ability_OnBackground');
              commonEventManager.unsubscribe(onBackgroundSubscriber);
            }
          });
      })
      for (let i = 0; i < bundleNameArray.length; ++i) {
        abilityDelegator.startAbility({
          bundleName: bundleNameArray[i],
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbility callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(2000);
        let openPopupUIExtAbilityBtn = await driver.findComponent(ON.text("PopupUIExtAbility"));
        if (openPopupUIExtAbilityBtn != undefined) {
          await openPopupUIExtAbilityBtn.click();
          hilog.info(0x0000, TAG, '%{public}s', 'openPopupUIExtAbilityBtn clicked')
          await sleep(1000)
        } else {
          hilog.info(0x0000, TAG, '%{public}s', 'openPopupUIExtAbilityBtn is undefined')
        }
      }
    })

    afterEach(async () => {
      result = 0;
      try {
        abilityManager.updateConfiguration({
          language: 'zh',
          fontSizeScale: 1.0,
          fontWeightScale: 1.0,
          colorMode: ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT
        });
        currentLanguage = 'zh';
        currentFontSizeScale = 1.0;
        currentFontWeightScale = 1.0;
        currentColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
        hilog.info(0x0000, TAG, '%{public}s',
          'recover Configuration language: zh, fontSizeScale: 1.0, fontWeightScale: 1.0, colorMode: COLOR_MODE_LIGHT');
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', 'call updateConfiguration, error code: ' + JSON.stringify(err));
      }
      abilityDelegator.startAbility({
        bundleName: bundleNameArray[bundleNameArray.length-1],
        abilityName: 'EntryAbility',
      }, (err, data) => {
        hilog.info(0x0000, TAG,
          'startAbilityE callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
      })
      await sleep(2000);
    })

    afterAll(async () => {
      let cmdHead: string = 'aa force-stop ';
      for (let i = 0; i < bundleNameArray.length; ++i) {
        let cmd: string = cmdHead + bundleNameArray[i];
        abilityDelegator.executeShellCommand(cmd,
          (err: BusinessError, d: abilityDelegatorRegistry.ShellCmdResult) => {
            hilog.info(0x0000, TAG, 'executeShellCommand: %{public}s; err: %{public}s; result:',
              cmd, JSON.stringify(err), d.stdResult);
          });
        await sleep(500);
      }
    })

    /*
    * @tc.number     : SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0100
    * @tc.name       : responseglobalparamupdatetest0100
    * @tc.desc       : When global parameters(Language) are updated, only the foreground application responds.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0100', 0, (done: Function) => {
      caseStr = 'SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0100';
      hilog.info(0x0000, TAG, 'start case: %{public}s', caseStr);
      let unsubscribeCallback = () => {
        clearTimeout(timer);
        done();
      };
      let timer = setTimeout(() => {
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
        expect().assertFail();
      }, 10000);

      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (data) => {
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        try {
          abilityManager.updateConfiguration({
            language: 'en',
          });
          currentLanguage = 'en';
          hilog.info(0x0000, TAG, '====>[%{public}s] %{public}s', caseStr, 'updateConfiguration language: en');
        } catch (err) {
          hilog.info(0x0000, TAG,
            '====>[%{public}s] call updateConfiguration, error code: %{public}s', caseStr, JSON.stringify(err));
        }
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 1th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye.
          expect(result).assertEqual(flag[4]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsresponseglobalparamupdaterelyd',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbilityD callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 2th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye d.
          expect(result).assertEqual(flag[4] + flag[3]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
      });
    })

    /*
    * @tc.number     : SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0200
    * @tc.name       : responseglobalparamupdatetest0200
    * @tc.desc       : When global parameters(FontSizeScale) are updated, only the foreground application responds.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0200', 0, (done: Function) => {
      caseStr = 'SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0200';
      hilog.info(0x0000, TAG, 'start case: %{public}s', caseStr);
      let unsubscribeCallback = () => {
        clearTimeout(timer);
        done();
      };
      let timer = setTimeout(() => {
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
        expect().assertFail();
      }, 10000);

      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (data) => {
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        try {
          abilityManager.updateConfiguration({
            fontSizeScale: 1.45
          });
          currentFontSizeScale = 1.45;
          hilog.info(0x0000, TAG, '====>[%{public}s] %{public}s', caseStr, 'updateConfiguration fontSizeScale: 1.45');
        } catch (err) {
          hilog.info(0x0000, TAG,
            '====>[%{public}s] call updateConfiguration, error code: %{public}s', caseStr, JSON.stringify(err));
        }
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 1th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye.
          expect(result).assertEqual(flag[4]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsresponseglobalparamupdaterelyd',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbilityD callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 2th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye d.
          expect(result).assertEqual(flag[4] + flag[3]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
      });
    })

    /*
    * @tc.number     : SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0300
    * @tc.name       : responseglobalparamupdatetest0300
    * @tc.desc       : When global parameters(fontWeightScale) are updated, only the foreground application responds.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0300', 0, (done: Function) => {
      caseStr = 'SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0300';
      hilog.info(0x0000, TAG, 'start case: %{public}s', caseStr);
      let unsubscribeCallback = () => {
        clearTimeout(timer);
        done();
      };
      let timer = setTimeout(() => {
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
        expect().assertFail();
      }, 10000);

      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (data) => {
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        try {
          abilityManager.updateConfiguration({
            fontWeightScale: 1.2
          });
          currentFontWeightScale = 1.2;
          hilog.info(0x0000, TAG, '====>[%{public}s] %{public}s',
            caseStr, 'updateConfiguration fontWeightScale: 1.2');
        } catch (err) {
          hilog.info(0x0000, TAG,
            '====>[%{public}s] call updateConfiguration, error code: %{public}s', caseStr, JSON.stringify(err));
        }
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 1th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye.
          expect(result).assertEqual(flag[4]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsresponseglobalparamupdaterelyd',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbilityD callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 2th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye d.
          expect(result).assertEqual(flag[4] + flag[3]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
      });
    })

    /*
    * @tc.number     : SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0400
    * @tc.name       : responseglobalparamupdatetest0400
    * @tc.desc       : When global parameters(ColorMode) are updated, only the foreground application responds.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0400', 0, (done: Function) => {
      caseStr = 'SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0400';
      hilog.info(0x0000, TAG, 'start case: %{public}s', caseStr);
      let unsubscribeCallback = () => {
        clearTimeout(timer);
        done();
      };
      let timer = setTimeout(() => {
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
        expect().assertFail();
      }, 10000);

      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (data) => {
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        try {
          abilityManager.updateConfiguration({
            colorMode: ConfigurationConstant.ColorMode.COLOR_MODE_DARK
          });
          currentColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
          hilog.info(0x0000, TAG, '====>[%{public}s] %{public}s',
            caseStr, 'updateConfiguration colorMode: COLOR_MODE_DARK');
        } catch (err) {
          hilog.info(0x0000, TAG,
            '====>[%{public}s] call updateConfiguration, error code: %{public}s', caseStr, JSON.stringify(err));
        }
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 1th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye.
          expect(result).assertEqual(flag[4]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsresponseglobalparamupdaterelyd',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbilityD callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 2th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye d.
          expect(result).assertEqual(flag[4] + flag[3]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
      });
    })

    /*
    * @tc.number     : SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0500
    * @tc.name       : responseglobalparamupdatetest0500
    * @tc.desc       : When global parameters(all) are updated, only the foreground application responds.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0500', 0, async (done: Function) => {
      caseStr = 'SUB_Ability_AbilityRuntime_ResponseGlobalParamUpdateTest_0500';
      hilog.info(0x0000, TAG, 'start case: %{public}s', caseStr);
      let unsubscribeCallback = () => {
        clearTimeout(timer);
        done();
      };
      let timer = setTimeout(() => {
        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
        expect().assertFail();
      }, 18000);

      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (data) => {
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        try {
          abilityManager.updateConfiguration({
            language: 'en',
            fontSizeScale: 1.45,
            colorMode: ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT
          });
          currentLanguage = 'en';
          currentFontSizeScale = 1.45;
          currentColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
          hilog.info(0x0000, TAG, '====>[%{public}s] %{public}s', caseStr,
            'updateConfiguration language: en, fontSizeScale: 1.45, colorMode: COLOR_MODE_LIGHT');
        } catch (err) {
          hilog.info(0x0000, TAG,
            '====>[%{public}s] call updateConfiguration, error code: %{public}s', caseStr, JSON.stringify(err));
        }
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 1th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye.
          expect(result).assertEqual(flag[4]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }

        try {
          abilityManager.updateConfiguration({
            language: 'en',
            fontSizeScale: 1.0,
            colorMode: ConfigurationConstant.ColorMode.COLOR_MODE_DARK
          });
          currentLanguage = 'en';
          currentFontSizeScale = 1.0;
          currentColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
          hilog.info(0x0000, TAG,
            '====>[%{public}s] updateConfiguration language: en, fontSizeScale: 1.0, colorMode: COLOR_MODE_DARK',
            caseStr);
        } catch (err) {
          hilog.info(0x0000, TAG,
            '====>[%{public}s] call updateConfiguration, error code: %{public}s', caseStr, JSON.stringify(err));
        }
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 2th result: %{public}d', caseStr, result);
        //Successfully received events twice.
        expect(result).assertEqual(0);

        try {
          abilityManager.updateConfiguration({
            language: 'zh',
            fontSizeScale: 1.45,
            colorMode: ConfigurationConstant.ColorMode.COLOR_MODE_DARK
          });
          currentLanguage = 'zh';
          currentFontSizeScale = 1.45;
          currentColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
          hilog.info(0x0000, TAG,
            '====>[%{public}s] updateConfiguration language: zh, fontSizeScale: 1.45, colorMode: COLOR_MODE_DARK',
            caseStr);
        } catch (err) {
          hilog.info(0x0000, TAG,
            '====>[%{public}s] call updateConfiguration, error code: %{public}s', caseStr, JSON.stringify(err));
        }
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 3th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye.
          expect(result).assertEqual(flag[4]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }

        abilityDelegator.startAbility({
          bundleName: 'com.example.actsresponseglobalparamupdaterelyd',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbilityD callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 4th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye d.
          expect(result).assertEqual(flag[4] + flag[3]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }

        abilityDelegator.startAbility({
          bundleName: 'com.example.actsresponseglobalparamupdaterelyc',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbilityC callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 5th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye d c.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }

        abilityDelegator.startAbility({
          bundleName: 'com.example.actsresponseglobalparamupdaterelyb',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbilityB callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 6th result: %{public}d', caseStr, result);
        if (isSupportOnBackground) {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1]);
        } else {
          // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
          expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);
        }

        abilityDelegator.startAbility({
          bundleName: 'com.example.actsresponseglobalparamupdaterelya',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          hilog.info(0x0000, TAG,
            'startAbilityA callback err: %{public}s; data: %{public}s', JSON.stringify(err), JSON.stringify(data));
        })
        await sleep(1000);
        hilog.info(0x0000, TAG, '====>[%{public}s] 7th result: %{public}d', caseStr, result);
        // Successfully received events of actsresponseglobalparamupdaterelye d c b a.
        expect(result).assertEqual(flag[4] + flag[3] + flag[2] + flag[1] + flag[0]);

        commonEventManager.unsubscribe(subscriber, unsubscribeCallback);
      });
    })
  })
}