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
			if (data.request.distributedOptions.remindType != notify.DeviceRemindType.IDLE_DONOT_REMIND 
				&& data.request.distributedOptions.remindType != notify.DeviceRemindType.IDLE_REMIND
				&& data.request.distributedOptions.remindType != notify.DeviceRemindType.ACTIVE_DONOT_REMIND
				&& data.request.distributedOptions.remindType != notify.DeviceRemindType.ACTIVE_REMIND )		
				{
					expect().assertFail();
				}
            expect(data.request.deviceId).assertEqual("");
            console.info("ActsDistribute_test_0400 onConsume data"+JSON.stringify(data.request.notificationFlags));
            expect(JSON.stringify(data.request.notificationFlags)).assertEqual(undefined);
        }
        await notify.enableDistributed(true);
        await notify.enableDistributedSelf(true);
        console.info("==================ActsDistribute_test_0400 start==================>");
        var subscriber ={
            onConsume:onConsume0100,
        }
        await notify.subscribe(subscriber);
        var notificationRequest = {
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
            distributedOptions:{isDistributed: true, supportDisplayDevices: ["0"], supportOperateDevices: ["0"]}
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
        function onEnabledNotificationChanged001(data){
            console.log("===>onEnabledNotificationChanged001 success===>"+JSON.stringify(data))
            console.log("===>onEnabledNotificationChanged001 bundle===>"+JSON.stringify(data.bundle))
            console.log("===>onEnabledNotificationChanged001 uid===>"+JSON.stringify(data.uid))
            console.log("===>onEnabledNotificationChanged001 enable===>"+JSON.stringify(data.enable))
            expect(JSON.stringify(data.bundle)).assertEqual("com.example.actsansdistributetest");
            expect(JSON.stringify(data.uid)).assertEqual("454231");
            expect(JSON.stringify(data.enable)).assertEqual(true);
        }
        function connectCallbacka() {
            console.debug("==>connectCallbacka code==>");
        }
        var subscriber ={
            onConnect:connectCallbacka,
            onEnabledNotificationChanged:onEnabledNotificationChanged001,
        }
        await notify.subscribe(subscriber,async(err)=>{
            console.debug("==>subscribeCallback code==>" +err.code);
            expect(err.code).assertEqual(0);
            await notify.requestEnableNotification((err) => {
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


  })


}
