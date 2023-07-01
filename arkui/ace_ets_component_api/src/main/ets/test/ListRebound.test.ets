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
export default function ListReboundTest() {

  const SUITE = 'ListRebound'
  function getRectCenter(rect: string) {
    let rtn = rect.replace(/\[/g, '').replace(/\]/g, ',').split(',')
    return [
    px2vp(parseFloat(rtn[0].trim()) + (parseFloat(rtn[2].trim()) - parseFloat(rtn[0].trim())) / 2),
    px2vp(parseFloat(rtn[1].trim()) + (parseFloat(rtn[3].trim()) - parseFloat(rtn[1].trim())) / 2),
    ]
  }
  describe('ListReboundTest', function () {

    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/ListRebound",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("ListRebound" == pages.name)) {
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

    /*
     *tc.number ArkUI_Rebound_0100
     *tc.name   Grid with EdgeEffect.Spring
     *tc.desc   Grid with EdgeEffect.Spring
     */
    it('ArkUI_Rebound_0100', 0, async function (done) {
      let CASE = 'ArkUI_Rebound_0100'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey = 'MyGrid1'
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey(baseKey);
          let obj = JSON.parse(strJson);
          expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Spring')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUI_Rebound_0200
     *tc.name   Grid with EdgeEffect.Fade
     *tc.desc   Grid with EdgeEffect.Fade
     */
    it('ArkUI_Rebound_0200', 0, async function (done) {
      let CASE = 'ArkUI_Rebound_0200'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey = 'MyGrid2'
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey(baseKey);
          let obj = JSON.parse(strJson);
          expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Fade')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUI_Rebound_0300
     *tc.name   Grid with EdgeEffect.None
     *tc.desc   Grid with EdgeEffect.None
     */
    it('ArkUI_Rebound_0300', 0, async function (done) {
      let CASE = 'ArkUI_Rebound_0300'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey = 'MyGrid3'
      setTimeout(async () => {
        try {
          let strJson = getInspectorByKey(baseKey);
          let obj = JSON.parse(strJson);
          expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.None')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}
