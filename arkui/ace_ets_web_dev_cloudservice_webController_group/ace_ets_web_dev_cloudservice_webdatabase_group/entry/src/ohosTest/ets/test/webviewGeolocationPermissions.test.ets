/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebviewGeolocationPermissions() {
  describe('ActsAceWebviewGeolocationPermissions', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewGeolocationPermissions',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewGeolocationPermissions state success " + JSON.stringify(pages));
        if (!("webviewGeolocationPermissions" == pages.name)) {
          console.info("get webviewGeolocationPermissions state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webviewGeolocationPermissions page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webviewGeolocationPermissions page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GEOLOCATIONPERMISSIONS_API_0001
    * @tc.name        : testWebviewAddGeolocationPermissions
    * @tc.desc        : test webviewAddGeolocationPermissions
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebviewAddGeolocationPermissions', 0, async (done: Function) => {
      emitKey = "emitWebviewAddGeolocationPermissions";
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebviewAddGeolocationPermissions", "success", 26001, done);
      sendEventByKey('webviewGeolocationPermissionsButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GEOLOCATIONPERMISSIONS_API_0002
    * @tc.name        : testWebviewDeleteGeolocationPermissions
    * @tc.desc        : test webviewDeleteGeolocationPermissions
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebviewDeleteGeolocationPermissions', 0, async (done: Function) => {
      emitKey = "emitWebviewDeleteGeolocationPermissions";
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebviewDeleteGeolocationPermissions", "success", 26002, done);
      sendEventByKey('webviewGeolocationPermissionsButton', 10, '');
    })

    /*
    * @tc.number      : SUB_ACE_WEBVIEW_GEOLOCATIONPERMISSIONS_API_0003
    * @tc.name        : testWebviewDeleteAllGeolocationPermissions
    * @tc.desc        : test webviewDeleteAllGeolocationPermissions
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebviewDeleteAllGeolocationPermissions', 0, async (done: Function) => {
      emitKey = "emitWebviewDeleteAllGeolocationPermissions";
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebviewDeleteAllGeolocationPermissions", "success", 26003, done);
      sendEventByKey('webviewGeolocationPermissionsButton', 10, '');
    })
  })
}