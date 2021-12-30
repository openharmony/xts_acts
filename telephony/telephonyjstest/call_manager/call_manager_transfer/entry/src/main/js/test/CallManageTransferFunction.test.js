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

import {describe, afterAll, it, expect} from 'deccjsunit/index';
import {
    TRANSFER_ENABLE,
    TRANSFER_DISABLE,
    TRANSFER_INVALID,
    TRANSFER_INVALID5,
    TRANSFER_TYPE_UNCONDITIONAL,
    TRANSFER_TYPE_BUSY,
    TRANSFER_TYPE_NO_REPLY,
    TRANSFER_TYPE_NOT_REACHABLE,
    TRANSFER_TYPE_INVALID,
    TRANSFER_TYPE_INVALID4,
    DEFAULT_SLOT_ID,
    SLOT_ID1,
    SLOT_ID_INVALID,
    SLOT_ID_INVALID_2,
    PHONE_NUMBER_LENGTH_11,
    PHONE_NUMBER_LENGTH_8,
    PHONE_NUMBER_AREA_LAND,
    PHONE_NUMBER_VOICE_MAIL,
    PHONE_NUMBER_LONG,
    NULL_PHONE_NUMBER,
    TRANSFERSETTING_ENABLE,
    TRANSFERSETTING_DISABLE,
    TRANSFERSETTING_REGISTRATION,
    TRANSFER_INVALID2,
    TRANSFERSETTING_ERASURE
} from './lib/Const.js';
import {toString} from './lib/ApiToPromise.js';
import {scenceTransferCalling, scenceTransferCancel} from './lib/ScenceTransfer.js';
describe('CallManagementCallTransfer', function () {
    beforeAll(async function () {
        call.on('callDetailsChange', (err, callStateInfo) => {
            console.log(`Telephony_CallManager callDetailsChange error ${toString(err)}` +
          `,callStateInfo ${toString(callStateInfo)}`);
        });
    });

    afterAll(function () {
        console.log('Telephony_CallManager all 62 case is over for callmanager CallManagementCallTransfer');
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0100
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_VOICE_MAIL by callback,the function return void,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0100';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_ENABLE,
            type:TRANSFER_TYPE_BUSY,
            phoneNumber:PHONE_NUMBER_VOICE_MAIL
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0200
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_LONG by callback,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0200';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_ENABLE,
            type:TRANSFER_TYPE_BUSY,
            phoneNumber:PHONE_NUMBER_LONG
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error, case success,error ${error.message}`);
                expect(true).assertTrue();
                done();
                return;
            }
            console.log(`${caseName} case failed, result =${toString(data)}`);
            expect().assertFail();
            done();

        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0300
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum NULL_PHONE_NUMBER' by callback,the function return error,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0300';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_ENABLE,
            type:TRANSFER_TYPE_BUSY,
            phoneNumber:NULL_PHONE_NUMBER
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,error:${toString(error)}`);
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} scenceTransferCancel success,case ${error ? 'success' : 'failed'}`);
                expect(!!error).assertTrue();
                done();
            }).catch(error => {
                console.log(`${caseName} scenceTransferCancel error,case failed`);
                expect().assertFail();
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0400
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_VOICE_MAIL by callback,the function return void,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0400';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_DISABLE,
            type:TRANSFER_TYPE_BUSY,
            phoneNumber:PHONE_NUMBER_VOICE_MAIL
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error, case failed, ${error.message}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0500
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_8 by callback,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0500';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_ENABLE,
            type:TRANSFER_TYPE_NO_REPLY,
            phoneNumber:PHONE_NUMBER_LENGTH_8
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error, case failed ${error.message}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });

        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0600
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by callback,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0600', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0600';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_DISABLE,
            type:TRANSFER_TYPE_NO_REPLY,
            phoneNumber:PHONE_NUMBER_LENGTH_11
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error, case failed,error ${error.message}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });

        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0700
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum PHONE_NUMBER_LENGTH_8 by callback,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0700';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_ENABLE,
            type:TRANSFER_TYPE_NOT_REACHABLE,
            phoneNumber:PHONE_NUMBER_LENGTH_8
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error, case failed,error ${error.message}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });

        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0800
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum PHONE_NUMBER_LENGTH_8 by callback,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0800';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_DISABLE,
            type:TRANSFER_TYPE_NOT_REACHABLE,
            phoneNumber:PHONE_NUMBER_LENGTH_8
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error, case failed,${error.message}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });

        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_0900
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_AREA_LAND by callback,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_0900', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_0900';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_ENABLE,
            type:TRANSFER_TYPE_UNCONDITIONAL,
            phoneNumber:PHONE_NUMBER_AREA_LAND
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error, case failed ${error.message}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });

        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_1000
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_AREA_LAND by callback,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_1000', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_1000';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_DISABLE,
            type:TRANSFER_TYPE_UNCONDITIONAL,
            phoneNumber:PHONE_NUMBER_AREA_LAND
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error, case failed ${error.message}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });

        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_1300
     * @tc.name    Run function setCallTransfer by args slotId SLOT_ID_INVALID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_1300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_1300';
        call.setCallTransfer(SLOT_ID_INVALID, {
            settingType:TRANSFERSETTING_DISABLE,
            type:TRANSFER_TYPE_NO_REPLY,
            phoneNumber:PHONE_NUMBER_LENGTH_11
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} case success, error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_1400
     * @tc.name    Run function setCallTransfer by args slotId SLOT_ID_INVALID_2,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_1400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_1400';
        call.setCallTransfer(SLOT_ID_INVALID_2, {
            settingType:TRANSFERSETTING_DISABLE,
            type:TRANSFER_TYPE_NO_REPLY,
            phoneNumber:PHONE_NUMBER_LENGTH_11
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} case success, error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
            done();

        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_1500
     * @tc.name    Run function setCallTransfer by args slotId SLOT_ID1,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by callback,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             type TRANSFER_TYPE_NO_REPLY  by callback,the function return
     *             {status:TRANSFER_DISABLE,type:TRANSFER_TYPE_NO_REPLY},last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_1500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_1500';
        call.setCallTransfer(SLOT_ID1, {
            settingType:TRANSFERSETTING_ENABLE,
            type:TRANSFER_TYPE_NO_REPLY,
            phoneNumber:PHONE_NUMBER_LENGTH_11
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} setCallTransfer error,error:${toString(error)}`);
                call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NO_REPLY, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,case failed, error,` +
                            ` error:${toString(error)}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    const flag = data && data.status === TRANSFER_DISABLE && data.type === TRANSFER_TYPE_NO_REPLY;
                    expect(flag).assertTrue();
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                });
            } else {
                expect().assertFail();
                console.log(`${caseName} data,case failed,data:${toString(data)}`);
                scenceTransferCancel(caseName).then(data => {
                    done();
                }).catch(error => {
                    done();
                });
            }
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_1600
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFER_INVALID,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_1600', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_1600';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFER_INVALID,
            type:TRANSFER_TYPE_NO_REPLY,
            phoneNumber:PHONE_NUMBER_LENGTH_11
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} case success, error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_1700
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_INVALID,transferNum PHONE_NUMBER_LENGTH_11 by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_1700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_1700';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_DISABLE,
            type:TRANSFER_TYPE_INVALID,
            phoneNumber:PHONE_NUMBER_LENGTH_11
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} case success, error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_1800
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by callback,
     *             the function return void,then Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_NO_REPLY,transferNum
     *             PHONE_NUMBER_AREA_LAND by callback,the function return void,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_1800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_1800';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_ENABLE,
            type:TRANSFER_TYPE_NO_REPLY,
            phoneNumber:PHONE_NUMBER_LENGTH_11
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} data:${toString(data)}`);
            call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_DISABLE,
                type:TRANSFER_TYPE_NO_REPLY,
                phoneNumber:PHONE_NUMBER_AREA_LAND
            }, (error, data) => {
                if (error) {
                    console.log(`${caseName} error,error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = !!data;
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    expect(flag).assertTrue();
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Async_1900
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_REGISTRATION,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by callback,
     *             the function return void last cancel trnsfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Async_1900', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Async_1900';
        call.setCallTransfer(DEFAULT_SLOT_ID, {
            settingType:TRANSFERSETTING_REGISTRATION,
            type:TRANSFER_TYPE_NO_REPLY,
            phoneNumber:PHONE_NUMBER_LENGTH_11
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceTransferCancel(caseName).then(data => {
                console.log(`${caseName} success,case success`);
                done();
            }).catch(error => {
                console.log(`${caseName} error,case failed`);
                expect().assertFail();
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0100
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_VOICE_MAIL by callback,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0100';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_ENABLE,
                type:TRANSFER_TYPE_BUSY,
                phoneNumber:PHONE_NUMBER_VOICE_MAIL
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case success, data:${toString(data)}`);
        } catch (err) {
            console.log(`${caseName} case failed,err:${toString(err)}`);
            expect().assertFail();
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0200
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_LONG by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0200';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_ENABLE,
                type:TRANSFER_TYPE_BUSY,
                phoneNumber:PHONE_NUMBER_LONG
            });
            console.log(`${caseName} case failed, data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success, err:${toString(err)}`);
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0300
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum NULL_PHONE_NUMBER by callback,the function return error,
     *             last cancel transfer,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0300';
        let flag = true;
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_ENABLE,
                type:TRANSFER_TYPE_BUSY,
                phoneNumber:NULL_PHONE_NUMBER
            });
            flag = false;
            console.log(`${caseName} success,data ${toString(data)}`);
        } catch (err) {
            flag = true;
            console.log(`${caseName} error,error ${toString(err)}`);
        }
        try {
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
            expect(flag).assertTrue();
        } catch (error) {
            console.log(`${caseName} case failed,error ${toString(error)}`);
            expect().assertFail();
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0400
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_VOICE_MAIL by callback,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0400';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_DISABLE,
                type:TRANSFER_TYPE_BUSY,
                phoneNumber:PHONE_NUMBER_VOICE_MAIL
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case success,data ${toString(data)}`);
        } catch (err) {
            console.log(`${caseName} case failed,err ${toString(err)}`);
            expect().assertFail();
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0500
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by promise,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0500';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_ENABLE,
                type:TRANSFER_TYPE_NO_REPLY,
                phoneNumber:PHONE_NUMBER_LENGTH_11
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case success,data ${toString(data)}`);
        } catch (err) {
            console.log(`${caseName} case failed, err ${toString(err)}`);
            expect().assertFail();
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0600
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by promise,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0600', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0600';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_DISABLE,
                type:TRANSFER_TYPE_NO_REPLY,
                phoneNumber:PHONE_NUMBER_LENGTH_11
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case success,data ${toString(data)}`);
        } catch (err) {
            console.log(`${caseName} case failed,err ${toString(err)}`);
            expect().assertFail();
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0700
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum PHONE_NUMBER_LENGTH_8 by promise,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0700';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_ENABLE,
                type:TRANSFER_TYPE_NOT_REACHABLE,
                phoneNumber:PHONE_NUMBER_LENGTH_8
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case success, data ${toString(data)}`);
        } catch (err) {
            console.log(`${caseName} case failed,err ${toString(err)}`);
            expect().assertFail();
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0800
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum PHONE_NUMBER_LENGTH_8 by promise,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0800';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_DISABLE,
                type:TRANSFER_TYPE_NOT_REACHABLE,
                phoneNumber:PHONE_NUMBER_LENGTH_8
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case success,data ${toString(data)}`);
        } catch (err) {
            console.log(`${caseName} case failed,err ${toString(err)}`);
            expect().assertFail();
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_0900
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_AREA_LAND by promise,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_0900', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_0900';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_ENABLE,
                type:TRANSFER_TYPE_UNCONDITIONAL,
                phoneNumber:PHONE_NUMBER_AREA_LAND
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} success,case success,data:${toString(data)}`);
        } catch (error) {
            console.log(`${caseName} error,case failed,error:${error}`);
            expect().assertFail();
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_1000
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_AREA_LAND by promise,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_1000', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_1000';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_DISABLE,
                type:TRANSFER_TYPE_UNCONDITIONAL,
                phoneNumber:PHONE_NUMBER_AREA_LAND
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case success,data:${toString(data)}`);
        } catch (error) {
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
            expect().assertFail();
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_1300
     * @tc.name    Run function setCallTransfer by args slotId SLOT_ID_INVALID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_AREA_LAND by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_1300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_1300';
        try {
            let data = await call.setCallTransfer(SLOT_ID_INVALID, {
                settingType:TRANSFERSETTING_DISABLE,
                type:TRANSFER_TYPE_UNCONDITIONAL,
                phoneNumber:PHONE_NUMBER_AREA_LAND
            });
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success, err:${toString(err)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_1400
     * @tc.name    Run function setCallTransfer by args slotId SLOT_ID_INVALID_2,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_AREA_LAND by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_1400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_1400';
        try {
            let data = await call.setCallTransfer(SLOT_ID_INVALID_2, {
                settingType:TRANSFERSETTING_DISABLE,
                type:TRANSFER_TYPE_UNCONDITIONAL,
                phoneNumber:PHONE_NUMBER_AREA_LAND
            });
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success, err:${toString(err)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_1500
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by promise,
     *             then run function setCallTransfer by args slotId SLOT_ID1,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by promise,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             type TRANSFER_TYPE_NO_REPLY  by promise,the function return
     *             {status:TRANSFER_DISABLE,type:TRANSFER_TYPE_NO_REPLY},last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_1500', 0, async function () {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_1500';
        let flag = true;
        try {
            await call.setCallTransfer(SLOT_ID1, {
                settingType:TRANSFERSETTING_ENABLE,
                type:TRANSFER_TYPE_NO_REPLY,
                phoneNumber:PHONE_NUMBER_LENGTH_11
            });
            flag = false;
        } catch (err) {
            console.log(`${caseName} setCallTransfer error,error:${toString(err)}`);
        }
        if (!flag) {
            try {
                let data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NO_REPLY);
                flag = data.status === TRANSFER_DISABLE && data.type === TRANSFER_TYPE_NO_REPLY;
                expect(flag).assertTrue();
                console.log(`${caseName} getCallTransferInfo success,case` +
                ` ${flag ? 'success' : 'failed'},data:${toString(data)}`);
            } catch (error) {
                expect().assertFail();
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
            }
        } else {
            expect().assertFail();
            console.log(`${caseName} error,case failed`);
            try {
                await scenceTransferCancel(caseName);
            } catch (error) {
                console.log(`${caseName}  scenceTransferCancel error ${toString(error)}`);
            }
        }
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_1600
     * @tc.name    Run function setCallTransfer by args slotId SLOT_ID1,settingType TRANSFER_INVALID5,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_AREA_LAND by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_1600', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_1600';
        try {
            let data = await call.setCallTransfer(SLOT_ID1, {
                settingType:TRANSFER_INVALID5,
                type:TRANSFER_TYPE_UNCONDITIONAL,
                phoneNumber:PHONE_NUMBER_AREA_LAND
            });
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success, err:${toString(err)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_1700
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_INVALID4,transferNum PHONE_NUMBER_AREA_LAND by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_1700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_1700';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_ENABLE,
                type:TRANSFER_TYPE_INVALID4,
                phoneNumber:PHONE_NUMBER_AREA_LAND
            });
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success,err:${toString(err)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_1800
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFER_INVALID2,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_AREA_LAND by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_1800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_1800';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFER_INVALID2,
                type:TRANSFER_TYPE_UNCONDITIONAL,
                phoneNumber:PHONE_NUMBER_AREA_LAND
            });
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success, err:${toString(err)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallTransfer_Promise_1900
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ERASURE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 by promise,
     *             the function return void,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallTransfer_Promise_1900', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallTransfer_Promise_1900';
        try {
            let data = await call.setCallTransfer(DEFAULT_SLOT_ID, {
                settingType:TRANSFERSETTING_ERASURE,
                type:TRANSFER_TYPE_NO_REPLY,
                phoneNumber:PHONE_NUMBER_LENGTH_11
            });
            await scenceTransferCancel(caseName);
            console.log(`${caseName} case success, data:${toString(data)}`);
        } catch (err) {
            console.log(`${caseName} case failed,error:${toString(err)}`);
            expect().assertFail();
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0100
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum NULL_PHONE_NUMBER to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_BUSY by callback,
     *             the function return status TRANSFER_ENABLE,number NULL_PHONE_NUMBER,type TRANSFER_TYPE_BUSY,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0100';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE, TRANSFER_TYPE_BUSY,
                NULL_PHONE_NUMBER);
            console.log(`${caseName} scenceTransferCalling success`);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_BUSY, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallTransferInfo error. error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_DISABLE && data.number === NULL_PHONE_NUMBER &&
                    data.type === TRANSFER_TYPE_BUSY;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            });
        } catch (err) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(err)}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0200
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_VOICE_MAIL to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_BUSY  by callback,
     *             the function return status TRANSFER_ENABLE,number PHONE_NUMBER_VOICE_MAIL,type TRANSFER_TYPE_BUSY,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0200';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_BUSY, PHONE_NUMBER_VOICE_MAIL);
            console.log(`${caseName} scenceTransferCalling success`);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_BUSY, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallTransferInfo error. error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_ENABLE && data.number === PHONE_NUMBER_VOICE_MAIL &&
          data.type === TRANSFER_TYPE_BUSY;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            });
        } catch (err) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(err)}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0300
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_VOICE_MAIL to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_BUSY  by callback,
     *             the function return status TRANSFER_DISABLE,number PHONE_NUMBER_VOICE_MAIL,type TRANSFER_TYPE_BUSY,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0300';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_DISABLE,
                TRANSFER_TYPE_BUSY, PHONE_NUMBER_VOICE_MAIL);
            console.log(`${caseName} scenceTransferCalling success`);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_BUSY, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallTransferInfo error. error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_DISABLE && data.number === PHONE_NUMBER_VOICE_MAIL &&
          data.type === TRANSFER_TYPE_BUSY;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });

            });
        } catch (err) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(err)}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0400
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum NULL_PHONE_NUMBER to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_NO_REPLY  by callback,
     *             the function return status TRANSFER_ENABLE,number NULL_PHONE_NUMBER,type TRANSFER_TYPE_NO_REPLY,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0400';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_NO_REPLY, NULL_PHONE_NUMBER);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NO_REPLY, (error, data) => {
                if (error) {
                    console.log(`${caseName} error,error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_DISABLE && data.number === NULL_PHONE_NUMBER &&
                    data.type === TRANSFER_TYPE_NO_REPLY;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            });
        } catch (error) {
            console.log(`${caseName} scenceTransferCalling error, case failed.` +
                `error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0500
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_NO_REPLY  by callback,
     *             the function return status TRANSFER_ENABLE,number PHONE_NUMBER_LENGTH_11,
     *             type TRANSFER_TYPE_NO_REPLY,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0500';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_NO_REPLY, PHONE_NUMBER_LENGTH_11);
            console.log(`${caseName} scenceTransferCalling success`);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NO_REPLY, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallTransferInfo error. error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_ENABLE && data.number === PHONE_NUMBER_LENGTH_11 &&
          data.type === TRANSFER_TYPE_NO_REPLY;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            });
        } catch (err) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(err)}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0600
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_NO_REPLY  by callback,
     *             the function return status TRANSFER_DISABLE,number PHONE_NUMBER_LENGTH_11,
     *             type TRANSFER_TYPE_NO_REPLY,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0600', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0600';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_DISABLE,
                TRANSFER_TYPE_NO_REPLY, PHONE_NUMBER_LENGTH_11);
            console.log(`${caseName} scenceTransferCalling success`);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NO_REPLY, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallTransferInfo error. error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_DISABLE && data.number === PHONE_NUMBER_LENGTH_11 &&
          data.type === TRANSFER_TYPE_NO_REPLY;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });

            });
        } catch (err) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(err)}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0700
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum NULL_PHONE_NUMBER to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_NOT_REACHABLE  by callback,
     *             the function return status TRANSFER_DISABLE,number NULL_PHONE_NUMBER,
     *             type TRANSFER_TYPE_NOT_REACHABLE,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0700';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_NOT_REACHABLE, NULL_PHONE_NUMBER);
            console.log(`${caseName} scenceTransferCalling success`);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NOT_REACHABLE, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallTransferInfo error. error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_DISABLE && data.number === NULL_PHONE_NUMBER &&
          data.type === TRANSFER_TYPE_NOT_REACHABLE;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });

            });
        } catch (err) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(err)}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0800
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum PHONE_NUMBER_AREA_LAND to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_NOT_REACHABLE  by callback,
     *             the function return status TRANSFER_ENABLE,number PHONE_NUMBER_AREA_LAND,
     *             type TRANSFER_TYPE_NOT_REACHABLE,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0800';
        try {
            var data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_NOT_REACHABLE, PHONE_NUMBER_AREA_LAND);
            console.log(`${caseName} scenceTransferCalling success`);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NOT_REACHABLE, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallTransferInfo error. error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_ENABLE && data.number === PHONE_NUMBER_AREA_LAND &&
          data.type === TRANSFER_TYPE_NOT_REACHABLE;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });

            });
        } catch (err) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(err)}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_0900
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum PHONE_NUMBER_AREA_LAND to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_NOT_REACHABLE  by callback,
     *             the function return status TRANSFER_DISABLE,number PHONE_NUMBER_AREA_LAND,
     *             type TRANSFER_TYPE_NOT_REACHABLE,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_0900', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_0900';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_DISABLE, TRANSFER_TYPE_NOT_REACHABLE,
                PHONE_NUMBER_AREA_LAND);
            console.log(`${caseName} scenceTransferCalling success`);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NOT_REACHABLE, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallTransferInfo error. error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data.status === TRANSFER_DISABLE && data.number === PHONE_NUMBER_AREA_LAND &&
          data.type === TRANSFER_TYPE_NOT_REACHABLE;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });

            });
        } catch (err) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(err)}`);
            expect().assertFail();
            done();

        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_1000
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum NULL_PHONE_NUMBER to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_UNCONDITIONAL  by callback,
     *             the function return status TRANSFER_DISABLE,number NULL_PHONE_NUMBER,
     *             type TRANSFER_TYPE_UNCONDITIONAL,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_1000', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_1000';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE, TRANSFER_TYPE_UNCONDITIONAL,
                NULL_PHONE_NUMBER);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_UNCONDITIONAL, (error, data) => {
                if (error) {
                    console.log(`${caseName} error,error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_DISABLE && data.number === NULL_PHONE_NUMBER &&
        data.type === TRANSFER_TYPE_UNCONDITIONAL;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            });
        } catch (error) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_1100
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_LENGTH_8 to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_UNCONDITIONAL  by callback,
     *             the function return status TRANSFER_ENABLE,number PHONE_NUMBER_LENGTH_8,
     *             type TRANSFER_TYPE_UNCONDITIONAL,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_1100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_1100';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_UNCONDITIONAL, PHONE_NUMBER_LENGTH_8);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_UNCONDITIONAL, (error, data) => {
                if (error) {
                    console.log(`${caseName} error,error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data && data.status === TRANSFER_ENABLE && data.number === PHONE_NUMBER_LENGTH_8 &&
        data.type === TRANSFER_TYPE_UNCONDITIONAL;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            });
        } catch (error) {
            console.log(`${caseName} scenceTransferCalling error, case failed.` +
                ` error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_1200
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_LENGTH_8 to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_UNCONDITIONAL  by callback,
     *             the function return status TRANSFER_DISABLE,number PHONE_NUMBER_LENGTH_8,
     *             type TRANSFER_TYPE_UNCONDITIONAL,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_1200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_1200';
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_DISABLE,
                TRANSFER_TYPE_UNCONDITIONAL, PHONE_NUMBER_LENGTH_8);
            call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_UNCONDITIONAL, (error, data) => {
                if (error) {
                    console.log(`${caseName} error,error:${toString(error)}`);
                    expect().assertFail();
                }
                const flag = data.status === TRANSFER_DISABLE && data.number === PHONE_NUMBER_LENGTH_8 &&
        data.type === TRANSFER_TYPE_UNCONDITIONAL;
                expect(flag).assertTrue();
                scenceTransferCancel(caseName).then(data => {
                    console.log(`${caseName} success,case ${flag ? 'success' : 'failed'}`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            });
        } catch (error) {
            console.log(`${caseName} scenceTransferCalling error, case failed. error:${toString(error)}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_1500
     * @tc.name    Run function getCallTransferInfo by args slotId SLOT_ID_INVALID,
     *             type TRANSFER_TYPE_UNCONDITIONAL  by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_1500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_1500';
        call.getCallTransferInfo(SLOT_ID_INVALID, TRANSFER_TYPE_UNCONDITIONAL, (error, data) => {
            if (error) {
                console.log(`${caseName} getCallTransferInfo error, case success. error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} getCallTransferInfo success,case failed,data:${toString(data)}`);
            expect().assertFail();
            done();

        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_1600
     * @tc.name    Run function getCallTransferInfo by args slotId SLOT_ID_INVALID_2,
     *             type TRANSFER_TYPE_UNCONDITIONAL  by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_1600', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_1600';
        call.getCallTransferInfo(SLOT_ID_INVALID_2, TRANSFER_TYPE_UNCONDITIONAL, (error, data) => {
            if (error) {
                console.log(`${caseName} getCallTransferInfo error, case success. error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} getCallTransferInfo success,case failed,data:${toString(data)}`);
            expect().assertFail();
            done();

        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_1700
     * @tc.name    Run function getCallTransferInfo by args slotId SLOT_ID1,
     *             type TRANSFER_TYPE_UNCONDITIONAL  by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_1700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_1700';
        call.getCallTransferInfo(SLOT_ID1, TRANSFER_TYPE_UNCONDITIONAL, (error, data) => {
            if (error) {
                console.log(`${caseName} getCallTransferInfo error, case success. error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} getCallTransferInfo success,case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Async_1800
     * @tc.name    Run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             type TRANSFER_TYPE_INVALID  by callback,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Async_1800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Async_1800';
        call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_INVALID, (error, data) => {
            if (error) {
                console.log(`${caseName} getCallTransferInfo error, case success. error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} getCallTransferInfo success,case failed,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_0100
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum NULL_PHONE_NUMBER to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_BUSY by promise,
     *             the function return status TRANSFER_DISABLE,number NULL_PHONE_NUMBER,type TRANSFER_TYPE_BUSY,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0100';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE, TRANSFER_TYPE_BUSY,
                NULL_PHONE_NUMBER);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_BUSY);
            flag = data.status === TRANSFER_DISABLE && data.number === NULL_PHONE_NUMBER &&
        data.type === TRANSFER_TYPE_BUSY;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_0200
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_VOICE_MAIL to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_BUSY by promise,
     *             the function return status TRANSFER_ENABLE,number PHONE_NUMBER_VOICE_MAIL,type TRANSFER_TYPE_BUSY,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0200';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_BUSY, PHONE_NUMBER_VOICE_MAIL);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_BUSY);
            flag = data.status === TRANSFER_ENABLE && data.number === PHONE_NUMBER_VOICE_MAIL &&
        data.type === TRANSFER_TYPE_BUSY;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_0300
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_BUSY,transferNum PHONE_NUMBER_VOICE_MAIL to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_BUSY by promise,
     *             the function return status TRANSFER_DISABLE,number PHONE_NUMBER_VOICE_MAIL,type TRANSFER_TYPE_BUSY,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0300';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFER_DISABLE,
                TRANSFER_TYPE_BUSY, PHONE_NUMBER_VOICE_MAIL);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_BUSY);
            flag = data.status === TRANSFER_DISABLE && data.number === PHONE_NUMBER_VOICE_MAIL &&
        data.type === TRANSFER_TYPE_BUSY;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_0400
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum NULL_PHONE_NUMBER to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_NO_REPLY by promise,
     *             the function return status TRANSFER_DISABLE,number NULL_PHONE_NUMBER,type TRANSFER_TYPE_NO_REPLY,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0400';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_NO_REPLY, NULL_PHONE_NUMBER);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NO_REPLY);
            flag = data.status === TRANSFER_DISABLE && data.number === NULL_PHONE_NUMBER &&
        data.type === TRANSFER_TYPE_NO_REPLY;

        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();

    });

    /**
     * @tc.number   Telephony_CallManager_getCallTransferInfo_Promise_0500
     * @tc.name     Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *              type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 to set,
     *              then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *              settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_NO_REPLY by promise,
     *              the function return status TRANSFER_ENABLE,number PHONE_NUMBER_LENGTH_11,
     *              type TRANSFER_TYPE_NO_REPLY,last cancel transfer
     * @tc.type     Function
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0500';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_NO_REPLY, PHONE_NUMBER_LENGTH_11);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NO_REPLY);
            flag = data.status === TRANSFER_ENABLE && data.number === PHONE_NUMBER_LENGTH_11 &&
        data.type === TRANSFER_TYPE_NO_REPLY;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_0600
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NO_REPLY,transferNum PHONE_NUMBER_LENGTH_11 to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_NO_REPLY by promise,
     *             the function return status TRANSFER_DISABLE,number PHONE_NUMBER_LENGTH_11,
     *             type TRANSFER_TYPE_NO_REPLY,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0600', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0600';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_DISABLE,
                TRANSFER_TYPE_NO_REPLY, PHONE_NUMBER_LENGTH_11);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NO_REPLY);
            flag = data.status === TRANSFER_DISABLE && data.number === PHONE_NUMBER_LENGTH_11 &&
        data.type === TRANSFER_TYPE_NO_REPLY;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_0700
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum NULL_PHONE_NUMBER to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_NOT_REACHABLE by promise,
     *             the function return status TRANSFER_DISABLE,number NULL_PHONE_NUMBER,
     *             type TRANSFER_TYPE_NOT_REACHABLE,
     *             last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0700';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_NOT_REACHABLE, NULL_PHONE_NUMBER);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NOT_REACHABLE);
            flag = data.status === TRANSFER_DISABLE && data.number === NULL_PHONE_NUMBER &&
        data.type === TRANSFER_TYPE_NOT_REACHABLE;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_0800
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum PHONE_NUMBER_AREA_LAND to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_NOT_REACHABLE by promise,
     *             the function return status TRANSFER_ENABLE,number PHONE_NUMBER_AREA_LAND,
     *             type TRANSFER_TYPE_NOT_REACHABLE.last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0800';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_NOT_REACHABLE, PHONE_NUMBER_AREA_LAND);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NOT_REACHABLE);
            flag = data.status === TRANSFER_ENABLE && data.number === PHONE_NUMBER_AREA_LAND &&
        data.type === TRANSFER_TYPE_NOT_REACHABLE;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_0900
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_NOT_REACHABLE,transferNum PHONE_NUMBER_AREA_LAND to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_NOT_REACHABLE by promise,
     *             the function return status TRANSFER_DISABLE,number PHONE_NUMBER_AREA_LAND,
     *             type TRANSFER_TYPE_NOT_REACHABLE,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_0900', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_0900';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_DISABLE,
                TRANSFER_TYPE_NOT_REACHABLE, PHONE_NUMBER_AREA_LAND);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_NOT_REACHABLE);
            flag = data.status === TRANSFER_DISABLE && data.number === PHONE_NUMBER_AREA_LAND &&
        data.type === TRANSFER_TYPE_NOT_REACHABLE;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_1000
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum NULL_PHONE_NUMBER to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_UNCONDITIONAL by promise,
     *             the function return status TRANSFER_DISABLE,number NULL_PHONE_NUMBER,
     *             type TRANSFER_TYPE_UNCONDITIONAL,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_1000', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_1000';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE, TRANSFER_TYPE_UNCONDITIONAL,
                NULL_PHONE_NUMBER);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_UNCONDITIONAL);
            flag = data.status === TRANSFER_DISABLE && data.number === NULL_PHONE_NUMBER &&
        data.type === TRANSFER_TYPE_UNCONDITIONAL;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_1100
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_ENABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_LENGTH_8 to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_ENABLE,type TRANSFER_TYPE_UNCONDITIONAL by promise,
     *             the function return status TRANSFER_ENABLE,number PHONE_NUMBER_LENGTH_8,
     *             type TRANSFER_TYPE_UNCONDITIONAL,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_1100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_1100';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_ENABLE,
                TRANSFER_TYPE_UNCONDITIONAL, PHONE_NUMBER_LENGTH_8);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_UNCONDITIONAL);
            flag = data.status === TRANSFER_ENABLE && data.number === PHONE_NUMBER_LENGTH_8 &&
        data.type === TRANSFER_TYPE_UNCONDITIONAL;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_1200
     * @tc.name    Run function setCallTransfer by args slotId DEFAULT_SLOT_ID,settingType TRANSFERSETTING_DISABLE,
     *             type TRANSFER_TYPE_UNCONDITIONAL,transferNum PHONE_NUMBER_LENGTH_8 to set,
     *             then run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             settingType TRANSFERSETTING_DISABLE,type TRANSFER_TYPE_UNCONDITIONAL by promise,
     *             the function return status TRANSFER_DISABLE,number PHONE_NUMBER_LENGTH_8,
     *             type TRANSFER_TYPE_UNCONDITIONAL,last cancel transfer
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_1200', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_1200';
        let flag = true;
        try {
            let data = await scenceTransferCalling(caseName, TRANSFERSETTING_DISABLE,
                TRANSFER_TYPE_UNCONDITIONAL, PHONE_NUMBER_LENGTH_8);
            console.log(`${caseName} scenceTransferCalling : data = ${toString(data)}`);
            data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_UNCONDITIONAL);
            flag = data.status === TRANSFER_DISABLE && data.number === PHONE_NUMBER_LENGTH_8 &&
        data.type === TRANSFER_TYPE_UNCONDITIONAL;
        } catch (error) {
            flag = false;
        }
        try {
            await scenceTransferCancel(caseName);
            expect(flag).assertTrue();
            console.log(`${caseName} case ${flag ? 'success' : 'failed'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_1500
     * @tc.name    Run function getCallTransferInfo by args slotId SLOT_ID_INVALID,
     *             type TRANSFER_TYPE_NOT_REACHABLE by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_1500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_1500';
        try {
            var data = await call.getCallTransferInfo(SLOT_ID_INVALID, TRANSFER_TYPE_NOT_REACHABLE);
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success. error:${toString(err)}`);
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_1600
     * @tc.name    Run function getCallTransferInfo by args slotId SLOT_ID_INVALID_2,
     *             type TRANSFER_TYPE_NOT_REACHABLE by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_1600', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_1600';
        try {
            var data = await call.getCallTransferInfo(SLOT_ID_INVALID_2, TRANSFER_TYPE_NOT_REACHABLE);
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success. error:${toString(err)}`);
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_1700
     * @tc.name    Run function getCallTransferInfo by args slotId SLOT_ID1,
     *             type TRANSFER_TYPE_UNCONDITIONAL by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_1700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_1700';
        try {
            var data = await call.getCallTransferInfo(SLOT_ID1, TRANSFER_TYPE_UNCONDITIONAL);
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success. error:${toString(err)}`);
        }
        done();

    });

    /**
     * @tc.number  Telephony_CallManager_getCallTransferInfo_Promise_1800
     * @tc.name    Run function getCallTransferInfo by args slotId DEFAULT_SLOT_ID,
     *             type TRANSFER_TYPE_INVALID4 by promise,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallTransferInfo_Promise_1800', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallTransferInfo_Promise_1800';
        try {
            var data = await call.getCallTransferInfo(DEFAULT_SLOT_ID, TRANSFER_TYPE_INVALID4);
            console.log(`${caseName} case failed,data:${toString(data)}`);
            expect().assertFail();
        } catch (err) {
            console.log(`${caseName} case success. error:${toString(err)}`);
        }
        done();
    });
});