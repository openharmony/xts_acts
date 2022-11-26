/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { UiDriver } from '@ohos.uitest'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import prompt from '@ohos.prompt'

var abilityDelegator = undefined;
var abilityDelegator1 = undefined;
var driver;
var cmd;

function sleep(time) {
  return new Promise < void> ((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time)
  })
}

export default function abilityTest() {
  describe('ActsWukongTest', function () {
    beforeAll(async (done) => {
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator1 = AbilityDelegatorRegistry.getAbilityDelegator();
      driver = await UiDriver.create()
      await sleep(2000);
      done();
    })

    afterAll(async function (done) {
      prompt.showToast({
        message: 'CASE All End'
      })
      done()
    })

    /**
     * @tc.number: wukongtest_0010
     * @tc.name: getAbilityLists callback API.
     * @tc.desc: getAbilityLists callback API abilityType is spoken, stateType is install.
     */
    it('wukongtest_0010', 1, async function (done) {
      cmd = "wukong exec -T 0.5 &";
      await abilityDelegator.executeShellCommand("pkill accessibility");
      abilityDelegator.executeShellCommand(cmd,
        async (err: any, d: any) => {
          console.log('hyr-----------ACTS_AppSelectorTest cmdUninstall executeShellCommand : err : ' + JSON.stringify(err));
          console.log('hyr-----------ACTS_AppSelectorTest cmdUninstall executeShellCommand : stdResult : ' + d.stdResult);
          console.log('hyr-----------ACTS_AppSelectorTest cmdUninstall executeShellCommand : exitCode : ' + d.exitCode);
      });
      await sleep(10000);
      abilityDelegator1.executeShellCommand("ps -ef|grep 'wukong exec -T 0.5'|grep -c -v grep ",async (error: any, date: any) => {
        console.log('hyr1-----------ACTS_AppSelectorTest cmdUninstall executeShellCommand : err1 : ' + JSON.stringify(error));
        console.log('hyr1-----------ACTS_AppSelectorTest cmdUninstall executeShellCommand : stdResult1 : ' + date.stdResult);
        console.log('hyr1-----------ACTS_AppSelectorTest cmdUninstall executeShellCommand : exitCode1 : ' + date.exitCode);
        let i = date.stdResult.indexOf('1');
        if(i == -1){
          expect().assertFail();
        }
        done();
      });
    })
  })
}
