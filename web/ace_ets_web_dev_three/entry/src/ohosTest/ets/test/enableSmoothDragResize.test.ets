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
let emitKey = "enableSmoothDragResize01";
export default function webenableSmoothDragResizeTestJsunit() {
  describe('enableSmoothDragResizeTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "MainAbility/pages/enableSmoothDragResize"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get enableSmoothDragResize state success " + JSON.stringify(pages));
        if (!("enableSmoothDragResize" == pages.name)) {
          console.info("get enableSmoothDragResize state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push enableSmoothDragResize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push enableSmoothDragResize page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      await Utils.sleep(2000);
      console.info("enableSmoothDragResize beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("enableSmoothDragResize afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_ENABLESMOOTHDRAGRESIZE_API_001
     *tc.name enableSmoothDragResize01
     *tc.desic test enableSmoothDragResize01 interface when choose callback mode.
     */
    it('enableSmoothDragResize01',0,async (done: Function) =>{
      emitKey="enableSmoothDragResize01";
      Utils.registerEvent("enableSmoothDragResize01",'enableSmoothDragResize',20241230,done);
      sendEventByKey('enableSmoothDragResizeButton',10,'');
    })


  })
}
