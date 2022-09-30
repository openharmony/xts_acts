/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
let emitKey = "emitOnInterceptRequest";
export default function webJsunit() {
  describe('ActsAceWebDevTest', function () {
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
     *tc.number SUB_ACE_BASIC_ETS_API_066                                                                                                                                                                      
     *tc.name onInterceptRequest                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('onInterceptRequest',0,async function(done){
      emitKey="emitGetReasonMessage";
      Utils.registerContainEvent("onInterceptRequest","intercept test",450,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_067                                                                                                                                                                   
     *tc.name getReasonMessage                                                                                                                                                                                                                
     *tc.desic allow specific url to access the geolocation
     */
    it('getReasonMessage',0,async function(done){
      emitKey="emitGetErrorCode";
      Utils.registerEvent("getReasonMessage","OK",453,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_069                                                                                                                                                                   
     *tc.name getErrorCode                                                                                                                                                                                                                
     *tc.desic delete all restored geolocation
     */
    it('getResponseCode',0,async function(done){
      emitKey="emitIsMainFrame";
      Utils.registerEvent("getResponseCode","404",452,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_071                                                                                                                                                                   
     *tc.name isMainFrame                                                                                                                                                                                                                
     *tc.desic return whether the cookie is allowed
     */
    it('isMainFrame',0,async function(done){
      emitKey="emitIsRedirect";
      Utils.registerEvent("isMainFrame","true",454,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_072                                                                                                                                                                   
     *tc.name isRedirect                                                                                                                                                                                                                
     *tc.desic return whether the third party cookie is allowed
     */
    it('isRedirect',0,async function(done){
      emitKey="emitIsRequestGesture";
      Utils.registerEvent("isRedirect","false",455,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_073                                                                                                                                                                  
     *tc.name isRequestGesture                                                                                                                                                                                                                
     *tc.desic return whether the third party cookie is allowed
     */
    it('isRequestGesture',0,async function(done){
      emitKey="emitGetRequestHeader";
      Utils.registerEvent("isRequestGesture","false",456,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_074                                                                                                                                                                  
     *tc.name isRequestGesture                                                                                                                                                                                                                
     *tc.desic return whether the third party cookie is allowed
     */
    it('getRequestHeader',0,async function(done){
      emitKey="emitGetRequestHeader";
      Utils.registerEvent("getRequestHeader","Accept",457,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}