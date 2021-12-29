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

export default function tabJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('tabTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0510
     * @tc.name      tabTest001
     * @tc.desc      aceEtsTest
     */
    it('tabTest001', 0, async function (done) {
      console.info('++++++++++++++++ Tab TestCase 1 START ++++++++++++++++');
      let options = {
        uri: 'pages/Tab',
      }
      try {
        let result = await router.push(options)
        console.info( JSON.stringify(result));
      } catch (err) {
        console.error(JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('tab');
      let obj = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Tabs')
      expect(obj.$attrs.barPosition).assertEqual('BarPosition.Start')
      expect(obj.$attrs.index).assertEqual('1')
      console.info('obj.$attrs.scrollable———>' + typeof(obj.$attrs.scrollable))
      console.info('obj.$attrs.vertical———>' + typeof(obj.$attrs.vertical))
      expect(obj.$attrs.scrollable).assertTrue()
      expect(obj.$attrs.vertical).assertEqual('true')
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed')
      expect(obj.$attrs.barWidth).assertEqual(70.000000.toFixed(6))
      expect(obj.$attrs.barHeight).assertEqual(150.000000.toFixed(6))
      console.info('++++++++++++++++ Tab TestCase 1 End ++++++++++++++++');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0520
     * @tc.name      tabTest002
     * @tc.desc      aceEtsTest
     */
    it('tabTest002', 0, async function (done) {
      console.info('++++++++++++++++ Tab TestCase 2 START ++++++++++++++++');
      let options = {
        uri: 'pages/Tab',
      }
      try {
        let result = await router.push(options)
        console.info( JSON.stringify(result));
      } catch (err) {
        console.error(JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('tabcontent');
      let obj = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      console.log(JSON.stringify(obj.$attrs.tabBar))
      expect(obj.$type).assertEqual('TabContent')
      expect(obj.$attrs.tabBar).assertEqual('yellow')
      console.info('++++++++++++++++ Tab TestCase 2 End ++++++++++++++++');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0530
     * @tc.name      tabTest003
     * @tc.desc      aceEtsTest
     */
    it('tabTest003', 0, async function (done) {
      console.info('++++++++++++++++ Tab TestCase 3 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('tab2');
      let obj = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Tabs')
      expect(obj.$attrs.barPosition).assertEqual('BarPosition.End')
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable')
      expect(obj.$attrs.scrollable).assertFalse()
      expect(obj.$attrs.vertical).assertEqual('false')
      console.info('++++++++++++++++ Tab TestCase 3 End ++++++++++++++++');
      done();
    });
  })
}
