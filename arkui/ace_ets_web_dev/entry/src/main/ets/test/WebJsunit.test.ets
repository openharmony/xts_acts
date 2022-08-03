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
let emitKey = "emitUserAgent";
export default function webJsunit() {
  describe('ActsAceWebDevTest', function () {
    beforeEach(async function () {
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
    it('userAgent',0,async function(done){
      emitKey="emitJavaScriptProxy";
      let userAgent="\"Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36\"";
      Utils.registerEvent("",userAgent,100,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('javaScriptProxy',0,async function(done){
      emitKey="emitOnUrlLoadIntercept";
      Utils.registerEvent("javaScriptProxy","backToEts",102,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('onUrlLoadIntercept',0,async function(done){
      emitKey="emitOnRenderExited";
      Utils.registerEvent("onUrlLoadIntercept","https://www.gitee.com",104,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('onRenderExited',0,async function(done){
      emitKey="emitOnResourceLoad";
      Utils.registerEvent("onRenderExited",2,106,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('onResourceLoad',0,async function(done){
      emitKey="emitLoadUrl";
      Utils.registerEvent("onResourceLoad","file:///data/storage/el1/bundle/phone/resources/rawfile/second.html",108,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('loadUrl',0,async function(done){
      emitKey="emitRunJavaScript";
      Utils.registerEvent("loadUrl","基于Git的代码托管和研发协作平台--Gitee | Software Development and Collaboration Platform",110,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('runJavaScript',0,async function(done){
      emitKey="emitOnProgressChange";
      Utils.registerEvent("runJavaScript","\"testRunJavaScript\"",112,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('onProgressChange',0,async function(done){
      emitKey="emitOnRefreshAccessedHistory";
      Utils.registerEvent("onProgressChange","100",114,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('onRefreshAccessedHistory',0,async function(done){
      emitKey="emitGetHitTest";
      Utils.registerEvent("onRefreshAccessedHistory","file:///data/storage/el1/bundle/phone/resources/rawfile/second.html",116,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('getHitTest',0,async function(done){
      emitKey="emitGetWebId";
      Utils.registerEvent("getHitTest","7",118,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('getWebId',0,async function(done){
      emitKey="emitGetTitle";
      Utils.registerEvent("getWebId","1",120,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('getTitle',0,async function(done){
      emitKey="emitGetPageHeight";
      Utils.registerEvent("getTitle","index",122,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('getPageHeight',0,async function(done){
      emitKey="emitGetRequestFocus";
      Utils.registerEvent("getPageHeight","true",124,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('requestFocus',0,async function(done){
      emitKey="emitAccessBackward";
      Utils.registerEvent("requestFocus","requestFocus",126,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('accessBackward',0,async function(done){
      emitKey="emitAccessForward";
      Utils.registerEvent("accessBackward","true",128,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('accessForward',0,async function(done){
      emitKey="emitAccessStep";
      Utils.registerEvent("accessForward","false",130,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('accessStep',0,async function(done){
      emitKey="emitBackward";
      Utils.registerEvent("accessStep","true",132,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('backward',0,async function(done){
      emitKey="emitForward";
      Utils.registerEvent("backward","index",134,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('forward',0,async function(done){
      emitKey="emitBackOrForward";
      Utils.registerEvent("forward","second",136,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('backOrForward',0,async function(done){
      emitKey="emitBackOrForward";
      Utils.registerEvent("backOrForward","index",138,done);
      sendEventByKey('webcomponent',10,'');
    })
  }
}
