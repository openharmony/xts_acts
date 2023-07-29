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
import {Driver, Component, ON} from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function ListDeleteTest() {

  const SUITE = 'ListDelete'
  function getRectCenter(rect: string) {
    let rtn = rect.replace(/\[/g, '').replace(/\]/g, ',').split(',')
    return [
    parseFloat(rtn[0].trim()) + (parseFloat(rtn[2].trim()) - parseFloat(rtn[0].trim())) / 2,
    parseFloat(rtn[1].trim()) + (parseFloat(rtn[3].trim()) - parseFloat(rtn[1].trim())) / 2,
    ]
  }
  function getRectCenterVp(rect: string) {
    let rtn = rect.replace(/\[/g, '').replace(/\]/g, ',').split(',')
    return [
      px2vp(parseFloat(rtn[0].trim()) + (parseFloat(rtn[2].trim()) - parseFloat(rtn[0].trim())) / 2),
      px2vp(parseFloat(rtn[1].trim()) + (parseFloat(rtn[3].trim()) - parseFloat(rtn[1].trim())) / 2),
    ]
  }

  describe('ListDeleteTest', function () {

    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/ListDelete",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("ListDelete" == pages.name)) {
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
     *tc.number ArkUI_List_Delete_0100
     *tc.name   Set swipeAction.end by CustomBuilder
     *tc.desc   Set swipeAction.end by CustomBuilder and edgeEffect is SwipeEdgeEffect.None
     */
    it('ArkUI_List_Delete_0100', 0, async function (done) {
      let CASE = 'ArkUI_List_Delete_0100'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey = 'MyList1_ListItem0'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.startDeleteAreaDistance).assertEqual("0.00vp");
      expect(obj.$attrs.endDeleteAreaDistance).assertEqual("0.00vp");

      let rectCenter = getRectCenterVp(obj.$rect)
      let driver = Driver.create()
      await driver.swipe(rectCenter[0], rectCenter[1], 0, rectCenter[1])

      let strJsonButtonDel = getInspectorByKey(baseKey + '_Button_Del');
      let objButtonDel = JSON.parse(strJsonButtonDel);
      expect(objButtonDel.$attrs.visibility).assertEqual("Visibility.Visible");
      let strJsonButtonSet = getInspectorByKey(baseKey + '_Button_Set');
      let objButtonSet = JSON.parse(strJsonButtonSet);
      expect(objButtonSet.$attrs.visibility).assertEqual("Visibility.Visible");

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_List_Delete_0200
     *tc.name   Set swipeAction.start by CustomBuilder
     *tc.desc   Set swipeAction.start by CustomBuilder and edgeEffect is SwipeEdgeEffect.None
     */
    it('ArkUI_List_Delete_0200', 0, async function (done) {
      let CASE = 'ArkUI_List_Delete_0200'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey = 'MyList2_ListItem0'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.startDeleteAreaDistance).assertEqual("0.00vp");
      expect(obj.$attrs.endDeleteAreaDistance).assertEqual("0.00vp");

      let rectCenter = getRectCenterVp(obj.$rect)
      let driver = Driver.create()
      await driver.swipe(rectCenter[0], rectCenter[1], 600, rectCenter[1])

      let strJsonButtonDel = getInspectorByKey(baseKey + '_Button_Del');
      let objButtonDel = JSON.parse(strJsonButtonDel);
      expect(objButtonDel.$attrs.visibility).assertEqual("Visibility.Visible");
      let strJsonButtonSet = getInspectorByKey(baseKey + '_Button_Set');
      let objButtonSet = JSON.parse(strJsonButtonSet);
      expect(objButtonSet.$attrs.visibility).assertEqual("Visibility.Visible");

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_List_Delete_0500
     *tc.name   Set swipeAction.end by SwipeActionItem
     *tc.desc   Set swipeAction.end by SwipeActionItem and edgeEffect is SwipeEdgeEffect.Spring
     */
    it('ArkUI_List_Delete_0500', 0, async function (done) {
      let CASE = 'ArkUI_List_Delete_0500'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(500)
      let baseKey = 'MyList5_ListItem0'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.startDeleteAreaDistance).assertEqual("0.00vp");
      expect(obj.$attrs.endDeleteAreaDistance).assertEqual("5.00vp");

      let callback = (event) => {
        console.info(`${SUITE} ${CASE} event.data.msg:` + event.data.msg)
        expect(event.data.msg).assertEqual('MyList5_ListItem0onAction')
        done()
      }
      let event = {
        eventId: 72000,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);

      let rectCenter = getRectCenter(obj.$rect)
      await driver.swipe(rectCenter[0], rectCenter[1], 0, rectCenter[1])

      console.info(`${SUITE} ${CASE} END`);
    });


  })
}
