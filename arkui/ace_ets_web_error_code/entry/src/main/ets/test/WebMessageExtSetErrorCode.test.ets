/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';

export default function webMessageExtSetErrorCode() {

  describe('WebMessageExtSetErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webMessageExtErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webMessageExtErrorCode state success " + JSON.stringify(pages));
        if (!("webMessageExtErrorCode" == pages.name)) {
          console.info("get webMessageExtErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webMessageExtErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webMessageExtErrorCode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebMessageExtSetErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("WebMessageExtSetErrorCodeTestSuite afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETSTRING_0100
    * @tc.name       : testWebMessageExSetStringError001
    * @tc.desc       : test WebMessageExSetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetStringError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetStringError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetStringError001", '17100014', 35000, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETSTRING_0200
    * @tc.name       : testWebMessageExSetStringError002
    * @tc.desc       : test WebMessageExSetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetStringError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetStringError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetStringError002", '17100014', 35001, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETSTRING_0300
    * @tc.name       : testWebMessageExSetStringError003
    * @tc.desc       : test WebMessageExSetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetStringError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetStringError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetStringError003", '17100014', 35002, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETSTRING_0400
    * @tc.name       : testWebMessageExSetStringError004
    * @tc.desc       : test WebMessageExSetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetStringError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetStringError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetStringError004", '17100014', 35003, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETSTRING_0500
    * @tc.name       : testWebMessageExSetStringError005
    * @tc.desc       : test WebMessageExSetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetStringError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetStringError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetStringError005", '17100014', 35004, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETSTRING_0600
    * @tc.name       : testWebMessageExSetStringError006
    * @tc.desc       : test WebMessageExSetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetStringError006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetStringError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetStringError006", '17100014', 35005, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETNUMBER_0100
    * @tc.name       : testWebMessageExSetNumberError001
    * @tc.desc       : test WebMessageExSetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetNumberError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetNumberError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetNumberError001", '17100014', 35010, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETNUMBER_0200
    * @tc.name       : testWebMessageExSetNumberError002
    * @tc.desc       : test WebMessageExSetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetNumberError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetNumberError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetNumberError002", '17100014', 35011, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETNUMBER_0300
    * @tc.name       : testWebMessageExSetNumberError003
    * @tc.desc       : test WebMessageExSetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetNumberError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetNumberError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetNumberError003", '17100014', 35012, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETNUMBER_0400
    * @tc.name       : testWebMessageExSetNumberError004
    * @tc.desc       : test WebMessageExSetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetNumberError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetNumberError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetNumberError004", '17100014', 35013, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETNUMBER_0500
    * @tc.name       : testWebMessageExSetNumberError005
    * @tc.desc       : test WebMessageExSetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetNumberError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetNumberError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetNumberError005", '17100014', 35014, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETNUMBER_0600
    * @tc.name       : testWebMessageExSetNumberError006
    * @tc.desc       : test WebMessageExSetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetNumberError006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetNumberError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetNumberError006", '17100014', 35015, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETBOOLEAN_0100
    * @tc.name       : testWebMessageExSetBooleanError001
    * @tc.desc       : test WebMessageExSetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetBooleanError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetBooleanError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetBooleanError001", '17100014', 35020, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETBOOLEAN_0200
    * @tc.name       : testWebMessageExSetBooleanError002
    * @tc.desc       : test WebMessageExSetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetBooleanError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetBooleanError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetBooleanError002", '17100014', 35021, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETBOOLEAN_0300
    * @tc.name       : testWebMessageExSetBooleanError003
    * @tc.desc       : test WebMessageExSetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetBooleanError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetBooleanError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetBooleanError003", '17100014', 35022, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETBOOLEAN_0400
    * @tc.name       : testWebMessageExSetBooleanError004
    * @tc.desc       : test WebMessageExSetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetBooleanError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetBooleanError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetBooleanError004", '17100014', 35023, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETBOOLEAN_0500
    * @tc.name       : testWebMessageExSetBooleanError005
    * @tc.desc       : test WebMessageExSetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetBooleanError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetBooleanError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetBooleanError005", '17100014', 35024, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETBOOLEAN_0600
    * @tc.name       : testWebMessageExSetBooleanError006
    * @tc.desc       : test WebMessageExSetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetBooleanError006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetBooleanError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetBooleanError006", '17100014', 35025, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAYBUFFER_0100
    * @tc.name       : testWebMessageExSetArrayBufferError001
    * @tc.desc       : test WebMessageExSetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayBufferError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayBufferError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayBufferError001", '17100014', 35030, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAYBUFFER_0200
    * @tc.name       : testWebMessageExSetArrayBufferError002
    * @tc.desc       : test WebMessageExSetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayBufferError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayBufferError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayBufferError002", '17100014', 35031, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAYBUFFER_0300
    * @tc.name       : testWebMessageExSetArrayBufferError003
    * @tc.desc       : test WebMessageExSetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayBufferError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayBufferError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayBufferError003", '17100014', 35032, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAYBUFFER_0400
    * @tc.name       : testWebMessageExSetArrayBufferError004
    * @tc.desc       : test WebMessageExSetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayBufferError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayBufferError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayBufferError004", '17100014', 35033, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAYBUFFER_0500
    * @tc.name       : testWebMessageExSetArrayBufferError005
    * @tc.desc       : test WebMessageExSetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayBufferError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayBufferError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayBufferError005", '17100014', 35034, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAYBUFFER_0600
    * @tc.name       : testWebMessageExSetArrayBufferError006
    * @tc.desc       : test WebMessageExSetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayBufferError006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayBufferError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayBufferError006", '17100014', 35035, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAY_0100
    * @tc.name       : testWebMessageExSetArrayError001
    * @tc.desc       : test WebMessageExSetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayError001", '17100014', 35040, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAY_0200
    * @tc.name       : testWebMessageExSetArrayError002
    * @tc.desc       : test WebMessageExSetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayError002", '17100014', 35041, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAY_0300
    * @tc.name       : testWebMessageExSetArrayError003
    * @tc.desc       : test WebMessageExSetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayError003", '17100014', 35042, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAY_0400
    * @tc.name       : testWebMessageExSetArrayError004
    * @tc.desc       : test WebMessageExSetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayError004", '17100014', 35043, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAY_0500
    * @tc.name       : testWebMessageExSetArrayError005
    * @tc.desc       : test WebMessageExSetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayError005", '17100014', 35044, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETARRAY_0600
    * @tc.name       : testWebMessageExSetArrayError006
    * @tc.desc       : test WebMessageExSetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetArrayError006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetArrayError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetArrayError006", '17100014', 35045, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETERROR_0100
    * @tc.name       : testWebMessageExSetErrorError001
    * @tc.desc       : test WebMessageExSetError error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetErrorError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetErrorError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetErrorError001", '17100014', 35050, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETERROR_0200
    * @tc.name       : testWebMessageExSetErrorError002
    * @tc.desc       : test WebMessageExSetError error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetErrorError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetErrorError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetErrorError002", '17100014', 35051, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETERROR_0300
    * @tc.name       : testWebMessageExSetErrorError003
    * @tc.desc       : test WebMessageExSetError error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetErrorError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetErrorError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetErrorError003", '17100014', 35052, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETERROR_0400
    * @tc.name       : testWebMessageExSetErrorError004
    * @tc.desc       : test WebMessageExSetError error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetErrorError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetErrorError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetErrorError004", '17100014', 35053, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETERROR_0500
    * @tc.name       : testWebMessageExSetErrorError005
    * @tc.desc       : test WebMessageExSetError error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetErrorError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetErrorError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetErrorError005", '17100014', 35054, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_SETERROR_0600
    * @tc.name       : testWebMessageExSetErrorError006
    * @tc.desc       : test WebMessageExSetError error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExSetErrorError006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExSetErrorError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExSetErrorError006", '17100014', 35055, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

  })
}
