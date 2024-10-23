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
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';

let emitKey = '';

export default function webviewNApiSecond() {

  describe('OH_ArkWebRequestHeaderSecond', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('Index' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      console.info('web afterEach start:' + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            'ACTION': ''
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
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_2620
     * @tc.name testWebHttpBodyStream_IsEof_Fail
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_2620', 0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/HttpBodyStreamIsEof'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebHttpBodyStream_IsEof_Fail', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebHttpBodyStream_IsEof_Fail', false, 5215, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });


    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_2920
     * @tc.name testWebResourceRequest_GetReferrer_Param_Error
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_2920', 0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/ResourceRequestGetReferrer'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResourceRequest_GetReferrer_Param_Error', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebResourceRequest_GetReferrer_Param_Error', false, 5216, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3601
     * @tc.name testWeb_SetSchemeHandler_Fail_schemeParam_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3601', 0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerSchemeNull'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_schemeParam_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_schemeParam_NotString', false, 5217, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3602
     * @tc.name testWeb_SetSchemeHandler_Fail_schemeParam_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3602', 0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerScheme'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_schemeParam_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_schemeParam_IsNone', false, 5218, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3603
     * @tc.name testWeb_SetSchemeHandler_Fail_webTagParam_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3603', 0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerWebTagNull'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotString', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotString', false, 5219, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3604
     * @tc.name testWeb_SetSchemeHandler_Fail_webTagParam_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3604', 0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerWebTag'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_IsNone', false, 5220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3605
     * @tc.name testWeb_SetSchemeHandler_Fail_webTagParam_NotExist
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3605', 0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/WebSetSchemeHandlerSchemeHandlerNull'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotExist', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWeb_SetSchemeHandler_Fail_webTagParam_NotExist', false, 5221, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });


    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NSDK_3502
     * @tc.name testWebServiceWorker_SetSchemeHandler_Fail_schemeParam_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_WEBHOST_NSDK_3502', 0, async (done: Function) => {
      router.pushUrl({
        url: 'testability/pages/ServiceWorkerSetSchemeHandlerScheme'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebServiceWorker_SetSchemeHandler_Fail_schemeParam_IsNone', 10);
      await Utils.sleep(1000);
      Utils.registerBaseEvent('testWebServiceWorker_SetSchemeHandler_Fail_schemeParam_IsNone', false, 5223, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('Click', 10, '');
    });
  });
}