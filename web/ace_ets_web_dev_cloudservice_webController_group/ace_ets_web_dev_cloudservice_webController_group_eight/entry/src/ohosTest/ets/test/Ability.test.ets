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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Driver } from '@ohos.UiTest'
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';

let emitKey = ""

export default function abilityTest() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('ActsAbilityTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push index state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push index page error:" + err);
      }
      done()
    })

    beforeEach(async (done: Function) => {
      await Utils.sleep(300);
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(600);
      console.info("web afterEach start:" + emitKey);
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
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(500);
      done();
    })

    afterAll(() => {
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0001
     * @tc.name testWebView_registerJavaScriptProxy_0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0001", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "17100001undefined", 1001, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('001', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0002
     * @tc.name testWebView_registerJavaScriptProxy_0002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0002", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "401undefined", 1002, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('002', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0003
     * @tc.name testWebView_registerJavaScriptProxy_0003
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWebView_registerJavaScriptProxy_0003", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1003, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('003', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0004
     * @tc.name testWebView_registerJavaScriptProxy_0004
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_registerJavaScriptProxy_0004", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1004, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('004', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0005
     * @tc.name testWebView_registerJavaScriptProxy_0005
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_registerJavaScriptProxy_0005", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "401undefined", 1005, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('005', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0006
     * @tc.name testWebView_registerJavaScriptProxy_0006
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_registerJavaScriptProxy_0006", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1006, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('006', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0007
     * @tc.name testWebView_registerJavaScriptProxy_0007
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0007", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1007, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('007', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0008
     * @tc.name testWebView_registerJavaScriptProxy_0008
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0008", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1008, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('008', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0009
     * @tc.name testWebView_registerJavaScriptProxy_0009
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0009", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1009, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('009', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_00010
     * @tc.name testWebView_registerJavaScriptProxy_00010
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_registerJavaScriptProxy_00010", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      sendEventByKey('0010', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_00011
     * @tc.name testWebView_registerJavaScriptProxy_00011
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_registerJavaScriptProxy_00011", 0, async (done: Function) => {
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1011, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('0011', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0005
     * @tc.name testWebView_enableBackForwardCache0005
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0005", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 200, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0005", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0006
     * @tc.name testWebView_enableBackForwardCache0006
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0006", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 201, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0006", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0007
     * @tc.name testWebView_enableBackForwardCache0007
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0007", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 202, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0007", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0008
     * @tc.name testWebView_enableBackForwardCache0008
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0008", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 203, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0008", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0009
     * @tc.name testWebView_enableBackForwardCache0009
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0009", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 204, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0009", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00010
     * @tc.name testWebView_enableBackForwardCache00010
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00010", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 205, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00010", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00011
     * @tc.name testWebView_enableBackForwardCache00011
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00011", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 206, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00011", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00012
     * @tc.name testWebView_enableBackForwardCache00012
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00012", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 207, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00012", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00013
     * @tc.name testWebView_enableBackForwardCache00013
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00013", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 208, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00013", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00014
     * @tc.name testWebView_enableBackForwardCache00014
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00014", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 209, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00014", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00015
     * @tc.name testWebView_enableBackForwardCache00016
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00016", 0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions",
        "17100001Init error. The WebviewController must be associated with a Web component", 210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00015", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0006
     * @tc.name testWebView_deleteAllGeolocation0002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_deleteAllGeolocation0002", 0, async (done: Function) => {
      Utils.registerBaseEvent("setRenderProcessMode", "true", 213, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_0006", 10)
      await Utils.sleep(500)
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0007
     * @tc.name testWebView_getAccessibleGeolocation0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_getAccessibleGeolocation0001", 0, async (done: Function) => {
      Utils.registerBaseEvent("deleteGeolocation", "17100011Invalid origin", 214, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_0007", 10)
      await Utils.sleep(500)
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0008
     * @tc.name testWebView_getAccessibleGeolocation0002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_getAccessibleGeolocation0002", 0, async (done: Function) => {
      Utils.registerBaseEvent("deleteGeolocation", "17100011Invalid origin", 215, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_0008", 10)
      await Utils.sleep(500)
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0009
     * @tc.name testWebView_getStoredGeolocation0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_getStoredGeolocation0001", 0, async (done: Function) => {
      Utils.registerBaseEvent("deleteGeolocation", "[]", 216, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_0009", 10)
      await Utils.sleep(500)
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_00010
     * @tc.name testWebView_getStoredGeolocation0002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_getStoredGeolocation0002", 0, async (done: Function) => {
      Utils.registerBaseEvent("deleteGeolocation", "[]", 217, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_00010", 10)
      await Utils.sleep(500)
      sendEventByKey('INCOGNITO', 10, '');
    })


    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_00011
     * @tc.name testWebView_fetchCookieSync0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_fetchCookieSync0001", 0, async (done: Function) => {
      Utils.registerBaseEvent("deleteGeolocation", "", 218, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_00011", 10)
      await Utils.sleep(500)
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_00012
     * @tc.name testWebView_fetchCookieSync0002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_fetchCookieSync0002", 0, async (done: Function) => {
      Utils.registerBaseEvent("deleteGeolocation", "", 219, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_00012", 10)
      await Utils.sleep(500)
      sendEventByKey('INCOGNITO', 10, '');
    })

  })
}