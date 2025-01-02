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

export default function WebOnPermissionRequest() {
  describe('WebOnPermissionRequest', () => {
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
    })
    beforeEach(() => {
      flg = false;
    })
    afterEach(() => {
      flg = false;
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_ACE_WEB_onPermissionRequest_0001
     * @tc.name testWebView_onPermissionRequest0001
     * @tc.desc test onPermissionRequest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onPermissionRequest0001', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onPermissionRequest_0001 start');
      console.info('SUB_ACE_WEB_onPermissionRequest_0001 start');
      await driver.delayMs(500);

      LocalContext.context.eventHub.on("WebViewOnPermissionRequest1", () => {
        flg = true
        console.info('SUB_ACE_WEB_onPermissionRequest_0001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onPermissionRequest_0001 end')
      });
      router.pushUrl({
        url: "testability/pages/WebViewOnPermissionRequest1"
      });
      await driver.delayMs(3000);
      expect(flg).assertTrue();
      router.clear();
    })

    /**
     * @tc.number SUB_ACE_WEB_onPermissionRequest_0002
     * @tc.name testWebView_onPermissionRequest0002
     * @tc.desc test onPermissionRequest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onPermissionRequest0002', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onPermissionRequest_0002 start');
      console.info('SUB_ACE_WEB_onPermissionRequest_0002 start');
      await driver.delayMs(500);

      LocalContext.context.eventHub.on("WebViewOnPermissionRequest2", () => {
        flg = true
        console.info('SUB_ACE_WEB_onPermissionRequest_0002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onPermissionRequest_0002 end')
      });
      router.pushUrl({
        url: "testability/pages/WebViewOnPermissionRequest2"
      });
      await driver.delayMs(3000);
      expect(flg).assertTrue();
      router.clear();
    })

    /**
     * @tc.number SUB_ACE_WEB_onPermissionRequest_0003
     * @tc.name testWebView_onPermissionRequest0003
     * @tc.desc test onPermissionRequest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onPermissionRequest0003', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onPermissionRequest_0003 start');
      console.info('SUB_ACE_WEB_onPermissionRequest_0003 start');
      await driver.delayMs(500);

      LocalContext.context.eventHub.on("WebViewOnPermissionRequest3", () => {
        flg = true
        console.info('SUB_ACE_WEB_onPermissionRequest_0003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onPermissionRequest_0003 end')
      });
      router.pushUrl({
        url: "testability/pages/WebViewOnPermissionRequest3"
      });
      await driver.delayMs(3000);
      expect(flg).assertTrue();
      router.clear();
    })

    /**
     * @tc.number SUB_ACE_WEB_onPermissionRequest_0004
     * @tc.name testWebView_onPermissionRequest0004
     * @tc.desc test onPermissionRequest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onPermissionRequest0004', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onPermissionRequest_0004 start');
      console.info('SUB_ACE_WEB_onPermissionRequest_0004 start');
      await driver.delayMs(500);

      LocalContext.context.eventHub.on("WebViewOnPermissionRequest4", () => {
        flg = true
        console.info('SUB_ACE_WEB_onPermissionRequest_0004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onPermissionRequest_0004 end')
      });
      router.pushUrl({
        url: "testability/pages/WebViewOnPermissionRequest4"
      });
      await driver.delayMs(3000);
      expect(flg).assertTrue();
      router.clear();
    })

  })
}