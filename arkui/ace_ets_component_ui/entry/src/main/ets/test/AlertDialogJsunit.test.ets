/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function AlertDialogJsunit() {
  describe('AlertDialogJsunit', function () {
    beforeEach(async function (done) {
      console.info("AlertDialogJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/AlertDialogParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlertDialogJsunit state pages: " + JSON.stringify(pages));
        if (!("AlertDialogParam" == pages.name)) {
          console.info("get AlertDialogJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlertDialogJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlertDialogJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });


    it('AlertDialogJsunit_0100', 0, async function (done) {

      console.info('AlertDialogJsunit_0100 START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('AlertDialog');
      let obj = JSON.parse(strJson);
      console.info("[AlertDialogJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[AlertDialogJsunit_0100] subtitle:" + JSON.stringify(obj.$attrs.subtitle));
      console.info("[AlertDialogJsunit_0100] alignment:" + JSON.stringify(obj.$attrs.alignment));
      console.info("[AlertDialogJsunit_0100] offset:" + JSON.stringify(obj.$attrs.offset));
      console.info("[AlertDialogJsunit_0100] maskRect:" + JSON.stringify(obj.$attrs.maskRect));
      expect(obj.$attrs.subtitle).assertEqual("subtitle");

      console.info('[AlertDialogJsunit_0100] END');
      done();
    });

    it('AlertDialogJsunit_0200', 0, async function (done) {

      console.info('AlertDialogJsunit_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create();
      let btn = await driver.findComponent(BY.key('AlertDialog'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('AlertDialog');
      let obj = JSON.parse(strJson);
      console.info("[AlertDialogJsunit_0200] component  strJson:" + JSON.stringify(obj.$attrs.buttonDirection));
      expect(obj.$attrs.buttonDirection).assertEqual("DialogButtonDirection.AUTO");

      console.info('[AlertDialogJsunit_0200] END');
      done();
    });

    it('AlertDialogJsunit_0300', 0, async function (done) {
      console.info('AlertDialogJsunit_0300 START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'buttonDirection',value:'DialogButtonDirection.HORIZONTAL'})
      let driver = await UiDriver.create();
      let btn = await driver.findComponent(BY.key('AlertDialog'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('AlertDialog');
      let obj = JSON.parse(strJson);
      console.info("[AlertDialogJsunit_0300] component  strJson:" + JSON.stringify(obj.$attrs.buttonDirection));
      expect(obj.$attrs.buttonDirection).assertEqual("DialogButtonDirection.HORIZONTAL ");
      console.info('[AlertDialogJsunit_0300] END');
      done();
    });

    it('AlertDialogJsunit_0400', 0, async function (done) {
      console.info('AlertDialogJsunit_0400 START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'buttonDirection',value:'DialogButtonDirection.VERTICAL'})
      let driver = await UiDriver.create();
      let btn = await driver.findComponent(BY.key('AlertDialog'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('AlertDialog');
      let obj = JSON.parse(strJson);
      console.info("[AlertDialogJsunit_0400] component  strJson:" + JSON.stringify(obj.$attrs.buttonDirection));
      expect(obj.$attrs.buttonDirection).assertEqual("DialogButtonDirection.VERTICAL");
      console.info('[AlertDialogJsunit_0400] END');
      done();
    });
  })
}
