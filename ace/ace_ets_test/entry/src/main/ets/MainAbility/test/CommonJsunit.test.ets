/*
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

// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function commonJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('CommonTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/Common',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Common state success " + JSON.stringify(pages));
        if (!("Common" == pages.name)) {
          console.info("get Common state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Common page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Common page error " + JSON.stringify(result));
      }
      await sleep(2)
      done()
    });

    afterEach(async function () {
      await sleep(1)
      console.info("Common after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('commonTest001', 0, async function (done) {
      console.info('commonTest001 START');
      await sleep(1)
      let keyEvent: KeyEvent = {
        type: KeyType.Down,
        keyCode: 2049,
        keyText: 'tab',
        keySource: 4,
        deviceId: 2,
        metaKey: 0
      }
      sendKeyEvent(keyEvent)
      await sleep(1)
      let deviceId = globalThis.deviceId;
      let keyCode = globalThis.keyCode;
      let keySource = globalThis.keySource;
      let keyText = globalThis.keyText;
      let metaKey = globalThis.metaKey;

      console.log("deviceId : "+deviceId)
      console.log("keyCode : "+keyCode)
      console.log("keySource : "+keySource)
      console.log("keyText : "+keyText)
      console.log("metaKey : "+metaKey)
      expect(deviceId).assertEqual(2)
      expect(keyCode).assertEqual(2049)
      expect(keySource).assertEqual(4)
      expect(keyText).assertEqual('Unknown')
      expect(metaKey).assertEqual(0)

      console.info('commonTest001 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('commonTest002', 0, async function (done) {
      console.info('commonTest002 START');
      let strJson = getInspectorByKey('normal');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('normal')
      console.info('commonTest002 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('commonTest003', 0, async function (done) {
      console.info('commonTest003 START');

      await sleep(1)

      let strJson = getInspectorByKey('pressed');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('pressed')
      console.info('commonTest003 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('commonTest004', 0, async function (done) {
      console.info('commonTest004 START');
      await sleep(1)

      sendEventByKey("clicked", 10, "")
      await sleep(1)
      let strJson = getInspectorByKey('clicked');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('clicked')
      let globalPositionX = globalThis.globalPositionX;
      let globalPositionY = globalThis.globalPositionY;

      console.log("globalPositionX : "+globalPositionX)
      expect(globalPositionX > 0).assertTrue()
      console.log("globalPositionY : "+globalPositionY)
      expect(globalPositionY > 0).assertTrue()
      console.info('commonTest004 END');
      done();
    });


  })
}
