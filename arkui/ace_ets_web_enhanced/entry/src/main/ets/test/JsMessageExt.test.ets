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

export default function jsMessageExt() {

  describe('JsMessageExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/jsMessageExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get jsMessageExt state success " + JSON.stringify(pages));
        if (!("jsMessageExt" == pages.name)) {
          console.info("get jsMessageExt state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push jsMessageExt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push jsMessageExt page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("jsMessageExt beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0100
    * @tc.name       : testJsMessageExtGetType001
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType001', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType001", 1, 30200, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0200
    * @tc.name       : testJsMessageExtGetType002
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType002', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType002", 2, 30201, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0300
    * @tc.name       : testJsMessageExtGetType003
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType003', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType003", 3, 30202, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0400
    * @tc.name       : testJsMessageExtGetType004
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType004', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType004", 4, 30203, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0500
    * @tc.name       : testJsMessageExtGetType005
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType005', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType005", 5, 30204, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })


  })
}
