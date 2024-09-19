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
import { webview } from '@kit.ArkWeb';
import { Driver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import { LocalContext } from './GloablConfig';
import  Utils  from './Util';

let driver: Driver = Driver.create();
let flg: boolean = false

export default function webSchemeHandler() {
  describe('ActsWebSchemeHandlerTest', () => {
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
    it('assertContain', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin')
      let a = 'abc'
      let b = 'b'
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertContain(b)
      expect(a).assertEqual(a)
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_0300
     * @tc.name testErrorCodeMessage0300
     * @tc.desc test SetHeaderByName-name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage0300', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0300 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0300 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetHeaderByName-name-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'name' must be string.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0300 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0300 end')
      })
      router.pushUrl({
        url: "testability/pages/SetHeaderByName-name"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })


    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_0400
     * @tc.name testErrorCodeMessage0400
     * @tc.desc test SetHeaderByName-value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage0400', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0400 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0400 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetHeaderByName-value-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'value' must be string.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0400 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0400 end')
      })
      router.pushUrl({
        url: "testability/pages/SetHeaderByName-value"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_0500
     * @tc.name testErrorCodeMessage0500
     * @tc.desc test SetHeaderByName-overwrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage0500', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0500 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0500 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetHeaderByName-overwrite-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'overwrite' must be booleane.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0500 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0500 end')
      })
      router.pushUrl({
        url: "testability/pages/SetHeaderByName-overwrite"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_0600
     * @tc.name testErrorCodeMessage0600
     * @tc.desc test SetEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage0600', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0600 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0600 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetEncoding-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'encoding' must be string.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0600 end')
      })
      router.pushUrl({
        url: "testability/pages/SetEncoding"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_0700
     * @tc.name testErrorCodeMessage0700
     * @tc.desc test SetMimeType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage0700', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0700 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0700 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetMimeType-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'type' must be string.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0700 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0700 end')
      })
      router.pushUrl({
        url: "testability/pages/SetMimeType"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_0800
     * @tc.name testErrorCodeMessage0800
     * @tc.desc test SetStatusText
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage0800', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0800 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0800 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetStatusText-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'text' must be string.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0800 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0800 end')
      })
      router.pushUrl({
        url: "testability/pages/SetStatusText"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_0900
     * @tc.name testErrorCodeMessage0900
     * @tc.desc test SetStatus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage0900', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0900 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0900 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetStatus-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'code' must be int.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0900 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_0900 end')
      })
      router.pushUrl({
        url: "testability/pages/SetStatus"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1000
     * @tc.name testErrorCodeMessage1000
     * @tc.desc test SetNetErrorCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage1000', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1000 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1000 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetNetErrorCode-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'code' must be int.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1000 end')
      })
      router.pushUrl({
        url: "testability/pages/SetNetErrorCode"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1100
     * @tc.name testErrorCodeMessage1100
     * @tc.desc test SetUrl
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage1100', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1100 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1100 start')
      await Utils.sleep(500)
      LocalContext.context.eventHub.on("SetUrl-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'url' must be string.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1100 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1100 end')
      })
      router.pushUrl({
        url: "testability/pages/SetUrl"
      })
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1200
     * @tc.name testErrorCodeMessage1200
     * @tc.desc test onRequestStart
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage1200', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1200 start')
      console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1200 start')

      await Utils.sleep(500)
      LocalContext.context.eventHub.on("ReadTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message)
          .assertEqual("BusinessError 401: Parameter error. The value of size must be a number greater than 0.")
        console.info("=========", 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1200 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1200 end')
      })
      router.pushUrl({
        url: "testability/pages/ReadTest"
      })
      await Utils.sleep(1000)
      sendEventByKey("001", 10, "")
      await Utils.sleep(2000)
      expect(flg).assertTrue()
      router.clear()
    })

  })
}
