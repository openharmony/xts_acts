import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, On } from '@kit.TestKit';
import { LocalContext } from './GloablConfig';
import { AnimatedDrawableDescriptor, router } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import app from '@system.app';

let driver: Driver = Driver.create();
let flag: boolean = false;

export default function NativeVideoPlayer() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('NativeVideoPlayer', () => {
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
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0001
     * @tc.name testWebView_NativeVideoPlayer0001
     * @tc.desc test NativeVideoPlayer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayer0001', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0001 start')
      console.info('testWebView_NativeVideoPlayer0001 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_NativeVideoPlayer0001_1', (data: number) => {
        flag = true;
        expect(data).assertEqual(1);
        console.info('testWebView_NativeVideoPlayer0001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0001 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer01"
      })
      await driver.delayMs(5000)
      expect(flag).assertTrue()

      LocalContext.context.eventHub.on('testWebView_NativeVideoPlayer0001_2', (data: number) => {
        flag = true;
        expect(data).assertEqual(2);
        console.info('testWebView_NativeVideoPlayer0001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0001 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer01"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)
      sendEventByKey('02', 10, '')
      await driver.delayMs(5000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0003
     * @tc.name testWebView_NativeVideoPlayer0003
     * @tc.desc test NativeVideoPlayer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayer0003', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0003 start')
      console.info('testWebView_NativeVideoPlayer0003 start')
      await driver.delayMs(500)

      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer03"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)
      router.pushUrl({
        url: "testability/pages/Index1"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)

      LocalContext.context.eventHub.on('testWebView_NativeVideoPlayer0003_1', (data: number) => {
        flag = true;
        expect(data).assertEqual(1);
        console.info('testWebView_NativeVideoPlayer0003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0003 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer03"
      })
      await driver.delayMs(5000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0005
     * @tc.name testWebView_NativeVideoPlayer0005
     * @tc.desc test NativeVideoPlayer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayer0005', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0005 start')
      console.info('testWebView_NativeVideoPlayer0005 start')
      await driver.delayMs(500)

      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer05"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)
      router.pushUrl({
        url: "testability/pages/Index1"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)



      LocalContext.context.eventHub.on('testWebView_NativeVideoPlayer0005', (data: number) => {
        flag = true;
        expect(data).assertEqual(1);
        console.info('testWebView_NativeVideoPlayer0005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0005 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer05"
      })
      await driver.delayMs(5000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0006
     * @tc.name testWebView_NativeVideoPlayer0006
     * @tc.desc test NativeVideoPlayer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayer0006', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0006 start')
      console.info('testWebView_NativeVideoPlayer0006 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_NativeVideoPlayer0006_1', (data: boolean) => {
        flag = data;
        flag = !flag;
        console.info('testWebView_NativeVideoPlayer0006 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0006 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer06"
      })
      await driver.delayMs(5000)
      expect(flag).assertTrue()

      LocalContext.context.eventHub.on('testWebView_NativeVideoPlayer0006_2', (data: number) => {
        flag = true;
        expect(data).assertEqual(2);
        console.info('testWebView_NativeVideoPlayer0006 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0006 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer06"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)
      sendEventByKey('02', 10, '')
      await driver.delayMs(5000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0008
     * @tc.name testWebView_NativeVideoPlayer0008
     * @tc.desc test NativeVideoPlayer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayer0008', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0008 start')
      console.info('testWebView_NativeVideoPlayer0008 start')
      await driver.delayMs(500)

      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer08"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)
      router.pushUrl({
        url: "testability/pages/Index1"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)

      LocalContext.context.eventHub.on('testWebView_NativeVideoPlayer0008_1', (data: boolean) => {
        flag = data;
        flag = !flag;
        console.info('testWebView_NativeVideoPlayer0008 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0008 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer08"
      })
      await driver.delayMs(5000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0010
     * @tc.name testWebView_NativeVideoPlayer0010
     * @tc.desc test NativeVideoPlayer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayer0010', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer00010 start')
      console.info('testWebView_NativeVideoPlayer00010 start')
      await driver.delayMs(500)

      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer10"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)
      router.pushUrl({
        url: "testability/pages/Index1"
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)

      LocalContext.context.eventHub.on('testWebView_NativeVideoPlayer0010', (data: boolean) => {
        flag = data;
        flag = !flag;
        console.info('===================10')
        console.info('testWebView_NativeVideoPlayer00010 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer00010 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoPlayer10"
      })
      await driver.delayMs(5000)
      expect(flag).assertTrue()
      router.clear()
    })
  })
}