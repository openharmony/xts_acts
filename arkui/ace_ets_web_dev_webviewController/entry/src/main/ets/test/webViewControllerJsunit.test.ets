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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
let emitKey = "emitGetWebId";
export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("web afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_API_0100
     *tc.name testGetWebId
     *tc.desc Get the WebId
     */
    it('testGetWebId',0,async function(done){
      emitKey="emitgetUserAgent";
      Utils.registerEvent("testGetWebId",6,100,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0200
     *tc.name testGetUserAgent
     *tc.desc Get the UserAgent
     */
    it('testGetUserAgent',0,async function(done){
      emitKey="emitgetUserAgentAgain";
      let userAgent= "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile" +
      " Safari/537.36Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
      Utils.registerEvent("testGetUserAgent",userAgent,102,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0300
     *tc.name testGetUserAgentAgain
     *tc.desc Get the UserAgent again
     */
    it('testGetUserAgentAgain',0,async function(done){
      emitKey="emitpageDown";
      let userAgent= "\"Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88" +
      " Mobile Safari/537.36\"";
      Utils.registerEvent("testGetUserAgentAgain",userAgent,104,done);
      sendEventByKey('webcomponent',10,'');
    })    
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0400
     *tc.name testPageDown
     *tc.desc Go pageDown
     */
    it('testPageDown',0,async function(done){
      emitKey="emitpageUp";    
      Utils.registerEvent("testPageDown",true,106,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0500
     *tc.name testPageUp
     *tc.desc Go pageUp
     */
    it('testPageUp',0,async function(done){
      emitKey="emitpageDownAgain";    
      Utils.registerEvent("testPageUp",true,108,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0600
     *tc.name testPageDownAgain
     *tc.desc Go PageDown Again
     */
    it('testPageDownAgain',0,async function(done){
      emitKey="emitpageUpAgain";    
      Utils.registerEvent("testPageDownAgain",true,110,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0700
     *tc.name testPageUpAgain
     *tc.desc Go PageUp again
     */
    it('testPageUpAgain',0,async function(done){
      emitKey="emitGetFavicon";    
      Utils.registerEvent("testPageUpAgain",true,112,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0800
     *tc.name testGetFavicon
     *tc.desc test for getFavicon
     */
    it('testGetFavicon',0,async function(done){
      emitKey="emitGetFaviconAgain";    
      Utils.registerEvent("testGetFavicon",undefined,114,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0900
     *tc.name testGetFaviconAgain
     *tc.desc test for getFavicon again
     */
    it('testGetFaviconAgain',0,async function(done){
      emitKey="emitGetOriginalUrl";    
      Utils.registerEvent("testGetFaviconAgain",5,116,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1000
     *tc.name testGetOriginalUrl
     *tc.desc test for getOriginalUrl
     */
    it('testGetOriginalUrl',0,async function(done){
      emitKey="emitGetOriginalUrlTwo";    
      let indexUrl = "//rawfile/indexCopy.html";
      Utils.registerEvent("testGetOriginalUrl",indexUrl,118,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1100
     *tc.name testGetOriginalUrlTwo
     *tc.desc test for getOriginalUrl again
     */
    it('testGetOriginalUrlTwo',0,async function(done){
      emitKey="emitSetNetworkAvailable";    
      let indexUrl = "//rawfile/indexCopy.html//rawfile/indexTwo.html";
      Utils.registerEvent("testGetOriginalUrlTwo",indexUrl,120,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1100
     *tc.name testSetNetworkAvailable
     *tc.desc test for setNetworkAvailable
     */
    it('testSetNetworkAvailable',0,async function(done){
      emitKey="emitSetNetworkAvailableAgain";    
      Utils.registerEvent("testSetNetworkAvailable",false,122,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1200
     *tc.name testSetNetworkAvailableAgain
     *tc.desc test for setNetworkAvailable again
     */
    it('testSetNetworkAvailableAgain',0,async function(done){
      emitKey="emitSetNetworkAvailableAgain";    
      Utils.registerEvent("testSetNetworkAvailableAgain",true,124,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}