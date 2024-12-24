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

export default function ScrollPage() {

  describe('ScrollPage', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ScrollPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollPage state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get ScrollPage state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ScrollPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollPage page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0100
    * @tc.name       : testScrollTo001
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo001', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo001", "[0,0]", 100042, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0200
    * @tc.name       : testScrollTo002
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo002', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo002", true, 100043, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0300
    * @tc.name       : testScrollTo003
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo003', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo003", "[0,100]", 100044, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0400
    * @tc.name       : testScrollTo004
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo004', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo004", "[100,0]", 100045, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0500
    * @tc.name       : testScrollTo005
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo005', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo005", true, 100046, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0600
    * @tc.name       : testScrollTo006
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo006', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo006", "[100,100]", 100047, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_0700
    * @tc.name       : testScrollTo007
    * @tc.desc       : test scrollTo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollTo007', 0, async (done: Function) => {
      Utils.emitEvent("testScrollTo007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollTo007", true, 100048, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PAGEDOWN_0100
    * @tc.name       : testPageDown001
    * @tc.desc       : test pageDown
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPageDown001', 0, async (done: Function) => {
      Utils.emitEvent("testPageDown001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageDown001", true, 100063, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PAGEDOWN_0200
    * @tc.name       : testPageDown002
    * @tc.desc       : test pageDown
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPageDown002', 0, async (done: Function) => {
      Utils.emitEvent("testPageDown002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageDown002", true, 100064, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PAGEUP_0100
    * @tc.name       : testPageUp001
    * @tc.desc       : test pageUp
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPageUp001', 0, async (done: Function) => {
      Utils.emitEvent("testPageUp001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageUp001", true, 100065, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PAGEUP_0200
    * @tc.name       : testPageUp002
    * @tc.desc       : test pageUp
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPageUp002', 0, async (done: Function) => {
      Utils.emitEvent("testPageUp002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageUp002", true, 100066, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SLIDESCROLL_0100
    * @tc.name       : testSlideScroll001
    * @tc.desc       : test slideScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSlideScroll001', 0, async (done: Function) => {
      Utils.emitEvent("testSlideScroll001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSlideScroll001", true, 100082, done);
      sendEventByKey('setPathAllowingUniversalAccessButton', 10, '');
    })

    

  })
}
