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
    RESTRICTION_TYPE_ALL_INCOMING,
    RESTRICTION_MODE_ACTIVATION,
    RESTRICTION_TYPE_ROAMING_INCOMING,
    RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
    RESTRICTION_TYPE_INTERNATIONAL,
    RESTRICTION_TYPE_ALL_OUTGOING,
    RESTRICTION_MODE_DEACTIVATION,
    RESTRICTION_DISABLE,
    RESTRICTION_ENABLE,
    DEFAULT_SLOT_ID,
    SLOT_ID_INVALID_2,
    SLOT_ID_INVALID,
    ERROR_PASSWORD,
    RIGHT_PASSWORD,
    RESTRICTION_TYPE_ANONYMOUS,
    RESTRICTION_TYPE_SPECIFIC_INCOMING,
    RESTRICTION_TYPE_INCOMING_SERVICES,
    RESTRICTION_TYPE_OUTGOING_SERVICES,
    RESTRICTION_TYPE_ALL_CALLS,
    SLOT_ID1,
    RESTRICTION_MODE_INVALID,
    RESTRICTION_MODE_INVALID2,
    RESTRICTION_TYPE_INVALID8,
    RESTRICTION_TYPE_INVALID
} from './lib/Const.js';
import {toString} from './lib/ApiToPromise.js';
import {scenceLimitCalling, scenceLimitCancel} from './lib/ScenceLimitCalling.js';
describe('CallManagementCallRestriction', function () {
    beforeAll(async function () {
        call.on('callDetailsChange', (err, callStateInfo) => {
            console.log(`Telephony_CallManager callDetailsChange error ${toString(err)}` +
          `,callStateInfo ${toString(callStateInfo)}`);
        });
    });

    afterAll(function () {
        console.log('Telephony_CallManager all 88 case is over for callmanager CallManagementCallRestriction');
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0100
     * @tc.name    Run function setCallRestriction by callback by arg
     *             slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel the limit.
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0100';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_INCOMING).then(data => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0200
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATIO,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0200';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0300
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_INCOMING password ERROR_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATIO,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0300';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_INCOMING,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0400
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_OUTGOING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0400';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_OUTGOING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_OUTGOING).then(data => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0500
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_OUTGOING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0500';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_OUTGOING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0600
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_OUTGOING password ERROR_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0600';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_OUTGOING,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0700
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0700', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0700';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceLimitCancel(caseName, RESTRICTION_TYPE_INTERNATIONAL).then(data => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0800
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0800';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_0900
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL password ERROR_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_0900', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_0900';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_1000
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME
     *             password RIGHT_PASSWORD mode RESTRICTION_MODE_ACTIVATION,the function return void,
     *             last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_1000', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_1000';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceLimitCancel(caseName, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME).then(data => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_1100
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME
     *             password RIGHT_PASSWORD mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_1100', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_1100';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_1200
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME
     *             password ERROR_PASSWORD mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_1200', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_1200';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_1300
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_1300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_1300';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceLimitCancel(caseName, RESTRICTION_TYPE_ROAMING_INCOMING).then(data => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_1400
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_1400', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_1400';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_1500
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ROAMING_INCOMING password ERROR_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_1500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_1500';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_1800
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId that is SLOT_ID_INVALID type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_1800', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_1800';
        call.setCallRestriction(SLOT_ID_INVALID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_1900
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId that is SLOT_ID_INVALID_2 type RESTRICTION_TYPE_ROAMING_INCOMING
     *             password RIGHT_PASSWORD mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_1900', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_1900';
        call.setCallRestriction(SLOT_ID_INVALID_2, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_2000
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId SLOT_ID1 type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,then run function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_2000', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_2000';
        call.setCallRestriction(SLOT_ID1, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} setCallRestriction2 error:${toString(error)}`);
            } else {
                console.log(`${caseName} data,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
                return;
            }
            call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ROAMING_INCOMING, (error, data) => {
                if (error) {
                    console.log(`${caseName} getCallRestrictionStatus error,case failed,error:${toString(error)}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName} getCallRestrictionStatus success,case` +
                    ` ${data === RESTRICTION_DISABLE ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === RESTRICTION_DISABLE).assertTrue();
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_2100
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_INVALID,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_2100', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_2100';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_INVALID
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_2200
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INVALID password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_2200', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_2200';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INVALID,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_2300
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_CALLS password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_2300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_2300';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_CALLS,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_CALLS).then(data => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_2400
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_OUTGOING_SERVICES password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_2400', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_2400';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_OUTGOING_SERVICES,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceLimitCancel(caseName, RESTRICTION_TYPE_OUTGOING_SERVICES).then(data => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Async_2500
     * @tc.name    Run function setCallRestriction by callback
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INCOMING_SERVICES password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Async_2500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Async_2500';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INCOMING_SERVICES,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        }, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            scenceLimitCancel(caseName, RESTRICTION_TYPE_INCOMING_SERVICES).then(data => {
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0100
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0100';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_INCOMING).then(data => {
                    console.log(`${caseName} success,case success`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            })
            .catch((error) => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0200
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATIO,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0200';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0300
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_INCOMING password ERROR_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATIO,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0300';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_INCOMING,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0400
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_OUTGOING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0400';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_OUTGOING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_OUTGOING).then(data => {
                    console.log(`${caseName} success,case success`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            })
            .catch((error) => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0500
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_OUTGOING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0500';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_OUTGOING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0600
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_OUTGOING password ERROR_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0600';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_OUTGOING,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0700
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0700', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0700';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                scenceLimitCancel(caseName, RESTRICTION_TYPE_INTERNATIONAL).then(data => {
                    console.log(`${caseName} success,case success`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            })
            .catch((error) => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0800
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0800';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_0900
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL password ERROR_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_0900', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_0900';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_1000
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME
     *             password RIGHT_PASSWORD mode RESTRICTION_MODE_ACTIVATION,the function return void,
     *             last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_1000', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_1000';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                scenceLimitCancel(caseName, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME).then(data => {
                    console.log(`${caseName} success,case success`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            })
            .catch((error) => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_1100
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME
     *             password RIGHT_PASSWORD mode RESTRICTION_MODE_DEACTIVATION,the function return void,
     *             last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_1100', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_1100';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_1200
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME password
     *             ERROR_PASSWORD mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_1200', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_1200';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_1300
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return void,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_1300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_1300';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                scenceLimitCancel(caseName, RESTRICTION_TYPE_ROAMING_INCOMING).then(data => {
                    console.log(`${caseName} success,case success`);
                    done();
                }).catch(error => {
                    console.log(`${caseName} error,case failed`);
                    expect().assertFail();
                    done();
                });
            })
            .catch((error) => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_1400
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_1400', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_1400';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_1500
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ROAMING_INCOMING password ERROR_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_1500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_1500';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:ERROR_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_1800
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId that is SLOT_ID_INVALID type RESTRICTION_TYPE_ALL_OUTGOING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_1800', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_1800';
        call.setCallRestriction(SLOT_ID_INVALID, {
            type:RESTRICTION_TYPE_ALL_OUTGOING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_1900
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId that is SLOT_ID_INVALID_2 type RESTRICTION_TYPE_ALL_OUTGOING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_1900', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_1900';
        call.setCallRestriction(SLOT_ID_INVALID_2, {
            type:RESTRICTION_TYPE_ALL_OUTGOING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_2000
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId SLOT_ID1 type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,then run function getCallRestrictionStatus by promise
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_2000', 0, async function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_2000';
        try {
            await call.setCallRestriction(SLOT_ID1, {
                type:RESTRICTION_TYPE_ROAMING_INCOMING,
                password:RIGHT_PASSWORD,
                mode:RESTRICTION_MODE_ACTIVATION
            });
            console.log(`${caseName} setCallRestriction2 success`);
            expect().assertFail();
            done();
            return;
        } catch (err) {
            console.log(`${caseName} setCallRestriction1 error,error:${toString(err)}`);
        }
        try {
            let data = await call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ROAMING_INCOMING);
            console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                'success' : 'failed'},data:${toString(data)}`);
            expect(data === RESTRICTION_DISABLE).assertTrue();
        } catch (error) {
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
            expect().assertFail();
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_2100
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ROAMING_INCOMING password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_INVALID2,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_2100', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_2100';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ROAMING_INCOMING,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_INVALID2
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_2200
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INVALID8 password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_ACTIVATION,the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_2200', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_2200';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INVALID8,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_ACTIVATION
        })
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch((error) => {
                console.log(`${caseName} success,case ${error ? 'success' : 'failed'},error:${toString(error)}`);
                expect(!!error).assertTrue();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_2300
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_ALL_CALLS password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_2300', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_2300';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_ALL_CALLS,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_2400
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_OUTGOING_SERVICES password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_2400', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_2400';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_OUTGOING_SERVICES,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
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
     * @tc.number  Telephony_CallManager_setCallRestriction_Promise_2500
     * @tc.name    Run function setCallRestriction by promise
     *             by arg slotId DEFAULT_SLOT_ID type RESTRICTION_TYPE_INCOMING_SERVICES password RIGHT_PASSWORD
     *             mode RESTRICTION_MODE_DEACTIVATION,the function return void
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_setCallRestriction_Promise_2500', 0, function (done) {
        let caseName = 'Telephony_CallManager_setCallRestriction_Promise_2500';
        call.setCallRestriction(DEFAULT_SLOT_ID, {
            type:RESTRICTION_TYPE_INCOMING_SERVICES,
            password:RIGHT_PASSWORD,
            mode:RESTRICTION_MODE_DEACTIVATION
        })
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
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0100
     * @tc.name    Set RESTRICTION_TYPE_ALL_INCOMING RESTRICTION_MODE_ACTIVATION and run function
     *             getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID CallRestrictionType
     *             RESTRICTION_TYPE_ALL_INCOMING ,the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0100', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0100';
        let flag = true;
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ALL_INCOMING, RESTRICTION_MODE_ACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_INCOMING, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,error:${toString(error)}`);
                        expect().assertFail();
                        flag = false;
                    }
                    flag = data === RESTRICTION_ENABLE;
                    expect(flag).assertTrue();

                    scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_INCOMING).then(data => {
                        console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
                        done();
                    }).catch(error => {
                        console.log(`${caseName} error,case failed`);
                        expect().assertFail();
                        done();
                    });
                });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0200
     * @tc.name    Set RESTRICTION_TYPE_ALL_INCOMING RESTRICTION_MODE_DEACTIVATION and run function
     *             getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID CallRestrictionType
     *             RESTRICTION_TYPE_ALL_INCOMING ,the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0200';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ALL_INCOMING, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_INCOMING, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                        'success' : 'failed'},data:${toString(data)}`);
                    expect(data === RESTRICTION_DISABLE).assertTrue();
                    done();
                });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0300
     * @tc.name    Set RESTRICTION_TYPE_ALL_OUTGOING RESTRICTION_MODE_ACTIVATION and run function
     *             getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID CallRestrictionType
     *             RESTRICTION_TYPE_ALL_OUTGOING ,the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0300', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0300';
        let flag = true;
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ALL_OUTGOING, RESTRICTION_MODE_ACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_OUTGOING, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,error:${toString(error)}`);
                        expect().assertFail();
                        flag = false;
                    }
                    flag = data === RESTRICTION_ENABLE;
                    expect(flag).assertTrue();
                    scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_OUTGOING).then(data => {
                        console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
                        done();
                    }).catch(error => {
                        console.log(`${caseName} error,case failed`);
                        expect().assertFail();
                        done();
                    });
                });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0400
     * @tc.name    Set RESTRICTION_TYPE_ALL_OUTGOING RESTRICTION_MODE_DEACTIVATION and run function
     *             getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID CallRestrictionType
     *             RESTRICTION_TYPE_ALL_OUTGOING ,the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0400';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ALL_OUTGOING, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_OUTGOING, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                        'success' : 'failed'},data:${toString(data)}`);
                    expect(data === RESTRICTION_DISABLE).assertTrue();
                    done();
                });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0500
     * @tc.name    Set RESTRICTION_TYPE_INTERNATIONAL RESTRICTION_MODE_ACTIVATION and run function
     *             getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID CallRestrictionType
     *             RESTRICTION_TYPE_INTERNATIONAL ,the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0500', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0500';
        let flag = true;
        scenceLimitCalling(caseName, RESTRICTION_TYPE_INTERNATIONAL, RESTRICTION_MODE_ACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INTERNATIONAL, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,error:${toString(error)}`);
                        expect().assertFail();
                        flag = false;
                    }
                    flag = data === RESTRICTION_ENABLE;
                    expect(flag).assertTrue();
                    scenceLimitCancel(caseName, RESTRICTION_TYPE_INTERNATIONAL).then(data => {
                        console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
                        done();
                    }).catch(error => {
                        console.log(`${caseName} error,case failed`);
                        expect().assertFail();
                        done();
                    });
                });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0600
     * @tc.name    Set RESTRICTION_TYPE_INTERNATIONAL RESTRICTION_MODE_DEACTIVATION and run function
     *             getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID CallRestrictionType
     *             RESTRICTION_TYPE_INTERNATIONAL ,the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0600';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_INTERNATIONAL, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INTERNATIONAL, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                        'success' : 'failed'},data:${toString(data)}`);
                    expect(data === RESTRICTION_DISABLE).assertTrue();
                    done();
                });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0700
     * @tc.name    Set RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME RESTRICTION_MODE_ACTIVATION and run
     *             function getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID
     *             CallRestrictionType RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
     *             the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0700', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0700';
        let flag = true;
        scenceLimitCalling(caseName, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME, RESTRICTION_MODE_ACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
                    (error, data) => {
                        if (error) {
                            console.log(`${caseName} error,error:${toString(error)}`);
                            expect().assertFail();
                            flag = false;
                        }
                        flag = data === RESTRICTION_ENABLE;
                        expect(flag).assertTrue();
                        scenceLimitCancel(caseName, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME).then(data => {
                            console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
                            done();
                        }).catch(error => {
                            console.log(`${caseName} error,case failed`);
                            expect().assertFail();
                            done();
                        });
                    });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0800
     * @tc.name    Set RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME RESTRICTION_MODE_DEACTIVATION
     *             and run function getCallRestrictionStatus by callback by arg slotId
     *             DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0800';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(
                    DEFAULT_SLOT_ID, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
                    (error, data) => {
                        if (error) {
                            console.log(`${caseName} error,case failed,error:${toString(error)}`);
                            expect().assertFail();
                            done();
                            return;
                        }
                        console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                            'success' : 'failed'},data:${toString(data)}`);
                        expect(data === RESTRICTION_DISABLE).assertTrue();
                        done();
                    });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_0900
     * @tc.name    Set RESTRICTION_TYPE_ROAMING_INCOMING RESTRICTION_MODE_ACTIVATION and run
     *             function getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID
     *             CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_0900', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_0900';
        let flag = true;
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ROAMING_INCOMING, RESTRICTION_MODE_ACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ROAMING_INCOMING, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,error:${toString(error)}`);
                        expect().assertFail();
                        flag = false;
                    }
                    flag = data === RESTRICTION_ENABLE;
                    expect(flag).assertTrue();
                    scenceLimitCancel(caseName, RESTRICTION_TYPE_ROAMING_INCOMING).then(data => {
                        console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
                        done();
                    }).catch(error => {
                        console.log(`${caseName} error,case failed`);
                        expect().assertFail();
                        done();
                    });
                });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_1000
     * @tc.name    Set RESTRICTION_TYPE_ROAMING_INCOMING RESTRICTION_MODE_DEACTIVATION and run
     *             function getCallRestrictionStatus by callback by arg slotId DEFAULT_SLOT_ID
     *             CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_1000', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_1000';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ROAMING_INCOMING, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ROAMING_INCOMING, (error, data) => {
                    if (error) {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                        'success' : 'failed'},data:${toString(data)}`);
                    expect(data === RESTRICTION_DISABLE).assertTrue();
                    done();
                });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_1300
     * @tc.name    Run function getCallRestrictionStatus by callback by arg slotId
     *             that is SLOT_ID_INVALID CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_1300', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_1300';
        call.getCallRestrictionStatus(SLOT_ID_INVALID, RESTRICTION_TYPE_ROAMING_INCOMING, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} success,case faild,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_1400
     * @tc.name    run function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ALL_CALLS ,
     *             the function return default status
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_1400', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_1400';
        call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_CALLS, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case faild,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} success,case ${data === RESTRICTION_MODE_ACTIVATION ||
        data === RESTRICTION_MODE_DEACTIVATION ? 'success' : 'failed'},data:${toString(data)}`);
            expect(data === RESTRICTION_MODE_ACTIVATION || data === RESTRICTION_MODE_DEACTIVATION).assertTrue();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_1500
     * @tc.name    run function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_OUTGOING_SERVICES ,
     *             the function return default status
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_1500', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_1500';
        call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_OUTGOING_SERVICES, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case faild,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} success,case ${data === RESTRICTION_MODE_ACTIVATION ||
        data === RESTRICTION_MODE_DEACTIVATION ? 'success' : 'failed'},data:${toString(data)}`);
            expect(data === RESTRICTION_MODE_ACTIVATION || data === RESTRICTION_MODE_DEACTIVATION).assertTrue();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_1600
     * @tc.name    run function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_INCOMING_SERVICES ,
     *             the function return default status
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_1600', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_1600';
        call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INCOMING_SERVICES, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case faild,error:${toString(error)}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} success,case ${data === RESTRICTION_MODE_ACTIVATION ||
        data === RESTRICTION_MODE_DEACTIVATION ? 'success' : 'failed'},data:${toString(data)}`);
            expect(data === RESTRICTION_MODE_ACTIVATION || data === RESTRICTION_MODE_DEACTIVATION).assertTrue();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_1700
     * @tc.name    Run function getCallRestrictionStatus by callback by arg slotId
     *             that is SLOT_ID_INVALID_2 CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_1700', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_1700';
        call.getCallRestrictionStatus(SLOT_ID_INVALID_2, RESTRICTION_TYPE_ROAMING_INCOMING, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} success,case faild,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_1800
     * @tc.name    Run function getCallRestrictionStatus by callback
     *             by arg slotId SLOT_ID1 CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_1800', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_1800';
        call.getCallRestrictionStatus(SLOT_ID1, RESTRICTION_TYPE_ROAMING_INCOMING, (error, data) => {
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
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Async_1900
     * @tc.name    Run function getCallRestrictionStatus by callback by arg slotId
     *             that is DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_INVALID ,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Async_1900', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Async_1900';
        call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INVALID, (error, data) => {
            if (error) {
                console.log(`${caseName} error,case success,error:${toString(error)}`);
                done();
                return;
            }
            console.log(`${caseName} success,case faild,data:${toString(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0100
     * @tc.name    Set RESTRICTION_TYPE_ALL_INCOMING RESTRICTION_MODE_ACTIVATION and run
     *             function getCallRestrictionStatus by promise
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ALL_INCOMING ,
     *             the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0100';
        let flag = true;
        try {
            await scenceLimitCalling(caseName, RESTRICTION_TYPE_ALL_INCOMING, RESTRICTION_MODE_ACTIVATION);
            let data = await call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_INCOMING);
            flag = data === RESTRICTION_ENABLE;
            expect(flag).assertTrue();
        } catch (error) {
            expect().assertFail();
            flag = false;
            console.log(`${caseName} error,error:${toString(error)}`);
        }
        try {
            await scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_INCOMING);
            console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0200
     * @tc.name    Set RESTRICTION_TYPE_ALL_INCOMING RESTRICTION_MODE_DEACTIVATION and run
     *             function getCallRestrictionStatus by promise
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ALL_INCOMING ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0200', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0200';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ALL_INCOMING, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_INCOMING)
                    .then(data => {
                        console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                            'success' : 'failed'},data:${toString(data)}`);
                        expect(data === RESTRICTION_DISABLE).assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                    });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0300
     * @tc.name    Set RESTRICTION_TYPE_ALL_OUTGOING RESTRICTION_MODE_ACTIVATION and run
     *             function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ALL_OUTGOING ,
     *             the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0300';
        let flag = true;
        try {
            await scenceLimitCalling(caseName, RESTRICTION_TYPE_ALL_OUTGOING, RESTRICTION_MODE_ACTIVATION);
            let data = await call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_OUTGOING);
            flag = data === RESTRICTION_ENABLE;
            expect(flag).assertTrue();
        } catch (error) {
            expect().assertFail();
            flag = false;
            console.log(`${caseName} error,error:${toString(error)}`);
        }
        try {
            await scenceLimitCancel(caseName, RESTRICTION_TYPE_ALL_OUTGOING);
            console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0400
     * @tc.name    Set RESTRICTION_TYPE_ALL_OUTGOING RESTRICTION_MODE_DEACTIVATION and run
     *             function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ALL_OUTGOING ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0400', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0400';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ALL_OUTGOING, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_OUTGOING)
                    .then(data => {
                        console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                            'success' : 'failed'},data:${toString(data)}`);
                        expect(data === RESTRICTION_DISABLE).assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                    });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0500
     * @tc.name    Set RESTRICTION_TYPE_INTERNATIONAL RESTRICTION_MODE_ACTIVATION and run
     *             function getCallRestrictionStatus by promise
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_INTERNATIONAL ,
     *             the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0500';
        let flag = true;
        try {
            await scenceLimitCalling(caseName, RESTRICTION_TYPE_INTERNATIONAL, RESTRICTION_MODE_ACTIVATION);
            let data = await call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INTERNATIONAL);
            flag = data === RESTRICTION_ENABLE;
            expect(flag).assertTrue();
        } catch (error) {
            expect().assertFail();
            flag = false;
            console.log(`${caseName} error,error:${toString(error)}`);
        }
        try {
            await scenceLimitCancel(caseName, RESTRICTION_TYPE_INTERNATIONAL);
            console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0600
     * @tc.name    Set RESTRICTION_TYPE_INTERNATIONAL RESTRICTION_MODE_DEACTIVATION and
     *             run function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_INTERNATIONAL ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0600', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0600';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_INTERNATIONAL, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INTERNATIONAL)
                    .then(data => {
                        console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                            'success' : 'failed'},data:${toString(data)}`);
                        expect(data === RESTRICTION_DISABLE).assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                    });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0700
     * @tc.name    Set RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME RESTRICTION_MODE_ACTIVATION
     *             and run function getCallRestrictionStatus
     *             by promise by arg slotId DEFAULT_SLOT_ID CallRestrictionType
     *             RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME ,
     *             the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0700', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0700';
        let flag = true;
        try {
            await scenceLimitCalling(caseName, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME,
                RESTRICTION_MODE_ACTIVATION);
            let data = await call.getCallRestrictionStatus(DEFAULT_SLOT_ID,
                RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME);
            flag = data === RESTRICTION_ENABLE;
        } catch (error) {
            flag = false;
            console.log(`${caseName} error,error:${toString(error)}`);
        }
        try {
            await scenceLimitCancel(caseName, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME);
            expect(flag).assertTrue();
            console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0800
     * @tc.name    Set RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME RESTRICTION_MODE_DEACTIVATION
     *             and run function getCallRestrictionStatus
     *             by callback by arg slotId DEFAULT_SLOT_ID CallRestrictionType
     *             RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0800', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0800';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME)
                    .then(data => {
                        console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                            'success' : 'failed'},data:${toString(data)}`);
                        expect(data === RESTRICTION_DISABLE).assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                    });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_0900
     * @tc.name    Set RESTRICTION_TYPE_ROAMING_INCOMING RESTRICTION_MODE_ACTIVATION and
     *             run function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return RESTRICTION_ENABLE,last cancel limit
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_0900', 0, async function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_0900';
        let flag = true;
        try {
            await scenceLimitCalling(caseName, RESTRICTION_TYPE_ROAMING_INCOMING, RESTRICTION_MODE_ACTIVATION);
            let data = await call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ROAMING_INCOMING);
            flag = data === RESTRICTION_ENABLE;
        } catch (error) {
            flag = false;
            console.log(`${caseName} error,error:${toString(error)}`);
        }
        try {
            await scenceLimitCancel(caseName, RESTRICTION_TYPE_ROAMING_INCOMING);
            expect(flag).assertTrue();
            console.log(`${caseName} success,case ${flag ? 'success' : 'faild'}`);
        } catch (error) {
            expect().assertFail();
            console.log(`${caseName} error,case failed,error:${toString(error)}`);
        }
        done();
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_1000
     * @tc.name    Set RESTRICTION_TYPE_ROAMING_INCOMING RESTRICTION_MODE_DEACTIVATION and
     *             run function getCallRestrictionStatus by callback
     *             by arg slotId DEFAULT_SLOT_ID CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return RESTRICTION_DISABLE
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_1000', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_1000';
        scenceLimitCalling(caseName, RESTRICTION_TYPE_ROAMING_INCOMING, RESTRICTION_MODE_DEACTIVATION)
            .then(() => {
                call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ROAMING_INCOMING)
                    .then(data => {
                        console.log(`${caseName} success,case ${data === RESTRICTION_DISABLE ?
                            'success' : 'failed'},data:${toString(data)}`);
                        expect(data === RESTRICTION_DISABLE).assertTrue();
                        done();
                    })
                    .catch(error => {
                        console.log(`${caseName} error,case failed,error:${toString(error)}`);
                        expect().assertFail();
                        done();
                    });
            })
            .catch(() => {
                console.log(`${caseName} scenceLimitCalling error,case failed`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_1300
     * @tc.name    Run function getCallRestrictionStatus by promise by arg slotId (that is at SLOT_ID_INVALID)
     *             CallRestrictionType RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME ,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_1300', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_1300';
        call.getCallRestrictionStatus(SLOT_ID_INVALID, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME)
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

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_1400
     * @tc.name    Run function getCallRestrictionStatus by promise by arg slotId DEFAULT_SLOT_ID
     *             CallRestrictionType RESTRICTION_TYPE_ALL_CALLS ,
     *             the function return default status
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_1400', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_1400';
        call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_ALL_CALLS)
            .then(data => {
                console.log(`${caseName} success,case ${data === RESTRICTION_MODE_ACTIVATION ||
          data === RESTRICTION_MODE_DEACTIVATION ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === RESTRICTION_MODE_ACTIVATION || data === RESTRICTION_MODE_DEACTIVATION).assertTrue();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_1500
     * @tc.name    Run function getCallRestrictionStatus by promise by arg slotId DEFAULT_SLOT_ID
     *             CallRestrictionType RESTRICTION_TYPE_OUTGOING_SERVICES ,
     *             the function return default status
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_1500', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_1500';
        call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_OUTGOING_SERVICES)
            .then(data => {
                console.log(`${caseName} success,case ${data === RESTRICTION_MODE_ACTIVATION ||
          data === RESTRICTION_MODE_DEACTIVATION ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === RESTRICTION_MODE_ACTIVATION || data === RESTRICTION_MODE_DEACTIVATION).assertTrue();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_1600
     * @tc.name    Run function getCallRestrictionStatus by promise by arg slotId DEFAULT_SLOT_ID
     *             CallRestrictionType RESTRICTION_TYPE_INCOMING_SERVICES ,
     *             the function return default status
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_1600', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_1600';
        call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INCOMING_SERVICES)
            .then(data => {
                console.log(`${caseName} success,case ${data === RESTRICTION_MODE_ACTIVATION ||
          data === RESTRICTION_MODE_DEACTIVATION ? 'success' : 'failed'},data:${toString(data)}`);
                expect(data === RESTRICTION_MODE_ACTIVATION || data === RESTRICTION_MODE_DEACTIVATION).assertTrue();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case failed,error:${toString(error)}`);
                expect().assertFail();
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_1700
     * @tc.name    Run function getCallRestrictionStatus by promise by arg slotId (that is at SLOT_ID_INVALID_2)
     *             CallRestrictionType RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME ,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_1700', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_1700';
        call.getCallRestrictionStatus(SLOT_ID_INVALID_2, RESTRICTION_TYPE_INTERNATIONAL_EXCLUDING_HOME)
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

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_1800
     * @tc.name    Run function getCallRestrictionStatus by promise
     *             by arg slotId SLOT_ID1 CallRestrictionType RESTRICTION_TYPE_ROAMING_INCOMING ,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_1800', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_1800';
        call.getCallRestrictionStatus(SLOT_ID1, RESTRICTION_TYPE_ROAMING_INCOMING)
            .then(data => {
                console.log(`${caseName} error,case failed,data:${toString(data)}`);
                expect().assertFail();
                done();
            })
            .catch(error => {
                console.log(`${caseName} error,case success,data:${toString(error)}`);
                done();
            });
    });

    /**
     * @tc.number  Telephony_CallManager_getCallRestrictionStatus_Promise_1900
     * @tc.name    Run function getCallRestrictionStatus by promise by arg slotId (that is at DEFAULT_SLOT_ID)
     *             CallRestrictionType RESTRICTION_TYPE_INVALID8 ,
     *             the function return error
     * @tc.desc    Function test
     */
    it('Telephony_CallManager_getCallRestrictionStatus_Promise_1900', 0, function (done) {
        let caseName = 'Telephony_CallManager_getCallRestrictionStatus_Promise_1900';
        call.getCallRestrictionStatus(DEFAULT_SLOT_ID, RESTRICTION_TYPE_INVALID8)
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
