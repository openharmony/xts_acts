import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON, On } from '@kit.TestKit';
import { LocalContext } from './GloablConfig';
import { AnimatedDrawableDescriptor, router } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

let driver: Driver = Driver.create();
let flag: boolean = false;

export default function OnPermissionRequest() {
  describe('OnPermissionRequest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      flag = false
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      flag = false;
      await driver.delayMs(500)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      await driver.delayMs(500)
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_ACE_WEB_onPermissionRequest_0005
     * @tc.name testWebView_onPermissionRequest0005
     * @tc.desc test onPermissionRequest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onPermissionRequest0005', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_onPermissionRequest0005 start')
      console.info('testWebView_onPermissionRequest0005 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_onPermissionRequest0005', (data: number) => {
        flag = true;
        expect(data).assertEqual(1);
        console.info('testWebView_onPermissionRequest0005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_onPermissionRequest0005 end')
      })
      router.pushUrl({
        url: "testability/pages/OnPermissionRequest01"
      })
      await driver.delayMs(5000)
      let text1 = await driver.findComponent(ON.text('开启摄像头'))
      await text1.click()
      await driver.delayMs(1000)
      let text2 = await driver.findComponent(ON.text('deny'))
      await text2.click()
      await driver.delayMs(1000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_onPermissionRequest_0006
     * @tc.name testWebView_NativeVideoPlayer0006
     * @tc.desc test testWebView_onPermissionRequest0006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onPermissionRequest0006', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_onPermissionRequest0006 start')
      console.info('testWebView_onPermissionRequest0006 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_onPermissionRequest0006', (data: number) => {
        flag = true
        expect(data).assertEqual(1)
        console.info('testWebView_onPermissionRequest0006 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_onPermissionRequest0006 end')
      })
      router.pushUrl({
        url: "testability/pages/OnPermissionRequest02"
      })
      await driver.delayMs(2000)
      let text1 = await driver.findComponent(ON.text('开启摄像头'))
      await text1.click()
      await driver.delayMs(1000)
      let text2 = await driver.findComponent(ON.text('deny'))
      await text2.click()
      await driver.delayMs(1000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_onPermissionRequest_0007
     * @tc.name testWebView_onPermissionRequest0007
     * @tc.desc test onPermissionRequest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onPermissionRequest0007', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_onPermissionRequest0007 start')
      console.info('testWebView_onPermissionRequest0007 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_onPermissionRequest0007',
        (data: number, code: number, message: string) => {
          flag = true
          expect(data).assertEqual(1)
          code = code;
          message = message;
          console.log('Failed to request permissions from user. Code is ' + code + ',message is ' + message);
          console.info('testWebView_onPermissionRequest0007 end')
          hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_onPermissionRequest0007 end')
        })
      router.pushUrl({
        url: "testability/pages/OnPermissionRequest03"
      })
      await driver.delayMs(2000)
      let text1 = await driver.findComponent(ON.text('开启摄像头'))
      await text1.click()
      await driver.delayMs(1000)
      let text2 = await driver.findComponent(ON.text('deny'))
      await text2.click()
      await driver.delayMs(1000)
      expect(flag).assertTrue()
      router.clear()
    })
  })
}