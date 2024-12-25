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
import { beforeAll, beforeEach, describe, it, expect, afterEach } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import webView from '@ohos.web.webview';

export default function HitTest() {

  describe('HitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/HitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HitTest state success " + JSON.stringify(pages));
        if (!("HitTest" == pages.name)) {
          console.info("get HitTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push HitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HitTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web afterEach finish");
      done();
    })


    /*
     * @tc.number     : Acts_setHostIP_0100
     * @tc.name       : testSetHostIP001
     * @tc.desc       : test DNSHostIP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('zoomAccess', 0, async (done: Function) => {
      Utils.emitEvent("emitZoomAccess", 10)
      Utils.registerEvent("zoomAccess", false, 428, done);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let StartModel = await driver.findComponent(ON.id("DNSHostIP"));
      await StartModel.click();
      await Utils.sleep(1000);
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_012                                                                                                                                                             
     *tc.name GetHitTestValue                                                                                                                                                                                                               
     *tc.desic get the type of th clicked component
     */
    it('GetHitTestValue', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue", 10)
      Utils.registerEvent("GetHitTestValue", "hitValue", 12, done);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let StartModel = await driver.findComponent(ON.id("DNSHostIP"));
      await StartModel.click();
      await Utils.sleep(1000);
    })
  })
}
