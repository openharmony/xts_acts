import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, On } from '@kit.TestKit';
import { LocalContext } from './GloablConfig';
import { AnimatedDrawableDescriptor, router } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import app from '@system.app';

let driver: Driver = Driver.create();
let flag: boolean = false;
let flg: boolean = false;
let flg2: boolean = false;
const delegator = abilityDelegatorRegistry.getAbilityDelegator()

export default function NativeVideoPlayerBFCache() {
  describe('NativeVideoPlayerBFCache', () => {
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
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0016
     * @tc.name NativeVideoBFCache_0016
     * @tc.desc test enableNativeMediaPlayer({ enable: false, shouldOverlay: false }),Go to FCache on the video hosting page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayerBFCache016', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayer0006 start')
      console.info('testWebView_NativeVideoPlayer0006 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_NativeVideoBFCache0016_1', (data: boolean) => {
        flag = data;
        console.info('testWebView_NativeVideoBFCache0016 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoBFCache0016 end')
      })
      router.pushUrl({
        url: "testability/pages/NativeVideoBFCache_0016"
      })
      await driver.delayMs(5000)
      expect(flag).assertFalse()

      LocalContext.context.eventHub.on('NativeVideoBFCache0016_2', (data: number) => {
        flag = true;
        expect(data).assertEqual(2);
        console.log('========>', data)
        console.info('testWebView_NativeVideoBFCache0016 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoBFCache0016 end')
      })
      await driver.delayMs(5000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(5000)
      sendEventByKey('003', 10, '')
      await driver.delayMs(5000)
      expect(flag).assertTrue()
      router.clear()
    })


    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0019
     * @tc.name NativeVideoBFCache_0019
     * @tc.desc test enableNativeMediaPlayer({ enable: false, shouldOverlay: false }),On the video-hosted page, switch the page to another tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayerBFCache0019', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayerBFCache0019_1 start')
      console.info('testWebView_NativeVideoPlayerBFCache0019_2 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('NativeVideoPlayerBFCache1901', (data: number) => {
        flag = true;
        console.log('===========>', data)
        expect(data).assertEqual(1)
        console.info('testWebView_NativeVideoPlayerBFCache0019_1 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayerBFCache0019_1 end')
      })

      await driver.delayMs(5000)
      LocalContext.context.eventHub.on('NativeVideoPlayerBFCache1902', (data: number) => {
        flg = true
        console.log('============>', data)
        expect(data).assertEqual(2);
        console.info('NativeVideoPlayerBFCache1902 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testNativeVideoPlayerBFCache1902 end')
      })

      router.pushUrl({
        url: "testability/pages/NativeVideoBFCache_0019"
      })
      await driver.delayMs(5000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(5000)
      expect(flag).assertFalse()
      await driver.delayMs(500)
      expect(flg).assertTrue()
      router.clear()


    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEOBFCACHE_0020
     * @tc.name NativeVideoBfcahe_0020
     * @tc.desc test enableNativeMediaPlayer({ enable: false, shouldOverlay: false }),On the video-hosted page, switch the page to another tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_NativeVideoPlayerBFCache0020', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayerBFCache0020_1 start')
      console.info('testWebView_NativeVideoPlayerBFCache0020_2 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('NativeVideoPlayerBFCache2001', (data: boolean) => {
        flag = data;
        console.log('============>01', data)
        console.info('testWebView_NativeVideoPlayerBFCache0020_1 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_NativeVideoPlayerBFCache0020_1 end')
      })
      await driver.delayMs(5000)
      LocalContext.context.eventHub.on('NativeVideoPlayerBFCache2002', (data: boolean) => {
        flg = data
        console.log('============>02', data)
        console.info('NativeVideoPlayerBFCache2002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testNativeVideoPlayerBFCache2002 end')
      })

      router.pushUrl({
        url: 'testability/pages/NativeVideoBFCache_0020'
      })
      await driver.delayMs(5000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(500)
      expect(flag).assertFalse()
      await driver.delayMs(500)
      expect(flg).assertTrue()

      LocalContext.context.eventHub.on('NativeVideoPlayerBFCache2003', (data: number) => {
        flg = false
        console.log('============>03', data)
        console.info('NativeVideoPlayerBFCache1902 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testNativeVideoPlayerBFCache1902 end')
      })

      await driver.delayMs(500)
      sendEventByKey('002', 10, '')
      await driver.delayMs(5000)
      expect(flg).assertFalse()
      router.clear()
    })

  })
}