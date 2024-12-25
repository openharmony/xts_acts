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

import { describe, beforeEach, afterEach, it, expect, beforeAll } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
let emitKey = "getDefaultUserAgent01";
export default function webViewSrollableJsunit() {
  describe('getDefaultUserAgentTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "MainAbility/pages/getDefaultUserAgent"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getDefaultUserAgent state success " + JSON.stringify(pages));
        if (!("getDefaultUserAgent" == pages.name)) {
          console.info("get getDefaultUserAgent state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push getDefaultUserAgent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getDefaultUserAgent page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      await Utils.sleep(2000);
      console.info("getDefaultUserAgent beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("getDefaultUserAgent afterEach start:"+emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId:10,
          priority:events_emitter.EventPriority.LOW
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
     *tc.number SUB_ACE_BASIC_ETS_GETDEFAULTUSERAGENT_API_001
     *tc.name getDefaultUserAgent01
     *tc.desic test getDefaultUserAgent01 interface when choose callback mode.
     */
    it('getDefaultUserAgent01',0,async  (done: Function) =>{
      emitKey="getDefaultUserAgent01";
      Utils.registerEvent("getDefaultUserAgent01",true,20241227,done);
      sendEventByKey('getDefaultUserAgentTest01',10,'');
    })


  })
}
