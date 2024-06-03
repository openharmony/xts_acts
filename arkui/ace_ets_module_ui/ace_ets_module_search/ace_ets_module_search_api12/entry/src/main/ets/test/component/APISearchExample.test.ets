/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function APISearchExample() {
  describe('APISearchExample', function () {
    beforeEach(async function (done) {
      console.info("APISearchExampleTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/APISearchExample',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APISearchExample state pages: " + JSON.stringify(pages));
        if (!("APISearchExample" == pages.name)) {
          console.info("get APISearchExample pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push APISearchExample page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APISearchExample page error: " + err);
      }
      await Utils.sleep(1000)
      console.info("APISearchExample beforeEach end");
      done()
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("APISearchExample after each called");
    })

    /**
     * @tc.number api
     * @tc.name   APISearchExample_0100
     * @tc.desc   APISearchExample_0100
     * @tc.size   APISearchExample
     * @tc.type   Function
     * @tc.level  2
     */
    it('APISearchExample_0100', 0, async function (done) {
      console.info('APISearchExample_0100 START');
      let driver = await Driver.create()
      let textComponent = await driver.findComponent(ON.id('APISearchExample_Search'));
      await textComponent.click()
      await Utils.sleep(1000);
      await textComponent.inputText("DFE")
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APISearchExample_Text01');
      let obj = JSON.parse(strJson);
      console.info("[APISearchExample_0100] component obj is: " + JSON.stringify(obj), obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('done');
      console.info('[APISearchExample_0100] END');
      done();
    });
    /**
     * @tc.number api
     * @tc.name   APISearchExample_0200
     * @tc.desc   APISearchExample_0200
     * @tc.size   APISearchExample
     * @tc.type   Function
     * @tc.level  2
     */
    it('APISearchExample_0200', 0, async function (done) {
      console.info('APISearchExample_0200 START');
      let driver = await Driver.create()
      let textComponent = await driver.findComponent(ON.id('APISearchExample_Search'));
      await textComponent.inputText("1")
      await Utils.sleep(1000);
      await textComponent.clearText();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APISearchExample_Text02');
      let obj = JSON.parse(strJson);
      console.info("[APISearchExample_0200] component obj is: " + JSON.stringify(obj), obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('done');
      console.info('[APISearchExample_0200] END');
      done();
    });
    /**
     * @tc.number api
     * @tc.name   APISearchExample_0300
     * @tc.desc   APISearchExample_0300
     * @tc.size   APISearchExample
     * @tc.type   Function
     * @tc.level  2
     */
    it('APISearchExample_0300', 0, async function (done) {
      console.info('APISearchExample_0200 START');
      let driver = await Driver.create()
      let textComponent = await driver.findComponent(ON.id('APISearchExample_Search'));
      await textComponent.click()
      await Utils.sleep(1000);
      await textComponent.inputText("123");
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APISearchExample_Text03');
      let obj = JSON.parse(strJson);
      console.info("[APISearchExample_0300] component obj is: " + JSON.stringify(obj), obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('init');
      console.info('[APISearchExample_0300] END');
      done();
    });

    /**
     * @tc.number api
     * @tc.name   APISearchExample_0400
     * @tc.desc   APISearchExample_0400
     * @tc.size   APISearchExample
     * @tc.type   Function
     * @tc.level  2
     */
    it('APISearchExample_0400', 0, async function (done) {
      console.info('APISearchExample_0200 START');
      let driver = await Driver.create()
      let textComponent = await driver.findComponent(ON.id('APISearchExample_Search'));
      await textComponent.click()
      await Utils.sleep(1000);
      await textComponent.inputText("2")
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('APISearchExample_Text04');
      let obj = JSON.parse(strJson);
      console.info("[APISearchExample_0200] component obj is: " + JSON.stringify(obj), obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('init');
      console.info('[APISearchExample_0200] END');
      done();
    });
  })
}