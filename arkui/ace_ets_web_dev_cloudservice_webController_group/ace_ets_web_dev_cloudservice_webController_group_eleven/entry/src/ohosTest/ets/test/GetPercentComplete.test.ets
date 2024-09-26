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

let driver: Driver = Driver.create();
let flg: boolean = false

export default function GetPercentComplete() {
  describe('getPercentComplete', () => {
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
     * @tc.number SUB_ACE_WEB_getPercentComplete_1001
     * @tc.name testWebView_getPercentComplete1001
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1001', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1001 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1001 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete1", (data: number) => {
        flg = true
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1001 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete1"
      })
      await driver.delayMs(2000)
      sendEventByKey('0022', 10, '')
      await driver.delayMs(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1002
     * @tc.name testWebView_getPercentComplete1002
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1002', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1002 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1002 start')
      let callbackNum1: number = 0;
      let callbackNum2: number = 0;
      let callbackNum3: number = 0;
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete21", (data: number) => {
        callbackNum1++
        expect(data > 0).assertTrue()
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete22", (data: number) => {
        callbackNum2++
        expect(data > 0).assertTrue()
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete23", (data: number) => {
        callbackNum3++
        expect(data > 0).assertTrue()
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete2"
      })

      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(10000)
      expect(callbackNum1 > 0).assertTrue()
      expect(callbackNum2 > 0).assertTrue()
      expect(callbackNum3 > 0).assertTrue()
      router.clear()
      console.info('SUB_ACE_WEB_getPercentComplete_1002 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1002 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1003
     * @tc.name testWebView_getPercentComplete1003
     * @tc.desc test getPercentComplete20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1003', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1003 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1003 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete3", (data: number) => {
        flg = true
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1003 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete3"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(10000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1004
     * @tc.name testWebView_getPercentComplete1004
     * @tc.desc test getPercentComplete80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1004', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1004 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1004 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete4", (data: number) => {
        flg = true
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1004 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete4"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(10000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1005
     * @tc.name testWebView_getPercentComplete1005
     * @tc.desc test getPercentComplete40-100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1005', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1005 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1005 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete5", (data: number) => {
        flg = true
        expect(data).assertEqual(100)
        console.info('SUB_ACE_WEB_getPercentComplete_1005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1005 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete5"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(20000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1006
     * @tc.name testWebView_getPercentComplete1006
     * @tc.desc test getPercentComplete80-90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1006', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1006 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1006 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete6", (data: number) => {
        flg = true
        expect(data >= 90).assertTrue()
        console.info('SUB_ACE_WEB_getPercentComplete_1006 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1006 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete6"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(20000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1007
     * @tc.name testWebView_getPercentComplete1007
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1007', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1007 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1007 start')
      let callbackNum1: number = 0;
      let callbackNum2: number = 0;
      let callbackNum3: number = 0;
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete71", (data: number) => {
        callbackNum1++
        expect(data >= 40).assertTrue()
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete72", (data: number) => {
        callbackNum2++
        expect(data >= 60).assertTrue()
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete73", (data: number) => {
        callbackNum3++
        expect(data >= 70).assertTrue()
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete7"
      })

      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(20000)
      expect(callbackNum1 > 0).assertTrue()
      expect(callbackNum2 > 0).assertTrue()
      expect(callbackNum3 > 0).assertTrue()
      router.clear()
      console.info('SUB_ACE_WEB_getPercentComplete_1007 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1007 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1008
     * @tc.name testWebView_getPercentComplete1008
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1008', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1008 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1008 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete8", (data: number) => {
        flg = true
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1008 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1008 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete8"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1010
     * @tc.name testWebView_getPercentComplete1010
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1010', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1010 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1010 start')
      let callbackNum1: number = 0;
      let callbackNum2: number = 0;
      let callbackNum3: number = 0;
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete101", (data: number) => {
        callbackNum1++
        expect(data).assertEqual(0)
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete102", (data: number) => {
        callbackNum2++
        expect(data).assertEqual(0)
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete103", (data: number) => {
        callbackNum3++
        expect(data).assertEqual(0)
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete10"
      })

      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(5000)
      expect(callbackNum1 > 0).assertTrue()
      expect(callbackNum2 > 0).assertTrue()
      expect(callbackNum3 > 0).assertTrue()
      router.clear()
      console.info('SUB_ACE_WEB_getPercentComplete_1010 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1010 end')
    })
  })
}