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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('AnsNotificationTestCancel', function () {
console.info("===========AnsNotificationTestCancel start====================>");

    function publishCallback_0100_1(err) {
    console.info("==========================>publishCallback_0100_1 err=======================>" + JSON.stringify(err));
    }
    function publishCallback_0100_2(err) {
    console.info("==========================>publishCallback_0100_2 err=======================>" + JSON.stringify(err));
    }
    function cancelAllCallBack_0100(err, data){
    console.info("==========================>cancelAllCallBack_0100 start=======================>");
    console.info("================>cancelAllCallBack_0100 err : =======================>" + JSON.stringify(err));
    console.info("==========================>cancelAllCallBack_0100 end=======================>");
    }
    /*
     * @tc.number: ANS_Cancel_0100
     * @tc.name: cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc: Verify that the application successfully cancels all its published notifications by calling the cancelAll(callback: AsyncCallback<void>) interface
     */
    it('ANS_Cancel_0100', 0, async function (done) {
            console.info("===============ANS_Cancel_0100 start==========================>");
            var notificationRequest = {
                content:{
                    contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                    normal: {
                        title: "test_title",
                        text: "test_text",
                        additionalText: "test_additionalText"
                    },
                },
                id: 1,
                slotType : notify.SlotType.OTHER_TYPES,
                isOngoing : true,
                isUnremovable : false,
                deliveryTime : 1624950453,
                tapDismissed : true,
                autoDeletedTime: 1625036817,
                color: 2,
                colorEnabled: true,
                isAlertOnce: true,
                isStopwatch: true,
                isCountDown: true,
                progressValue: 12,
                progressMaxValue: 100,
                isIndeterminate: true,
                statusBarText: "statusBarText",
                isFloatingIcon : true,
                label: "0100_1",
                badgeIconStyle: 1,
                showDeliveryTime: true,
            }
            var notificationRequest1 = {
                content:{
                    contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                    normal: {
                        title: "test_title",
                        text: "test_text",
                        additionalText: "test_additionalText"
                    },
                },
                id: 1,
                slotType : notify.SlotType.OTHER_TYPES,
                isOngoing : true,
                isUnremovable : false,
                deliveryTime : 1624950453,
                tapDismissed : true,
                autoDeletedTime: 1625036817,
                color: 2,
                colorEnabled: true,
                isAlertOnce: true,
                isStopwatch: true,
                isCountDown: true,
                progressValue: 12,
                progressMaxValue: 100,
                isIndeterminate: true,
                statusBarText: "statusBarText",
                isFloatingIcon : true,
                label: "0100_2",
                badgeIconStyle: 1,
                showDeliveryTime: true,
            }
            await notify.publish(notificationRequest, publishCallback_0100_1);
            console.info("===============ANS_Cancel_0100 publish1 start==========================>");
            await notify.publish(notificationRequest1, publishCallback_0100_2);
            console.info("===============ANS_Cancel_0100 publish2 start==========================>");
            await notify.cancelAll(cancelAllCallBack_0100);
            console.info("===============ANS_Cancel_0100 cancelAll start==========================>");
            done();
        })

    /*
     * @tc.number: ANS_Cancel_0200
     * @tc.name: cancelAll(): Promise<void>
     * @tc.desc: Verify that the application successfully cancels all its published notifications by calling the cancelAll(): Promise<void> interface
     */
    it('ANS_Cancel_0200', 0, async function (done) {
        console.info("===============ANS_Cancel_0200 start==========================>");
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 1,
            slotType : notify.SlotType.OTHER_TYPES,
            isOngoing : true,
            isUnremovable : false,
            deliveryTime : 1624950453,
            tapDismissed : true,
            autoDeletedTime: 1625036817,
            color: 2,
            colorEnabled: true,
            isAlertOnce: true,
            isStopwatch: true,
            isCountDown: true,
            progressValue: 12,
            progressMaxValue: 100,
            isIndeterminate: true,
            statusBarText: "statusBarText",
            isFloatingIcon : true,
            label: "0100_1",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        var notificationRequest1 = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 1,
            slotType : notify.SlotType.OTHER_TYPES,
            isOngoing : true,
            isUnremovable : false,
            deliveryTime : 1624950453,
            tapDismissed : true,
            autoDeletedTime: 1625036817,
            color: 2,
            colorEnabled: true,
            isAlertOnce: true,
            isStopwatch: true,
            isCountDown: true,
            progressValue: 12,
            progressMaxValue: 100,
            isIndeterminate: true,
            statusBarText: "statusBarText",
            isFloatingIcon : true,
            label: "0100_2",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("================>publish_promise_0200 notificationRequest=======================>");
        });
        await notify.publish(notificationRequest1).then(() => {
            console.info("================>publish_promise_0200 notificationRequest1=======================>");
        });
        await notify.cancelAll().then((err,data) => {
            console.info("================>cancelAll_promise_0200 start=======================>");
            console.info("================>cancelAll_promise_0200 data: =======================>" + JSON.stringify(data));
            console.info("================>cancelAll_promise_0200 err: =======================>" + JSON.stringify(err));
            console.info("================>cancelAll_promise_0200 end=======================>");
        });
        done();
    })

    function cancelAllCallBack_0300(err){
        console.info("==========================>cancelAllCallBack_0300 start=======================>");
        console.info("================>cancelAllCallBack_0300 err : =======================>" + JSON.stringify(err));
        console.info("==========================>cancelAllCallBack_0300 end=======================>");
    }
    /*
     * @tc.number: ANS_Cancel_0300
     * @tc.name: cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc: Verify that when no notification is published, call the cancelAll(callback: AsyncCallback<void>): void interface to delete the notification information
     */
    it('ANS_Cancel_0300', 0, async function (done) {
        console.info("===============ANS_Cancel_0300 start==========================>");
        await　notify.cancelAll(cancelAllCallBack_0300);
        console.info("===============ANS_Cancel_0300 cancelAll start==========================>");
        done();
    })

    /*
     * @tc.number: ANS_Cancel_0400
     * @tc.name: cancelAll(): Promise<void>
     * @tc.desc: Verify that when no notification is published, call the cancelAll(): Promise<void> interface to delete the notification information
     */
    it('ANS_Cancel_0400', 0, async function (done) {
        console.info("===============ANS_Cancel_0400 start==========================>");
        await notify.cancelAll().then((err,data) => {
            console.info("================>cancelAll_promise_0400 start=======================>");
            console.info("================>cancelAll_promise_0400 data: =======================>" + JSON.stringify(data));
            console.info("================>cancelAll_promise_0400 err: =======================>" + JSON.stringify(err));
            console.info("================>cancelAll_promise_0400 end=======================>");
        });
        done();
    })

    function publishCallback_0500(err) {
        console.info("==========================>publishCallback_0500 err=======================>" + JSON.stringify(err));
    }
    function cancelAllCallBack_0500_1(err){
        console.info("==========================>cancelAllCallBack_0500_1 start=======================>");
        console.info("================>cancelAllCallBack_0500_1 err : =======================>" + JSON.stringify(err));
        console.info("==========================>cancelAllCallBack_0500_1 end=======================>");
    }
    function cancelAllCallBack_0500_2(err){
        console.info("==========================>cancelAllCallBack_0500_2 start=======================>");
        console.info("================>cancelAllCallBack_0500_2 err : =======================>" + JSON.stringify(err));
        console.info("==========================>cancelAllCallBack_0500_2 end=======================>");
    }
    /*
     * @tc.number: ANS_Cancel_0500
     * @tc.name: cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc: Verify that when the notification information is issued, call the cancelAll(callback: AsyncCallback<void>): void interface twice to delete the notification information.
     */
    it('ANS_Cancel_0500', 0, async function (done) {
        console.info("===============ANS_Cancel_0500 start==========================>");
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 5,
            slotType : notify.SlotType.OTHER_TYPES,
            isOngoing : true,
            isUnremovable : false,
            deliveryTime : 1624950453,
            tapDismissed : true,
            autoDeletedTime: 1625036817,
            color: 2,
            colorEnabled: true,
            isAlertOnce: true,
            isStopwatch: true,
            isCountDown: true,
            progressValue: 12,
            progressMaxValue: 100,
            isIndeterminate: true,
            statusBarText: "statusBarText",
            isFloatingIcon : true,
            label: "0500",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest, publishCallback_0500);
        console.info("===============ANS_Cancel_0500 publish start==========================>");
        await　notify.cancelAll(cancelAllCallBack_0500_1);
        console.info("===============ANS_Cancel_0500 cancelAll1 start==========================>");
        await　notify.cancelAll(cancelAllCallBack_0500_2);
        console.info("===============ANS_Cancel_0500 cancelAll2 start==========================>");
        done();
    })

    /*
     * @tc.number: ANS_Cancel_0600
     * @tc.name: cancelAll(): Promise<void>
     * @tc.desc: Verify that when the notification information is issued, call the cancelAll(): Promise<void> interface twice to delete the notification information.
     */
    it('ANS_Cancel_0600', 0, async function (done) {
        console.info("===============ANS_Cancel_0600 start==========================>");
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 6,
            slotType : notify.SlotType.OTHER_TYPES,
            isOngoing : true,
            isUnremovable : false,
            deliveryTime : 1624950453,
            tapDismissed : true,
            autoDeletedTime: 1625036817,
            color: 2,
            colorEnabled: true,
            isAlertOnce: true,
            isStopwatch: true,
            isCountDown: true,
            progressValue: 12,
            progressMaxValue: 100,
            isIndeterminate: true,
            statusBarText: "statusBarText",
            isFloatingIcon : true,
            label: "0600",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("================>publish_promise_0600=======================>");
        });
        await notify.cancelAll().then((err,data) => {
            console.info("================>cancelAll_promise1_0600 start=======================>");
            console.info("================>cancelAll_promise1_0600 data: =======================>" + JSON.stringify(data));
            console.info("================>cancelAll_promise1_0600 err: =======================>" + JSON.stringify(err));
            console.info("================>cancelAll_promise1_0600 end=======================>");
        });
        await notify.cancelAll().then((err,data) => {
            console.info("================>cancelAll_promise2_0600 start=======================>");
            console.info("================>cancelAll_promise2_0600 data: =======================>" + JSON.stringify(data));
            console.info("================>cancelAll_promise2_0600 err: =======================>" + JSON.stringify(err));
            console.info("================>cancelAll_promise2_0600 end=======================>");
        });
        done();
    })

    function publishCallback_0700(err) {
        console.info("==========================>publishCallback_0700 err=======================>" + JSON.stringify(err));
    }
    function cancelAllCallBack_0700(err){
        console.info("==========================>cancelAllCallBack_0700 start=======================>");
        console.info("================>cancelAllCallBack_0700 err : =======================>" + JSON.stringify(err));
        console.info("==========================>cancelAllCallBack_0700 end=======================>");
    }
    /*
     * @tc.number: ANS_Cancel_0700
     * @tc.name: cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc: iVerify that when the attribute isUnremovable of the published notification information is true, call the cancelAll(callback: AsyncCallback<void>): void interface to cancel the notification information
     */
    it('ANS_Cancel_0700', 0, async function (done) {
        console.info("===============ANS_Cancel_0400 start==========================>");
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 7,
            slotType : notify.SlotType.OTHER_TYPES,
            isOngoing : true,
            isUnremovable : true,
            deliveryTime : 1624950453,
            tapDismissed : true,
            autoDeletedTime: 1625036817,
            color: 2,
            colorEnabled: true,
            isAlertOnce: true,
            isStopwatch: true,
            isCountDown: true,
            progressValue: 12,
            progressMaxValue: 100,
            isIndeterminate: true,
            statusBarText: "statusBarText",
            isFloatingIcon : true,
            label: "0700",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest, publishCallback_0700);
        console.info("===============ANS_Cancel_0700 publish start==========================>");
        await notify.cancelAll(cancelAllCallBack_0700);
        console.info("===============ANS_Cancel_0700 cancelAll start==========================>");
        done();
    })

    /*
     * @tc.number: ANS_Cancel_0800
     * @tc.name: cancelAll(): Promise<void>
     * @tc.desc: iVerify that when the attribute isUnremovable of the published notification information is true, call the cancelAll(): Promise<void> interface to cancel the notification information
     */
    it('ANS_Cancel_0800', 0, async function (done) {
        console.info("===============ANS_Cancel_0800 start==========================>");
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 8,
            slotType : notify.SlotType.OTHER_TYPES,
            isOngoing : true,
            isUnremovable : true,
            deliveryTime : 1624950453,
            tapDismissed : true,
            autoDeletedTime: 1625036817,
            color: 2,
            colorEnabled: true,
            isAlertOnce: true,
            isStopwatch: true,
            isCountDown: true,
            progressValue: 12,
            progressMaxValue: 100,
            isIndeterminate: true,
            statusBarText: "statusBarText",
            isFloatingIcon : true,
            label: "0800",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("================>publish_promise_0800 =======================>");
        });
        await notify.cancelAll().then((err,data) => {
            console.info("================>cancelAll_promise_0800 start=======================>");
            console.info("================>cancelAll_promise_0800 data: =======================>" + JSON.stringify(data));
            console.info("================>cancelAll_promise_0800 err: =======================>" + JSON.stringify(err));
            console.info("================>cancelAll_promise_0800 end=======================>");
        });
        done();
    })

    function publishCallback_0900_1(err) {
        console.info("==========================>publishCallback_0900_1 err=======================>" + JSON.stringify(err));
    }
    function cancelAllCallBack_0900_1(err){
        console.info("==========================>cancelAllCallBack_0900_1 start=======================>");
        console.info("================>cancelAllCallBack_0900_1 err : =======================>" + JSON.stringify(err));
        console.info("==========================>cancelAllCallBack_0900_1 end=======================>");
    }
    function publishCallback_0900_2(err) {
        console.info("==========================>publishCallback_0900_2 err=======================>" + JSON.stringify(err));
    }
    function cancelAllCallBack_0900_2(err){
        console.info("==========================>cancelAllCallBack_0900_2 start=======================>");
        console.info("================>cancelAllCallBack_0900_2 err : =======================>" + JSON.stringify(err));
        console.info("==========================>cancelAllCallBack_0900_2 end=======================>");
    }
    /*
     * @tc.number: ANS_Cancel_0900
     * @tc.name: cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc: Verification: cancel all notification information after publishing for two consecutive times
     */
    it('ANS_Cancel_0900', 0, async function (done) {
        console.info("===============ANS_Cancel_0900 start==========================>");
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 9,
            slotType : notify.SlotType.OTHER_TYPES,
            isOngoing : true,
            isUnremovable : false,
            deliveryTime : 1624950453,
            tapDismissed : true,
            autoDeletedTime: 1625036817,
            color: 2,
            colorEnabled: true,
            isAlertOnce: true,
            isStopwatch: true,
            isCountDown: true,
            progressValue: 12,
            progressMaxValue: 100,
            isIndeterminate: true,
            statusBarText: "statusBarText",
            isFloatingIcon : true,
            label: "0900",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest, publishCallback_0900_1);
        console.info("===============ANS_Cancel_0900 publishCallback_0900_1 start==========================>");
        await　notify.cancelAll(cancelAllCallBack_0900_1);
        console.info("===============ANS_Cancel_0900 cancelAll1 start==========================>");
        await notify.publish(notificationRequest, publishCallback_0900_2);
        console.info("===============ANS_Cancel_0900 publishCallback_0900_1 start==========================>");
        await　notify.cancelAll(cancelAllCallBack_0900_2);
        console.info("===============ANS_Cancel_0900 cancelAll2 start==========================>");
        done();
    })

    /*
     * @tc.number: ANS_Cancel_1000
     * @tc.name: cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc: Verification: cancel all notification information after publishing for two consecutive times
     */
    it('ANS_Cancel_1000', 0, async function (done) {
        console.info("===============ANS_Cancel_1000 start==========================>");
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 10,
            slotType : notify.SlotType.OTHER_TYPES,
            isOngoing : true,
            isUnremovable : false,
            deliveryTime : 1624950453,
            tapDismissed : true,
            autoDeletedTime: 1625036817,
            color: 2,
            colorEnabled: true,
            isAlertOnce: true,
            isStopwatch: true,
            isCountDown: true,
            progressValue: 12,
            progressMaxValue: 100,
            isIndeterminate: true,
            statusBarText: "statusBarText",
            isFloatingIcon : true,
            label: "1000",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("================>publish1_promise_1000=======================>");
        });
        await notify.cancelAll().then((err,data) => {
            console.info("================>cancelAll1_promise_1000 start=======================>");
            console.info("================>cancelAll1_promise_1000 data: =======================>" + JSON.stringify(data));
            console.info("================>cancelAll1_promise_1000 err: =======================>" + JSON.stringify(err));
            console.info("================>cancelAll1_promise_1000 end=======================>");
        });
        await notify.publish(notificationRequest).then(() => {
            console.info("================>publish1_promise2_1000=======================>");
        });
        await notify.cancelAll().then((err,data) => {
            console.info("================>cancelAll2_promise_1000 start=======================>");
            console.info("================>cancelAll2_promise_1000 data: =======================>" + JSON.stringify(data));
            console.info("================>cancelAll2_promise_1000 err: =======================>" + JSON.stringify(err));
            console.info("================>cancelAll2_promise_1000 end=======================>");
        });
        done();
    })

})