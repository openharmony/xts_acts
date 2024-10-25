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
import { describe, beforeEach, afterEach, it, expect, beforeAll } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
let emitKey = "emitScrollByOne";
export default function webViewSrollByJsunit() {
  describe('ActsAceWebViewScrollByTest',  () =>{
    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: "testability/pages/webViewScrollBy"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewScroll state success " + JSON.stringify(pages));
        if (!("webViewScrollBy" == pages.name)) {
          console.info("get webViewScrollBy state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewScrollBy page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewScrollBy page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      await Utils.sleep(2000);
      console.info("webViewScrollBy beforeEach start");
      done();
    })
    afterEach(async  (done: Function) => {
      console.info("webViewScrollBy afterEach start:"+emitKey);
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
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0100
      * tc.name testScrollByOne
      * tc.desc When calling the scrollTo interface, x=0 and the y input parameter is a positive number,
      * which is half the page height
    */
    it('testScrollByOne',0,async (done:Function) =>{
      emitKey="emitScrollByTwo";
      Utils.registerEvent("testScrollByOne",true,228,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0200
      * tc.name testScrollByTwo
      * tc.desc When calling the scrollTo interface, x=0 and the y input parameter is a positive number,
      * which is greater than the content height
    */
    it('testScrollByTwo',0,async (done:Function) =>{
      emitKey="emitScrollByThree";
      Utils.registerEvent("testScrollByTwo",true,230,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0300
      * tc.name testScrollByThree
      * tc.desc When calling the scrollTo interface, x=0 and the y input parameter is negative, which is half the
      * page height
    */
    it('testScrollByThree',0,async (done:Function) =>{
      emitKey="emitScrollByFour";
      Utils.registerEvent("testScrollByThree","[0,0]",232,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0400
      * tc.name testScrollByFour
      * tc.desc When calling the scrollTo interface, x=0 and the y input parameter is negative, exceeding the
      * page height
    */
    it('testScrollByFour',0,async (done:Function) =>{
      emitKey="emitScrollByFive";
      Utils.registerEvent("emitScrollByFour","[0,0]",234,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0500
     * tc.name testScrollByFive
     * tc.desc When calling the scrollTo interface, y=0 and the x input parameter is a positive number, which is
     * half the page length
    */
    it('testScrollByFive',0,async (done:Function) =>{
      emitKey="emitScrollBySix";
      Utils.registerEvent("testScrollByFive",true,236,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0600
     * tc.name testScrollBySix
     * tc.desc When calling the scrollTo interface, y=0 and the x input parameter is positive, which is
     * greater than the page length
    */
    it('testScrollBySix',0,async (done:Function) =>{
      emitKey="emitScrollBySeven";
      Utils.registerEvent("testScrollBySix",true,238,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0700
     * tc.name testScrollByEight
     * tc.desc When calling the scrollTo interface, y=0 and the x input parameter is negative, which is greater
     * than the page length
    */
    it('testScrollBySeven',0,async (done:Function) =>{
      emitKey="emitScrollByEight";
      Utils.registerEvent("testScrollBySeven","[0,0]",240,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0800
     * tc.name testScrollBySeven
     * tc.desc When calling the scrollTo interface, y=0 and the x input parameter is negative, which is half the
     * page length
    */
    it('testScrollByEight',0,async (done:Function) =>{
      emitKey="emitScrollByNine";
      Utils.registerEvent("testScrollByEight","[0,0]",242,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_0900
     * tc.name testScrollByNine
     * tc.desc When calling the scrollTo interface, the yx input parameter is a positive number, which is half
     * the width and height of the page
    */
    it('testScrollByNine',0,async (done:Function) =>{
      emitKey="emitScrollByTen";
      Utils.registerEvent("testScrollByNine",true,244,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_1000
     * tc.name testScrollByTen
     * tc.desc When the scrollTo interface is called, the yx input parameter is a positive number, which exceeds
     * the page width and height
    */
    it('testScrollByTen',0,async (done:Function) =>{
      emitKey="emitScrollByEleven";
      Utils.registerEvent("testScrollByTen",true,246,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_1100
     * tc.name testScrollByEleven
     * tc.desc When calling the scrollTo interface, the yx input parameter is negative, which is half the width
     * and height of the page
    */
    it('testScrollByEleven',0,async (done:Function) =>{
      emitKey="emitScrollByTwelve";
      Utils.registerEvent("testScrollByEleven","[0,0]",248,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLBY_1200
     * tc.name testScrollByTwelve
     * tc.desc When calling the scrollTo interface, the yx input parameter is negative, which exceeds the page
     * width and height
    */
    it('testScrollByTwelve',0,async (done:Function) =>{
      emitKey="emitScrollByTwelve";
      Utils.registerEvent("testScrollByTwelve","[0,0]",250,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    })
  })
}
