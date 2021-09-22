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
import notification from '@ohos.notification'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsAnsGetSlotTestCallback', function () {

    function addSlotActsAnsGetSlotTestCallback_0100(err){
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0100 enter====>");
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0100 err: ====>" + JSON.stringify(err));
        expect(err.code).assertEqual(0);
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0100 finish====>");
    }
    function addSlotActsAnsGetSlotTestCallback_0200(err, data){
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0200 enter====>");
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0200 err: ====>" + JSON.stringify(err));
        expect(err.code).assertEqual(0);
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0200 finish====>");
    }
    function addSlotActsAnsGetSlotTestCallback_0300(err){
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0300 enter====>");
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0300 err: ====>" + JSON.stringify(err));
        expect(err.code).assertEqual(0);
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0300 finish====>");
    }
    function addSlotActsAnsGetSlotTestCallback_0400(err){
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0400 enter====>");
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0400 err: ====>" + JSON.stringify(err));
        expect(err.code).assertEqual(0);
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0400 finish====>");
    }
    function addSlotActsAnsGetSlotTestCallback_0500(err){
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0500 enter====>");
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0500 err: ====>" + JSON.stringify(err));
        console.debug("====>addSlotActsAnsGetSlotTestCallback_0500 finish====>");
    }

    /*
     * @tc.number    : ActsAnsGetSlotTestCallback_0100
     * @tc.name      : Verify getSlot SOCIAL_COMMUNICATION
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot after adding
     */
    it('ActsAnsGetSlotTestCallback_0100', 0, async function (done) {
        console.debug("====>ActsAnsGetSlotTestCallback_0100 start====>");
        console.debug("====>addSlot SlotType.SOCIAL_COMMUNICATION: ====>");
        await notification.addSlot(notification.SlotType.SOCIAL_COMMUNICATION, addSlotActsAnsGetSlotTestCallback_0100);
        console.debug("====>getSlot SlotType.SOCIAL_COMMUNICATION: ====>");
        await notification.getSlot(notification.SlotType.SOCIAL_COMMUNICATION, (err, data)=> {
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0100 enter====>");
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0100 err====>" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0100 data====>" + JSON.stringify(data));
            expect(data.type).assertEqual(notification.SlotType.SOCIAL_COMMUNICATION);
            expect(data.level).assertEqual(3);
            expect(data.desc).assertEqual("");
            expect(data.badgeFlag).assertEqual(true);
            expect(data.bypassDnd).assertEqual(false);
            expect(data.lockscreenVisibility).assertEqual(2);
            expect(data.vibrationEnabled).assertEqual(true);
            expect(data.sound).assertEqual("");
            expect(data.lightEnabled).assertEqual(false);
            expect(data.lightColor).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0100 finish====>");
            done();
        });
    })

    /*
     * @tc.number    : ActsAnsGetSlotTestCallback_0200
     * @tc.name      : Verify getSlot SERVICE_INFORMATION
     * @tc.desc      : Get the SERVICE_INFORMATION type slot after adding
     */
    it('ActsAnsGetSlotTestCallback_0200', 0, async function (done) {
        console.debug("====>ActsAnsGetSlotTestCallback_0200 start====>");
        function getSlotActsAnsGetSlotTestCallback_0200(err, data) {
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0200 enter====>");
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0200 err====>" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0200 data====>" + JSON.stringify(data));
            expect(data.type).assertEqual(notification.SlotType.SERVICE_INFORMATION);
            expect(data.level).assertEqual(3);
            expect(data.desc).assertEqual("");
            expect(data.badgeFlag).assertEqual(true);
            expect(data.bypassDnd).assertEqual(false);
            expect(data.lockscreenVisibility).assertEqual(2);
            expect(data.vibrationEnabled).assertEqual(true);
            expect(data.sound).assertEqual("");
            expect(data.lightEnabled).assertEqual(false);
            expect(data.lightColor).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0200 finish====>");
            done();
        }
        console.debug("====>addSlot SlotType.SERVICE_INFORMATION: ====>");
        await notification.addSlot(notification.SlotType.SERVICE_INFORMATION, addSlotActsAnsGetSlotTestCallback_0200);
        console.debug("====>getSlot SlotType.SERVICE_INFORMATION: ====>");
        await notification.getSlot(notification.SlotType.SERVICE_INFORMATION, getSlotActsAnsGetSlotTestCallback_0200);
    })

    /*
     * @tc.number    : ActsAnsGetSlotTestCallback_0300
     * @tc.name      : Verify getSlot CONTENT_INFORMATION
     * @tc.desc      : Get the CONTENT_INFORMATION type slot after adding
     */
    it('ActsAnsGetSlotTestCallback_0300', 0, async function (done) {
        console.debug("====>ActsAnsGetSlotTestCallback_0300 start====>");
        function getSlotActsAnsGetSlotTestCallback_0300(err, data) {
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0300 enter====>");
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0300 err====>" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0300 data====>" + JSON.stringify(data));
            expect(data.type).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            expect(data.level).assertEqual(3);
            expect(data.desc).assertEqual("");
            expect(data.badgeFlag).assertEqual(true);
            expect(data.bypassDnd).assertEqual(false);
            expect(data.lockscreenVisibility).assertEqual(3);
            expect(data.vibrationEnabled).assertEqual(false);
            expect(data.sound).assertEqual("");
            expect(data.lightEnabled).assertEqual(false);
            expect(data.lightColor).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0300 finish====>");
            done();
        }
        console.debug("====>addSlot SlotType.CONTENT_INFORMATION: ====>");
        await notification.addSlot(notification.SlotType.CONTENT_INFORMATION, addSlotActsAnsGetSlotTestCallback_0300);
        console.debug("====>getSlot SlotType.CONTENT_INFORMATION: ====>");
        await notification.getSlot(notification.SlotType.CONTENT_INFORMATION, getSlotActsAnsGetSlotTestCallback_0300);
    })

    /*
     * @tc.number    : ActsAnsGetSlotTestCallback_0400
     * @tc.name      : Verify getSlot OTHER_TYPES
     * @tc.desc      : Get the OTHER_TYPES type slot after adding
     */
    it('ActsAnsGetSlotTestCallback_0400', 0, async function (done) {
        console.debug("====>ActsAnsGetSlotTestCallback_0400 start====>");
        function getSlotActsAnsGetSlotTestCallback_0400(err, data) {
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0400 enter====>");
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0400 err====>" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0400 data====>" + JSON.stringify(data));
            expect(data.type).assertEqual(notification.SlotType.OTHER_TYPES);
            expect(data.level).assertEqual(3);
            expect(data.desc).assertEqual("");
            expect(data.badgeFlag).assertEqual(true);
            expect(data.bypassDnd).assertEqual(false);
            expect(data.lockscreenVisibility).assertEqual(3);
            expect(data.vibrationEnabled).assertEqual(false);
            expect(data.sound).assertEqual("");
            expect(data.lightEnabled).assertEqual(false);
            expect(data.lightColor).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0400 finish====>");
            done();
        }
        console.debug("====>addSlot SlotType.OTHER_TYPES: ====>");
        await notification.addSlot(notification.SlotType.OTHER_TYPES, addSlotActsAnsGetSlotTestCallback_0400);
        console.debug("====>getSlot SlotType.OTHER_TYPES: ====>");
        await notification.getSlot(notification.SlotType.OTHER_TYPES, getSlotActsAnsGetSlotTestCallback_0400);
    })

    /*
     * @tc.number    : ActsAnsGetSlotTestCallback_0500
     * @tc.name      : Verify getSlot UNKNOWN_TYPE
     * @tc.desc      : Get the UNKNOWN_TYPE type slot after adding
     */
    it('ActsAnsGetSlotTestCallback_0500', 0, async function (done) {
        console.debug("====>ActsAnsGetSlotTestCallback_0500 start====>");
        function getSlotActsAnsGetSlotTestCallback_0500(err, data) {
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0500 enter====>");
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0500 err====>" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0500 data====>" + JSON.stringify(data));
            expect(data.type).assertEqual(notification.SlotType.OTHER_TYPES);
            expect(data.level).assertEqual(3);
            expect(data.desc).assertEqual("");
            expect(data.badgeFlag).assertEqual(true);
            expect(data.bypassDnd).assertEqual(false);
            expect(data.lockscreenVisibility).assertEqual(3);
            expect(data.vibrationEnabled).assertEqual(false);
            expect(data.sound).assertEqual("");
            expect(data.lightEnabled).assertEqual(false);
            expect(data.lightColor).assertEqual(0);
            console.debug("====>getSlotActsAnsGetSlotTestCallback_0500 finish====>");
            done();
        }
        console.debug("====>addSlot SlotType.UNKNOWN_TYPE: ====>");
        await notification.addSlot(notification.SlotType.UNKNOWN_TYPE, addSlotActsAnsGetSlotTestCallback_0500);
        console.debug("====>getSlot SlotType.UNKNOWN_TYPE: ====>");
        await notification.getSlot(notification.SlotType.UNKNOWN_TYPE, getSlotActsAnsGetSlotTestCallback_0500);
    })
}) 