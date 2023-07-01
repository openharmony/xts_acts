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
export default function TextAreaSelectTest() {

  const SUITE = 'TextAreaSelect'
  const waitUiReadyMs = 500;

  describe('TextAreaSelectTest', function () {

    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/TextAreaSelect",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("TextAreaSelect" == pages.name)) {
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
     *tc.number ArkUI_TextArea_Select_0100
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0100', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0100'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_1', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("0");

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0200
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0200', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0200'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_2', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0300
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0300', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0300'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_3', 10, "")
      await driver.delayMs(waitUiReadyMs*5)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("3");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0400
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0400', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0400'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_4', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("3");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0500
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0500', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0500'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_5', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0600
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0600', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0600'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_6', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0700
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0700', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0700'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_7', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0800
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0800', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0800'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_8', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("6");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_0900
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_0900', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_0900'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_9', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1000
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1000', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_1000'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_10', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1100
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1100', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_1100'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_11', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1200
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1200', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_1200'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_12', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1300
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1300', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_1300'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_13', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_2');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("0");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUI_TextArea_Select_1400
     *tc.name   Textarea support selecting text by setting start and end of cursor
     *tc.desc   Textarea support selecting text by setting start and end of cursor
     */
    it('ArkUI_TextArea_Select_1400', 0, async function (done) {
      let CASE = 'ArkUI_TextArea_Select_1400'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_TextArea_3', 10, "")
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('TextAreaSelect_Button_14', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strJson = getInspectorByKey('TextAreaSelect_TextArea_3');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.caretPosition).assertEqual("10");
      await driver.delayMs(waitUiReadyMs)

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

  })
}
