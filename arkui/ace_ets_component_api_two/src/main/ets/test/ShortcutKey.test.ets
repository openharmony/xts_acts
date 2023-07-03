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
import input from '@ohos.multimodalInput.keyCode';

export default function ShortcutKeyTest() {

  const SUITE = 'ShortcutKey'
  function sleep(time) {
    let date = new Date()
    let start = date.getSeconds()
    let end = start
    while ( (end - start) < time ) {
      let endDate = new Date()
      end = endDate.getSeconds()
    }
  }

  const arr = ['0', '1','2', '3', '4', '5', '6', '7', '8', '9',
    '-', '=', '`', '[', ']', ';', '\'', ',', '.', '/', ' ', '*', '+',
    'B','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','W']
  const arr_keyCode = [
    input.KeyCode.KEYCODE_0
    ,input.KeyCode.KEYCODE_1
    ,input.KeyCode.KEYCODE_2
    ,input.KeyCode.KEYCODE_3
    ,input.KeyCode.KEYCODE_4
    ,input.KeyCode.KEYCODE_5
    ,input.KeyCode.KEYCODE_6
    ,input.KeyCode.KEYCODE_7
    ,input.KeyCode.KEYCODE_8
    ,input.KeyCode.KEYCODE_9
    ,input.KeyCode.KEYCODE_MINUS
    ,input.KeyCode.KEYCODE_EQUALS
    ,input.KeyCode.KEYCODE_GRAVE
    ,input.KeyCode.KEYCODE_LEFT_BRACKET
    ,input.KeyCode.KEYCODE_RIGHT_BRACKET
    ,input.KeyCode.KEYCODE_SEMICOLON
    ,input.KeyCode.KEYCODE_APOSTROPHE
    ,input.KeyCode.KEYCODE_COMMA
    ,input.KeyCode.KEYCODE_PERIOD
    ,input.KeyCode.KEYCODE_SLASH
    ,input.KeyCode.KEYCODE_SPACE
    ,input.KeyCode.KEYCODE_STAR
    ,input.KeyCode.KEYCODE_PLUS
    ,input.KeyCode.KEYCODE_B
    ,input.KeyCode.KEYCODE_D
    ,input.KeyCode.KEYCODE_E
    ,input.KeyCode.KEYCODE_F
    ,input.KeyCode.KEYCODE_G
    ,input.KeyCode.KEYCODE_H
    ,input.KeyCode.KEYCODE_I
    ,input.KeyCode.KEYCODE_J
    ,input.KeyCode.KEYCODE_K
    ,input.KeyCode.KEYCODE_L
    ,input.KeyCode.KEYCODE_M
    ,input.KeyCode.KEYCODE_N
    ,input.KeyCode.KEYCODE_O
    ,input.KeyCode.KEYCODE_P
    ,input.KeyCode.KEYCODE_Q
    ,input.KeyCode.KEYCODE_R
    ,input.KeyCode.KEYCODE_S
    ,input.KeyCode.KEYCODE_T
    ,input.KeyCode.KEYCODE_U
    ,input.KeyCode.KEYCODE_W
  ]
  const functionKey = Object.keys(FunctionKey).filter(key => typeof FunctionKey[key] === 'number')
  const arr_keyCode2 = [
    input.KeyCode.KEYCODE_ESCAPE
    ,input.KeyCode.KEYCODE_F1
    ,input.KeyCode.KEYCODE_F2
    ,input.KeyCode.KEYCODE_F3
    ,input.KeyCode.KEYCODE_F4
    ,input.KeyCode.KEYCODE_F5
    ,input.KeyCode.KEYCODE_F6
    ,input.KeyCode.KEYCODE_F7
    ,input.KeyCode.KEYCODE_F8
    ,input.KeyCode.KEYCODE_F9
    ,input.KeyCode.KEYCODE_F10
    ,input.KeyCode.KEYCODE_F11
    ,input.KeyCode.KEYCODE_F12
  ]

  const baseEvent = 62000
  const baseEvent2 = 73000

  describe('ShortcutKeyTest', function () {

    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/ShortcutKey",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("ShortcutKey" == pages.name)) {
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
     *tc.number ArkUI_Shortcut_Key_0100
     *tc.name   Custom keyboard shortcuts
     *tc.desc   Custom keyboard shortcuts
     */
    it('ArkUI_Shortcut_Key_0100', 0, async function (done) {
      let CASE = 'ArkUI_Shortcut_Key_0100'
      console.info(`${SUITE} ${CASE} START`);

      let start = 0
      let end = arr.length
      let driver = Driver.create()
      for (let i = start; i < end; i++ ) {
        let item = arr[i]

        let callback = (event) => {
          expect(event.data.msg).assertEqual('Ctrl_' + item);
          console.info(`${SUITE} ${CASE} event.data.msg:` + i + ',' + event.data.msg);
          if ( i == end - 1 ) {
            done()
          }
        }
        let event = {
          eventId: baseEvent + i,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);
        await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, arr_keyCode[i])
      }
      sleep(2)

      console.info(`${SUITE} ${CASE} END`);
    });

    /*
     *tc.number ArkUI_Shortcut_Key_0200
     *tc.name   Custom keyboard shortcuts
     *tc.desc   Custom keyboard shortcuts
     */
    it('ArkUI_Shortcut_Key_0200', 0, async function (done) {
      let CASE = 'ArkUI_Shortcut_Key_0200'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event) => {
        expect(event.data.msg).assertEqual('Shift_1');
        console.info(`${SUITE} ${CASE} event.data.msg:` + event.data.msg);
        done()
      }
      let event = {
        eventId: 72002,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      sleep(2)
      let driver = Driver.create()
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_SHIFT_LEFT, input.KeyCode.KEYCODE_1);

      console.info(`${SUITE} ${CASE} END`);
    });

    /*
     *tc.number ArkUI_Shortcut_Key_0300
     *tc.name   Custom keyboard shortcuts
     *tc.desc   Custom keyboard shortcuts
     */
    it('ArkUI_Shortcut_Key_0300', 0, async function (done) {
      let CASE = 'ArkUI_Shortcut_Key_0300'
      console.info(`${SUITE} ${CASE} START`);

      let callback = (event) => {
        expect(event.data.msg).assertEqual('Alt_Q');
        console.info(`${SUITE} ${CASE} event.data.msg:` + event.data.msg);
        done()
      }
      let event = {
        eventId: 72003,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      sleep(2)
      let driver = Driver.create()
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_ALT_LEFT, input.KeyCode.KEYCODE_Q);

      console.info(`${SUITE} ${CASE} END`);
    });

    /*
     *tc.number ArkUI_Shortcut_Key_0400
     *tc.name   Custom keyboard shortcuts
     *tc.desc   Custom keyboard shortcuts
     */
    it('ArkUI_Shortcut_Key_0400', 0, async function (done) {
      let CASE = 'ArkUI_Shortcut_Key_0400'
      console.info(`${SUITE} ${CASE} START`);

      let start = 0
      let end = functionKey.length
      sleep(2)
      let driver = Driver.create()
      for (let i = start; i < end; i++ ) {
        let item = functionKey[i]

        let callback = (event) => {
          expect(event.data.msg).assertEqual('Ctrl_' + item);
          console.info(`${SUITE} ${CASE} event.data.msg:` + i + ',' + event.data.msg);
          if ( i == end - 1 ) {
            done()
          }
        }
        let event = {
          eventId: baseEvent2 + i,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);
        await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, arr_keyCode2[i])
      }

      console.info(`${SUITE} ${CASE} END`);
    });

  })
}
