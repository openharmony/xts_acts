/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';
import wantAgent from '@ohos.app.ability.wantAgent';
import commonEvent from '@ohos.commonEventManager';
import dataShare from '@ohos.data.dataShare';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let ERROR_START_ABILITY_WAITTING = 16000017;
let ERROR_NO_PERMISSION = 201;
let dataShareUri = "datashare:///startuptest";
let context = null;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function sleep(time) {
  return new Promise((resolve)=>setTimeout(resolve,time));
}

// start continuous task
async function startContinuousTask(TAG): Promise<void> {
  let wantAgentInfo = {
    wants: [
      {
        bundleName: 'com.acts.startuptest',
        abilityName: 'TestAbility',
      }
    ],
    operationType: wantAgent.OperationType.START_ABILITY,
    requestCode: 0,
    wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
  }
  try {
    let wantAgentObject = await wantAgent.getWantAgent(wantAgentInfo);
    await backgroundTaskManager.startBackgroundRunning(context,
      backgroundTaskManager.BackgroundMode.DATA_TRANSFER, wantAgentObject);
  } catch (error) {
    console.log(TAG + ` Operation startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
  }
}

// cancel continuous task
async function stopContinuousTask(TAG): Promise<void> {
  try {
    await backgroundTaskManager.stopBackgroundRunning(context)
  } catch (error) {
    console.log(TAG + ` Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
  }
}

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    beforeAll(async function () {
      context = globalThis.testContext;
      await abilityDelegator.executeShellCommand('killall com.acts.startupassistant');
    })
    beforeEach(async function () {
      //globalThis.onForegroundFlag = false;
      commonEvent.publish('terminateAssistantAbility', () => {});
    })
    afterEach(async function () {
      await stopContinuousTask('afterEach SUB_AA_StartUpRuleOptimizeTest');
      await sleep(200);
    })
    afterAll(async function () {
      commonEvent.publish('terminateAssistantAbility', () => {});
      await abilityDelegator.executeShellCommand('killall com.acts.startupassistant');
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0100
     * @tc.name Prohibit background startAbility test
     * @tc.desc Ability can not be started during a non-long-term task or non-scheduling foreground
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0100',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0100 ';

      function startAbilityWithBgTask() {
        let want = {
          abilityName: 'EntryAbility',
          bundleName:'com.acts.startuptest'
        }
        context.startAbility(want, (err) => {
          console.log(TAG + ' startAbility error: ' + err.code + ' ' + err.message);
          if (err && err.code) {
            expect(err.code).assertEqual(ERROR_NO_PERMISSION);
            setTimeout(() => {
              console.log(TAG + " publish terminateAssistantAbility event");
              commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish terminate event') });
            }, 100);
          } else {
            expect().assertFail();
            done();
          }
        })
      }

      let callbackId;
      let testDone = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground")
          if (abilityName === 'TestAbility') {
            if (testDone === true) {
              console.log(TAG + 'testDone');
              globalThis.ApplicationContext.off('abilityLifecycle', callbackId)
              done();
            }
          }
        },
        onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground")
          if (abilityName === 'TestAbility') {
            setTimeout(startAbilityWithBgTask, 100);
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      };
      console.log(TAG + 'startAbilityForResult');
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated');
        expect(err.code).assertEqual(0);
        testDone = true;
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0200
     * @tc.name Allow background startAbility for background running ContinuousTask
     * @tc.desc Test the startAbility of a background running ContinuousTask.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0200',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0200 ';

      function startAbilityWithBgTask() {
        console.log(TAG + 'startAbilityWithBgTask');
        let want = {
          abilityName: 'TestAbility',
          bundleName:'com.acts.startuptest'
        };
        // test startAbility
        context.startAbility(want).then(() => {
          console.log(TAG + ' startAbility success');
          if (testDone === true) {
            console.log(TAG + 'testDone');
            globalThis.ApplicationContext.off('abilityLifecycle', callbackId);
            done();
          } else {
            testDone = true;
          }
        }).catch((err) => {
          console.log(TAG + ' startAbility error: ' + err.code + ' ' + err.message);
          if (err.code === ERROR_START_ABILITY_WAITTING) {
            testDone = true;
            return;
          }
          expect().assertFail();
          done();
        })
      }

      let callbackId;
      let testDone = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground");
          if (abilityName === 'TestAbility') {
            if (testDone === true) {
              console.log(TAG + 'testDone');
              globalThis.ApplicationContext.off('abilityLifecycle', callbackId);
              done();
            }
          }
        },
        onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground")
          if (abilityName === 'TestAbility') {
            startAbilityWithBgTask();
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      await startContinuousTask(TAG);
      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      };
      console.log(TAG + 'startAbility');
      context.startAbility(want, (err, data) => {
        console.log(TAG + 'startAbility callback ' + err.code);
        if (err.code && err.code != ERROR_START_ABILITY_WAITTING) {
          expect().assertFail();
          done();
        }
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0300
     * @tc.name Allow background startAbilityByCall for background running ContinuousTask
     * @tc.desc Test the startAbilityByCall of a background running ContinuousTask.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0300',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0300 ';

      function startAbilityWithBgTask() {
        let want = {
          abilityName: 'CalleeAbility',
          bundleName:'com.acts.startupassistant'
        };
        // test startAbilityByCall
        context.startAbilityByCall(want).then(async () => {
          console.log(TAG + ' startAbilityByCall success');
          setTimeout(() => {
            console.log(TAG + " publish terminateAssistantAbility event");
            commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish done') });
          }, 100);
        }).catch((err) => {
          console.log(TAG + ' startAbilityByCall error: ' + err.code + ' ' + err.message);
          expect().assertFail();
          done();
        })
      }

      let callbackId;
      let testDone = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground");
          if (abilityName === 'TestAbility') {
            if (testDone === true) {
              console.log(TAG + 'testDone');
              globalThis.ApplicationContext.off('abilityLifecycle', callbackId);
              done();
            }
          }
        },
        onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground");
          if (abilityName === 'TestAbility') {
            startAbilityWithBgTask();
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      await startContinuousTask(TAG);
      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      };
      console.log(TAG + 'startAbilityForResult');
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated err.code ' + err.code);
        expect(err.code).assertEqual(0);
        testDone = true;
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0400
     * @tc.name Allow background connectServiceExtensionAbility for background running ContinuousTask
     * @tc.desc Test the connectServiceExtensionAbility of a background running ContinuousTask.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0400',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0400 ';
      let connectId;
      let connection = {
        onConnect: function (elementName, proxy) {
          console.log(TAG + ' onConnect');
          setTimeout(() => {
            console.log(TAG + " publish terminateAssistantAbility event");
            commonEvent.publish('terminateAssistantAbility', () => {console.log(TAG + 'send terminate event')});
            context.disconnectServiceExtensionAbility(connectId);
          }, 100);
        },
        onDisconnect: function () {
          console.log(TAG + 'onDisconnect');
        },
        onFailed: function (code) {
          console.log(TAG + `onFailed ${code}`);
          expect().assertFail();
          done();
        }
      }

      function startAbilityWithBgTask() {
        console.log(TAG + 'startAbilityWithBgTask');
        let want = {
          abilityName: 'ServiceExtAbility',
          bundleName:'com.acts.startuptest'
        };
        // test connectServiceExtensionAbility
        connectId = context.connectServiceExtensionAbility(want, connection);
      }

      let callbackId;
      let testDone = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground")
          if (abilityName === 'TestAbility') {
            if (testDone === true) {
              console.log(TAG + 'testDone');
              globalThis.ApplicationContext.off('abilityLifecycle', callbackId)
              done();
            }
          }
        },
        onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground")
          if (abilityName === 'TestAbility') {
            startAbilityWithBgTask();
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      await startContinuousTask(TAG);
      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      };
      console.log(TAG + 'startAbilityForResult');
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated');
        expect(err.code).assertEqual(0);
        testDone = true;
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0500
     * @tc.name Allow background startServiceExtensionAbility for background running ContinuousTask
     * @tc.desc Test the startServiceExtensionAbility of a background running ContinuousTask.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0500',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0500 ';

      function startAbilityWithBgTask() {
        let want = {
          abilityName: 'ServiceExtAbility',
          bundleName:'com.acts.startuptest'
        };
        // test startServiceExtensionAbility
        context.startServiceExtensionAbility(want).then(() => {
          console.log(TAG + ' startServiceExtensionAbility success');
          setTimeout(() => {
            console.log(TAG + " publish terminateAssistantAbility event");
            commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish done') });
          }, 100);
        }).catch((err) => {
          console.log(TAG + ' startServiceExtensionAbility error: ' + err.code + ' ' + err.message);
          expect().assertFail();
          done();
        });
      }

      let callbackId;
      let testDone = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground");
          if (abilityName === 'TestAbility') {
            if (testDone === true) {
              console.log(TAG + 'testDone');
              globalThis.ApplicationContext.off('abilityLifecycle', callbackId);
              done();
            }
          }
        },
        onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground");
          if (abilityName === 'TestAbility') {
            startAbilityWithBgTask();
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      await startContinuousTask(TAG);
      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      };
      console.log(TAG + 'startAbilityForResult');
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated');
        expect(err.code).assertEqual(0);
        testDone = true;
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0600
     * @tc.name Allow background createDataShareHelper for background running ContinuousTask
     * @tc.desc Test the createDataShareHelper of a background running ContinuousTask.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0600',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0600 ';

      function startAbilityWithBgTask() {
        // Test connect dataShare
        dataShare.createDataShareHelper(context, dataShareUri, (err, dataShareHelper) => {
          console.log(TAG + ' createDataShareHelper callback');
          if (err && err.code) {
            console.log(TAG + ' createDataShareHelper failed ' + err.code + ' ' + err.message);
            expect().assertFail();
            done();
          } else {
            console.log(TAG + ' createDataShareHelper success');
            setTimeout(() => {
              console.log(TAG + " publish terminateAssistantAbility event");
              commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish done') });
            }, 100);
          }
        })
      }

      let callbackId;
      let testDone = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground")
          if (abilityName === 'TestAbility') {
            if (testDone === true) {
              console.log(TAG + 'testDone');
              globalThis.ApplicationContext.off('abilityLifecycle', callbackId)
              done();
            }
          }
        },
        onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground")
          if (abilityName === 'TestAbility') {
            startAbilityWithBgTask();
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      await startContinuousTask(TAG);
      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      }
      console.log(TAG + 'startAbilityForResult');
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated err.code ' + err.code);
        expect(err.code).assertEqual(0);
        testDone = true;
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0700
     * @tc.name Allow background startAbility when the ability is moving to foreground
     * @tc.desc Test the startAbility call when the ability is moving to foreground.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0700',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0700 ';

      function startAbilityWithMoveToForeground() {
        let want = {
          abilityName: 'TestAbility',
          bundleName:'com.acts.startuptest'
        }
        // test startAbility
        context.startAbility(want).then(() => {
          console.log(TAG + ' startAbility success');
        }).catch((err) => {
          console.log(TAG + ' startAbility error: ' + err.code + ' ' + err.message);
          if (err.code != ERROR_START_ABILITY_WAITTING) {
            expect().assertFail();
            done();
          }
        })
      }

      let callbackId;
      let onForeground = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground")
          if (abilityName === 'TestAbility' && !onForeground) {
            onForeground = true;
            globalThis.ApplicationContext.off('abilityLifecycle', callbackId)
            done();
          }
        },
        onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground");
          if (abilityName === 'TestAbility') {
            setTimeout(() => {
              console.log(TAG + " publish terminateAssistantAbility event");
              commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish done')});
            }, 100);
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      }
      console.log(TAG + 'startAbilityForResult');
      globalThis.onForegroundFlag = false;
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated SUB_AA_StartUpRuleOptimizeTest');
        expect(onForeground).assertEqual(false);
        expect(err.code).assertEqual(0);
        startAbilityWithMoveToForeground();
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0800
     * @tc.name Allow background startAbilityByCall when the ability is moving to foreground
     * @tc.desc Test the startAbilityByCall call when the ability is moving to foreground.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0800',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0800 ';

      function startAbilityWithMoveToForeground() {
        let want = {
          abilityName: 'CalleeAbility',
          bundleName:'com.acts.startupassistant'
        }
        // test startAbilityByCall
        context.startAbilityByCall(want).then(() => {
          console.log(TAG + ' startAbilityByCall success');
          done();
        }).catch((err) => {
          console.log(TAG + ' startAbilityByCall error: ' + err.code + ' ' + err.message);
          expect().assertFail();
          done();
        })
      }

      let callbackId;
      let onForeground = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground")
          if (abilityName === 'TestAbility' && !onForeground) {
            onForeground = true;
            globalThis.ApplicationContext.off('abilityLifecycle', callbackId)
          }
        },
        async onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground");
          if (abilityName === 'TestAbility') {
            await sleep(100);
            console.log(TAG + " publish terminateAssistantAbility event");
            commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish done')});
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      }
      console.log(TAG + 'startAbilityForResult');
      let option = {
        windowMode: 1
      }
      context.startAbilityForResult(want, option, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated');
        expect(onForeground).assertEqual(false);
        expect(err.code).assertEqual(0);
        startAbilityWithMoveToForeground();
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_0900
     * @tc.name Allow background connectServiceExtensionAbility when the ability is moving to foreground
     * @tc.desc Test the connectServiceExtensionAbility call when the ability is moving to foreground.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_0900',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_0900 ';
      let connectId;
      let connection = {
        onConnect: function (elementName, proxy) {
          console.log(TAG + ' onConnect');
          context.disconnectServiceExtensionAbility(connectId);
        },
        onDisconnect: function () {
          console.log(TAG + 'onDisconnect');
          done();
        },
        onFailed: function (code) {
          console.log(TAG + `onFailed ${code}`);
          expect().assertFail();
          done();
        }
      }

      function startAbilityWithMoveToForeground() {
        let want = {
          abilityName: 'ServiceExtAbility',
          bundleName:'com.acts.startuptest'
        }
        // test connectServiceExtensionAbility
        connectId = context.connectServiceExtensionAbility(want, connection);
      }

      let callbackId;
      let onForeground = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground")
          if (abilityName === 'TestAbility' && !onForeground) {
            onForeground = true;
            globalThis.ApplicationContext.off('abilityLifecycle', callbackId);
          }
        },
        async onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground")
          if (abilityName === 'TestAbility') {
            await sleep(100);
            console.log(TAG + " publish terminateAssistantAbility event");
            commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish done')});
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      }
      console.log(TAG + 'startAbilityForResult');
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated');
        expect(onForeground).assertEqual(false);
        expect(err.code).assertEqual(0);
        startAbilityWithMoveToForeground();
      });
    })


    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_1000
     * @tc.name Allow background startServiceExtensionAbility when the ability is moving to foreground
     * @tc.desc Test the startServiceExtensionAbility call when the ability is moving to foreground.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_1000',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_1000 ';

      function startAbilityWithMoveToForeground() {
        let want = {
          abilityName: 'ServiceExtAbility',
          bundleName:'com.acts.startuptest'
        }
        // test startServiceExtensionAbility
        context.startServiceExtensionAbility(want).then(() => {
          console.log(TAG + ' startServiceExtensionAbility success');
        }).catch((err) => {
          console.log(TAG + ' startServiceExtensionAbility error: ' + err.code + ' ' + err.message);
          expect().assertFail();
          done();
        })
      }

      let callbackId;
      let onForeground = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground")
          if (abilityName === 'TestAbility' && !onForeground) {
            onForeground = true;
            globalThis.ApplicationContext.off('abilityLifecycle', callbackId);
            done();
          }
        },
        async onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground")
          if (abilityName === 'TestAbility') {
            await sleep(100);
            console.log(TAG + " publish terminateAssistantAbility event");
            commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish done')});
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      }
      console.log(TAG + 'startAbilityForResult');
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated');
        expect(onForeground).assertEqual(false);
        expect(err.code).assertEqual(0);
        startAbilityWithMoveToForeground();
      });
    })

    /**
     * @tc.number SUB_AA_StartUpRuleOptimizeTest_1100
     * @tc.name Allow background createDataShareHelper when the ability is moving to foreground
     * @tc.desc Test the createDataShareHelper call when the ability is moving to foreground.
     */
    it('SUB_AA_StartUpRuleOptimizeTest_1100',0, async function (done) {
      let TAG = 'SUB_AA_StartUpRuleOptimizeTest_1100 ';

      function startAbilityWithMoveToForeground() {
        // Test connect dataShare
        dataShare.createDataShareHelper(context, dataShareUri, (err, dataShareHelper) => {
          console.log(TAG + ' createDataShareHelper callback');
          if (err && err.code) {
            console.log(TAG + ' createDataShareHelper failed ' + err.code + ' ' + err.message);
            expect().assertFail();
            done();
          } else {
            console.log(TAG + ' createDataShareHelper success');
            done();
          }
        })
      }

      let callbackId;
      let onForeground = false;
      let AbilityLifecycleCallback = {
        onAbilityForeground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityForeground")
          if (abilityName === 'TestAbility' && !onForeground) {
            onForeground = true;
            globalThis.ApplicationContext.off('abilityLifecycle', callbackId);
          }
        },
        onAbilityBackground(ability) {
          let abilityName = ability.context.abilityInfo.name;
          console.log(TAG + abilityName + " onAbilityBackground");
          if (abilityName === 'TestAbility') {
            setTimeout(() => {
              console.log(TAG + " publish terminateAssistantAbility event");
              commonEvent.publish('terminateAssistantAbility', () => { console.log(TAG + 'publish done')});
            }, 100);
          }
        }
      }
      callbackId = globalThis.ApplicationContext.on('abilityLifecycle', AbilityLifecycleCallback);

      // Start another ability, ensure testAbility is background
      let want = {
        abilityName: 'EntryAbility',
        bundleName:'com.acts.startupassistant'
      }
      console.log(TAG + 'startAbilityForResult');
      context.startAbilityForResult(want, (err, data) => {
        console.log(TAG + ' assistantAbility is terminated');
        expect(onForeground).assertEqual(false);
        expect(err.code).assertEqual(0);
        startAbilityWithMoveToForeground();
      });
    })
  })
}
