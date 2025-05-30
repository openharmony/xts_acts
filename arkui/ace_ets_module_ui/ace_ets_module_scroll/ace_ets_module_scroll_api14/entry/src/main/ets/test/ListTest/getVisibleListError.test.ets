/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function getVisibleListError() {
  describe('getVisibleListError', () => {
    beforeEach(async (done: Function) => {
      console.info("getVisibleListError beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/getVisibleListError",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getVisibleListError state pages:" + JSON.stringify(pages));
        if (!("getVisibleListError" == pages.name)) {
          console.info("get getVisibleListError pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getVisibleListError page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getVisibleListError page error:" + err);
      }
      console.info("getVisibleListError beforeEach end");
      done();
    });

    /**
     * @tc.number    getVisibleListError_001
     * @tc.name      getVisibleListError_0100
     * @tc.desc      401 error code for getVisibleListContentInfo.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('getVisibleListError_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[getVisibleListError_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('getVisibleList_401'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('getVisibleList_err_text');
      console.info("[getVisibleListError_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getVisibleListError_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('getVisibleListContentInfo: 401');
      console.info('[getVisibleListError_0100] END');
      done();
    });

    /**
     * @tc.number    getVisibleListError_002
     * @tc.name      getVisibleListError_0200
     * @tc.desc      100004 error code for getVisibleListContentInfo.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('getVisibleListError_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[getVisibleListError_0200] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('getVisibleList_100004'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('getVisibleList_err_text');
      console.info("[getVisibleListError_0200] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getVisibleListError_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('getVisibleListContentInfo: 100004');
      console.info('[getVisibleListError_0200] END');
      done();
    });

    /**
     * @tc.number    getVisibleListError_003
     * @tc.name      getVisibleListError_0300
     * @tc.desc      401 error code for closeAllSwipeActions.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('getVisibleListError_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[getVisibleListError_0300] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('closeAllSwipe_401'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('closeAllSwipe_err_text');
      console.info("[getVisibleListError_0300] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getVisibleListError_0300] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('closeAllSwipeActions: 401');
      console.info('[getVisibleListError_0300] END');
      done();
    });

    /**
     * @tc.number    getVisibleListError_004
     * @tc.name      getVisibleListError_0400
     * @tc.desc      100004 error code for closeAllSwipeActions.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('getVisibleListError_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[getVisibleListError_0400] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('closeAllSwipe_100004'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('closeAllSwipe_err_text');
      console.info("[getVisibleListError_0400] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getVisibleListError_0400] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('closeAllSwipeActions: 100004');
      console.info('[getVisibleListError_0400] END');
      done();
    });
  })
}
