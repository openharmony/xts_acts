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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import notify from '@ohos.notification'
import WantAgent from '@ohos.wantAgent'

var timeout = 1000;

export default function secondaryDirectoryTest() {
describe('secondaryDirectoryTest', function () {
    console.info("===========secondaryDirectoryTest start====================>");

    /*
     * @tc.number: ACTS_SecondaryDirectory_xts_0000
     * @tc.name: enableNotification()
     * @tc.desc: verify the function of enableNotification
     */
    it('ACTS_SecondaryDirectory_xts_0000', 0, async function (done) {
        console.info("===ACTS_SecondaryDirectory_xts_0000===begin===>");
        let promise =  await notify.enableNotification({
            bundle:"com.example.secondaryDirectory"
        },true)
        console.info("===ACTS_SecondaryDirectory_xts_0000===end===>");
        done();
    })

    /*
     * @tc.number: ACTS_SecondaryDirectory_xts_0100
     * @tc.name: NotificationRequest、NotificationSubscriber、NotificationSubscribeInfo、SubscribeCallbackData、NotificationFlags
     * @tc.desc: use NotificationRequest type
     */
    function consumeCallback1(data) {
        console.info("===>consumeCallback1 data : ===>" +JSON.stringify(data));
        let subscribeCallback: notify.SubscribeCallbackData;
        subscribeCallback = data;
        let contentType = subscribeCallback.request.content.contentType;
        console.info("===>contentType: ===>" + contentType)
        expect(contentType).assertEqual(notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);

        let flags: notify.NotificationFlags = subscribeCallback.request.notificationFlags;
        if (flags != undefined) 
        {
            console.info("===>notificationFlags: ===>" + JSON.stringify(flags));
            let soundEnabled: notify.NotificationFlagStatus = flags.soundEnabled;
            let vibrationEnabled: notify.NotificationFlagStatus = flags.vibrationEnabled
            expect(soundEnabled).assertEqual(0);
            expect(vibrationEnabled).assertEqual(0);
        }
    }

    it('ACTS_SecondaryDirectory_xts_0100', 0, async function (done) {
        console.info("===ACTS_SecondaryDirectory_xts_0100===begin===>");
        let subscriber: notify.NotificationSubscriber = {
            onConsume:consumeCallback1
        }

        let subscriberInfo: notify.NotificationSubscribeInfo = {
            bundleNames: ["com.example.secondaryDirectory"]
        }

        await notify.subscribe(subscriber, subscriberInfo);

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            id: 1
        }

        console.info("===ACTS_SecondaryDirectory_xts_0100===publish===>");
        await notify.publish(notificationRequest, (err) => {
            console.info("===>publish callback===>"+err.code);
            expect(err.code).assertEqual(0)
        });
        console.info("===ACTS_SecondaryDirectory_xts_0100===end===>");

        setTimeout((async function(){
            notify.unsubscribe(subscriber);
            console.info("======ACTS_SecondaryDirectory_xts_0100 setTimeout unsubscribe===>");
            done();
        }),timeout);
    });

    /*
     * @tc.number: ACTS_SecondaryDirectory_xts_0200
     * @tc.name: NotificationLongTextContent 
     * @tc.desc: use NotificationLongTextContent type
     */
    function consumeCallback2(data) {
        console.info("===>consumeCallback2 data : ===>" +JSON.stringify(data));
        let longContentText: notify.NotificationLongTextContent = data.request.content.longText;
        console.info("===>longText: ===>" + JSON.stringify(longContentText))
        expect(longContentText.title).assertEqual("test_title");
        expect(longContentText.text).assertEqual("test_text");
        expect(longContentText.additionalText).assertEqual("test_Publish");
        expect(longContentText.longText).assertEqual("longText123456");
        expect(longContentText.briefText).assertEqual("briefText123456");
        expect(longContentText.expandedTitle).assertEqual("expandedTitle123456");
    }

    it('ACTS_SecondaryDirectory_xts_0200', 0, async function (done) {
        console.info("===ACTS_SecondaryDirectory_xts_0200===begin===>");
        let subInfo: notify.NotificationSubscriber = {
            onConsume:consumeCallback2
        }
        await notify.subscribe(subInfo);

        let longContentText: notify.NotificationLongTextContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish",
            longText: "longText123456",
            briefText: "briefText123456",
            expandedTitle: "expandedTitle123456"
        }

        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: longContentText
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            id: 2,
            slotType: notify.SlotType.SERVICE_INFORMATION,
        }

        console.info("===ACTS_SecondaryDirectory_xts_0200===publish===>");
        await notify.publish(notificationRequest, (err) => {
            console.info("===>publish callback===>"+err.code);
            expect(err.code).assertEqual(0)
        });
        console.info("===ACTS_SecondaryDirectory_xts_0200===end===>");

        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ACTS_SecondaryDirectory_xts_0200 setTimeout unsubscribe===>");
            done();
        }),timeout);
    });

    /*
     * @tc.number: ACTS_SecondaryDirectory_xts_0300
     * @tc.name: NotificationBasicContent
     * @tc.desc: use NotificationBasicContent type
     */
    function consumeCallback3(data) {
        console.info("===>consumeCallback3 data : ===>" +JSON.stringify(data));
        let basicContentText: notify.NotificationBasicContent = data.request.content.normal;
        console.info("===>basicText: ===>" + JSON.stringify(basicContentText))
        expect(basicContentText.title).assertEqual("test_title");
        expect(basicContentText.text).assertEqual("test_text");
        expect(basicContentText.additionalText).assertEqual("test_Publish");
    }

    it('ACTS_SecondaryDirectory_xts_0300', 0, async function (done) {
        console.info("===ACTS_SecondaryDirectory_xts_0300===begin===>");
        let subInfo: notify.NotificationSubscriber = {
            onConsume:consumeCallback3
        }
        await notify.subscribe(subInfo);

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }

        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            id: 3
        }

        console.info("===ACTS_SecondaryDirectory_xts_0300===publish===>");
        await notify.publish(notificationRequest, (err) => {
            console.info("===>publish callback===>"+err.code);
            expect(err.code).assertEqual(0)
        });
        console.info("===ACTS_SecondaryDirectory_xts_0300===end===>");

        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ACTS_SecondaryDirectory_xts_0300 setTimeout unsubscribe===>");
            done();
        }),timeout);
    });

    /*
     * @tc.number: ACTS_SecondaryDirectory_xts_0400
     * @tc.name: NotificationMultiLineContent
     * @tc.desc: use NotificationMultiLineContent type
     */
    function consumeCallback4(data) {
        console.info("===>consumeCallback4 data : ===>" +JSON.stringify(data));
        let longContentText: notify.NotificationMultiLineContent = data.request.content.multiLine;
        console.info("===>multiLineText: ===>" + JSON.stringify(longContentText))
        expect(longContentText.briefText).assertEqual("notificationMultiLineContent_title");
        expect(longContentText.longTitle).assertEqual("notificationMultiLineContent_title_12345678999999999");
        expect(longContentText.lines[0]).assertEqual("thrive");
        expect(longContentText.lines[1]).assertEqual("democracy");
        expect(longContentText.lines[2]).assertEqual("civilization");
        expect(longContentText.lines[3]).assertEqual("harmonious");
    }

    it('ACTS_SecondaryDirectory_xts_0400', 0, async function (done) {
        console.info("===ACTS_SecondaryDirectory_xts_0400===begin===>");
        let subInfo: notify.NotificationSubscriber = {
            onConsume:consumeCallback4
        }
        await notify.subscribe(subInfo);

        let multiLineContent: notify.NotificationMultiLineContent = {
            title: "test_title",
            text: "test_text",
            briefText: "notificationMultiLineContent_title",
            longTitle: "notificationMultiLineContent_title_12345678999999999",
            lines: ["thrive", "democracy", "civilization", "harmonious"]
        }

        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: multiLineContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            id: 4
        }

        console.info("===ACTS_SecondaryDirectory_xts_0400===publish===>");
        await notify.publish(notificationRequest, (err) => {
            console.info("===>publish callback===>"+err.code);
            expect(err.code).assertEqual(0)
        });
        console.info("===ACTS_SecondaryDirectory_xts_0400===end===>");

        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ACTS_SecondaryDirectory_xts_0400 setTimeout unsubscribe===>");
            done();
        }),timeout);
    });

    /*
     * @tc.number: ACTS_SecondaryDirectory_xts_0500
     * @tc.name: NotificationActionButton、NotificationUserInput
     * @tc.desc: use NotificationActionButton type
     */
    function consumeCallback5(data) {
        console.info("===>consumeCallback5 data : ===>" +JSON.stringify(data));
        let actionButtons: notify.NotificationActionButton = data.request.actionButtons[0]
        console.info("===>actionButtons: ===>" + JSON.stringify(actionButtons))
        expect(actionButtons.title).assertEqual("buttonA");
        expect(actionButtons.userInput.inputKey).assertEqual("test_NotificationUserInput");
        WantAgent.getWant(actionButtons.wantAgent).then((data) => {
            expect(data[0].action).assertEqual("usual.event.REMOVAL_WANTAGENT");
        });
    }

    it('ACTS_SecondaryDirectory_xts_0500', 0, async function (done) {
        console.info("===ACTS_SecondaryDirectory_xts_0500===begin===>");
        let subInfo: notify.NotificationSubscriber = {
            onConsume:consumeCallback5
        }
        await notify.subscribe(subInfo);

        let agentInfo = {
            wants: [
                {
                    bundleName: 'com.example.secondaryDirectory',
                    abilityName: 'com.example.secondaryDirectory.MainAbility',
                    action: "usual.event.REMOVAL_WANTAGENT"
                }
              ],
            operationType: WantAgent.OperationType.SEND_COMMON_EVENT,
            requestCode: 0,
            wantAgentFlags:[WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };

        let wantAgentData = await WantAgent.getWantAgent(agentInfo);

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let userInputContent: notify.NotificationUserInput = {
            inputKey: 'test_NotificationUserInput',
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            actionButtons: [
                {
                    title:"buttonA",
                    wantAgent: wantAgentData,
                    userInput: userInputContent
                }
            ],
            id: 5
        }

        console.info("===ACTS_SecondaryDirectory_xts_0500===publish===>");
        await notify.publish(notificationRequest, (err) => {
            console.info("===>publish callback===>"+err.code);
            expect(err.code).assertEqual(0)
        });
        console.info("===ACTS_SecondaryDirectory_xts_0500===end===>");

        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ACTS_SecondaryDirectory_xts_0500 setTimeout unsubscribe===>");
            done();
        }),timeout);
    });

    /*
     * @tc.number: ACTS_SecondaryDirectory_xts_0600
     * @tc.name: NotificationTemplate
     * @tc.desc: use NotificationTemplate type
     */
    function consumeCallback6(data) {
        console.info("===>consumeCallback6 data : ===>" +JSON.stringify(data));
        let templateContent: notify.NotificationTemplate = data.request.template;
        console.info("===>template: ===>" + JSON.stringify(templateContent))
        expect(templateContent.name).assertEqual("downloadTemplate");
        expect(templateContent.data.title).assertEqual("file");
        expect(templateContent.data.fileName).assertEqual("music.mp4");
        expect(templateContent.data.progressValue).assertEqual(45);
    }

    it('ACTS_SecondaryDirectory_xts_0600', 0, async function (done) {
        console.info("===ACTS_SecondaryDirectory_xts_0600===begin===>");
        let subInfo: notify.NotificationSubscriber = {
            onConsume:consumeCallback6
        }
        await notify.subscribe(subInfo);

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notifyTemplate: notify.NotificationTemplate = {
            name: 'downloadTemplate',
            data: {
                title: 'file',
                fileName: 'music.mp4',
                progressValue: 45
            }
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            template: notifyTemplate,
            id: 6
        }

        console.info("===ACTS_SecondaryDirectory_xts_0600===publish===>");
        await notify.publish(notificationRequest, (err) => {
            console.info("===>publish callback===>"+err.code);
            expect(err.code).assertEqual(0)
        });
        console.info("===ACTS_SecondaryDirectory_xts_0600===end===>");

        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ACTS_SecondaryDirectory_xts_0600 setTimeout unsubscribe===>");
            done();
        }),timeout);
    });

    /*
     * @tc.number: ACTS_SecondaryDirectory_xts_0700
     * @tc.name: DistributedOptions
     * @tc.desc: use DistributedOptions type
     */
    function consumeCallback7(data) {
        console.info("===>consumeCallback7 data : ===>" +JSON.stringify(data));
        let options: notify.DistributedOptions = data.request.distributedOption;
        console.info("===>longText: ===>" + JSON.stringify(options))
        expect(options.isDistributed).assertEqual(false);
        expect(options.supportDisplayDevices[0]).assertEqual("0");
        expect(options.supportOperateDevices[0]).assertEqual("0");
    }

    it('ACTS_SecondaryDirectory_xts_0700', 0, async function (done) {
        console.info("===ACTS_SecondaryDirectory_xts_0700===begin===>");
        let subInfo: notify.NotificationSubscriber = {
            onConsume:consumeCallback7
        }
        await notify.subscribe(subInfo);

        let options: notify.DistributedOptions = {
            isDistributed: false,
            supportDisplayDevices: ["0"],
            supportOperateDevices: ["0"]
        }

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            distributedOption: options,
            id: 7
        }

        console.info("===ACTS_SecondaryDirectory_xts_0700===publish===>");
        await notify.publish(notificationRequest, (err) => {
            console.info("===>publish callback===>"+err.code);
            expect(err.code).assertEqual(0)
        });
        console.info("===ACTS_SecondaryDirectory_xts_0700===end===>");

        setTimeout((async function(){
            notify.unsubscribe(subInfo);
            console.info("======ACTS_SecondaryDirectory_xts_0700 setTimeout unsubscribe===>");
            done();
        }),timeout);
    });
}) }