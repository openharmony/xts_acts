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
import {describe, beforeEach, afterEach, it, expect, beforeAll} from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
// @ts-nocheck
let emitKey = "emitOnBeforeUnload";
export default function webViewOnBeforeUnload() {
  describe('ActsAceWebDevWebViewOnBeforeUnloadTest',  () =>{
    beforeAll(async (done: Function) =>{
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnBeforeUnload',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnBeforeUnload state success " + JSON.stringify(pages));
        if (!("webViewOnBeforeUnload" == pages.name)) {
          console.info("get webViewOnBeforeUnload state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewOnBeforeUnload page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnBeforeUnload page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) =>{
      await Utils.sleep(2000);
      console.info("webViewOnBeforeUnload beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewOnBeforeUnload afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEW_API_0100
     *tc.name testOnBeforeUnload
     *tc.desc onBeforeUnload after page refresh
     */
    it('testOnBeforeUnload',0,async (done: Function) =>{
      emitKey="emitOnBeforeUnloadAgain";
      Utils.registerEvent("testOnBeforeUnload","Is it OK to leave/reload this page?",302,done);
      sendEventByKey('webViewOnBeforeUnload',10,'');
      sendEventByKey('TestwebViewOnBeforeUnload',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEW_API_0200
     *tc.name testOnBeforeUnloadAgain
     *tc.desc onBeforeUnload after page loadUrl new
     */
    it('testOnBeforeUnloadAgain',0,async (done: Function) =>{
      sendEventByKey('TestwebViewOnBeforeUnload',10,'');
      emitKey="emitOnBeforeUnloadAgain";
      Utils.registerEvent("testOnBeforeUnloadAgain","Is it OK to leave/reload this page?",304,done);
      sendEventByKey('webViewOnBeforeUnload',10,'');
    })
  })
}