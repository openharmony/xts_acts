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

export default function sizeSettingJsunit() {
  beforeEach(async function (done) {
    console.info("sizeSetting beforeEach start");
    let options = {
      uri: 'pages/general-properties/sizeSetting',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info("get sizeSetting state pages:" + JSON.stringify(pages));
      if (!("sizeSetting" == pages.name)) {
        console.info("get sizeSetting state pages.name:" + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push sizeSetting page result:" + JSON.stringify(result));
      }
    } catch (err) {
      console.error("push sizeSetting page error:" + JSON.stringify(result));
    }
    done()
  });

  afterEach(async function () {
    await Utils.sleep(1000);
    console.info("sizeSetting after each called");
  });

  it('testSizeSetting001', 0, async function (done) {
    console.info('[testSizeSetting001] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('centerRow');
    console.info("[testSizeSetting001] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    expect(obj.$attrs.width).assertEqual('80.000000vp');
    expect(obj.$attrs.height).assertEqual('80.000000vp');
    expect(obj.$attrs.padding).assertEqual('20.000000vp');
    expect(obj.$attrs.margin).assertEqual('20.000000vp');
    done();
  });

  it('testSizeSetting002', 0, async function (done) {
    console.info('[testSizeSetting002] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('innerRow');
    console.info("[testSizeSetting002] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    expect(obj.$attrs.width).assertEqual('100.000000%');
    expect(obj.$attrs.height).assertEqual('100.000000%');
    done();
  });

  it('testSizeSetting003', 0, async function (done) {
    console.info('[testSizeSetting003] START');
    try {
      let eventData = {
        data: {
          "width": '200',
          "height": '200',
          "padding": '10',
          "margin": '40'
        }
      }
      let indexEvent = {
        eventId: 28,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testSizeSetting003] start to publish emit");
      events_emitter.emit(indexEvent, eventData);
    } catch (err) {
      console.log("[testSizeSetting003] change component data error: " + err.message);
    }
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('centerRow');
    console.info("[testSizeSetting003] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    expect(obj.$attrs.width).assertEqual('200.000000vp');
    expect(obj.$attrs.height).assertEqual('200.000000vp');
    expect(obj.$attrs.padding).assertEqual('10.000000vp');
    expect(obj.$attrs.margin).assertEqual('40.000000vp');
    done();
  });

  it('testSizeSetting004', 0, async function (done) {
    console.info('[testSizeSetting004] START');
    await Utils.sleep(1000);
    try {
      let eventData = {
        data: {
          "width": '80%',
          "height": '80%'
        }
      }
      let indexEvent = {
        eventId: 29,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testSizeSetting004] start to publish emit");
      events_emitter.emit(indexEvent, eventData);
    } catch (err) {
      console.log("[testSizeSetting004] change component data error: " + err.message);
    }
    await Utils.sleep(3000);
    let strJson = getInspectorByKey('innerRow');
    console.info("[testSizeSetting004] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    expect(obj.$attrs.width).assertEqual('80.000000%');
    expect(obj.$attrs.height).assertEqual('80.000000%');
    done();
  });

  it('testSizeSetting005', 0, async function (done) {
    console.info('[testSizeSetting005] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('layoutWeight1');
    console.info("[testSizeSetting005] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    expect(obj.$attrs.layoutWeight).assertEqual(1);
    done();
  });

  it('testSizeSetting006', 0, async function (done) {
    console.info('[testSizeSetting006] START');
    await Utils.sleep(1000);
    try {
      let eventData = {
        data: {
          "weight": '3'
        }
      }
      let indexEvent = {
        eventId: 32,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testSizeSetting006] start to publish emit");
      events_emitter.emit(indexEvent, eventData);
    } catch (err) {
      console.log("[testSizeSetting006] change component data error: " + err.message);
    }
    await Utils.sleep(2000);
    let strJson = getInspectorByKey('layoutWeight1');
    console.info("[testSizeSetting006] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    expect(obj.$attrs.layoutWeight).assertEqual(3);
    done();
  });
}