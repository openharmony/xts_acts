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
import { LocalContext } from './GloablConfig';
import { router } from '@kit.ArkUI';
import { Driver } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import Utils from './Util';

let driver: Driver = Driver.create();
let TGA: string = 'TestWebMessageTest'
let flg: boolean = false

export default function WebSendTest() {
  describe('WebSendTest', () => {
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
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1300
     * @tc.name testErrorCodeMessage1300
     * @tc.desc test ReadTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testErrorCodeMessage1300', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1300 start')
      console.info('SUB_WEB_ERRORCODEANDERRORMESSAGE_1300 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("ReadTest2-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message)
          .assertEqual("BusinessError 401: Parameter error. The value of size must be a number greater than 0.")
        console.info('SUB_WEB_ERRORCODEANDERRORMESSAGE_1300 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1300 end')
      })
      router.pushUrl({
        url: "testability/pages/ReadTest2"
      })
      await Utils.sleep(1000)
      sendEventByKey("0012", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1400
     * @tc.name testErrorCodeMessage1400
     * @tc.desc test ResumeDownloadTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage1400', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1400 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1400 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("ResumeDownloadTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("17100018")
        expect(message).assertEqual("No WebDownloadDelegate has been set yet.")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1400 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1400 end')
      })
      router.pushUrl({
        url: "testability/pages/ResumeDownloadTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("003", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1500
     * @tc.name testErrorCodeMessage1500
     * @tc.desc test ResumeTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage1500', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1500 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1500 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("ResumeTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("17100016")
        expect(message).assertEqual("The download task is not paused.")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1500 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1500 end')
      })
      router.pushUrl({
        url: "testability/pages/ResumeTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("004", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1600
     * @tc.name testErrorCodeMessage1600
     * @tc.desc test PauseTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage1600', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1600 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1600 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("PauseTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("17100019")
        expect(message).assertEqual("The download task is not started yet.")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1600 end')
      })
      router.pushUrl({
        url: "testability/pages/PauseTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("005", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1800
     * @tc.name testErrorCodeMessage1800
     * @tc.desc test DeserializeTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage1800', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1800 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1800 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("DeserializeTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError: 401. Parameter error. The type of 'serializedData' must be array.")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1800 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1800 end')
      })
      router.pushUrl({
        url: "testability/pages/DeserializeTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("007", 10, "")
      await Utils.sleep(2000)
      sendEventByKey("0071", 10, "")
      await Utils.sleep(2000)
      sendEventByKey("0072", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_1900
     * @tc.name testErrorCodeMessage1900
     * @tc.desc test GetItemAtIndexTest1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage1900', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1900 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1900 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("GetItemAtIndexTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message)
          .assertEqual("BusinessError 401: Parameter error. The value of index must be greater than or equal to 0")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1900 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_1900 end')
      })
      router.pushUrl({
        url: "testability/pages/GetItemAtIndexTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("008", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2000
     * @tc.name testErrorCodeMessage2000
     * @tc.desc test GetItemAtIndexTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage2000', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2000 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2000 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("GetItemAtIndexTest1-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message)
          .assertEqual("BusinessError 401: Parameter error. The type of 'index' and 'int' can not be ignored.")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2000 end')
      })
      router.pushUrl({
        url: "testability/pages/GetItemAtIndexTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("0081", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2100
     * @tc.name testErrorCodeMessage2100
     * @tc.desc test GetItemAtIndexTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage2100', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2100 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2100 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("GetItemAtIndexTest2-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message)
          .assertEqual("BusinessError 401: Parameter error. The value of index must be greater than or equal to 0")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2100 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2100 end')
      })
      router.pushUrl({
        url: "testability/pages/GetItemAtIndexTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("0082", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2200
     * @tc.name testErrorCodeMessage2200
     * @tc.desc test SetErrorTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage2200', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2200 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2200 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("SetErrorTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'message' must be error.")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2200 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2200 end')
      })
      router.pushUrl({
        url: "testability/pages/SetErrorTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("009", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2300
     * @tc.name testErrorCodeMessage2300
     * @tc.desc test SetErrorTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage2300', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2300 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2300 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("SetErrorTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'message' must be error.")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2300 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2300 end')
      })
      router.pushUrl({
        url: "testability/pages/SetErrorTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("0091", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2400
     * @tc.name testErrorCodeMessage24001
     * @tc.desc test SetErrorTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testErrorCodeMessage24001', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2400 start')
      console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2400 start')
      await Utils.sleep(500)

      LocalContext.context.eventHub.on("SetArrayBufferTest-error", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'message' must be arrayBuffer.")
        console.info(TGA, 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2400 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_WEB_ERRORCODEANDERRORMESSAGE_2400 end')
      })
      router.pushUrl({
        url: "testability/pages/SetArrayBufferTest"
      })
      await Utils.sleep(2000)
      sendEventByKey("010", 10, "")
      await Utils.sleep(1000)
      expect(flg).assertTrue()
      router.clear()
    })
  })
}