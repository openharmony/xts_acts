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
    * @tc.number     : SUB_WEB_HISTORYITEM_ICON_0100
    * @tc.name       : testHistoryItemIcon001
    * @tc.desc       : test HistoryItem icon
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHistoryItemIcon001', 0, async (done: Function) => {
      Utils.emitEvent("testHistoryItemIcon001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHistoryItemIcon001", true, 31023, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HISTORYITEM_HISTORYURL_0100
    * @tc.name       : testHistoryItemHistoryUrl001
    * @tc.desc       : test HistoryItem historyUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHistoryItemHistoryUrl001', 0, async (done: Function) => {
      Utils.emitEvent("testHistoryItemHistoryUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHistoryItemHistoryUrl001", "resource://rawfile/HistoryItem.html", 31024, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HISTORYITEM_HISTORYRAWURL_0100
    * @tc.name       : testHistoryRawUrl001
    * @tc.desc       : test HistoryItem historyRawUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHistoryRawUrl001', 0, async (done: Function) => {
      Utils.emitEvent("testHistoryRawUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHistoryRawUrl001", "resource://rawfile/HistoryItem.html", 31025, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HISTORYITEM_TITLE_0100
    * @tc.name       : testHistoryItemTitle001
    * @tc.desc       : test HistoryItem title
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHistoryItemTitle001', 0, async (done: Function) => {
      Utils.emitEvent("testHistoryItemTitle001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHistoryItemTitle001", "index", 31026, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKFORWARDLIST_CURRENTINDEX_TITLE_0100
    * @tc.name       : testBackForwardListCurrentIndex001
    * @tc.desc       : test BackForwardList CurrentIndex
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackForwardListCurrentIndex001', 0, async (done: Function) => {
      Utils.emitEvent("testBackForwardListCurrentIndex001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackForwardListCurrentIndex001", 0, 31027, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_BACKFORWARDLIST_SIZE_TITLE_0100
    * @tc.name       : testBackForwardListCurrentSize001
    * @tc.desc       : test BackForwardList Size
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackForwardListCurrentSize001', 0, async (done: Function) => {
      Utils.emitEvent("testBackForwardListCurrentSize001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackForwardListCurrentSize001", 1, 31028, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })

  })
}
