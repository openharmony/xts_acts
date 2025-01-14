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

export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewControllerPart2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewControllerPart2 state success " + JSON.stringify(pages));
        if (!("webViewControllerPart2" == pages.name)) {
          console.info("get webViewControllerPart2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webViewControllerPart2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewControllerPart2 page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewControllerPart2 beforeEach start");
      done();
    })


    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHALLASYNC_0100
    * @tc.name       : testSearchAllAsync001
    * @tc.desc       : test searchAllAsync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSearchAllAsync001', 0, async (done: Function) => {
      Utils.emitEvent("testSearchAllAsync001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSearchAllAsync001", 2, 37012, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_0100
    * @tc.name       : testSearchNext001
    * @tc.desc       : test searchNext
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSearchNext001', 0, async (done: Function) => {
      Utils.emitEvent("testSearchNext001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSearchNext001", true, 100080, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_0200
    * @tc.name       : testSearchNext002
    * @tc.desc       : test searchNext
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSearchNext002', 0, async (done: Function) => {
      Utils.emitEvent("testSearchNext002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSearchNext002", true, 100081, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0100
    * @tc.name       : testStoreWebArchive001
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive001', 0, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchive001", "/data/storage/el2/base/index.html.mht", 37013, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0200
    * @tc.name       : testStoreWebArchive002
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive002', 0, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchive002", "/data/storage/el2/base/second.html.mht", 37014, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0300
    * @tc.name       : testStoreWebArchive003
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive003', 0, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchive003", "/data/storage/el2/base/index.html.mht", 37015, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0400
    * @tc.name       : testStoreWebArchive004
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive004', 0, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchive004", "/data/storage/el2/base/index.html.mht", 37016, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })


  })
}
