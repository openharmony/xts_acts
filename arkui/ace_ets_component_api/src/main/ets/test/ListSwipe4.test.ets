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

export default function ListSwipeTest4() {
  const SUITE = 'ListSwipe4'
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

  describe('ListSwipeTest4', function () {
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

    afterEach(async function (done) {
      await sleep(1000)
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
      events_emitter.off(74000);
      events_emitter.off(79000);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // 1.register state change callback
      let callback = (event) => {
        expect(event.data.msg).assertEqual('swipe end');
        console.info(`${SUITE} ${CASE} event.data.msg:` + event.data.msg);
        done()
      }
      let event = {
        eventId: 70000,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      // 2.swipe item to left
      let baseKey = 'MyList1_ListItem1'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);
      let rectCenter = getRectCenter(obj.$rect)
      await driver.swipe(Math.round(rectCenter[0] + 200), Math.round(rectCenter[1]),
        0, Math.round(rectCenter[1]))
      console.info(`${SUITE} ${CASE} END`);
    });
  })
}
