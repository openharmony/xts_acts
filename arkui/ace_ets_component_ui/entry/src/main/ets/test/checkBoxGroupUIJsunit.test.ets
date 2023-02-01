/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.uitest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
const waitUiReadyMs = 1000;

export default function checkBoxGroupUIJsunit() {
  describe('checkBoxGroupUIJsunit', function () {
    beforeEach(async function (done) {
      console.info("checkBoxJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/checkBoxGroupUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBoxGroupUIJsunit pages:" + JSON.stringify(pages));
        if (!("checkBoxGroupUI" == pages.name)) {
          console.info("get checkBoxGroupUIJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push checkBoxGroupUIJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push checkBoxGroupUI page error:" + err);
	        expect().assertFail();
      }
      done();
    });
    // add default testcase 

    // add enum of resource color test case 

    it('checkBoxGroupUIJsunit_0100', 0, async function (done) {
       console.info('checkBoxGroupUIJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the checkboxGroup component and test attribute
       let strJson = getInspectorByKey('allck');
       console.info("checkBoxGroupUIJsunit_0100 strJson:" + strJson);
       let obj = JSON.parse(strJson);
       console.info("checkBoxGroupUIJsunit_0100 component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.selectAll).assertEqual('true');
       expect(obj.$attrs.selectedColor).assertEqual('#FF007DFF');
       // add assert single checkbox selectedState
       let strJson2 = getInspectorByKey('cb1');
       console.info("checkBoxGroupUIJsunit_cb1_0100 strJson:" + strJson2);
       let obj2 = JSON.parse(strJson2);
       console.info("checkBoxGroupUIJsunit_cb1_0100 component obj2 is: " + JSON.stringify(obj));
       expect(obj2.$attrs.select).assertEqual('true');
       done();
    });

   it('checkBoxGroupUIJsunit_0200', 0, async function (done) {
      console.info('checkBoxGroupUIJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the attribute normal value of checkbox dynamically
      globalThis.value.message.notify({name:'selectAll',value:'false'})
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({name:'selectedColor',value:'#EEAAFF'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('allck');
      let obj = JSON.parse(strJson);
      console.info("[checkBoxGroupUIJsunit_0200'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selectAll).assertEqual('false');
      expect(obj.$attrs.selectedColor).assertEqual('#FFEEAAFF');
      // add assert single checkbox selectedState
      let strJson2 = getInspectorByKey('cb1');
      console.info("checkBoxGroupUIJsunit_cb1_0200 strJson:" + strJson2);
      let obj2 = JSON.parse(strJson2);
      console.info("checkBoxGroupUIJsunit_cb1_0200 component obj2 is: " + JSON.stringify(obj));
      expect(obj2.$attrs.select).assertEqual('false');
      done();
    });

    it('checkBoxGroupUIJsunit_0300', 0, async function (done) {
      console.info('checkBoxGroupUIJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the attribute illegal value of checkbox dynamically
      globalThis.value.message.notify({name:'selectedColor',value:'#eaf'})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('allck');
      let obj = JSON.parse(strJson);
      console.info("[checkBoxGroupUIJsunit_0300 '] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.selectedColor).assertEqual('#FFEEAAFF');
      done();
    });

    it('checkBoxGroupUIJsunit_0400', 0, async function (done) {
      console.info('checkBoxGroupUIJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // test the clicking event of checkboxGroup
      let driver = await UiDriver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkboxAll = await driver.findComponent(BY.key('allck'));
      expect(checkboxAll != null).assertTrue();
      // checkboxGroup click
      await checkboxAll.click();
      await driver.delayMs(waitUiReadyMs);
      // check the click event by text message
      let text1 = await driver.findComponent(BY.text('SelectStatus.All'));
      let text1tt = await text1.getText();
      expect(text1tt == 'SelectStatus.All').assertTrue();
      await checkboxAll.click();
      await driver.delayMs(waitUiReadyMs);
     // add assert single checkbox selectedState
      done();
    });

    it('checkBoxGroupUIJsunit_0500', 0, async function (done) {
      console.info('checkBoxGroupUIJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the clicking event of checkboxGroup
       let driver = await UiDriver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkbox2 = await driver.findComponent(BY.key('cb2'));
      expect(checkbox2 != null).assertTrue();
      await checkbox2.click();
      await driver.delayMs(waitUiReadyMs);
      // test CheckboxGroup atrribute
      let strJson = getInspectorByKey('allck');
       console.info("checkBoxGroupUIJsunit_0500 strJson:" + strJson);
       let obj = JSON.parse(strJson);
       console.info("checkBoxGroupUIJsunit_0500 component obj is: " + JSON.stringify(obj));
       expect(obj.$attrs.selectAll).assertEqual('true'); // false ?
       expect(obj.$attrs.selectedColor).assertEqual('#007DFF');
       //add the select state onchange event  assert
       done();
    });
    // 1.first click  2.two click   test the name and checkboxstate
    
  })
}