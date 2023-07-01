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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'
import {UiDriver, UiComponent, BY, Driver, Component, ON} from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
export default function BindMenuTest() {

  const SUITE = 'BindMenu'
  const waitUiReadyMs = 500;

  describe('BindMenuTest', function () {

    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/BindMenu",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("BindMenu" == pages.name)) {
          await router.pushUrl(options).then(()=>{
            console.info(`${SUITE} router.pushUrl success`);
          }).catch(err => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_Menu_0100
     *tc.name   Call function bindMenu with MenuOptions
     *tc.desc   Call function bindMenu with MenuOptions
     */
    it('ArkUI_Menu_0100', 0, async function (done) {
      let CASE = 'ArkUI_Menu_0100'
      console.info(`${SUITE} ${CASE} START`);


      async function step2() {
        let callback = (event) => {
          expect(event.data.action).assertEqual('onDisappear');
          done();
        }
        let event = {
          eventId: 50001,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);
        let driver = Driver.create()
        await driver.delayMs(waitUiReadyMs)
        sendEventByKey('BindMenu_placeholder', 10, "")
      }

      let callback = (event) => {
        expect(event.data.action).assertEqual('onAppear');
        step2()
      }
      let event = {
        eventId: 50000,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('BindMenu_bindMenu1', 10, "")
      console.info(`${SUITE} ${CASE} END`);

    });

    /*
     *tc.number ArkUI_Menu_0200
     *tc.name   Call function bindContextMenu with MenuOptions
     *tc.desc   Call function bindContextMenu with MenuOptions
     */
    it('ArkUI_Menu_0200', 0, async function (done) {
      let CASE = 'ArkUI_Menu_0200'
      console.info(`${SUITE} ${CASE} START`);


      async function step2() {
        let callback2 = (event) => {
          expect(event.data.action).assertEqual('onDisappear');
          done();
        }
        let event2 = {
          eventId: 60003,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event2, callback2);
        let driver = Driver.create()
        await driver.delayMs(waitUiReadyMs)
        driver.click(100, 400)
      }

      let callback = (event) => {
        expect(event.data.action).assertEqual('onAppear');
        step2()
      }
      let event = {
        eventId: 60002,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('BindMenu_bindContextMenu1', 11, "")
      console.info(`${SUITE} ${CASE} END`);

    });

  })
}
