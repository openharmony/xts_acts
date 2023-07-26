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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import image from "@ohos.multimedia.image"
let loadedUrl;
@Entry
@Component
struct Index {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
    controllerThree: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitGetWebId";
    @State webId:number=0;
    @State webId2:number=0;
    @State webId3:number=0;
    @State webIdTol:number=0;
    @State userAgent:string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
    @State userAgent2:string = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " Chrome/86.0.4240.198 Safari/537.36";
    @State userAgentAll:string = "";
    @State userAgentCheck:string = "";
    @State pageResult:boolean=false;
    @State pageResult2:boolean=false;
    @State indexUrl:string = "//rawfile/indexCopy.html";
    @State indexUrlTwo:string = "//rawfile/indexTwo.html";
    @State indexUrlAll:string = "//rawfile/indexCopy.html";
    @State pixelmap: image.PixelMap = undefined;
    @State javaScriptAccess:boolean=true;
    @State fileAccess:boolean=true;
    @State domStorageAccess:boolean=false;
    @State imageAccess:boolean=true;
    @State onlineImageAccess:boolean=true;
    @State databaseAccess:boolean=true;
    @State checkEleResult: Object = {};
    @State checkEleResultAgain: Object = {};
    @State checkEleResult1: Object = {};
    @State checkEleResult2: Object = {};
    @State checkEleResult3: Object = {};
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
        },
        register:(res)=>{
            Utils.emitEvent(res,86);
            return "web222"
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
            Row() {
                Button("web click").key('webcomponent').onClick(async () => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitGetWebId": {
                            try {
                                this.webId = this.controller.getWebId();
                                this.webId2 = this.controllerTwo.getWebId();
                                this.webId3 = this.controllerThree.getWebId();
                                console.log("id: " + this.webId + this.webId2 + this.webId);
                                this.webIdTol = this.webId + this.webId2 + this.webId3;
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.webIdTol, 100)
                            })
                            break;
                        }
                        case "emitgetUserAgent": {
                            try {
                                this.userAgent = this.controller.getUserAgent();
                                console.log("userAgent: " + this.userAgent);
                                this.userAgent2 = this.controllerTwo.getUserAgent();
                                console.log("userAgent2: " + this.userAgent2);
                                this.userAgentAll = this.userAgent + this.userAgent2;
                                console.log("userAgentAll: " + this.userAgentAll);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.userAgentAll, 1020)
                            })
                            break;
                        }
                        case "emitgetUserAgentAgain": {
                            try {
                                this.userAgentCheck = this.controllerThree.getUserAgent();
                                console.log("userAgentCheck: " + this.userAgentCheck);
                                this.controllerThree.runJavaScript("getUserAgent()",(error, result) => {
                                    this.userAgentCheck = result
                                    console.log(`The controllerThree.getUserAgent() return value is: ${result}`);
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.userAgentCheck, 104)
                            })
                            break;
                        }
                        case "emitpageDown": {
                            try {
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResult = JSON.parse(result)
                                    console.log(`The checkVIsible() return value is: ${result}`);
                                })                                
                                this.controller.pageDown(false);
                                await Utils.sleep(1000)
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResultAgain = JSON.parse(result)
                                    console.log(`The checkVIsible() again return value is: ${result}`);
                                    if (this.checkEleResult[3] < JSON.parse(result)[3] && JSON.parse(result)[3] <
                                    (JSON.parse(result)[1]/2)) {
                                        this.pageResult = true;
                                        console.log('emitpageDown result is :' + this.pageResult);
                                    }else {
                                        this.pageResult = false;
                                        console.log('emitpageDown result is :' + this.pageResult);
                                    }
                                })                                   
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.pageResult = false;
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.pageResult, 106)
                            })
                            break;
                        }
                        case "emitpageUp": {
                            try {
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResult = JSON.parse(result)
                                    console.log(`The checkVIsible() return value is: ${result}`);
                                })                               
                                this.controller.pageUp(false);
                                await Utils.sleep(1000)
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResultAgain = JSON.parse(result)
                                    console.log(`The checkVIsible() again return value is: ${result}`);
                                    if (JSON.parse(result)[3] == 0 && this.checkEleResult[3] >
                                    (JSON.parse(result)[1]/4)) {
                                        this.pageResult = true;
                                        console.log('emitpageUp result is :' + this.pageResult);
                                    }else {
                                        this.pageResult = false;
                                        console.log('emitpageUp result is :' + this.pageResult);
                                    }
                                })                                 
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.pageResult = false;
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.pageResult, 108)
                            })
                            break;
                        }
                        case "emitpageDownAgain": {
                            try {
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResult = JSON.parse(result)
                                    console.log(`The checkVIsible() return value is: ${result}`);
                                })                               
                                this.controller.pageDown(true);
                                await Utils.sleep(1000)
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResultAgain = JSON.parse(result)
                                    console.log(`The checkVIsible() again return value is: ${result}`);
                                    if ((JSON.parse(result)[1]/2) < JSON.parse(result)[3] && JSON.parse(result)[3] <
                                    JSON.parse(result)[1]) {
                                        this.pageResult = true;
                                        console.log('emitpageDownAgain result is :' + this.pageResult);
                                    }else {
                                        this.pageResult = false;
                                        console.log('emitpageDownAgain result is :' + this.pageResult);
                                    }
                                })                                   
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.pageResult = false;
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.pageResult, 110)
                            })
                            break;
                        }
                        case "emitpageUpAgain": {
                            try {
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResult = JSON.parse(result)
                                    console.log(`The checkVIsible() return value is: ${result}`);
                                })                                
                                this.controller.pageUp(true);
                                await Utils.sleep(1000)
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResultAgain = JSON.parse(result)
                                    console.log(`The checkVIsible() again return value is: ${result}`);
                                    if (JSON.parse(result)[3] == 0 && this.checkEleResult[3] > (JSON.parse(result)[1]/2)) {
                                        this.pageResult = true;
                                        console.log('emitpageUpAgain result is :' + this.pageResult);
                                    }else {
                                        this.pageResult = false;
                                        console.log('emitpageUpAgain result is :' + this.pageResult);
                                    }
                                })                                  
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.pageResult = false;
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.pageResult, 112)
                            })
                            break;
                        }
                        case "emitGetFavicon": {
                            try {
                                this.controller.loadUrl($rawfile('indexCopy.html'))
                                this.pixelmap = this.controller.getFavicon();
                                this.pixelmap.getImageInfo().then(imageInfo => {
                                    if (imageInfo == undefined) {
                                        console.error("Failed to obtain the image pixel map information.");
                                    }
                                    console.log("the result of pixelmap: " + JSON.stringify(imageInfo));
                                    Utils.emitEvent(Object.getOwnPropertyNames(imageInfo).length, 114)
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                Utils.emitEvent(this.pixelmap, 114)
                            }
                            break;
                        }
                        case "emitGetFaviconAgain": {
                            try {
                                this.controller.loadUrl($rawfile('secondCopy.html'))
                                await Utils.sleep(1000)
                                this.pixelmap = this.controller.getFavicon();
                                this.pixelmap.getImageInfo().then(imageInfo => {
                                    if (imageInfo == undefined) {
                                        console.error("Failed to obtain the image pixel map information.");
                                    }
                                    console.log("the result of pixelmap: " + JSON.stringify(imageInfo));
                                    Utils.emitEvent(Object.getOwnPropertyNames(imageInfo).length, 116)
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitGetOriginalUrl": {
                            try {
                                this.controller.loadUrl($rawfile('secondCopy.html'))
                                let indexUrl = this.controller.getOriginalUrl();
                                console.log("original url: " + this.indexUrl);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.indexUrl, 118)
                            })
                            break;
                        }
                        case "emitGetOriginalUrlTwo": {
                            try {
                                this.controller.loadUrl($rawfile('secondCopy.html'))
                                let indexUrl = this.controller.getOriginalUrl();
                                console.log("original url: " + this.indexUrl);
                                this.controllerTwo.loadUrl($rawfile('secondCopy.html'))
                                let indexUrlTwo = this.controller.getOriginalUrl();
                                console.log("original urlTwo: " + this.indexUrlTwo);
                                this.indexUrlAll = this.indexUrl + this.indexUrlTwo;
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.indexUrlAll, 120)
                            })
                            break;
                        }
                        case "emitSetNetworkAvailable": {
                            try {
                                this.controller.loadUrl($rawfile('indexCopy.html'))
                                this.controller.setNetworkAvailable(false);
                                await Utils.sleep(3000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getNavigatorOnLine()",(error,result) => {
                                if (error) {
                                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                                    return;
                                }
                                if (result) {
                                    console.log("result:"+result+JSON.stringify(result))
                                    let pageResult2 = result;
                                    console.log("the status of navigator.onLine: " + this.pageResult2 + result);
                                }
                                Utils.emitEvent(this.pageResult2, 122)
                            })
                            break;
                        }
                        case "emitSetNetworkAvailableAgain": {
                            try {
                                this.controller.loadUrl($rawfile('indexCopy.html'))
                                this.controller.setNetworkAvailable(true);
                                await Utils.sleep(3000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getNavigatorOnLine()",(error,result) => {
                                if (error) {
                                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                                    return;
                                }
                                if (result) {
                                    console.log("result:"+result+JSON.stringify(result))
                                    let pageResult = result;
                                    console.log("the status of navigator.onLine: " + this.pageResult + result);
                                }
                                Utils.emitEvent(this.pageResult, 124)
                            })
                            break;
                        }
                    }
                })
            }
            Web({src:$rawfile('indexCopy.html'),controller:this.controller})
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .userAgent(this.userAgent)

            Web({src:$rawfile('indexTwo.html'),controller:this.controllerTwo}).id('2').key('web2')
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .userAgent(this.userAgent2)

            Web({src:$rawfile('indexThree.html'),controller:this.controllerThree}).id('3').key('web3')
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .userAgent(this.userAgentAll)
            .userAgent(this.userAgent)
            .userAgent(this.userAgent2)
        }
    }
}