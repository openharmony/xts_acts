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
    })

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


  })
}