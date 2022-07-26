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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
var timeout = 1000;
export default function ActsAnsPublishRemovalWantAgentTest() {
describe('ActsAnsPublishRemovalWantAgentTest', function () {
    console.info("===========ActsAnsPublishRemovalWantAgentTest start====================>");

    /*
     * @tc.number: ACTS_PublishRemovalWantAgent_xts_0100
     * @tc.name: removalWantAgent
     * @tc.desc: publish removalWantAgent notification
     */
    function consumeCallback(data) {
        console.info("===>consumeCallback data : ===>" +JSON.stringify(data));
        var wantAgentObj = data.removalWantAgent
        console.info("===>wantAgent: ===>" + JSON.stringify(wantAgentObj))
        WantAgent.getWant(wantAgentObj).then((data) => {
            expect(data[0].action).assertEqual("usual.event.REMOVAL_WANTAGENT");
        });
    }

    it('ACTS_PublishRemovalWantAgent_xts_0100', 0, async function (done) {
        console.info("===ACTS_PublishRemovalWantAgent_xts_0100===begin===>");
        var subInfo ={
            onConsume:consumeCallback
        }
        notify.subscribe(subInfo);

        var agentInfo = {
            wants: [
                {
                    bundleName: 'com.example.actsanspublishremovalwantagenttest',
                    abilityName: 'com.example.actsanspublishremovalwantagenttest.MainAbility',
                    action: "usual.event.REMOVAL_WANTAGENT"
                }
              ],
            operationType: WantAgent.OperationType.SEND_COMMON_EVENT,
            requestCode: 0,
            wantAgentFlags:[WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };

        var wantAgentData = await WantAgent.getWantAgent(agentInfo);

        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
                longText : {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_PublishRemovalWantAgent",
                    longText: "longText123456",
                    briefText: "briefText123456",
                    expandedTitle: "expandedTitle123456"
                }, 
            },
            id: 1,
            slotType : notify.SlotType.SERVICE_INFORMATION,
            removalWantAgent : wantAgentData
        }
        console.info("===ACTS_PublishRemovalWantAgent_xts_0100===publish===>");
        await notify.publish(notificationRequest, (err) => {
            console.info("===>publish callback===>"+err.code);
            expect(err.code).assertEqual(0)
        });
        console.info("===ACTS_PublishRemovalWantAgent_xts_0100===end===>");

        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ACTS_PublishRemovalWantAgent_xts_0100 setTimeout unsubscribe===>");
            done();
        }),timeout);
    });

    /*
     * @tc.number: SetEnabledForUninstallApp_test_0100
     * @tc.name: set and get enabled when distributed device without app
     * @tc.desc: set true and get true
     */
    it('SetEnabledForUninstallApp_test_0100', 0, async function (done) {
        await notify.setSyncNotificationEnabledWithoutApp(
           100,true,async() => {
            await notify.getSyncNotificationEnabledWithoutApp(100, (err,data) => {
                console.log("===>getSyncNotificationEnabledWithoutApp===>"+err+data)
                expect(data).assertEqual(true)
                done();
            })
        })
    })

    /*
     * @tc.number: SetEnabledForUninstallApp_test_0200
     * @tc.name: set and get enabled when distributed device without app
     * @tc.desc: set false and get false
     */
    it('SetEnabledForUninstallApp_test_0200', 0, async function (done) {
        await notify.setSyncNotificationEnabledWithoutApp(
           100,false,async() => {
            await notify.getSyncNotificationEnabledWithoutApp(100, (err,data) => {
                console.log("===>getSyncNotificationEnabledWithoutApp===>"+err+data)
                expect(data).assertEqual(false)
                done();
            })
        })
    })

    /*
     * @tc.number: SetEnabledForUninstallApp_test_0300
     * @tc.name: set and get enabled when distributed device without app (promise)
     * @tc.desc: set true and get true
     */
    it('SetEnabledForUninstallApp_test_0300', 0, async function (done) {
        notify.setSyncNotificationEnabledWithoutApp(100, true).then(() => {
            notify.getSyncNotificationEnabledWithoutApp(100).then((data) => {
                console.log("===>getSyncNotificationEnabledWithoutApp===>"+data)
                expect(data).assertEqual(true)
                done();
            }).catch((err) => {
                Logger.error(TAG,
                    `===>getSyncNotificationEnabledWithoutApp failed because ${JSON.stringify(err)}`);
            });
        }).catch((err) => {
            Logger.error(TAG, `===>setSyncNotificationEnabledWithoutApp failed because ${JSON.stringify(err)}`);
        });
    })
}) }
