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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import display from '@ohos.display';

export default function inputMethodWindManageAbility() {
  describe('inputMethodWindManageTest', function () {
    var inputServer = {
      packageName: '',
      methodId: '',
      name:'',
      id:'',
      extra:{}
    }

    let display_info;
    let getFocusCmd = '';
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    async function runCmd(cmd){
      console.debug('====>runCmd info:' + cmd);
      await abilityDelegator.executeShellCommand(cmd);
    }

    beforeAll(async (done)=>{
      display_info = display.getDefaultDisplaySync()
      getFocusCmd = `uinput -T -c ${display_info.width*0.5}  ${display_info.height*0.5}`
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("====>beforeAll: switchInputMethod to: " +  JSON.stringify(inputM));
      inputServer.packageName = inputM.packageName;
      inputServer.methodId = inputM.methodId;
      inputServer.name = inputM.packageName;
      inputServer.id = inputM.methodId;
      console.info("====>beforeAll inputMethodStageJSUnit start");
      let inputDemoService: subtype ={
        id: 'inputMethodWindService',
        label: '',
        name: 'com.acts.inputmethodwidmanage.test',
        mode: 'lower',
        locale: '',
        language: '',
        icon: '',
        iconId: 0,
        extra: {},
      }
      try{
        await inputMethod.switchCurrentInputMethodSubtype(inputDemoService);
        setTimeout(()=>{
          console.debug("====>beforeAll inputMethodStageJSUnit switchCurrentInputMethodSubtype success: " + JSON.stringify(inputDemoService));
          done();
        },2000)
      }catch(err){
        console.debug("====>beforeAll inputMethodStageJSUnit switchCurrentInputMethodSubtype failed");
      }
    })

    afterAll(async (done) => {
      try {
        await inputMethod.switchInputMethod(inputServer);
        setTimeout(() => {
          console.info("====>afterAll: inputMethodEngineJSUnit switchInputMethod success: " + JSON.stringify(inputServer));
          done();
        }, 2000)
      } catch (err) {
        console.info("====>afterAll: inputMethodEngineJSUnit fail" + JSON.stringify(err));
      }
    })

    it('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_createPanelCallback_0010"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscribe finish====");

        var commonEventPublishData = {
          code: 10
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_createPanelPromise_0020"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscribe finish====");

        var commonEventPublishData = {
          code: 20
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscribe finish====");

        var commonEventPublishData = {
          code: 30
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscribe finish====");

        var commonEventPublishData = {
          code: 40
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_setUiContentCallback_0050"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscribe finish====");

        var commonEventPublishData = {
          code: 50
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_setUiContentPromise_0060"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscribe finish====");

        var commonEventPublishData = {
          code: 60
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_setUiContentCallback_0070"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscribe finish====");

        var commonEventPublishData = {
          code: 70
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_setUiContentPromise_0080"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscribe finish====");

        var commonEventPublishData = {
          code: 80
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_resizeCallback_0090', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_resizeCallback_0090"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscribe finish====");

        var commonEventPublishData = {
          code: 90
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_resizePromise_0100', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_resizePromise_0100"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscribe finish====");

        var commonEventPublishData = {
          code: 100
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_moveToCallback_0110', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_moveToCallback_0110"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscribe finish====");

        var commonEventPublishData = {
          code: 110
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_moveToPromise_0120', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_moveToPromise_0120"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscribe finish====");

        var commonEventPublishData = {
          code: 120
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_showCallback_0130', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_showCallback_0130"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscribe finish====");

        var commonEventPublishData = {
          code: 130
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_hideCallback_0150', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_hideCallback_0150"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscribe finish====");

        var commonEventPublishData = {
          code: 150
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_showPromise_0140', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_showPromise_0140"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscribe finish====");

        var commonEventPublishData = {
          code: 140
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_hidePromise_0160', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_hidePromise_0160"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscribe finish====");

        var commonEventPublishData = {
          code: 160
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_onShow_0170', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_onShow_0170"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_onShow_0170 subscribe finish====");

        var commonEventPublishData = {
          code: 170
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_onHide_0180', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_onHide_0180"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_onHide_0180 subscribe finish====");

        var commonEventPublishData = {
          code: 180
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_offShow_0190', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_offShow_0190"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_offShow_0190 subscribe finish====");

        var commonEventPublishData = {
          code: 190
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_Panel_offHide_0200', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_offHide_0200"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_offHide_0200 subscribe finish====");

        var commonEventPublishData = {
          code: 200
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });

    it('Sub_Misc_inputMethod_onImeShow_0201', 0, async function (done) {
      function publishCallback(err){
        console.info("====>Sub_Misc_inputMethod_onImeShow_0201 publishCallback start");
        if (err){
          console.info("====>Sub_Misc_inputMethod_onImeShow_0201 publishCallback failed:" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_onImeShow_0201 publishCallback success:");
        }
      }
      console.info("====>Sub_Misc_inputMethod_onImeShow_0201 imeShow start" );
      let inputMethodSetting = inputMethod.getSetting();
      inputMethodSetting.on("imeShow", (inputWindowInfo) => {
        inputMethodSetting.off("imeShow");
        try {
          console.info("====>Sub_Misc_inputMethod_onImeShow_0201 imeShow inputWindowInfo:" + JSON.stringify(inputWindowInfo));
          expect(typeof(inputWindowInfo[0].name) === 'string').assertTrue();
          expect(typeof(inputWindowInfo[0].left) === 'number').assertTrue();
          expect(typeof(inputWindowInfo[0].top) === 'number').assertTrue();
          expect(typeof(inputWindowInfo[0].width) === 'number').assertTrue();
          expect(typeof(inputWindowInfo[0].height) === 'number').assertTrue();
          done();
        } catch (err) {
          console.info('====>Sub_Misc_inputMethod_onImeShow_0201 imeShow catch err: ' + JSON.stringify(err));
          done();
        }
      })
      console.info("====>Sub_Misc_inputMethod_onImeShow_0201 imeShow end" );

      var commonEventPublishData = {
        code: 201
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('Sub_Misc_inputMethod_onImeHide_0202', 0, async function (done) {
      function publishCallback(err){
        console.info("====>Sub_Misc_inputMethod_onImeHide_0202 publishCallback start");
        if (err){
          console.info("====>Sub_Misc_inputMethod_onImeHide_0202 publishCallback failed:" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_onImeHide_0202 publishCallback success:");
        }
      }
      console.info("====>Sub_Misc_inputMethod_onImeHide_0202 imeHide start" );
      let inputMethodSetting = inputMethod.getSetting();
      inputMethodSetting.on("imeHide", (inputWindowInfo) => {
        inputMethodSetting.off("imeHide");
        try {
          console.info("====>Sub_Misc_inputMethod_onImeHide_0202 imeHide inputWindowInfo:" + JSON.stringify(inputWindowInfo));
          expect(typeof(inputWindowInfo[0].name) === 'string').assertTrue();
          expect(typeof(inputWindowInfo[0].left) === 'number').assertTrue();
          expect(typeof(inputWindowInfo[0].top) === 'number').assertTrue();
          expect(typeof(inputWindowInfo[0].width) === 'number').assertTrue();
          expect(typeof(inputWindowInfo[0].height) === 'number').assertTrue();
          done();
        } catch (err) {
          console.info('====>Sub_Misc_inputMethod_onImeHide_0202 imeHide catch err: ' + JSON.stringify(err));
          done();
        }
      })
      console.info("====>Sub_Misc_inputMethod_onImeHide_0202 imeHide end" );

      var commonEventPublishData = {
        code: 202
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('Sub_Misc_inputMethod_offImeShow_0203', 0, async function (done) {
      function publishCallback(err){
        console.info("====>Sub_Misc_inputMethod_offImeShow_0203 publishCallback start");
        if (err){
          console.info("====>Sub_Misc_inputMethod_offImeShow_0203 publishCallback failed:" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_offImeShow_0203 publishCallback success:");
        }
      }
      console.info("====>Sub_Misc_inputMethod_offImeShow_0203 imeShow start" );
      let flat = true;
      let inputMethodSetting = inputMethod.getSetting();
      let inputwind = (inputWindowInfo) => {
        flat = false;
        console.info("====>Sub_Misc_inputMethod_offImeShow_0203 imeShow inputWindowInfo:" + JSON.stringify(inputWindowInfo));
      }
      inputMethodSetting.on("imeShow", inputwind)
      inputMethodSetting.off("imeShow", inputwind);
      console.info("====>Sub_Misc_inputMethod_offImeShow_0203 imeShow end" );

      var commonEventPublishData = {
        code: 203
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);

      let t = setTimeout(() => {
        if(flat){
          console.info("====>Sub_Misc_inputMethod_offImeShow_0203 imeShow off success" );
          expect(true).assertTrue();
          done();
        }else{
          console.info("====>Sub_Misc_inputMethod_offImeShow_0203 imeShow off fail" );
          try{
            expect().assertFail();
            done();
          }catch(err){
            console.info("====>Sub_Misc_inputMethod_offImeShow_0203 imeShow off catch err: "  + JSON.stringify(err));
            done();
          }
        }
        clearTimeout(t);
      }, 1000);
    });

    it('Sub_Misc_inputMethod_offImeHide_0204', 0, async function (done) {
      function publishCallback(err){
        console.info("====>Sub_Misc_inputMethod_offImeHide_0204 publishCallback start");
        if (err){
          console.info("====>Sub_Misc_inputMethod_offImeHide_0204 publishCallback failed:" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_offImeHide_0204 publishCallback success:");
        }
      }
      console.info("====>Sub_Misc_inputMethod_offImeHide_0204 imeHide start" );
      let flat = true;
      let inputMethodSetting = inputMethod.getSetting();
      let inputwind = (inputWindowInfo) => {
        flat = false;
        console.info("====>Sub_Misc_inputMethod_offImeHide_0204 imeHide inputWindowInfo:" + JSON.stringify(inputWindowInfo));
      }
      inputMethodSetting.on("imeHide", inputwind)
      inputMethodSetting.off("imeHide", inputwind);
      console.info("====>Sub_Misc_inputMethod_offImeHide_0204 imeHide end" );

      var commonEventPublishData = {
        code: 203
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);

      let t = setTimeout(() => {
        if(flat){
          console.info("====>Sub_Misc_inputMethod_offImeHide_0204 imeHide off success" );
          expect(true).assertTrue();
          done();
        }else{
          console.info("====>Sub_Misc_inputMethod_offImeHide_0204 imeHide off fail" );
          try{
            expect().assertFail();
            done();
          }catch(err){
            console.info("====>Sub_Misc_inputMethod_offImeHide_0204 imeHide off catch err: "  + JSON.stringify(err));
            done();
          }
        }
        clearTimeout(t);
      }, 1000);
    });

    it('Sub_Misc_inputMethod_Panel_changeFlag_0210', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback start");
        if (err) {
          console.error("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscriberCallback data: " + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====" + JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 success ====" );
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_changeFlag_0210"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscribe data: " + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscribe finish====");

        var commonEventPublishData = {
          code: 210
        }
        commonEventManager.publish("test", commonEventPublishData, publishCallback);
      })
    });


  });
};
