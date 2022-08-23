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

import notify from '@ohos.notification'
import wantAgent from '@ohos.wantAgent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
var timeout = 1800;

export default function ActsAnsDistributeTest() {
    describe('ActsAnsDistributeTest', function () {

        /*
         * @tc.number: ActsDistribute_test_0100
         * @tc.name: enableDistributed()
         * @tc.desc: verify the function of enableDistributed,isDistributedEnabled
         */
        it('ActsDistribute_test_0100', 0, async function (done) {
            await notify.enableDistributed(false,async() => {
                await notify.isDistributedEnabled((err,data) => {
                    console.log("===>ActsDistribute_test_0100 success===>"+err+data)
                    expect(data).assertEqual(false)
                    done();
                })
            })
        })
    
        /*
         * @tc.number: ActsDistribute_test_0200
         * @tc.name: enableDistributedByBundle()
         * @tc.desc: verify the function of enableDistributedByBundle,isDistributedEnableByBundle
         */
        it('ActsDistribute_test_0200', 0, async function (done) {
            await notify.enableDistributedByBundle({
                bundle:"com.example.actsansdistributetest"
            },true,async() => {
                await notify.isDistributedEnableByBundle({
                    bundle:"com.example.actsansdistributetest",
                },(err,data) => {
                    console.log("===>ActsDistribute_test_0200 success===>"+err+data)
                    expect(data).assertEqual(true)
                    done();
                })
            })
        })
    
        /*
         * @tc.number: ActsDistribute_test_0300
         * @tc.name: getDeviceRemindType()
         * @tc.desc: verify the function of getDeviceRemindType
         */
        it('ActsDistribute_test_0300', 0, async function (done) {
            await notify.getDeviceRemindType((err,data) => {
                console.debug("===>ActsDistribute_test_0300===>"+ JSON.stringify(data))
                if (data != notify.DeviceRemindType.IDLE_DONOT_REMIND 
                    && data != notify.DeviceRemindType.IDLE_REMIND
                    && data != notify.DeviceRemindType.ACTIVE_DONOT_REMIND
                    && data != notify.DeviceRemindType.ACTIVE_REMIND )
                    {
                        expect().assertFail();
                    }
                done();
            });
        })
    
        /*
         * @tc.number: ActsDistribute_test_0400
         * @tc.name: publish()
         * @tc.desc: verify the function of publish
         */
        it('ActsDistribute_test_0400', 0, async function (done) {
            function onConsume0100(data) {
                console.info("========ActsDistribute_test_0400 onConsume data:=======>" + JSON.stringify(data));
                if (data.request.distributedOption.remindType != notify.DeviceRemindType.IDLE_DONOT_REMIND 
                    && data.request.distributedOption.remindType != notify.DeviceRemindType.IDLE_REMIND
                    && data.request.distributedOption.remindType != notify.DeviceRemindType.ACTIVE_DONOT_REMIND
                    && data.request.distributedOption.remindType != notify.DeviceRemindType.ACTIVE_REMIND )		
                    {
                        expect().assertFail();
                    }
                expect(data.request.deviceId).assertEqual("");
                console.info("ActsDistribute_test_0400 onConsume data"+JSON.stringify(data.request.notifyFlags));
                expect(JSON.stringify(data.request.notifyFlags)).assertEqual(undefined);
            }
            await notify.enableDistributed(true);
            await notify.enableDistributedSelf(true);
            console.info("==================ActsDistribute_test_0400 start==================>");
            var subscriber ={
                onConsume:onConsume0100,
            }
            await notify.subscribe(subscriber);
            let DistributedOptions = {
                isDistributed: true, 
                supportDisplayDevices: ["0"], 
                supportOperateDevices: ["0"]
            }
            var notifyRequest = {
                content: {
                    contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                    normal: {
                        title: "test13_title",
                        text: "test13_text",
                        additionalText: "test13_additionalText"
                    }
                },
                id: 4,
                label: "ANS_PublishBasicText_0100",
                slotType : notify.SlotType.CONTENT_INFORMATION,
                distributedOption:DistributedOptions
            }
            await notify.publish(notificationRequest);
            console.info("===========ActsDistribute_test_0400 publish promise========>");
            setTimeout((async function(){
                console.info("======ActsDistribute_test_0400 setTimeout==============>");
                await notify.unsubscribe(subscriber);
                console.info("======ActsDistribute_test_0400 setTimeout unsubscribe==>");
                done();
            }),timeout);
        })
    
        /*
         * @tc.number: ActsDistribute_test_0500
         * @tc.name: onEnabledNotificationChanged()
         * @tc.desc: verify the function of onEnabledNotificationChanged
         */
        it('ActsDistribute_test_0500', 0, async function (done) {
            function onEnablednotifyChanged001(data){
                console.log("===>onEnablednotifyChanged001 success===>"+JSON.stringify(data))
                console.log("===>onEnablednotifyChanged001 bundle===>"+JSON.stringify(data.bundle))
                console.log("===>onEnablednotifyChanged001 uid===>"+JSON.stringify(data.uid))
                console.log("===>onEnablednotifyChanged001 enable===>"+JSON.stringify(data.enable))
                expect(JSON.stringify(data.bundle)).assertEqual("com.example.actsansdistributetest");
                expect(JSON.stringify(data.uid)).assertEqual("454231");
                expect(JSON.stringify(data.enable)).assertEqual(true);
            }
            function connectCallbacka() {
                console.debug("==>connectCallbacka code==>");
            }
            var subscriber ={
                onConnect:connectCallbacka,
                onEnablednotifyChanged:onEnablednotifyChanged001,
            }
            await notify.subscribe(subscriber,async(err)=>{
                console.debug("==>subscribeCallback code==>" +err.code);
                expect(err.code).assertEqual(0);
                await notify.requestEnablenotify((err) => {
                    console.log("===>ActsDistribute_test_0500 success===>"+err.code)
                })
            });
            setTimeout((async function(){
                console.info("======ActsDistribute_test_0500 setTimeout==============>");
                await notify.unsubscribe(subscriber);
                console.info("======ActsDistribute_test_0500 setTimeout unsubscribe==>");
                done();
            }),timeout);
        })
    
        /*
         * @tc.number: ActsDistribute_test_0600
         * @tc.name: Query whether the template exists
         * @tc.desc: isSupportTemplate(templateName: string, callback: AsyncCallback<boolean>): void
         */
        it('ActsDistribute_test_0600', 0, async function (done) {
            console.info("==>ActsDistribute_test_0600 start==>");
            var templateName = '/system/etc/notification_template/assets/js/downloadTemplate.js';
            function isSupportTemplateCallback(err, data) {
                if(err) {
                    console.error("isSupportTemplateCallback" + err.code);
                } else {
                    expect(true).assertTrue();
                    console.info("isSupportTemplateCallback" + JSON.stringify(data));
                    done();
                }
            }
            notify.isSupportTemplate(templateName, isSupportTemplateCallback);
            done();
        })
    
        /*
         * @tc.number: ActsDistribute_test_0700
         * @tc.name: Query whether the template exists
         * @tc.desc: isSupportTemplate(templateName: string): Promise<boolean>
         */
        it('ActsDistribute_test_0700', 0, async function (done) {
            console.info("==>ActsDistribute_test_0700 start==>");
            var templateName = '/system/etc/notification_template/assets/js/downloadTemplate.js';
            notify.isSupportTemplate(templateName).then ((data) => {
                expect(data).assertEqual(false);
                console.info("isSupportTemplatePromise");
                console.info("==>ActsDistribute_test_0700 success==>" + JSON.stringify(data));
                done();
            })
            done();
        })
    
        /*
         * @tc.number: ActsDistribute_test_0800
         * @tc.name: add NotificationActionButton
         * @tc.desc: NotificationActionButton userInput inputKey
         */    
        it('ActsDistribute_test_0800', 0, async function (done) {
            const TAG = 'NotificationActionButton ===> '
            const BundleOption = {
              bundle: 'com.example.actsansdistributetest'
            }
            await notify.isNotificationEnabled(BundleOption, (err, data) => {
              if (err.code) {
                console.info(TAG + ': isNotificationEnabled failed! Err.code ===> ' + JSON.stringify(err.code))
                console.info(TAG + ': isNotificationEnabled failed! Err.message ===> ' + JSON.stringify(err.message))
                expect(false).assertTrue()
              } else {
                console.info(TAG + ': isNotificationEnabled success! Result ===> ' + JSON.stringify(data))
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
              expect(data.request.content.normal.creatorBundleName).assertEqual(BundleOption.bundle);
              expect(data.request.content.normal.creatorPid != undefined).assertTrue()
              expect(data.request.content.normal.creatorUid != undefined).assertTrue()
              expect(data.request.actionButtons[0].title).assertEqual('additionalText');
              expect(data.request.actionButtons[0].extras.wantAgentInfo_key_1).assertEqual('wantAgentInfo_key_1')
              expect(data.request.actionButtons[0].extras.wantAgentInfo_key_2).assertEqual('wantAgentInfo_key_2')
              expect(data.request.actionButtons[0].userInput.inputKey).assertEqual('Please input at this')
              expect(true).assertTrue()
        
              await notify.unsubscribe(NotificationSubscriber, (err) => {
                if (err.code) {
                  console.info(TAG + ': unsubscribe failed! Err.code ===> ' + JSON.stringify(err.code))
                  console.info(TAG + ': unsubscribe failed! Err.message ===> ' + JSON.stringify(err.message))
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(TAG + ': unsubscribe success!')
                  expect(true).assertTrue()
                }
              })
            }
        
            let NotificationSubscriber = {
              onConsume: SubscribeCallbackData
            }
        
            await notify.subscribe(NotificationSubscriber, (err) => {
              if (err.code) {
                console.info(TAG + ': subscribe failed! Err.code ===> ' + JSON.stringify(err.code))
                console.info(TAG + ': subscribe failed! Err.message ===> ' + JSON.stringify(err.message))
                expect(false).assertTrue()
              } else {
                console.info(TAG + ': subscribe success!')
                expect(true).assertTrue()
                done()
              }
            })
        
            let wantAgentInfo = {
              wants: [
                {
                  bundleName: 'com.example.actsansdistributetest',
                  abilityName: 'com.example.actsansdistributetest.TestAbility'
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
        
            let wantAgentInstance = await wantAgent.getWantAgent(wantAgentInfo)
            const NotificationRequest = {
              content: {
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: 'title',
                  text: 'text',
                  additionalText: 'additionalText'
                },
              },
              actionButtons: [
                {
                  title: 'activeButton_title',
                  wantAgent: wantAgentInstance,
                  extras: {
                    wantAgentInfo_key_1: 'wantAgentInfo_key_1',
                    wantAgentInfo_key_2: 'wantAgentInfo_key_2',
                  },
                  userInput: {
                    inputKey: 'Please input at this'
                  }
                }
              ],
            }
        
            await notify.publish(NotificationRequest, (err) => {
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
            
      })
}
