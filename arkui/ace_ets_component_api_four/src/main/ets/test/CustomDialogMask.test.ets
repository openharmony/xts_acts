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
export default function CustomDialogMaskTest() {

  const SUITE = 'CustomDialogMask'
  const waitUiReadyMs = 500;
  function sleep(time) {
    let date = new Date()
    let start = date.getSeconds()
    let end = start
    while ( (end - start) < time ) {
      let endDate = new Date()
      end = endDate.getSeconds()
    }
  }

  describe('CustomDialogMaskTest', function () {

    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/CustomDialogMask",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("CustomDialogMask" == pages.name)) {
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
     *tc.number ArkUI_CustomDialog_Mask_0100
     *tc.name   CustomDialogController#maskColor not set
     *tc.desc   CustomDialogController#maskColor not set
     */
    it('ArkUI_CustomDialog_Mask_0100', 0, async function (done) {
      let CASE = 'ArkUI_CustomDialog_Mask_0100'
      console.info(`${SUITE} ${CASE} START`);

      sleep(2)
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_1', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj = getInspectorByKey('CustomDialogMask_Button_Close_1');
      let obj = JSON.parse(strObj);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")

      console.info(`${SUITE} ${CASE} END`);
      sleep(1)
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask0200
     *tc.name   CustomDialogController#maskColor set by Color
     *tc.desc   CustomDialogController#maskColor set by Color
     */
    it('ArkUI_CustomDialog_Mask0200', 0, async function (done) {
      let CASE = 'ArkUI_CustomDialog_Mask0200'
      console.info(`${SUITE} ${CASE} START`);

      sleep(1)
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_2', 10, "")
      await driver.delayMs(waitUiReadyMs)

      let strObj = getInspectorByKey('CustomDialogMask_Button_Close_1');
      let obj = JSON.parse(strObj);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")

      console.info(`${SUITE} ${CASE} END`);
      sleep(1)
     done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask0300
     *tc.name   CustomDialogController#maskColor set by string
     *tc.desc   CustomDialogController#maskColor set by string
     */
    it('ArkUI_CustomDialog_Mask0300', 0, async function (done) {
      let CASE = 'ArkUI_CustomDialog_Mask0300'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_3', 10, "")
      await driver.delayMs(waitUiReadyMs)

      let strObj = getInspectorByKey('CustomDialogMask_Button_Close_1');
      let obj = JSON.parse(strObj);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")

      console.info(`${SUITE} ${CASE} END`);
      sleep(1)
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask0400
     *tc.name   CustomDialogController#maskColor set by Resource
     *tc.desc   CustomDialogController#maskColor set by Resource
     */
    it('ArkUI_CustomDialog_Mask0400', 0, async function (done) {
      let CASE = 'ArkUI_CustomDialog_Mask0400'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_4', 10, "")
      await driver.delayMs(waitUiReadyMs)

      let strObj = getInspectorByKey('CustomDialogMask_Button_Close_1');
      let obj = JSON.parse(strObj);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")

      console.info(`${SUITE} ${CASE} END`);
      sleep(1)
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask0500
     *tc.name   CustomDialogController#maskColor set by number
     *tc.desc   CustomDialogController#maskColor set by number
     */
    it('ArkUI_CustomDialog_Mask0500', 0, async function (done) {
      let CASE = 'ArkUI_CustomDialog_Mask0500'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      sendEventByKey('CustomDialogMask_Button_Open_5', 10, "")
      await driver.delayMs(waitUiReadyMs)

      let strObj = getInspectorByKey('CustomDialogMask_Button_Close_1');
      let obj = JSON.parse(strObj);
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")

      console.info(`${SUITE} ${CASE} END`);
      sleep(1)
      done()
    });


  })
}
