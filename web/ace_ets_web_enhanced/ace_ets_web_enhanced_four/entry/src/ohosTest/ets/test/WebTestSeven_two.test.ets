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

export default function webTestSevenTwo() {
  describe('webTestSevenTwo', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebTestSevenTwo',
      }
      try {
        await Utils.sleep(500)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('webTestSevenTwo' == pages.name)) {
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
     * @tc.number testonPageBeginTest0100
     * @tc.name SUB_WEB_TESTONPAGEBEGINTEST_0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONPAGEBEGINTEST_0100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONPAGEBEGINTEST_0100', 'https:' +
        '//www.baidu.com/', 503, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONPAGEBEGINTEST_0100', 10)
      await Utils.sleep(200);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testonVisibleAreaChangeTest0100
     * @tc.name SUB_WEB_TESTONVISIBLEAREACHANGETEST_0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONVISIBLEAREACHANGETEST_0100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONVISIBLEAREACHANGETEST_0100', false, 504, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONVISIBLEAREACHANGETEST_0100', 10)
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(200);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testonVisibleAreaChangeTest0200
     * @tc.name SUB_WEB_TESTONVISIBLEAREACHANGETEST_0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONVISIBLEAREACHANGETEST_0200", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONVISIBLEAREACHANGETEST_0200', true, 505, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONVISIBLEAREACHANGETEST_0200', 10)
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(200);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testonVisibleAreaChangeTest0300
     * @tc.name SUB_WEB_TESTONVISIBLEAREACHANGETEST_0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONVISIBLEAREACHANGETEST_0300", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONVISIBLEAREACHANGETEST_0300', true, 506, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONVISIBLEAREACHANGETEST_0300', 10)
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(300);
      sendEventByKey('open11', 10, '');
    })


    /**
     * @tc.number testonVisibleAreaChangeTest0400
     * @tc.name SUB_WEB_TESTONVISIBLEAREACHANGETEST_0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONVISIBLEAREACHANGETEST_0400", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONVISIBLEAREACHANGETEST_0400', false, 507, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONVISIBLEAREACHANGETEST_0400', 10)
      await Utils.sleep(200);
      sendEventByKey('vis', 10, '');
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(300);
      sendEventByKey('open11', 10, '');
    })


    /**
     * @tc.number testaboutToDisapperTest0400
     * @tc.name SUB_WEB_TESTABOUTTODISAPPERTEST_0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTABOUTTODISAPPERTEST_0400", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTABOUTTODISAPPERTEST_0400', false, 508, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTABOUTTODISAPPERTEST_0400', 10)
      await Utils.sleep(200);
      sendEventByKey('open11', 10, '');
    })


    /**
     * @tc.number testonLoadInterceptTest0100
     * @tc.name SUB_WEB_TESTONLOADINTERCEPTTEST_0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONLOADINTERCEPTTEST_0100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0100', true, 511, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0100', 10)
      await Utils.sleep(1000);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest0100
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0100', "https:" +
        "//www.baidu.com/", 512, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0100', 10)
      await Utils.sleep(200);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest0200
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0200", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0200', "https:" +
        "//www.baidu.com/", 513, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0200', 10)
      await Utils.sleep(200);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest0300
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0300", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0300', "https:" +
        "//www.baidu.com/", 514, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0300', 10)
      await Utils.sleep(200);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })


    /**
     * @tc.number testsetUrlTrustListTest0400
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0400", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0400', "https:" +
        "//www.baidu.com/", 515, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0400', 10)
      await Utils.sleep(200);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest0500
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0500", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0500', "https:" +
        "//www.baidu.com/", 516, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0500', 10)
      await Utils.sleep(200);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest0600
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0600", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0600', "https:" +
        "//www.baidu.com/", 517, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0600', 10)
      await Utils.sleep(200);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(200);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })


    /**
     * @tc.number testonLoadInterceptTest0400
     * @tc.name SUB_WEB_TESTONLOADINTERCEPTTEST_0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONLOADINTERCEPTTEST_0400", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0400', false, 518, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      ``

      Utils.emitEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0400', 10)
      await Utils.sleep(200);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest0700
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0700", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0700', true, 520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      ``

      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0700', 10)
      await Utils.sleep(200);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest0800
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0800", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0800', true, 521, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      ``
      await Utils.sleep(1000);
      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0800', 10)
      await Utils.sleep(1000);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest0900
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_0900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_0900", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0900', true, 522, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_0900', 10)
      await Utils.sleep(1000);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })

    /**
     * @tc.number testsetUrlTrustListTest1000
     * @tc.name SUB_WEB_TESTSETURLTRUSTLISTTEST_1000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTSETURLTRUSTLISTTEST_1000", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_1000', true, 523, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.sleep(1000);
      Utils.emitEvent('SUB_WEB_TESTSETURLTRUSTLISTTEST_1000', 10)
      await Utils.sleep(1000);
      sendEventByKey('trust', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('ref', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open11', 10, '');
    })
  })
}