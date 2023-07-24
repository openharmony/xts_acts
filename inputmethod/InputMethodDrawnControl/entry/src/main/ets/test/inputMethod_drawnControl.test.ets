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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commoneventmanager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import subtype from '@ohos.InputMethodSubtype';
import inputMethod from '@ohos.inputMethod';
import display from '@ohos.display';


export default function inputMethodDrawnControlJSUnit() {
  describe('inputMethodDrawnControlTest', function () {
    var inputSever = {
      packageName: '',
      methodId: '',
      name: '',
      id: '',
      extra: {}
    }

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeAll(async (done) => {
      let inputM = inputMethod.getCurrentInputMethod();
      console.info("====>beforeAll: getCurrentInputMethod inputMethodEngineJSUnit to: " + JSON.stringify(inputM));
      inputSever.packageName = inputM.packageName;
      inputSever.methodId = inputM.methodId;
      inputSever.name = inputM.packageName;
      inputSever.id = inputM.methodId;

      let inputDemoService: subtype = {
        id: "inputMethodWindService",
        label: "",
        name: "com.acts.inputmethoddrawncontrol.test",
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      }
      try {
        console.info("====>beforeAll: inputMethodEngineJSUnit switchCurrentInputMethodSubtype success" + JSON.stringify(inputDemoService));
        await inputMethod.switchCurrentInputMethodSubtype(inputDemoService);
        setTimeout(() => {
          console.info("====>beforeAll: inputMethodEngineJSUnit switchCurrentInputMethodSubtype success");
          done();
        }, 2000)
      } catch (err) {
        console.info("====>beforeAll: inputMethodEngineJSUnit fail" + JSON.stringify(err));
      }
    })

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterAll(async (done) => {
      try {
        await inputMethod.switchInputMethod(inputSever);
        setTimeout(() => {
          console.info("====>afterAll: inputMethodEngineJSUnit switchInputMethod success");
          done();
        }, 2000)
      } catch (err) {
        console.info("====>afterAll: inputMethodEngineJSUnit fail" + JSON.stringify(err));
      }
    });

    afterEach(
      async function (){
        try{
          let data = await inputMethod.getController().detach();
          console.info(`attach inputMethod success, data: ${JSON.stringify(data)}`);
        }catch(error){
          console.info(`attach inputMethod fail, error: [${error.code}, ${error.message}]`);
        };
      }
    );

    let sleep = function (timeout) {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    it('SUB_Misc_inputMethod_onHandleExtendAction_0010',0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      async function publishCallback(err){
        console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 publishCallback failed:" + JSON.stringify(err));
        } else {
            try {
              await inputMethod.getController().attach(true, ATTRIBUTE);
              console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 onHandleExtendAction start");
              inputMethod.getController().on("handleExtendAction",async (action) => {
                console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 onHandleExtendAction success: "  + action);
                inputMethod.getController().off("handleExtendAction");
                await inputMethod.getController().detach();
                expect(action).assertEqual(0);
                done();
              });
            } catch (err) {
              console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 onHandleExtendAction catch err: " + JSON.stringify(err));
            }
        }
      }

      var commonEventPublishData = {
        code:10
      }
      commoneventmanager.publish('test', commonEventPublishData, publishCallback);
    });

    it('SUB_Misc_inputMethod_offHandleExtendAction_0020',0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      let flag = true;
      async function publishCallback(err){
        console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction start");
            inputMethod.getController().on("handleExtendAction",async (action) => {
              flag = false;
              console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 flag: " + flag);
            });
            inputMethod.getController().off("handleExtendAction");
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                await inputMethod.getController().detach();
                if (flag){
                  expect(true).assertEqual(true);
                  console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction success");
                }else{
                  console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction fail");
                  expect().assertFail();
                }
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction catch err: " + JSON.stringify(err));
              }
              done();
            }, 1000)
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction catch err: " + JSON.stringify(err));
          }
        }
      }

      var commonEventPublishData = {
        code:20
      }
      commoneventmanager.publish('test', commonEventPublishData, publishCallback);
    });

    it('SUB_Misc_inputMethod_onSendFunctionKey_0030',0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      async function publishCallback(err){
        console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 onSendFunctionKey start");
            inputMethod.getController().on("sendFunctionKey",async (FunctionKey) => {
              console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 onSendFunctionKey success: "  + FunctionKey.enterKeyType);
              inputMethod.getController().off("sendFunctionKey");
              await inputMethod.getController().detach();
              expect(FunctionKey.enterKeyType).assertEqual(0);
              done();
            });
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 onSendFunctionKey catch err: " + JSON.stringify(err));
          }
        }
      }

      var commonEventPublishData = {
        code:30
      }
      commoneventmanager.publish('test', commonEventPublishData, publishCallback);
    });

    it('SUB_Misc_inputMethod_offSendFunctionKey_0040',0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      let flag = true;
      async function publishCallback(err){
        console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey start");
            inputMethod.getController().on("sendFunctionKey",async (FunctionKey) => {
              flag = false;
              console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 flag: " + flag);
            });
            inputMethod.getController().off("sendFunctionKey");
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                await inputMethod.getController().detach();
                if (flag){
                  expect(true).assertEqual(true);
                  console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey success");
                }else{
                  console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey fail");
                  expect().assertFail();
                }
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey catch err: " + JSON.stringify(err));
              }
              done();
            }, 1000)
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey catch err: " + JSON.stringify(err));
          }
        }
      }

      var commonEventPublishData = {
        code:40
      }
      commoneventmanager.publish('test', commonEventPublishData, publishCallback);
    });

    it('SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 publishCallback failed:" + JSON.stringify(err));
        } else {
          await sleep(10);
          const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
          await inputMethod.getController().attach(true, ATTRIBUTE);
          inputMethod.getController().on('getLeftTextOfCursor', (length) => {
            inputMethod.getController().off('getLeftTextOfCursor');
            console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 length: " + length);
            expect(length).assertEqual(10000);
            return 'test'
          })
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 subscriber finish");

        var commonEventPublishData = {
          code: 50
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    it('SUB_Misc_InputMethod_onGetLeftTextOfCursor_0060', 0, async function (done) {
      try {
        inputMethod.getController().on('getLeftTextOfCursor', (length) => {
          return 'test'
        })
        console.info("====>SUB_Misc_InputMethod_ongetLeftTextOfCursor_0060 on('getLeftTextOfCursor') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_ongetLeftTextOfCursor_0060 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    it('SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }
      let getLetTest_callback = (length) => {
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 length: " + length);
        expect(length).assertEqual(10000);
        return 'test'
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 publishCallback failed:" + JSON.stringify(err));
        } else {
          await sleep(10);
          const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
          await inputMethod.getController().attach(true, ATTRIBUTE);
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 attach Success");
          inputMethod.getController().on('getLeftTextOfCursor', getLetTest_callback);
          inputMethod.getController().off('getLeftTextOfCursor', getLetTest_callback);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 subscriber finish");

        var commonEventPublishData = {
          code: 70
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    it('SUB_Misc_InputMethod_onGetRightTextOfCursor_0080', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 publishCallback failed:" + JSON.stringify(err));
        } else {
          await sleep(10);
          const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
          await inputMethod.getController().attach(true, ATTRIBUTE);
          inputMethod.getController().on('getRightTextOfCursor', (length) => {
            inputMethod.getController().off('getRightTextOfCursor');
            console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 length: " + length);
            expect(length).assertEqual(10000);
            return 'test'
          })
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_onGetRightTextOfCursor_0080"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 subscriber finish");

        var commonEventPublishData = {
          code: 80
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    it('SUB_Misc_InputMethod_onGetRightTextOfCursor_0090', 0, async function (done) {
      try {
        inputMethod.getController().on('getRightTextOfCursor', (length) => {
          return 'test'
        })
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0090 on('getLeftTextOfCursor') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0090 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    it('SUB_Misc_InputMethod_offGetRightTextOfCursor_0100', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }
      let getRightTest_callback = (length) => {
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 length: " + length);
        expect(length).assertEqual(10000);
        return 'test'
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 publishCallback failed:" + JSON.stringify(err));
        } else {
          await sleep(10);
          const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
          await inputMethod.getController().attach(true, ATTRIBUTE);
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 attach Success");
          inputMethod.getController().on('getRightTextOfCursor', getRightTest_callback);
          inputMethod.getController().off('getRightTextOfCursor', getRightTest_callback);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_offGetRightTextOfCursor_0100"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 subscriber finish");

        var commonEventPublishData = {
          code: 100
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    it('SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 publishCallback failed:" + JSON.stringify(err));
        } else {
          await sleep(10);
          const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
          await inputMethod.getController().attach(true, ATTRIBUTE);
          inputMethod.getController().on('getTextIndexAtCursor', () => {
            inputMethod.getController().off('getTextIndexAtCursor');
            console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 on('getTextIndexAtCursor')");
            return 10000
          })
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 subscriber finish");

        var commonEventPublishData = {
          code: 110
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    it('SUB_Misc_InputMethod_onGetTextIndexAtCursor_0120', 0, async function (done) {
      try {
        inputMethod.getController().on('getTextIndexAtCursor', () => {
          return 10000
        })
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0120 on('getLeftTextOfCursor') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0120 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    it('SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }
      let getTextTest_callback = () => {
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 getLetTest_callback");
        return 10000
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 publishCallback failed:" + JSON.stringify(err));
        } else {
          await sleep(10);
          const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
          await inputMethod.getController().attach(true, ATTRIBUTE);
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 attach Success");
          inputMethod.getController().on('getTextIndexAtCursor', getTextTest_callback);
          inputMethod.getController().off('getTextIndexAtCursor', getTextTest_callback);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 subscriber finish");

        var commonEventPublishData = {
          code: 130
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    it('SUB_Misc_inputMethod_onEditorAttributeChanged_0140',0, async function (done) {
      let inputAttribute = {textInputType:0,enterKeyType:3}
      let inputAttribute1 = {textInputType:0,enterKeyType:0}
      let cursorInfo = {left: 2, top: 2, width: 2, height: 2}
      const textConfig = {
        inputAttribute,
        cursorInfo ,
        windowId: 100
      }
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 onEditorAttributeChanged start");
        if (err){
          console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await sleep(10);
            await inputMethod.getController().attach(false, textConfig);
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 onEditorAttributeChanged attach");
            await sleep(10);
            await inputMethod.getController().updateAttribute(inputAttribute1);
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 onEditorAttributeChanged updateAttribute");
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 onEditorAttributeChanged catch err: " + JSON.stringify(err));
          }
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_inputMethod_onEditorAttributeChanged_0140"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 subscriber finish");

        var commonEventPublishData = {
          code: 140
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })

    });

    it('SUB_Misc_inputMethod_onEditorAttributeChanged_0150',0, async function (done) {
      let inputAttribute = {textInputType:0,enterKeyType:0}
      try {
        await inputMethod.getController().updateAttribute(inputAttribute);
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0150 onEditorAttributeChanged updateAttribute");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0150 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    it('SUB_Misc_inputMethod_offEditorAttributeChanged_0160',0, async function (done) {
      let inputAttribute = {textInputType:0,enterKeyType:0}
      let selection = {start: 2, end: 1000}
      const textConfig = {
        inputAttribute,
        selection,
      }
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 onEditorAttributeChanged start");
        if (err){
          console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await sleep(10);
            await inputMethod.getController().attach(false, textConfig);
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 onEditorAttributeChanged attach");
            await inputMethod.getController().updateAttribute(inputAttribute);
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 onEditorAttributeChanged updateAttribute");
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 onEditorAttributeChanged catch err: " + JSON.stringify(err));
          }
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_inputMethod_offEditorAttributeChanged_0160"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 subscriber finish");

        var commonEventPublishData = {
          code: 160
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })

    });

  })
}