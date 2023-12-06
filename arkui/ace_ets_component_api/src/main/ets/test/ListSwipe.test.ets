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

export default function ListSwipeTest() {
  const SUITE = 'ListSwipe'
  const waitUiReadyMs = 1500

  async function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve("sleep")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  function getRectCenter(rect: string) {
    let rtn = rect.replace(/\[/g, '').replace(/\]/g, '').split(',')
    return [
    parseFloat(rtn[0].trim()) + (parseFloat(rtn[2].trim()) - parseFloat(rtn[0].trim())) / 2,
    parseFloat(rtn[1].trim()) + (parseFloat(rtn[3].trim()) - parseFloat(rtn[1].trim())) / 2,
    ]
  }

  function getRectCenterVp(rect: string) {
    let rtn = rect.replace(/\[/g, '').replace(/\]/g, '').split(',')
    return [
      px2vp(parseFloat(rtn[0].trim()) + (parseFloat(rtn[2].trim()) - parseFloat(rtn[0].trim())) / 2),
      px2vp(parseFloat(rtn[1].trim()) + (parseFloat(rtn[3].trim()) - parseFloat(rtn[1].trim())) / 2),
    ]
  }

  describe('ListSwipeTest', function () {
    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/ListSwipe",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("ListSwipe" == pages.name)) {
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
     * @tc.number :ArkUI_List_Swipe_0100
     * @tc.name   :test onStateChange callback when swipe left
     * @tc.desc   :swipe left to EXPANDED state, end onStateChange will be called
     */
    it('ArkUI_List_Swipe_0100', 0, async function (done) {
      let CASE = 'ArkUI_List_Swipe_0100'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // 3.swipe item to left
      let baseKey = 'MyList1_ListItem0'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);
      let rectCenter = getRectCenter(obj.$rect)
      await driver.swipe(Math.round(rectCenter[0] + 200), Math.round(rectCenter[1]),
        0, Math.round(rectCenter[1]))

      await sleep(8000) // wait for ui update
      console.info('get getInspectorByKey swipe0100')
      let strJson2 = getInspectorByKey('swipe0100')
      let obj2 = JSON.parse(strJson2);
      console.info('ArkUI_List_Swipe_0100 text: '+JSON.stringify(obj2))
      expect(obj2.$type).assertEqual('Text')
      console.info("obj2.$attrs.content: " + obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('end EXPANDED')
      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     * @tc.number :ArkUI_List_Swipe_0300
     * @tc.name   :test onStateChange callback when swipe right
     * @tc.desc   :swipe right to EXPANDED state, end onStateChange will be called
     */
    it('ArkUI_List_Swipe_0300', 0, async function (done) {
      let CASE = 'ArkUI_List_Swipe_0300'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      let baseKey = 'MyList2_ListItem0'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);
      // 2.swipe right
      let rectCenter = getRectCenter(obj.$rect)
      await driver.swipe(Math.round(rectCenter[0]), 
        Math.round(rectCenter[1]), 
        Math.round(rectCenter[0] + 150), 
        Math.round(rectCenter[1]))

      await sleep(8000) // wait for ui update
      console.info('get getInspectorByKey swipe0300')
      let strJson2 = getInspectorByKey('swipe0300')
      let obj2 = JSON.parse(strJson2);
      console.info('ArkUI_List_Swipe_0300 text: '+JSON.stringify(obj2))
      expect(obj2.$type).assertEqual('Text')
      console.info("obj2.$attrs.content: " + obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('EXPANDED')
      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     * @tc.number :ArkUI_List_Swipe_0400
     * @tc.name   :test closeAllSwipeActions interface
     * @tc.desc   :collapse expand item in ArkUI_List_Swipe_0200 by closeAllSwipeActions, onFinish will be called
     */
    it('ArkUI_List_Swipe_0400', 0, async function (done) {
      let CASE = 'ArkUI_List_Swipe_0400'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)

      // 2.trigger button click, expect state change COLLAPSED and onFinish be called
      sendEventByKey('MyList2CloseButton', 10, null)
      await sleep(8000) // wait for ui update
      let strJson2 = getInspectorByKey('swipe0400')
      let obj2 = JSON.parse(strJson2);
      console.info('ArkUI_List_Swipe_0400 text: '+JSON.stringify(obj2))
      expect(obj2.$type).assertEqual('Text')
      console.info("obj2.$attrs.content: " + obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('onFinish')
      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     * @tc.number :ArkUI_List_Swipe_0500
     * @tc.name   :test onOffsetChange when swipe left
     * @tc.desc   :swipe left to EXPANDED state, onOffsetChange will be less than 0.
     */
    it('ArkUI_List_Swipe_0500', 0, async function (done) {
      let CASE = 'ArkUI_List_Swipe_0500'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // 2.swipe item to left
      let baseKey = 'MyList1_ListItem1'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);
      let rectCenter = getRectCenter(obj.$rect)
      await driver.swipe(Math.round(rectCenter[0] + 200), Math.round(rectCenter[1]),
        0, Math.round(rectCenter[1]))
      await sleep(8000) // wait for ui update
      let strJson2 = getInspectorByKey('swipe0500')
      let obj2 = JSON.parse(strJson2);
      console.info('ArkUI_List_Swipe_0500 text: '+JSON.stringify(obj2))
      expect(obj2.$type).assertEqual('Text')
      console.info("obj2.$attrs.content: " + obj2.$attrs.content)
      expect(obj2.$attrs.content).assertEqual('swipe end')
      console.info(`${SUITE} ${CASE} END`);
      done()
    });
  })
}
