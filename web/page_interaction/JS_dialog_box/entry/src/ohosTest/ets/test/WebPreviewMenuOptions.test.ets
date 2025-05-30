/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebPreviewMenuOptions() {

  describe('WebPreviewMenuOptionsTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebPreviewMenuOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebPreviewMenuOptions state success " + JSON.stringify(pages));
        if (!("WebPreviewMenuOptions" == pages.name)) {
          console.info("get WebPreviewMenuOptions state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebPreviewMenuOptions page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebPreviewMenuOptions page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebPreviewMenuOptions afterEach start");
      await Utils.sleep(2000);
      console.info("WebPreviewMenuOptions afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBHAPTICFEEDBACK_0100
    * @tc.name       : WebHapticFeedback001
    * @tc.desc       : test WebHapticFeedback001
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebHapticFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebHapticFeedback001", 10)
      Utils.registerEvent("WebHapticFeedback001", 'HapticFeedbackMode.DISABLED', 20250517, done);
      sendEventByKey('WebHapticFeedbackButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBHAPTICFEEDBACK_0200
    * @tc.name       : WebHapticFeedback002
    * @tc.desc       : test WebHapticFeedback002
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebHapticFeedback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebHapticFeedback002", 10)
      Utils.registerEvent("WebHapticFeedback002", 'HapticFeedbackMode.ENABLED', 20250518, done);
      sendEventByKey('WebHapticFeedbackButton', 10, '');
    })


    /*
      * @tc.number     : SUB_WEB_WEBHAPTICFEEDBACK_0300
      * @tc.name       : WebHapticFeedback003
      * @tc.desc       : test WebHapticFeedback003
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebHapticFeedback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebHapticFeedback003", 10)
      Utils.registerEvent("WebHapticFeedback003", 'HapticFeedbackMode.AUTO', 20250519, done);
      sendEventByKey('WebHapticFeedbackButton', 10, '');
    })


  })
}
