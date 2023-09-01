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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import commonEventManager from '@ohos.commonEvent';

export default function applicationLifecycleTest() {
  describe('ApplicationLifeCycleTest', function () {

    let TAG = "";

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_On_0100
    * @tc.name    ApplicationContext on/off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("ApplicationSyncLifeCycleTest_On_0100", 0, async function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_On_0100 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_On_0100";
      let lifecycleId;
      let labTag = 0;

      console.log(TAG + " commonEventManager createSubscriber");
      let commonEventSubscribeInfo = {
        events: ["MainAbility2_onDestroy"]
      };
      commonEventManager.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        commonEventManager.subscribe(sub, (err, msg) => {
          commonEventManager.unsubscribe(sub);
          globalThis.apctx.off('abilityLifecycleEvent', lifecycleId);
          expect(labTag).assertEqual(1)
          done()
        })
      })

      let AbilityLifecycleCallback = {
        onAbilityCreate(ability) {
          console.log(TAG + " onAbilityCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          if (abilityname === 'MainAbility2') {
            labTag = 1;
          }
        },
      }

      lifecycleId = globalThis.apctx.on('abilityLifecycleEvent', AbilityLifecycleCallback);
      console.log(TAG + " ApplicationContext on abilityLifecycleEvent, lifecycleId is" + lifecycleId);

      console.log(TAG + " startAbility");
      let str = {
        "bundleName": "com.example.lifecycle_sync_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.ctx.startAbility(str)
        .then((data) => {
          console.log(TAG + " start successful ability");
        }).catch((error) => {
        console.log(TAG + " start failed . Cause:" + JSON.stringify(error));
      })
    });

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_On_0200
    * @tc.name    ApplicationContext on/off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("ApplicationSyncLifeCycleTest_On_0200", 0, async function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_On_0200 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_On_0200";
      let lifecycleId;
      let labTag = 0;

      console.log(TAG + " commonEventManager createSubscriber");
      let commonEventSubscribeInfo = {
        events: ["MainAbility2_onDestroy"]
      };
      commonEventManager.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        commonEventManager.subscribe(sub, (err, msg) => {
          commonEventManager.unsubscribe(sub);
          globalThis.apctx.off('abilityLifecycleEvent', lifecycleId);
          expect(labTag).assertEqual(1)
          done()
        })
      })

      let AbilityLifecycleCallback = {
        onWindowStageCreate(ability, windowStage) {
          labTag = 1;
        }
      }

      lifecycleId = globalThis.apctx.on('abilityLifecycleEvent', AbilityLifecycleCallback);
      console.log(TAG + " ApplicationContext on abilityLifecycleEvent, lifecycleId is" + lifecycleId);

      console.log(TAG + " startAbility");
      let str = {
        "bundleName": "com.example.lifecycle_sync_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.ctx.startAbility(str)
        .then((data) => {
          console.log(TAG + " start successful ability");
        }).catch((error) => {
        console.log(TAG + " start failed . Cause:" + JSON.stringify(error));
      })
    });

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_On_0300
    * @tc.name    ApplicationContext on/off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("ApplicationSyncLifeCycleTest_On_0300", 0, async function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_On_0300 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_On_0300";
      let lifecycleId;
      let labTag = 0;

      console.log(TAG + " commonEventManager createSubscriber");
      let commonEventSubscribeInfo = {
        events: ["MainAbility2_onDestroy"]
      };
      commonEventManager.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        commonEventManager.subscribe(sub, (err, msg) => {
          commonEventManager.unsubscribe(sub);
          globalThis.apctx.off('abilityLifecycleEvent', lifecycleId);
          expect(labTag).assertEqual(1)
          done()
        })
      })

      let AbilityLifecycleCallback = {
        onWindowStageActive(ability, windowStage) {
          labTag = 1;
        }
      }

      lifecycleId = globalThis.apctx.on('abilityLifecycleEvent', AbilityLifecycleCallback);
      console.log(TAG + " ApplicationContext on abilityLifecycleEvent, lifecycleId is" + lifecycleId);

      console.log(TAG + " startAbility");
      let str = {
        "bundleName": "com.example.lifecycle_sync_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.ctx.startAbility(str)
        .then((data) => {
          console.log(TAG + " start successful ability");
        }).catch((error) => {
        console.log(TAG + " start failed . Cause:" + JSON.stringify(error));
      })
    });

    /*
* @tc.number  ApplicationSyncLifeCycleTest_On_0500
* @tc.name    ApplicationContext on/off
* @tc.desc    Function test
* @tc.level   0
*/
    it("ApplicationSyncLifeCycleTest_On_0500", 0, async function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_On_0500 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_On_0500";
      let lifecycleId;
      let labTag = 0;

      console.log(TAG + " commonEventManager createSubscriber");
      let commonEventSubscribeInfo = {
        events: ["MainAbility2_onDestroy"]
      };
      commonEventManager.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        commonEventManager.subscribe(sub, (err, msg) => {
          commonEventManager.unsubscribe(sub);
          globalThis.apctx.off('abilityLifecycleEvent', lifecycleId);
          expect(labTag).assertEqual(1);
          done()
        })
      })

      let AbilityLifecycleCallback = {
        onWindowStageDestroy(ability, windowStage) {
          labTag = 1;
        }
      }

      lifecycleId = globalThis.apctx.on('abilityLifecycleEvent', AbilityLifecycleCallback);
      console.log(TAG + " ApplicationContext on abilityLifecycleEvent, lifecycleId is" + lifecycleId);

      console.log(TAG + " startAbility");
      let str = {
        "bundleName": "com.example.lifecycle_sync_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.ctx.startAbility(str)
        .then((data) => {
          console.log(TAG + " start successful ability");
        }).catch((error) => {
        console.log(TAG + " start failed . Cause:" + JSON.stringify(error));
      })
    });

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_On_0400
    * @tc.name    ApplicationContext on/off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("ApplicationSyncLifeCycleTest_On_0400", 0, async function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_On_0400 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_On_0400";
      let lifecycleId;
      let labTag = 0;

      console.log(TAG + " commonEventManager createSubscriber");
      let commonEventSubscribeInfo = {
        events: ["MainAbility2_onDestroy"]
      };
      commonEventManager.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        commonEventManager.subscribe(sub, (err, msg) => {
          commonEventManager.unsubscribe(sub);
          globalThis.apctx.off('abilityLifecycleEvent', lifecycleId);
          expect(labTag).assertEqual(1);
          done()
        })
      })

      let AbilityLifecycleCallback = {
        onWindowStageInactive(ability, windowStage) {
          labTag = 1;
        }
      }

      lifecycleId = globalThis.apctx.on('abilityLifecycleEvent', AbilityLifecycleCallback);
      console.log(TAG + " ApplicationContext on abilityLifecycleEvent, lifecycleId is" + lifecycleId);

      console.log(TAG + " startAbility");
      let str = {
        "bundleName": "com.example.lifecycle_sync_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.ctx.startAbility(str)
        .then((data) => {
          console.log(TAG + " start successful ability");
        }).catch((error) => {
        console.log(TAG + " start failed . Cause:" + JSON.stringify(error));
      })
    });

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_On_0600
    * @tc.name    ApplicationContext on/off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("ApplicationSyncLifeCycleTest_On_0600", 0, async function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_On_0600 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_On_0600";
      let lifecycleId;
      let labTag = 0;

      console.log(TAG + " commonEventManager createSubscriber");
      let commonEventSubscribeInfo = {
        events: ["MainAbility2_onDestroy"]
      };
      commonEventManager.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        commonEventManager.subscribe(sub, (err, msg) => {
          commonEventManager.unsubscribe(sub);
          globalThis.apctx.off('abilityLifecycleEvent', lifecycleId);
          expect(labTag).assertEqual(1);
          done()
        })
      })

      let AbilityLifecycleCallback = {
        onAbilityDestroy(ability) {
          labTag = 1;
        }
      }

      lifecycleId = globalThis.apctx.on('abilityLifecycleEvent', AbilityLifecycleCallback);
      console.log(TAG + " ApplicationContext on abilityLifecycleEvent, lifecycleId is" + lifecycleId);

      console.log(TAG + " startAbility");
      let str = {
        "bundleName": "com.example.lifecycle_sync_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.ctx.startAbility(str)
        .then((data) => {
          console.log(TAG + " start successful ability");
        }).catch((error) => {
        console.log(TAG + " start failed . Cause:" + JSON.stringify(error));
      })
    });

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_On_0700
    * @tc.name    ApplicationContext on/off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("ApplicationSyncLifeCycleTest_On_0700", 0, async function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_On_0700 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_On_0700";
      let lifecycleId;
      let labTag = 0;

      console.log(TAG + " commonEventManager createSubscriber");
      let commonEventSubscribeInfo = {
        events: ["MainAbility2_onDestroy"]
      };
      commonEventManager.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        commonEventManager.subscribe(sub, (err, msg) => {
          commonEventManager.unsubscribe(sub);
          globalThis.apctx.off('abilityLifecycleEvent', lifecycleId);
          expect(labTag).assertEqual(1);
          done()
        })
      })

      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          labTag = 1;
        }
      }

      lifecycleId = globalThis.apctx.on('abilityLifecycleEvent', AbilityLifecycleCallback);
      console.log(TAG + " ApplicationContext on abilityLifecycleEvent, lifecycleId is" + lifecycleId);

      console.log(TAG + " startAbility");
      let str = {
        "bundleName": "com.example.lifecycle_sync_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.ctx.startAbility(str)
        .then((data) => {
          console.log(TAG + " start successful ability");
        }).catch((error) => {
        console.log(TAG + " start failed . Cause:" + JSON.stringify(error));
      })
    });

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_Off_0100
    * @tc.name    ApplicationContext on/off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("ApplicationSyncLifeCycleTest_Off_0100", 0, async function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_Off_0100 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_Off_0100";
      let lifecycleId;
      let resultMsg = [];

      console.log(TAG + " commonEventManager createSubscriber");
      let commonEventSubscribeInfo = {
        events: ["MainAbility2_onDestroy"]
      };
      commonEventManager.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        commonEventManager.subscribe(sub, (err, msg) => {
          commonEventManager.unsubscribe(sub);
          if (resultMsg.length > 0) {
            expect().assertFail()
          }
          done()
        })
      })

      let AbilityLifecycleCallback = {
        onAbilityCreate(ability) {
          console.log(TAG + " onAbilityCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          if (abilityname === 'MainAbility2') {
            resultMsg.push('onAbilityCreate')
          }
        },
        onWindowStageCreate(ability, windowStage) {
          console.log(TAG + " onWindowStageCreate ability:" + JSON.stringify(ability));
        },
        onWindowStageActive(ability, windowStage) {
          console.log(TAG + " onWindowStageActive ability:" + JSON.stringify(ability));
        },
        onWindowStageInactive(ability, windowStage) {
          console.log(TAG + " onWindowStageInactive ability:" + JSON.stringify(ability));
        },
        onWindowStageDestroy(ability, windowStage) {
          console.log(TAG + " onWindowStageDestroy ability:"
          + JSON.stringify(ability));
        },
        onAbilityDestroy(ability) {
          console.log(TAG + " onAbilityDestroy ability:"
          + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          if (abilityname === 'MainAbility2') {
            resultMsg.push('onAbilityDestroy')
          }
        },
        onAbilityForeground(ability) {
          console.log(TAG + " onAbilityForeground ability:"
          + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          if (abilityname === 'MainAbility2') {
            resultMsg.push('onAbilityForeground')
          }
        },
        onAbilityBackground(ability) {
          console.log(TAG + " onAbilityBackground ability:"
          + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          if (abilityname === 'MainAbility2') {
            resultMsg.push('onAbilityBackground')
          }
        },
        onAbilityContinue(ability) {
          console.log(TAG + " onAbilityContinue ability:"
          + JSON.stringify(ability));
        }
      }
      console.log(TAG + " ApplicationContext on abilityLifecycleEvent");
      lifecycleId = globalThis.apctx.on('abilityLifecycleEvent', AbilityLifecycleCallback);
      console.log(TAG + " ApplicationContext off abilityLifecycleEvent");
      globalThis.apctx.off('abilityLifecycleEvent', lifecycleId);
      console.log(TAG + " startAbility");
      let str = {
        "bundleName": "com.example.lifecycle_sync_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.ctx.startAbility(str)
        .then((data) => {
          console.log(TAG + " start successful ability");
        }).catch((error) => {
        console.log(TAG + " start failed . Cause:" + JSON.stringify(error));
      })
    });

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_Off_0200
    * @tc.name    ApplicationContext off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it('ApplicationSyncLifeCycleTest_Off_0200', 0, function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_Off_0200 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_Off_0200";
      try {
        globalThis.apctx.off('abilityLifecycleEvent', 10000);
        expect().assertFail()
      } catch (error) {
        console.log(TAG + " off fail with error id. " + JSON.stringify(error));
      }
      done()
    })

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_Off_0300
    * @tc.name    ApplicationContext off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it('ApplicationSyncLifeCycleTest_Off_0300', 0, function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_Off_0300 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_Off_0300";
      try {
        globalThis.apctx.off('abilityLifecycleEvent', undefined);
        expect().assertFail()
      } catch (error) {
        console.log(TAG + " off fail with error id. " + JSON.stringify(error));
      }
      done()
    })

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_Off_0400
    * @tc.name    ApplicationContext off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it('ApplicationSyncLifeCycleTest_Off_0400', 0, function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_Off_0400 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_Off_0400";
      try {
        globalThis.apctx.off('abilityLifecycleEvent', null);
        expect().assertFail()
      } catch (error) {
        console.log(TAG + " off fail with error id. " + JSON.stringify(error));
      }
      done()
    })

    /*
    * @tc.number  ApplicationSyncLifeCycleTest_Off_0500
    * @tc.name    ApplicationContext off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it('ApplicationSyncLifeCycleTest_Off_0500', 0, function (done) {
      console.log("------------ApplicationSyncLifeCycleTest_Off_0500 START-------------");
      TAG = "ApplicationSyncLifeCycleTest_Off_0500";
      try {
        globalThis.apctx.off('abilityLifecycleEvent', 'ABCD');
        expect().assertFail()
      } catch (error) {
        console.log(TAG + " off fail with error id. " + JSON.stringify(error));
      }
      done()
    })

    /*
    * @tc.number  ApplicationSyncEnvironmentTest_On_0100
    * @tc.name    ApplicationContext on/off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it('ApplicationSyncEnvironmentTest_On_0100', 0, function (done) {
      console.log("------------ApplicationSyncEnvironmentTest_On_0100 START-------------");
      TAG = "ApplicationSyncEnvironmentTest_On_0100";
      let environmentCallback = {
        onConfigurationUpdated(config){
          console.log(TAG + `onConfigurationUpdated config: ${JSON.stringify(config)}`);
        },
        onMemoryLevel(level){
          console.log(TAG + `onMemoryLevel level: ${level}`);
        }
      };
      try {
        let environmentId = globalThis.apctx.on('environmentEvent', environmentCallback);
        console.log(TAG + `on EnvironmentEvent, environmentId is :  ${JSON.stringify(environmentId)}`);
        globalThis.apctx.off('environmentEvent', environmentId);
      } catch (error) {
        expect().assertFail()
        console.log(TAG + " off fail with error id. " + JSON.stringify(error));
      }
      done()
    })

    /*
    * @tc.number  ApplicationSyncEnvironmentTest_Off_0100
    * @tc.name    ApplicationContext off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it('ApplicationSyncEnvironmentTest_Off_0100', 0, function (done) {
      console.log("------------ApplicationSyncEnvironmentTest_Off_0100 START-------------");
      TAG = "ApplicationSyncEnvironmentTest_Off_0100";
      try {
        globalThis.apctx.off('environmentEvent', 10000);
        expect().assertFail()
      } catch (error) {
        console.log(TAG + " off fail with error id. " + JSON.stringify(error));
      }
      done()
    })

    /*
    * @tc.number  ApplicationSyncEnvironmentTest_Off_0200
    * @tc.name    ApplicationContext off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it('ApplicationSyncEnvironmentTest_Off_0200', 0, function (done) {
      console.log("------------ApplicationSyncEnvironmentTest_Off_0200 START-------------");
      TAG = "ApplicationSyncEnvironmentTest_Off_0200";
      try {
        globalThis.apctx.off('environmentEvent', undefined);
        expect().assertFail()
      } catch (error) {
        console.log(TAG + " off fail with error id. " + JSON.stringify(error));
      }
      done()
    })

    /*
    * @tc.number  ApplicationSyncEnvironmentTest_Off_0300
    * @tc.name    ApplicationContext off
    * @tc.desc    Function test
    * @tc.level   0
    */
    it('ApplicationSyncEnvironmentTest_Off_0300', 0, function (done) {
      console.log("------------ApplicationSyncEnvironmentTest_Off_0300 START-------------");
      TAG = "ApplicationSyncEnvironmentTest_Off_0300";
      try {
        globalThis.apctx.off('environmentEvent', null);
        expect().assertFail()
      } catch (error) {
        console.log(TAG + " off fail with error id. " + JSON.stringify(error));
      }
      done()
    })
  })
}