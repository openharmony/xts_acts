/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
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

export default function webviewNApi() {

  describe('OH_ArkWebRequestHeader', async () => {
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
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info('push index state success ' + JSON.stringify(result));
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
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4751
     * @tc.name testWebResponse_SetUrl_Url_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4751', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetUrlUrlIsNone'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetUrl_Url_IsNone', 10);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_IsNone', 17100101, 5101, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetUrl', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4752
     * @tc.name testWebResponse_SetUrl_Url_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4752', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetUrlUrlNotString'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetUrl_Url_NotString', 10);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_NotString', 17100101, 5102, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetUrl', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4753
     * @tc.name testWebResponse_SetUrl_Url_NotExist
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4753', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetUrlUrlNotExist'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetUrl_Url_NotExist', 10);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_NotExist', 17100101, 5103, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetUrl', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4754
     * @tc.name testWebResponse_SetUrl_Url_Error
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4754', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetUrlUrlError'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetUrl_Url_Error', 10);
      Utils.registerBaseEvent('testWebResponse_SetUrl_Url_Error', 0, 5104, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetUrl', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4801
     * @tc.name testWebResponse_GetUrl_Url_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4801', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/GetUrlUrlIsNone'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_GetUrl_Url_IsNone', 10);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_IsNone',17100101, 5105, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('GetUrl', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4802
     * @tc.name testWebResponse_GetUrl_Url_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4802', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/GetUrlUrlNotString'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_GetUrl_Url_NotString', 10);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_NotString',17100101, 5106, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('GetUrl', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4803
     * @tc.name testWebResponse_GetUrl_Url_NotExist
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4803', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/GetUrlUrlNotExist'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_GetUrl_Url_NotExist', 10);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_NotExist', false, 5107, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('GetUrl', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4804
     * @tc.name testWebResponse_GetUrl_Url_Error
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4804', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/GetUrlUrlError'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_GetUrl_Url_Error', 10);
      Utils.registerBaseEvent('testWebResponse_GetUrl_Url_Error', "https://www.baidu.com/", 5108, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('GetUrl', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4951
     * @tc.name testWebResponse_SetError_Fail_ParamIsString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4951', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetErrorFailParamIsString'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetError_Fail_ParamIsString', 10);
      Utils.registerBaseEvent('testWebResponse_SetError_Fail_ParamIsString', 17100101, 5109, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetError', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_5151
     * @tc.name testWebResponse_SetStatus_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_5151', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetStatusIsNone'
      });
      router.clear();
      await Utils.sleep(1000);
      Utils.emitEvent('testWebResponse_SetStatus_IsNone', 10);
      Utils.registerBaseEvent('testWebResponse_SetStatus_IsNone', 0, 5110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetStatus', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_5152
     * @tc.name testWebResponse_SetStatus_NotNum
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_5152', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetStatusNotNum'
      });
      router.clear();
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetStatus_NotNum', 10);
      Utils.registerBaseEvent('testWebResponse_SetStatus_NotNum', 17100101, 5111, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetStatus', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_5153
     * @tc.name testWebResponse_SetStatus_Error
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_5153', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetStatusError'
      });
      router.clear();
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetStatus_Error', 10);
      Utils.registerBaseEvent('testWebResponse_SetStatus_Error', 0, 5112, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetStatus', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_5350
     * @tc.name testWebResponse_SetStatusText_IsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_5350', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetStatusTextIsNone'
      });
      router.clear();
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetStatusText_IsNone', 10);
      Utils.registerBaseEvent('testWebResponse_SetStatusText_IsNone', 17100101, 5113, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetStatusText', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_5351
     * @tc.name testWebResponse_SetStatusText_NotString
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_5351', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetStatusTextNotString'
      });
      router.clear();
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetStatusText_NotString', 10);
      Utils.registerBaseEvent('testWebResponse_SetStatusText_NotString', 17100101, 5114, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetStatusText', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_5400
     * @tc.name testWebResponse_GetStatusText_NetErr
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_5400', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/GetStatusTextNetErr'
      });
      router.clear();
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_GetStatusText_NetErr', 10);
      Utils.registerBaseEvent('testWebResponse_GetStatusText_NetErr', false, 5115, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('GetStatusText', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_5710
     * @tc.name testWebResponse_SetCharset_Param_None
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_5710', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetCharsetParamNone'
      });
      router.clear();
      await Utils.sleep(800);
      Utils.emitEvent('testWebResponse_SetCharset_Param_None', 10);
      Utils.registerBaseEvent('testWebResponse_SetCharset_Param_None', 17100101, 5116, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetCharset', 10, '');
    });

    // /**
    //  * @tc.number SUB_ACE_WEB_WEBHOST_NDK_3801
    //  * @tc.name testWeb_ClearSchemeHandlers_Fail_webTagParam_IsNone
    //  * @tc.desc test Arguments
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('SUB_ACE_WEB_WEBHOST_NDK_3801', 0, async (done: Function) => {
    //   router.pushUrl({
    //     url:'testability/pages/ClearSchemeHandlersFailWebTagParamIsNone'
    //   });
    //   router.clear();
    //   await Utils.sleep(800);
    //   Utils.emitEvent('testWeb_ClearSchemeHandlers_Fail_webTagParam_IsNone', 10);
    //   Utils.registerBaseEvent('testWeb_ClearSchemeHandlers_Fail_webTagParam_IsNone', true, 5117, done,
    //     (backData: events_emitter.EventData, expected: Object) => {
    //       console.info('Received event data: ' + JSON.stringify(backData));
    //       expect(backData?.data?.ACTION).assertEqual(expected);
    //     });
    //   sendEventByKey('SetClear', 10, '');
    // });

    /**
     * @tc.number SUB_ACE_WEB_WEBHOST_NDK_4151
     * @tc.name testWebSchemeHandler_SetUserData_ParamIsNone
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_ACE_WEB_WEBHOST_NDK_4151', 0, async (done: Function) => {
      router.pushUrl({
        url:'testability/pages/SetUserDataParamIsNone'
      });
      router.clear();
      await Utils.sleep(800);
      Utils.emitEvent('testWebSchemeHandler_SetUserData_ParamIsNone', 10);
      Utils.registerBaseEvent('testWebSchemeHandler_SetUserData_ParamIsNone', 17100101, 5119, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetUserData', 10, '');
    });
  });
}