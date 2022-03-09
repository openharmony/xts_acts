/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';

export default function rowJsunit() {
  describe('rowTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/row',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get row state success " + JSON.stringify(pages));
        if (!("row" == pages.name)) {
          console.info("get row state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(4000);
          console.info("push row page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push row page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("row after each called");
    });

    it('testRow_100', 0, async function (done) {
      console.info('testRow_100 START');
      let strJson1 = getInspectorByKey('LPValue');
      let objLP = JSON.parse(strJson1);
      console.info("testRow_100 component objLP is: " + objLP.$attrs.value);
      await Utils.sleep(1000);
      try {
        let eventData = {
          data: {
            "value": 100
          }
        }
        var innerEvent = {
          eventId: 55,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRow_100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRow_100 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('LPValue');
      let obj = JSON.parse(strJson);
      console.info("testRows_100 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.value).assertEqual("100.000000");
      console.info('testRow_100 END');
      done();
    });
  })
}