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

export default function positionSettingJsunit() {
  beforeEach(async function (done) {
    console.info("positionSetting beforeEach start");
    let options = {
      uri: 'pages/general-properties/positionSetting',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info("get positionSetting state pages:" + JSON.stringify(pages));
      if (!("positionSetting" == pages.name)) {
        console.info("get positionSetting state pages.name:" + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push positionSetting page result:" + JSON.stringify(result));
      }
    } catch (err) {
      console.error("push positionSetting page error:" + err);
    }
    done()
  });

  afterEach(async function () {
    await Utils.sleep(1000);
    console.info("positionSetting after each called");
  });

  it('testPositionSetting001', 0, async function (done) {
    console.info('[testPositionSetting001] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('textAlign');
    console.info("[testPositionSetting001] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting001] textAlign: " + obj.$attrs.textAlign);
    expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
    done();
  });

  it('testPositionSetting002', 0, async function (done) {
    console.info('[testPositionSetting002] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('rowDirection');
    console.info("[testPositionSetting002] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting002] rowDirection: " + obj.$attrs.direction);
    expect(obj.$attrs.direction).assertEqual('Direction.Rtl');
    done();
  });

  it('testPositionSetting003', 0, async function (done) {
    console.info('[testPositionSetting003] START');
    try {
      let eventData = {
        data: {
          "textAlign": Alignment.BottomEnd
        }
      }
      let indexEvent = {
        eventId: 21,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testPositionSetting003] start to publish emit");
      events_emitter.emit(indexEvent, eventData);
    } catch (err) {
      console.log("[testPositionSetting003] change component data error: " + err.message);
    }
    await Utils.sleep(4000);
    let strJson = getInspectorByKey('textAlign');
    console.info("[testPositionSetting003] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting003] textAlign: " + obj.$attrs.textAlign);
    expect(obj.$attrs.textAlign).assertEqual('TextAlign.BottomEnd');
    done();
  });

  it('testPositionSetting004', 0, async function (done) {
    console.info('[testPositionSetting004] START');
    await Utils.sleep(1000);
    try {
      let eventData = {
        data: {
          "direction": Direction.Ltr
        }
      }
      let indexEvent = {
        eventId: 22,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testPositionSetting004] start to publish emit");
      events_emitter.emit(indexEvent, eventData);
    } catch (err) {
      console.log("[testPositionSetting004] change component data error: " + err.message);
    }
    await Utils.sleep(3000);
    let strJson = getInspectorByKey('rowDirection');
    console.info("[testPositionSetting004] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting004] rowDirection: " + obj.$attrs.direction);
    expect(obj.$attrs.direction).assertEqual('Direction.Ltr');
    done();
  });

  it('testPositionSetting005', 0, async function (done) {
    console.info('[testPositionSetting005] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('position1');
    console.info("[testPositionSetting005] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting005] position: " + JSON.stringify(obj.$attrs.position));
    expect(obj.$attrs.position.x).assertEqual('25.000000vp');
    expect(obj.$attrs.position.y).assertEqual('15.000000vp');
    let strJson1 = getInspectorByKey('position2');
    console.info("[testPositionSetting005] component strJson1:" + strJson1);
    let obj1 = JSON.parse(strJson1);
    console.info("[testPositionSetting005] position1: " + JSON.stringify(obj1.$attrs.position));
    expect(obj1.$attrs.position.x).assertEqual('50.000000%');
    expect(obj1.$attrs.position.y).assertEqual('70.000000%');
    done();
  });

  it('testPositionSetting006', 0, async function (done) {
    console.info('[testPositionSetting006] START');
    await Utils.sleep(1000);
    try {
      let data = {x: 10, y: 25};
      let data2 = {x: '30%', y: '50%'};
      let eventData = {
        data: {
          "position1": JSON.stringify(data),
          "position2": JSON.stringify(data2)
        }
      }
      let indexEvent = {
        eventId: 23,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testPositionSetting006] start to publish emit");
      events_emitter.emit(indexEvent, eventData);
    } catch (err) {
      console.log("[testPositionSetting006] change component data error: " + err.message);
    }
    await Utils.sleep(3000);
    let strJson = getInspectorByKey('position1');
    console.info("[testPositionSetting006] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting006] position1: " + JSON.stringify(obj.$attrs.position));
    expect(obj.$attrs.position.x).assertEqual('10.000000vp');
    expect(obj.$attrs.position.y).assertEqual('25.000000vp');
    let strJson2 = getInspectorByKey('position2');
    console.info("[testPositionSetting006] component strJson2:" + strJson2);
    let obj2 = JSON.parse(strJson2);
    console.info("[testPositionSetting006] position2: " + JSON.stringify(obj2.$attrs.position));
    expect(obj2.$attrs.position.x).assertEqual('30.000000%');
    expect(obj2.$attrs.position.y).assertEqual('50.000000%');
    done();
  });

  it('testPositionSetting007', 0, async function (done) {
    console.info('[testPositionSetting007] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('markAnchor');
    console.info("[testPositionSetting007] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting007] position: " + JSON.stringify(obj.$attrs.markAnchor));
    expect(obj.$attrs.markAnchor.x).assertEqual('25.000000vp');
    expect(obj.$attrs.markAnchor.y).assertEqual('25.000000vp');
    done();
  });

  it('testPositionSetting008', 0, async function (done) {
    console.info('[testPositionSetting008] START');
    await Utils.sleep(1000);
    try {
      let data = {x: 0, y: 0};
      let eventData = {
        data: {
          "markAnchor": JSON.stringify(data),
        }
      }
      let indexEvent = {
        eventId: 24,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testPositionSetting008] start to publish emit");
      events_emitter.emit(indexEvent, eventData);
    } catch (err) {
      console.log("[testPositionSetting008] change component data error: " + err.message);
    }
    await Utils.sleep(3000);
    let strJson = getInspectorByKey('markAnchor');
    console.info("[testPositionSetting008] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting008] markAnchor: " + JSON.stringify(obj.$attrs.markAnchor));
    expect(obj.$attrs.markAnchor.x).assertEqual('0.000000vp');
    expect(obj.$attrs.markAnchor.y).assertEqual('0.000000vp');
    done();
  });

  it('testPositionSetting009', 0, async function (done) {
    console.info('[testPositionSetting009] START');
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('offset');
    console.info("[testPositionSetting009] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting009] offset: " + JSON.stringify(obj.$attrs.offset));
    expect(obj.$attrs.offset.x).assertEqual('10.000000vp');
    expect(obj.$attrs.offset.y).assertEqual('15.000000vp');
    done();
  });

  it('testPositionSetting010', 0, async function (done) {
    console.info('[testPositionSetting010] START');
    await Utils.sleep(1000);
    try {
      let data = {x: 150, y: 10};
      let eventData = {
        data: {
          "offset": JSON.stringify(data),
        }
      }
      let indexEvent = {
        eventId: 25,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[testPositionSetting010] start to publish emit");
      events_emitter.emit(indexEvent, eventData);
    } catch (err) {
      console.log("[testPositionSetting010] change component data error: " + err.message);
    }
    await Utils.sleep(3000);
    let strJson = getInspectorByKey('offset');
    console.info("[testPositionSetting010] component strJson:" + strJson);
    let obj = JSON.parse(strJson);
    console.info("[testPositionSetting010] offset: " + JSON.stringify(obj.$attrs.offset));
    expect(obj.$attrs.offset.x).assertEqual('150.000000vp');
    expect(obj.$attrs.offset.y).assertEqual('10.000000vp');
    done();
  });
}