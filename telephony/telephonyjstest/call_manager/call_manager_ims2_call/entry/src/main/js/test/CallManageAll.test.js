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

import call from '@ohos.telephony.call';
import observer from '@ohos.telephony.observer';
import {describe, afterAll, it, expect, beforeAll, afterEach} from 'deccjsunit/index';
import {
    AUTO_ACCEPT_NUMBER,
    AUTO_ACCEPT_NUMBER2,
    PHONE_NUMBER_LENGTH_11,
    CALL_STATUS_DIALING,
    CALL_ID_NOT_EXIST,
    CALL_STATE_UNKNOWN,
    CALL_STATE_IDLE,
    DEFAULT_SLOT_ID,
    CALL_MODE_IMS,
    SLOT_ID_INVALID,
    PHONE_LIST2,
    RTT_MSG,
    CALL_MODE_SEND_RECEIVE,
    POS_700,
    POS_10,
    POS_LENGTH_300,
    POS_LENGTH_600,
    DEVICE_EARPIECE,
    BOUNDARY_NUMBER_INT,
    SENT_STRING_C,
    MINUS_VALUE,
    PHONE_NUMBER_LONG,
    NULL_PHONE_NUMBER,
    DIAL_CARRIER_TYPE,
    DIAL_SCENCE_CALL_PRIVILEGED,
    MEDIA_TYPE_VOICE,
    ROTATION_MINUS_1,
    IMAGE_LOCAL_ERROR_PATH,
    POS_Z_ERROR,
    RESTRICTION_TYPE_ROAMING_INCOMING,
    RESTRICTION_MODE_ACTIVATION,
    RIGHT_PASSWORD,
    RESTRICTION_TYPE_ALL_INCOMING,
    TRANSFER_TYPE_NOT_REACHABLE,
    TRANSFER_TYPE_UNCONDITIONAL,
    PHONE_NUMBER_AREA_LAND,
    CALL_TRANSFER_DISABLE,
    TRANSFER_TYPE_NO_REPLY,
    COMMAND_CALL_ERROR4,
    COMMAND_CALL_ERROR,
    CARMER_ID_NOT_EXIT,
    ZOOM_RATIO_MINUS_1_0,
    DIAL_SCENCE_CALL_NORMAL,
    DIAL_TYPE_OTT,
    EVENT_OTT_FUNCTION_UNSUPPORTED,
    TEL_CONFERENCE_IDLE
} from './lib/Const.js';
import {toString} from './lib/ApiToPromise.js';
import {
    scenceInCalling,
    hangupCall2,
    hangupCall,
    callDetailsChangeOn,
    callId as gloabCallId,
    reachState,
    callDetailsChangeOff,
    reachCallEventState
} from './lib/ScenceInCalling.js';
const GETMAIN_CALLID_ERRO = -1;
const REJECT_MESSAGE_STR = 'Hi,hello?';
const REJECT_MESSAGE_NUM = 1234567890123456789012345678901234567890;
const ERR_SLOT_ID = -1;
const SLOTID = 0;
const THE_THREE_NUMBER = '112';
const DIAL_TYPE_ERR_CALL = 3;
const TIME_OUT = 20000;
const WAITING_TIME = 200;

let callId = null;
class RejectMessageOptions {
    constructor (str) {
        this.messageContent = str;
    }
}
class EmergencyNumberOptions {
    constructor (num) {
        this.slotId = num;
    }
}
class NumberFormatOptions {
    constructor (str) {
        this.countryCode = str;
    }
}
class CallAttributeOptions {
    constructor (accountNumber, speakerphoneOn, accountId, videoState, startTime,
        isEcc, callType, callId, callState, conferenceState) {
        this.accountNumber = accountNumber;
        this.speakerphoneOn = speakerphoneOn;
        this.accountId = accountId;
        this.videoState = videoState;
        this.startTime = startTime;
        this.isEcc = isEcc;
        this.callType = callType;
        this.callId = callId;
        this.callState = callState;
        this.conferenceState = conferenceState;
    }
}

const sleep = (time) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve();
        }, time);
    });
};

