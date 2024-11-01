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

export default function webTestSeven() {
  describe('webTestSeven', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebTestSeven',
      }
      try {
        await Utils.sleep(500)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('webTestSeven' == pages.name)) {
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
     * @tc.number testonPageVisibleTest0100
     * @tc.name SUB_WEB_TESTONPAGEVISIBLETEST_0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONPAGEVISIBLETEST_0100", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONPAGEVISIBLETEST_0100', true, 500, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONPAGEVISIBLETEST_0100', 10)
      await Utils.sleep(200);
      sendEventByKey('open', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('close', 10, '');
    })

    /**
     * @tc.number testonPageVisibleTest0200
     * @tc.name SUB_WEB_TESTONPAGEVISIBLETEST_0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONPAGEVISIBLETEST_0200", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONPAGEVISIBLETEST_0200', "resource://rawfile/index.html", 501, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_WEB_TESTONPAGEVISIBLETEST_0200', 10)
      await Utils.sleep(200);
      sendEventByKey('open', 10, '');
    })

    /**
     * @tc.number testonPageBeginTest0200
     * @tc.name SUB_WEB_TESTONPAGEBEGINTEST_0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONPAGEBEGINTEST_0200", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONPAGEBEGINTEST_0200', 1, 509, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONPAGEBEGINTEST_0200', 10)
      await Utils.sleep(200);
      sendEventByKey('open', 10, '');
    })

    /**
     * @tc.number testonPageBeginTest0300
     * @tc.name SUB_WEB_TESTONPAGEBEGINTEST_0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONPAGEBEGINTEST_0300", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONPAGEBEGINTEST_0300', 2, 510, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONPAGEBEGINTEST_0300', 10)
      await Utils.sleep(200);
      sendEventByKey('refresh', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('open', 10, '');
    })

    /**
     * @tc.number testonLoadInterceptTest0200
     * @tc.name SUB_WEB_TESTONLOADINTERCEPTTEST_0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONLOADINTERCEPTTEST_0200", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0200', false, 512, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0200', 10)
      await Utils.sleep(1000);
      sendEventByKey('open', 10, '');
    })

    /**
     * @tc.number testonLoadInterceptTest0300
     * @tc.name SUB_WEB_TESTONLOADINTERCEPTTEST_0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONLOADINTERCEPTTEST_0300", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0300', false, 513, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0300', 10)
      await Utils.sleep(1000);
      sendEventByKey('open', 10, '');
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
      Utils.registerBaseEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0400', false, 514, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0400', 10)
      await Utils.sleep(1000);
      sendEventByKey('open', 10, '');
    })

    /**
     * @tc.number testonLoadInterceptTest0500
     * @tc.name SUB_WEB_TESTONLOADINTERCEPTTEST_0500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("SUB_WEB_TESTONLOADINTERCEPTTEST_0500", 0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0500', true, 519, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_WEB_TESTONLOADINTERCEPTTEST_0500', 10)
      await Utils.sleep(200);
      sendEventByKey('open', 10, '');
    })
  })
}