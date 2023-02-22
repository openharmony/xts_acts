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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function ListJsunit() {
  describe('ListJsunit', function () {
    beforeEach(async function (done) {
      console.info("ListJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/ListPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListJsunit state pages: " + JSON.stringify(pages));
        if (!("ListPage" == pages.name)) {
          console.info("get ListJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ListJsunit_0100', 0, async function (done) {
      // Get the information of the List component
      console.info('[ListJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ListJsunit_0100] editMode: " + JSON.stringify(obj.$attrs.editMode));
      console.info("[ListJsunit_0100] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ListJsunit_0100] multiSelectable: " + JSON.stringify(obj.$attrs.multiSelectable));
      console.info("[ListJsunit_0100] alignListItem: " + JSON.stringify(obj.$attrs.alignListItem));
      console.info("[ListJsunit_0100] sticky: " + JSON.stringify(obj.$attrs.sticky));
      console.info("[ListJsunit_0100] lanes: " + JSON.stringify(obj.$attrs.lanes));
      expect(obj.$attrs.space).assertEqual('20.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('0');
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      expect(obj.$attrs.divider.strokeWidth).assertEqual('2.00vp');
      expect(obj.$attrs.divider.color).assertEqual('#FF0000FF');
      expect(obj.$attrs.divider.startMargin).assertEqual('3.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('2.00vp');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Off');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Spring');
      expect(obj.$attrs.lanes).assertEqual('1');
      expect(obj.$attrs.editMode).assertEqual('false');
      expect(obj.$attrs.chainAnimation).assertEqual('false');
      expect(obj.$attrs.multiSelectable).assertEqual('false');
      expect(obj.$attrs.alignListItem).assertEqual('ListItemAlign.End');
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.None');
      console.info('[ListJsunit_0100] END');
      done();
    });

    it('ListJsunit_0200', 0, async function (done) {
      // Verify the functions of the List component
      console.info('[ListJsunit_0200] START');
      
      // Verify onScroll function of List component
      let driver = await UiDriver.create()
      let gridTop = CommonFunc.getComponentRect('grid2');
      let top = gridTop.top
      let gridLeft = CommonFunc.getComponentRect('grid2');
      let left = gridLeft.left
      let gridRight = CommonFunc.getComponentRect('grid2');
      let right = gridRight.right
      await driver.swipe(Math.round(left + 50), Math.round(top + 100), Math.round(right - 50), Math.round(top + 100));
      await CommonFunc.sleep(1000);
      
      let onScrollText = await driver.findComponent(BY.key('onScrollText'));
      console.info("[ListJsunit_0200] onScrollText: " + JSON.stringify(onScrollText));
      let text1 = await onScrollText.getText();
      expect(text1).assertEqual('onScroll:succ');

      // Verify the functions of onReachStart
      await CommonFunc.sleep(200);
      let onReachStartText = await driver.findComponent(BY.key('onReachStartText'));
      console.info("[ListJsunit_0200] onReachStartText: " + JSON.stringify(onReachStartText));
      let text2 = await onReachStartText.getText();
      expect(text2).assertEqual('onReachStart:succ');

      // Verify the functions of onScrollFrameBegin
      await CommonFunc.sleep(200);
      let onScrollBeginText = await driver.findComponent(BY.key('onScrollBeginText'));
      console.info("[ListJsunit_0200] onScrollBeginText: " + JSON.stringify(onScrollBeginText));
      let text3 = await onScrollBeginText.getText();
      expect(text3).assertEqual('onScrollBegin:succ');

      // Verify the functions of onScrollStart
      await CommonFunc.sleep(200);
      let onScrollStartText = await driver.findComponent(BY.key('onScrollStartText'));
      console.info("[ListJsunit_0200] onScrollStartText: " + JSON.stringify(onScrollStartText));
      let text4 = await onScrollStartText.getText();
      expect(text4).assertEqual('onScrollStart:succ');

      // Verify the functions of onScrollStop
      await CommonFunc.sleep(200);
      let onScrollStopText = await driver.findComponent(BY.key('onScrollStopText'));
      console.info("[ListJsunit_0200] onScrollStopText: " + JSON.stringify(onScrollStopText));
      let text5 = await onScrollStopText.getText();
      expect(text5).assertEqual('onScrollStop:succ');

      // Verify the functions of onReachEnd
      await driver.swipe(Math.round(right - 50), Math.round(top + 100), Math.round(left + 50), Math.round(top + 100));
      await driver.swipe(Math.round(right - 50), Math.round(top + 100), Math.round(left + 50), Math.round(top + 100));
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(right - 50), Math.round(top + 100), Math.round(left + 50), Math.round(top + 100));
      await driver.swipe(Math.round(right - 50), Math.round(top + 100), Math.round(left + 50), Math.round(top + 100));
      await driver.swipe(Math.round(right - 50), Math.round(top + 100), Math.round(left + 50), Math.round(top + 100));
      await CommonFunc.sleep(1000);
      let onReachEndText = await driver.findComponent(BY.key('onReachEndText'));
      console.info("[ListJsunit_0200] onReachEndText: " + JSON.stringify(onReachEndText));
      let text= await onReachEndText.getText();
      expect(text).assertEqual('onReachEnd:succ');
      console.info('[ListJsunit_0200] END');
      done();
    });

    it('ListJsunit_0300', 0, async function (done) {
      // Modify the properties of component List
      console.info('[ListJsunit_0300] START');
      globalThis.value.message.notify({name:'space',value:'25'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'initialIndex',value:'1'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'listDirection',value:'Axis.Horizontal'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'strokeWidth',value:'3'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'dividerColor',value:'Color.Black'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'startMargin',value:'5'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'endMargin',value:'4'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'scrollBar',value:'BarState.On'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'cachedCount',value:'2'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'editMode',value:'true'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'edgeEffect',value:'EdgeEffect.Fade'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'chainAnimation',value:'true'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'lanes',value:'5'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'multiSelectable',value:'true'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'alignListItem',value:'ListItemAlign.Start'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'sticky',value:'StickyStyle.Header'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the List component
      let strJson = getInspectorByKey('list');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ListJsunit_0300] editMode: " + JSON.stringify(obj.$attrs.editMode));
      console.info("[ListJsunit_0300] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ListJsunit_0300] multiSelectable: " + JSON.stringify(obj.$attrs.multiSelectable));
      console.info("[ListJsunit_0300] alignListItem: " + JSON.stringify(obj.$attrs.alignListItem));
      console.info("[ListJsunit_0300] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.space).assertEqual('25.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('1');
      expect(obj.$attrs.listDirection).assertEqual('Axis.Horizontal');
      expect(obj.$attrs.divider.strokeWidth).assertEqual('3.00vp');
      expect(obj.$attrs.divider.color).assertEqual('#08000000');
      expect(obj.$attrs.divider.startMargin).assertEqual('5.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('4.00vp');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.On');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Spring');
      expect(obj.$attrs.lanes).assertEqual('5');
      expect(obj.$attrs.editMode).assertEqual('true');
      expect(obj.$attrs.chainAnimation).assertEqual('true');
      expect(obj.$attrs.multiSelectable).assertEqual('true');
      expect(obj.$attrs.alignListItem).assertEqual('ListItemAlign.Start');
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.Header');
      console.info('[ListJsunit_0300] END');
      done();
    });

    it('ListJsunit_0400', 0, async function (done) {
      // Illegal modification of properties of component List
      console.info('[ListJsunit_0400] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'space',value:'-10'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'initialIndex',value:'30'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'listDirection',value:'10'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'strokeWidth',value:'abc'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'dividerColor',value:'10'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'startMargin',value:'#aaa'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'endMargin',value:'-10'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'scrollBar',value:'abc'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'cachedCount',value:'-10'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'edgeEffect',value:'111'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'lanesMinLength',value:'$a'})
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'lanesMaxLength',value:'-10'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the List component
      let strJson = getInspectorByKey('list');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.space).assertEqual('25.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('30');
      expect(obj.$attrs.listDirection).assertEqual('Axis.Horizontal');
      expect(obj.$attrs.divider.strokeWidth).assertEqual('0.00vp');
      expect(obj.$attrs.divider.color).assertEqual('#FF00000A');
      expect(obj.$attrs.divider.startMargin).assertEqual('0.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('-10.00vp');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Off');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.None');
      expect(obj.$attrs.lanes).assertEqual('1');
      console.info('[ListJsunit_0400] END');
      done();
    });

    it('ListJsunit_0500', 0, async function (done) {
      // Verify default value of the List component
      console.info('[ListJsunit_0500] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_default');
      let obj = JSON.parse(strJson);
      console.info("[ListJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.space).assertEqual('0.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('0');
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Off');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.cachedCount).assertEqual('0');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Spring');
      expect(obj.$attrs.lanes).assertEqual('0');
      console.info('[ListJsunit_0500] END');
      done();
    });

    it('ListJsunit_0600', 0, async function (done) {
      // Verify the Horizontal layout of List components
      console.info('[ListJsunit_0600] START');
      let listItem1 = CommonFunc.getComponentRect('0');
      let top1 = listItem1.top
      let listItem2 = CommonFunc.getComponentRect('1');
      let top2 = listItem2.top
      await CommonFunc.sleep(1000);
      expect(top1).assertEqual(top2);
      console.info('[ListJsunit_0600] END');
      done();
    });
  })
}
