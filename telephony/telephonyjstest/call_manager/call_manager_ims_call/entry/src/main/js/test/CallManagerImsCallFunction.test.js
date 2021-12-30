/**
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import call from '@ohos.telephony.calltest';

import {describe, afterAll, it, expect, beforeAll, afterEach} from 'deccjsunit/index';
import {
    AUTO_ACCEPT_NUMBER,
    NOT_ACCEPT_NUMBER,
    CALL_STATUS_ACTIVE,
    EMERGENCY_NUMBER,
    NULL_PHONE_NUMBER,
    PHONE_NUMBER_LENGTH_11,
    PHONE_NUMBER_CHAR,
    SPECIA_CHAR_NUMBER,
    CALL_STATUS_DIALING,
    PHONE_NUMBER_LONG,
    CALL_ID_NOT_EXIST,
    BOUNDARY_NUMBER_INT,
    MINUS_VALUE,
    CALL_STATUS_DISCONNECTED,
    CALL_STATE_UNKNOWN,
    CALL_STATE_IDLE,
    SENT_STRING_0,
    SENT_STRING_1,
    SENT_STRING_2,
    DEFAULT_SLOT_ID,
    CALL_MODE_CS,
    DIAL_SCENCE_CALL_PRIVILEGED,
    DIAL_SCENCE_CALL_NORMAL,
    DIAL_VOICE_MAIL_TYPE,
    DIAL_CARRIER_TYPE,
    SLOT_ID1,
    DIAL_TYPE_ERROR,
    SLOT_ID_INVALID,
    SENT_STRING_3,
    SENT_STRING_4,
    SENT_STRING_5,
    SENT_STRING_6,
    SENT_STRING_7,
    SENT_STRING_8,
    SENT_STRING_9,
    SENT_STRING_A,
    SENT_STRING_C,
    SENT_STRING_D,
    SENT_STRING_E,
    SENT_STRING_STAR,
    SENT_STRING_JIN,
    SENT_STRING_MINUS,
    SENT_STRING_LOW_A,
    SENT_STRING_LOW_B,
    SENT_STRING_LOW_D,
    SENT_STRING_Z,
    SENT_STRING_ADD,
    SENT_STRING_LOW_C,
    SENT_STRING_ERROR_10,
    MEDIA_TYPE_VOICE,
    DIAL_SCENCE_CALL_CALL_EMERGENCY,
    DIAL_TYPE_ERROR3,
    DIAL_SCENCE_ERROR2,
    MEDIA_TYPE_ERROR2,
    DIAL_SCENCE_ERROR,
    MEDIA_TYPE_ERROR,
    PHONE_NUMBER_VOICE_MAIL
} from './lib/Const.js';
import {toString} from './lib/ApiToPromise.js';
import {scenceInCalling, hangupCall2, hangupCall, callDetailsChangeOn, reachState} from './lib/ScenceInCalling.js';
let callId = null;

describe('CallManageImsCall', function () {
    beforeAll(async function (done) {
        callDetailsChangeOn();
        try {
            await call.setCallPreferenceMode(DEFAULT_SLOT_ID, CALL_MODE_CS);
            console.log('Telephony_CallManager setCallPreferenceMode success');
        } catch (error) {
            console.log(`Telephony_CallManager setCallPreferenceMode error,error:${toString(error)}`);
        }
        done();
    });

    afterEach(async function () {
        try {
            let callState = await call.getCallState();
            console.log(`Telephony_CallManager callState ${callState}`);
            if (callState === CALL_STATE_UNKNOWN || callState === CALL_STATE_IDLE) {
                return;
            }
            if (callId) {
                let data = await hangupCall('Telephony_CallManager', callId);
                console.log(`Telephony_CallManager hangupCall success ${toString(data)}`);
            }
        } catch (error) {
            console.log('Telephony_CallManager hangupCall or getCallState error');
        }
    });

    afterAll(function () {
        console.log('Telephony_CallManager all 74 case is over for callmanager CallManageImsCall');
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0100
     * @tc.name    Dial a call by function dial by args phoneNumber AUTO_ACCEPT_NUMBER by callback,
     *             the callback function return true, and call step can reach CALL_STATUS_ACTIVE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0100';
        reachState(caseName, CALL_STATUS_ACTIVE, '', false).then(data => {
            callId = data.callId;
            expect(data.callState === CALL_STATUS_ACTIVE).assertTrue();
            console.log(`${caseName} reachState success,case ${data.callState === CALL_STATUS_ACTIVE ?
                'success' : 'failed'},data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
        call.dial(AUTO_ACCEPT_NUMBER, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                expect().assertFail();
                return;
            }
            expect(data).assertTrue();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0200
     * @tc.name    Dial a call by function dial by args phoneNumber EMERGENCY_NUMBER by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0200';
        let flag = false;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        call.dial(EMERGENCY_NUMBER, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                flag = true;

            }
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0300
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_VOICE_MAIL_TYPE} by callback,
     *             the callback function return true, and call step can reach CALL_STATUS_DIALING
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0300';
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            expect(data.callState === CALL_STATUS_DIALING).assertTrue();
            console.log(`${caseName} reachState success,case ${data.callState === CALL_STATUS_DIALING ?
                'success' : 'failed'},data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_VOICE_MAIL_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                expect().assertFail();
                return;
            }
            expect(data).assertTrue();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0400
     * @tc.name    Dial a call by function dial by args phoneNumber SPECIA_CHAR_NUMBER options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by callback,
     *             the callback function return true, and call step can reach CALL_STATUS_DIALING
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0400';
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            expect(data.callState === CALL_STATUS_DIALING).assertTrue();
            console.log(`${caseName} reachState success,case ${data.callState === CALL_STATUS_DIALING ?
                'success' : 'failed'},data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(SPECIA_CHAR_NUMBER, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                expect().assertFail();
                return;
            }
            expect(data).assertTrue();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0500
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId: SLOT_ID1, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_TYPE_ERROR} by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0500';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: SLOT_ID1, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_TYPE_ERROR};
        call.dial(PHONE_NUMBER_LENGTH_11, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                flag = true;
                return;
            }
            flag = false;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0600
     * @tc.name    Dial a call by function dial by args phoneNumber NULL_PHONE_NUMBER options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0600';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(NULL_PHONE_NUMBER, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                flag = true;
                return;
            }
            flag = false;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0700
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId: SLOT_ID_INVALID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0700', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0700';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: SLOT_ID_INVALID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                flag = true;
                return;
            }
            flag = false;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0800
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_ERROR, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0800';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_ERROR,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                flag = true;
                return;
            }
            flag = false;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_0900
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_ERROR,
     *             dialType:DIAL_CARRIER_TYPE} by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_0900', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_0900';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_ERROR, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                flag = true;
                return;
            }
            flag = false;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_1000
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_NORMAL,
     *             dialType:DIAL_TYPE_ERROR} by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_1000', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_1000';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_NORMAL, dialType:DIAL_TYPE_ERROR};
        call.dial(PHONE_NUMBER_LENGTH_11, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                flag = true;
                return;
            }
            flag = false;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_1300
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_NORMAL,
     *             dialType:DIAL_CARRIER_TYPE} by callback,
     *             the callback function return true,and call step can reach CALL_STATUS_DIALING
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_1300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_1300';
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            expect(data.callState === CALL_STATUS_DIALING).assertTrue();
            console.log(`${caseName} reachState success,case ${data.callState === CALL_STATUS_DIALING ?
                'success' : 'failed'},data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_NORMAL, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                expect().assertFail();
                return;
            }
            expect(data).assertTrue();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Async_1400
     * @tc.name    Dial a call by function dial by args phoneNumber EMERGENCY_NUMBER options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_NORMAL,
     *             dialType:DIAL_CARRIER_TYPE} by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Async_1400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Async_1400';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_NORMAL, dialType:DIAL_CARRIER_TYPE};
        call.dial(EMERGENCY_NUMBER, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,error:${toString(error)}`);
                flag = true;
                return;
            }
            flag = false;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0100
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LONG by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0100';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        call.dial(PHONE_NUMBER_LONG).then(data => {
            flag = false;
        }).catch(error => {
            console.log(`${caseName} dial error,error:${toString(error)}`);
            flag = true;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0200
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_VOICE_MAIL by promise,
     *             the function return true, and call step can reach CALL_STATUS_DIALING
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0200';
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            expect(data.callState === CALL_STATUS_DIALING).assertTrue();
            console.log(`${caseName} reachState success,case ${data.callState === CALL_STATUS_DIALING ?
                'success' : 'failed'},data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
        call.dial(PHONE_NUMBER_VOICE_MAIL, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,case failed,error:${toString(error)}`);
                expect().assertFail();
                return;
            }
            expect(data).assertTrue();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0300
     * @tc.name    Dial a call by function dial by args phoneNumber EMERGENCY_NUMBER options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by promise,
     *             the function return true, and call step can reach CALL_STATUS_DIALING
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0300';
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            expect(data.callState === CALL_STATUS_DIALING).assertTrue();
            console.log(`${caseName} reachState success,case ${data.callState === CALL_STATUS_DIALING ?
                'success' : 'failed'},data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(EMERGENCY_NUMBER, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,case failed,error:${toString(error)}`);
                expect().assertFail();
                return;
            }
            expect(data).assertTrue();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0400
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_CHAR options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by promise,the function return true,
     *             and call step can reach CALL_STATUS_DIALING
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0400';
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            expect(data.callState === CALL_STATUS_DIALING).assertTrue();
            console.log(`${caseName} reachState success,case ${data.callState === CALL_STATUS_DIALING ?
                'success' : 'failed'},data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_CHAR, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} dial error,case failed,error:${toString(error)}`);
                expect().assertFail();
                return;
            }
            expect(data).assertTrue();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0500
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LONG options
     *             {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0500';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: DEFAULT_SLOT_ID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LONG, obj).then(data => {
            flag = false;
        }).catch(error => {
            console.log(`${caseName} dial error,error:${toString(error)}`);
            flag = true;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0600
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId: SLOT_ID_INVALID, videoState: MEDIA_TYPE_VOICE, dialScene: DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0600';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId: SLOT_ID_INVALID, videoState: MEDIA_TYPE_VOICE,
            dialScene: DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj).then(data => {
            flag = false;
        }).catch(error => {
            console.log(`${caseName} dial error,error:${toString(error)}`);
            flag = true;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0700
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_ERROR2, dialScene:DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0700', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0700';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_ERROR2,
            dialScene:DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj).then(data => {
            flag = false;
        }).catch(error => {
            console.log(`${caseName} dial error,error:${toString(error)}`);
            flag = true;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0800
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_VOICE,
     *             dialScene:DIAL_SCENCE_ERROR2, dialType:DIAL_CARRIER_TYPE} by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0800';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_VOICE,
            dialScene:DIAL_SCENCE_ERROR2, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj).then(data => {
            flag = false;
        }).catch(error => {
            console.log(`${caseName} dial error,error:${toString(error)}`);
            flag = true;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_0900
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_VOICE, dialScene:DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_TYPE_ERROR3} by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_0900', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_0900';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_VOICE,
            dialScene:DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_TYPE_ERROR3};
        call.dial(PHONE_NUMBER_LENGTH_11, obj).then(data => {
            flag = false;
        }).catch(error => {
            console.log(`${caseName} dial error,error:${toString(error)}`);
            flag = true;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_1000
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId:SLOT_ID1, videoState:MEDIA_TYPE_VOICE, dialScene:DIAL_SCENCE_CALL_PRIVILEGED,
     *             dialType:DIAL_CARRIER_TYPE} by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_1000', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_1000';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId:SLOT_ID1, videoState:MEDIA_TYPE_VOICE,
            dialScene:DIAL_SCENCE_CALL_PRIVILEGED, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj).then(data => {
            flag = false;
        }).catch(error => {
            console.log(`${caseName} dial error,error:${toString(error)}`);
            flag = true;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_1300
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 options
     *             {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_VOICE, dialScene:DIAL_SCENCE_CALL_CALL_EMERGENCY,
     *             dialType:DIAL_CARRIER_TYPE} by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_1300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_1300';
        let flag = true;
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            console.log(`${caseName} reachState success,case failed,data:${toString(data)}`);
            expect().assertFail();
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case ${flag ? 'success' : 'failed'},error:${toString(error)}`);
            expect(flag).assertTrue();
            done();
        });
        let obj = {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_VOICE,
            dialScene:DIAL_SCENCE_CALL_CALL_EMERGENCY, dialType:DIAL_CARRIER_TYPE};
        call.dial(PHONE_NUMBER_LENGTH_11, obj).then(data => {
            flag = false;
        }).catch(error => {
            console.log(`${caseName} dial error,error:${toString(error)}`);
            flag = true;
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_dial_Promise_1400
     * @tc.name    Dial a call by function dial by args phoneNumber EMERGENCY_NUMBER options
     *             {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_VOICE, dialScene:DIAL_SCENCE_CALL_CALL_EMERGENCY,
     *             dialType:DIAL_CARRIER_TYPE} by promise,
     *             the function return true, and call step can reach CALL_STATUS_DIALING
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_dial_Promise_1400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_dial_Promise_1400';
        reachState(caseName, CALL_STATUS_DIALING, '', false).then(data => {
            callId = data.callId;
            expect(data.callState === CALL_STATUS_DIALING).assertTrue();
            console.log(`${caseName} reachState success,case ${data.callState === CALL_STATUS_DIALING ?
                'success' : 'failed'},data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        }).catch(error => {
            console.log(`${caseName} reachState error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
        let obj = {accountId:DEFAULT_SLOT_ID, videoState:MEDIA_TYPE_VOICE,
            dialScene:DIAL_SCENCE_CALL_CALL_EMERGENCY, dialType:DIAL_CARRIER_TYPE};
        call.dial(EMERGENCY_NUMBER, obj, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                return;
            }
            expect(data).assertTrue();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_answer_Async_0100
     * @tc.name    Run function answer by args callId BOUNDARY_NUMBER_INT by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_answer_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_answer_Async_0100';
        call.answer(BOUNDARY_NUMBER_INT, (error) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_answer_Async_0400
     * @tc.name    Dial a call and before answering the call,run function answer
     *             by args callId currentCallId by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_answer_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_answer_Async_0400';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.answer(callId, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                expect().assertFail();
                console.log(`${caseName} success,case failed`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_answer_Promise_0100
     * @tc.name    Run function answer by args callId CALL_ID_NOT_EXIST by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_answer_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_answer_Promise_0100';
        call.answer(CALL_ID_NOT_EXIST).then(() => {
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        }).catch(error => {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_answer_Promise_0400
     * @tc.name    Dial a call and after answering the call,run function answer by args callId currentCallId by promise,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_answer_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_IMS_answer_Promise_0400';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
            return;
        }
        try {
            await call.answer(callId);
            console.log(`${caseName} case failed.`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success,error:${toString(err)}`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_reject_Async_0100
     * @tc.name    Run function reject by args callId BOUNDARY_NUMBER_INT by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_reject_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_reject_Async_0100';
        call.reject(BOUNDARY_NUMBER_INT, (error) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_reject_Async_0400
     * @tc.name    Run function reject by args callId MINUS_VALUE by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_reject_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_reject_Async_0400';
        call.reject(MINUS_VALUE, (error) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_reject_Async_0500
     * @tc.name    Dial a call and before answering the call,run function reject
     *             by args callId currentCallId messageContent 'Hi, hello world.美丽的世界' by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_reject_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_reject_Async_0500';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:NOT_ACCEPT_NUMBER,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            let messageContent = 'Hi, hello world.美丽的世界';
            call.reject(callId, {messageContent}, (error) => {
                if (error) {
                    console.log(`${caseName} case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_reject_Promise_0100
     * @tc.name    Run function reject by args callId CALL_ID_NOT_EXIST by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_reject_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_reject_Promise_0100';
        call.reject(CALL_ID_NOT_EXIST).then(() => {
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        }).catch(error => {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_reject_Promise_0400
     * @tc.name    Run function reject by args callId BOUNDARY_NUMBER_INT
     *             messageContent 'ABCDEFGHIJKLMNOPQRSTUVWSYZ' by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_reject_Promise_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_reject_Promise_0400';
        let messageContent = 'ABCDEFGHIJKLMNOPQRSTUVWSYZ';
        call.reject(BOUNDARY_NUMBER_INT, {messageContent}).then(() => {
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        }).catch(error => {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_reject_Promise_0500
     * @tc.name    Dial a call and after answering the call,run function reject
     *             by args callId currentCallId messageContent 'ABCDEFGHIJKLMNOPQRSTUVWSYZ' by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_reject_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_IMS_reject_Promise_0500';
        let messageContent = 'ABCDEFGHIJKLMNOPQRSTUVWSYZ';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
            return;
        }
        try {
            await call.reject(callId, {messageContent});
            console.log(`${caseName} error,case failed`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_hangup_Async_0100
     * @tc.name    Run function hangup by args callId BOUNDARY_NUMBER_INT by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_hangup_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_hangup_Async_0100';
        call.hangup(BOUNDARY_NUMBER_INT, (error) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_hangup_Async_0400
     * @tc.name    Dial a call and before answering the call,run function hangup
     *             by args callId currentCallId by callback,the callback function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_hangup_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_hangup_Async_0400';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:NOT_ACCEPT_NUMBER,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            reachState(caseName, CALL_STATUS_DISCONNECTED, '', true).then(data => {
                done();
            }).catch(error => {
                done();
            });
            call.hangup(callId, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    return;
                }
                console.log(`${caseName} case success`);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_hangup_Async_0500
     * @tc.name    Dial a call and after answering the call,run function hangup
     *             by args callId currentCallId by callback,
     *             the callback function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_hangup_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_hangup_Async_0500';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        }).then(data => {
            callId = data.callId;
            reachState(caseName, CALL_STATUS_DISCONNECTED, '', true).then(data => {
                done();
            }).catch(error => {
                done();
            });
            call.hangup(callId, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    return;
                }
                console.log(`${caseName} case success`);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_hangup_Promise_0100
     * @tc.name    Run function hangup by args callId CALL_ID_NOT_EXIST by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_hangup_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_hangup_Promise_0100';
        call.hangup(CALL_ID_NOT_EXIST).then(() => {
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        }).catch(error => {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_hangup_Promise_0400
     * @tc.name    Dial a call and before answering the call,run function hangup
     *             by args callId currentCallId by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_hangup_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_IMS_hangup_Promise_0400';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:NOT_ACCEPT_NUMBER,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
            return;
        }
        reachState(caseName, CALL_STATUS_DISCONNECTED, '', true).then(data => {
            done();
        }).catch(error => {
            done();
        });
        try {
            await call.hangup(callId);
            console.log(`${caseName} hangup success, case success`);
        } catch (error) {
            console.log(`${caseName} hangup error ,case failed,error:${toString(error)}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_hangup_Promise_0500
     * @tc.name    Dial a call and after answering the call,run function hangup
     *             by args callId currentCallId by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_hangup_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_IMS_hangup_Promise_0500';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
            return;
        }
        reachState(caseName, CALL_STATUS_DISCONNECTED, '', true).then(data => {
            done();
        }).catch(error => {
            done();
        });
        try {
            await call.hangup(callId);
            console.log(`${caseName} hangup success, case success`);
        } catch (error) {
            console.log(`${caseName} hangup error ,case failed,error:${toString(error)}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0100
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 0 by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0100';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_0, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0200
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 1 by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0200';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_1, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0300
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 2 by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0300';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_2, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0400
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 3 by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0400';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_3, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0500
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 4 by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0500';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_4, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0600
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 5 by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0600';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_5, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0700
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character A by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0700', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0700';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_A, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0800
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character * by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0800';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_STAR, (error) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_0900
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character a by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_0900', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_0900';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_LOW_A, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case failed`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_1000
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character Z by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_1000', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_1000';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_Z, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case failed`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_1100
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character + by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_1100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_1100';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_ADD, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case failed`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_1200
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character c by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_1200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_1200';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_LOW_C, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case failed`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_1300
     * @tc.name    Run function startDTMF by args callId MINUS_VALUE  character C by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_1300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_1300';
        call.startDTMF(MINUS_VALUE, SENT_STRING_C, (error) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} success,case failed`);
            done();
        });
    });


    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Async_1600
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId MINUS_VALUE character C by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Async_1600', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Async_1600';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(MINUS_VALUE, SENT_STRING_C, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case failed`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0100
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 6 by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0100';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_6).then(data => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0200
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 7 by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0200';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_7).then(data => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0300
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 8 by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0300';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_8).then(data => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0400
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 9 by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0400';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_9).then(data => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0500
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character C by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0500';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_C).then(data => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0600
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character D by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0600';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_D).then(data => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0700
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character # by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0700', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0700';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_JIN).then(data => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0800
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character b by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0800';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_LOW_B).then(data => {
                console.log(`${caseName} success,case error,data:${toString(data)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_0900
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character d by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_0900', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_0900';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_LOW_D).then(data => {
                console.log(`${caseName} success,case error,data:${toString(data)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_1000
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character E by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_1000', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_1000';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_E).then(data => {
                console.log(`${caseName} success,case error,data:${toString(data)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_1100
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character -1 by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_1100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_1100';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(async (data) => {
            callId = data.callId;
            try {
                await call.startDTMF(callId, SENT_STRING_MINUS);
                await call.startDTMF(callId, SENT_STRING_1);
                console.log(`${caseName} success,case error,data:${toString(data)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            } catch (error) {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_1200
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 10 by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_1200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_1200';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(async (data) => {
            callId = data.callId;
            try {
                await call.startDTMF(callId, SENT_STRING_ERROR_10);
                console.log(`${caseName} success,case error,data:${toString(data)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            } catch (error) {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            }
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_1300
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId BOUNDARY_NUMBER_INT character C by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_1300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_1300';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(BOUNDARY_NUMBER_INT, SENT_STRING_C).then(data => {
                console.log(`${caseName} success,case error,data:${toString(data)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startDTMF_Promise_1600
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId CALL_ID_NOT_EXIST character 5 by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startDTMF_Promise_1600', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startDTMF_Promise_1600';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        }).then(data => {
            callId = data.callId;
            call.startDTMF(CALL_ID_NOT_EXIST, SENT_STRING_5).then(data => {
                console.log(`${caseName} success,case error,data:${toString(data)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            }).catch(error => {
                console.log(`${caseName} case success`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
      * @tc.number  Telephony_CallManager_IMS_stopDTMF_Async_0100
      * @tc.name    Run function stopDTMF by args callId CALL_ID_NOT_EXIST  by callback,the function return error
      * @tc.desc    Function test
      */
    it('Telephony_CallManager_IMS_stopDTMF_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_stopDTMF_Async_0100';
        call.stopDTMF(CALL_ID_NOT_EXIST, (error, data) => {
            if (error) {
                console.log(`${caseName} case success`);
                done();
                return;
            }
            console.log(`${caseName} success,case error,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_stopDTMF_Async_0200
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 3,run function stopDTMF by args
     *             callId currentCallId by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_stopDTMF_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_stopDTMF_Async_0200';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_3, (error, data) => {
                if (error) {
                    console.log(`${caseName} success,case error,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} startDTMF success,data:${toString(data)}`);
                call.stopDTMF(callId, (error, data) => {
                    if (error) {
                        console.log(`${caseName} success,case error,error:${toString(error)}`);
                        expect().assertFail();
                        hangupCall2(caseName, done, callId);
                        return;
                    }
                    console.log(`${caseName} case success`);
                    hangupCall2(caseName, done, callId);
                });
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_stopDTMF_Async_0300
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 3,run function stopDTMF by args
     *             callId CALL_ID_NOT_EXIST by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_stopDTMF_Async_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_stopDTMF_Async_0300';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.startDTMF(callId, SENT_STRING_3, (error, data) => {
                if (error) {
                    console.log(`${caseName} startDTMF error,case error,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} startDTMF success,data:${toString(data)}`);
                call.stopDTMF(CALL_ID_NOT_EXIST, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,case success,error:${toString(error)}`);
                        hangupCall2(caseName, done, callId);
                        return;
                    }
                    console.log(`${caseName} success,case error,data:${toString(data)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                });
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_stopDTMF_Promise_0100
     * @tc.name    Run function stopDTMF by args callId BOUNDARY_NUMBER_INT by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_stopDTMF_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_stopDTMF_Promise_0100';
        call.stopDTMF(BOUNDARY_NUMBER_INT).then(data => {
            console.log(`${caseName} success,case error,data:${toString(data)}`);
            expect().assertFail();
            done();
        }).catch(error => {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_stopDTMF_Promise_0200
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId currentCallId character 3,run function stopDTMF by args
     *             callId currentCallId by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_stopDTMF_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_IMS_stopDTMF_Promise_0200';

        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
            data = await call.startDTMF(callId, SENT_STRING_3);
            console.log(`${caseName} startDTMF success,data:${toString(data)}`);
            data = await call.stopDTMF(callId);
            console.log(`${caseName} success,case success,data:${toString(data)}`);
        } catch (error) {
            console.log(`${caseName} scenceInCalling,startDTMF or stopDTMF error,case failed,error:${toString(error)}`);
            expect().assertFail();
        }
        if (callId) {
            hangupCall2(caseName, done, callId);
        }
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_stopDTMF_Promise_0300
     * @tc.name    Dial a call by function dial by args phoneNumber PHONE_NUMBER_LENGTH_11 when before being accepted,
     *             run function startDTMF by args callId CALL_ID_NOT_EXIST character 3,run function stopDTMF by args
     *             callId CALL_ID_NOT_EXIST_10 by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_stopDTMF_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_IMS_stopDTMF_Promise_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
            data = await call.startDTMF(callId, SENT_STRING_3);
            console.log(`${caseName} startDTMF success,data:${toString(data)}`);
        } catch (error) {
            console.log(`${caseName} scenceInCalling or startDTMF error,case failed,error:${toString(error)}`);
            expect().assertFail();
            if (callId) {
                hangupCall2(caseName, done, callId);
            }
            return;
        }
        try {
            let data = await call.stopDTMF(CALL_ID_NOT_EXIST);
            console.log(`${caseName} success,case failed,data:${toString(data)}`);
            hangupCall2(caseName, done, callId);
        } catch (error) {
            console.log(`${caseName} success,case success,error:${toString(error)}`);
            hangupCall2(caseName, done, callId);
        }
    });
});