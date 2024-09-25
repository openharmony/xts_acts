/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import { router } from '@kit.ArkUI';

let emitKey = ''

export default function webTestFour() {
  describe('webTestFour', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebTestPage',
      }
      try {
         await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('WebTestPage' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(800);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error: ' + err);
      }
      await Utils.sleep(1000)
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(300);
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(600);
      console.info('web afterEach start:' + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('start send emitKey');
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info('emit emitKey  err: ' + JSON.stringify(err));
      }
      await Utils.sleep(300);
      done();
    })

    afterAll(() => {
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7700
     * @tc.name testErrorCodeMessage7700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage7700", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage7700', '401BusinessError 401: Parameter error. The type of \'url\' must be string.', 350, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage7700', 10)
      await Utils.sleep(1000)
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7800
     * @tc.name testErrorCodeMessage7800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage7800", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage7800', 'true', 351, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage7800', 10)
       await Utils.sleep(1000);
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7900
     * @tc.name testErrorCodeMessage7900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage7900", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage7900', '17100001Init error. The WebviewController must be associated with a Web component', 352, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage7900', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8000
     * @tc.name testErrorCodeMessage8000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8000", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8000', '17100001Init error. The WebviewController must be associated with a Web component', 353, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8000', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8100
     * @tc.name testErrorCodeMessage8100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8100", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8000', '17100001Init error. The WebviewController must be associated with a Web component', 354, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8100', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8200
     * @tc.name testErrorCodeMessage8200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8200", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8200', '401BusinessError 401: Parameter error. The type of \'hostName\' must be string.', 355, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8200', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8300
     * @tc.name testErrorCodeMessage8300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8300", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8300', '401BusinessError 401: Parameter error. The type of params is error.', 356, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8300', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8300
     * @tc.name testErrorCodeMessage8300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8400", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8400', '401BusinessError 401: Parameter error. The type of params is error.', 357, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8400', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8500
     * @tc.name testErrorCodeMessage8500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8500", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8500', '401BusinessError 401: Parameter error. The type of params is error.', 358, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8500', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8600
     * @tc.name testErrorCodeMessage8600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8600", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8600', '401BusinessError 401: Parameter error. The type of params is error.', 359, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8600', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8700
     * @tc.name testErrorCodeMessage8700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8700", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8700', '401BusinessError 401: Parameter error. The type of params is error.', 360, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8700', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8800
     * @tc.name testErrorCodeMessage8800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8800", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8800', '401BusinessError 401: Parameter error. The type of params is error.', 361, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8800', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_8900
     * @tc.name testErrorCodeMessage8900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage8900", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage8900', '401BusinessError 401: Parameter error. The type of params is error.', 362, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage8900', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9000
     * @tc.name testErrorCodeMessage9000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9000", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9000', '17100001Init error. The WebviewController must be associated with a Web component', 363, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9000', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9100
     * @tc.name testErrorCodeMessage9100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9100", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9100', '17100001Init error. The WebviewController must be associated with a Web component', 364, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9100', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9200
     * @tc.name testErrorCodeMessage9200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9200", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9200', '17100001Init error. The WebviewController must be associated with a Web component', 365, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9200', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9300
     * @tc.name testErrorCodeMessage9300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9300", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9300', '401BusinessError 401: Parameter error. The type of \'scheme\' must be string.', 366, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9300', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9400
     * @tc.name testErrorCodeMessage9400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9400", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9400', '401BusinessError 401: Parameter error. The type of \'scheme\' must be string.', 367, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9400', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9500
     * @tc.name testErrorCodeMessage9500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9500", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9500', true, 368, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9500', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9600
     * @tc.name testErrorCodeMessage9600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9600", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9600', true, 369, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9600', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9700
     * @tc.name testErrorCodeMessage9700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9700", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9700', '17100001Init error. The WebviewController must be associated with a Web component', 370, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9700', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9800
     * @tc.name testErrorCodeMessage9800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9800", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9800', '401BusinessError 401: Parameter error. The type of \'scheme\' must be string.', 371, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9800', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_9900
     * @tc.name testErrorCodeMessage9900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage9900", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage9900', '401BusinessError 401: Parameter error. The type of \'scheme\' must be string.', 372, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage9900', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_10000
     * @tc.name testErrorCodeMessage10000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage10000", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage10000', true, 373, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage10000', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_10100
     * @tc.name testErrorCodeMessage10100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage10100", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage10100', true, 374, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage10100', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_10200
     * @tc.name testErrorCodeMessage10200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage10200", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage10200', '17100001Init error. The WebviewController must be associated with a Web component', 375, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage10200', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_10300
     * @tc.name testErrorCodeMessage10300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage10300", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage10300', '17100001Init error. The WebviewController must be associated with a Web component', 376, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage10300', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_10400
     * @tc.name testErrorCodeMessage10400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testErrorCodeMessage10400", 0, async (done:Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage10400', '17100001Init error. The WebviewController must be associated with a Web component', 377, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage10400', 10)
       await Utils.sleep(1000);;
      sendEventByKey('webTestFour', 10, '');
    })


  })
}