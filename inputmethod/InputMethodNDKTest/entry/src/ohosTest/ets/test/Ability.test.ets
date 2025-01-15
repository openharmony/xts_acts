import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';
import deviceinfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';
import inputMethod from '@ohos.inputMethod';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async(done: Function) => {
      if(deviceinfo.deviceType === 'wearable'){
        let inputMethodSetting = inputMethod.getSetting();
        console.info('====> getSetting success!')
        inputMethodSetting.listInputMethod((err: BusinessError, data: Array<inputMethod.InputMethodProperty>) => {
          let t = setTimeout(async ()=>{
            console.info('====>Succeeded in listing inputMethod: ' + JSON.stringify(data));
            const ATTRIBUTE: inputMethod.TextConfig = {
              inputAttribute: {
                textInputType: 0, enterKeyType: 0
              }
            }
            try {
              let data = await inputMethod.getController().attach(false, ATTRIBUTE);
              console.info(`====> execution success, data: ${JSON.stringify(data)}`);
            } catch (error) {
              console.info(`====> catch error, error: [${error.code}, ${error.message}]`);
            }
            clearTimeout(t);
            done();
          }, 3000)
        });
      }else{
        console.info('====>deviceType is not wearable!')
        done();
      }
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    let expResult = "OK"
    it('SUB_IMF_NDK_AttachOptions_Create_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_AttachOptions_Create_0100();
      console.info(`====>SUB_IMF_NDK_AttachOptions_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodController_Attach_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Attach_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Attach_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodController_Detach_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodController_Detach_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodController_Detach_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100();
      console.info(`====>SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_PrivateCommand_SetKey_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_PrivateCommand_SetKey_0100();
      console.info(`====>SUB_IMF_NDK_PrivateCommand_SetKey_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_TextAvoidInfo_Create_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextAvoidInfo_Create_0100();
      console.info(`====>SUB_IMF_NDK_TextAvoidInfo_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_TextConfig_Create_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextConfig_Create_0100();
      console.info(`====>SUB_IMF_NDK_TextConfig_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_TextEditorProxy_Get_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_TextEditorProxy_Get_0100();
      console.info(`====>SUB_IMF_NDK_TextEditorProxy_Get_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

    it('SUB_IMF_NDK_CursorInfo_Create_0100', 0, (done: Function) => {
      let result = testNapi.SUB_IMF_NDK_CursorInfo_Create_0100();
      console.info(`====>SUB_IMF_NDK_CursorInfo_Create_0100 result: ${result}`)
      expect(expResult).assertEqual(result)
      done();
    })

  })
}