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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils.ets';

export default function clickEventJsunit() {
  beforeEach(async function (done) {
    console.info("clickEvent beforeEach start");
    let options = {
      uri: 'pages/general-properties/clickEvent',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info("get clickEvent state pages:" + JSON.stringify(pages));
      if (!("opacitySetting" == pages.name)) {
        console.info("get clickEvent state pages.name:" + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push clickEvent page result:" + JSON.stringify(result));
      }
    } catch (err) {
      console.error("push clickEvent page error:" + JSON.stringify(result));
    }
    done()
  });

  afterEach(async function () {
    await Utils.sleep(1000);
    console.info("clickEvent after each called");
  });

  it('testClickEvent001', 0, async function (done) {
    await Utils.sleep(1000)
    let rect = await Utils.getComponentRect('button')
    console.info("[testClickEvent001] rectInfo is " + JSON.stringify(rect));
    let x_value = rect.left + (rect.right - rect.left) / 2
    let y_value = rect.top + (rect.bottom - rect.top) / 2
    console.info("[testClickEvent001] onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
    var callback = (eventData) => {
      console.info("[testClickEvent001] get event state result is: " + JSON.stringify(eventData));
      expect(eventData.data.ACTION).assertEqual(true)
      let event = JSON.parse(eventData.data.event);
      expect(event.screenX).assertEqual(240)
      expect(event.screenY).assertEqual(60)
      expect(event.x).assertEqual(240)
      expect(event.y).assertEqual(60)
    }
    var innerEvent = {
      eventId: 30,
      priority: events_emitter.EventPriority.LOW
    }
    try {
      events_emitter.on(innerEvent, callback)
    } catch (err) {
      console.info("[testClickEvent001] on events_emitter err : " + JSON.stringify(err));
    }
    console.info('[testClickEvent001] sendEventByKey ' + JSON.stringify(sendEventByKey('button', 10, "")));
    await Utils.sleep(1000)
    console.info('[testClickEvent001] testSendTouchEvent END');
    done();
  });
}