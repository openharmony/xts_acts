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
  })
}
