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

import { beforeAll, beforeEach, afterEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webCookieManagerErrorCode() {

  describe('WebCookieManagerErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webCookieManagerErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webCookieManagerErrorCode state success " + JSON.stringify(pages));
        if (!("webCookieManagerErrorCode" == pages.name)) {
          console.info("get webCookieManagerErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webCookieManagerErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webCookieManagerErrorCode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("webCookieManagerErrorCode beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebCookieManagerErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("WebCookieManagerErrorCodeTestSuite afterEach end");
      done();
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_GETCOOKIE_0100
     * @tc.name       : testGetCookieError001
     * @tc.desc       : test getCookie error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetCookieError001', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookieError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookieError001", '17100002', 20070, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETCOOKIE_0200
    * @tc.name       : testGetCookieError002
    * @tc.desc       : test getCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetCookieError002', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookieError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookieError002", '17100002', 20071, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETCOOKIE_0300
    * @tc.name       : testGetCookieError003
    * @tc.desc       : test getCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetCookieError003', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookieError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookieError003", '17100002', 20072, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETCOOKIE_0400
    * @tc.name       : testGetCookieError004
    * @tc.desc       : test getCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetCookieError004', 0, async (done: Function) => {
      Utils.emitEvent("testGetCookieError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCookieError004", '17100002', 20073, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0100
    * @tc.name       : testSetCookieError001
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError001', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError001", '17100002', 20080, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0200
    * @tc.name       : testSetCookieError002
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError002', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError002", '17100002', 20081, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0300
    * @tc.name       : testSetCookieError003
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError003', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError003", '17100002', 20082, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0400
    * @tc.name       : testSetCookieError004
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError004', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError004", '17100005', 20083, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETCOOKIE_0500
    * @tc.name       : testSetCookieError005
    * @tc.desc       : test setCookie error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetCookieError005', 0, async (done: Function) => {
      Utils.emitEvent("testSetCookieError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCookieError005", '17100005', 20084, done);
      sendEventByKey('WebCookieManagerErrorCodeButton', 10, '');
    })

  })
}