var callState = -1;
var timing = 0;
var endTime = 0;
describe('CallManageImsCall', function () {
   beforeAll(async function (done) {
		try {
			console.log('Telephony_CallManager enableImsSwitch success');
			await call.setCallPreferenceMode(DEFAULT_SLOT_ID, CALL_MODE_IMS);
			console.log('Telephony_CallManager setCallPreferenceMode success');
		} catch (error) {
			console.log(`Telephony_CallManager setCallPreferenceMode or enableImsSwitch error,error:${toString(error)}`);
		}
		done();
	});

    afterEach(async function () {
        try {
            const CURRENT_TIME = new Date().valueOf();
            const TEMP_CALL_ID = 10;
            const IS_ECC = true;
            const SPEAK_ON = true;
            let callAttributeOptions = new CallAttributeOptions(AUTO_ACCEPT_NUMBER, SPEAK_ON, DEFAULT_SLOT_ID,
                MEDIA_TYPE_VOICE, CURRENT_TIME, IS_ECC, DIAL_TYPE_OTT, TEMP_CALL_ID, CALL_STATUS_DIALING,
                TEL_CONFERENCE_IDLE);
            console.log(`Telephony_CallManager ${toString(callAttributeOptions)}`);
            expect(callAttributeOptions.accountNumber === AUTO_ACCEPT_NUMBER).assertTrue();
            expect(callAttributeOptions.speakerphoneOn === SPEAK_ON).assertTrue();
            expect(callAttributeOptions.accountId === DEFAULT_SLOT_ID).assertTrue();
            expect(callAttributeOptions.videoState === MEDIA_TYPE_VOICE).assertTrue();
            expect(callAttributeOptions.startTime === CURRENT_TIME).assertTrue();
            expect(callAttributeOptions.isEcc === IS_ECC).assertTrue();
            expect(callAttributeOptions.callType === DIAL_TYPE_OTT).assertTrue();
            expect(callAttributeOptions.callId === TEMP_CALL_ID).assertTrue();
            expect(callAttributeOptions.callState === CALL_STATUS_DIALING).assertTrue();
            expect(callAttributeOptions.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
        } catch (error) {
            console.log(`Telephony_CallManager ${toString(error)}`);
        }
        try {
            let callState = await call.getCallState();
            console.log(`Telephony_CallManager callState ${callState} ${gloabCallId}`);
            if (callState === CALL_STATE_UNKNOWN || callState === CALL_STATE_IDLE) {
                return;
            }
            if (gloabCallId) {
                let data = await hangupCall('Telephony_CallManager', gloabCallId);
                console.log(`Telephony_CallManager hangupCall success ${toString(data)}`);
            }
        } catch (error) {
            console.log('Telephony_CallManager hangupCall or getCallState error');
        }
    });

    afterAll(function () {
        observer.off('callStateChange');
        callDetailsChangeOff();
        console.log('Telephony_CallManager all 54 case is over for callmanager CallManageImsCall');
    });
  
    /**
     * @tc.number  Telephony_CallManager_IMS_enableLteEnhanceMode_Async_0400
     * @tc.name    Run the function enableLteEnhanceMode by args slotId SLOT_ID_INVALID,
     *             by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_enableLteEnhanceMode_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_enableLteEnhanceMode_Async_0400';
        call.enableLteEnhanceMode(SLOT_ID_INVALID, (error, data) => {
            if (error) {
                console.log(`${caseName} enableLteEnhanceMode error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} enableLteEnhanceMode success,case failed,data:${toString(data)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_enableLteEnhanceMode_Promise_0400
     * @tc.name    Run the function enableLteEnhanceMode by args slotId SLOT_ID_INVALID by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_enableLteEnhanceMode_Promise_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_enableLteEnhanceMode_Promise_0400';
        call.enableLteEnhanceMode(SLOT_ID_INVALID).then(data => {
            expect().assertFail();
            console.log(`${caseName} enableLteEnhanceMode success,case failed,data:${toString(data)}`);
            done();
        }).catch(error => {
            console.log(`${caseName} enableLteEnhanceMode error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_disableLteEnhanceMode_Async_0400
     * @tc.name    Run the function disableLteEnhanceMode by args slotId SLOT_ID_INVALID,
     *             by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_disableLteEnhanceMode_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_disableLteEnhanceMode_Async_0400';
        call.disableLteEnhanceMode(SLOT_ID_INVALID, (error, data) => {
            if (error) {
                console.log(`${caseName} disableLteEnhanceMode error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} disableLteEnhanceMode success,case failed,data:${toString(data)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_disableLteEnhanceMode_Promise_0400
     * @tc.name    Run the function disableLteEnhanceMode by args slotId SLOT_ID_INVALID by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_disableLteEnhanceMode_Promise_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_disableLteEnhanceMode_Promise_0400';
        call.disableLteEnhanceMode(SLOT_ID_INVALID).then(data => {
            expect().assertFail();
            console.log(`${caseName} disableLteEnhanceMode success,case failed,data:${toString(data)}`);
            done();
        }).catch(error => {
            console.log(`${caseName} disableLteEnhanceMode error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_isLteEnhanceModeEnabled_Async_0400
     * @tc.name    Run the function isLteEnhanceModeEnabled by args slotId SLOT_ID_INVALID by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_isLteEnhanceModeEnabled_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_isLteEnhanceModeEnabled_Async_0400';
        call.isLteEnhanceModeEnabled(SLOT_ID_INVALID, (error, data) => {
            if (error) {
                console.log(`${caseName} isLteEnhanceModeEnabled error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} isLteEnhanceModeEnabled success,case failed,data:${toString(data)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_isLteEnhanceModeEnabled_Promise_0400
     * @tc.name    Run the function isLteEnhanceModeEnabled by args slotId SLOT_ID_INVALID by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_isLteEnhanceModeEnabled_Promise_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_isLteEnhanceModeEnabled_Promise_0400';
        call.isLteEnhanceModeEnabled(SLOT_ID_INVALID).then(data => {
            expect().assertFail();
            console.log(`${caseName} isLteEnhanceModeEnabled success,case failed,data:${toString(data)}`);
            done();
        }).catch(error => {
            console.log(`${caseName} isLteEnhanceModeEnabled error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startRTT_Async_0200
     * @tc.name    Run function startRTT by args callId CALL_ID_NOT_EXIST,msg RTT_MSG by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startRTT_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startRTT_Async_0200';
        call.startRTT(CALL_ID_NOT_EXIST, RTT_MSG, (error, data) => {
            if (error) {
                console.log(`${caseName} startRTT ${callId} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} startRTT success,case failed,data:${toString(data)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_startRTT_Promise_0200
     * @tc.name    Run function startRTT by args callId CALL_ID_NOT_EXIST,msg RTT_MSG by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_startRTT_Promise_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_startRTT_Promise_0200';
        call.startRTT(CALL_ID_NOT_EXIST, RTT_MSG).then(data => {
            expect().assertFail();
            console.log(`${caseName} startRTT success,case failed,data:${toString(data)}`);
            done();
        }).catch(error => {
            console.log(`${caseName} startRTT ${callId} error,case success,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_stopRTT_Async_0200
     * @tc.name    Run function stopRTT by args callId CALL_ID_NOT_EXIST by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_stopRTT_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_stopRTT_Async_0200';
        call.stopRTT(CALL_ID_NOT_EXIST, (error, data) => {
            if (error) {
                console.log(`${caseName} stopRTT ${callId} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            expect().assertFail();
            console.log(`${caseName} stopRTT success,case failed,data:${toString(data)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_IMS_stopRTT_Promise_0200
     * @tc.name    Run function stopRTT by args callId CALL_ID_NOT_EXIST by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_IMS_stopRTT_Promise_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_IMS_stopRTT_Promise_0200';
        call.stopRTT(CALL_ID_NOT_EXIST).then(data => {
            expect().assertFail();
            console.log(`${caseName} stopRTT success,case failed,data:${toString(data)}`);
            done();
        }).catch(error => {
            console.log(`${caseName} stopRTT ${callId} error,case success,error:${toString(error)}`);
            done();
        });
    });


    /**
     * @tc.number  Telephony_CallManager_controlCamera_Async_0200
     * @tc.name    Dial a call and after answering the call,run function controlCamera by
     *             args cameraId CARMER_ID_NOT_EXIT by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_controlCamera_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_controlCamera_Async_0200';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER2,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            let cameraId = CARMER_ID_NOT_EXIT;
            call.controlCamera(cameraId, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case failed`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_controlCamera_Promise_0200
     * @tc.name    Dial a call and after answering the call,run function controlCamera by args cameraId
     *             CARMER_ID_NOT_EXIT  by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_controlCamera_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_controlCamera_Promise_0200';
        let cameraId = CARMER_ID_NOT_EXIT;
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER2,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
            return;
        }
        try {
            await call.controlCamera(cameraId);
            console.log(`${caseName} case failed`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success. error:${toString(err)}`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_setPreviewWindow_Async_0300
     * @tc.name    Dial a call and after answering the call,run function setPreviewWindow by args
     *             x POS_700,y POS_10,z POS_Z_ERROR,width POS_LENGTH_300,height  POS_LENGTH_600 by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setPreviewWindow_Async_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setPreviewWindow_Async_0300';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            let info = {x: POS_700, y: POS_10, z: POS_Z_ERROR, width: POS_LENGTH_300, height:  POS_LENGTH_600};
            call.setPreviewWindow(info, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case faild`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setPreviewWindow_Promise_0300
     * @tc.name    Dial a call and after answering the call,run function setPreviewWindow by args
     *             x POS_700,y POS_10,z POS_Z_ERROR,width POS_LENGTH_300,height  POS_LENGTH_600 by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setPreviewWindow_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setPreviewWindow_Promise_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
            return;
        }
        try {
            let info = {x: POS_700, y: POS_10, z: POS_Z_ERROR, width: POS_LENGTH_300, height:  POS_LENGTH_600};
            await call.setPreviewWindow(info);
            console.log(`${caseName} case faild`);
            expect().assertFail();
        } catch (error) {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_setDisplayWindow_Async_0300
     * @tc.name    Dial a call and after answering the call,run function setDisplayWindow by args
     *             x POS_700,y POS_10,z POS_Z_ERROR,width POS_LENGTH_300,height  POS_LENGTH_600 by callback,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setDisplayWindow_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setDisplayWindow_Async_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
            return;
        }
        try {
            let info = {x: POS_700, y: POS_10, z: POS_Z_ERROR, width: POS_LENGTH_300, height:  POS_LENGTH_600};
            await call.setDisplayWindow(info);
            console.log(`${caseName} case faild`);
            expect().assertFail();
        } catch (error) {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_setDisplayWindow_Promise_0300
     * @tc.name    Dial a call and after answering the call,run function setDisplayWindow by args
     *             x POS_700,y POS_10,z POS_Z_ERROR,width POS_LENGTH_300,height  POS_LENGTH_600 by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setDisplayWindow_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setDisplayWindow_Promise_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
            return;
        }
        try {
            let info = {x: POS_700, y: POS_10, z: POS_Z_ERROR, width: POS_LENGTH_300, height:  POS_LENGTH_600};
            await call.setDisplayWindow(info);
            console.log(`${caseName} case faild`);
            expect().assertFail();
        } catch (error) {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_setCameraZoom_Async_0400
     * @tc.name    Dial a call and after answering the call,run function setCameraZoom by args
     *             zoomRatio ZOOM_RATIO_MINUS_1_0 by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCameraZoom_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCameraZoom_Async_0400';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER2,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.setCameraZoom(ZOOM_RATIO_MINUS_1_0, (error) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} case failed`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCameraZoom_Promise_0400
     * @tc.name    Dial a call and after answering the call,run function setCameraZoom by args
     *             zoomRatio ZOOM_RATIO_MINUS_1_0 by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCameraZoom_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCameraZoom_Promise_0400';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
            return;
        }
        try {
            await call.setCameraZoom(ZOOM_RATIO_MINUS_1_0);
            console.log(`${caseName} case failed`);
            expect().assertFail();
        } catch (error) {
            console.log(`${caseName} error,case success,error:${toString(error)}`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_setPausePicture_Async_0500
     * @tc.name    Dial a call and after answering the call,run function setPausePicture by args
     *             path IMAGE_LOCAL_ERROR_PATH by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setPausePicture_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setPausePicture_Async_0500';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.setPausePicture(IMAGE_LOCAL_ERROR_PATH, (error) => {
                if (error) {
                    console.log(`${caseName} case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case failed`);
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setPausePicture_Promise_0500
     * @tc.name    Dial a call and after answering the call,run function setPausePicture
     *             by args path IMAGE_LOCAL_ERROR_PATH by promise,
     *             the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setPausePicture_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setPausePicture_Promise_0500';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
            return;
        }
        try {
            await call.setPausePicture(IMAGE_LOCAL_ERROR_PATH);
            console.log(`${caseName} success,case failed`);
        } catch (error) {
            console.log(`${caseName} case success,error:${toString(error)}`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_setDeviceDirection_Async_0500
     * @tc.name    Dial a call and after answering the call,run function setDeviceDirection
     *             by args rotation ROTATION_MINUS_1 by callback,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setDeviceDirection_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setDeviceDirection_Async_0500';
        scenceInCalling({
            caseName:caseName,
            phoneNumber:AUTO_ACCEPT_NUMBER,
            checkState:CALL_STATUS_DIALING
        }).then(data => {
            callId = data.callId;
            call.setDeviceDirection(ROTATION_MINUS_1, (error) => {
                if (error) {
                    console.log(`${caseName} success, case success`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                hangupCall2(caseName, done, callId);
            });
        }).catch(error => {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setDeviceDirection_Promise_0500
     * @tc.name    Dial a call and after answering the call,run function setDeviceDirection
     *             by args rotation ROTATION_MINUS_1 by promise,the callback function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setDeviceDirection_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setDeviceDirection_Promise_0500';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER2,
                checkState:CALL_STATUS_DIALING
            });
            callId = data.callId;
        } catch (error) {
            console.log(`${caseName} scenceInCalling error ,case failed,error:${toString(error)}`);
            done();
            return;
        }
        try {
            await call.setDeviceDirection(ROTATION_MINUS_1);
            console.log(`${caseName} success,case error`);
            expect().assertFail();
        } catch (error) {
            console.log(`${caseName} case success,error:${toString(error)}`);
        }
        hangupCall2(caseName, done, callId);
    });

    /**
     * @tc.number  Telephony_CallManager_getCallState_Async_0100
     * @tc.name    To get the idle call status, call getCallState() to get the current call status.
     *             call.CALL_STATE_IDLE is returned
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallState_Async_0100', 0, async function (done) {
        call.getCallState((err, data) => {
            if (err) {
                console.log(`Telephony_CallManager_getCallState_Async_0100 : err = ${err.message}`);
                expect().assertFail();
                done();
                return;
            }
            expect(data === call.CALL_STATE_IDLE).assertTrue();
            console.log(`Telephony_CallManager_getCallState_Async_0100 finish data = ${data}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallState_Promise_0100
     * @tc.name    To get the idle call status, call getCallState() to get the current call status.
     *             call.CALL_STATE_IDLE is returned
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallState_Promise_0100', 0, async function (done) {
        try {
            var data = await call.getCallState();
            expect(data === call.CALL_STATE_IDLE).assertTrue();
            console.log(`Telephony_CallManager_getCallState_Promise_0100 finish data = ${data}`);
            done();
        } catch (err) {
            console.log(`Telephony_CallManager_getCallState_Promise_0100 : err = ${err.message}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_hasCall_Async_0400
     * @tc.name    When idle, hasCall() is called to confirm that there is no current call,returning false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_hasCall_Async_0400', 0, async function (done) {
        call.hasCall((err, data) => {
            if (err) {
                console.log('Telephony_CallManager_hasCall_Async_0400 fail');
                expect().assertFail();
                done();
                return;
            }
            expect(data === false).assertTrue();
            console.log(`Telephony_CallManager_hasCall_Async_0400 finish data = ${data}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_hasCall_Promise_0400
     * @tc.name    When idle, hasCall() is called to confirm that there is no current call, returning false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_hasCall_Promise_0400', 0, async function (done) {
        try {
            var data = await call.hasCall();
            expect(data === false).assertTrue();
            console.log(`Telephony_CallManager_hasCall_Promise_0400 finish data = ${data}`);
            done();
        } catch (err) {
            console.log('Telephony_CallManager_hasCall_Promise_0400 fail');
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_formatPhoneNumber_Async_0100
     * @tc.name    PhoneNumber is 100000000000. Call formatPhoneNumber() to format the number.
     *             The return value is 10 000 000 0000
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_formatPhoneNumber_Async_0100', 0, async function (done) {
        call.formatPhoneNumber('100000000000', (err, data) => {
            if (err) {
                console.log(`Telephony_CallManager_formatPhoneNumber_Async_0100 err = ${err.message}`);
                console.log('Telephony_CallManager_formatPhoneNumber_Async_0100 fail');
                expect().assertFail();
                done();
                return;
            }
            expect(data === '10 000 000 0000').assertTrue();
            console.log(`Telephony_CallManager_formatPhoneNumber_Async_0100 finish data = ${data}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_formatPhoneNumber_Promise_0100
     * @tc.name    PhoneNumber is 2000000. Call formatPhoneNumber() to format the number.
     *             The return value is 200 0000
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_formatPhoneNumber_Promise_0100', 0, async function (done) {
        try {
            var data = await call.formatPhoneNumber('2000000');
            expect(data === '200 0000').assertTrue();
            console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0100 finish data = ${data}`);
            done();
        } catch (err) {
            console.log('Telephony_CallManager_formatPhoneNumber_Promise_0100 fail');
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Async_0100
     * @tc.name    PhoneNumber is 010-0000-0000, options: CN, call formatPhoneNumberToE164() to format the number,
     *             and return +861000000000
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_formatPhoneNumberToE164_Async_0100', 0, async function (done) {
        let numberFormatOptions = new NumberFormatOptions('CN');
        call.formatPhoneNumberToE164('010-0000-0000', numberFormatOptions.countryCode, (err, data) => {
            if (err) {
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Async_0100 fail');
                expect().assertFail();
                done();
                return;
            }
            expect(data === '+861000000000').assertTrue();
            console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0100 finish data = ${data}`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Promise_0100
     * @tc.name    PhoneNumber is 52300000000, options: CN, call formatPhoneNumberToE164() to format the number,
     *             return +8652300000000
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0100', 0, async function (done) {
        let numberFormatOptions = new NumberFormatOptions('CN');
        try {
            var data = await call.formatPhoneNumberToE164('52300000000', numberFormatOptions.countryCode);
            expect(data === '+8652300000000').assertTrue();
            console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0100 finish data = ${data}`);
            done();
        } catch (err) {
            console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0100 fail');
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_1300
     * @tc.name    PhoneNumber: 110, options -1. Call isEmergencyPhoneNumber() to check whether it is an emergency
     *             number. The return value is false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isEmergencyPhoneNumber_Async_1300', 0, async function (done) {
        let emergencyNumberOptions = new EmergencyNumberOptions(ERR_SLOT_ID);
        call.isEmergencyPhoneNumber('110', emergencyNumberOptions, (err) => {
            if (err) {
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_1300 finish err = ${err}`);
                done();
                return;
            }
            expect().assertFail();
            console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_1300 fail ');
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300
     * @tc.name    PhoneNumber: 120, options -1. Call isEmergencyPhoneNumber() to check whether it is an emergency
     *             number. The return value is false
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300', 0, async function (done) {
        let emergencyNumberOptions = new EmergencyNumberOptions(ERR_SLOT_ID);
        try {
            var data = await call.isEmergencyPhoneNumber('120', emergencyNumberOptions);
            expect().assertFail();
            console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300 fail ');
            done();
        } catch (err) {
            console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300 finish err = ${err}`);
            done();
        }
    });
});