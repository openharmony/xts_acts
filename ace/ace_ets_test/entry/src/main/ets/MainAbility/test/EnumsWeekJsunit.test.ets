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

export default function EnumsWeekJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('EnumsWeekTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/EnumsWeek',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get EnumsWeek state success " + JSON.stringify(pages));
        if (!("EnumsWeek" == pages.name)) {
          console.info("get EnumsWeek state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push EnumsWeek page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnumsWeek page error " + JSON.stringify(result));
      }
      await sleep(2)
      done()
    });

    afterEach(async function () {
      await sleep(1)
      console.info("EnumsWeek after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('enumsWeekTest001', 0, async function (done) {
      console.info('enumsWeekTest001 START');
      let strJson = getInspectorByKey('TextMon');
      let obj = JSON.parse(strJson);
      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('1')

      console.info('enumsWeekTest001 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('enumsWeekTest002', 0, async function (done) {
      console.info('enumsWeekTest002 START');
      let strJson = getInspectorByKey('TextThur');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('8')
      console.info('enumsWeekTest002 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('enumsWeekTest003', 0, async function (done) {
      console.info('enumsWeekTest003 START');

      await sleep(1)

      let strJson = getInspectorByKey('TextFri');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('16')
      console.info('enumsWeekTest003 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('enumsWeekTest004', 0, async function (done) {
      console.info('enumsWeekTest004 START');
      let strJson = getInspectorByKey('TextSat');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual('32')
      console.info('enumsWeekTest004 END');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0350
    * @tc.name      gridItemTest001
    * @tc.desc      aceEtsTest
    */
    it('enumsWeekTest005', 0, async function (done) {
      console.info('enumsWeekTest005 START');
      let strJson = getInspectorByKey('TextMiddle');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
            console.log(JSON.stringify(obj.$attrs.content))
            expect(obj.$attrs.content).assertEqual('5')
      console.info('enumsWeekTest005 END');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0350
    * @tc.name      gridItemTest001
    * @tc.desc      aceEtsTest
    */
    it('enumsWeekTest006', 0, async function (done) {
      console.info('enumsWeekTest006 START');
      let strJson = getInspectorByKey('TextAuto');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual(HoverEffect.Auto.toString())
      console.info('enumsWeekTest006 END');
      done();
    });
    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0350
    * @tc.name      gridItemTest001
    * @tc.desc      aceEtsTest
    */
    it('enumsWeekTest007', 0, async function (done) {
      console.info('enumsWeekTest007 START');
      let strJson = getInspectorByKey('TextNone');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual(HoverEffect.None.toString())
      console.info('enumsWeekTest007 END');
      done();
    });
    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0350
    * @tc.name      gridItemTest001
    * @tc.desc      aceEtsTest
    */
    it('enumsWeekTest008', 0, async function (done) {
      console.info('enumsWeekTest008 START');
      let strJson = getInspectorByKey('TextHighlight');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual(HoverEffect.Highlight.toString())
      console.info('enumsWeekTest008 END');
      done();
    });
    /**
    * @tc.number    SUB_ACE_BASIC_ETS_API_0350
    * @tc.name      gridItemTest001
    * @tc.desc      aceEtsTest
    */
    it('enumsWeekTest009', 0, async function (done) {
      console.info('enumsWeekTest009 START');
      let strJson = getInspectorByKey('TextScale');
      let obj = JSON.parse(strJson);

      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.content).assertEqual(HoverEffect.Scale.toString())
      console.info('enumsWeekTest009 END');
      done();
    });



  })
}
