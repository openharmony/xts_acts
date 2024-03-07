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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';
let emitKey = "emitScrollableOne";
export default function webViewSrollableJsunit() {
  describe('ActsAceWebViewScrollableTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: "MainAbility/pages/webViewScrollable"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewScroll state success " + JSON.stringify(pages));
        if (!("webViewScrollable" == pages.name)) {
          console.info("get webViewScrollable state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewScrollable page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewScrollable page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewScrollable beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewScrollable afterEach start:"+emitKey);
      try {
            let backData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent = {
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
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0100
     * tc.name testScrollableOne
     * tc.desc When calling the scrollTo interface, the x,y input parameters are negative
   */
    it('testScrollableOne',0,async function(done){
      emitKey="emitScrollableTwo";
      Utils.registerEvent("testScrollableOne","[0,0]",214,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0200
     * tc.name testScrollableTwo
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is greater than the page height
    */
    it('testScrollableTwo',0,async function(done){
      emitKey="emitScrollableThree";
      Utils.registerEvent("testScrollableTwo",false,216,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0300
     * tc.name testScrollableThree
     * tc.desc When calling the scrollTo interface, the x input parameter is negative and the y input parameter is
     * positive, which is less than the page height
    */
    it('testScrollableThree',0,async function(done){
      emitKey="emitScrollableFour";
      Utils.registerEvent("testScrollableThree","[0,0]",218,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0400
     * tc.name testScrollableFour
     * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
     * positive, which is less than the page length
    */
    it('testScrollableFour',0,async function(done){
      emitKey="emitScrollableFive";
      Utils.registerEvent("testScrollableFour","[0,0]",220,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0500
      * tc.name testScrollableFive
      * tc.desc When calling the scrollTo interface, the y input parameter is negative and the x input parameter is
      * positive, which is greater than the page length
   */
    it('testScrollableFive',0,async function(done){
      emitKey="emitScrollableSix";
      Utils.registerEvent("testScrollableFive",false,222,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0600
     * tc.name testScrollableSix
     * tc.desc When calling the scrollTo interface, the y input parameter is a positive number and the x input parameter
     * is a positive number, both of which are less than the page height
   */
    it('testScrollableSix',0,async function(done){
      emitKey="emitScrollableSeven";
      Utils.registerEvent("testScrollableSix","[0,0]",224,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_0700
      * tc.name testScrollableSeven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableSeven',0,async function(done){
      emitKey="emitScrollableSeven";
      Utils.registerEvent("testScrollableSeven",false,226,done);
      sendEventByKey('webcomponentScrollable',10,'');
    })
  })
}
