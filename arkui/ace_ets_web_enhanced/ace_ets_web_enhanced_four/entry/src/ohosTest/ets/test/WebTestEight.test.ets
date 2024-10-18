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

export default function webTestEight() {
  describe('webTestEight', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebTestEight',
      }
      try {
        await Utils.sleep(500)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('webTestEight' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(800);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error: ' + err);
      }
      await Utils.sleep(500)
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(300);
      done();
    });

    afterEach(async () => {
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
    })

    afterAll(() => {
    })


    /**
     * @tc.number testErrorCodeMessage9700
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_9700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_9700", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_9700',
        '17100001Init error. The WebviewController must be associated with a Web component', 530, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_9700', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage9800
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_9800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_9800", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_9800',
        '17100001Init error. The WebviewController must be associated with a Web component', 531, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_9800', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage9900
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_9900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_9900", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_9900',
        '17100001Init error. The WebviewController must be associated with a Web component', 532, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_9900', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage10000
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10000", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10000', true, 533, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10000', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage10100
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10100', true, 534, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10100', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage10200
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10200", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10200',
        "401BusinessError 401: Parameter error. The type of 'enable' must be boolean.", 535, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10200', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage10300
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10300", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10300',
        '17100001Init error. The WebviewController must be associated with a Web component', 536, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10300', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })


    /**
     * @tc.number testErrorCodeMessage10400
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10400", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10400',
        '17100001Init error. The WebviewController must be associated with a Web component', 537, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10400', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage10500
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10500", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10500',
        '17100001Init error. The WebviewController must be associated with a Web component', 538, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10500', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');

    })

    /**
     * @tc.number testErrorCodeMessage10600
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10600", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10600',
        '401BusinessError 401: Parameter error. The type of \'enable\' must be boolean.', 539, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10600', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');

    })

    /**
     * @tc.number testErrorCodeMessage10700
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10700", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10700',
        '17100001Init error. The WebviewController must be associated with a Web component', 540, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10700', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');

    })

    /**
     * @tc.number testErrorCodeMessage10800
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10800", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10800',
        '17100001Init error. The WebviewController must be associated with a Web component', 541, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10800', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage10900
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_10900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_10900", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10900',
        '401BusinessError 401: Parameter error. The type of \'jopName\' must be string.', 542, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_10900', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage11000
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11000", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11000',
        '17100001Init error. The WebviewController must be associated with a Web component', 543, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11000', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })


    /**
     * @tc.number testErrorCodeMessage11100
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11100',
        '17100001Init error. The WebviewController must be associated with a Web component', 544, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11100', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage11200
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11200", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11200',
        '401BusinessError 401: Parameter error. The type of \'url\' must be string.', 545, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11200', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })


    /**
     * @tc.number testErrorCodeMessage11300
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11300", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11300',
        '17100001Init error. The WebviewController must be associated with a Web component', 546, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11300', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })


    /**
     * @tc.number testErrorCodeMessage11400
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11400", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11400',
        '401BusinessError 401: Parameter error. The type of \'mode\' must be int.', 547, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11400', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage11500
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11500", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11500',
        '401BusinessError: 401. Parameter error. The type of \'timeout\' must be int and must be positive integer.',
        548, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11500', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage11600
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11600", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11600',
        '17100001Init error. The WebviewController must be associated with a Web component', 549, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11600', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage11700
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11700", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11700',
        '17100001Init error. The WebviewController must be associated with a Web component', 550, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11700', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage11800
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11800", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11700', '17100002Invalid url', 551, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11800', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage11900
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_11900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_11900", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11900',
        '17100001Init error. The WebviewController must be associated with a Web component', 552, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_11900', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage12000
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12000", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12000',
        '17100001Init error. The WebviewController must be associated with a Web component', 553, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12000', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })


    /**
     * @tc.number testErrorCodeMessage12100
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12100',
        '401BusinessError 401: Parameter error. The type of \'userAgent\' must be string.', 554, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12100', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })


    /**
     * @tc.number testErrorCodeMessage12200
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12200", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12200', '17100002Invalid url', 555, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12200', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage12300
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12300", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12300', '17100002Invalid url', 556, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12300', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage12400
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12400", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12400',
        '17100001Init error. The WebviewController must be associated with a Web component', 557, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12400', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage12500
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12500", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12500',
        '17100001Init error. The WebviewController must be associated with a Web component', 558, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12500', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage12600
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12600", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12600',
        '17100001Init error. The WebviewController must be associated with a Web component', 559, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12600', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage12700
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12700", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12700',
        '401BusinessError 401: Parameter error. The type of \'mute\' must be boolean.', 560, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12700', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage12800
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12800", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12800',
        '17100001Init error. The WebviewController must be associated with a Web component', 561, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12800', 10)
      await Utils.sleep(200);
      sendEventByKey('eight', 10, '');
    })


    /**
     * @tc.number testErrorCodeMessage12900
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_12900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_12900", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12900',
        '17100001Init error. The WebviewController must be associated with a Web component', 562, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(500);
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_12900', 10)
      await Utils.sleep(1000);
      sendEventByKey('eight', 10, '');
    })


    /**
     * @tc.number testErrorCodeMessage13000
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_13000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_13000", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13000',
        '401BusinessError 401: Parameter error. The type of \'schemes\' must be array.', 563, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(500);
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13000', 10)
      await Utils.sleep(1000);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage13100
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_13100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_13100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13100', '13900002No such file or directory', 564, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(500);
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13100', 10)
      await Utils.sleep(1000);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage13300
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_13300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_13300", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13200',
        '17100001Init error. The WebviewController must be associated with a Web component', 565, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(500);
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13300', 10)
      await Utils.sleep(1000);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage13400
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_13400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_13400", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13400',
        '17100001Init error. The WebviewController must be associated with a Web component', 566, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13400', 10)
      await Utils.sleep(1000);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage13500
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_13500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_13500", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13500',
        '17100001Init error. The WebviewController must be associated with a Web component', 567, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13500', 10)
      await Utils.sleep(1000);
      sendEventByKey('eight', 10, '');
    })

    /**
     * @tc.number testErrorCodeMessage13600
     * @tc.name SUB_WEB_ERRORCODEANDERRORMESSAGE_13600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_WEB_ERRORCODEANDERRORMESSAGE_13600", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13600',
        '401BusinessError 401: Parameter error. The type of \'bottom\' must be booleane.', 568, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      Utils.emitEvent('SUB_WEB_ERRORCODEANDERRORMESSAGE_13600', 10)
      await Utils.sleep(1000);
      sendEventByKey('eight', 10, '');
    })
  })
}