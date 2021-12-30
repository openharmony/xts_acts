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
    AUTO_ACCEPT_NUMBER,
    CALL_STATUS_ACTIVE,
    CALL_STATUS_DIALING,
    BOUNDARY_NUMBER_INT,
    CALL_ID_NOT_EXIST,
    DEVICE_SPEAKER,
    DEVICE_WIRED_HEADSET,
    DEVICE_BLUETOOTH_SCO,
    DEVICE_EARPIECE,
    DEVICE_INVALID,
    DEVICE_INVALID4,
    PHONE_NUMBER_LENGTH_11,
    CALL_STATE_IDLE
} from './lib/Const.js';
import {
    scenceInCalling,
    hangupCall2,
    callDetailsChangeOn,
    callDetailsChangeOff,
    callId as gloabalCallId,
    hangupCall
} from './lib/ScenceInCalling.js';
import {toString} from './lib/ApiToPromise.js';
describe('CallManagementCallMedia', function () {
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
        console.log('Telephony_CallManager all 48 case is over for callmanager CallManagementCallMedia');
    });

    /**
     * @tc.number  Telephony_CallManager_separateConference_Async_0100
     * @tc.name    Run separateConference by callback when callId is any number(such as 1234)
     *             that is not exit in calllist,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_separateConference_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_separateConference_Async_0100';
        call.separateConference(CALL_ID_NOT_EXIST, function (error, data) {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
                return;
            }
            console.log(`${caseName} success,case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_separateConference_Async_0200
     * @tc.name    Run separateConference by callback when callId is number at boundary ,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_separateConference_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_separateConference_Async_0200';
        call.separateConference(BOUNDARY_NUMBER_INT, function (error, data) {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
                return;
            }
            console.log(`${caseName}  success,case error,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_separateConference_Async_0300
     * @tc.name    Dial a call and get the callId,the function separateConference by callback return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_separateConference_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_separateConference_Async_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.separateConference(callId, function (error, data) {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    expect(!!error).assertTrue();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case failed,data:${toString(data)}`);
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
     * @tc.number  Telephony_CallManager_separateConference_Promise_0100
     * @tc.name    Run separateConference by promise when callId is any number(such as 1234)
     *             that is not exit in calllist,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_separateConference_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_separateConference_Promise_0100';
        call.separateConference(CALL_ID_NOT_EXIST)
            .then(data => {
                console.log(`${caseName} success,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_separateConference_Promise_0200
     * @tc.name    Run separateConference by promise when callId is number at boundary ,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_separateConference_Promise_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_separateConference_Promise_0200';
        call.separateConference(BOUNDARY_NUMBER_INT)
            .then((data) => {
                console.log(`${caseName} success,case error,data:${toString(data)}`);
                expect().assertFail();

                done();
            })
            .catch((error) => {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });

    });

    /**
     * @tc.number  Telephony_CallManager_separateConference_Promise_0300
     * @tc.name    Dial a call and get the callId,the function separateConference by promise return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_separateConference_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_separateConference_Promise_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.separateConference(callId)
                .then(data => {
                    console.log(`${caseName} success,case failed`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                })
                .catch(error => {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    expect(!!error).assertTrue();
                    hangupCall2(caseName, done, callId);
                });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_muteRinger_Async_0100
     * @tc.name    Unwanted state,run function muteRinger by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_muteRinger_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_muteRinger_Async_0100';
        call.muteRinger((error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} success,case success`);
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_muteRinger_Async_0200
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function muteRinger by callback,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_muteRinger_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_muteRinger_Async_0200';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.muteRinger((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case success`);
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_muteRinger_Async_0500
     * @tc.name    Calling to PHONE_NUMBER_LENGTH_11, when CALL_STATUS_DIALING ,run function muteRinger by callback,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_muteRinger_Async_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_muteRinger_Async_0500';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            let callId = data.callId;
            call.muteRinger((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case success`);
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_muteRinger_Promise_0100
     * @tc.name    Unwanted state,run function muteRinger by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_muteRinger_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_muteRinger_Promise_0100';
        call.muteRinger()
            .then(data => {
                console.log(`${caseName} success,case success`);
                done();
            })
            .catch((error) => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_muteRinger_Promise_0200
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function muteRinger by promise,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_muteRinger_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_muteRinger_Promise_0200';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.muteRinger()
                .then(data => {
                    console.log(`${caseName} success,case success`);
                    hangupCall2(caseName, done, callId);
                })
                .catch((error) => {
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
     * @tc.number  Telephony_CallManager_muteRinger_Promise_0500
     * @tc.name    Calling to PHONE_NUMBER_LENGTH_11, when CALL_STATUS_DIALING ,run function muteRinger by promise,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_muteRinger_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_muteRinger_Promise_0500';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            let callId = data.callId;
            call.muteRinger()
                .then(data => {
                    console.log(`${caseName} success,case success`);
                    hangupCall2(caseName, done, callId);
                })
                .catch((error) => {
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
     * @tc.number  Telephony_CallManager_setAudioDevice_Async_0100
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice by callback and by arg DEVICE_EARPIECE,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Async_0100';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_EARPIECE, (error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case success`);
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_setAudioDevice_Async_0200
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice by callback and by arg DEVICE_SPEAKER,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Async_0200';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_SPEAKER, (error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case success`);
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_setAudioDevice_Async_0300
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice
     *             by callback and by arg DEVICE_WIRED_HEADSET,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Async_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_WIRED_HEADSET, (error, data) => {
                if (error) {
                    console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                    expect(!!error).assertTrue();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
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
     * @tc.number  Telephony_CallManager_setAudioDevice_Async_0400
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice
     *             by callback and by arg DEVICE_BLUETOOTH_SCO,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Async_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Async_0400';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_BLUETOOTH_SCO, (error, data) => {
                if (error) {
                    console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                    expect(!!error).assertTrue();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
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
     * @tc.number  Telephony_CallManager_setAudioDevice_Async_0500
     * @tc.name    Unwanted state,run function setAudioDevice by callback and by arg DEVICE_EARPIECE,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Async_0500';
        call.setAudioDevice(DEVICE_EARPIECE, (error, data) => {
            if (error) {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
                return;
            }
            console.log(`${caseName} error,case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setAudioDevice_Async_0800
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice
     *             by callback and by arg DEVICE_INVALID,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Async_0800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Async_0800';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_INVALID, (error, data) => {
                if (error) {
                    console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                    expect(!!error).assertTrue();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
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
     * @tc.number  Telephony_CallManager_setAudioDevice_Promise_0100
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice by promise and by arg DEVICE_EARPIECE,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Promise_0100';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_EARPIECE)
                .then(data => {
                    console.log(`${caseName} success,case success`);
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
     * @tc.number  Telephony_CallManager_setAudioDevice_Promise_0200
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice by promise and by arg DEVICE_SPEAKER,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Promise_0200';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_SPEAKER)
                .then(data => {
                    console.log(`${caseName} success,case success`);
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
     * @tc.number  Telephony_CallManager_setAudioDevice_Promise_0300
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice by promise and by arg DEVICE_WIRED_HEADSET,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Promise_0300';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_WIRED_HEADSET)
                .then(data => {
                    console.log(`${caseName} error,case failed,data:${toString(data)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                })
                .catch(error => {
                    console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                    expect(!!error).assertTrue();
                    hangupCall2(caseName, done, callId);
                });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_setAudioDevice_Promise_0400
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice by promise and by arg DEVICE_BLUETOOTH_SCO,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Promise_0400';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_BLUETOOTH_SCO)
                .then(data => {
                    console.log(`${caseName} error,case failed,data:${toString(data)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                })
                .catch(error => {
                    console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                    expect(!!error).assertTrue();
                    hangupCall2(caseName, done, callId);
                });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_setAudioDevice_Promise_0500
     * @tc.name    Unwanted state,run function setAudioDevice by promise and by arg DEVICE_EARPIECE,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Promise_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Promise_0500';
        call.setAudioDevice(DEVICE_EARPIECE)
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch(error => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setAudioDevice_Promise_0800
     * @tc.name    Calling to AUTO_ACCEPT_NUMBER,run function setAudioDevice by promise and by arg DEVICE_INVALID4,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setAudioDevice_Promise_0800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setAudioDevice_Promise_0800';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setAudioDevice(DEVICE_INVALID4)
                .then(data => {
                    console.log(`${caseName} error,case failed,data:${toString(data)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                })
                .catch(error => {
                    console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                    expect(!!error).assertTrue();
                    hangupCall2(caseName, done, callId);
                });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_setMuted_Async_0100
     * @tc.name    Dial a number after the call is accepted,
     *             run function setMuted by callback,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setMuted_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setMuted_Async_0100';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            console.log(`${caseName} scenceInCalling data:${toString(data)},${typeof call.setMuted}`);
            call.setMuted((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case success`);
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_setMuted_Async_0200
     * @tc.name    Dial a number after the call is dialing,
     *             run function setMuted by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setMuted_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setMuted_Async_0200';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            let callId = data.callId;
            call.setMuted((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case failed,data:${toString(data)}`);
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
     * @tc.number  Telephony_CallManager_setMuted_Async_0300
     * @tc.name    Unwanted state,run function setMuted by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setMuted_Async_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setMuted_Async_0300';
        call.setMuted((error, data) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
                return;
            }
            console.log(`${caseName} success,case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setMuted_Promise_0100
     * @tc.name    Dial a number after the call is accepted,
     *             run function setMuted by promise,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setMuted_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setMuted_Promise_0100';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setMuted()
                .then(data => {
                    console.log(`${caseName} success,case success`);
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
     * @tc.number  Telephony_CallManager_setMuted_Promise_0200
     * @tc.name    Dial a number after the call is dialing,
     *             run function setMuted by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setMuted_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setMuted_Promise_0200';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:PHONE_NUMBER_LENGTH_11,
                checkState:CALL_STATUS_DIALING
            });
            let callId = data.callId;
            call.setMuted()
                .then(data => {
                    console.log(`${caseName} success,case failed,data:${toString(data)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                })
                .catch(error => {
                    console.log(`${caseName} error,case success,error:${toString(error)}`);
                    hangupCall2(caseName, done, callId);
                });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_setMuted_Promise_0300
     * @tc.name    Unwanted state,run function setMuted by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setMuted_Promise_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setMuted_Promise_0300';
        call.setMuted()
            .then(data => {
                console.log(`${caseName} success,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_cancelMuted_Async_0100
     * @tc.name    Dial a number after the call is accepted,
     *             run function setMuted then run function cancelMuted by callback,
     *             the function cancelMuted return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_cancelMuted_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_cancelMuted_Async_0100';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setMuted()
                .then(data => {
                    call.cancelMuted((error, data) => {
                        if (error) {
                            console.log(`${caseName} error,case faild,error:${toString(error)}`);
                            expect().assertFail();
                            hangupCall2(caseName, done, callId);
                            return;
                        }
                        console.log(`${caseName} success,case success,data:${toString(data)}`);
                        hangupCall2(caseName, done, callId);
                    });
                })
                .catch(error => {
                    console.log(`${caseName} setMuted error,case failed,error:${toString(error)}`);
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
     * @tc.number  Telephony_CallManager_cancelMuted_Async_0200
     * @tc.name    Dial a number after the call is accepted,
     *             run function cancelMuted by callback,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_cancelMuted_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_cancelMuted_Async_0200';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.cancelMuted((error, data) => {
                if (error) {
                    console.log(`${caseName} error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    hangupCall2(caseName, done, callId);
                    return;
                }
                console.log(`${caseName} success,case success,data:${toString(data)}`);
                hangupCall2(caseName, done, callId);
            });
        } catch (error) {
            console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_cancelMuted_Async_0300
     * @tc.name    Unwanted state,run function cancelMuted by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_cancelMuted_Async_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_cancelMuted_Async_0300';
        call.cancelMuted((error, data) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} success,case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_cancelMuted_Promise_0100
     * @tc.name    Dial a number after the call is accepted,
     *             run function setMuted then run function cancelMuted by promise,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_cancelMuted_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_cancelMuted_Promise_0100';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.setMuted()
                .then(data => {
                    call.cancelMuted()
                        .then(data => {
                            console.log(`${caseName} success,case success,data:${toString(data)}`);
                            hangupCall2(caseName, done, callId);
                        })
                        .catch(error => {
                            console.log(`${caseName} error,case faild,error:${toString(error)}`);
                            expect().assertFail();
                            hangupCall2(caseName, done, callId);
                        });
                })
                .catch(error => {
                    console.log(`${caseName} scenceInCalling error,case failed,error:${toString(error)}`);
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
     * @tc.number  Telephony_CallManager_cancelMuted_Promise_0200
     * @tc.name    Dial a number after the call is accepted,
     *             run function cancelMuted by promise,
     *             the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_cancelMuted_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_cancelMuted_Promise_0200';
        try {
            let data = await scenceInCalling({
                caseName:caseName,
                phoneNumber:AUTO_ACCEPT_NUMBER,
                checkState:CALL_STATUS_ACTIVE
            });
            let callId = data.callId;
            call.cancelMuted()
                .then(data => {
                    console.log(`${caseName} success,case success,data:${toString(data)}`);
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
     * @tc.number  Telephony_CallManager_cancelMuted_Promise_0300
     * @tc.name    Unwanted state,run function cancelMuted by promise,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_cancelMuted_Promise_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_cancelMuted_Promise_0300';
        call.cancelMuted()
            .then(data => {
                console.log(`${caseName} success,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
            });
    });

});
