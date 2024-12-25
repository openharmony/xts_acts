import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, On } from '@kit.TestKit';
import { LocalContext } from './GloablConfig';
import { AnimatedDrawableDescriptor, router } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

let driver: Driver = Driver.create();
let flag: boolean = false;

export default function WebViewTest() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('WebViewTest', () => {
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
     * @tc.number SUB_ACE_WEB_WebViewTest_0001
     * @tc.name testWebView_WebViewTest_0001
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0001', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0001 start')
      console.info('testWebView_WebViewTest0001 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0001', (data: string) => {
        flag = true;
        expect(data).assertEqual('www.example.com')
        console.info('testWebView_WebViewTest0001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0001 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest01"
      })
      await driver.delayMs(2000)
      sendEventByKey('01', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0002
     * @tc.name testWebView_WebViewTest_0002
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0002', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0002 start')
      console.info('testWebView_WebViewTest0002 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0002', (data: number) => {
        flag = true;
        expect(data).assertEqual(200)
        console.info('testWebView_WebViewTest0002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0002 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest02"
      })
      await driver.delayMs(2000)
      sendEventByKey('02', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0003
     * @tc.name testWebView_WebViewTest_0003
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0003', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0003 start')
      console.info('testWebView_WebViewTest0003 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0003', (data: string) => {
        flag = true;
        expect(data).assertEqual('OK')
        console.info('testWebView_WebViewTest0003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0003 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest03"
      })
      await driver.delayMs(2000)
      sendEventByKey('03', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0004
     * @tc.name testWebView_WebViewTest_0004
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0004', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0004 start')
      console.info('testWebView_WebViewTest0004 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0004', (data: string) => {
        flag = true;
        expect(data).assertEqual('text/html')
        console.info('testWebView_WebViewTest0004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0004 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest04"
      })
      await driver.delayMs(2000)
      sendEventByKey('04', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0005
     * @tc.name testWebView_WebViewTest_0005
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0005', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0005 start')
      console.info('testWebView_WebViewTest0005 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0005', (data: string) => {
        flag = true;
        expect(data).assertEqual('utf-8')
        console.info('testWebView_WebViewTest0005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0005 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest05"
      })
      await driver.delayMs(2000)
      sendEventByKey('05', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0006
     * @tc.name testWebView_WebViewTest_0006
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0006', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0006 start')
      console.info('testWebView_WebViewTest0006 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0006', (data: string) => {
        flag = true;
        expect(data).assertEqual('value1')
        console.info('testWebView_WebViewTest0006 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0006 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest06"
      })
      await driver.delayMs(2000)
      sendEventByKey('06', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0007
     * @tc.name testWebView_WebViewTest_0007
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0007', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0007 start')
      console.info('testWebView_WebViewTest0007 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0007', (data: number) => {
        flag = true;
        expect(data).assertEqual(1)
        console.info('testWebView_WebViewTest0007 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0007 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest07"
      })
      await driver.delayMs(5000)
      sendEventByKey('07', 10, '')
      await driver.delayMs(5000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0008
     * @tc.name testWebView_WebViewTest_0008
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0008', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0008 start')
      console.info('testWebView_WebViewTest0008 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0008', (data: number) => {
        flag = true;
        expect(data).assertEqual(1)
        console.info('testWebView_WebViewTest0008 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0008 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest08"
      })
      await driver.delayMs(2000)
      sendEventByKey('08', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0009
     * @tc.name testWebView_WebViewTest_0009
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0009', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0009 start')
      console.info('testWebView_WebViewTest0009 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0009', (data: number) => {
        flag = true;
        expect(data).assertEqual(1)
        console.info('testWebView_WebViewTest0009 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0009 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest09"
      })
      await driver.delayMs(2000)
      sendEventByKey('09', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0010
     * @tc.name testWebView_WebViewTest_0010
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0010', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0010 start')
      console.info('testWebView_WebViewTest0010 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0010', (data: number) => {
        flag = true;
        expect(data).assertEqual(1)
        console.info('testWebView_WebViewTest0010 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0010 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest10"
      })
      await driver.delayMs(2000)
      sendEventByKey('10', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0011
     * @tc.name testWebView_WebViewTest_0011
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0011', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0011 start')
      console.info('testWebView_WebViewTest0011 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0011', (data: number) => {
        flag = true;
        expect(data).assertEqual(1)
        console.info('testWebView_WebViewTest0011 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0011 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest11"
      })
      await driver.delayMs(2000)
      sendEventByKey('11', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0012
     * @tc.name testWebView_WebViewTest_0012
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0012', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0012 start')
      console.info('testWebView_WebViewTest0012 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0012', (data: number) => {
        flag = true;
        console.info('id ========= ' + data)
        // expect(data).assertEqual(-1)
        console.info('testWebView_WebViewTest0012 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0012 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest12"
      })
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WebViewTest_0013
     * @tc.name testWebView_WebViewTest_0013
     * @tc.desc test WebViewTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_WebViewTest0013', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0013 start')
      console.info('testWebView_WebViewTest0013 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on('testWebView_WebViewTest0013', (data: number) => {
        flag = true;
        expect(data).assertEqual(1)
        console.info('testWebView_WebViewTest0013 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testWebView_WebViewTest0013 end')
      })
      router.pushUrl({
        url: "testability/pages/WebViewTest13"
      })
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      router.clear()
    })
  })
}