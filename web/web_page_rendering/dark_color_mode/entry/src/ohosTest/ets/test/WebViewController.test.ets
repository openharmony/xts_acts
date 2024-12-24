/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webViewController() {

  describe('WebViewControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewController state success " + JSON.stringify(pages));
        if (!("webViewController" == pages.name)) {
          console.info("get webViewController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webViewController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewController page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewController beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_DARKMODE_0100
    * @tc.name       : testDarkMode001
    * @tc.desc       : test darkMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDarkMode001', 0, async (done: Function) => {
      Utils.emitEvent("testDarkMode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDarkMode001", "true", 31039, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DARKMODE_0200
    * @tc.name       : testDarkMode002
    * @tc.desc       : test darkMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDarkMode002', 0, async (done: Function) => {
      Utils.emitEvent("testDarkMode002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDarkMode002", "false", 31040, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FORCEDARKACCESS_0100
    * @tc.name       : testForceDarkAccess001
    * @tc.desc       : test forceDarkAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testForceDarkAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testForceDarkAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testForceDarkAccess001", "false", 31041, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })
  })
}
