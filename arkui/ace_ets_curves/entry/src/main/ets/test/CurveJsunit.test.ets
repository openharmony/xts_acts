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



//import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
////import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index";
//import events_emitter from '@ohos.events.emitter';
//
//
//export default function CurveJsunit() {
//    describe('CurveTest', function () {
////        beforeEach(async function (done) {
////            console.info("curve beforeEach start");
////            let options = {
////                uri: 'pages/curve',
////            }
////            try {
////                router.clear();
////                let pages = router.getState();
////                console.info("get curve state pages:" + JSON.stringify(pages));
////                if (!("curve" == pages.name)) {
////                    console.info("get curve state pages.name:" + JSON.stringify(pages.name));
////                    let result = await router.push(options);
////                    await Utils.sleep(2000);
////                    console.info("push curve page result:" + JSON.stringify(result));
////                }
////            } catch (err) {
////                console.error("push curve page error:" + err);
////            }
////            done()
////        });
////
////        afterEach(async function () {
////            await Utils.sleep(1000);
////            console.info("curve after each called");
////        });
//
//        it('testcurve01', 0, async function (done) {
//            console.info('LANYI [testcurve01] START');
//            try {
//                var eventData = {
//                    data: {
//                        heightSize:88.88888955116272,
//                        widthSize: 88.88888955116272,
//                    }
//                }
//                var innerEvent = {
//                    eventId: 8,
//                    priority: events_emitter.EventPriority.LOW
//                }
//                console.info("LANYI [testcurve01] start to publish emit");
//                events_emitter.emit(innerEvent, eventData);
//            } catch (err) {
//                console.log("LANYI [testcurve01] change component data error: " + err.message);
//            }
//            await Utils.sleep(1000);
////           // let strJson = getInspectorByKey('curve');
////            let obj = JSON.parse(strJson);
//            console.info("LANYI [testcurve01] sendEventByKey result is: " + JSON.stringify(sendEventByKey('curve', 10, "")));
//            expect(globalThis.widthSize).assertEqual(88.88888955116272);
//            expect(globalThis.heightSize).assertEqual(88.88888955116272);
//            console.info('LANYI testcurve01 END');
//            done();
//        });
//
//    })
//}

import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"

//export default function CurveJsunit() {
//    describe('CurveTest', function () {
//        async function sleep(time) {
//            return new Promise((resolve, reject) => {
//                setTimeout(() => {
//                    resolve()
//                    console.info('curve ***** setTime ');
//
//                }, time)
//            }).then(() => {
//                console.info( `sleep ${time} over...`)
//                console.info('curve ***** then ');
//            })
//        }
export default function CurveJsunit() {
  describe('CurveTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/curve',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get curve state success " + JSON.stringify(pages));
        if (!("curve" == pages.name)) {
          console.info("get curve state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push curve page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push curve page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("curve after each called");
    });



        it('testcurve01', 0, async function (done) {
            console.info('curve testcurve01 START');
            var result_height;
            var result_width;
            var control;

            control =JSON.stringify(sendEventByKey('curve', 10, ""));
            console.info("curve sendEventByKey result is: " + control);
            setTimeout(() => {
                if (control) {
                  result_height = globalThis.widthSize;
                  console.info('curve ***** globalThis  widthSize is ' + globalThis.widthSize);
                  result_width  =  globalThis.heightSize;
                  console.info('curve ***** globalThis  heightSize is ' + globalThis.heightSize);
                } else {
                  console.error('control failed');
                }
                console.info('curve ***** result_height is ' + result_height);
                console.info('curve ***** result_width is ' + result_width);
                var finalRes;
                if ((result_height == 44.44444477558136) && (result_width == 44.44444477558136)){
                    finalRes = true;
                    console.info('curve SurfaceChangedTest success');
                } else {
                    finalRes = false;
                    console.error('curve SurfaceChangedTest fail');
                }
                expect(finalRes).assertEqual(true);
                done();
            }, 3000)
        });

    it('testcurve02', 0, async function (done) {
      console.info('curve testcurve02 START');
      var result_height;
      var result_width;
      var control;

      control =JSON.stringify(sendEventByKey('curve1', 10, ""));
      console.info("curve1 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_height = globalThis.widthSize1;
          console.info('curve1 ***** globalThis  widthSize1 is ' + globalThis.widthSize1);
          result_width  =  globalThis.heightSize1;
          console.info('curve1 ***** globalThis  heightSize1 is ' + globalThis.heightSize1);
        } else {
          console.error('control failed');
        }
        console.info('curve1 ***** result_height1 is ' + result_height);
        console.info('curve1 ***** result_width1 is ' + result_width);
        var finalRes;
        if ((result_height == 78.03846001625061) && (result_width == 78.03846001625061)){
          finalRes = true;
          console.info('curve1 SurfaceChangedTest success');
        } else {
          finalRes = false;
          console.error('curve1 SurfaceChangedTest fail');
        }
        expect(finalRes).assertEqual(true);
        done();
      }, 3000)
    });

    it('testcurve03', 0, async function (done) {
      console.info('curve testcurve03 START');
      var result_height;
      var result_width;
      var control;

      control =JSON.stringify(sendEventByKey('curve2', 10, ""));
      console.info("curve2 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_height = globalThis.widthSize2;
          console.info('curve2 ***** globalThis  widthSize2 is ' + globalThis.widthSize2);
          result_width  =  globalThis.heightSize2;
          console.info('curve2 ***** globalThis  heightSize2 is ' + globalThis.heightSize2);
        } else {
          console.error('control failed');
        }
        console.info('curve2 ***** result_height2 is ' + result_height);
        console.info('curve2 ***** result_width2 is ' + result_width);
        var finalRes;
        if ((result_height == 50) && (result_width == 50)){
          finalRes = true;
          console.info('curve2 SurfaceChangedTest success');
        } else {
          finalRes = false;
          console.error('curve2 SurfaceChangedTest fail');
        }
        expect(finalRes).assertEqual(true);
        done();
      }, 3000)
    });

    it('testcurve04', 0, async function (done) {
      console.info('curve testcurve04 START');
      var result_height;
      var result_width;
      var control;

      control =JSON.stringify(sendEventByKey('curve3', 10, ""));
      console.info("curve3 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_height = globalThis.widthSize3;
          console.info('curve3 ***** globalThis  widthSize3 is ' + globalThis.widthSize3);
          result_width  =  globalThis.heightSize3;
          console.info('curve3 ***** globalThis  heightSize3 is ' + globalThis.heightSize3);
        } else {
          console.error('control failed');
        }
        console.info('curve3 ***** result_height3 is ' + result_height);
        console.info('curve3 ***** result_width3 is ' + result_width);
        var finalRes;
        if ((result_height == 98.68008494377136) && (result_width == 98.68008494377136)){
          finalRes = true;
          console.info('curve3 SurfaceChangedTest success');
        } else {
          finalRes = false;
          console.error('curve3 SurfaceChangedTest fail');
        }
        expect(finalRes).assertEqual(true);
        done();
      }, 3000)
    });
    })
}
