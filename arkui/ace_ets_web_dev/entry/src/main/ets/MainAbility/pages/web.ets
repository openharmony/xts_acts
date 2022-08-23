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

let loadedUrl;
@Entry
@Component
struct Index {
    controller:WebController = new WebController()
    @State str:string="emitUserAgent"
    @State loadedResource:string=""
    @State progress:string=""
    @State newUrl:string=""
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
    private jsObj={
        test:(res)=>{
            Utils.emitEvent(res,102);
        },
        toString:(str)=>{
            console.info("ets toString:"+String(str));
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
            Web({src:$rawfile('index.html'),controller:this.controller})
            .userAgent("Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36")
            .javaScriptProxy({
                object:this.jsObj,
                name:"backToEts",
                methodList:["test","toString"],
                controller:this.controller
            })
            .onUrlLoadIntercept((event)=>{
                console.info("onUrlLoadIntercept==>"+event.data)
                loadedUrl=String(event.data)
                return false
            })
            .onRenderExited((event)=>{
                console.info("onRenderExited==>"+event.renderExitReason)
                Utils.emitEvent(event.renderExitReason,106)
            })
            .onResourceLoad((event)=>{
                console.info("onResourceLoad==>"+event.url)
                this.loadedResource=event.url
            })
            .onProgressChange((event)=>{
                console.info("onProgressChange==>")
                this.progress=event.newProgress+""
            })
            .onRefreshAccessedHistory((event)=>{
                console.info("onRefreshAccessedHistory==>")
                this.newUrl=event.url
            })
            .onFocus(()=>{
                Utils.emitEvent("requestFocus",126)
            })
            Row(){
                Button("web click").key('webcomponent').onClick(()=>{
                    console.info("key==>"+this.str)
                    switch(this.str){
                        case "emitUserAgent":{
                            this.controller.runJavaScript({script:"getUserAgent()",callback:(res)=>{
                                Utils.emitEvent(res,100)
                            }})
                            break;
                        }
                        case "emitJavaScriptProxy":{
                            this.controller.runJavaScript({script:"test()"})
                            break;
                        }
                        case "emitOnUrlLoadIntercept":{
                            this.controller.loadUrl({url:"https://www.gitee.com/"})
                            setTimeout(()=>{
                                Utils.emitEvent(loadedUrl,104)
                            },3000)
                            break;
                        }
                        case "emitOnRenderExited":{
                            this.controller.loadUrl({url:"chrome://crash/"})
                            break;
                        }
                        case "emitOnResourceLoad":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/second.html"})
                            setTimeout(()=>{
                                Utils.emitEvent(this.loadedResource,108)
                            },3000)
                            break;
                        }
                        case "emitLoadUrl":{
                            this.controller.loadUrl({url:"https://www.gitee.com"})
                            setTimeout(()=>{
                                let webTitle=this.controller.getTitle()
                                Utils.emitEvent(webTitle,110)
                            },3000)
                            break;
                        }
                        case "emitRunJavaScript":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"})
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"testRunJavaScript()",callback:(res)=>{
                                    Utils.emitEvent(res,112)
                                }})
                            },3000)
                            break;
                        }
                        case "emitOnProgressChange":{
                            this.controller.loadUrl({url:"https://www.gitee.com"})
                            setTimeout(()=>{
                                Utils.emitEvent(this.progress,114)
                            },3000)
                            break;
                        }
                        case "emitOnRefreshAccessedHistory":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/second.html"})
                            setTimeout(()=>{
                                Utils.emitEvent(this.newUrl,116)
                            },3000)
                            break;
                        }
                        case "emitGetHitTest":{
                            let hitType=JSON.stringify(this.controller.getHitTest())
                            Utils.emitEvent(hitType,118)
                            break;
                        }
                        case "emitGetWebId":{
                            let webId=this.controller.getWebId()+""
                            Utils.emitEvent(webId,120)
                            break;
                        }
                        case "emitGetTitle":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"})
                            setTimeout(()=>{
                                let webTitle=this.controller.getTitle()
                                Utils.emitEvent(webTitle,122)
                            },3000)
                            break;
                        }
                        case "emitGetPageHeight":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"})
                            let webPageHeight=this.controller.getPageHeight()+""
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getPageHeight()",callback:(res)=>{
				    console.info("getPageHeight==>"+res)
                                    Utils.emitEventTwo(res,webPageHeight,124)
                                }})
                            },3000)
                            break;
                        }
                        case "emitGetRequestFocus":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/second.html"})
                            this.controller.requestFocus()
                            break;
                        }
                        case "emitAccessBackward":{
                            let isCan=this.controller.accessBackward()+""
                            Utils.emitEvent(isCan,128)
                            break;
                        }
                        case "emitAccessForward":{
                            let isCan=this.controller.accessForward()+""
                            Utils.emitEvent(isCan,130)
                            break;
                        }
                        case "emitAccessStep":{
                            let isCan=this.controller.accessStep(-1)+""
                            Utils.emitEvent(isCan,132)
                            break;
                        }
                        case "emitBackward":{
                            this.controller.backward()
                            setTimeout(()=>{
                                let webTitle=this.controller.getTitle()
                                Utils.emitEvent(webTitle,134)
                            },3000)
                            break;
                        }
                        case "emitForward":{
                            this.controller.forward()
                            setTimeout(()=>{
                                let webTitle=this.controller.getTitle()
                                Utils.emitEvent(webTitle,136)
                            },3000)
                            break;
                        }
                        case "emitBackOrForward":{
                            this.controller.backOrForward(-1)
                            setTimeout(()=>{
                                let webTitle=this.controller.getTitle()
                                Utils.emitEvent(webTitle,138)
                            },3000)
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
