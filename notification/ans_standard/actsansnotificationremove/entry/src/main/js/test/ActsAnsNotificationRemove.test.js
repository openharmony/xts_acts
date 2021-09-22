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


describe('ActsAnsNotificationRemove', function () {
    console.info("===========ActsAnsNotificationRemove start====================>");
    var subscriber;
    function updateCallback(err, data) {
        console.info("================updateCallback======================>");
    }
    function subscribeCallback(err) {
        console.info("==========================subscribeCallback=======================>");
    }
    function onUnsubscribeCallback(err) {
        console.info("================onUnsubscribeCallback=======================>");
    }
    function unSubscribeCallback(err) {
        console.info("==========================unSubscribeCallback=======================>");
    }
    function publishCallback(err) {
        console.info("==========================publishCallback=======================>");
    }
    var hashCode;
    function OnConsume_remove(err, data) {
        console.info("================OnConsume_remove_0100=======================>");
        console.info("================OnConsume_remove_0100 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_remove_0100 hascode: =======================>" + data.request.hashCode);
        hashCode = data.request.hashCode
        notify.remove(hashCode,removeCallBack);
        console.info("================OnConsume_remove_0100 remove=======================>");
        console.info("================OnConsume_remove_0100 end=======================>");
    }

    function OnCancel_remove(err, data) {
        console.info("==========================OnCancel_remove_0100=======================>");
        console.info("================OnCancel_remove_0100 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancel_remove_0100 err : =======================>" + JSON.stringify(err));
        console.info("================OnCancel_remove_0100 hashCode=======================>" + hashCode);
        console.info("================OnCancel_remove_0100 data.request.hashCode=======================>" + data.request.hashCode);
        expect(hashCode).assertequal(data.request.hashCode);
        console.info("================OnCancel_remove_0100 end=======================>");
    }

    function removeCallBack(err, data) {
        console.info("================removeCallBack_0100 err : =======================>" + JSON.stringify(err));
        console.info("================removeCallBack_0100 data : =======================>" + JSON.stringify(data));
    }

    function subscriberCallBack(err, data) {
        console.info("================subscriberCallBack err : =======================>" + JSON.stringify(err));
        console.info("================subscriberCallBack data : =======================>" + JSON.stringify(data));
    }
    function unsubscribeCallBack(err, data) {
        console.info("================unsubscribeCallBack err : =======================>" + JSON.stringify(err));
        console.info("================unsubscribeCallBack data : =======================>" + JSON.stringify(data));
    }
    function publishCallback(err, data) {
        console.info("================publishCallback err : =======================>" + JSON.stringify(err));
        console.info("================publishCallback data : =======================>" + JSON.stringify(data));
    }
    /*
     * @tc.number: ANS_Remove_0100
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the call interface remove(hashCode: string, callback: AsyncCallback<void>): void deletes the notification information through hashcode
     */
    it('ANS_Remove_0100', 0, async function (done) {
        console.info("===============ANS_Remove_0100==========================>");
        hashCode = 0
        var subscriber ={
            onConsume:OnConsume_remove,
            onCancel:OnCancel_remove,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0100_promise==================>");
        });
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
            label: "0100",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_0100_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0100_promise==================>");
        });
        done();
    })

    function OnConsume_remove_promise(err, data) {
        console.info("================OnConsume_remove_promise_0200=======================>");
        console.info("================OnConsume_remove_promise_0200 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_remove_promise_0200 hascode: =======================>" + data.request.hashCode);
        hashCode = data.request.hashCode
        notify.remove(hashCode).then((err, data) => {
            console.info("==========remove_promise_0200 err : =========>" + JSON.stringify(err));
            console.info("==========remove_promise_0200 data : =========>" + JSON.stringify(data));
        });
        console.info("================OnConsume_remove_promise_0200 remove=======================>");
        console.info("================OnConsume_remove_promise_0200 end=======================>");
    }

    function OnCancel_remove_promise(err, data) {
        console.info("==========================OnCancel_remove_0200=======================>");
        console.info("================OnCancel_remove_0200 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancel_remove_0200 err : =======================>" + JSON.stringify(err));
        console.info("================OnCancel_remove_0200 hashCode=======================>" + hashCode);
        console.info("================OnCancel_remove_0200 data.request.hashCode=======================>" + data.request.hashCode);
        expect(hashCode).assertequal(data.request.hashCode);
        console.info("================OnCancel_remove_0200 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_0200
     * @tc.name: remove(hashCode: string): Promise<void>;
     * @tc.desc: Verify that the call interface remove(hashCode: string): Promise<void> deletes the notification information through hashcode
     */
    it('ANS_Remove_0200', 0, async function (done) {
        console.info("===============ANS_Remove_0200==========================>");
        hashCode = 0
        var subscriber ={
            onConsume:OnConsume_remove_promise,
            onCancel:OnCancel_remove_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0200_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 2,
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
            label: "0200",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_0200_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0200_promise==================>");
        });
        done();
    })
    function OnConsume_removeErrHashCode(err, data) {
        console.info("================OnConsume_removeErrHashCode_0300 start=======================>");
        console.info("================OnConsume_removeErrHashCode_0300 data: =======================>" + JSON.stringify(data));
        notify.remove("errorHashCode",removeErrHashCodeCallBack);
        console.info("================OnConsume_removeErrHashCode_0300 end=======================>");
    }

    function OnCancel_removeErrHashCode() {
        console.info("================OnCancel_removeErrHashCode_0300 start=======================>");
        console.info("==========================OnCancel_removeErrHashCode_0300=======================>");
        expect().assertFail();
        console.info("================OnCancel_removeErrHashCode_0300 end=======================>");
    }

    function removeErrHashCodeCallBack(err,data) {
        console.info("================removeErrHashCodeCallBack_0300 start=======================>");
        console.info("================removeErrHashCodeCallBack_0300=======================>" + JSON.stringify(err));
        console.info("================removeErrHashCodeCallBack_0300=======================>" + JSON.stringify(data));
        expect(err.code).assertNotEqual(0);
        console.info("================removeErrHashCodeCallBack_0300 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_0300
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void
     * @tc.desc: Verify that the error hashcode is used to call the interface remove(hashCode: string, callback: AsyncCallback<void>) to delete the notification information
     */
    it('ANS_Remove_0300', 0, async function (done) {
        console.info("===============ANS_Remove_0300==========================>");
        var subscriber ={
            onConsume:OnConsume_removeErrHashCode,
            onCancel:OnCancel_removeErrHashCode,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0300_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 3,
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
            label: "0300",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_0300_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0300_promise==================>");
        });
        done();
    })
    function OnConsume_removeErrHashCode_promise(err, data) {
        console.info("================OnConsume_removeErrHashCode_promise_0400 data: =======================>" + JSON.stringify(data));
        notify.remove("errorHashCode").then((err, data) => {
            console.info("==========removeErrHashCode_promise_0400 err : =========>" + JSON.stringify(err));
            expect(err.code).assertNotEqual(0);
            console.info("==========removeErrHashCode_promise_0400 data : =========>" + JSON.stringify(data));
        });
        console.info("================OnConsume_removeErrHashCode_promise_0400 end=======================>");
    }

    function OnCancel_removeErrHashCode_promise() {
        console.info("==========================OnCancel_removeErrHashCode_promise_0400=======================>");
        expect().assertFail();
    }
    /*
     * @tc.number: ANS_Remove_0400
     * @tc.name: remove(hashCode: string): Promise<void>
     * @tc.desc: Verify that the error hashcode is used to call the interface remove(hashCode: string): Promise<void> to delete the notification information
     */
    it('ANS_Remove_0400', 0, async function (done) {
        console.info("===============ANS_Remove_0400==========================>");
        var subscriber ={
            onConsume:OnConsume_removeErrHashCode_promise,
            onCancel:OnCancel_removeErrHashCode_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0400_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 4,
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
            label: "0400",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_0400_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0400_promise==================>");
        });
        done();
    })
    function OnConsume_removeUseEmptyCharacter(err, data) {
        console.info("================OnConsume_removeUseEmptyCharacter_0500 start=======================>");
        console.info("================OnConsume_removeUseEmptyCharacter_0500 data: =======================>" + JSON.stringify(data));
        notify.remove('',removeCallBack_UseEmptyCharacter);
        console.info("================OnConsume_removeUseEmptyCharacter_0500 end=======================>");
    }

    function OnCancel_removeUseEmptyCharacter(err, data) {
        console.info("==========================OnCancel_removeUseEmptyCharacter_0500 start=======================>");
        console.info("================OnCancel_removeUseEmptyCharacter_0500 data : =======================>" + JSON.stringify(data));;
        expect().assertFail();
        console.info("================OnCancel_removeUseEmptyCharacter_0500 end=======================>");
    }

    function removeCallBack_UseEmptyCharacter(err) {
        console.info("================removeCallBack_UseEmptyCharacter_0500 start=======================>");
        console.info("================removeCallBack_UseEmptyCharacter_0500 err=======================>" + JSON.stringify(err));
        expect(err.code).assertNotEqual(0);
        console.info("================removeCallBack_UseEmptyCharacter_0500 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_0500
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the Empty Character hashcode is used to call the interface remove(hashCode: string, callback: AsyncCallback<void>): void to delete the notification information
     */
    it('ANS_Remove_0500', 0, async function (done) {
        console.info("===============ANS_Remove_0500==========================>");
        var subscriber ={
            onConsume:OnConsume_removeUseEmptyCharacter,
            onCancel:OnConsume_removeUseEmptyCharacter,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0500_promise==================>");
        });
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
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_0500_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0500_promise==================>");
        });
        done();
    })

    function OnConsume_removeUseEmptyCharacter_promise(err, data) {
        console.info("================OnConsume_removeUseEmptyCharacter_promise_0600 start=======================>");
        console.info("================OnConsume_removeUseEmptyCharacter_promise_0600 data: =======================>" + JSON.stringify(data));
        notify.remove('',removeCallBack_UseEmptyCharacter).then((err, data) => {
            console.info("==========remove_promise_0600 start==========>");
            console.info("==========remove_promise_0600 err : =========>" + JSON.stringify(err));
            expect(err.code).assertNotEqual(0);
            console.info("==========remove_promise_0600 data : =========>" + JSON.stringify(data));
            console.info("==========remove_promise_0600 end==========>");
        });
        console.info("================OnConsume_removeUseEmptyCharacter_promise_0600 end=======================>");
    }

    function OnCancel_removeUseEmptyCharacter_promise(err, data) {
        console.info("==========================OnCancel_removeUseEmptyCharacter_0600 start=======================>");
        console.info("================OnCancel_removeUseEmptyCharacter_0600 data : =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeUseEmptyCharacter_0600 end=======================>");
    }

    /*
     * @tc.number: ANS_Remove_0600
     * @tc.name: remove(hashCode: string): Promise<void>;
     * @tc.desc: Verify that the Empty Character hashcode is used to call the interface remove(hashCode: string): Promise<void> to delete the notification information
     */
    it('ANS_Remove_0600', 0, async function (done) {
        console.info("===============ANS_Remove_0600==========================>");
        var subscriber ={
            onConsume:OnConsume_removeUseEmptyCharacter_promise,
            onCancel:OnCancel_removeUseEmptyCharacter_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0600_promise==================>");
        });
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
            console.info("==================publish_0600_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0600_promise==================>");
        });
        done();
    })

    function OnConsume_removeNotExistHashCode(err, data) {
        console.info("================OnConsume_removeNotExistHashCode_0700=======================>");
        console.info("================OnConsume_removeNotExistHashCode_0700 data: =======================>" + JSON.stringify(data));
        notify.remove("9999_9999_9",removeNotExistHashCodeCallBack);
        console.info("================OnConsume_removeNotExistHashCode_0700 remove=======================>");
        console.info("================OnConsume_removeNotExistHashCode_0700 end=======================>");
    }

    function OnCancelCallback_removeNotExistHashCode(err, data) {
        console.info("==========================OnCancelCallback_removeNotExistHashCode_0700 start=======================>");
        console.info("================OnCancelCallback_removeNotExistHashCode_0700 data : =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancelCallback_removeNotExistHashCode_0700 end=======================>");
    }

    function removeNotExistHashCodeCallBack(err) {
        console.info("================removeNotExistHashCodeCallBack_0700 start=======================>");
        console.info("================removeNotExistHashCodeCallBack_0700=======================>" + JSON.stringify(err));
        expect(err.code).assertNotEqual(0);
        console.info("================removeNotExistHashCodeCallBack_0700 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_0700
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the not exist hashCode is used to call the interface remove(hashCode: string, callback: AsyncCallback<void>): void to delete the notification information
     */
    it('ANS_Remove_0700', 0, async function (done) {
        console.info("===============ANS_Remove_0700==========================>");
        var subscriber ={
            onConsume:OnConsume_removeNotExistHashCode,
            onCancel:OnCancelCallback_removeNotExistHashCode,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0700_promise==================>");
        });
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
            label: "0700",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_0700_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0700_promise==================>");
        });
        done();
    })

    function OnConsume_removeNotExistHashCode_promise(err, data) {
        console.info("================OnConsume_removeNotExistHashCode_promise_0800=======================>");
        console.info("================OnConsume_removeNotExistHashCode_promise_0800 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeNotExistHashCode_promise_0800 err: =======================>" + JSON.stringify(err));
        notify.remove("9999_9999_9").then((err, data) => {
            console.info("================removeNotExistHashCode_promise_0800 start=======================>");
            console.info("================removeNotExistHashCode_promise_0800 data: =======================>" + JSON.stringify(data));
            console.info("================removeNotExistHashCode_promise_0800 err: =======================>" + JSON.stringify(err));
            expect(err.code).assertNotEqual(0);
            console.info("================removeNotExistHashCode_promise_0800 end=======================>");
        });
        console.info("================OnConsume_removeNotExistHashCode_promise_0800 end=======================>");
    }

    function OnCancelCallback_removeNotExistHashCode_promise(err, data) {
        console.info("==========================OnCancelCallback_removeNotExistHashCode_promise_0800=======================>");
        console.info("================OnCancelCallback_removeNotExistHashCode_promise_0800 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_removeNotExistHashCode_promise_0800 err : =======================>" + JSON.stringify(err));
        expect().assertFail();
        console.info("================OnCancelCallback_removeNotExistHashCode_promise_0800 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_0800
     * @tc.name: remove(hashCode: string): Promise<void>;
     * @tc.desc: Verify that the not exist hashCode is used to call the interface remove(hashCode: string, callback: AsyncCallback<void>): void to delete the notification information
     */
    it('ANS_Remove_0800', 0, async function (done) {
        console.info("===============ANS_Remove_0800==========================>");
        var subscriber ={
            onConsume:OnConsume_removeNotExistHashCode_promise,
            onCancel:OnCancelCallback_removeNotExistHashCode_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0800_promise==================>");
        });
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
            label: "0800",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_0800_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0800_promise==================>");
        });
        done();
    })
    function OnConsumeCallback_removeNonComplianceHashCode(err, data) {
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_0900 start=======================>");
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_0900 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_0900 err: =======================>" + JSON.stringify(err));
        notify.remove("哈希码",removeNonComplianceHashCallBack);
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_0900 remove=======================>");
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_0900 end=======================>");
    }

    function OnCancelCallback_removeNonComplianceHashCode(err, data) {
        console.info("==========================OnCancelCallback_removeNonComplianceHashCode_0900 start=======================>");
        console.info("================OnCancelCallback_removeNonComplianceHashCode_0900 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancelCallback_removeNonComplianceHashCode_0900 data: =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_removeNonComplianceHashCode_0900 end=======================>");
    }

    function removeNonComplianceHashCallBack(err, data) {
        console.info("================removeNonComplianceHashCallBack_0900 start=======================>");
        console.info("================removeNonComplianceHashCallBack_0900=======================>" + JSON.stringify(err));
        console.info("================removeNonComplianceHashCallBack_0900=======================>" + JSON.stringify(data));
        console.info("================removeNonComplianceHashCallBack_0900 end=======================>");
        expect(err.code).assertNotEqual(0);
    }
    /*
     * @tc.number: ANS_Remove_0900
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the non compliance hashCode is used to call the interface remove(hashCode: string, callback: AsyncCallback<void>): void to delete the notification information
     */
    it('ANS_Remove_0900', 0, async function (done) {
        console.info("===============ANS_Remove_0900==========================>");
        var subscriber ={
            onConsume:OnConsumeCallback_removeNonComplianceHashCode,
            onCancel:OnCancelCallback_removeNonComplianceHashCode,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_0900_promise==================>");
        });
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
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_0900_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_0900_promise==================>");
        });
        done();
    })
    function OnConsumeCallback_removeNonComplianceHashCode_promise(err, data) {
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_1000 start=======================>");
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_1000 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_1000 err: =======================>" + JSON.stringify(err));
        notify.remove("哈希码").then((err, data) => {
            console.info("================removeNonComplianceHashCode_promise_1000 start=======================>");
            console.info("================removeNonComplianceHashCode_promise_1000 data: =======================>" + JSON.stringify(data));
            console.info("================removeNonComplianceHashCode_promise_1000 err: =======================>" + JSON.stringify(err));
            expect(err.code).assertNotEqual(0);
            console.info("================removeNonComplianceHashCode_promise_1000 end=======================>");
        });
        console.info("================OnConsumeCallback_removeNonComplianceHashCode_1000 end=======================>");
    }

    function OnCancelCallback_removeNonComplianceHashCode_promise(err, data) {
        console.info("==========================OnCancelCallback_removeNonComplianceHashCode_1000 start=======================>");
        console.info("================OnCancelCallback_removeNonComplianceHashCode_1000 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancelCallback_removeNonComplianceHashCode_1000 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancelCallback_removeNonComplianceHashCode_1000 end=======================>");
    }

    /*
     * @tc.number: ANS_Remove_1000
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the non compliance hashCode is used to call the interface remove(hashCode: string, callback: AsyncCallback<void>): void to delete the notification information
     */
    it('ANS_Remove_1000', 0, async function (done) {
        console.info("===============ANS_Remove_1000==========================>");
        var subscriber ={
            onConsume:OnConsumeCallback_removeNonComplianceHashCode_promise,
            onCancel:OnCancelCallback_removeNonComplianceHashCode_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1000_promise==================>");
        });
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
            console.info("==================publish_1000_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1000_promise==================>");
        });
        done();
    })
    function removeCallBack2TimesOf2(err) {
        console.info("================removeCallBack2TimesOf2_1100 start=======================>");
        console.info("================removeCallBack2TimesOf2_1100=======================>" + JSON.stringify(err));
        expect(err.code).assertNotEqual(0);
        console.info("================removeCallBack2TimesOf2_1100 end=======================>");
    }
    function removeCallBack2TimesOf1(err) {
        console.info("================removeCallBack2TimesOf1_1100=======================>");
        console.info("================removeCallBack2TimesOf1_1100=======================>" + JSON.stringify(err));
        expect(err.code).assertequal(0);
        notify.remove(hashCode,removeCallBack2TimesOf2);
    }
    function OnConsumeCallback_remove2Times(err, data) {
        console.info("================OnConsumeCallback_remove2Times_1100 start=======================>");
        console.info("================OnConsumeCallback_remove2Times_1100 data: =======================>" + JSON.stringify(data));
        notify.remove(hashCode,removeCallBack2TimesOf1);
        console.info("================OnConsumeCallback_remove2Times_1100 remove=======================>");
        console.info("================OnConsumeCallback_remove2Times_1100 end=======================>");
    }
    var timesOfOnCancelCallback_remove2Times
    function OnCancelCallback_remove2Times(err, data) {
        timesOfOnCancelCallback_remove2Times = timesOfOnCancelCallback_remove2Times + 1
        console.info("==========================OnCancelCallback_remove2Times_1100=======================>");
        console.info("================OnCancelCallback_remove2Times_1100 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_remove2Times_1100 err : =======================>" + JSON.stringify(err));
        if (timesOfOnCancelCallback_remove2Times == 1){
            expect(data.request.id).assertequal(1);
        } else if  (timesOfOnCancelCallback_remove2Times == 2){
            expect().assertFail();
        }
        console.info("================OnCancelCallback_remove2Times_1100 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1100
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the interface  remove(hashCode: string, callback: AsyncCallback<void>): void; is called twice in a row to delete the notification information
     */
    it('ANS_Remove_1100', 0, async function (done) {
        console.info("===============ANS_Remove_1100==========================>");
        timesOfOnCancelCallback_remove2Times = 0
        var subscriber ={
            onConsume:OnConsumeCallback_remove2Times,
            onCancel:OnCancelCallback_remove2Times,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1100_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 11,
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
            label: "1100",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_1100_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1100_promise==================>");
        });
        done();
    })
    function OnConsumeCallback_remove2Times_promise(err, data) {
        console.info("================OnConsumeCallback_remove2Times_promise_1200 start=======================>");
        console.info("================OnConsumeCallback_remove2Times_promise_1200 data: =======================>" + JSON.stringify(data));
        notify.remove(hashCode).then((err, data) => {
            console.info("================remove_2times1_1200 start=======================>");
            console.info("================remove_2times1_1200 data: =======================>" + JSON.stringify(data));
            console.info("================remove_2times1_1200 err: =======================>" + JSON.stringify(err));
            expect(err.code).assertequal(0);
            notify.remove(hashCode).then((err, data) => {
                console.info("================remove_2times2_1200 start=======================>");
                console.info("================remove_2times2_1200 data: =======================>" + JSON.stringify(data));
                console.info("================remove_2times2_1200 err: =======================>" + JSON.stringify(err));
                expect(err.code).assertNotEqual(0);
                console.info("================remove_2times2_1200 end=======================>");
            });
            console.info("================remove_2times1_1200 end=======================>");
        });
        console.info("================OnConsumeCallback_remove2Times_promise_1200 remove=======================>");
        console.info("================OnConsumeCallback_remove2Times_promise_1200 end=======================>");
    }
    var timesOfOnCancelCallback_remove2Times_promise
    function OnCancelCallback_remove2Times_promise(err, data) {
        timesOfOnCancelCallback_remove2Times_promise = timesOfOnCancelCallback_remove2Times_promise + 1
        console.info("==========================OnCancelCallback_remove2Times_1200=======================>");
        console.info("================OnCancelCallback_remove2Times_1200 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_remove2Times_1200 err : =======================>" + JSON.stringify(err));
        if (timesOfOnCancelCallback_remove2Times_promise == 1){
            expect(data.request.id).assertequal(1);
        } else if  (timesOfOnCancelCallback_remove2Times_promise == 2){
            expect().assertFail();
        }
        console.info("================OnCancelCallback_remove2Times_1200 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1200
     * @tc.name: remove(hashCode: string): Promise<void>;
     * @tc.desc: Verify that the interface remove(hashCode: string): Promise<void> is called twice in a row to delete the notification information
     */
    it('ANS_Remove_1200', 0, async function (done) {
        console.info("===============ANS_Remove_1200==========================>");
        timesOfOnCancelCallback_remove2Times_promise = 0
        var subscriber ={
            onConsume:OnConsumeCallback_remove2Times_promise,
            onCancel:OnCancelCallback_remove2Times_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1200_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 12,
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
            label: "1200",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_1200_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1200_promise==================>");
        });
        done();
    })

    function OnConsume_removeIsUnremovable(err, data) {
        console.info("================OnConsume_removeIsUnremovable_1300 start=======================>");
        console.info("================OnConsume_removeIsUnremovable_1300 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeIsUnremovable_1300 err: =======================>" + JSON.stringify(err));
        notify.remove(data.request.hashCode,removeIsUnremovableCallBack);
        console.info("================OnConsume_removeIsUnremovable_1300 remove=======================>");
        console.info("================OnConsume_removeIsUnremovable_1300 end=======================>");
    }

    function OnCancel_removeIsUnremovable(err, data) {
        console.info("==========================OnCancel_removeIsUnremovable_1300 start=======================>");
        console.info("================OnCancel_removeIsUnremovable_1300 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeIsUnremovable_1300 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeIsUnremovable_1300 end=======================>");
    }

    function removeIsUnremovableCallBack(err, data) {
        console.info("================removeIsUnremovableCallBack_1300 start=======================>");
        console.info("================removeIsUnremovableCallBack_1300=======================>" + JSON.stringify(err));
        expect(err.code).assertNotEqual(0);
        console.info("================removeIsUnremovableCallBack_1300=======================>" + JSON.stringify(data));
        console.info("================removeIsUnremovableCallBack_1300 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1300
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the calling interface remove(hashCode: string, callback: AsyncCallback<void>): void; deletes the notification information that the property isunremovable is true
     */
    it('ANS_Remove_1300', 0, async function (done) {
        console.info("===============ANS_Remove_1300==========================>");
        var subscriber ={
            onConsume:OnConsume_removeIsUnremovable,
            onCancel:OnCancel_removeIsUnremovable,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1300_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 13,
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
            label: "1300",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_1300_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1300_promise==================>");
        });
        done();
    })

    function OnConsume_removeIsUnremovable_promise(err, data) {
        console.info("================OnConsume_removeIsUnremovable_promise_1400 start=======================>");
        console.info("================OnConsume_removeIsUnremovable_promise_1400 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeIsUnremovable_promise_1400 err: =======================>" + JSON.stringify(err));
        notify.remove(data.request.hashCode).then((err, data) => {
            console.info("================removeIsUnremovable_promise_1400 start=======================>");
            console.info("================removeIsUnremovable_promise_1400 data: =======================>" + JSON.stringify(data));
            console.info("================removeIsUnremovable_promise_1400 err: =======================>" + JSON.stringify(err));
            console.info("================removeIsUnremovable_promise_1400 end=======================>");
        });
        console.info("================OnConsume_removeIsUnremovable_promise_1400 end=======================>");
    }

    function OnCancel_removeIsUnremovable_promise(err, data) {
        console.info("==========================OnCancel_removeIsUnremovable_promise_1400 start=======================>");
        console.info("================OnCancel_removeIsUnremovable_promise_1400 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeIsUnremovable_promise_1400 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeIsUnremovable_promise_1400 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1400
     * @tc.name: remove(hashCode: string): Promise<void>;
     * @tc.desc: Verify that the calling interface remove(hashCode: string): Promise<void>; deletes the notification information that the property isunremovable is true
     */
    it('ANS_Remove_1400', 0, async function (done) {
        console.info("===============ANS_Remove_1400==========================>");
        var subscriber ={
            onConsume:OnConsume_removeIsUnremovable_promise,
            onCancel:OnCancel_removeIsUnremovable_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1400_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 14,
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
            label: "1400",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_1400_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1400_promise==================>");
        });
        done();
    })

    var timesOfOnConsume_removeAllByBundleOption
    function OnConsume_removeAllByBundleOption(err, data) {
        timesOfOnConsume_removeAllByBundleOption = timesOfOnConsume_removeAllByBundleOption + 1
        console.info("================OnConsume_removeAllByBundleOption_1500 start=======================>");
        console.info("================OnConsume_removeAllByBundleOption_1500 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAllByBundleOption_1500 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        if (timesOfOnConsume_removeAllByBundleOption == 2){
            notify.removeAll(bundleOption,removeAllByBundleOptionCallBack);
            console.info("================OnConsume_removeAllByBundleOption_1500 remove=======================>");
        }
        console.info("================OnConsume_removeAllByBundleOption_1500 end=======================>");
    }
    var timesOfOnCancel_removeAllByBundleOption
    function OnCancel_removeAllByBundleOption(err, data) {
        timesOfOnCancel_removeAllByBundleOption = timesOfOnCancel_removeAllByBundleOption + 1
        console.info("==========================OnCancel_removeAllByBundleOption_1500 start=======================>");
        console.info("================OnCancel_removeAllByBundleOption_1500 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeAllByBundleOption_1500 data: =======================>" + JSON.stringify(data));
        if (timesOfOnCancel_removeAllByBundleOption == 1){
            expect(data.request.label).assertequal("1500_1");
        }else if (timesOfOnCancel_removeAllByBundleOption == 2){
            expect(data.request.label).assertequal("1500_2");
        }
        console.info("================OnCancel_removeIsUnremovable_1500 end=======================>");
    }
    function removeAllByBundleOptionCallBack(err, data) {
        console.info("================removeAllByBundleOptionCallBack_1500 start=======================>");
        console.info("================removeAllByBundleOptionCallBack_1500=======================>" + JSON.stringify(err));
        console.info("================removeAllByBundleOptionCallBack_1500=======================>" + JSON.stringify(data));
        console.info("================removeAllByBundleOptionCallBack_1500 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1500
     * @tc.name: removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void;
     * @tc.desc: Verify that the calling interface removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void; deletes all notification information through BundleOption
     */
    it('ANS_Remove_1500', 0, async function (done) {
        console.info("===============ANS_Remove_1500==========================>");
        timesOfOnCancel_removeAllByBundleOption = 0
        timesOfOnConsume_removeAllByBundleOption = 0
        var subscriber ={
            onConsume:OnConsume_removeAllByBundleOption,
            onCancel:OnCancel_removeAllByBundleOption,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1500_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 15,
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
            label: "1500_1",
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
            id: 15,
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
            label: "1500_2",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish1_1500_promise==================>");
        });
        await notify.publish(notificationRequest1).then(() => {
            console.info("==================publish2_1500_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1500_promise==================>");
        });
        done();
    })

    var timesOfOnConsume_removeAllByBundleOption_nullUid
    function OnConsume_removeAllByBundleOption_nullUid(err, data) {
        console.info("================OnConsume_removeAllByBundleOption_nullUid_1600 start=======================>");
        console.info("================OnConsume_removeAllByBundleOption_nullUid_1600 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAllByBundleOption_nullUid_1600 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        timesOfOnConsume_removeAllByBundleOption_nullUid = timesOfOnConsume_removeAllByBundleOption_nullUid + 1
        if (timesOfOnConsume_removeAllByBundleOption_nullUid == 2){
            notify.removeAll(bundleOption,removeAllByBundleOptionCallBack_nullUid);
            console.info("================OnConsume_removeAllByBundleOption_nullUid_1600 remove=======================>");
        }
        console.info("================OnConsume_removeAllByBundleOption_nullUid_1600 end=======================>");
    }
    var timesOfOnCancel_removeAllByBundleOption_nullUid
    function OnCancel_removeAllByBundleOption_nullUid(err, data) {
        timesOfOnCancel_removeAllByBundleOption_nullUid = timesOfOnCancel_removeAllByBundleOption_nullUid + 1
        console.info("==========================OnCancel_removeAllByBundleOption_nullUid_1600 start=======================>");
        console.info("================OnCancel_removeAllByBundleOption_nullUid_1600 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeAllByBundleOption_nullUid_1600 data: =======================>" + JSON.stringify(data));
        if (timesOfOnCancel_removeAllByBundleOption_nullUid == 1){
            expect(data.request.label).assertequal("1600_1");
        }else if (timesOfOnCancel_removeAllByBundleOption_nullUid == 2){
            expect(data.request.label).assertequal("1600_2");
        }
        console.info("================OnCancel_removeAllByBundleOption_nullUid_1600 end=======================>");
    }
    function removeAllByBundleOptionCallBack_nullUid(err, data) {
        console.info("================removeAllByBundleOptionCallBack_nullUid_1600 start=======================>");
        console.info("================removeAllByBundleOptionCallBack_nullUid_1600=======================>" + JSON.stringify(err));
        console.info("================removeAllByBundleOptionCallBack_nullUid_1600=======================>" + JSON.stringify(data));
        console.info("================removeAllByBundleOptionCallBack_nullUid_1600 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1600
     * @tc.name: removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void;
     * @tc.desc: Verify that the calling interface removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void; deletes all notification information through BundleOption
                 Correct bundle, null uid.
     */
    it('ANS_Remove_1600', 0, async function (done) {
        console.info("===============ANS_Remove_1600==========================>");
        timesOfOnConsume_removeAllByBundleOption_nullUid = 0
        timesOfOnCancel_removeAllByBundleOption_nullUid = 0
        var subscriber ={
            onConsume:OnConsume_removeAllByBundleOption_nullUid,
            onCancel:OnCancel_removeAllByBundleOption_nullUid,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1600_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 16,
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
            label: "1600_1",
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
            id: 16,
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
            label: "1600_2",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish1_1600_promise==================>");
        });
        await notify.publish(notificationRequest1).then(() => {
            console.info("==================publish2_1600_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1600_promise==================>");
        });
        done();
    })

    function OnConsume_removeAllByBundleOption_wrongUid(err, data) {
        console.info("================OnConsume_removeAllByBundleOption_wrongUid_1700 start=======================>");
        console.info("================OnConsume_removeAllByBundleOption_wrongUid_1700 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAllByBundleOption_wrongUid_1700 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:123456789
        }
        notify.removeAll(bundleOption,removeAllByBundleOptionCallBack_wrongUid);
        console.info("================OnConsume_removeAllByBundleOption_wrongUid_1700 remove=======================>");
        console.info("================OnConsume_removeAllByBundleOption_wrongUid_1700 end=======================>");
    }
    function OnCancel_removeAllByBundleOption_wrongUid(err, data) {
        console.info("==========================OnCancel_removeAllByBundleOption_wrongUid_1700 start=======================>");
        console.info("================OnCancel_removeAllByBundleOption_wrongUid_1700 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeAllByBundleOption_wrongUid_1700 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeAllByBundleOption_wrongUid_1700 end=======================>");
    }
    function removeAllByBundleOptionCallBack_wrongUid(err, data) {
        console.info("================removeAllByBundleOptionCallBack_wrongUid_1700 start=======================>");
        console.info("================removeAllByBundleOptionCallBack_wrongUid_1700=======================>" + JSON.stringify(err));
        console.info("================removeAllByBundleOptionCallBack_wrongUid_1700=======================>" + JSON.stringify(data));
        expect(err.code).assertNotEqual(0);
        console.info("================removeAllByBundleOptionCallBack_wrongUid_1700 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1700
     * @tc.name: removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void;
     * @tc.desc: Verify that the calling interface removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void; deletes all notification information through BundleOption
                 Correct bundle, wrong uid.
     */
    it('ANS_Remove_1700', 0, async function (done) {
        console.info("===============ANS_Remove_1700==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAllByBundleOption_nullUid,
            onCancel:OnCancel_removeAllByBundleOption_nullUid,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1700_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 17,
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
            label: "1700",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_1700_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1700_promise==================>");
        });
        done();
    })

    function OnConsume_removeAllByBundleOption_wrongBundle_correctUid(err, data) {
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_correctUid_1800 start=======================>");
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_correctUid_1800 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_correctUid_1800 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:"wrongBundleName",
            uid:data.request.creatorUid,
        }
        notify.removeAll(bundleOption,removeAllByBundleOptionCallBack_wrongBundle_correctUid);
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_correctUid_1800 remove=======================>");
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_correctUid_1800 end=======================>");
    }
    function OnCancel_removeAllByBundleOption_wrongBundle_correctUid(err, data) {
        console.info("================OnCancel_removeAllByBundleOption_wrongBundle_correctUid_1800 start=======================>");
        console.info("================OnCancel_removeAllByBundleOption_wrongBundle_correctUid_1800 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeAllByBundleOption_wrongBundle_correctUid_1800 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeAllByBundleOption_wrongBundle_correctUid_1800 end=======================>");
    }
    function removeAllByBundleOptionCallBack_wrongBundle_correctUid(err, data) {
        console.info("================removeAllByBundleOptionCallBack_wrongBundle_correctUid_1800 start=======================>");
        console.info("================removeAllByBundleOptionCallBack_wrongBundle_correctUid_1800=======================>" + JSON.stringify(err));
        console.info("================removeAllByBundleOptionCallBack_wrongBundle_correctUid_1800=======================>" + JSON.stringify(data));
        expect(err.code).assertNotEqual(0);
        console.info("================removeAllByBundleOptionCallBack_wrongBundle_correctUid_1800 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1800
     * @tc.name: removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void;
     * @tc.desc: Verify that the calling interface removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void; deletes all notification information through BundleOption
                 wrong bundle, correct uid.
     */
    it('ANS_Remove_1800', 0, async function (done) {
        console.info("===============ANS_Remove_1800==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAllByBundleOption_wrongBundle_correctUid,
            onCancel:OnCancel_removeAllByBundleOption_wrongBundle_correctUid,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1800_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 18,
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
            label: "1800",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_1800_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1800_promise==================>");
        });
        done();
    })

    function OnConsume_removeAllByBundleOption_nullCharacterBundle_correctUid(err, data) {
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 start=======================>");
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:"",
            uid:data.request.creatorUid,
        }
        notify.removeAll(bundleOption,removeAllByBundleOptionCallBack_nullCharacterBundle_correctUid);
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 remove=======================>");
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 end=======================>");
    }
    function OnCancel_removeAllByBundleOption_nullCharacterBundle_correctUid(err, data) {
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 start=======================>");
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_correctUid_1900 end=======================>");
    }
    function removeAllByBundleOptionCallBack_nullCharacterBundle_correctUid(err, data) {
        console.info("================removeAllByBundleOptionCallBack_nullCharacterBundle_correctUid_1900 start=======================>");
        console.info("================removeAllByBundleOptionCallBack_nullCharacterBundle_correctUid_1900=======================>" + JSON.stringify(err));
        console.info("================removeAllByBundleOptionCallBack_nullCharacterBundle_correctUid_1900=======================>" + JSON.stringify(data));
        expect(err.code).assertNotEqual(0);
        console.info("================removeAllByBundleOptionCallBack_nullCharacterBundle_correctUid_1900 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_1900
     * @tc.name: removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void;
     * @tc.desc: Verify that the calling interface removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void; deletes all notification information through BundleOption
                 null character bundle, correct uid.
     */
    it('ANS_Remove_1900', 0, async function (done) {
        console.info("===============ANS_Remove_1900==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAllByBundleOption_nullCharacterBundle_correctUid,
            onCancel:OnCancel_removeAllByBundleOption_nullCharacterBundle_correctUid,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_1900_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 19,
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
            label: "1900",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_1900_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_1900_promise==================>");
        });
        done();
    })

    function OnConsume_removeAllByBundleOption_wrongBundle_wrongUid(err, data) {
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_wrongUid_2000 start=======================>");
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_wrongUid_2000 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_wrongUid_2000 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:"wrongBundleName",
            uid:123456789,
        }
        notify.removeAll(bundleOption,removeAllByBundleOptionCallBack_wrongBundle_wrongUid);
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_wrongUid_2000 remove=======================>");
        console.info("================OnConsume_removeAllByBundleOption_wrongBundle_wrongUid_2000 end=======================>");
    }
    function OnCancel_removeAllByBundleOption_wrongBundle_wrongUid(err, data) {
        console.info("================OnCancel_removeAllByBundleOption_wrongBundle_wrongUid_2000 start=======================>");
        console.info("================OnCancel_removeAllByBundleOption_wrongBundle_wrongUid_2000 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeAllByBundleOption_wrongBundle_wrongUid_2000 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeAllByBundleOption_wrongBundle_wrongUid_2000 end=======================>");
    }
    function removeAllByBundleOptionCallBack_wrongBundle_wrongUid(err, data) {
        console.info("================removeAllByBundleOptionCallBack_wrongBundle_wrongUid_2000 start=======================>");
        console.info("================removeAllByBundleOptionCallBack_wrongBundle_wrongUid_2000=======================>" + JSON.stringify(err));
        console.info("================removeAllByBundleOptionCallBack_wrongBundle_wrongUid_2000=======================>" + JSON.stringify(data));
        expect(err.code).assertNotEqual(0);
        console.info("================removeAllByBundleOptionCallBack_wrongBundle_wrongUid_2000 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2000
     * @tc.name: removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void;
     * @tc.desc: Verify that the calling interface removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void; deletes all notification information through BundleOption
                 wrong bundle, wrong uid.
     */
    it('ANS_Remove_2000', 0, async function (done) {
        console.info("===============ANS_Remove_2000==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAllByBundleOption_nullCharacterBundle_correctUid,
            onCancel:OnCancel_removeAllByBundleOption_nullCharacterBundle_correctUid,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2000_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 20,
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
            label: "2000",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_2000_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2000_promise==================>");
        });
        done();
    })

    function OnConsume_removeAllByBundleOption_nullCharacterBundle_wrongUid(err, data) {
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 start=======================>");
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:"",
            uid:123456789,
        }
        notify.removeAll(bundleOption,removeAllByBundleOptionCallBack_nullCharacterBundle_wrongUid);
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 remove=======================>");
        console.info("================OnConsume_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 end=======================>");
    }
    function OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid(err, data) {
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 start=======================>");
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid_2100 end=======================>");
    }
    function removeAllByBundleOptionCallBack_nullCharacterBundle_wrongUid(err, data) {
        console.info("================removeAllByBundleOptionCallBac_nullCharacterBundle_wrongUid_2100 start=======================>");
        console.info("================removeAllByBundleOptionCallBac_nullCharacterBundle_wrongUid_2100=======================>" + JSON.stringify(err));
        console.info("================removeAllByBundleOptionCallBac_nullCharacterBundle_wrongUid_2100=======================>" + JSON.stringify(data));
        expect(err.code).assertNotEqual(0);
        console.info("================removeAllByBundleOptionCallBac_nullCharacterBundle_wrongUid_2100 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2100
     * @tc.name: removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void;
     * @tc.desc: Verify that the calling interface removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void; deletes all notification information through BundleOption
                 null character bundle, wrong uid.
     */
    it('ANS_Remove_2100', 0, async function (done) {
        console.info("===============ANS_Remove_2100==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAllByBundleOption_nullCharacterBundle_wrongUid,
            onCancel:OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2100_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 21,
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
            label: "2100",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_2100_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2100_promise==================>");
        });
        done();
    })

    function OnConsume_removeAllByBundleOption_isUnremovable(err, data) {
        console.info("================OnConsume_removeAllByBundleOption_isUnremovable_2200 start=======================>");
        console.info("================OnConsume_removeAllByBundleOption_isUnremovable_2200 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAllByBundleOption_isUnremovable_2200 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:data.request.bundle,
            uid:data.request.creatorUidss,
        }
        notify.removeAll(bundleOption,removeAllByBundleOptionCallBack_isUnremovable);
        console.info("================OnConsume_removeAllByBundleOption_isUnremovable_2200 removeAll=======================>");
        console.info("================OnConsume_removeAllByBundleOption_isUnremovable_2200 end=======================>");
    }
    function OnCancel_removeAllByBundleOption_isUnremovable(err, data) {
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid_2200 start=======================>");
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid_2200 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid_2200 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeAllByBundleOption_nullCharacterBundle_wrongUid_2200 end=======================>");
    }
    function removeAllByBundleOptionCallBack_isUnremovable(err, data) {
        console.info("================removeAllByBundleOptionCallBac_nullCharacterBundle_wrongUid_2200 start=======================>");
        console.info("================removeAllByBundleOptionCallBac_nullCharacterBundle_wrongUid_2200=======================>" + JSON.stringify(err));
        console.info("================removeAllByBundleOptionCallBac_nullCharacterBundle_wrongUid_2200=======================>" + JSON.stringify(data));
        console.info("================removeAllByBundleOptionCallBac_nullCharacterBundle_wrongUid_2200 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2200
     * @tc.name: removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void;
     * @tc.desc: Verify that the removeAll(bundle: BundleOption, callback: AsyncCallback<void>):void interface is called to delete the notification information whose attribute isUnremovable is true
     */
    it('ANS_Remove_2200', 0, async function (done) {
        console.info("===============ANS_Remove_2200==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAllByBundleOption_isUnremovable,
            onCancel:OnCancel_removeAllByBundleOption_isUnremovable,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2200_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 22,
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
            label: "2200",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_2200_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2200_promise==================>");
        });
        done();
    })

    function removeAllCallBack(err,data) {
        console.info("================removeAllCallBack_2300 start: =======================>");
        console.info("================removeAllCallBack_2300 err: =======================>" + JSON.stringify(err));
        console.info("================removeAllCallBack_2300 data: =======================>" + JSON.stringify(data));
        console.info("================removeAllCallBack_2300 end: =======================>");
    }
    var timesOfOnConsume_removeAll = 0
    function OnConsume_removeAll(err, data, ) {
        timesOfOnConsume_removeAll = timesOfOnConsume_removeAll + 1
        console.info("================OnConsume_removeAll_2300 start=======================>");
        console.info("================OnConsume_removeAll_2300 data: =======================>" + JSON.stringify(data));
        if (timesOfOnConsume_removeAll == 2)
        {
            notify.removeAll(removeAllCallBack);
            console.info("================OnConsume_removeAll_2300 removeAll=======================>");
        }
        console.info("================OnConsume_removeAll_2300 end=======================>");
    }
    var timesOfOnCancel_removeAll
    function OnCancel_removeAll(err, data) {
        timesOfOnCancel_removeAll = timesOfOnCancel_removeAll + 1
        console.info("==========================OnCancel_removeAll_2300=======================>");
        console.info("================OnCancel_removeAll_2300 data : =======================>" + JSON.stringify(data));
        if (timesOfOnCancel_removeAll == 1)
        {
            expect(data.request.label).assertequal("2300_1");
        }
        if (timesOfOnCancel_removeAll == 2)
        {
            expect(data.request.label).assertequal("2300_2");
        }
        console.info("================cancelCallback_removeAll_0200 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2300
     * @tc.name: removeAll(callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the removeAll(callback: AsyncCallback<void>): void interface is called to delete the notification information
     */
    it('ANS_Remove_2300', 0, async function (done) {
        console.info("===============ANS_Remove_2300==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAll,
            onCancel:OnCancel_removeAll,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2300_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 23,
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
            label: "2300_1",
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
            id: 23,
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
            label: "2300_2",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish1_2300_promise==================>");
        });
        await notify.publish(notificationRequest1).then(() => {
            console.info("==================publish2_2300_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2300_promise==================>");
        });
        done();
    })

    var timesOfOnConsume_removeAll = 0
    function OnConsume_removeAll_promise(err, data) {
        timesOfOnConsume_removeAll = timesOfOnConsume_removeAll + 1
        console.info("================OnConsume_removeAll_promise_2400 start=======================>");
        console.info("================OnConsume_removeAll_promise_2400 data: =======================>" + JSON.stringify(data));
        if (timesOfOnConsume_removeAll == 2)
        {
            notify.removeAll().then((err, data) => {
                console.info("================removeAll_promise_2400 start=======================>");
                console.info("================removeAll_promise_2400 data: =======================>" + JSON.stringify(data));
                console.info("================removeAll_promise_2400 err: =======================>" + JSON.stringify(err));
                console.info("================removeAll_promise_2400 end=======================>");
            });
            console.info("================OnConsume_removeAll_promise_2400 removeAll=======================>");
        }
        console.info("================OnConsume_removeAll_promise_2400 end=======================>");
    }
    var timesOfOnCancel_removeAll
    function OnCancel_removeAll_promise(err, data) {
        timesOfOnCancel_removeAll = timesOfOnCancel_removeAll + 1
        console.info("==========================OnCancel_removeAll_promise_2400 start=======================>");
        console.info("================OnCancel_removeAll_promise_2400 data : =======================>" + JSON.stringify(data));
        if (timesOfOnCancel_removeAll == 1)
        {
            expect(data.request.label).assertequal("2400_1");
        }
        if (timesOfOnCancel_removeAll == 2)
        {
            expect(data.request.label).assertequal("2400_2");
        }
        console.info("================OnCancel_removeAll_promise_2400 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2400
     * @tc.name: removeAll(bundle?: BundleOption): Promise<void>
     * @tc.desc: Verify that the removeAll(bundle?: BundleOption): Promise<void> interface is called to delete the notification information
     */
    it('ANS_Remove_2400', 0, async function (done) {
        console.info("===============ANS_Remove_2400==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAll,
            onCancel:OnCancel_removeAll,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2400_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 24,
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
            label: "2400_1",
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
            id: 24,
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
            label: "2400_2",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish1_2400_promise==================>");
        });
        await notify.publish(notificationRequest1).then(() => {
            console.info("==================publish2_2400_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2400_promise==================>");
        });
        done();
    })

    function removeAllCallBack_isUnremovable(err,data) {
        console.info("================removeAllCallBack_isUnremovable_2500 start=======================>");
        console.info("================removeAllCallBack_isUnremovable_2500 JSON.stringify(err): =======================>" + JSON.stringify(err));
        console.info("================removeAllCallBack_isUnremovable_2500 JSON.stringify(data): =======================>" + JSON.stringify(data));
        console.info("================removeAllCallBack_isUnremovable_2500 end=======================>");
    }
    function OnConsume_removeAll_isUnremovable(err, data) {
        console.info("================OnConsume_removeAll_isUnremovable_2500 start=======================>");
        console.info("================OnConsume_removeAll_isUnremovable_2500 data: =======================>" + JSON.stringify(data));
        notify.removeAll(removeAllCallBack_isUnremovable);
        console.info("================removeAll_isUnremovable_2500 =======================>");
        console.info("================OnConsume_removeAll_isUnremovable_2500 end=======================>");
    }
    function OnCancelCallback_removeAll_isUnremovable(err, data) {
        console.info("================OnCancelCallback_removeAll_isUnremovable_2500 start=======================>");
        console.info("================OnCancelCallback_removeAll_isUnremovable_2500 err : =======================>" + JSON.stringify(err));
        console.info("================OnCancelCallback_removeAll_isUnremovable_2500 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_removeAll_isUnremovable_2500 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2500
     * @tc.name: removeAll(callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the removeAll(callback: AsyncCallback<void>): void interface is called to delete the notification information whose attribute isUnremovable is true
     */
    it('ANS_Remove_2500', 0, async function (done) {
        console.info("===============ANS_Remove_2500==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAll_isUnremovable,
            onCancel:OnCancelCallback_removeAll_isUnremovable,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2500_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 25,
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
            label: "2500",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_2500_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2500_promise==================>");
        });
        done();
    })

    function OnConsume_removeAll_isUnremovable_promise(err, data) {
        console.info("================OnConsume_removeAll_isUnremovable_promise_2600 start=======================>");
        console.info("================OnConsume_removeAll_isUnremovable_promise_2600 data=======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeAll_isUnremovable_promise_2600 err=======================>" + JSON.stringify(err));
        notify.removeAll().then((err, data) => {
            console.info("================removeAll_isUnremovable_2600 start=======================>");
            console.info("================removeAll_isUnremovable_2600 data: =======================>" + JSON.stringify(data));
            console.info("================removeAll_isUnremovable_2600 err: =======================>" + JSON.stringify(err));
            console.info("================removeAll_isUnremovable_2600 end=======================>");
        });
        console.info("================OnConsume_removeAll_isUnremovable_promise_2600=======================>");
        console.info("================OnConsume_removeAll_isUnremovable_promise_2600 end=======================>");
    }
    function OnCancelCallback_removeAll_isUnremovable_promise(err, data) {
        console.info("================OnCancelCallback_removeAll_isUnremovable_promise_2600 start=======================>");
        console.info("================OnCancelCallback_removeAll_isUnremovable_promise_2600 err : =======================>" + JSON.stringify(err));
        console.info("================OnCancelCallback_removeAll_isUnremovable_promise_2600 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_removeAll_isUnremovable_promise_2600 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2600
     * @tc.name: removeAll(bundle?: BundleOption): Promise<void>;
     * @tc.desc: Verify that the removeAll(bundle?: BundleOption): Promise<void> interface is called to delete the notification information whose attribute isUnremovable is true
     */
    it('ANS_Remove_2600', 0, async function (done) {
        console.info("===============ANS_Remove_2600==========================>");
        var subscriber ={
            onConsume:OnConsume_removeAll_isUnremovable_promise,
            onCancel:OnCancelCallback_removeAll_isUnremovable_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2600_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 26,
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
            label: "2600",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_2600_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2600_promise==================>");
        });
        done();
    })

    function removeAllCallBack2TimesOf2(err,data) {
        console.info("================removeAllCallBack2TimesOf2_2700 start=======================>");
        console.info("================removeAllCallBack2TimesOf2_2700 err=======================>" + JSON.stringify(err));
        console.info("================removeAllCallBack2TimesOf2_2700 data=======================>" + JSON.stringify(data));
        expect(err.code).assertNotEqual(0);
        console.info("================removeAllCallBack2TimesOf2_2700 end=======================>");
    }
    function removeAllCallBack2TimesOf1(err,data) {
        console.info("================removeAllCallBack2TimesOf1_2700 start=======================>");
        console.info("================removeAllCallBack2TimesOf1_2700 err=======================>" + JSON.stringify(err));
        console.info("================removeAllCallBack2TimesOf1_2700 data=======================>" + JSON.stringify(data));
        expect(err.code).assertequal(0);
        notify.removeAll(removeCallBack2TimesOf2);
        console.info("================removeAllCallBack2TimesOf1_2700 removeCallBack2TimesOf2=======================>");
        console.info("================removeAllCallBack2TimesOf1_2700 end=======================>");
    }
    function OnConsumeCallback_removeAll2Times(err, data) {
        console.info("================OnConsumeCallback_removeAll2Times_2700 start=======================>");
        console.info("================OnConsumeCallback_removeAll2Times_2700 data: =======================>" + JSON.stringify(data));
        notify.removeAll(removeCallBack2TimesOf1);
        console.info("================OnConsumeCallback_removeAll2Times_2700 remove=======================>");
        console.info("================OnConsumeCallback_removeAll2Times_2700 end=======================>");
    }
    var timesOfOnCancelCallback_removeAll2Times
    function OnCancelCallback_removeAll2Times(err, data) {
        timesOfOnCancelCallback_removeAll2Times = timesOfOnCancelCallback_removeAll2Times + 1
        console.info("================OnCancelCallback_removeAll2Times_2700 start=======================>");
        console.info("================OnCancelCallback_removeAll2Times_2700 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_removeAll2Times_2700 err : =======================>" + JSON.stringify(err));
        if (timesOfOnCancelCallback_removeAll2Times == 1){
            expect(data.request.id).assertequal(1);
        } else if  (timesOfOnCancelCallback_removeAll2Times == 2){
            expect().assertFail();
        }
        console.info("================OnCancelCallback_removeAll2Times_2700 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2700
     * @tc.name: remove(hashCode: string, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the interface  remove(hashCode: string, callback: AsyncCallback<void>): void; is called twice in a row to delete the notification information
     */
    it('ANS_Remove_2700', 0, async function (done) {
        console.info("===============ANS_Remove_2700==========================>");
        timesOfOnCancelCallback_removeAll2Times = 0
        var subscriber ={
            onConsume:OnConsumeCallback_removeAll2Times,
            onCancel:OnCancelCallback_removeAll2Times,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2700_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 27,
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
            label: "2700",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_2700_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2700_promise==================>");
        });
        done();
    })

    function OnConsumeCallback_removeAll2Times_promise(err, data) {
        console.info("================OnConsumeCallback_removeAll2Times_promise_2800 start=======================>");
        console.info("================OnConsumeCallback_removeAll2Times_promise_2800 data: =======================>" + JSON.stringify(data));
        notify.removeAll().then((err, data) => {
            console.info("================removeAll_2times1_2800 start=======================>");
            console.info("================removeAll_2times1_2800 data: =======================>" + JSON.stringify(data));
            console.info("================removeAll_2times1_2800 err: =======================>" + JSON.stringify(err));
            expect(err.code).assertequal(0);
            notify.removeAll().then((err, data) => {
                console.info("================removeAll_2times2_2800 start=======================>");
                console.info("================removeAll_2times2_2800 data: =======================>" + JSON.stringify(data));
                console.info("================removeAll_2times2_2800 err: =======================>" + JSON.stringify(err));
                expect(err.code).assertNotEqual(0);
                console.info("================removeAll_2times2_2800 end=======================>");
            });
            console.info("================removeAll_2times1_2800 end=======================>");
        });
        console.info("================OnConsumeCallback_removeAll2Times_promise_2800 remove=======================>");
        console.info("================OnConsumeCallback_removeAll2Times_promise_2800 end=======================>");
    }
    var timesOfOnCancelCallback_removeAll2Times_promise
    function OnCancelCallback_removeAll2Times_promise(err, data) {
        timesOfOnCancelCallback_removeAll2Times_promise = timesOfOnCancelCallback_removeAll2Times_promise + 1
        console.info("==========================OnCancelCallback_removeAll2Times_2800 start=======================>");
        console.info("================OnCancelCallback_removeAll2Times_2800 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_removeAll2Times_2800 err : =======================>" + JSON.stringify(err));
        if (timesOfOnCancelCallback_removeAll2Times_promise == 1){
            expect(data.request.id).assertequal(1);
        } else if  (timesOfOnCancelCallback_removeAll2Times_promise == 2){
            expect().assertFail();
        }
        console.info("================OnCancelCallback_removeAll2Times_2800 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2800
     * @tc.name: removeAll(bundle?: BundleOption): Promise<void>;
     * @tc.desc: Verify that the interface removeAll(bundle?: BundleOption): Promise<void>; is called twice in a row to delete the notification information
     */
    it('ANS_Remove_2800', 0, async function (done) {
        console.info("===============ANS_Remove_2800==========================>");
        timesOfOnCancelCallback_removeAll2Times_promise = 0
        var subscriber ={
            onConsume:OnConsumeCallback_removeAll2Times_promise,
            onCancel:OnCancelCallback_removeAll2Times_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2800_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 28,
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
            label: "2800",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_2800_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2800_promise==================>");
        });
        done();
    })

    function OnConsume_removeByNotificationKey(err, data) {
        console.info("================OnConsume_removeByNotificationKey_2900 start=======================>");
        console.info("================OnConsume_removeByNotificationKey_2900 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeByNotificationKey_2900 err: =======================>" + JSON.stringify(err));
        console.info("================OnConsume_removeByNotificationKey_2900 creatorBundleName: =======================>" + data.request.creatorBundleName);
        console.info("================OnConsume_removeByNotificationKey_2900 creatorUid: =======================>" + data.request.creatorUid);
        console.info("================OnConsume_removeByNotificationKey_2900 id: =======================>" + data.request.id);
        console.info("================OnConsume_removeByNotificationKey_2900 label: =======================>" + data.request.label);
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        var notificationKey = {
            id:data.request.id,
            label:data.request.label
        }
        notify.remove(bundleOption,notificationKey,removeByNotificationKeyCB);
        console.info("================OnConsume_removeByNotificationKey_2900 remove=======================>");
        console.info("================OnConsume_removeByNotificationKey_2900 end=======================>");
    }
    function OnCancel_removeByNotificationKey(err, data) {
        console.info("================OnCancel_removeByNotificationKey_2900 start=======================>");
        console.info("================OnCancel_removeByNotificationKey_2900 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeByNotificationKey_2900 data: =======================>" + JSON.stringify(data));
        expect(data.request.label).assertequal("2900");
        expect(data.request.id).assertequal(29);
        console.info("================OnCancel_removeByNotificationKey_2900 end=======================>");
    }
    function removeByNotificationKeyCB(err, data) {
        console.info("================removeByNotificationKeyCB_2900 start=======================>");
        console.info("================removeByNotificationKeyCB_2900=======================>" + JSON.stringify(err));
        console.info("================removeByNotificationKeyCB_2900=======================>" + JSON.stringify(data));
        console.info("================removeByNotificationKeyCB_2900 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_2900
     * @tc.name: remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the calling interface remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void; deletes notification information through BundleOption and NotificationKey
     */
    it('ANS_Remove_2900', 0, async function (done) {
        console.info("===============ANS_Remove_2900==========================>");
        var subscriber ={
            onConsume:OnConsume_removeByNotificationKey,
            onCancel:OnCancel_removeByNotificationKey,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_2900_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 29,
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
            label: "2900",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_2900_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_2900_promise==================>");
        });
        done();
    })

    function OnConsume_removeByNotificationKey_promise(err, data) {
        console.info("================OnConsume_removeByNotificationKey_promise_3000 start=======================>");
        console.info("================OnConsume_removeByNotificationKey_promise_3000 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeByNotificationKey_promise_3000 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        var notificationKey = {
            id:30,
            label:"3000"
        }
        notify.remove(bundleOption,notificationKey).then((err, data) => {
            console.info("================removeByNotificationKey_promise_3000 start=======================>");
            console.info("================removeByNotificationKey_promise_3000 data: =======================>" + JSON.stringify(data));
            console.info("================removeByNotificationKey_promise_3000 err: =======================>" + JSON.stringify(err));
            console.info("================removeByNotificationKey_promise_3000 end=======================>");
        });
        console.info("================OnConsume_removeByNotificationKey_promise_3000 remove=======================>");
        console.info("================OnConsume_removeByNotificationKey_promise_3000 end=======================>");
    }
    function OnCancel_removeByNotificationKey_promise(err, data) {
        console.info("================OnCancel_removeByNotificationKey_promise_3000 start=======================>");
        console.info("================OnCancel_removeByNotificationKey_promise_3000 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeByNotificationKey_promise_3000 data: =======================>" + JSON.stringify(data));
        expect(data.request.label).assertequal("3000");
        expect(data.request.id).assertequal(30);
        console.info("================OnCancel_removeByNotificationKey_promise_3000 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_3000
     * @tc.name: remove(bundle: BundleOption, notificationKey: NotificationKey): Promise<void>;
     * @tc.desc: Verify that the calling interface remove(bundle: BundleOption, notificationKey: NotificationKey): Promise<void> deletes notification information through BundleOption and NotificationKey
     */
    it('ANS_Remove_3000', 0, async function (done) {
        console.info("===============ANS_Remove_3000==========================>");
        var subscriber ={
            onConsume:OnConsume_removeByNotificationKey_promise,
            onCancel:OnCancel_removeByNotificationKey_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_3000_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 30,
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
            label: "3000",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_3000_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_3000_promise==================>");
        });
        done();
    })

    function OnConsume_removeByNotificationKey_wrongKey(err, data) {
        console.info("================OnConsume_removeByNotificationKey_wrongKey_3100 start=======================>");
        console.info("================OnConsume_removeByNotificationKey_wrongKey_3100 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeByNotificationKey_wrongKey_3100 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        var notificationKey = {
            id:0,
            label:"wrongLabel"
        }
        notify.remove(bundleOption,notificationKey,removeByNotificationKeyCB_wrongKey);
        console.info("================OnConsume_removeByNotificationKey_wrongKey_3100 remove=======================>");
        console.info("================OnConsume_removeByNotificationKey_wrongKey_3100 end=======================>");
    }
    function OnCancel_removeByNotificationKey_wrongKey(err, data) {
        console.info("================OnCancel_removeByNotificationKey_wrongKey_3100 start=======================>");
        console.info("================OnCancel_removeByNotificationKey_wrongKey_3100 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeByNotificationKey_wrongKey_3100 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeByNotificationKey_wrongKey_3100 end=======================>");
    }
    function removeByNotificationKeyCB_wrongKey(err, data) {
        console.info("================removeByNotificationKeyCB_3100 start=======================>");
        console.info("================removeByNotificationKeyCB_3100=======================>" + JSON.stringify(err));
        expect(err.code).assertNotEqual(0);
        console.info("================removeByNotificationKeyCB_3100=======================>" + JSON.stringify(data));
        console.info("================removeByNotificationKeyCB_3100 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_3100
     * @tc.name: remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the calling interface remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void; deletes notification information through BundleOption and NotificationKey
                 correct bundleOption,wrong notificationKey.
     */
    it('ANS_Remove_3100', 0, async function (done) {
        console.info("===============ANS_Remove_3100==========================>");
        var subscriber ={
            onConsume:OnConsume_removeByNotificationKey_wrongKey,
            onCancel:OnCancel_removeByNotificationKey_wrongKey,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_3100_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 31,
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
            label: "3100",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_3100_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_3100_promise==================>");
        });
        done();
    })

    function OnConsume_removeByNotificationKey_wrongKey_promise(err, data) {
        console.info("================OnConsume_removeByNotificationKey_wrongKey_promise_3200 start=======================>");
        console.info("================OnConsume_removeByNotificationKey_wrongKey_promise_3200 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeByNotificationKey_wrongKey_promise_3200 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        var notificationKey = {
            id:0,
            label:"wrongLabel"
        }
        notify.remove(bundleOption, notificationKey).then((err, data) => {
            console.info("================removeByNotificationKey_wrongKey_promise_3200 start=======================>");
            console.info("================removeByNotificationKey_wrongKey_promise_3200 data: =======================>" + JSON.stringify(data));
            console.info("================removeByNotificationKey_wrongKey_promise_3200 err: =======================>" + JSON.stringify(err));
            console.info("================removeByNotificationKey_wrongKey_promise_3200 end=======================>");
        });
        console.info("================OnConsume_removeByNotificationKey_wrongKey_promise_3200 end=======================>");
    }
    function OnCancel_removeByNotificationKey_wrongKey_promise(err, data) {
        console.info("================OnCancel_removeByNotificationKey_wrongKey_promise_3200 start=======================>");
        console.info("================OnCancel_removeByNotificationKey_wrongKey_promise_3200 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeByNotificationKey_wrongKey_promise_3200 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeByNotificationKey_wrongKey_promise_3200 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_3200
     * @tc.name: remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the calling interface remove(bundle: BundleOption, notificationKey: NotificationKey): Promise<void> deletes notification information through BundleOption and NotificationKey
                 correct bundleOption,wrong notificationKey.
     */
    it('ANS_Remove_3200', 0, async function (done) {
        console.info("===============ANS_Remove_3200==========================>");
        var subscriber ={
            onConsume:OnConsume_removeByNotificationKey_wrongKey_promise,
            onCancel:OnCancel_removeByNotificationKey_wrongKey_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_3200_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 32,
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
            label: "3200",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_3200_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_3200_promise==================>");
        });
        done();
    })

    function OnConsume_removeByNotificationKey_wrongBundle(err, data) {
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_3300 start=======================>");
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_3300 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_3300 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:"wrongBundleName",
            uid:0,
        }
        var notificationKey = {
            id:33,
            label:"3300"
        }
        notify.remove(bundleOption,notificationKey,removeByNotificationKeyCB_wrongKey);
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_3300 remove=======================>");
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_3300 end=======================>");
    }
    function OnCancel_removeByNotificationKey_wrongBundle(err, data) {
        console.info("================OnCancel_removeByNotificationKey_wrongBundle_3300 start=======================>");
        console.info("================OnCancel_removeByNotificationKey_wrongBundle_3300 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeByNotificationKey_wrongBundle_3300 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeByNotificationKey_wrongBundle_3300 end=======================>");
    }
    function removeByNotificationKeyCB_wrongBundle(err, data) {
        console.info("================removeByNotificationKeyCB_wrongBundle_3300 start=======================>");
        console.info("================removeByNotificationKeyCB_wrongBundle_3300=======================>" + JSON.stringify(err));
        expect(err.code).assertNotEqual(0);
        console.info("================removeByNotificationKeyCB_wrongBundle_3300=======================>" + JSON.stringify(data));
        console.info("================removeByNotificationKeyCB_wrongBundle_3300 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_3300
     * @tc.name: remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the calling interface remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void; deletes notification information through BundleOption and NotificationKey
                 wrong bundleOption,correct notificationKey.
     */
    it('ANS_Remove_3300', 0, async function (done) {
        console.info("===============ANS_Remove_3300==========================>");
        var subscriber ={
            onConsume:OnConsume_removeByNotificationKey_wrongBundle,
            onCancel:OnCancel_removeByNotificationKey_wrongBundle,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_3300_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 33,
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
            label: "3300",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_3300_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_3300_promise==================>");
        });
        done();
    })

    function OnConsume_removeByNotificationKey_wrongBundle_promise(err, data) {
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_promise_3400 start=======================>");
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_promise_3400 data: =======================>" + JSON.stringify(data));
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_promise_3400 err: =======================>" + JSON.stringify(err));
        var bundleOption = {
            bundle:"wrongBundleName",
            uid:0,
        }
        var notificationKey = {
            id:34,
            label:"3400"
        }
        notify.remove(bundleOption, notificationKey).then((err, data) => {
            console.info("================removeByNotificationKey_wrongBundle_promise_3400 start=======================>");
            console.info("================removeByNotificationKey_wrongBundle_promise_3400 data: =======================>" + JSON.stringify(data));
            console.info("================removeByNotificationKey_wrongBundle_promise_3400 err: =======================>" + JSON.stringify(err));
            console.info("================removeByNotificationKey_wrongBundle_promise_3400 end=======================>");
        });
        console.info("================OnConsume_removeByNotificationKey_wrongBundle_promise_3400 end=======================>");
    }
    function OnCancel_removeByNotificationKey_wrongBundle_promise(err, data) {
        console.info("================OnCancel_removeByNotificationKey_wrongBundle_promise_3400 start=======================>");
        console.info("================OnCancel_removeByNotificationKey_wrongBundle_promise_3400 err: =======================>" + JSON.stringify(err));
        console.info("================OnCancel_removeByNotificationKey_wrongBundle_promise_3400 data: =======================>" + JSON.stringify(data));
        expect().assertFail();
        console.info("================OnCancel_removeByNotificationKey_wrongBundle_promise_3400 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_3400
     * @tc.name: remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the calling interface remove(bundle: BundleOption, notificationKey: NotificationKey): Promise<void> deletes notification information through BundleOption and NotificationKey
                 correct bundleOption,wrong notificationKey.
     */
    it('ANS_Remove_3400', 0, async function (done) {
        console.info("===============ANS_Remove_3400==========================>");
        var subscriber ={
            onConsume:OnConsume_removeByNotificationKey_wrongBundle_promise,
            onCancel:OnCancel_removeByNotificationKey_wrongBundle_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_3400_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 34,
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
            label: "3400",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_3400_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_3400_promise==================>");
        });
        done();
    })

    function removeByNotificationKey2Times2CB(err,data) {
        console.info("================removeByNotificationKey2Times2CB_3500 start=======================>");
        console.info("================removeByNotificationKey2Times2CB_3500 err=======================>" + JSON.stringify(err));
        console.info("================removeByNotificationKey2Times2CB_3500 data=======================>" + JSON.stringify(data));
        expect(err.code).assertNotEqual(0);
        console.info("================removeByNotificationKey2Times2CB_3500 end=======================>");
    }
    function removeByNotificationKey2Times1CB(err,data) {
        console.info("================removeByNotificationKey2Times1CB_3500 start=======================>");
        console.info("================removeByNotificationKey2Times1CB_3500 err=======================>" + JSON.stringify(err));
        console.info("================removeByNotificationKey2Times1CB_3500 data=======================>" + JSON.stringify(data));
        expect(err.code).assertequal(0);
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        var notificationKey = {
            id:35,
            label:"3500"
        }
        notify.remove(bundleOption,notificationKey,removeByNotificationKey2Times2CB);
        console.info("================removeByNotificationKey2Times1CB_3500 removeCallBack2TimesOf2=======================>");
        console.info("================removeByNotificationKey2Times1CB_3500 end=======================>");
    }
    function OnConsume_removeByNotificationKey2Times(err, data) {
        console.info("================OnConsume_removeByNotificationKey2Times_3500 start=======================>");
        console.info("================OnConsume_removeByNotificationKey2Times_3500 data: =======================>" + JSON.stringify(data));
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        var notificationKey = {
            id:35,
            label:"3500"
        }
        notify.remove(bundleOption,notificationKey,removeByNotificationKey2Times1CB);
        console.info("================OnConsume_removeByNotificationKey2Times_3500 remove=======================>");
        console.info("================OnConsume_removeByNotificationKey2Times_3500 end=======================>");
    }
    var timesOfOnCancel__removeByNotificationKey2Times
    function OnCancel_removeByNotificationKey2Times(err, data) {
        timesOfOnCancel__removeByNotificationKey2Times = timesOfOnCancel__removeByNotificationKey2Times + 1
        console.info("================OnCancelCallback_removeAll2Times_2700 start=======================>");
        console.info("================OnCancelCallback_removeAll2Times_2700 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_removeAll2Times_2700 err : =======================>" + JSON.stringify(err));
        if (timesOfOnCancel__removeByNotificationKey2Times == 1){
            expect(data.request.id).assertequal(35);
            expect(data.request.label).assertequal("3500");
        } else if  (timesOfOnCancel__removeByNotificationKey2Times == 2){
            expect().assertFail();
        }
        console.info("================OnCancelCallback_removeAll2Times_2700 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_3500
     * @tc.name: remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that the interface  remove(bundle: BundleOption, notificationKey: NotificationKey, callback: AsyncCallback<void>): void; void; is called twice in a row to delete the notification information
     */
    it('ANS_Remove_3500', 0, async function (done) {
        console.info("===============ANS_Remove_3500==========================>");
        timesOfOnCancel__removeByNotificationKey2Times = 0
        var subscriber ={
            onConsume:OnConsume_removeByNotificationKey2Times,
            onCancel:OnCancel_removeByNotificationKey2Times,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_3500_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 35,
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
            label: "3500",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_3500_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_3500_promise==================>");
        });
        done();
    })

    function OnConsumeCallback_removeByNotificationKey2Times_promise(err, data) {
        console.info("================OnConsumeCallback_removeByNotificationKey2Times_promise_3600 start=======================>");
        console.info("================OnConsumeCallback_removeByNotificationKey2Times_promise_3600 data: =======================>" + JSON.stringify(data));
        var bundleOption = {
            bundle:data.request.creatorBundleName,
            uid:data.request.creatorUid,
        }
        var notificationKey = {
            id:36,
            label:"3600"
        }
        notify.remove(bundleOption, notificationKey).then((err, data) => {
            console.info("================removeByNotificationKey2Times1_promise_3600 start=======================>");
            console.info("================removeByNotificationKey2Times1_promise_3600 data: =======================>" + JSON.stringify(data));
            console.info("================removeByNotificationKey2Times1_promise_3600 err: =======================>" + JSON.stringify(err));
            notify.remove(bundleOption, notificationKey).then((err, data) => {
                console.info("================removeByNotificationKey2Times2_promise_3600 start=======================>");
                console.info("================removeByNotificationKey2Times2_promise_3600 data: =======================>" + JSON.stringify(data));
                console.info("================removeByNotificationKey2Times2_promise_3600 err: =======================>" + JSON.stringify(err));
                console.info("================removeByNotificationKey2Times2_promise_3600 end=======================>");
            });
            console.info("================removeByNotificationKey2Times1_promise_3600 end=======================>");
        });
        console.info("================OnConsumeCallback_removeByNotificationKey2Times_promise_3600 remove=======================>");
        console.info("================OnConsumeCallback_removeByNotificationKey2Times_promise_3600 end=======================>");
    }
    var timesOnCancelCallback_removeByNotificationKey2Times_promise
    function OnCancelCallback_removeByNotificationKey2Times_promise(err, data) {
        timesOnCancelCallback_removeByNotificationKey2Times_promise = timesOnCancelCallback_removeByNotificationKey2Times_promise + 1
        console.info("==========================OnCancelCallback_removeByNotificationKey2Times_promise_3600 start=======================>");
        console.info("================OnCancelCallback_removeByNotificationKey2Times_promise_3600 data : =======================>" + JSON.stringify(data));
        console.info("================OnCancelCallback_removeByNotificationKey2Times_promise_3600 err : =======================>" + JSON.stringify(err));
        if (timesOnCancelCallback_removeByNotificationKey2Times_promise == 1){
            expect(data.request.id).assertequal(36);
            expect(data.request.label).assertequal("3600");
        } else if  (timesOnCancelCallback_removeByNotificationKey2Times_promise == 2){
            expect().assertFail();
        }
        console.info("================OnCancelCallback_removeByNotificationKey2Times_promise_3600 end=======================>");
    }
    /*
     * @tc.number: ANS_Remove_3600
     * @tc.name: remove(bundle: BundleOption, notificationKey: NotificationKey): Promise<void>;
     * @tc.desc: Verify that the interface remove(bundle: BundleOption, notificationKey: NotificationKey): Promise<void> is called twice in a row to delete the notification information
     */
    it('ANS_Remove_3600', 0, async function (done) {
        console.info("===============ANS_Remove_3600==========================>");
        timesOnCancelCallback_removeByNotificationKey2Times_promise = 0
        var subscriber ={
            onConsume:OnConsumeCallback_removeByNotificationKey2Times_promise,
            onCancel:OnCancelCallback_removeByNotificationKey2Times_promise,
        }
        await notify.subscribe(subscriber).then(() => {
            console.info("==================subscribe_3600_promise==================>");
        });
        var notificationRequest = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                },
            },
            id: 36,
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
            label: "3600",
            badgeIconStyle: 1,
            showDeliveryTime: true,
        }
        await notify.publish(notificationRequest).then(() => {
            console.info("==================publish_3600_promise==================>");
        });
        await notify.unsubscribe(subscriber).then(() => {
            console.info("==================unsubscribe_3600_promise==================>");
        });
        done();
    })
}) 