/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { LocalContext } from './GloablConfig';
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

let driver: Driver = Driver.create();
let flg: boolean = false

export default function webRequestHeaderList() {
  describe('WebRequestHeaderListTest', () => {
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
    afterEach(() => {
      flg = false;
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_1110
     * @tc.name testWebRequestHeaderList_GetHeader_IndexParam_NotNum
     * @tc.desc test getHttpBodyStream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebRequestHeaderList_GetHeader_IndexParam_NotNum', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WEBHOST_1110 start')
      console.info('SUB_ACE_WEB_WEBHOST_1110 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("GetHttpBodyStreamTest", () => {
        flg = true
        console.info('SUB_ACE_WEB_WEBHOST_1110 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WEBHOST_1110 end')
      })
      router.pushUrl({
        url: "testability/pages/GetHttpBodyStreamTest"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getSecurityLevel_SDK_0001
     * @tc.name testWebView_getSecurityLevel0001
     * @tc.desc test getSecurityLevel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getSecurityLevel0001', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getSecurityLevel_SDK_0001 start')
      console.info('SUB_ACE_WEB_getSecurityLevel_SDK_0001 start')
      await driver.delayMs(500)

      try {
        new webview.WebviewController().getSecurityLevel()
      } catch (error) {
        flg = true
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual("17100001")
        expect(error.message).assertEqual("Init error. The WebviewController must be associated with a Web component")
      }
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getSecurityLevel_SDK_0001 end')
      console.info('SUB_ACE_WEB_getSecurityLevel_SDK_0001 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_start_0100
     * @tc.name testWebView_start0100
     * @tc.desc test WebView_start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_start0100', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_start_0100 start')
      console.info('SUB_ACE_WEB_start_0100 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("StartTest-success", () => {
        flg = true
        console.info('SUB_ACE_WEB_start_0100 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_start_0100 end')
      })
      router.pushUrl({
        url: "testability/pages/StartDownloadTest"
      })
      await driver.delayMs(2000)
      sendEventByKey("01", 10, '')
      await driver.delayMs(1000)
      sendEventByKey("02", 10, '')
      await driver.delayMs(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_start_0105
     * @tc.name testWebView_start0105
     * @tc.desc test WebDownloadState
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_start0105', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_start_0105 start')
      console.info('SUB_ACE_WEB_start_0105 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("WebDownloadState", (data: string) => {
        flg = true
        expect(data).assertEqual("4")
        console.info('SUB_ACE_WEB_start_0105 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_start_0105 end')
      })
      router.pushUrl({
        url: "testability/pages/PendingTest"
      })
      await driver.delayMs(2000)
      sendEventByKey("05", 10, '')
      await driver.delayMs(1000)
      sendEventByKey("06", 10, '')
      await driver.delayMs(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_WarmupServiceWorker_0002
     * @tc.name testWebView_warmupServiceWorker0002
     * @tc.desc test warmupServiceWorker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_warmupServiceWorker0002', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WarmupServiceWorker_0002 start')
      console.info('SUB_ACE_WEB_WarmupServiceWorker_0002 start')
      await driver.delayMs(500)

      try {
        webview.WebviewController.warmupServiceWorker("https://");
      } catch (error) {
        flg = true
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual("17100002")
        expect(error.message).assertEqual("Invalid url")
      }
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WarmupServiceWorker_0002 end')
      console.info('SUB_ACE_WEB_WarmupServiceWorker_0002 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_WarmupServiceWorker_0003
     * @tc.name testWebView_warmupServiceWorker0003
     * @tc.desc test warmupServiceWorker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_warmupServiceWorker0003', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WarmupServiceWorker_0003 start')
      console.info('SUB_ACE_WEB_WarmupServiceWorker_0003 start')
      await driver.delayMs(500)

      try {
        webview.WebviewController.warmupServiceWorker(null);
      } catch (error) {
        flg = true
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual("17100002")
        expect(error.message).assertEqual("Invalid url")
      }
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WarmupServiceWorker_0003 end')
      console.info('SUB_ACE_WEB_WarmupServiceWorker_0003 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0003
     * @tc.name testWebView_onOverrideUrlLoading0003
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0003', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0003 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0003 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("onOverrideUrlLoading0003", () => {
        flg = !flg
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading3"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0003 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0003 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0004
     * @tc.name testWebView_onOverrideUrlLoading0004
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0004', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0004 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0004 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("onOverrideUrlLoading0004", () => {
        flg = true
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading4"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0004 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0004 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0006
     * @tc.name testWebView_onOverrideUrlLoading0006
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0006', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0006 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0006 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("onOverrideUrlLoading0006", () => {
        flg = !flg
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading6"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0006 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0006 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0007
     * @tc.name testWebView_onOverrideUrlLoading0007
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0007', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0007 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0007 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("onOverrideUrlLoading0007", () => {
        flg = !flg
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading7"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0007 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0007 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0008
     * @tc.name testWebView_onOverrideUrlLoading0007
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0008', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0008 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0008 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("onOverrideUrlLoading0008", () => {
        flg = !flg
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading8"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0008 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0008 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_ ONFIRSTCONTENTFULPAINT_0001
     * @tc.name testWebView_onFirstContentfulPaint_navigationStartTick
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onFirstContentfulPaint_navigationStartTick', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_ ONFIRSTCONTENTFULPAINT_0001 start')
      console.info('SUB_ACE_WEB_ ONFIRSTCONTENTFULPAINT_0001 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("navigationStartTick", () => {
        flg = true
      })

      router.pushUrl({
        url: "testability/pages/NavigationStartTick"
      })
      await driver.delayMs(3000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(3000)
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_ ONFIRSTCONTENTFULPAINT_0001 end')
      console.info('SUB_ACE_WEB_ ONFIRSTCONTENTFULPAINT_0001 end')
    })
  })
}