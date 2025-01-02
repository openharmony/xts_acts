import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { webview } from '@kit.ArkWeb';
import { Driver } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LocalContext } from './GloablConfig';
import { BusinessError } from '@kit.BasicServicesKit';

let driver: Driver = Driver.create();
let flg: boolean = true;
let flag: boolean = false;
let messages: string = '';

export default function RegisterNativeEmbedRule() {

  describe('RegisterNativeEmbedRule', () => {
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
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0100
     * @tc.name RegisterNativeEmbedRule_0100
     * @tc.desc test registerNativeEmbedRule("embed"," ")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RegisterNativeEmbedRule01', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');
      // 获取按钮元素并模拟点击

      //按钮001
      LocalContext.context.eventHub.on('registerNativeEmbedRule001', (data: boolean) => {
        flag = data
        console.info('registerNativeEmbedRule001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testregisterNativeEmbedRule001 end')
      })

      LocalContext.context.eventHub.on('registerNativeEmbedRule003', (data: string) => {
        messages = data
        console.log('=========>001', messages)
        console.info('registerNativeEmbedRule003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testregisterNativeEmbedRule003 end')
      })

      await driver.delayMs(500)

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0100"
      });
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      try {
        if (messages == '01注册成功') {
          flg = true
          expect().assertFail();
        } else {
          console.log('==========>', '01注册失败');
        }
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0400 end')
        expect().assertFail();
      }
      expect(flg).assertFalse()
      await driver.delayMs(500)
      expect(flag).assertTrue()

      //按钮002
      LocalContext.context.eventHub.on('registerNativeEmbedRule002', (data: boolean) => {
        flg = data
        console.info('enableNativeEmbedRule002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0200 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule004', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0200 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0100"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0200
     * @tc.name RegisterNativeEmbedRule_0200
     * @tc.desc test registerNativeEmbedRule("embed","ab%c")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule02', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');
      // 获取按钮元素并模拟点击
      //001
      LocalContext.context.eventHub.on('registerNativeEmbedRule2003', (data: string) => {
        messages = data
        if (messages == '02注册成功') {
          flag = true
        }
        console.log('=========>001', messages)
        console.info('registerNativeEmbedRul2e2003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule2003 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule2004', (data: string) => {
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule2004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule2004 end')
      })


      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0200"
      });
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()


      //002
      LocalContext.context.eventHub.on('registerNativeEmbedRule2002', (data: boolean) => {
        flg = data
        console.info('enableNativeEmbedRule2002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'enableNativeEmbedRule2002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule2005', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule2005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule2005 end')
      })
      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0200"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0300
     * @tc.name RegisterNativeEmbedRule_0300
     * @tc.desc test registerNativeEmbedRule("embed","123")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule03', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      //001
      LocalContext.context.eventHub.on('registerNativeEmbedRule3003', (data: string) => {
        messages = data
        if (messages == '03注册成功') {
          flag = true
        }
        console.log('=========>001', data)
        console.info('registerNativeEmbedRul2e3003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0300 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule3004', (data: string) => {
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule3004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule3004 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0300"
      });


      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      //002
      LocalContext.context.eventHub.on('registerNativeEmbedRule3002', (data: boolean) => {
        flg = data
        console.info('enableNativeEmbedRule3002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule3002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule3005', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule3005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule3005 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0300"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0400
     * @tc.name RegisterNativeEmbedRule_0400
     * @tc.desc test registerNativeEmbedRule("object"," ")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule04', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');
      // 获取按钮元素并模拟点击

      //按钮001
      LocalContext.context.eventHub.on('registerNativeEmbedRule4001', (data: boolean) => {
        flag = data
        console.info('registerNativeEmbedRule4001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule4001 end')
      })

      LocalContext.context.eventHub.on('registerNativeEmbedRule4003', (data: string) => {
        messages = data
        console.log('=========>001', messages)
        console.info('registerNativeEmbedRule4003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule4003 end')
      })

      await driver.delayMs(500)

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0400"
      });
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      try {
        if (messages == '04注册成功') {
          flg = true
          expect().assertFail();
        } else {
          console.log('==========>', '04注册失败');
        }
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'testSetBackForwardCacheOptionsTest0400 end')
        expect().assertFail();
      }
      expect(flg).assertFalse()
      await driver.delayMs(500)
      expect(flag).assertTrue()

      //按钮002
      LocalContext.context.eventHub.on('registerNativeEmbedRule4002', (data: boolean) => {
        flg = data
        console.info('registerNativeEmbedRule4002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule4002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule4004', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule4004 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0400"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0500
     * @tc.name RegisterNativeEmbedRule_0500
     * @tc.desc test registerNativeEmbedRule("object","ab%c")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule05', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      //001
      LocalContext.context.eventHub.on('registerNativeEmbedRule5003', (data: string) => {
        messages = data
        if (messages == '05注册成功') {
          flag = true
        }
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule5003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule5003 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule5004', (data: string) => {
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule5004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule5004 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0500"
      });


      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      //002
      LocalContext.context.eventHub.on('registerNativeEmbedRule5002', (data: boolean) => {
        flg = data
        console.info('registerNativeEmbedRule5002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule5002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule5005', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule5005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule5005 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0500"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0600
     * @tc.name RegisterNativeEmbedRule_0600
     * @tc.desc test registerNativeEmbedRule("object","123")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule06', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      //001
      LocalContext.context.eventHub.on('registerNativeEmbedRule6003', (data: string) => {
        messages = data
        if (messages == '06注册成功') {
          flag = true
        }
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule6003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule6003 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule6004', (data: string) => {
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule6004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule6004 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0600"
      });


      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      //002
      LocalContext.context.eventHub.on('registerNativeEmbedRule6002', (data: boolean) => {
        flg = data
        console.info('registerNativeEmbedRule6002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule6002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule6005', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule6005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule6005 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0600"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0700
     * @tc.name RegisterNativeEmbedRule_0700
     * @tc.desc test registerNativeEmbedRule("object","ABC")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule07', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      //001
      LocalContext.context.eventHub.on('registerNativeEmbedRule7003', (data: string) => {
        messages = data
        if (messages == '07注册成功') {
          flag = true
        }
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule7003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule7003 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule7004', (data: string) => {
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule6004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule7004 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0700"
      });


      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      //002
      LocalContext.context.eventHub.on('registerNativeEmbedRule7002', (data: boolean) => {
        flg = data
        console.info('registerNativeEmbedRule7002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule7002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule7005', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule7005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule7005 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0700"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0800
     * @tc.name RegisterNativeEmbedRule_0800
     * @tc.desc test registerNativeEmbedRule("object","AAbb")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule08', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      //001
      LocalContext.context.eventHub.on('registerNativeEmbedRule8003', (data: string) => {
        messages = data
        if (messages == '08注册成功') {
          flag = true
        }
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule8003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule8003 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule8004', (data: string) => {
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule8004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule8004 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0800"
      });


      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      //002
      LocalContext.context.eventHub.on('registerNativeEmbedRule8002', (data: boolean) => {
        flg = data
        console.info('registerNativeEmbedRule8002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule8002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule8005', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule8005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule8005 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0800"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_0900
     * @tc.name RegisterNativeEmbedRule_0900
     * @tc.desc test registerNativeEmbedRule("embed","ABC")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule09', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      //001
      LocalContext.context.eventHub.on('registerNativeEmbedRule9003', (data: string) => {
        messages = data
        if (messages == '09注册成功') {
          flag = true
        }
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule9003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule9003 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule9004', (data: string) => {
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule9004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule9004 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0900"
      });


      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      //002
      LocalContext.context.eventHub.on('registerNativeEmbedRule9002', (data: boolean) => {
        flg = data
        console.info('registerNativeEmbedRule9002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule9002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule9005', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule9005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule9005 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_0900"
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

    /**
     * @tc.number SUB_ACE_WEB_registerNativeEmbedRule_1000
     * @tc.name RegisterNativeEmbedRule_1000
     * @tc.desc test registerNativeEmbedRule("embed","AAbb")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('registerNativeEmbedRule10', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testButtonClick start');
      console.info('testButtonClick start');


      //001
      LocalContext.context.eventHub.on('registerNativeEmbedRule1003', (data: string) => {
        messages = data
        if (messages == '10注册成功') {
          flag = true
        }
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule1003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule9003 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule1004', (data: string) => {
        console.log('=========>001', data)
        console.info('registerNativeEmbedRule1004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule1004 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_1000"
      });


      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      expect(flag).assertTrue()
      //002
      LocalContext.context.eventHub.on('registerNativeEmbedRule1002', (data: boolean) => {
        flg = data
        console.info('registerNativeEmbedRule1002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule1002 end')
      })

      await driver.delayMs(500)
      LocalContext.context.eventHub.on('registerNativeEmbedRule1005', (data: string) => {
        console.log('=========>002', data)
        console.info('registerNativeEmbedRule1005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'registerNativeEmbedRule1005 end')
      })

      // 导航到目标页面
      router.pushUrl({
        url: "testability/pages/RegisterNativeEmbedRule_1000"
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