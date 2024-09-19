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

export default function GeolocationTest() {
  describe('GeolocationTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Geolocation',
      }
      try {
        await Utils.sleep(500)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('Geolocation' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(800);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error: '+ err);
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
      done();
    })

    afterAll(() => {
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4100
     * @tc.name testErrorCodeMessage4100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4100', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4100', '17100011Invalid origin', 300, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4100', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4200
     * @tc.name testErrorCodeMessage4200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4200', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4200', "401", 301, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4200', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4300
     * @tc.name testErrorCodeMessage4300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4300', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4300', '17100011Invalid origin', 302, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4300', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4400
     * @tc.name testErrorCodeMessage4400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4400', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4400', '17100011Invalid origin', 303, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4400', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4500
     * @tc.name testErrorCodeMessage4500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4500', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4500', '17100011Invalid origin', 304, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4500', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4600
     * @tc.name testErrorCodeMessage4600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4600', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4600', '401BusinessError 401: Parameter error. The type of \'origin\' must be string.', 305, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4600', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4700
     * @tc.name testErrorCodeMessage4700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4700', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4700', '17100011Invalid origin', 306, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4700', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4800
     * @tc.name testErrorCodeMessage4800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4800', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4800', '401BusinessError 401: Parameter error. The type of \'origin\' must be string.', 307, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4800', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4900
     * @tc.name testErrorCodeMessage4900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4900', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage4900', '401', 308, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage4900', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5000
     * @tc.name testErrorCodeMessage5000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5000', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage5000', '401', 309, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage5000', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5100
     * @tc.name testErrorCodeMessage5100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5100', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage5100', '401BusinessError 401: Parameter error. The type of \'origin\' must be string.', 310, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage5100', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5200
     * @tc.name testErrorCodeMessage5200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5200', 0, async (done: Function) => {
      Utils.registerBaseEvent('testErrorCodeMessage5200', '401BusinessError 401: Parameter error. The type of \'origin\' must be string.', 311, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('testErrorCodeMessage5200', 10)
      await Utils.sleep(500)
      sendEventByKey('Geolocation', 10, '');
    })
  })
}
