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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import ability from '@ohos.ability.ability';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testContext from '../MainAbility/MainAbility'
export default function abilityTest() {

  let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context: common.UIAbilityContext;
  let TAG = "";

  describe('ActsAbilityStartUpTest', function () {
    beforeAll(async function (done) {
      context = testContext;
      done();
    });

    afterEach(async function (done) {
      setTimeout(() => {
        done();
      }, 3000)
    });

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0100
     * @tc.name: test a single startup framework
     * @tc.desc: test the startup results of a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0100', 0, async function (done) {
      TAG = "ACTS_AddAbilityMonitor_Callback_0100";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a SingleStartAbility')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }      
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0200
     * @tc.name: test the serial startup framework
     * @tc.desc: test the startup results of the serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0200', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0200";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility2')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0300
     * @tc.name: test parallel start framework
     * @tc.desc: test the startup results of the parallel startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0300', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0300";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility3')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0400
     * @tc.name: test loop serial startup framework
     * @tc.desc: test the startup results of loop serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0400', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0400";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility4')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0500
     * @tc.name: test cycle parallel start framework
     * @tc.desc: test the startup results of cycle parallel start framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0500', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0500";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility5')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0600
     * @tc.name: test the callback for successful loading of the serial startup framework
     * @tc.desc: test the callback for successful loading of the serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0600', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0600";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility6')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0700
     * @tc.name: test the callback for successful loading of the parallel startup framework
     * @tc.desc: test the callback for successful loading of the parallel startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0700', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0700";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility7')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0800
     * @tc.name: test a callback for successfully loading a startup framework
     * @tc.desc: test a callback for successfully loading a startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0800', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0800";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a SingleStartAbility2')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0900
     * @tc.name: test main thread waiting
     * @tc.desc: test the results of the main thread waiting
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0900', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0900";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility8')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1000
     * @tc.name: test main thread not waiting
     * @tc.desc: test the result of the main thread not waiting
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1000', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1000";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility9')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1100
     * @tc.name: test custom configuration a single startup framework
     * @tc.desc: test the startup results of custom configuration a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1100', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1100";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a SingleStartAbility')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1200
     * @tc.name: test custom configuration serial startup framework
     * @tc.desc: test the startup results of custom configuration serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1200', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1200";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility2')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1300
     * @tc.name: test custom configuration parallel start framework
     * @tc.desc: test the startup results of the custom configuration parallel startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1300', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1300";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility3')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1400
     * @tc.name: test custom configuration loop serial startup framework
     * @tc.desc: test the startup results of custom configuration loop serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1400', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1400";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility4')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1500
     * @tc.name: test custom configuration cycle parallel start framework
     * @tc.desc: test the startup results of custom configuration cycle parallel start framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1500', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1500";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility5')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1600
     * @tc.name: test custom configuration the callback for successful loading of the serial startup framework
     * @tc.desc: test custom configuration the callback for successful loading of the serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1600', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1600";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility6')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1700
     * @tc.name: test custom configuration the callback for successful loading of the parallel startup framework
     * @tc.desc: test custom configuration the callback for successful loading of the parallel startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1700', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1700";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility7')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1800
     * @tc.name: test custom configuration a callback for successfully loading a startup framework
     * @tc.desc: test custom configuration a callback for successfully loading a startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1800', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1800";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a SingleStartAbility2')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1900
     * @tc.name: test custom configuration main thread waiting
     * @tc.desc: test the custom configuration results of the main thread waiting
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1900', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1900";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility8')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2000
     * @tc.name: test custom configuration main thread not waiting
     * @tc.desc: test the custom configuration result of the main thread not waiting
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2000', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2000";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility9')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2100
     * @tc.name: the testing startup framework parameter is undefined
     * @tc.desc: the result of testing startup framework parameter is undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2100', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2100";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility10')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2200
     * @tc.name: the testing startup framework parameter is null
     * @tc.desc: the result of testing startup framework parameter is null
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2200', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2200";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility10')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2300
     * @tc.name: the testing startup framework parameter is []
     * @tc.desc: the result of testing startup framework parameter is []
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2300', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2300";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility10')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2400
     * @tc.name: the testing startup framework parameter is {}
     * @tc.desc: the result of testing startup framework parameter is {}
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2400', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2400";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility10')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2500
     * @tc.name: the testing startup framework parameter is {}
     * @tc.desc: the result of testing startup framework parameter is {}
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2500', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2500";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility10')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2600
     * @tc.name: the testing startup framework parameter is {}
     * @tc.desc: the result of testing startup framework parameter is not exit
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2600', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2600";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility10')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(false).assertTrue()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2700
     * @tc.name: the testing startup framework parameter is {}
     * @tc.desc: the result of testing startup framework parameter is not exit
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2700', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2700";
      console.log(TAG + " start");
      try {
        delegator.executeShellCommand('aa start -b com.acts.startupmanualhelp1 -a PageAbility11')
        .then(()=>{
            console.log(TAG, " aa start ability success: ")
            done();
          })
          .catch((err)=>{
            console.log(TAG, "aa start ability error: ",JSON.stringify(err))
            expect(apiResult.length == 10).assertTrue()
            expect(apiResult[0]).assertTrue()
            expect(apiResult[1]).assertTrue()
            expect(apiResult[2]).assertTrue()
            expect(apiResult[3]).assertFalse()
            expect(apiResult[4]).assertFalse()
            expect(apiResult[5]).assertFalse()
            expect(apiResult[6]).assertFalse()
            expect(apiResult[7]).assertFalse()
            expect(apiResult[8]).assertFalse()
            expect(apiResult[9]).assertFalse()
            done();
          })
      } catch (err) {
        console.log(TAG, "start ability error: ",JSON.stringify(err))
        done();
      }
    })
  })
}