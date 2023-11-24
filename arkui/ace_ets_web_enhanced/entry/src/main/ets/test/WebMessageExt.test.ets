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

export default function webMessageExt() {

  describe('webMessageExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webMessageExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webMessageExt state success " + JSON.stringify(pages));
        if (!("webMessageExt" == pages.name)) {
          console.info("get webMessageExt state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webMessageExt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webMessageExt page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webMessageExt beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0100
    * @tc.name       : testWebMessageExGetType001
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType001", 1, 20260, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0200
    * @tc.name       : testWebMessageExGetType002
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType002", 2, 20261, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0300
    * @tc.name       : testWebMessageExGetType003
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType003", 3, 20262, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0400
    * @tc.name       : testWebMessageExGetType004
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType004", 4, 20263, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0500
    * @tc.name       : testWebMessageExGetType005
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType005", 5, 20264, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0600
    * @tc.name       : testWebMessageExGetType006
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType006", 6, 20265, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0100
    * @tc.name       : testWebMessageExtSetType001
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType001", 0, 36000, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0200
    * @tc.name       : testWebMessageExtSetType002
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType002", 1, 36001, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0300
    * @tc.name       : testWebMessageExtSetType003
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType003", 2, 36002, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0400
    * @tc.name       : testWebMessageExtSetType004
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType004", 3, 36003, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0500
    * @tc.name       : testWebMessageExtSetType005
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType005", 4, 36004, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0600
    * @tc.name       : testWebMessageExtSetType006
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("`testWebMessageExtSetType006`", 5, 36005, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0700
    * @tc.name       : testWebMessageExtSetType007
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType007', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType007", 6, 36006, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

  })
}
