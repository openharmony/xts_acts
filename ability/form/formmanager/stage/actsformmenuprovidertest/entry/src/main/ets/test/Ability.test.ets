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
import { describe, it, expect, beforeEach, beforeAll } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const TAG = '[Sample_Subscribe]';
const DOMAIN = 0xF811;
const PUBLISH_BUNDLE_NAME = 'com.example.menuprovider';
const driver: Driver = Driver.create();
const resourceManager = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
let sleep = async (delay: number = 1000): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      await sleep(1000);
    })
    beforeEach(async () => {
      await abilityDelegator.startAbility({
        bundleName: PUBLISH_BUNDLE_NAME,
        abilityName: 'EntryAbility'
      })
      await sleep(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test start');
      abilityDelegator.executeShellCommand("hilog -r")
    })
    /**
     * @tc.number: SUB_AA_ADD_FORM_MENU_ITEM_NORMAL_CASE_0100
     * @tc.name: testAddFormMenuItemNormalCase0100
     * @tc.desc: add form component to desktop, judge the FormId is not null. Zh-CN OS only;
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('testAddFormMenuItemNormalCase0100', 0, async (done: Function) => {
      console.log("TestLog-step1: click form component A");
      const descButton = await driver.findComponent(ON.text(await resourceManager.getStringValue($r('app.string.EntryAbility_desc'))));
      await sleep(200);
      await descButton?.click();
      await sleep(200);
      console.log("TestLog-step2: click Add Form to Desktop button");
      const labelButton =  await driver.findComponent(ON.text(await resourceManager.getStringValue($r('app.string.EntryAbility_label'))));
      await sleep(200);
      await labelButton?.click();
      await sleep(200);
      console.log("TestLog-step3: use callback to inquiry the FormId");
      abilityDelegator.executeShellCommand("hilog -x | grep \'AddFormMenuItem success and formId =\'")
        .then((data) => {
          console.log("TestLog-step4:" + JSON.stringify(data));
          console.log("TestLog-step5:" + JSON.stringify(data.stdResult));
          let j = JSON.stringify(data.stdResult).split("JSAPP: AddFormMenuItem success and formId =", 2)
          console.log("TestLog-step6:" + j[1]);
          let i = JSON.stringify(j[1]).split("\FormID  ");
          console.log("TestLog-step7:" + i[0]);
          let myFormId: string = i[0];
          console.log("TestLog-step8: print FormId" + myFormId);
          expect(myFormId.length > 0).assertTrue();
          console.log("TestLog-step9: judge the FormId is not null, return Pass");
          done();
        })
        .catch((error: BusinessError) => {
          console.log("Test failed : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })
  })
}
