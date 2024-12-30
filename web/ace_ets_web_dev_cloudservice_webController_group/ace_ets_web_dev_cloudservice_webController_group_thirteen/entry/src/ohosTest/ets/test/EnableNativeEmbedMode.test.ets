import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { webview } from '@kit.ArkWeb';
import { Driver } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LocalContext } from './GloablConfig';

let driver: Driver = Driver.create();
let flg: boolean = true;
let flag: boolean = false;
let messages: string = '';

export default function EnableNativeEmbedMode() {

  describe('EnableNativeEmbedMode', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      flg = false;
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      flg = false;
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
     * @tc.number SUB_ACE_WEB_enableNativeEmbedMode_0100
     * @tc.name EnableNativeEmbedMode_0100
     * @tc.desc test onNativeEmbedLifecycleChange callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('enableNativeEmbedMode', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('enableNativeEmbedMode003', (data: string) => {
        messages = data
        if (messages == '注册成功') {
          flag = true
        }
        console.log('=========>001', messages)
        console.info('enableNativeEmbedMode003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0200 end')
      })
      await driver.delayMs(500)
      LocalContext.context.eventHub.on('enableNativeEmbedMode005', (data: string) => {
        console.log('=========>001', data)
        console.info('enableNativeEmbedMode004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0200 end')
      })
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/EnableNativeEmbedMode_0100"
      });

      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()

      LocalContext.context.eventHub.on('enableNativeEmbedMode002', (data: boolean) => {
        flg = data
        console.info('enableNativeEmbedMode002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0200 end')
      })
      await driver.delayMs(500)
      LocalContext.context.eventHub.on('enableNativeEmbedMode004', (data: string) => {
        console.log('=========>002', data)
        console.info('enableNativeEmbedMode004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0200 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/EnableNativeEmbedMode_0100"
      });

      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

  })
}