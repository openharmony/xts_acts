/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';

export default function Grid_ReachStartAndEnd() {
  describe('Grid_ReachStartAndEnd', function () {
    beforeEach(async function (done) {
      console.info("Grid_ReachStartAndEnd beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ReachStartAndEnd",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ReachStartAndEnd state pages:" + JSON.stringify(pages));
        if (!("Grid_ReachStartAndEnd" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ReachStartAndEnd page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd page error:" + err);
      }
      console.info("Grid_ReachStartAndEnd beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("Grid_ReachStartAndEnd after each called");
    });


    /**
     * @tc.number    SUB_ACE_Grid_ReachStartAndEnd_0100
     * @tc.name      testGrid
     * @tc.desc      Sliding the grid to the end position triggers the onReachEnd event, and sliding to the start position triggers the onReachStart event
     */
    it('Grid_ReachStartAndEnd_0100', 0, async function (done) {
      console.info('[Grid_ReachStartAndEnd_0100] START');
	    let gridRect = CommonFunc.getComponentRect('Grid_ReachStartAndEnd_grid')
      let driver = Driver.create()
      await driver.swipe(
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.9+gridRect.top),
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.1+gridRect.top),
        1000);     
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ReachStartAndEnd_tex2')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ReachStartAndEnd_0100] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onReachEnd');

      await driver.swipe(
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.1+gridRect.top),
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.9+gridRect.top),
        1000);   
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('Grid_ReachStartAndEnd_tex1')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ReachStartAndEnd_0100] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ReachStartAndEnd_0200
     * @tc.name      testGrid
     * @tc.desc      Sliding the scrollBar to the end position triggers the onReachEnd event, and sliding to the start position triggers the onReachStart event
     */
    it('Grid_ReachStartAndEnd_0200', 0, async function (done) {
      console.info('[Grid_ReachStartAndEnd_0200] START');
	    let scrollBarRect= CommonFunc.getComponentRect('Grid_ReachStartAndEnd_scrollBar')
	    let driver = Driver.create()
	    await driver.swipe(
        parseInt((scrollBarRect.right-scrollBarRect.left)*0.5+scrollBarRect.left),
        parseInt((scrollBarRect.bottom-scrollBarRect.top)*0.1+scrollBarRect.top),
        parseInt((scrollBarRect.right-scrollBarRect.left)*0.5+scrollBarRect.left),
        parseInt((scrollBarRect.bottom-scrollBarRect.top)*0.9+scrollBarRect.top),
        1000);    
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ReachStartAndEnd_tex2')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ReachStartAndEnd_0200] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onReachEnd');

      await driver.swipe(
        parseInt((scrollBarRect.right-scrollBarRect.left)*0.5+scrollBarRect.left),
        parseInt((scrollBarRect.bottom-scrollBarRect.top)*0.9+scrollBarRect.top),
        parseInt((scrollBarRect.right-scrollBarRect.left)*0.5+scrollBarRect.left),
        parseInt((scrollBarRect.bottom-scrollBarRect.top)*0.1+scrollBarRect.top),
        1000);   
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('Grid_ReachStartAndEnd_tex1')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ReachStartAndEnd_0200] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ReachStartAndEnd_0300
     * @tc.name      testGrid
     * @tc.desc      Scroll to the end position to trigger the onReachEnd event, and slide to the start position to trigger the onReachStart event
     */
    it('Grid_ReachStartAndEnd_0300', 0, async function (done) {
      console.info('[Grid_ReachStartAndEnd_0300] START');
      let driver = Driver.create()
      let button1= await driver.findComponent(ON.id('Grid_ReachStartAndEnd_toBottom'))
      await button1.click()
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ReachStartAndEnd_tex2')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ReachStartAndEnd_0300] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onReachEnd');

      let button2= await driver.findComponent(ON.id('Grid_ReachStartAndEnd_toTop'))
      await button2.click()
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('Grid_ReachStartAndEnd_tex1')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ReachStartAndEnd_0300] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ReachStartAndEnd_0400
     * @tc.name      testGrid
     * @tc.desc      When initializing the Grid, an initialIndex of 0 will trigger an onReachStart event
     */
    it('Grid_ReachStartAndEnd_0400', 0, async function (done) {
      console.info('[Grid_ReachStartAndEnd_0400] START');
      let strJson = getInspectorByKey('Grid_ReachStartAndEnd_tex1')
      let obj = JSON.parse(strJson)
      console.info("[Grid_ReachStartAndEnd_0400] component obj is: " + JSON.stringify(obj))
      expect(obj.$attrs.content).assertEqual('onReachStart1');

      console.info('[Grid_ReachStartAndEnd_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ReachStartAndEnd_0500
     * @tc.name      testGrid
     * @tc.desc      Dynamically changing the padding attribute value of the grid and sliding it to the starting position triggers the onReachStart event
     */
    it('Grid_ReachStartAndEnd_0500', 0, async function (done) {
      console.info('[Grid_ReachStartAndEnd_0500] START');

      let driver = Driver.create()
      let button1= await driver.findComponent(ON.id('Grid_ReachStartAndEnd_changePadding'))
      await button1.click()

      let gridRect = CommonFunc.getComponentRect('Grid_ReachStartAndEnd_grid')
      await driver.swipe(
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.9+gridRect.top),
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.1+gridRect.top),
        1000);     
      await CommonFunc.sleep(2000);

      await driver.swipe(
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.1+gridRect.top),
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.9+gridRect.top),
        1000);     
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('Grid_ReachStartAndEnd_tex1')
      let obj = JSON.parse(strJson)
      console.info("[Grid_ReachStartAndEnd_0500] component obj is: " + JSON.stringify(obj))
      expect(obj.$attrs.content).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd_0500] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ReachStartAndEnd_0600
     * @tc.name      testGrid
     * @tc.desc      Quickly sliding the grid to the end position triggers the onReachEnd event
     */
    it('Grid_ReachStartAndEnd_0600', 0, async function (done) {
      console.info('[Grid_ReachStartAndEnd_0600] START');
	    let gridRect = CommonFunc.getComponentRect('Grid_ReachStartAndEnd_grid')
      let driver = Driver.create()
      await driver.fling({x: parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left), y: parseInt((gridRect.bottom-gridRect.top)*0.5+gridRect.top)},
	    {x: parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left), y: parseInt((gridRect.bottom-gridRect.top)*0.3+gridRect.top)},5,2000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ReachStartAndEnd_tex2')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ReachStartAndEnd_0600] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onReachEnd');
  
      console.info('[Grid_ReachStartAndEnd_0600] END');
      done();
    });


  })
}
