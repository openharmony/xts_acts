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
import router from '@system.router'
import { Driver, ON } from '@ohos.UiTest'

export default function abilityTest() {
  const SUITE = 'Breadcrumb'
  describe('ActsAceBreadcrumbTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: "../testability/pages/Index",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("Index" == pages.name)) {
          let driver = Driver.create()
          await router.push(options);
          await driver.delayMs(2000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    })

    afterEach(async function (done) {
      let driver = Driver.create()
      await driver.delayMs(2);
      done()
    })

    /*
    *tc.number Advanced_ui_Breadcrumb_0100
    *tc.name   Breadcrumb fold UI test
    *tc.desc   Test the fold rules of Breadcrumb
    */
    it('Advanced_ui_Breadcrumb_0100', 0, async function (done) {
      let driver = Driver.create()
      let label0 = await driver.findComponent(ON.text('label0'))
      let label0IsEnabled = await label0.isEnabled()
      expect(label0IsEnabled).assertTrue()

      let setWidthButton480 = await driver.findComponent(ON.text('set width to 480'))
      if (await setWidthButton480.isClickable()) {
        await setWidthButton480.click()
        await driver.assertComponentExist(ON.text('···'))
      }

      let setWidthButton1000 = await driver.findComponent(ON.text('set width to 1000'))
      if (await setWidthButton1000.isClickable()) {
        await setWidthButton1000.click()
        await driver.assertComponentExist(ON.text('label4'))
      }
      done()
    })

    /*
    *tc.number Advanced_ui_Breadcrumb_0200
    *tc.name   Label click test
    *tc.desc   Click any un-selected label and the click callback is received
    */
    it('Advanced_ui_Breadcrumb_0200', 0, async function (done) {
      let driver = Driver.create()

      let setWidthButton480 = await driver.findComponent(ON.text('set width to 480'))
      if (await setWidthButton480.isClickable()) {
        await setWidthButton480.click()
        await driver.assertComponentExist(ON.text('···'))
      }

      let label0 = await driver.findComponent(ON.text('label0'))
      if (await label0.isClickable()) {
        await label0.click()
        await driver.assertComponentExist(ON.text('label 0 clicked'))
      }
      done()
    })
  })
}