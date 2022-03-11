// @ts-nocheck
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets";
import router from '@system.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';

export default function alphabetIndexerJsunit() {
  describe('alphabetIndexerTest', function () {
    beforeEach(async function (done) {
      console.info("alphabetIndexer beforeEach start");
      let options = {
        uri: 'pages/alphabetIndexer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetIndexer state pages:" + JSON.stringify(pages));
        if (!("alphabetIndexer" == pages.name)) {
          console.info("get alphabetIndexer state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push alphabetIndexer page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alphabetIndexer page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("alphabetIndexer after each called");
    });

    it('testAlphabetIndexer01', 0, async function (done) {
      console.info('[testAlphabetIndexer01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('alphabetIndexer');
      let obj = JSON.parse(strJson);
      console.info("[testAlphabetIndexer01] alphabetIndexer obj is: " + JSON.stringify(obj));
      let font = JSON.parse(obj.$attrs.font);
      console.info("[testAlphabetIndexer01] font: " + JSON.stringify(font));
      expect(font.size).assertEqual(20);
      expect(font.weight).assertEqual('FontWeight.Bolder');
      expect(font.family).assertEqual('sans-serif');
      expect(font.style).assertEqual('FontStyle.Italic');
      console.info('testAlphabetIndexer01 END');
      done();
    });

    it('testAlphabetIndexer02', 0, async function (done) {
      console.info('[testAlphabetIndexer02] START');
      try {
        let obj = {
          size: 25,
          weight: 400,
          family: 'Arial',
          style: FontStyle.Normal
        }
        let eventData = {
          data: {
            "font": JSON.stringify(obj)
          }
        }
        var innerEvent = {
          eventId: 71,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testAlphabetIndexer02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testAlphabetIndexer02] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('alphabetIndexer');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testAlphabetIndexer02] alphabetIndexer obj is: " + JSON.stringify(objNew));
      let font = JSON.parse(objNew.$attrs.font);
      console.info("[testAlphabetIndexer02] font: " + JSON.stringify(font));
      expect(font.size).assertEqual(25);
      expect(font.weight).assertEqual("FontWeight.400");
      expect(font.family).assertEqual('Arial');
      expect(font.style).assertEqual('FontStyle.Normal');
      console.info('testAlphabetIndexer02 END');
      done();
    });
  });
}
