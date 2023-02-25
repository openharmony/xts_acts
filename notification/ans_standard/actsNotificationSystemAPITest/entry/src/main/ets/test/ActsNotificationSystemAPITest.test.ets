/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import notificationManager from '@ohos.notificationManager'
import notificationSubscribe from '@ohos.notificationSubscribe';

export default function ActsNotificationSystemAPITest() {
describe('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_SYSTEM_API_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SYSTEM_API_TEST START')

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0100
     * @tc.name: publish
     * @tc.desc: test function publish takes userId
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0100', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0100 START`);

        let notificationRequest : notificationManager.NotificationRequest = {
            id: 1,
            content: {
                contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_Publish"
                }
            }
        }

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0100 PUBLISH`);
        try{
            notificationManager.publish(notificationRequest, 0, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(err.code).assertEqual(202);
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    expect(false).assertTrue()
                    done()
                }
            });
        } catch (err) {
            console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
        }

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0100 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0200
     * @tc.name: publishAsBundle 
     * @tc.desc: test function publishAsBundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0200', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0200 START`);

        let notificationRequest : notificationManager.NotificationRequest = {
            id: 1,
            content: {
                contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title",
                    text: "test_text",
                    additionalText: "test_Publish"
                }
            }
        }

        notificationManager.publishAsBundle(notificationRequest, "example.bundleName", 0, (err) => {
            if (err) {
                console.info(`${TAG} publishAsBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} publishAsBundle AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0200 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0300
     * @tc.name: cancelAsBundle
     * @tc.desc: test function cancelAsBundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0300', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0300 START`);

        notificationManager.cancelAsBundle(1, "example.bundleName", 0, (err) => {
            if (err) {
                console.info(`${TAG} cancelAsBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} cancelAsBundle AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0300 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0400
     * @tc.name: addSlot
     * @tc.desc: test function addSlot
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0400', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0400 START`);

        let slot : notificationManager.NotificationSlot = {
            type: notificationManager.SlotType.SOCIAL_COMMUNICATION,
            level: notificationManager.SlotLevel.LEVEL_HIGH,
            desc: 'xts test'
        }
        notificationManager.addSlot(slot, (err) => {
            if (err) {
                console.info(`${TAG} addSlot AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} addSlot AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0400 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0500
     * @tc.name: setNotificationEnable
     * @tc.desc: test function setNotificationEnable
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0500', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0500 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        notificationManager.setNotificationEnable(bundleOpt, true, (err) => {
            if (err) {
                console.info(`${TAG} setNotificationEnable AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} setNotificationEnable AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0500 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0600
     * @tc.name: isNotificationEnabled
     * @tc.desc: test function isNotificationEnabled
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0600', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0600 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        notificationManager.isNotificationEnabled(bundleOpt, (err, data) => {
            if (err) {
                console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0600 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0700
     * @tc.name: isNotificationEnabled
     * @tc.desc: test function isNotificationEnabled no parameter
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0700', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0700 START`);

        notificationManager.isNotificationEnabled((err, data) => {
            if (err) {
                console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0700 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0800
     * @tc.name: isNotificationEnabled
     * @tc.desc: test function isNotificationEnabled take userId
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0800', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0800 START`);

        notificationManager.isNotificationEnabled(0, (err, data) => {
            if (err) {
                console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0800 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0900
     * @tc.name: displayBadge
     * @tc.desc: test function displayBadge
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0900', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0900 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        notificationManager.displayBadge(bundleOpt, true, (err) => {
            if (err) {
                console.info(`${TAG} displayBadge AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} displayBadge AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_0900 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1000
     * @tc.name: isBadgeDisplayed
     * @tc.desc: test function isBadgeDisplayed
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1000', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1000 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        notificationManager.isBadgeDisplayed(bundleOpt, (err, data) => {
            if (err) {
                console.info(`${TAG} isBadgeDisplayed AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} isBadgeDisplayed AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1000 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1100
     * @tc.name: setSlotByBundle
     * @tc.desc: test function setSlotByBundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1100', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1100 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        let slot : notificationManager.NotificationSlot = {
            type: notificationManager.SlotType.SOCIAL_COMMUNICATION,
            level: notificationManager.SlotLevel.LEVEL_HIGH,
            desc: 'xts test'
        }

        notificationManager.setSlotByBundle(bundleOpt, slot, (err) => {
            if (err) {
                console.info(`${TAG} setSlotByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} setSlotByBundle AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1100 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1200
     * @tc.name: getSlotsByBundle
     * @tc.desc: test function getSlotsByBundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1200', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1200 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }

        notificationManager.getSlotsByBundle(bundleOpt, (err, data) => {
            if (err) {
                console.info(`${TAG} getSlotsByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} getSlotsByBundle AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1200 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1300
     * @tc.name: getSlotNumByBundle
     * @tc.desc: test function getSlotNumByBundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1300', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1300 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }

        notificationManager.getSlotNumByBundle(bundleOpt, (err, data) => {
            if (err) {
                console.info(`${TAG} getSlotNumByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} getSlotNumByBundle AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1300 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1400
     * @tc.name: getAllActiveNotifications
     * @tc.desc: test function getAllActiveNotifications
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1400', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1400 START`);

        notificationManager.getAllActiveNotifications((err, data) => {
            if (err) {
                console.info(`${TAG} getAllActiveNotifications AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} getAllActiveNotifications AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1400 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1500
     * @tc.name: removeGroupByBundle
     * @tc.desc: test function removeGroupByBundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1500', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1500 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        notificationManager.removeGroupByBundle(bundleOpt, "groupName", (err) => {
            if (err) {
                console.info(`${TAG} removeGroupByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} removeGroupByBundle AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1500 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1600
     * @tc.name: setDoNotDisturbDate
     * @tc.desc: test function setDoNotDisturbDate
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1600', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1600 START`);

        let date : notificationManager.DoNotDisturbDate = {
            type: notificationManager.DoNotDisturbType.TYPE_ONCE,
            begin: new Date(2023, 2, 24, 15, 53),
            end: new Date(2024, 2, 24, 15, 53)
        }
        notificationManager.setDoNotDisturbDate(date, (err) => {
            if (err) {
                console.info(`${TAG} setDoNotDisturbDate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} setDoNotDisturbDate AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1600 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1700
     * @tc.name: setDoNotDisturbDate
     * @tc.desc: test function setDoNotDisturbDate take userId
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1700', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1700 START`);

        let date : notificationManager.DoNotDisturbDate = {
            type: notificationManager.DoNotDisturbType.TYPE_ONCE,
            begin: new Date(2023, 2, 24, 15, 53),
            end: new Date(2024, 2, 24, 15, 53)
        }
        notificationManager.setDoNotDisturbDate(date, 0, (err) => {
            if (err) {
                console.info(`${TAG} setDoNotDisturbDate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} setDoNotDisturbDate AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1700 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1800
     * @tc.name: getDoNotDisturbDate
     * @tc.desc: test function getDoNotDisturbDate
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1800', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1800 START`);

        notificationManager.getDoNotDisturbDate((err, data) => {
            if (err) {
                console.info(`${TAG} getDoNotDisturbDate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} getDoNotDisturbDate AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1800 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1900
     * @tc.name: getDoNotDisturbDate
     * @tc.desc: test function getDoNotDisturbDate take userId
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1900', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1900 START`);

        notificationManager.getDoNotDisturbDate(0, (err, data) => {
            if (err) {
                console.info(`${TAG} getDoNotDisturbDate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} getDoNotDisturbDate AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_1900 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2000
     * @tc.name: isSupportDoNotDisturbMode
     * @tc.desc: test function isSupportDoNotDisturbMode
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2000', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2000 START`);

        notificationManager.isSupportDoNotDisturbMode((err, data) => {
            if (err) {
                console.info(`${TAG} isSupportDoNotDisturbMode AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} isSupportDoNotDisturbMode AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2000 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2100
     * @tc.name: setDistributedEnable
     * @tc.desc: test function setDistributedEnable
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2100', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2100 START`);

        notificationManager.setDistributedEnable(true, (err) => {
            if (err) {
                console.info(`${TAG} setDistributedEnable AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} setDistributedEnable AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2100 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2200
     * @tc.name: setDistributedEnableByBundle
     * @tc.desc: test function setDistributedEnableByBundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2200', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2200 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        notificationManager.setDistributedEnableByBundle(bundleOpt, true, (err) => {
            if (err) {
                console.info(`${TAG} setDistributedEnableByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} setDistributedEnableByBundle AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2200 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2300
     * @tc.name: isDistributedEnabledByBundle
     * @tc.desc: test function isDistributedEnabledByBundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2300', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2300 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        notificationManager.isDistributedEnabledByBundle(bundleOpt, (err, data) => {
            if (err) {
                console.info(`${TAG} isDistributedEnabledByBundle AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} isDistributedEnabledByBundle AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2300 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2400
     * @tc.name: getDeviceRemindType
     * @tc.desc: test function getDeviceRemindType
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2400', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2400 START`);

        notificationManager.getDeviceRemindType((err, data) => {
            if (err) {
                console.info(`${TAG} getDeviceRemindType AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} getDeviceRemindType AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2400 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2500
     * @tc.name: setNotificationEnableSlot
     * @tc.desc: test function setNotificationEnableSlot
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2500', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2500 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        let type = notificationManager.SlotType.SOCIAL_COMMUNICATION;
        notificationManager.setNotificationEnableSlot(bundleOpt, type, true, (err) => {
            if (err) {
                console.info(`${TAG} setNotificationEnableSlot AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} setNotificationEnableSlot AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2500 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2600
     * @tc.name: isNotificationSlotEnabled
     * @tc.desc: test function isNotificationSlotEnabled
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2600', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2600 START`);

        let bundleOpt : notificationManager.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        let type = notificationManager.SlotType.SOCIAL_COMMUNICATION;
        notificationManager.isNotificationSlotEnabled(bundleOpt, type, (err, data) => {
            if (err) {
                console.info(`${TAG} isNotificationSlotEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} isNotificationSlotEnabled AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2600 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2700
     * @tc.name: setSyncNotificationEnabledWithoutApp
     * @tc.desc: test function setSyncNotificationEnabledWithoutApp
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2700', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2700 START`);

        notificationManager.setSyncNotificationEnabledWithoutApp(0, true, (err) => {
            if (err) {
                console.info(`${TAG} setSyncNotificationEnabledWithoutApp AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} setSyncNotificationEnabledWithoutApp AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2700 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2800
     * @tc.name: getSyncNotificationEnabledWithoutApp
     * @tc.desc: test function getSyncNotificationEnabledWithoutApp
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2800', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2800 START`);

        notificationManager.getSyncNotificationEnabledWithoutApp(0, (err, data) => {
            if (err) {
                console.info(`${TAG} getSyncNotificationEnabledWithoutApp AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} getSyncNotificationEnabledWithoutApp AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2800 END`);
    });

    let subscriber = {
        onConsume: function (data) {
            let req = data.request;
            console.info(`${TAG} onConsume request id: ${req.id}`)
        }
    };

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2900
     * @tc.name: subscribe
     * @tc.desc: test function subscribe
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2900', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2900 START`);

        notificationSubscribe.subscribe(subscriber, (err) => {
            if (err) {
                console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} subscribe AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_2900 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3000
     * @tc.name: subscribe
     * @tc.desc: test function subscribe take NotificationSubscribeInfo
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3000', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3000 START`);

        let subscribeInfo : notificationSubscribe.NotificationSubscribeInfo = {
            bundleNames: ["example.bundleName"],
            userId: 0
        }
        notificationSubscribe.subscribe(subscriber, subscribeInfo, (err) => {
            if (err) {
                console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} subscribe AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3000 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3100
     * @tc.name: subscribe
     * @tc.desc: test function subscribe take NotificationSubscribeInfo
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3100', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3100 START`);

        let subscribeInfo : notificationSubscribe.NotificationSubscribeInfo = {
            bundleNames: ["example.bundleName"],
            userId: 0
        }

        await notificationSubscribe.subscribe(subscriber, subscribeInfo).then(() => {
            console.info(`${TAG} subscribe AsyncCallback success`)
            expect(false).assertTrue()
            done()
        }).catch((err) => {
            console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3100 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3200
     * @tc.name: unsubscribe
     * @tc.desc: test function unsubscribe
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3200', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3200 START`);

        notificationSubscribe.unsubscribe(subscriber, (err) => {
            if (err) {
                console.info(`${TAG} unsubscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} unsubscribe AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3200 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3300
     * @tc.name: remove
     * @tc.desc: test function remove
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3300', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3300 START`);

        let bundleOpt : notificationSubscribe.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        let key : notificationSubscribe.NotificationKey = {
            id: 0,
            label: 'test'
        }
        notificationSubscribe.remove(bundleOpt, key, notificationSubscribe.RemoveReason.CLICK_REASON_REMOVE, (err) => {
            if (err) {
                console.info(`${TAG} remove AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} remove AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3300 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3400
     * @tc.name: remove
     * @tc.desc: test function remove
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3400', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3400 START`);

        notificationSubscribe.remove("device_0_1", notificationSubscribe.RemoveReason.CLICK_REASON_REMOVE, (err) => {
            if (err) {
                console.info(`${TAG} remove AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} remove AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3400 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3500
     * @tc.name: removeAll
     * @tc.desc: test function removeAll take bundle
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3500', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3500 START`);

        let bundleOpt : notificationSubscribe.BundleOption = {
            bundle: "example.bundleName",
            uid: 0
        }
        notificationSubscribe.removeAll(bundleOpt, (err) => {
            if (err) {
                console.info(`${TAG} removeAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} removeAll AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3500 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3600
     * @tc.name: removeAll
     * @tc.desc: test function removeAll
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3600', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3600 START`);

        notificationSubscribe.removeAll((err) => {
            if (err) {
                console.info(`${TAG} removeAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} removeAll AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3600 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3700
     * @tc.name: removeAll
     * @tc.desc: test function removeAll take userId
     */
    it('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3700', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3700 START`);

        notificationSubscribe.removeAll(0, (err) => {
            if (err) {
                console.info(`${TAG} removeAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} removeAll AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SYSTEM_API_TEST_3700 END`);
    });

}) } 