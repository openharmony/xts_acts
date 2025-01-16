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

export default function precompileJavaScriptTest() {

  describe('precompileJavaScriptTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/precompileJavaScriptTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get precompileJavaScriptTest state success " + JSON.stringify(pages));
        if (!("precompileJavaScriptTest" == pages.name)) {
          console.info("get precompileJavaScriptTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(900);
          console.info("push precompileJavaScriptTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push precompileJavaScriptTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      console.info("precompileJavaScriptTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0100
    * @tc.name       : testPrecompileJavaScript001
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript001', 0, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript001", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript001", 0, 10092, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0500
    * @tc.name       : testPrecompileJavaScript005
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript005', 0, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript005", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript005", "401", 10096, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0600
    * @tc.name       : testPrecompileJavaScript006
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript006', 0, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript006", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript006", "401", 10097, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1100
    * @tc.name       : testPrecompileJavaScript011
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript011', 0, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript011", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript011", 0, 10102, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })

  })
}
