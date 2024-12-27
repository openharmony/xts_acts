import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, On } from '@kit.TestKit';
import { LocalContext } from './GloablConfig';
import { AnimatedDrawableDescriptor, router } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

let driver: Driver = Driver.create();
let flag: boolean = false;
let messages: string = '';

export default function TestSetScrollable() {

  describe('TestSetScrollable', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      flag = false;
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
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_2400
     * @tc.name TestSetScrollableTest2400
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest24', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest2401', (data: boolean) => {
        flag = data
        console.log('=========>001', messages)
        console.info('TestSetScrollableTest2401 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest2401 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面

      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest2400"
      });

      await driver.delayMs(5000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()


      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_2500
     * @tc.name TestSetScrollableTest2500
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest25', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest2501', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest2501 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest2501 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest2500"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(3000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http:/baidu.com');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      expect(flag).assertTrue()


      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_2600
     * @tc.name TestSetScrollableTest2600
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest26', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest2601', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest2601 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest2601 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest2600"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http://www.163.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput2 = await driver.findComponent(ON.id('input'));
      await getinput2.inputText('http://163.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(6000)
      expect(flag).assertTrue()


      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_2700
     * @tc.name TestSetScrollableTest2700
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest27', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest2701', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest27 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest27 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest2700"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(3000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http://www.163.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(6000)
      expect(flag).assertTrue()


      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_2800
     * @tc.name TestSetScrollableTest2800
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest28', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest2801', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest2801 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest2801 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest2800"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http://www.163.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(6000)
      expect(flag).assertTrue()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_2900
     * @tc.name TestSetScrollableTest2900
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest29', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest2901', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest2901 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest2901 end')
      })

      LocalContext.context.eventHub.on('TestSetScrollableTest2902', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest2902 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest2902 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest2900"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http://www.163.com:80/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput2 = await driver.findComponent(ON.id('input'));
      await getinput2.inputText('http://www.163.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      expect(flag).assertFalse()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_3000
     * @tc.name TestSetScrollableTest3000
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest30', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest3001', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3001 end')
      })
      await driver.delayMs(2000)

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest3000"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('https://www.test.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(6000)
      expect(flag).assertTrue()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_3100
     * @tc.name TestSetScrollableTest3100
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest31', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest3101', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3101 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3101 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest3100"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('https://www.163.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput1 = await driver.findComponent(ON.id('input'));
      await getinput1.inputText('http://www.163.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput2 = await driver.findComponent(ON.id('input'));
      await getinput2.inputText('http://www.163.com');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput3 = await driver.findComponent(ON.id('input'));
      await getinput3.inputText('https://www.163.com');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      expect(flag).assertTrue()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_3200
     * @tc.name TestSetScrollableTest3200
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest32', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest3201', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3201 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3201 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest3200"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http://www.163.com');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput2 = await driver.findComponent(ON.id('input'));
      await getinput2.inputText('https://www.163.com');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      expect(flag).assertTrue()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_3300
     * @tc.name TestSetScrollableTest3300
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest33', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest3301', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3301 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3301 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest3300"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('https://www.test.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput2 = await driver.findComponent(ON.id('input'));
      await getinput2.inputText('https://www.163.com');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      expect(flag).assertTrue()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_3400
     * @tc.name TestSetScrollableTest3400
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest34', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest3401', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3401 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3401 end')
      })

      LocalContext.context.eventHub.on('TestSetScrollableTest3402', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3402 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3402 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest3400"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http://www.163.com:80/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput2 = await driver.findComponent(ON.id('input'));
      await getinput2.inputText('http://www.163.com:80');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      expect(flag).assertFalse()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_3500
     * @tc.name TestSetScrollableTest3500
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest35', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest3501', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3501 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3501 end')
      })

      LocalContext.context.eventHub.on('TestSetScrollableTest3502', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3502 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3502 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest3500"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http://www.163.com/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput2 = await driver.findComponent(ON.id('input'));
      await getinput2.inputText('https://www.163.com');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      expect(flag).assertFalse()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });

    /**
     * @tc.number SUB_WEB_TESTSETSCROLLABLETEST_3600
     * @tc.name TestSetScrollableTest3600
     * @tc.desc test setUrlTrustList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TestSetScrollableTest36', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      LocalContext.context.eventHub.on('TestSetScrollableTest3601', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3601 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3601 end')
      })

      LocalContext.context.eventHub.on('TestSetScrollableTest3602', (data: boolean) => {
        flag = data
        console.info('TestSetScrollableTest3602 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testTestSetScrollableTest3602 end')
      })
      await driver.delayMs(2000)
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/TestSetScrollableTest3600"
      });

      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      let getinput = await driver.findComponent(ON.id('input'));
      await getinput.inputText('http://www.163.com:80/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      let getinput2 = await driver.findComponent(ON.id('input'));
      await getinput2.inputText('http://www.163.com:81/test');
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(8000)
      expect(flag).assertFalse()

      // 结束测试
      console.info('testButtonClick end');
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick end');
      done();

    });
  })

}