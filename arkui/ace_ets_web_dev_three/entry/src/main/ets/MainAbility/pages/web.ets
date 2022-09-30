/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

let loadedUrl;
@Entry
@Component
struct Index {
    controller:WebController = new WebController()
    responseweb: WebResourceResponse = new WebResourceResponse()
    @State str:string="emitOnInterceptRequest"
    @State text:string=""
    @State num:number=0
    @State textRatio:number=100
    heads:Header[] = new Array();
    @State webdata: string = "<!DOCTYPE html>\n" +
    "<html>\n"+
    "<head>\n"+
    "<title>intercept test</title>\n"+
    "</head>\n"+
    "<body>\n"+
    "<h1>intercept test</h1>\n"+
    "</body>\n"+
    "</html>"
    onPageShow(){
        let valueChangeEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
    }
    private valueChangeCallBack=(eventData)=>{
        console.info("web page valueChangeCallBack");
        if(eventData != null){
             console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
             if(eventData.data.ACTION != null){
                 this.str = eventData.data.ACTION;
             }
        }
    }
    aboutToAppear(){
        let abilityDelegator: any
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let abilityDelegatorArguments: any
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite) 
    }
    build(){
        Column(){
            Web({src:"www.example.com",controller:this.controller})
            .webDebuggingAccess(true)
            .databaseAccess(true)
            .textZoomRatio(this.textRatio)
            .mediaPlayGestureAccess(true)
            .onGeolocationHide(() => {
                console.log("geoloc hide")
            })
            .onSearchResultReceive(ret => {
                console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
                    "[total]" + ret.numberOfMatches + "[isDone]"+ ret.isDoneCounting);
            })
            .onGeolocationShow((event) => {
                AlertDialog.show({
                title: 'title',
                message: 'text',
                confirm: {
                    value: 'onConfirm',
                    action: () => {
                    event.geolocation.invoke(event.origin, true, true);
                    }
                },
                cancel: () => {
                    event.geolocation.invoke(event.origin, false, true);
                }
                })
            })
            .onPermissionRequest((event) => {
                AlertDialog.show({
                    title: 'title',
                    message: 'text',
                    primaryButton: {
                    value: 'deny',
                    action: () => {
                        event.request.deny();
                    }
                    },
                    secondaryButton: {
                    value: 'onConfirm',
                    action: () => {
                        event.request.grant(event.request.getAccessibleResource());
                    }
                    },
                    cancel: () => {
                    event.request.deny();
                    }
                })
                event.request.getOrigin();
            })
            .onInterceptRequest((event) => {
                console.log('url:' + event.request.getRequestUrl());
                var head1:Header = {
                    headerKey:"Connection",
                    headerValue:"keep-alive"
                }
                var head2:Header = {
                    headerKey:"Cache-Control",
                    headerValue:"no-cache"
                }
                var length = this.heads.push(head1);
                length = this.heads.push(head2);
                this.responseweb.setResponseHeader(this.heads);
                this.responseweb.setResponseData(this.webdata);
                this.responseweb.setResponseEncoding('utf-8');
                this.responseweb.setResponseMimeType('text/html');
                this.responseweb.setResponseCode(404);
                this.responseweb.setReasonMessage('OK');
                return this.responseweb;
            })
            .onHttpErrorReceive((event) => {
                console.log('url:' + event.request.getRequestUrl());
                console.log('isMainFrame:' + event.request.isMainFrame());
                console.log('isRedirect:' + event.request.isRedirect());
                console.log('isRequestGesture:' + event.request.isRequestGesture());
                console.log('getResponseData:' + event.response.getResponseData());
                console.log('getResponseEncoding:' + event.response.getResponseEncoding());
                console.log('getResponseMimeType:' + event.response.getResponseMimeType());
                console.log('getResponseCode:' + event.response.getResponseCode());
                console.log('getReasonMessage:' + event.response.getReasonMessage());
                let result = event.request.getRequestHeader();
                console.log('The request header result size is ' + result.length);
                for (let i of result) {
                    console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
                }
                let resph = event.response.getResponseHeader();
                console.log('The response header result size is ' + resph.length);
                for (let i of resph) {
                    console.log('The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
                }
                setTimeout(()=>{
                    let result2 = event.response.getResponseCode()
                    Utils.emitEvent(result2.toString(),452)
                },3000)   
                setTimeout(()=>{
                    let result3 = event.response.getReasonMessage()
                    Utils.emitEvent(result3.toString(),453)
                },3000)
                setTimeout(()=>{
                    let result4 = event.request.isMainFrame()
                    Utils.emitEvent(result4.toString(),454)
                },3000)  
                setTimeout(()=>{
                    let result5 = event.request.isRedirect()
                    Utils.emitEvent(result5.toString(),455)
                },3000)    
                setTimeout(()=>{
                    let result6 = event.request.isRequestGesture()
                    Utils.emitEvent(result6.toString(),456)
                },3000)  
                setTimeout(()=>{
                    Utils.emitEvent(resph[0].headerKey.toString(),457)
                },3000) 
            })
            .onErrorReceive((event) => {
                console.log('getErrorInfo:' + event.error.getErrorInfo());
                console.log('getErrorCode:' + event.error.getErrorCode());
                console.log('url:' + event.request.getRequestUrl());
                console.log('isMainFrame:' + event.request.isMainFrame());
                console.log('isRedirect:' + event.request.isRedirect());
                console.log('isRequestGesture:' + event.request.isRequestGesture());
                console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString());
                let result = event.request.getRequestHeader();
                console.log('The request header result size is ' + result.length);
                for (let i of result) {
                    console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue);
                } 
            })
            Row(){
                Button("web click").key('webcomponent').onClick(async ()=>{
                    console.info("key==>"+this.str)
                    switch(this.str){
                        case "emitOnInterceptRequest":{ 
                            var str1= MessageLevel.Debug + MessageLevel.Error + MessageLevel.Info + MessageLevel.Log + MessageLevel.Warn
                            var str2= MixedMode.All+MixedMode.Compatible
                            var str3= HitTestType.EditText+HitTestType.Email+HitTestType.HttpAnchor +HitTestType.HttpAnchorImg+HitTestType.Img+HitTestType.Map+HitTestType.Phone+HitTestType.Unknown
                            var str4= CacheMode.None + CacheMode.Online
                            var str5= RenderExitReason.ProcessAbnormalTermination + RenderExitReason.ProcessWasKilled + RenderExitReason.ProcessOom +RenderExitReason.ProcessExitUnknown
                            var str7= FileSelectorMode.FileOpenMode+FileSelectorMode.FileOpenFolderMode+FileSelectorMode.FileSaveMode
                            var str8= ProtectedResourceType.MidiSysex
                            setTimeout(()=>{
                                let result = this.controller.getTitle()
                                Utils.emitEvent(result,450)
                            },3000)                                                                        
                            break;
                        }
                        case "emitGetRequestHeader":{ 
                            this.controller.refresh()                                                                        
                            break;
                        }
                        case "emitGetErrorCode":{ 
                            this.controller.refresh()                                                                        
                            break;
                        }
                        case "emitIsMainFrame":{ 
                            this.controller.refresh()                                                                        
                            break;
                        }
                        case "emitIsRedirect":{ 
                            this.controller.refresh()                                                                        
                            break;
                        }
                        case "emitIsRequestGesture":{ 
                            this.controller.refresh()                                                                        
                            break;
                        }
                        case "emitGetReasonMessage":{ 
                            this.controller.refresh()                                                                        
                            break;
                        }
                        default:
                            console.info("can not match case")
                    }
                })
            }
        }
    }
}