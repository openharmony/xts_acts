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
import {describe, afterAll, beforeAll, it, expect} from 'deccjsunit/index';
import {
    scenceInHolding,
    hangupCall2,
    scenceInCalling,
    scenceInHangup,
    isHanupEd,
    callDetailsChangeOn,
    callDetailsChangeOff,
    scenceInCallingNull,
    callId as gloabalCallId,
    hangupCall
} from './lib/ScenceInCalling.js';
import {toString} from './lib/ApiToPromise.js';
import {

    AUTO_ACCEPT_NUMBER,
    CALL_STATUS_ACTIVE,
    CALL_STATUS_DIALING,
    CALL_STATUS_DISCONNECTED,
    CALL_STATUS_ALERTING,
    CALL_STATUS_HOLDIN,
    TIMEOUT_LENTH,
    DEFAULT_SLOT_ID,
    TEL_CONFERENCE_IDLE,
    VIDEO_STATE_AUDIO,
    EVENT_START_DTMF_SUCCESS,
    EVENT_STOP_DTMF_SUCCESS,
    NOT_ACCEPT_NUMBER,
    PHONE_NUMBER_LENGTH_11,
    CALL_STATE_IDLE
} from './lib/Const.js';

describe('CallManagementRegister', function () {
    beforeAll(function () {
        callDetailsChangeOn();
    });

    afterEach(async function () {
        try {
            let callState = await call.getCallState();
            console.log(`Telephony_CallManager callState ${callState}`);
            if (callState === CALL_STATE_IDLE) {
                return;
            }
            if (gloabalCallId) {
                let data = await hangupCall('Telephony_CallManager', gloabalCallId);
                console.log(`Telephony_CallManager hangupCall success ${toString(data)}`);
            }
        } catch (error) {
            console.log('Telephony_CallManager hangupCall or getCallState error');
        }
    });

    afterAll(function () {
        callDetailsChangeOff();
        console.log('Telephony_CallManager all 10 case is over for callmanager CallManagementRegister');
    });

    /**
     * @tc.number  Telephony_CallManager_isNewCallAllowed_Async_0100
     * @tc.name    Dial a call,run the function isNewCallAllowed by callback,the function return true
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isNewCallAllowed_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_isNewCallAllowed_Async_0100';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.isNewCallAllowed((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case ${data === true ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === true).assertTrue();
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_isNewCallAllowed_Async_0200
     * @tc.name    Unwanted state ,run the function isNewCallAllowed by callback ,the function return true
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isNewCallAllowed_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_isNewCallAllowed_Async_0200';
        call.isNewCallAllowed(function (error, data) {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} success,case ${data === true ? 'success' : 'failed'},data:${toString(data)}`);
            expect(data === true).assertTrue();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_isNewCallAllowed_Async_0300
     * @tc.name    Dial a call and before answering the call,
     *             run the function isNewCallAllowed by callback,
     *             the function return false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isNewCallAllowed_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_isNewCallAllowed_Async_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            let callId = data.callId;
            call.isNewCallAllowed((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case ${data === false ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === false).assertTrue();
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_isNewCallAllowed_Promise_0100
     * @tc.name    Dial a call,run the function isNewCallAllowed by promise,the function return true
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isNewCallAllowed_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_isNewCallAllowed_Promise_0100';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE// state maybe other number,need a state (Will definitely arrive)
            });
            let callId = data.callId;
            call.isNewCallAllowed()
                .then(data => {
                    console.log(`${caseName} success,case ${data === true ?
                        'success' : 'failed'},data:${toString(data)}`);
                    expect(data === true).assertTrue();
                    hangupCall2(caseName, done, callId);
                })
                .catch(error => {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_isNewCallAllowed_Promise_0200
     * @tc.name    Unwanted state ,run the function isNewCallAllowed by promise ,the function return true
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isNewCallAllowed_Promise_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_isNewCallAllowed_Promise_0200';
        call.isNewCallAllowed()
            .then(data => {
                console.log(`${caseName} success,case ${data === true ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === true).assertTrue();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_isNewCallAllowed_Promise_0300
     * @tc.name    Dial a call and before answering the call,
     *             run the function isNewCallAllowed by promise,
     *             the function return false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isNewCallAllowed_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_isNewCallAllowed_Promise_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            let callId = data.callId;
            call.isNewCallAllowed()
                .then(data => {
                    console.log(`${caseName} success,case ${data === false ?
                        'success' : 'failed'},data:${toString(data)}`);
                    expect(data === false).assertTrue();
                    hangupCall2(caseName, done, callId);
                })
                .catch(error => {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_isRinging_Async_0100
     * @tc.name    Unwanted state ,run the function isRinging by callback ,the function return false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isRinging_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_isRinging_Async_0100';
        call.isRinging(function (error, data) {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} success,case ${data === false ? 'success' : 'failed'},data:${toString(data)}`);
            expect(data === false).assertTrue();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_isRinging_Async_0200
     * @tc.name    Unwanted state ,Dial a call with number null and after finished the call,
     *             run the function isRinging by callback,the function return false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isRinging_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_isRinging_Async_0200';
        try {
            await scenceInCallingNull({
                caseName:caseName
            });
            call.isRinging((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName} success,case ${data === false ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === false).assertTrue();
                done();
            });
        } catch (error) {
            console.log(`${caseName} scenceInCallingNull error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_isRinging_Async_0300
     * @tc.name    Unwanted state ,Dial a call with number before acceptting ,
     *             run the function isRinging by callback,the function return false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isRinging_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_isRinging_Async_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            let callId = data.callId;
            call.isRinging((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case ${data === false ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === false).assertTrue();
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_isRinging_Promise_0100
     * @tc.name    Unwanted state ,run the function isRinging by promise ,the function return false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isRinging_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_isRinging_Promise_0100';
        call.isRinging()
            .then(data => {
                console.log(`${caseName} success,case ${data === false ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === false).assertTrue();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_isRinging_Promise_0200
     * @tc.name    Unwanted state ,Dial a call with number null and after finished the call,
     *             run the function isRinging by promise,the function return false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isRinging_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_isRinging_Promise_0200';
        try {
            await scenceInCallingNull({
                caseName:caseName
            });
            call.isRinging()
                .then(data => {
                    console.log(`${caseName} success,case ${data === false ?
                        'success' : 'failed'},data:${toString(data)}`);
                    expect(data === false).assertTrue();
                    done();
                })
                .catch(error => {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    done();
                });
        } catch (error) {
            console.log(`${caseName} scenceInCallingNull error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_isRinging_Promise_0300
     * @tc.name    Unwanted state ,Dial a call with number before acceptting ,
     *             run the function isRinging by promise,the function return false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isRinging_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_isRinging_Promise_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            let callId = data.callId;
            call.isRinging()
                .then(data => {
                    console.log(`${caseName} success,case ${data === false ?
                        'success' : 'failed'},data:${toString(data)}`);
                    expect(data === false).assertTrue();
                    hangupCall2(caseName, done, callId);
                })
                .catch(error => {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_on_0100
     * @tc.name    Dial a call by number AUTO_ACCEPT_NUMBER and after being accepted,
     *             the callDetailsChange event get the callStateInfo is
     *             {accountNumber：AUTO_ACCEPT_NUMBER,accountId：0,videoState：0,callType：0,
     *             callId：（current callId）,callState：CALL_STATUS_ACTIVE,conferenceState：TEL_CONFERENCE_IDLE}
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_on_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_on_0100';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        })
            .then((data) => {
                let callId = data.callId;
                let flag = data.accountNumber === AUTO_ACCEPT_NUMBER && data.accountId === DEFAULT_SLOT_ID &&
          data.videoState === VIDEO_STATE_AUDIO && data.callState === CALL_STATUS_ACTIVE &&
          data.conferenceState === TEL_CONFERENCE_IDLE;
                console.log(`${caseName} success,case ${flag ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data.accountNumber === AUTO_ACCEPT_NUMBER).assertTrue();
                expect(data.accountId === DEFAULT_SLOT_ID).assertTrue();
                expect(data.videoState === VIDEO_STATE_AUDIO).assertTrue();
                expect(data.callState === CALL_STATUS_ACTIVE).assertTrue();
                expect(data.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
                hangupCall2(caseName, done, callId);
            })
            .catch((error) => {
                console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_on_0200
     * @tc.name    Dial a call by number PHONE_NUMBER_LENGTH_11 and before  operator feedback,
     *             the callDetailsChange event get the callStateInfo is
     *             {accountNumber：PHONE_NUMBER_LENGTH_11,accountId：1,videoState：0,callType：0,callId：（当前callId）,
     *             callState：CALL_STATUS_DIALING,conferenceState：TEL_CONFERENCE_IDLE}
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_on_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_on_0200';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:PHONE_NUMBER_LENGTH_11,
            checkState:CALL_STATUS_DIALING
        })
            .then((data) => {
                let callId = data.callId;
                let flag = data.accountNumber === PHONE_NUMBER_LENGTH_11 && data.accountId === DEFAULT_SLOT_ID &&
          data.videoState === VIDEO_STATE_AUDIO && data.callState === CALL_STATUS_DIALING &&
          data.conferenceState === TEL_CONFERENCE_IDLE;
                console.log(`${caseName} success,case ${flag ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data.accountNumber === PHONE_NUMBER_LENGTH_11).assertTrue();
                expect(data.accountId === DEFAULT_SLOT_ID).assertTrue();
                expect(data.videoState === VIDEO_STATE_AUDIO).assertTrue();
                expect(data.callState === CALL_STATUS_DIALING).assertTrue();
                expect(data.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
                hangupCall2(caseName, done, callId);
            })
            .catch((error) => {
                console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_on_0300
     * @tc.name    Dial a call by number NOT_ACCEPT_NUMBER and before  being accepted,
     *             the callDetailsChange event get the callStateInfo is
     *             {accountNumber：NOT_ACCEPT_NUMBER,accountId：1,videoState：0,callType：0,callId：（当前callId）,
     *             callState：CALL_STATUS_ALERTING,conferenceState：TEL_CONFERENCE_IDLE}
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_on_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_on_0300';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:NOT_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ALERTING
        })
            .then((data) => {
                let callId = data.callId;
                let flag = data.accountNumber === NOT_ACCEPT_NUMBER && data.accountId === DEFAULT_SLOT_ID &&
          data.videoState === VIDEO_STATE_AUDIO && data.callState === CALL_STATUS_ALERTING &&
          data.conferenceState === TEL_CONFERENCE_IDLE;
                console.log(`${caseName} success,case ${flag ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data.accountNumber === NOT_ACCEPT_NUMBER).assertTrue();
                expect(data.accountId === DEFAULT_SLOT_ID).assertTrue();
                expect(data.videoState === VIDEO_STATE_AUDIO).assertTrue();
                expect(data.callState === CALL_STATUS_ALERTING).assertTrue();
                expect(data.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
                hangupCall2(caseName, done, callId);
            })
            .catch((error) => {
                console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_on_0400
     * @tc.name    Dial a call by number AUTO_ACCEPT_NUMBER and after  being accepted,
     *             the callDetailsChange event get the callStateInfo is
     *             {accountNumber：AUTO_ACCEPT_NUMBER,accountId：1,videoState：0,callType：0,callId：（当前callId）,
     *             CALL_STATUS_ACTIVE,conferenceState：TEL_CONFERENCE_IDLE}
     *             then  holding the call,the callDetailsChange event get the callStateInfo is
     *             {accountNumber：AUTO_ACCEPT_NUMBER,accountId：1,videoState：0,callType：0,callId：（当前callId）,
     *             callState：CALL_STATUS_HOLDIN,conferenceState：TEL_CONFERENCE_IDLE}
     * @tc.desc    Function test
     */
    // the phone number should be confirm
    it('Telephony_CallManager_on_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_on_0400';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        })
            .then((data) => {
                let callId = data.callId;
                let flag1 = data.accountNumber === AUTO_ACCEPT_NUMBER && data.accountId === DEFAULT_SLOT_ID &&
          data.videoState === VIDEO_STATE_AUDIO && data.callState === CALL_STATUS_ACTIVE &&
          data.conferenceState === TEL_CONFERENCE_IDLE;
                expect(data.accountNumber === AUTO_ACCEPT_NUMBER).assertTrue();
                expect(data.accountId === DEFAULT_SLOT_ID).assertTrue();
                expect(data.videoState === VIDEO_STATE_AUDIO).assertTrue();
                expect(data.callState === CALL_STATUS_ACTIVE).assertTrue();
                expect(data.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
                scenceInHolding({caseName:caseName, callId:data.callId})
                    .then(data2 => {
                        let flag = data2.accountNumber === AUTO_ACCEPT_NUMBER && data2.accountId === DEFAULT_SLOT_ID &&
              data2.videoState === VIDEO_STATE_AUDIO && data2.callState === CALL_STATUS_HOLDIN &&
              data2.conferenceState === TEL_CONFERENCE_IDLE;
                        console.log(`${caseName} success,case ${flag && flag1 ?
                            'success' : 'failed'},data:${toString(data)}`);
                        expect(data2.accountNumber === AUTO_ACCEPT_NUMBER).assertTrue();
                        expect(data2.accountId === DEFAULT_SLOT_ID).assertTrue();
                        expect(data2.videoState === VIDEO_STATE_AUDIO).assertTrue();
                        expect(data2.callState === CALL_STATUS_HOLDIN).assertTrue();
                        expect(data2.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
                        hangupCall2(caseName, done, callId);
                    })
                    .catch(error => {
                        console.log(`${caseName} scenceInHolding error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        hangupCall2(caseName, done, callId);
                    });
            })
            .catch((error) => {
                console.log(`${caseName} scenceInCalling2 error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_on_0500
     * @tc.name    Dial a call by number AUTO_ACCEPT_NUMBER ,after  being accepted ,then hangup the call,
     *             when get the state CALL_STATUS_DISCONNECTED,
     *             the callDetailsChange event get the callStateInfo is
     *             {accountNumber：AUTO_ACCEPT_NUMBER,accountId：1,videoState：0,callType：0,callId：（当前callId）,
     *             CALL_STATUS_DISCONNECTED,conferenceState：TEL_CONFERENCE_IDLE}
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_on_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_on_0500';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        })
            .then((data) => {
                let callId = data.callId;
                scenceInHangup({caseName:caseName, callId:data.callId, checkState:CALL_STATUS_DISCONNECTED})
                    .then(data2 => {
                        let flag = data2.accountNumber === AUTO_ACCEPT_NUMBER && data2.accountId === DEFAULT_SLOT_ID &&
              data2.videoState === VIDEO_STATE_AUDIO && data2.callState === CALL_STATUS_DISCONNECTED &&
              data2.conferenceState === TEL_CONFERENCE_IDLE;
                        console.log(`${caseName} success,case ${flag ? 'success' : 'failed'},data:${toString(data2)}`);
                        expect(data2.accountNumber === AUTO_ACCEPT_NUMBER).assertTrue();
                        expect(data2.accountId === DEFAULT_SLOT_ID).assertTrue();
                        expect(data2.videoState === VIDEO_STATE_AUDIO).assertTrue();
                        expect(data2.callState === CALL_STATUS_DISCONNECTED).assertTrue();
                        expect(data2.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log(`${caseName} scenceInHolding error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                    });
            })
            .catch((error) => {
                console.log(`${caseName} scenceInCalling2 error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_on_0600
     * @tc.name    Dial a call by number AUTO_ACCEPT_NUMBER , after  being accepted,then hangup the call,
     *             when get the state CALL_STATUS_DISCONNECTED,the callDetailsChange event get the callStateInfo is
     *             {accountNumber：AUTO_ACCEPT_NUMBER,accountId：1,videoState：0,callType：0,
     *             callId：（当前callId）,CALL_STATUS_DISCONNECTED,conferenceState：TEL_CONFERENCE_IDLE}
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_on_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_on_0600';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        })
            .then((data) => {
                let callId = data.callId;
                scenceInHangup({caseName:caseName, callId:data.callId, checkState:CALL_STATUS_DISCONNECTED})
                    .then(data2 => {
                        let flag = data2.accountNumber === AUTO_ACCEPT_NUMBER && data2.accountId === DEFAULT_SLOT_ID &&
              data2.videoState === VIDEO_STATE_AUDIO && data2.callState === CALL_STATUS_DISCONNECTED &&
              data2.conferenceState === TEL_CONFERENCE_IDLE;
                        console.log(`${caseName} success,case ${flag ? 'success' : 'failed'},data:${toString(data2)}`);
                        expect(data2.accountNumber === AUTO_ACCEPT_NUMBER).assertTrue();
                        expect(data2.accountId === DEFAULT_SLOT_ID).assertTrue();
                        expect(data2.videoState === VIDEO_STATE_AUDIO).assertTrue();
                        expect(data2.callState === CALL_STATUS_DISCONNECTED).assertTrue();
                        expect(data2.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log(`${caseName} scenceInHolding error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                    });
            })
            .catch((error) => {
                console.log(`${caseName} scenceInCalling2 error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_on_0700
     * @tc.name    Dial a call by number AUTO_ACCEPT_NUMBER and after  being accepted,
     *             then run Dtmf to send the character such as 'A',
     *             the events callEventChange return EVENT_START_DTMF_SUCCESS.
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_on_0700', 0, function (done) {
        let caseName = 'Telephony_CallManager_on_0700';
        let callId = null;
        call.on('callEventChange', function (err, callEventOptions) {
            console.log(`${caseName} on callEventChange error,error:` +
              `${toString(err)},data:${toString(callEventOptions)}`);
            if (err) {
                console.log(`${caseName} callEventChange error,case faild,error:${toString(err)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
                return;
            }
            if (callEventOptions.eventId === EVENT_START_DTMF_SUCCESS) {
                call.off('callEventChange');
                console.log(`${caseName} success,case success,data:${toString(callEventOptions)}`);
                expect(true).assertTrue();
                hangupCall2(caseName, done, callId);
            }
        });
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        })
            .then((data) => {
                callId = data.callId;
                call.startDTMF(callId, 'A', (err, value) => {
                    if (err) {
                        console.log(`${caseName} startDTMF err message = ${err.message},case faild`);
                        expect().assertFail();
                        hangupCall2(caseName, done, callId);
                        return;
                    }
                    console.log(`${caseName} startDTMF success,data:${value}`);
                });
            })
            .catch((error) => {
                console.log(`${caseName} scenceInCalling2 error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_on_0800
     * @tc.name    Dial a call by number AUTO_ACCEPT_NUMBER and after  being accepted,
     *             then run Dtmf to send the character such as '*43#',
     *             the events callEventChange return EVENT_START_DTMF_SUCCESS.
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_on_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_on_0800';
        let callId = null;
        let count = 0;
        let timeBar = null;
        const SEND_COUNT = 4;
        call.on('callEventChange', function (err, callEventOptions) {
            console.log(`${caseName} on callEventChange error,error:` +
                `${toString(err)},data:${toString(callEventOptions)}`);
            if (err) {
                console.log(`${caseName} on callEventChange error,error:${toString(err)},case faild`);
                expect().assertFail();
                done();
                return;
            }
            if (callEventOptions.eventId === EVENT_START_DTMF_SUCCESS) {
                count++;
                console.log(`${caseName} EVENT_START_DTMF_SUCCESS count ${count}`);
                clearTimeout(timeBar);
                timeBar = setTimeout(function () {
                    console.log(`${caseName} time arrive, case ${count === SEND_COUNT ? 'success' : 'error'}`);
                    call.off('callEventChange');
                    expect(count === SEND_COUNT).assertTrue();
                    hangupCall2(caseName, done, callId);
                }, 5 * TIMEOUT_LENTH);
            }
        });
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        })
            .then(async (data) => {
                callId = data.callId;
                try {
                    await call.startDTMF(callId, '*');
                    await call.startDTMF(callId, '4');
                    await call.startDTMF(callId, '3');
                    await call.startDTMF(callId, '#');
                    console.log(`${caseName} startDTMF success`);
                } catch (error) {
                    console.log(`${caseName} startDTMF err,case faild,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                }
            })
            .catch((error) => {
                console.log(`${caseName} scenceInCalling2 error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_off_0100
     * @tc.name    Register the events callDetailsChange by on to save the state of the call
     *             by global variable after accepted the call,then remove the events callDetailsChange
     *             and Register the events callDetailsChange by on
     *             to judge the global variable is changed according to the first  register to change,
     *             then hunup the call to trigger the events to compare
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_off_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_off_0100';
        call.on('callDetailsChange', function (err, callStateInfo) {
            console.log(`${caseName} callDetailsChange error:${toString(err)},data:${toString(callStateInfo)}`);
            if (err) {
                console.log(`${caseName} on error,case failed,error:${toString(err)}`);
                expect().assertFail();
                done();
            }
            let offCaseData = callStateInfo.callState;
            if (callStateInfo.callState === CALL_STATUS_ACTIVE) {
                call.off('callDetailsChange', (err, data) => {
                    console.log(`${caseName} off callDetailsChange error:${toString(err)},data:${toString(data)}`);
                    if (err) {
                        expect().assertFail();
                    }
                });
                call.on('callDetailsChange', function (err2, callStateInfo2) {
                    console.log(`${caseName} callDetailsChange error:` +
                      `${toString(err2)},data:${toString(callStateInfo2)}`);
                    if (err2) {
                        console.log(`${caseName} next on error,case failed,error:${toString(err2)}`);
                        expect().assertFail();
                        done();
                    }
                    if (isHanupEd(callStateInfo2.callState)) {
                        expect(offCaseData === CALL_STATUS_ACTIVE).assertTrue();
                        console.log(`${caseName} case ${offCaseData === CALL_STATUS_ACTIVE ?
                            'case success' : 'case faild'},data:${toString(callStateInfo2)}`);
                        done();
                    }
                });
                call.hangup(callStateInfo.callId).then(data => {
                    console.log(`${caseName} hangup success,data:${toString(data)}`);
                }).catch(error => {
                    console.log(`${caseName} hangup error,error:${toString(error)}`);
                });
            }
            if (isHanupEd(callStateInfo.callState)) {
                expect().assertFail();
                console.log(`${caseName} hangup success state ${callStateInfo.callState}`);
                done();
            }
        });
        call.dial(AUTO_ACCEPT_NUMBER, (error, data) => {
            if (error) {
                expect().assertFail();
                console.log(`${caseName} dial error,case failed,error:${toString(error)}`);
                done();
            }
            console.log(`${caseName} dial success,data:${toString(data)}`);
        });
    });

    /**
     * @tc.number  Telephony_CallManager_off_0200
     * @tc.name    Register the events callEventChange by on to save the state of the call
     *             by global variable after accepted the call,then run function startDTMF,
     *             when EVENT_START_DTMF_SUCCESS, remove the events callEventChange
     *             and Register the events callDetailsChange by on
     *             to judge the global variable is changed according to the first  register to change,
     *             then stopDTMF the call to trigger the events to compare
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_off_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_off_0200';
        let callId = null;
        callDetailsChangeOn();
        call.on('callEventChange', function (err, callEventOptions) {
            console.log(`${caseName} callEventChange on error,error:` +
              `${toString(err)},data:${toString(callEventOptions)}`);
            if (err) {
                console.log(`${caseName} callEventChange on error,case failed,error:${toString(err)}`);
                expect().assertFail();
                done();
            }
            let offCaseData = callEventOptions.eventId;
            if (callEventOptions.eventId === EVENT_START_DTMF_SUCCESS) {
                call.off('callEventChange', function (err) {
                    if (err) {
                        console.log(`${caseName} off error,case failed,error:${toString(err)}`);
                        expect().assertFail();
                        hangupCall2(caseName, done, callId);
                    }
                });
                call.on('callEventChange', function (err2, callEventOptions2) {
                    console.log(`${caseName} next callEventChange,error:` +
                      `${toString(err2)},data:${toString(callEventOptions2)}}`);
                    if (err2) {
                        console.log(`${caseName} next on error,case failed,error:${toString(err2)}`);
                        expect().assertFail();
                        call.off('callEventChange', function (err) {
                            if (err) {
                                console.log(`${caseName} next off error,case failed,error:${toString(err)}`);
                                expect().assertFail();
                                hangupCall2(caseName, done, callId);
                                return;
                            }
                            hangupCall2(caseName, done, callId);
                        });
                    }

                    if (callEventOptions2.eventId === EVENT_STOP_DTMF_SUCCESS) {
                        expect(offCaseData === EVENT_START_DTMF_SUCCESS).assertTrue();
                        console.log(`${caseName} case ${offCaseData === EVENT_START_DTMF_SUCCESS ?
                            'case success' : 'case faild'},data:${toString(callEventOptions2)}`);
                        call.off('callEventChange', function (err) {
                            if (err) {
                                console.log(`${caseName} next off error,case failed,error:${toString(err)}`);
                                expect().assertFail();
                                hangupCall2(caseName, done, callId);
                                return;
                            }
                            hangupCall2(caseName, done, callId);
                        });
                    }

                });
                call.startDTMF(callId, '5')
                    .then(data => {
                        console.log(`${caseName} startDTMF2 success,data:${toString(data)}`);
                        call.stopDTMF(callId)
                            .then(data => {
                                console.log(`${caseName} stopDTMF success,data:${toString(data)}`);
                            })
                            .catch(error => {
                                expect().assertFail();
                                console.log(`${caseName} stopDTMF error,case failed,error:${toString(error)}`);
                                hangupCall2(caseName, done, callId);
                            });
                    })
                    .catch(error => {
                        expect().assertFail();
                        console.log(`${caseName} startDTMF2 error,case failed,error:${toString(error)}`);
                        hangupCall2(caseName, done, callId);
                    });
            }
        });
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_ACTIVE
        })
            .then(data => {
                callId = data.callId;
                call.startDTMF(callId, '5')
                    .then(data => {
                        console.log(`${caseName} startDTMF1 success,data:${toString(data)}`);
                    })
                    .catch(error => {
                        console.log(`${caseName} startDTMF1 error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        hangupCall2(caseName, done, callId);
                    });

            })
            .catch(error => {
                console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

});
