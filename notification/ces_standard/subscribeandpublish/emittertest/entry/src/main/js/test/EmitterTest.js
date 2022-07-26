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
import notification from '@ohos.notification';
import commonEvent from '@ohos.commonEvent';
import wantAgent from '@ohos.wantAgent';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Assert } from 'deccjsunit/index';

describe('EmitterTest', function () {
    const TAG = 'EmitterTest ===> '
    async function applyPermission() {
        let appInfo = await bundle.getApplicationInfo('com.example.emittertest', 0, 100);
        let atManager = abilityAccessCtrl.createAtManager();
        if (atManager != null) {
            let tokenID = appInfo.accessTokenId;
            console.info('[permission]case accessTokenId is' + tokenID);
            let permissionName1 = 'ohos.permission.NOTIFICATION_CONTROLLER';
           
            await atManager.grantUserGrantedPermission(tokenID, permissionName1).then((result) => {
                console.info('[permission]case grantUserGrantedPermission success:' + result);
            }).catch((err) => {
                console.info('[permission]case grantUserGrantedPermission failed:' + err);
            });
        } else {
            console.info('[permission]case apply permission failed,createAtManager failed');
        }
    }

    const bundlel = {
        bundle: 'com.example.emittertest'
    }

    let innerEvent = {
        eventId: undefined,
        priority: undefined
    }
    
    let eventData = {
        data: {
            'id': undefined,
            'content': undefined
        }
    }

    let wantAgentInfo = {
        wants: [
            {
                bundleName: 'com.example.emittertest',
                abilityName: 'com.example.emittertest.TestAbility'
            }
        ],
        operationType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
        extraInfo: {
            key_1: 'value_1',
            key_2: 'value_2',
        }
    }
    let subscriber = undefined
    beforeAll(async function() {
        await applyPermission();
        await notification.enableNotification(bundlel, true, (err) => {
            if (err.code) {
                console.info(TAG + ': enableNotification failed! Err.code ===> ' + JSON.stringify(err.code))
                console.info(TAG + ': enableNotification failed! Err.message ===> ' + JSON.stringify(err.message))
                expect(false).assertTrue()
            } else {
                console.info(TAG + ': enableNotification successd!')
                expect(true).assertTrue()
            }
        });
        console.info(TAG + 'beforeAll case');
    })
    afterEach(async function() {
        await notification.cancelAll((err) => {
            if (err.code) {
                console.info(TAG + ': cancelAll failed! Err.code ===> ' + err.code)
                console.info(TAG + ': cancelAll failed! Err.message ===> ' + err.message)
                expect(false).assertTrue()
            } else {
                console.info(TAG + ': cancelAll successd!')
                expect(true).assertTrue()
            }
        })
    })
    function EmitterCallback(eventData) {
        console.info(TAG + 'eventData.id: ' + JSON.stringify(eventData.data.id));
        console.info(TAG + 'eventData.content: ' + JSON.stringify(eventData.data.content));
        if (eventData.data.id == 0) {
            expect(eventData.data.content).assertEqual('message_0');
        } else if (eventData.data.id == 1) {
            expect(eventData.data.content).assertEqual('message_1');
        } else if (eventData.data.id == 2) {
            expect(eventData.data.content).assertEqual('message_2');
        } else if (eventData.data.id == 3) {
            expect(eventData.data.content).assertEqual('message_3');
        } else if (eventData.data.id == 4) {
            expect(eventData.data.content).assertEqual('message_4');
        } else if (eventData.data.id == 5) {
            expect(eventData.data.content).assertEqual('message_5');
        }
    }

    it('EmitterTest_001', 0, async function (done) {
        console.info(TAG + 'EmitterTest_001 start.')
        innerEvent.eventId = 1
        innerEvent.priority = events_emitter.EventPriority.IDLE

        eventData.data.id = 0
        eventData.data.content = 'message_0'

        events_emitter.on(innerEvent, EmitterCallback)
        events_emitter.emit(innerEvent, eventData)
        eventData.data.id = 1
        eventData.data.content = 'message_1'
        events_emitter.emit(innerEvent, eventData)
        console.info(TAG + 'EmitterTest_001 end.')
        done()
    })

    it('EmitterTest_002', 0, async function (done) {
        console.info(TAG + 'EmitterTest_002 start.')
        innerEvent.eventId = 2
        innerEvent.priority = events_emitter.EventPriority.LOW

        eventData.data.id = 2
        eventData.data.content = 'message_2'

        events_emitter.once(innerEvent, EmitterCallback)
        events_emitter.emit(innerEvent, eventData)
        console.info(TAG + 'EmitterTest_002 end.')
        done()
    })

    it('EmitterTest_003', 0, async function (done) {
        console.info(TAG + 'EmitterTest_003 start.')
        innerEvent.eventId = 3
        innerEvent.priority = events_emitter.EventPriority.HIGH

        eventData.data.id = 3
        eventData.data.content = 'message_3'

        events_emitter.once(innerEvent, EmitterCallback)
        events_emitter.emit(innerEvent, eventData)
        console.info(TAG + 'EmitterTest_003 end.')
        done()
    })

    it('EmitterTest_004', 0, async function (done) {
        console.info(TAG + 'EmitterTest_004 start.')
        innerEvent.eventId = 4
        innerEvent.priority = events_emitter.EventPriority.IMMEDIATE

        eventData.data.id = 4
        eventData.data.content = 'message_4'

        events_emitter.once(innerEvent, EmitterCallback)
        events_emitter.emit(innerEvent, eventData)
        console.info(TAG + 'EmitterTest_004 end.')
        done()
    })


    it('EmitterTest_005', 0, async function (done) {
        console.info(TAG + 'EmitterTest_005 start.')
        innerEvent.eventId = 5
        innerEvent.priority = events_emitter.EventPriority.IMMEDIATE

        eventData.data.id = 5
        eventData.data.content = 'message_5'

        events_emitter.once(innerEvent, EmitterCallback)
        events_emitter.emit(innerEvent, eventData)
        events_emitter.off(5)
        console.info(TAG + 'EmitterTest_005 end.')
        done()
    })

    it('wantAgent_trigger_001', 0, async function (done){
        await wantAgent.getWantAgent(wantAgentInfo, (err, data) => {
            if (err.code) {
                console.info(TAG + ': getWant failed! Err.code ===> ' + JSON.stringify(err.code))
                console.info(TAG + ': getWant failed! Err.message ===> ' + JSON.stringify(err.message))
                expect(false).assertTrue()
                done()
            } else {
                console.info(TAG + ': getWant successd!')
                console.info(TAG + ': wantAgentInfo ===> ' + JSON.stringify(data))
                expect(typeof(data)).assertEqual('object')

                let triggerInfo = {
                    code: 100,
                    want: null,
                    permission: null,
                    extraInfo: {
                        triggerInfo_key_1: 'triggerInfo_value_1',
                        triggerInfo_key_2: 'triggerInfo_value_2',
                    }
                }
                wantAgent.trigger(data, triggerInfo, (err, data) => {
                    console.info(TAG + ': trigger successd! CompleteData ===> ' + JSON.stringify(data))
                    console.info(TAG + ': data.want.bundleName ===> ' + JSON.stringify(data.want.abilityName))
                    console.info(TAG + ': data.want.abilityName ===> ' + JSON.stringify(data.want.abilityName))
                    console.info(TAG + ': data.want.parameters.key_1 ===> ' + JSON.stringify(data.want.parameters.key_1))
                    console.info(TAG + ': data.want.parameters.key_2 ===> ' + JSON.stringify(data.want.parameters.key_2))
                    expect(data.want.bundleName).assertEqual('com.example.emittertest')
                    expect(data.want.abilityName).assertEqual('com.example.emittertest.TestAbility')
                    expect(data.want.parameters.key_1).assertEqual('value_1')
                    expect(data.want.parameters.key_2).assertEqual('value_2')
                    done()
                })
            }
        })
    })


    it('notification_publish_001', 0, async function (done){
        await notification.isNotificationEnabled(bundlel, (err, data) => {
            if (err.code) {
                console.info(TAG + ': isNotificationEnabled failed! Err.code ===> ' + JSON.stringify(err.code))
                console.info(TAG + ': isNotificationEnabled failed! Err.message ===> ' + JSON.stringify(err.message))
                expect(false).assertTrue()
            } else {
                console.info(TAG + ': isNotificationEnabled successd! Result ===> ' + JSON.stringify(data))
                expect(true).assertTrue()
            }
        })
        async function SubscribeCallbackData(data) {
            console.info(TAG + ': data ===> ' + JSON.stringify(data))
            console.info(TAG + ': data.request.content.normal.title ===> ' + JSON.stringify(data.request.content.normal.title))
            console.info(TAG + ': data.request.content.normal.text ===> ' + JSON.stringify(data.request.content.normal.text))
            console.info(TAG + ': data.request.content.normal.additionalText ===> ' + JSON.stringify(data.request.content.normal.additionalText))
            console.info(TAG + ': data.request.actionButtons[0].title ===> ' + JSON.stringify(data.request.actionButtons[0].title))
            expect(data.request.content.normal.title).assertEqual('title');
            expect(data.request.content.normal.text).assertEqual('text');
            expect(data.request.content.normal.additionalText).assertEqual('additionalText');
            expect(data.request.content.normal.creatorBundleName).assertEqual(bundlel.bundle);
            expect(data.request.content.normal.creatorPid != undefined).assertTrue()
            expect(data.request.content.normal.creatorUid != undefined).assertTrue()
            expect(data.request.actionButtons[0].title).assertEqual('additionalText');
            expect(data.request.actionButtons[0].extras.wantAgentInfo_key_1).assertEqual('wantAgentInfo_key_1')
            expect(data.request.actionButtons[0].extras.wantAgentInfo_key_2).assertEqual('wantAgentInfo_key_2')
            expect(data.request.actionButtons[0].userInput.inputKey).assertEqual('Please input at this')
            expect(true).assertTrue()

            await notification.unsubscribe(NotificationSubscriber, (err) => {
                if (err.code) {
                    console.info(TAG + ': unsubscribe failed! Err.code ===> ' + JSON.stringify(err.code))
                    console.info(TAG + ': unsubscribe failed! Err.message ===> ' + JSON.stringify(err.message))
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(TAG + ': unsubscribe successd!')
                    expect(true).assertTrue()
                }
            })
        }

        let NotificationSubscriber = {
            onConsume:  SubscribeCallbackData
        }

        await notification.subscribe(NotificationSubscriber, (err)=>{
            if (err.code) {
                console.info(TAG + ': subscribe failed! Err.code ===> ' + JSON.stringify(err.code))
                console.info(TAG + ': subscribe failed! Err.message ===> ' + JSON.stringify(err.message))
                expect(false).assertTrue()
            } else {
                console.info(TAG + ': subscribe successd!')
                expect(true).assertTrue()
                done()
            }
        })

        let wantAgentInstance = await wantAgent.getWantAgent(wantAgentInfo)
        const NotificationRequest = {
            content : {
                contentType : notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal : {
                    title : 'title',
                    text : 'text',
                    additionalText : 'additionalText'
                },
            },
            actionButtons: [
                {
                    title : 'activeButton_title',
                    wantAgent : wantAgentInstance,
                    extras : {
                        wantAgentInfo_key_1: 'wantAgentInfo_key_1',
                        wantAgentInfo_key_2: 'wantAgentInfo_key_2',
                    },
                    userInput : {
                        inputKey : 'Please input at this'
                    }
                }
            ],
        }

        // 发布通知
        await notification.publish(NotificationRequest, (err) => {
            if (err.code) {
                console.info(TAG + ': publish failed! Err.code ===> ' + JSON.stringify(err.code))
                console.info(TAG + ': publish failed! Err.message ===> ' + JSON.stringify(err.message))
                expect(false).assertTrue()
            } else {
                console.info(TAG + ': publish successd!')
                expect(true).assertTrue()
            }
        })
    })


    it('commonEvent_subscriberInfo_001', 0, async function (done){
        let CommonEventSubscribeInfo = {
            events: ['event'],
            publisherPermission: '',
            publisherDeviceId: '',
            userId: 100,
            priority: 1000
        }

        let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscribeInfo)
        if (CommonEventSubscriber == undefined) {
            console.info(TAG + ': createSubscriber failed! Err.message ===> ' + JSON.stringify(CommonEventSubscriber))
            expect(false).assertTrue()
        }

        await CommonEventSubscriber.getSubscribeInfo((err, CommonEventSubscribeInfo)=>{
            if (err.code) {
                console.info(TAG + ': getSubscribeInfo failed! Err.code ===> ' + JSON.stringify(err.code))
                console.info(TAG + ': getSubscribeInfo failed! Err.message ===> ' + JSON.stringify(err.message))
                expect(false).assertTrue()
                done()
            } else {
                console.info(TAG + ': getSubscribeInfo successd! CommonEventSubscribeInfo ===> ' + JSON.stringify(CommonEventSubscribeInfo))
                done()
            }
        })
    })
    })

