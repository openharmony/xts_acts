/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitClearHistory";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_054
     *tc.name clearHistory
     *tc.desic Clears the history in the Web
     */
    it('clearHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAllowGeolocation";
      Utils.registerEvent("clearHistory", false, 82, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_067                                                                                                                                                                   
     *tc.name allowGeolocation                                                                                                                                                                                                                
     *tc.desic allow specific url to access the geolocation
     */
    it('allowGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteGeolocation";
      Utils.registerEvent("allowGeolocation", "resource://rawfile/, result: true", 402, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_068                                                                                                                                                                   
     *tc.name deleteGeolocation                                                                                                                                                                                                                
     *tc.desic delete specific restored geolocation
     */
    it('deleteGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteAllGeolocation";
      Utils.registerEvent("deleteGeolocation", "", 404, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_069                                                                                                                                                                   
     *tc.name deleteAllGeolocation                                                                                                                                                                                                                
     *tc.desic delete all restored geolocation
     */
    it('deleteAllGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteAllGeolocation";
      Utils.registerEvent("deleteAllGeolocation", "", 406, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}