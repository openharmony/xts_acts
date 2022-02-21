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
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils.ets';

export default function opacitySettingJsunit() {
  beforeEach(async function (done) {
    console.info("opacitySetting beforeEach start");
    let options = {
      uri: 'pages/general-properties/opacitySetting',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info("get opacitySetting state pages:" + JSON.stringify(pages));
      if (!("opacitySetting" == pages.name)) {
        console.info("get opacitySetting state pages.name:" + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push opacitySetting page result:" + JSON.stringify(result));
      }
    } catch (err) {
      console.error("push opacitySetting page error:" + JSON.stringify(result));
    }
    done()
  });

  afterEach(async function () {
    await Utils.sleep(1000);
    console.info("opacitySetting after each called");
  });

  it('testOpacitySetting001', 0, async function (done) {
    console.info('[testOpacitySetting001] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('opacity');
    let obj = JSON.parse(strJson);
    console.info("[testOpacitySetting001] component obj is: " + JSON.stringify(obj));
    expect(obj.$attrs.opacity).assertEqual(1);
    done();
  });

  it('testOpacitySetting002', 0, async function (done) {
    console.info('[testOpacitySetting002] START');
    try {
      var eventData = {
        data: {
          "opacityValue": "0.7"
        }
      }
      var innerEvent = {
        eventId: 100,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testOpacitySetting002] start to publish emit");
      events_emitter.emit(innerEvent, eventData);
    } catch (err) {
      console.log("[testOpacitySetting002] change component data error: " + err.message);
    }
    await Utils.sleep(2000);
    let strJsonNew = getInspectorByKey('opacity');
    let objNew = JSON.parse(strJsonNew);
    console.info("[testOpacitySetting002] component objNew is: " + JSON.stringify(objNew));
    expect(objNew.$attrs.opacity).assertEqual(0.7);
    done();
  });
}