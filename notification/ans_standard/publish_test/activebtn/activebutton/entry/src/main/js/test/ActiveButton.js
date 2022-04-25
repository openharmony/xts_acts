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
import WantAgent from '@ohos.wantAgent'
import { OperationType, WantAgentFlags } from '@ohos.wantagent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsAnsActionButtonTest', function () {
    console.info("===ActsDoNotSubscriberTest start===>");
    function publishCallbacka(err){
        console.debug("===>publishCallbacka===>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function publishCallbackb(err){
        console.debug("===>publishCallbackb===>"+err.code);
        expect(err.code).assertEqual(0)
    }
    function publishCallbackc(err){
        console.debug("===>publishCallbackc===>"+err.code);
        expect(err.code).assertEqual(0)
    }

    function consumeCallbackA(data) {
        console.debug("===>consumeCallbackA data : ===>" +JSON.stringify(data));
        var triggerInfo = {
            code:0
        }
        expect(data.request.actionButtons[0].title).assertEqual("buttonA")
        var wantAgenta = data.request.actionButtons[0].wantAgent
        console.debug("===>titleA: ===>" + JSON.stringify(data.request.actionButtons[0].title))
        console.debug("===>wantAgentA: ===>" + JSON.stringify(wantAgenta))
        WantAgent.trigger(wantAgenta, triggerInfo,
            (err, data) => {
                if (err.code == 0) {
                    console.info('==== triggerA success' + err.code+JSON.stringify(data) );
                } else {
                    console.info('----triggerA failed!----'+err.code);
                }
            }
        );
    }

    /*
     * @tc.number: ActsActiveButton_test_0100
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsActiveButton_test_0100', 0, async function (done) {
        console.debug("===ActsActiveButton_test_0100===begin===>");
        var subInfo ={
            onConsume:consumeCallbackA
        }
        notify.subscribe(subInfo);

        var agentInfoA = {
            wants: [
                    {
                        bundleName: "com.example.wantAgentTest",
                        abilityName: "com.example.wantAgentTest.MainAbility",
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
            wantAgentFlags:[WantAgentFlags.UPDATE_PRESENT_FLAG]
        };
        var wantAgentData = await WantAgent.getWantAgent(agentInfoA);

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
                    actionButtons: [{title:"buttonA", wantAgent:wantAgentData}]
                }
            await notify.publish(notificationRequest, publishCallbacka);
        console.info("===ActsActiveButton_test_0100===end===>");
        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ActsActiveButton_test_0100 setTimeout unsubscribe===>");
            done();
        }),300);
      })

    //consume
    function consumeCallbackB(data) {
        console.debug("===>consumeCallbackB data : ===>" +JSON.stringify(data));
        var triggerInfo = {
            code:1
        }
        expect(data.request.actionButtons[0].title).assertEqual("buttonB")
        var wantAgentB = data.request.actionButtons[0].wantAgent
        console.debug("===>titleB: ===>" + JSON.stringify(data.request.actionButtons[0].title))
        console.debug("===>wantAgentB: ===>" + JSON.stringify(wantAgentB))
        WantAgent.trigger(wantAgentB, triggerInfo,
            (err, data) => {
                if (err.code == 0) {
                    console.info('==== triggerB success' + err.code+JSON.stringify(data) );
                } else {
                    console.info('----triggerB failed!----'+err.code);
                }
            }
        );
    }

    /*
     * @tc.number: ActsActiveButton_test_0200
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsActiveButton_test_0200', 0, async function (done) {
        console.debug("===ActsActiveButton_test_0200===begin===>");
        var subInfo ={
            onConsume:consumeCallbackB
        }
        notify.subscribe(subInfo);

        var agentInfoB = {
            wants: [
                    {
                        bundleName: "com.example.wantAgentTest",
                        abilityName: "com.example.wantAgentTest.MainAbility",
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
            wantAgentFlags:[WantAgentFlags.UPDATE_PRESENT_FLAG]
        };
        var wantAgentDataB = await WantAgent.getWantAgent(agentInfoB);

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
            id: 2,
            slotType : notify.SlotType.SERVICE_INFORMATION,
            actionButtons: [{title:"buttonB", wantAgent:wantAgentDataB}]
        }
        await notify.publish(notificationRequest).then(()=>{
            console.info("===ActsActiveButton_test_0200===promise===>");
        });
        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ActsActiveButton_test_0200 setTimeout unsubscribe===>");
            done();
        }),300);
    })


    function consumeCallbackC(data) {
        console.debug("===>consumeCallbackC data : ===>" +JSON.stringify(data));
        var triggerInfoC = {
            code:2
        }
        var triggerInfoD = {
            code:3
        }
        expect(data.request.actionButtons[0].title).assertEqual("buttonC")
        expect(data.request.actionButtons[1].title).assertEqual("buttonD")
        var wantAgentC = data.request.actionButtons[0].wantAgent
        var wantAgentD = data.request.actionButtons[1].wantAgent
        console.debug("===>wantAgentC: ===>" + JSON.stringify(wantAgentC))
        console.debug("===>wantAgentD: ===>" + JSON.stringify(wantAgentD))
        WantAgent.trigger(wantAgentC, triggerInfoC,
            (err, data) => {
                if (err.code == 0) {
                    console.info('==== triggerC success' + err.code+JSON.stringify(data) );
                } else {
                    console.info('----triggerC failed!----'+err.code);
                }
            });
        WantAgent.trigger(wantAgentD, triggerInfoD,
            (err, data) => {
                if (err.code == 0) {
                    console.info('==== triggered success' + err.code + JSON.stringify(data) );
                } else {
                    console.info('----triggered failed!----'+ err.code);
                }
            });
    }
})

