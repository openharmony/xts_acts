/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, it } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Driver, ON, Component } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`UiTestCase, start abilityFinished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`UiTestCase, start abilityFailed: ${err}`)
  })
}

async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`UiTestCase, stop application finished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`UiTestCase,stop application failed: ${err}`)
  })
}

export default function UiTest() {
  describe('GrantPermission', () => {
    let driver: Driver
    beforeAll(async (done: Function) => {
      driver = Driver.create()
      await driver.delayMs(1000)
      done()
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /*
    * @tc.number: 0
    * @tc.name: getInputPermission
    * @tc.desc: Grant permission to the input method application.
    */
    it('getInputPermission', 0, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(2000)
      let TextInput = await driver.findComponent(ON.type('TextInput'))
      if (TextInput == null) {
        let scorll = await driver.findComponent(ON.type('Scroll'))
        TextInput = await scorll.scrollSearch(ON.type('TextInput'))
      }
      await TextInput.click()
      await driver.delayMs(1000)
      let permissionBtn1 = await driver.findComponent(ON.text('同意'))
      if (permissionBtn1 != null) {
        await permissionBtn1.click()
        await driver.delayMs(1000)
      }
      let permissionBtn2 = await driver.findComponent(ON.text('下一步'))
      if (permissionBtn2 != null) {
        await permissionBtn2.click()
        await driver.delayMs(1000)
      }
      await stopApplication('com.uitestScene.acts')
    })
  })
}
