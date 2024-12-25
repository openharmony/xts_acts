import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { LocalContext } from './GloablConfig';
import { router } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

let driver: Driver = Driver.create();
let flag: boolean = false;

export default function setScrollableTest() {
  describe('setScrollableTest', () => {
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
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_0600
     * @tc.name testSetScrollableTest0600
     * @tc.desc test SetScrollable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testSetScrollableTest0600', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testSetScrollableTest0500 start')
      console.info('testSetScrollableTest0500 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testSetScrollableTest0500', (data: number) => {
        flag = true;
        console.info('========>' + data)
        expect(data).assertEqual(1)
        console.info('testSetScrollableTest0500 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetScrollableTest0500 end')
      })
      router.pushUrl({
        url: 'testability/pages/setScrollable6'
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(3000)
      expect(flag).assertTrue()
      router.clear()
    })
    /**
     * @tc.number SUB_WEB_T\qqESTSETSCROLLABLETEST_0700
     * @tc.name testSetScrollableTest0700
     * @tc.desc test SetScrollable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetScrollableTest0700', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testSetScrollableTest0600 start')
      console.info('testSetScrollableTest0600 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testSetScrollableTest0600', (data: string) => {
        flag = true;
        console.info('========>' + data)
        expect(data).assertEqual('17100001')
        console.info('testSetScrollableTest0600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetScrollableTest0600 end')
      })
      router.pushUrl({
        url: 'testability/pages/setScrollable7'
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })
  })
}