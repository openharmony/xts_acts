/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitWebMessageExtGetStringError";

export default function webViewContWebMessageExtReturnError() {
  describe('ActsAceWebDevWebViewContWebMessageExtReturnErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContWebMessageExtReturnError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContWebMessageExtReturnError state success " + JSON.stringify(pages));
        if (!("webViewContWebMessageExtReturnError" == pages.name)) {
          console.info("get webViewContWebMessageExtReturnError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContWebMessageExtReturnError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContWebMessageExtReturnError page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webViewContWebMessageExtReturnError beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContWebMessageExtReturnError afterEach start:" + emitKey);
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
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1500
     *tc.name testWebMessageExtGetStringError
     *tc.desc test interface of WebMessageExt getString with unmatched type
     */
    it('testWebMessageExtGetStringError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetNumberError";
      Utils.registerEvent("testWebMessageExtGetStringError", "17100014", 826, done);
      Utils.registerEvent("testWebMessageExtGetStringError", "The type and value of the message do not match.", 827, done);
      sendEventByKey('webViewContWebMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1600
     *tc.name testWebMessageExtGetNumberError
     *tc.desc test interface of WebMessageExt getNumber with unmatched type
     */
    it('testWebMessageExtGetNumberError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetBooleanError";
      Utils.registerEvent("testWebMessageExtGetNumberError", "17100014", 828, done);
      Utils.registerEvent("testWebMessageExtGetNumberError", "The type and value of the message do not match.", 829, done);
      sendEventByKey('webViewContWebMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1700
     *tc.name testWebMessageExtGetBooleanError
     *tc.desc test interface of WebMessageExt getBoolean with unmatched type
     */
    it('testWebMessageExtGetBooleanError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetArrayBufferError";
      Utils.registerEvent("testWebMessageExtGetBooleanError", "17100014", 830, done);
      Utils.registerEvent("testWebMessageExtGetBooleanError", "The type and value of the message do not match.", 831, done);
      sendEventByKey('webViewContWebMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1800
     *tc.name testWebMessageExtGetArrayBufferError
     *tc.desc test interface of WebMessageExt getArrayBuffer with unmatched type
     */
    it('testWebMessageExtGetArrayBufferError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetArrayError";
      Utils.registerEvent("testWebMessageExtGetArrayBufferError", "17100014", 832, done);
      Utils.registerEvent("testWebMessageExtGetArrayBufferError", "The type and value of the message do not match.", 833, done);
      sendEventByKey('webViewContWebMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_1900
     *tc.name testWebMessageExtGetArrayError
     *tc.desc test interface of WebMessageExt getArray with unmatched type
     */
    it('testWebMessageExtGetArrayError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetErrorError";
      Utils.registerEvent("testWebMessageExtGetArrayError", "17100014", 834, done);
      Utils.registerEvent("testWebMessageExtGetArrayError", "The type and value of the message do not match.", 835, done);
      sendEventByKey('webViewContWebMessageExtReturnError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORHUNDRED_2000
     *tc.name testWebMessageExtGetErrorError
     *tc.desc test interface of WebMessageExt getError with unmatched type
     */
    it('testWebMessageExtGetErrorError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessageExtGetErrorError";
      Utils.registerEvent("testWebMessageExtGetErrorError", "17100014", 836, done);
      Utils.registerEvent("testWebMessageExtGetErrorError", "The type and value of the message do not match.", 837, done);
      sendEventByKey('webViewContWebMessageExtReturnError', 10, '');
    })
  })
}