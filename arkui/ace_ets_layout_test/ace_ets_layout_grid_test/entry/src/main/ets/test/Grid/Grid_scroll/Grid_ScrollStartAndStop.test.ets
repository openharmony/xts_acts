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

export default function Grid_ScrollStartandStop() {
  describe('Grid_ScrollStartandStop', function () {
    beforeEach(async function (done) {
      console.info("Grid_ScrollStartandStop beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ScrollStartAndStop",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ScrollStartandStop state pages:" + JSON.stringify(pages));
        if (!("Grid_ScrollStartandStop" == pages.name)) {
          console.info("get Grid_ScrollStartandStop pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ScrollStartandStop page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ScrollStartandStop page error:" + err);
      }
      console.info("Grid_ScrollStartandStop beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("Grid_ScrollStartandStop after each called");
    });

    /**
     * @tc.number    SUB_ACE_Grid_ScrollStartandStop_0100
     * @tc.name      testGrid
     * @tc.desc      Scroller with animation, sliding triggers onScrollStart and onScrollStop
     */
    it('Grid_ScrollStartandStop_0100', 0, async function (done) {

      console.info('[Grid_ScrollStartandStop_0100] START');
      let driver = Driver.create()
      let button= await driver.findComponent(ON.id('button_grid_scroller_animation'))
      await button.click()
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('Grid_ScrollStartandStop_tex1')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ScrollStartandStop_0100] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onScrollStart');

      let strJson2 = getInspectorByKey('Grid_ScrollStartandStop_tex2')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ScrollStartandStop_0100] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onScrollStop');

      console.info('[Grid_ScrollStartandStop_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ScrollStartandStop_0200
     * @tc.name      testGrid
     * @tc.desc      Scroller without animation, sliding triggers onScrollStart and onScrollStop
     */
    it('Grid_ScrollStartandStop_0200', 0, async function (done) {

      console.info('[Grid_ScrollStartandStop_0200] START');
      let driver = Driver.create()
      let button= await driver.findComponent(ON.id('button_grid_scroller_noanimation'))
      await button.click()
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('Grid_ScrollStartandStop_tex1')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ScrollStartandStop_0200] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('');

      let strJson2 = getInspectorByKey('Grid_ScrollStartandStop_tex2')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ScrollStartandStop_0200] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('');

      console.info('[Grid_ScrollStartandStop_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ScrollStartandStop_0300
     * @tc.name      testGrid
     * @tc.desc      Trigger onScrollStart when grid sliding starts and onScrollStop when sliding stops
     */
    it('Grid_ScrollStartandStop_0300', 0, async function (done) {

      console.info('[Grid_ScrollStartandStop_0300] START');
      let gridRect = CommonFunc.getComponentRect('Grid_ScrollStartandStop_grid')
      let driver = Driver.create()
      await driver.swipe(
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.9+gridRect.top),
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.1+gridRect.top),
        1000);     
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollStartandStop_tex1')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ScrollStartandStop_0300] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onScrollStart');

      let strJson2 = getInspectorByKey('Grid_ScrollStartandStop_tex2')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ScrollStartandStop_0300] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onScrollStop');

      console.info('[Grid_ScrollStartandStop_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ScrollStartandStop_0400
     * @tc.name      testGrid
     * @tc.desc      When scrollBar starts sliding, onScrollStart is triggered, and when sliding stops, onScrollStop is triggered
     */
    it('Grid_ScrollStartandStop_0400', 0, async function (done) {

      console.info('[Grid_ScrollStartandStop_0400] START');
      let scrollBarRect= CommonFunc.getComponentRect('Grid_ScrollStartandStop_scrollBar')
	    let driver = Driver.create()
	    await driver.swipe(
        parseInt((scrollBarRect.right-scrollBarRect.left)*0.5+scrollBarRect.left),
        parseInt((scrollBarRect.bottom-scrollBarRect.top)*0.1+scrollBarRect.top),
        parseInt((scrollBarRect.right-scrollBarRect.left)*0.5+scrollBarRect.left),
        parseInt((scrollBarRect.bottom-scrollBarRect.top)*0.9+scrollBarRect.top),
        1000);    
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollStartandStop_tex1')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ScrollStartandStop_0400] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onScrollStart');

      let strJson2 = getInspectorByKey('Grid_ScrollStartandStop_tex2')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ScrollStartandStop_0400] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onScrollStop');

      console.info('[Grid_ScrollStartandStop_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_ScrollStartandStop_0500
     * @tc.name      testGrid
     * @tc.desc      Trigger onScrollStart when the grid quickly slides, and onScrollStop when the slide stops
     */
    it('Grid_ScrollStartandStop_0500', 0, async function (done) {

      console.info('[Grid_ScrollStartandStop_0500] START');
      let gridRect = CommonFunc.getComponentRect('Grid_ScrollStartandStop_grid')
      let driver = Driver.create()
      await driver.fling({x: parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left), y: parseInt((gridRect.bottom-gridRect.top)*0.5+gridRect.top)},
	    {x: parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left), y: parseInt((gridRect.bottom-gridRect.top)*0.3+gridRect.top)},5,1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollStartandStop_tex1')
      let obj1 = JSON.parse(strJson1)
      console.info("[Grid_ScrollStartandStop_0500] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onScrollStart');

      let strJson2 = getInspectorByKey('Grid_ScrollStartandStop_tex2')
      let obj2 = JSON.parse(strJson2)
      console.info("[Grid_ScrollStartandStop_0500] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onScrollStop');

      console.info('[Grid_ScrollStartandStop_0500] END');
      done();
    });




  })
}
