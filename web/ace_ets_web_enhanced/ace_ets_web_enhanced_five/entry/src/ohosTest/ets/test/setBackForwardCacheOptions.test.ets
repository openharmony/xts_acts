import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { LocalContext } from './GloablConfig';
import { router } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

let driver: Driver = Driver.create();
let flag: boolean = false;

export default function setBackForwardCacheOptionsTest() {
  describe('setBackForwardCacheOptionsTest', () => {
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
     * @tc.number SUB_WEB_SETBACKFORWARDCACHEOPTIONSTEST_0200
     * @tc.name testSetBackForwardCacheOptionsTest0200
     * @tc.desc test setBackForwardCacheOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetBackForwardCacheOptionsTest0200', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0200 start')
      console.info('testSetBackForwardCacheOptionsTest0200 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testSetBackForwardCacheOptionsTest0200', (data: boolean) => {
        flag = true;
        expect(data).assertEqual(1)
        console.log('=========>', flag)
        console.info('testSetBackForwardCacheOptionsTest0200 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0200 end')
      })
      router.pushUrl({
        url: 'testability/pages/setBackForwardCacheOptions2'
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002',10,'')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_SETBACKFORWARDCACHEOPTIONSTEST_0300
     * @tc.name testSetBackForwardCacheOptionsTest0300
     * @tc.desc test setBackForwardCacheOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetBackForwardCacheOptionsTest0300', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0300 start')
      console.info('testSetBackForwardCacheOptionsTest0300 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testSetBackForwardCacheOptionsTest0300', (data: number) => {
        flag = true
        expect(data).assertEqual(1)
        console.info('testSetBackForwardCacheOptionsTest0300 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0300 end')
      })
      router.pushUrl({
        url: 'testability/pages/setBackForwardCacheOptions3'
      })
      await driver.delayMs(2000)
      sendEventByKey('003', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_SETBACKFORWARDCACHEOPTIONSTEST_0400
     * @tc.name testSetBackForwardCacheOptionsTest0400
     * @tc.desc test setBackForwardCacheOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetBackForwardCacheOptionsTest0400', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0400 start')
      console.info('testSetBackForwardCacheOptionsTest0400 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testSetBackForwardCacheOptionsTest0400', (data: number) => {
        flag = true
        expect(data).assertEqual(1)
        console.info('testSetBackForwardCacheOptionsTest0400 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0400 end')
      })
      router.pushUrl({
        url: 'testability/pages/setBackForwardCacheOptions4'
      })
      await driver.delayMs(2000)
      sendEventByKey('004', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_SETBACKFORWARDCACHEOPTIONSTEST_0500
     * @tc.name testSetBackForwardCacheOptionsTest0500
     * @tc.desc test setBackForwardCacheOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetBackForwardCacheOptionsTest0500', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0500 start')
      console.info('testSetBackForwardCacheOptionsTest0500 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testSetBackForwardCacheOptionsTest0501', (data: number) => {
        flag = true
        expect(data).assertEqual(1)
        console.info('testSetBackForwardCacheOptionsTest0501 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0501 end')
      })
      router.pushUrl({
        url: 'testability/pages/setBackForwardCacheOptions5'
      })
      await driver.delayMs(2000)
      sendEventByKey('0050', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()

      LocalContext.context.eventHub.on('testSetBackForwardCacheOptionsTest0502', (data: number) => {
        flag = true
        expect(data).assertEqual(1)
        console.info('testSetBackForwardCacheOptionsTest0502 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0502 end')
      })
      router.pushUrl({
        url: 'testability/pages/setBackForwardCacheOptions5'
      })
      await driver.delayMs(2000)
      sendEventByKey('0051', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_SETBACKFORWARDCACHEOPTIONSTEST_0600
     * @tc.name testSetBackForwardCacheOptionsTest06zzzzzzzzzz00
     * @tc.desc test setBackForwardCacheOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetBackForwardCacheOptionsTest0600', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0600 start')
      console.info('testSetBackForwardCacheOptionsTest0500 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testSetBackForwardCacheOptionsTest0600', (data: number) => {
        flag = true
        expect(data).assertEqual(1)
        console.info('testSetBackForwardCacheOptionsTest0600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0600 end')
      })
      router.pushUrl({
        url: 'testability/pages/setBackForwardCacheOptions6'
      })
      await driver.delayMs(2000)
      sendEventByKey('006', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()

      LocalContext.context.eventHub.on('testSetBackForwardCacheOptionsTest0600', (data: number) => {
        flag = true
        expect(data).assertEqual(1)
        console.info('testSetBackForwardCacheOptionsTest0600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0600 end')
      })
      router.pushUrl({
        url: 'testability/pages/setBackForwardCacheOptions6'
      })
      await driver.delayMs(2000)
      sendEventByKey('006', 10, '')
      await driver.delayMs(2000)

      LocalContext.context.eventHub.on('testSetBackForwardCacheOptionsTest0600', (data: number) => {
        flag = true
        expect(data).assertEqual(1)
        console.info('testSetBackForwardCacheOptionsTest0600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0600 end')
      })
      router.pushUrl({
        url: 'testability/pages/setBackForwardCacheOptions6'
      })
      await driver.delayMs(3000)
      sendEventByKey('006', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })
  })
}