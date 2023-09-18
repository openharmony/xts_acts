/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ohosrouter from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
const waitUiReadyMs = 1000;

export default function SwiperNextPrevMarginAddJsunit() {
  describe('SwiperNextPrevMarginAddJsunit', function () {
    beforeEach(async function (done) {
      console.info("SwiperNextPrevMarginAddJsunit beforeEach start");
      try {
        ohosrouter.clear();
        let pages = ohosrouter.getState();
        console.info("ApiCommponentAddJsunit " + JSON.stringify(pages));
        if (!("swiperNextPrevMargin" == pages.name)) {
          console.info("ApiCommponentAddJsunit state success " + JSON.stringify(pages.name));
          ohosrouter.pushUrl({
            url: 'MainAbility/pages/swiperNextPrevMargin',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch(err => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push circle page success ");
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      done();

    });

    it('SwiperNextPrevMarginAddJsunit_0100', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0100'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_0200', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: null })
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0200'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_0300', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: -30 })
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0300'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00px');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0300'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left) * 0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });

     it('SwiperNextPrevMarginAddJsunit_0400', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 30})
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0400'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right1 = columnSwiper.right;
      let left1  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight1 = swiperMargin.right;
      let swiperLeft1 = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0400'] component value is: " + right1 + "," + left1 + ","
      + swiperRight1 + "," + swiperLeft1);
      expect(right1 - left1).assertEqual(swiperRight1 - swiperLeft1);
      done();
    });
   
    it('SwiperNextPrevMarginAddJsunit_0500', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: undefined });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0500'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00px');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right2 = columnSwiper.right;
      let left2  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight2 = swiperMargin.right;
      let swiperLeft2 = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0500'] component value is: " + right2 + "," + left2 + ","
      + swiperRight2 + "," + swiperLeft2);
      expect((right2 - left2)*0.9).assertEqual(swiperRight2 - swiperLeft2);
      done();
    });

     it('SwiperNextPrevMarginAddJsunit_0600', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: $r("app.string.nexMargin")});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0600'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('20.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft  = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0600'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });

   it('SwiperNextPrevMarginAddJsunit_0700', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value: null });
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 0 });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0700'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00px');
      done();
    });

     it('SwiperNextPrevMarginAddJsunit_0800', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0800 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value: -30 });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0800'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0800'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left) * 0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });

     it('SwiperNextPrevMarginAddJsunit_0900', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_0900 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value: 30 });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0900'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('30.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0400'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });
   
    it('SwiperNextPrevMarginAddJsunit_1000', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1000 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value: undefined });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1000'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1000'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left)*0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });

     it('SwiperNextPrevMarginAddJsunit_1100', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: $r("app.string.prevMargin")});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: $r("app.string.nexMargin")});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1100'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('20.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('20.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1100'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1200', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 30});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: 40});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1200'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('40.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1100'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1300', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1300 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: -30});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: -40});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1300'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1300'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left) * 0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1400', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 1000});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: 1000});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1400'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00px');
      expect(obj.$attrs.prevMargin).assertEqual('0.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1400'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });

     it('SwiperNextPrevMarginAddJsunit_1500', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1500 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
       ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginDuplicate',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('swiperNextPrevMarginDuplicate');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1500'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('4.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('4.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperDuplicate');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1500'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });

     it('SwiperNextPrevMarginAddJsunit_1600', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1600 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1600'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00%');
      expect(obj.$attrs.prevMargin).assertEqual('30.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1600'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left)*0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1700', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1700 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'nextMargin',value: '10000%'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '10000%'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1700'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('10000.00%');
      expect(obj.$attrs.prevMargin).assertEqual('10000.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1700'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left)*0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });

   it('SwiperNextPrevMarginAddJsunit_1800', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1800 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
        // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: '20%'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '20%'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1800'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('20.00%');
      expect(obj.$attrs.prevMargin).assertEqual('20.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1800'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left)*0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1900', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_1900 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
        // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 'abc'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: 'abc'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1900'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1900'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left)*0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2000', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_2000 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
        // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: '30px'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '30px'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2000'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00px');
      expect(obj.$attrs.prevMargin).assertEqual('30.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2000'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2100', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_2100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
        // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: '30fp'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '30fp'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2100'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00fp');
      expect(obj.$attrs.prevMargin).assertEqual('30.00fp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2100'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2200', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_2200 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
        // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: '30lpx'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '30lpx'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2200'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00lpx');
      expect(obj.$attrs.prevMargin).assertEqual('30.00lpx');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2200'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2300', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_2300 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
        // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: $r("app.string.nexMarginString")});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: $r("app.string.prevMarginString")});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2300'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('20.00px');
      expect(obj.$attrs.prevMargin).assertEqual('20.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2300'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });
    
    it('SwiperNextPrevMarginAddJsunit_2400', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_2400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginNoMargin',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('swiperNextPrevMarginNo');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2200'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperNo');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginNo');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2400'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect((right - left)*0.9).assertEqual(swiperRight - swiperLeft);
      done();
    });
    
    it('SwiperNextPrevMarginAddJsunit_2500', 0, async function (done) {
      console.info('SwiperNextPrevMarginAddJsunit_2500 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
     ohosrouter.clear();
     ohosrouter.pushUrl({
        url: 'MainAbility/pages/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
      .catch(err => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
        // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: $r("app.float.nextMargin")});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: $r("app.float.prevMargin")});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2300'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('30.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2300'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(right - left).assertEqual(swiperRight - swiperLeft);
      done();
    });
})

}