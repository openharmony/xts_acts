/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default function webViewControllerPart3Test() {

  describe('WebViewControllerPart3', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerPart3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerPart3 state success " + JSON.stringify(pages));
        if (!("WebViewControllerPart3" == pages.name)) {
          console.info("get WebViewControllerPart3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerPart3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerPart3 page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("WebViewControllerPart3 beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSFORWARD_0100
    * @tc.name       : testAccessForward001
    * @tc.desc       : test accessForward return false
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward001", false, 50520, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSFORWARD_0200
    * @tc.name       : testAccessForward002
    * @tc.desc       : test accessForward return true
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessForward002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessForward002", true, 50522, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSBACKWARD_0100
    * @tc.name       : testAccessBackward001
    * @tc.desc       : test accessBackward return false
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward001", false, 50526, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSBACKWARD_0200
    * @tc.name       : testAccessBackward002
    * @tc.desc       : test accessBackward return true
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessBackward002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessBackward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessBackward002", true, 50528, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0100
    * @tc.name       : testAccessStep001
    * @tc.desc       : test accessStep(1) when has no forward history can return false
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep001', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep001", false, 50530, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0200
    * @tc.name       : testAccessStep002
    * @tc.desc       : test accessStep(1) when has forward history can return true
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep002', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep002", true, 50532, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0300
    * @tc.name       : testAccessStep003
    * @tc.desc       : test accessStep(-1) when has no backward history can return false
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep003', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep003", false, 50534, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_0400
    * @tc.name       : testAccessStep004
    * @tc.desc       : test accessStep(-1) when has backward history can return true
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAccessStep004', 0, async (done: Function) => {
      Utils.emitEvent("testAccessStep004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAccessStep004", true, 50536, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })


  })
}
