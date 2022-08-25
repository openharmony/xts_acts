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
     *tc.number SUB_ACE_BASIC_ETS_API_001                                                                                                                                                                     
     *tc.name userAgent                                                                                                                                                                                                                 
     *tc.desic Sets the Web's user agent
     */
    it('userAgent',0,async function(done){
      emitKey="emitJavaScriptProxy";
      let userAgent="\"Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36\"";
      Utils.registerEvent("",userAgent,100,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_002                                                                                                                                                                       
     *tc.name javaScriptProxy                                                                                                                                                                                                                     *tc.desic Injects the JavaScript object into window and invoke the function in window
     */
    it('javaScriptProxy',0,async function(done){
      emitKey="emitOnUrlLoadIntercept";
      Utils.registerEvent("javaScriptProxy","backToEts",102,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_003                                                                                                                                                                       
     *tc.name onUrlLoadIntercept                                                                                                                                                                                                                  *tc.desic Triggered when the URL loading is intercepted
     */
    it('onUrlLoadIntercept',0,async function(done){
      emitKey="emitOnRenderExited";
      Utils.registerEvent("onUrlLoadIntercept","https://gitee.com/",104,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_004                                                                                                                                                                       
     *tc.name onRenderExited                                                                                                                                                                                                                 
     *tc.desic Triggered when the render process exits
     */
    it('onRenderExited',0,async function(done){
      emitKey="emitOnResourceLoad";
      Utils.registerEvent("onRenderExited",2,106,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_005                                                                                                                                                                       
     *tc.name onResourceLoad                                                                                                                                                                                                                 
     *tc.desic Triggered when the url loading
     */
    it('onResourceLoad',0,async function(done){
      emitKey="emitLoadUrl";
      Utils.registerEvent("onResourceLoad","file:///data/storage/el1/bundle/phone/resources/rawfile/second.html",108,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_006                                                                                                                                                                       
     *tc.name loadUrl                                                                                                                                                                                                                 
     *tc.desic Loads the given URL
     */
    it('loadUrl',0,async function(done){
      emitKey="emitRunJavaScript";
      Utils.registerContainEvent("loadUrl","代码托管和研发协作平台",110,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_007                                                                                                                                                                       
     *tc.name runJavaScript                                                                                                                                                                                                                 
     *tc.desic Loads a piece of code and execute JS code in the context of the currently displayed page
     */
    it('runJavaScript',0,async function(done){
      emitKey="emitOnProgressChange";
      Utils.registerEvent("runJavaScript","\"testRunJavaScript\"",112,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_008                                                                                                                                                                       
     *tc.name onProgressChange                                                                                                                                                                                                                    *tc.desic Triggered when the page loading progress changes
     */
    it('onProgressChange',0,async function(done){
      emitKey="emitOnRefreshAccessedHistory";
      Utils.registerEvent("onProgressChange","100",114,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_009                                                                                                                                                                       
     *tc.name onRefreshAccessedHistory                                                                                                                                                                                                            *tc.desic Triggered when the Web page refreshes accessed history
     */
    it('onRefreshAccessedHistory',0,async function(done){
      emitKey="emitGetHitTest";
      Utils.registerEvent("onRefreshAccessedHistory","file:///data/storage/el1/bundle/phone/resources/rawfile/second.html",116,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_010                                                                                                                                                                       
     *tc.name getHitTest                                                                                                                                                                                                                 
     *tc.desic Gets the type of HitTest
     */
    it('getHitTest',0,async function(done){
      emitKey="emitGetWebId";
      Utils.registerEvent("getHitTest","7",118,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_011                                                                                                                                                                       
     *tc.name getWebId                                                                                                                                                                                                                 
     *tc.desic Gets the id for the current Web
     */
    it('getWebId',0,async function(done){
      emitKey="emitGetTitle";
      Utils.registerEvent("getWebId","1",120,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_012                                                                                                                                                                       
     *tc.name getTitle                                                                                                                                                                                                                 
     *tc.desic Gets the title of current Web page
     */
    it('getTitle',0,async function(done){
      emitKey="emitGetPageHeight";
      Utils.registerEvent("getTitle","index",122,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_013                                                                                                                                                                       
     *tc.name getPageHeight                                                                                                                                                                                                                 
     *tc.desic Gets the content height of current Web page
     */
    it('getPageHeight',0,async function(done){
      emitKey="emitGetRequestFocus";
      Utils.registerEventTwo("getPageHeight",124,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_014                                                                                                                                                                       
     *tc.name requestFocus                                                                                                                                                                                                                 
     *tc.desic Gets the request focus
     */
    it('requestFocus',0,async function(done){
      emitKey="emitAccessBackward";
      Utils.registerEvent("requestFocus","requestFocus",126,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_015                                                                                                                                                                       
     *tc.name accessBackward                                                                                                                                                                                                                 
     *tc.desic Checks whether the web page can go back
     */
    it('accessBackward',0,async function(done){
      emitKey="emitAccessForward";
      Utils.registerEvent("accessBackward","true",128,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_016                                                                                                                                                                       
     *tc.name accessForward                                                                                                                                                                                                                 
     *tc.desic Checks whether the web page can go forward
     */
    it('accessForward',0,async function(done){
      emitKey="emitAccessStep";
      Utils.registerEvent("accessForward","false",130,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_017                                                                                                                                                                       
     *tc.name accessStep                                                                                                                                                                                                                 
     *tc.desic Checks whether the web page can go back or forward the given number of steps
     */
    it('accessStep',0,async function(done){
      emitKey="emitBackward";
      Utils.registerEvent("accessStep","true",132,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_018                                                                                                                                                                       
     *tc.name backward                                                                                                                                                                                                                 
     *tc.desic Goes back in the history of the web page
     */
    it('backward',0,async function(done){
      emitKey="emitForward";
      Utils.registerEvent("backward","index",134,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_019                                                                                                                                                                       
     *tc.name forward                                                                                                                                                                                                                 
     *tc.desic Goes forward in the history of the web page
     */
    it('forward',0,async function(done){
      emitKey="emitBackOrForward";
      Utils.registerEvent("forward","second",136,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_020                                                                                                                                                                       
     *tc.name backOrForward                                                                                                                                                                                                                 
     *tc.desic Goes forward or back backOrForward in the history of the web page
     */
    it('backOrForward',0,async function(done){
      emitKey="emitOnPageBegin";
      Utils.registerEvent("backOrForward","index",138,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_021                                                                                                                                                                       
     *tc.name onPageBegin                                                                                                                                                                                                                 
     *tc.desic Triggered when the page loading progress changes
     */
    it('onPageBegin',0,async function(done){
      emitKey="emitOnPageEnd";
      Utils.registerEvent("onPageBegin","file:///data/storage/el1/bundle/phone/resources/rawfile/index.html",59,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_022                                                                                                                                                                       
     *tc.name onPageEnd                                                                                                                                                                                                                 
     *tc.desic Triggered at the begin of web page loading
     */
    it('onPageEnd',0,async function(done){
      emitKey="emitOnConsole";
      Utils.registerEvent("onPageEnd","file:///data/storage/el1/bundle/phone/resources/rawfile/index.html",60,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_023                                                                                                                                                                       
     *tc.name onConsole                                                                                                                                                                                                                 
     *tc.desic Triggered when the web page receives a JavaScript console message
     */
    it('onConsole',0,async function(done){
      emitKey="emitOnAlert";
      Utils.registerEvent("onConsole","console test",62,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_024                                                                                                                                                                       
     *tc.name onAlert                                                                                                                                                                                                                 
     *tc.desic Triggered when the Web wants to display a JavaScript alert() dialog
     */
    it('onAlert',0,async function(done){
      emitKey="emitOnConfirm";
      Utils.registerEvent("onAlert","alert test",63,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_025                                                                                                                                                                       
     *tc.name onConfirm                                                                                                                                                                                                                 
     *tc.desic Triggered when the web page wants to display a JavaScript confirm() dialog
     */
    it('onConfirm',0,async function(done){
      emitKey="emitOnErrorReceive";
      Utils.registerEvent("onConfirm","confirm test",64,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_026                                                                                                                                                                       
     *tc.name onErrorReceive                                                                                                                                                                                                                 
     *tc.desic Triggered when the web page receives a web resource loading error
     */
    it('onErrorReceive',0,async function(done){
      emitKey="emitOnHttpErrorReceive";
      Utils.registerEvent("onErrorReceive","http://192.168.5.40:9006/sso_web/html/H5/doctor/aboutUs.html",65,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_027                                                                                                                                                                       
     *tc.name onHttpErrorReceive                                                                                                                                                                                                                 
     *tc.desic Triggered when the web page receives a web resource loading HTTP error
     */
    it('onHttpErrorReceive',0,async function(done){
      emitKey="emitOnTitleReceive";
      Utils.registerEvent("onHttpErrorReceive",404,66,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_028                                                                                                                                                                       
     *tc.name onTitleReceive                                                                                                                                                                                                                 
     *tc.desic Triggered when the title of the main application document changes
     */
    it('onTitleReceive',0,async function(done){
      emitKey="emitOnDownloadStart";
      Utils.registerEvent("onTitleReceive","index",67,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_029                                                                                                                                                                       
     *tc.name onDownloadStart                                                                                                                                                                                                                 
     *tc.desic Triggered when starting to download
     */
    it('onDownloadStart',0,async function(done){
      emitKey="emitSetCookie";
      Utils.registerEvent("onDownloadStart","https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/mobileservices/2022/download/PC107f1b3947c942ffaa14334a879065d8.2107261020.exe",68,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_030                                                                                                                                                                       
     *tc.name setCookie                                                                                                                                                                                                                 
     *tc.desic  Sets the cookie
     */
    it('setCookie',0,async function(done){
      emitKey="emitGetCookie";
      Utils.registerEvent("setCookie","e=f",76,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_031                                                                                                                                                                       
     *tc.name getCookie                                                                                                                                                                                                                 
     *tc.desic Gets all cookies for the given URL
     */
    it('getCookie',0,async function(done){
      emitKey="emitZoom";
      Utils.registerEvent("getCookie","e=f",69,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_032                                                                                                                                                                       
     *tc.name zoom                                                                                                                                                                                                                 
     *tc.desic Let the Web zoom by
     */
    it('zoom',0,async function(done){
      emitKey="emitZoomOut";
      Utils.registerEvent("zoom",true,77,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_033                                                                                                                                                                       
     *tc.name zoomOut                                                                                                                                                                                                                 
     *tc.desic Let the Web zoom out
     */
    it('zoomOut',0,async function(done){
      emitKey="emitZoomIn";
      Utils.registerEvent("zoomOut",true,78,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_034                                                                                                                                                                       
     *tc.name zoomIn                                                                                                                                                                                                                 
     *tc.desic Let the Web zoom in
     */
    it('zoomIn',0,async function(done){
      emitKey="emitDeleteEntireCookie";
      Utils.registerEvent("zoomIn",true,79,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_035                                                                                                                                                                       
     *tc.name deleteEntireCookie                                                                                                                                                                                                                 
     *tc.desic Delete all cookies
     */
    it('deleteEntireCookie',0,async function(done){
      emitKey="emitSaveCookieSync";
      Utils.registerEvent("deleteEntireCookie","",80,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_036                                                                                                                                                                       
     *tc.name saveCookieSync                                                                                                                                                                                                                 
     *tc.desic  Saves the cookies
     */
    it('saveCookieSync',0,async function(done){
      emitKey="emitClearHistory";
      Utils.registerEvent("saveCookieSync",true,81,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_037                                                                                                                                                                       
     *tc.name clearHistory                                                                                                                                                                                                                 
     *tc.desic Clears the history in the Web
     */
    it('clearHistory',0,async function(done){
      emitKey="emitStop";
      Utils.registerEvent("clearHistory",false,82,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_038                                                                                                                                                                       
     *tc.name stop                                                                                                                                                                                                                 
     *tc.desic  Stops the current load
     */
    it('stop',0,async function(done){
      emitKey="emitOnInactive";
      Utils.registerEvent("stop",true,83,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_039                                                                                                                                                                       
     *tc.name onInactive                                                                                                                                                                                                                 
     *tc.desic Let the Web inactive.
     */
    it('onInactive',0,async function(done){
      emitKey="emitOnActive";
      Utils.registerEvent("onInactive",true,84,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_040                                                                                                                                                                       
     *tc.name onActive                                                                                                                                                                                                                 
     *tc.desic Let the Web active
     */
    it('onActive',0,async function(done){
      emitKey="emitRegisterJavaScriptProxy";
      Utils.registerEvent("onActive","file:///data/storage/el1/bundle/phone/resources/rawfile/index.html",85,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_041                                                                                                                                                                       
     *tc.name registerJavaScriptProxy                                                                                                                                                                                                                 
     *tc.desic Registers the JavaScript object and method list
     */
    it('registerJavaScriptProxy',0,async function(done){
      emitKey="emitDeleteJavaScriptRegister";
      Utils.registerEvent("registerJavaScriptProxy","backToEts",86,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_042                                                                                                                                                                       
     *tc.name deleteJavaScriptRegister                                                                                                                                                                                                                 
     *tc.desic Deletes a registered JavaScript object with given name
     */
    it('deleteJavaScriptRegister',0,async function(done){
      emitKey="emitJavaScriptAccess";
      Utils.registerEvent("deleteJavaScriptRegister",true,87,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_043                                                                                                                                                                       
     *tc.name javaScriptAccess                                                                                                                                                                                                                 
     *tc.desic Sets whether the Web allows JavaScript scripts to execute
     */
    it('javaScriptAccess',0,async function(done){
      emitKey="emitGetCookieManager";
      Utils.registerEvent("javaScriptAccess",true,88,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_044                                                                                                                                                                       
     *tc.name getCookieManager                                                                                                                                                                                                                 
     *tc.desic Gets network cookie manager
     */
    it('getCookieManager',0,async function(done){
      emitKey="emitGetCookieManager";
      Utils.registerEvent("getCookieManager",true,89,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}
