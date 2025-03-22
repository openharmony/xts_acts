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
import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import webView from '@ohos.web.webview';

export default function rectEvent() {

  describe('rectEventTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/rectEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rectEvent state success " + JSON.stringify(pages));
        if (!("rectEvent" == pages.name)) {
          console.info("get rectEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push rectEvent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rectEvent page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : rectEvent0100
    * @tc.name       : rectEvent0100
    * @tc.desc       : test rectEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('rectEvent0100', 0, async (done: Function) => {
      Utils.emitEvent("rectEvent0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("rectEvent0100", true, 202503222, done);
      sendEventByKey('surfaceInfoButton', 10, '');
    })


  })
}
