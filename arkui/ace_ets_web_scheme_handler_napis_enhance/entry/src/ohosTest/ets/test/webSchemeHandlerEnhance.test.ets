/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import hilog from '@ohos.hilog';



export default function webviewApi() {

  describe('webNetHostingThree', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(1000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0001
    * @tc.name       : testWeb_GetNativeAPI
    * @tc.desc       : test Web_GetNativeAPI
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_GetNativeAPI', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_GetNativeAPI PASS');

      Utils.emitEvent("emitWeb_GetNativeAPI", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_GetNativeAPI", true, 1001, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0002
    * @tc.name       : testWeb_ReleaseString
    * @tc.desc       : test Web_ReleaseString
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ReleaseString', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseString PASS');

      Utils.emitEvent("emitWeb_ReleaseString", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ReleaseString", true, 1002, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0003
    * @tc.name       : testWeb_ReleaseByteArray
    * @tc.desc       : test Web_ReleaseByteArray
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ReleaseByteArray', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ReleaseByteArray PASS');

      Utils.emitEvent("emitWeb_ReleaseByteArray", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ReleaseByteArray", true, 1003, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0004
    * @tc.name       : testWebResourceRequest_DestroyHttpBodyStream
    * @tc.desc       : test WebResourceRequest_DestroyHttpBodyStream
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebResourceRequest_DestroyHttpBodyStream', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_DestroyHttpBodyStream PASS');

      Utils.emitEvent("emitWebResourceRequest_DestroyHttpBodyStream", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceRequest_DestroyHttpBodyStream", true, 1004, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0005
    * @tc.name       : testWebResponse_SetHeaderByName
    * @tc.desc       : test WebResponse_SetHeaderByName
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebResponse_SetHeaderByName', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResponse_SetHeaderByName PASS');

      Utils.emitEvent("emitWebResponse_SetHeaderByName", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResponse_SetHeaderByName", true, 1005, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0006
    * @tc.name       : testWeb_SchemeHandler
    * @tc.desc       : test Web_SchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_SchemeHandler', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_SchemeHandler PASS');

      Utils.emitEvent("emitWeb_SchemeHandler", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_SchemeHandler", true, 1006, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0007
    * @tc.name       : testWeb_ResourceHandler
    * @tc.desc       : test Web_ResourceHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceHandler', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceHandler PASS');

      Utils.emitEvent("emitWeb_ResourceHandler", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceHandler", true, 1007, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0008
    * @tc.name       : testWeb_Response
    * @tc.desc       : test Web_Response
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_Response', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_Response PASS');

      Utils.emitEvent("emitWeb_Response", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_Response", true, 1008, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0009
    * @tc.name       : testWeb_ResourceRequest
    * @tc.desc       : test Web_ResourceRequest
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_ResourceRequest', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_ResourceRequest PASS');

      Utils.emitEvent("emitWeb_ResourceRequest", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_ResourceRequest", true, 1009, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0010
    * @tc.name       : testWeb_RequestHeaderList
    * @tc.desc       : test Web_RequestHeaderList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWeb_RequestHeaderList', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_RequestHeaderList PASS');

      Utils.emitEvent("emitWeb_RequestHeaderList", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_RequestHeaderList", true, 1010, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0011
     * @tc.name       : testWeb_RequestHeaderList
     * @tc.desc       : test Web_RequestHeaderList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_HttpBodyStream', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStream PASS');

      Utils.emitEvent("emitWeb_HttpBodyStream", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_HttpBodyStream", true, 1011, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0012
     * @tc.name       : testWeb_HttpBodyStreamInitCallback
     * @tc.desc       : test Web_HttpBodyStreamInitCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_HttpBodyStreamInitCallback', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStreamInitCallback PASS');

      Utils.emitEvent("emitWeb_HttpBodyStreamInitCallback", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_HttpBodyStreamInitCallback", true, 1012, done);
      sendEventByKey('webHostingButton', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0013
     * @tc.name       : testWeb_HttpBodyStreamReadCallback
     * @tc.desc       : test Web_HttpBodyStreamReadCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWeb_HttpBodyStreamReadCallback', 0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWeb_HttpBodyStreamReadCallback PASS');

      Utils.emitEvent("emitWeb_HttpBodyStreamReadCallback", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWeb_HttpBodyStreamReadCallback", true, 1013, done);
      sendEventByKey('webHostingButton', 10, '');
    })
  })
}
