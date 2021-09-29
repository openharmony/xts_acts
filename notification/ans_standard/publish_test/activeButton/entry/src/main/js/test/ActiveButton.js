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
import notify from '@ohos.notification'
import wantagent from '@ohos.wantAgent'
import image from '@ohos.multimedia.image'
import { OperationType, Flags } from '@ohos.wantagent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

var largeBuffer
var smallBuffer
var opts
var subInfo
var largeIcon
var smallIcon
var time = 1000
describe('ActsAnsActionButtonTest', function () {
    console.info("===========ActsDoNotSubscriberTest start====================>");

    //consume
    function consumeCallback(err,data) {
        console.debug("==========================>consumeDoNotCallbackOne data : =======================>" +err+ JSON.stringify(data));
        expect(typeof(data.request.actionButtons)).assertEqual('object')
        for(let i=0; i<data.request.actionButtons; i++)
        {
            console.debug("======consumeCallback====data.actionButtons.title:====>" + data.request.actionButtons[i].title);
            console.debug("======consumeCallback====sortings.hashCode:====>" + data.request.actionButtons[i].wantAgent);
            console.debug("======consumeCallback====sortings.hashCode:====>" + data.request.actionButtons[i].icon);
        }
    }
    //consume
    function consumeCallbackTwo(err,data) {
        console.debug("==========================>consumeDoNotCallbackTwo data : =======================>" +err+ JSON.stringify(data));
        expect(typeof(data.request.actionButtons)).assertEqual('object')
        for(let i=0; i<data.request.actionButtons; i++)
        {
            console.debug("======consumeDoNotCallbackTwo====sortings.hashCode:====>" + data.request.actionButtons[i].title);
            console.debug("======consumeDoNotCallbackTwo====sortings.hashCode:====>" + data.request.actionButtons[i].wantAgent);
            console.debug("======consumeCallback====sortings.hashCode:====>" + data.request.actionButtons[i].icon);
        }
    }
    //subscribe
    function subscribeCallback(err) {
        console.debug("==========================>subscribeDoNotCallback=======================>");
    }
    function publishCallback200(){
        console.debug("==========================>publishCallback200=======================>");
    }
    /*
     * @tc.number: ActsDoNotSubscriber_test_0100
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsActiveButton_test_0100', 0, async function (done) {
        console.debug("===============ActsActiveButton_test_0100======begin====================>");

        var subInfo ={
            onConsume:consumeCallback
        }
        try{
            await notify.subscribe(subInfo,subscribeCallback);
        }catch(err) {
            console.error('=ActsActiveButton_test_0100  订阅 activeButton err:'+err);
        }
        console.debug("===============ActsActiveButton_test_0100=======end3===================>");

        var agentInfo = {
            wants: [
                    {
                        deviceId: "deviceId",
                        bundleName: "com.example.test",
                        abilityName: "com.example.test.TriggerAbility",
                        action: "action1",
                        entities: ["entity1"],
                        type: "MIMETYPE",
                        uri: "key={true,true,false}",
                        parameters:
                        {
                            mykey0: 2222,
                            mykey1: [1, 2, 3],
                            mykey2: "[1, 2, 3]",
                            mykey3: "ssssssssssssssssssssssssss",
                            mykey4: [false, true, false],
                            mykey5: ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
                            mykey6: true,
                        }
                    }
            ],
            operationType: OperationType.START_ABILITY,
            requestCode: 0,
            wantAgentFlags:[Flags.UPDATE_PRESENT_FLAG]
        };
        var wantAgentData = await wantagent.getWantAgent(agentInfo);
        largeBuffer = new ArrayBuffer(64);
        smallBuffer = new ArrayBuffer(32);
        opts = {alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: {height: 2, width: 3}}
        const promise_Large = image.createPixelMap(largeBuffer, opts);
        promise_Large.then((data) => {
            console.debug("==========================createPixelMap_promise_Large=======================>");
            largeIcon = data;
            console.debug("==========================createPixelMap_promise_Large largeIcon=======================>"+largeIcon);

        const promise_Small = image.createPixelMap(smallBuffer, opts);
        promise_Small.then((data) => {
            console.debug("==========================createPixelMap_promise_Small=======================>");
            smallIcon = data;
            console.debug("==========================createPixelMap_promise_Small smallIcon=======================>"+smallIcon);

        var notificationRequest = {
                    content:{
                        contentType: notify.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
                        longText : {
                            title: "test_title",
                            text: "test_text",
                            additionalText: "test_additionalText",
                            longText: "long_text",
                            briefText: "long_briefText",
                            expandedTitle: "long_expandedTitle"
                        },
                    },
                    id: 1,
                    slotType : notify.SlotType.SERVICE_INFORMATION,
                    actionButtons: [{title:"button", wantAgent:wantAgentData,icon:largeIcon},{title:"button", wantAgent:wantAgentData,icon:smallIcon}]
                }
             notify.publish(notificationRequest, publishCallback200);
        console.info("===============ActsActiveButton_test_0100==========================>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsActiveButton_test_0100====>");
        }, time);
        })
    })
})
})

