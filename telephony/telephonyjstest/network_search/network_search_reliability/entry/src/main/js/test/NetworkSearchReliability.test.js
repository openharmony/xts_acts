/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import radio from '@ohos.telephony_radio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

describe('NetworkSearchTest', function () {
    let gslot = 0;
    let gradioTech = '2';
    let goperatorName = 'CMCC';
    let goperatorNumeric = '46000';
    let gnetworkSMode = {
        slotId: gslot,
        selectMode: radio.NETWORK_SELECTION_AUTOMATIC,
        networkInformation: {
            operatorName: goperatorName,
            operatorNumeric: goperatorNumeric,
            state: radio.NETWORK_AVAILABLE,
            radioTech: gradioTech,
        },
        resumeSelection: false,
    };
    //Long name of operator
    let garrLongOperatorName = ['CHINA MOBILE', 'CHN-UNICOM', 'CHINA TELECOM'];
    //Short name of operator
    let garrShortOperatorName = ['CMCC', 'UNICOM', 'CTCC'];
    //Plmn ID of operator
    let garrPlmnNumeric = [
        '46000',
        '46001',
        '46002',
        '46003',
        '46004',
        '46005',
        '46006',
        '46007',
        '46009',
        '46011',
        '46020',
    ];
    //Resident status
    let garrRegState = [
        radio.REG_STATE_NO_SERVICE,
        radio.REG_STATE_IN_SERVICE,
        radio.REG_STATE_EMERGENCY_CALL_ONLY,
        radio.REG_STATE_POWER_OFF,
    ];
    //NSA network registration status
    let garrNsaState = [
        radio.NSA_STATE_NOT_SUPPORT,
        radio.NSA_STATE_NO_DETECT,
        radio.NSA_STATE_CONNECTED_DETECT,
        radio.NSA_STATE_IDLE_DETECT,
        radio.NSA_STATE_DUAL_CONNECTED,
        radio.NSA_STATE_SA_ATTACHED,
    ];
    //Available network formats
    let garrRadioTech = [
        radio.RADIO_TECHNOLOGY_UNKNOWN,
        radio.RADIO_TECHNOLOGY_GSM,
        radio.RADIO_TECHNOLOGY_1XRTT,
        radio.RADIO_TECHNOLOGY_WCDMA,
        radio.RADIO_TECHNOLOGY_HSPA,
        radio.RADIO_TECHNOLOGY_HSPAP,
        radio.RADIO_TECHNOLOGY_TD_SCDMA,
        radio.RADIO_TECHNOLOGY_EVDO,
        radio.RADIO_TECHNOLOGY_EHRPD,
        radio.RADIO_TECHNOLOGY_LTE,
        radio.RADIO_TECHNOLOGY_LTE_CA,
        radio.RADIO_TECHNOLOGY_IWLAN,
        radio.RADIO_TECHNOLOGY_NR,
    ];
    //Network status
    let garrNetworkState = [
        radio.NETWORK_UNKNOWN,
        radio.NETWORK_AVAILABLE,
        radio.NETWORK_CURRENT,
        radio.NETWORK_CURRENT,
    ];
    //Network system
    let garrNetworkRadioTech = [
        radio.RADIO_TECHNOLOGY_UNKNOWN,
        radio.RADIO_TECHNOLOGY_GSM,
        radio.RADIO_TECHNOLOGY_1XRTT,
        radio.RADIO_TECHNOLOGY_WCDMA,
        radio.RADIO_TECHNOLOGY_HSPA,
        radio.RADIO_TECHNOLOGY_HSPAP,
        radio.RADIO_TECHNOLOGY_TD_SCDMA,
        radio.RADIO_TECHNOLOGY_EVDO,
        radio.RADIO_TECHNOLOGY_EHRPD,
        radio.RADIO_TECHNOLOGY_LTE,
        radio.RADIO_TECHNOLOGY_LTE_CA,
        radio.RADIO_TECHNOLOGY_IWLAN,
        radio.RADIO_TECHNOLOGY_NR,
    ];
    //Network type corresponding to signal
    let garrSignalType = [
        radio.NETWORK_TYPE_UNKNOWN,
        radio.NETWORK_TYPE_GSM,
        radio.NETWORK_TYPE_CDMA,
        radio.NETWORK_TYPE_WCDMA,
        radio.NETWORK_TYPE_TDSCDMA,
        radio.NETWORK_TYPE_LTE,
        radio.NETWORK_TYPE_NR,
    ];
    //Corresponding level of signal
    let garrSignalLevel = [0, 1, 2, 3, 4, 5];

    async function recoverNetworkSelectionMode() {
        try {
            await radio.setNetworkSelectionMode(gnetworkSMode);
            console.log('Telephony_NetworkSearch_rcoverNetworkSelectionMode success');
        } catch (err) {
            console.log('Telephony_NetworkSearch_recoverNetworkSelectionMode fail err: ' + err.message);
        }
    }

    async function recoverRadioState() {
        try {
            await radio.turnOnRadio(SLOT_0);
            console.log('Telephony_NetworkSearch_recoverRadioState success');
        } catch (err) {
            console.log('Telephony_NetworkSearch_recoverRadioState fail err: ' + err.message);
        }
    }

    afterAll(async function () {
        //Initialize network selection mode after all test cases
        recoverNetworkSelectionMode();
        //Initialize radio status after all test cases
        recoverRadioState();
    })

    const SLOT_0 = 0;
    const TEST_RUN_TIME = 10;
    const OPERATOR_NAME = 'CMCC';
    const OPERATOR_NUMERIC_46000 = '46000';
    const RADIO_TECH = '2';

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Async_0300
     * @tc.name    Test getNetworkState() The query function is executed 10 times, and the network registration status
     *             of the default card 0 can be finishfully returned each time
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getNetworkState_Async_0300', 0, async function (done) {
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.getNetworkState((err, data) => {
                if (err) {
                    console.log('Telephony_NetworkSearch_getNetworkState_Async_0300 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data != null && data != undefined).assertTrue();
                expect(garrLongOperatorName).assertContain(data.longOperatorName);
                expect(garrShortOperatorName).assertContain(data.shortOperatorName);
                expect(garrPlmnNumeric).assertContain(data.plmnNumeric);
                expect(data.isRoaming === false).assertTrue();
                expect(data.regStatus === 1).assertTrue();
                expect(data.nsaState === 1).assertTrue();
                expect(data.isCaActive === false).assertTrue();
                expect(data.isEmergency === false).assertTrue();
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Async_0500
     * @tc.name    The slotId parameter input is 0, the test getNetworkState() query function is executed 10 times,
     *             and the network registration status can be returned every time
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getNetworkState_Async_0500', 0, async function (done) {
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.getNetworkState(SLOT_0, (err, data) => {
                if (err) {
                    console.log('Telephony_NetworkSearch_getNetworkState_Async_0500 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data != null && data != undefined).assertTrue();
                expect(garrLongOperatorName).assertContain(data.longOperatorName);
                expect(garrShortOperatorName).assertContain(data.shortOperatorName);
                expect(garrPlmnNumeric).assertContain(data.plmnNumeric);
                expect(data.isRoaming === false).assertTrue();
                expect(data.regStatus === 1).assertTrue();
                expect(data.nsaState === 1).assertTrue();
                expect(data.isCaActive === false).assertTrue();
                expect(data.isEmergency === false).assertTrue();
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTech_Async_0200 fixme
     * @tc.name    The slotId parameter input is 0, the test getRadioTech() query function is executed 10 times,
     *             and the network mode of PS and CS is returned.
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getRadioTech_Async_0200', 0, async function (done) {
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.getRadioTech(SLOT_0, (err, { psRadioTech, csRadioTech }) => {
                if (err) {
                    console.log('Telephony_NetworkSearch_getRadioTech_Async_0200 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(garrRadioTech).assertContain(psRadioTech);
                expect(garrRadioTech).assertContain(csRadioTech);
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getSignalInformation_Async_0200
     * @tc.name    The slotId parameter input is 0, the test getSignalInformation() query function is executed 10
     *             times, and the signal strength list information is returned each time
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_0200', 0, async function (done) {
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.getSignalInformation(SLOT_0, (err, data) => {
                if (err) {
                    console.log('Telephony_NetworkSearch_getSignalInformation_Async_0200 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log('Telephony_NetworkSearch_getSignalInformation_Async_0200 finish data: ' + data);
                expect(data != null && data != undefined).assertTrue();
                if (data.length <= 0) {
                    console.log('Telephony_NetworkSearch_getSignalInformation_Async_0200 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(garrSignalType).assertContain(data.signalType[0]);
                expect(garrSignalLevel).assertContain(data.signalLevel[0]);
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Promise_0300
     * @tc.name    Test getNetworkState() The query function is executed 10 times, and the network registration status
     *             of the default card 1 can be finishfully returned each time
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getNetworkState_Promise_0300', 0, async function (done) {
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getNetworkState();
                expect(garrLongOperatorName).assertContain(data.longOperatorName);
                expect(garrShortOperatorName).assertContain(data.shortOperatorName);
                expect(garrPlmnNumeric).assertContain(data.plmnNumeric);
                expect(data != null && data != undefined).assertTrue();
                expect(data.isRoaming === false).assertTrue();
                expect(data.regStatus === 1).assertTrue();
                expect(data.nsaState === 1).assertTrue();
                expect(data.isCaActive === false).assertTrue();
                expect(data.isEmergency === false).assertTrue();
            } catch (err) {
                console.log('Telephony_NetworkSearch_getNetworkState_Promise_0300 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_getNetworkState_Promise_0300 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Promise_0500
     * @tc.name    The slotId parameter input is 0, the test getNetworkState() query function is executed 10 times,
     *             and the network registration status can be returned every time
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getNetworkState_Promise_0500', 0, async function (done) {
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getNetworkState(SLOT_0);
                expect(garrLongOperatorName).assertContain(data.longOperatorName);
                expect(garrShortOperatorName).assertContain(data.shortOperatorName);
                expect(garrPlmnNumeric).assertContain(data.plmnNumeric);
                expect(data != null && data != undefined).assertTrue();
                expect(data.isRoaming === false).assertTrue();
                expect(data.regStatus === 1).assertTrue();
                expect(data.nsaState === 1).assertTrue();
                expect(data.isCaActive === false).assertTrue();
                expect(data.isEmergency === false).assertTrue();
            } catch (err) {
                console.log('Telephony_NetworkSearch_getNetworkState_Promise_0500 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_getNetworkState_Promise_0500 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTech_Promise_0200 fixme
     * @tc.name    The slotId parameter input is 0, the test getRadioTech() query function is executed 10 times,
     *             and the network mode of PS and CS is returned.
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getRadioTech_Promise_0200', 0, async function (done) {
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getRadioTech(SLOT_0);
                expect(data != null && data != undefined).assertTrue();
                expect(garrRadioTech).assertContain(data.psRadioTech);
                expect(garrRadioTech).assertContain(data.csRadioTech);
            } catch (err) {
                console.log('Telephony_NetworkSearch_getRadioTech_Promise_0200 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_getRadioTech_Promise_0200 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getSignalInformation_Promise_0200 fixme
     * @tc.name    The slotId parameter input is 0, the test getSignalInformation() query function is executed 10
     *             times, and the signal strength list information is returned each time
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getSignalInformation_Promise_0200', 0, async function (done) {
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getSignalInformation(SLOT_0);
                expect(data != null && data != undefined).assertTrue();
                if (data.length <= 0) {
                    console.log('Telephony_NetworkSearch_getSignalInformation_Promise_0200 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(garrSignalType).assertContain(data.signalType[0]);
                expect(garrSignalLevel).assertContain(data.signalLevel[0]);
            } catch (err) {
                console.log('Telephony_NetworkSearch_getSignalInformation_Promise_0200 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_getSignalInformation_Promise_0200 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSelectionMode_Async_0300
     * @tc.name    Test is executed 10 times, and the network selection mode obtained each time is not empty
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Async_0300', 0, async function (done) {
        recoverNetworkSelectionMode();
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.getNetworkSelectionMode(SLOT_0, (err, data) => {
                if (err) {
                    console.log('Telephony_NetworkSearch_getNetworkSelectionMode_Async_0300 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === radio.NETWORK_SELECTION_AUTOMATIC).assertTrue();
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0300
     * @tc.name    The slotId is 1, and the network selection mode obtained each time is not empty
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0300', 0, async function (done) {
        recoverNetworkSelectionMode();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getNetworkSelectionMode(SLOT_0);
                expect(data === radio.NETWORK_SELECTION_AUTOMATIC).assertTrue();
            } catch (err) {
                console.log('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0300 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0300 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setNetworkSelectionMode_Async_0900
     * @tc.name    Test cyclicallyeach time the network selection mode can be finishfully set
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_setNetworkSelectionMode_Async_0900', 0, async function (done) {
        recoverNetworkSelectionMode();
        let networkSMode = {
            slotId: SLOT_0,
            selectMode: radio.NETWORK_SELECTION_AUTOMATIC,
            networkInformation: {
                operatorName: OPERATOR_NAME,
                operatorNumeric: OPERATOR_NUMERIC_46000,
                state: radio.NETWORK_AVAILABLE,
                radioTech: RADIO_TECH,
            },
            resumeSelection: false,
        };
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.setNetworkSelectionMode(networkSMode, (err, data) => {
                if (err) {
                    console.log('Telephony_NetworkSearch_setNetworkSelectionMode_Async_0900 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data != null).assertTrue();
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setNetworkSelectionMode_Promise_0900
     * @tc.name    Test execute 10 times, each time the network selection mode can be finishfully set
     * @tc.desc    Reliability test
     */
    it('Telephony_NetworkSearch_setNetworkSelectionMode_Promise_0900', 0, async function (done) {
        let networkSMode = {
            slotId: SLOT_0,
            selectMode: radio.NETWORK_SELECTION_AUTOMATIC,
            networkInformation: {
                operatorName: OPERATOR_NAME,
                operatorNumeric: OPERATOR_NUMERIC_46000,
                state: radio.NETWORK_AVAILABLE,
                radioTech: RADIO_TECH,
            },
            resumeSelection: false,
        };
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.setNetworkSelectionMode(networkSMode);
                expect(data != null).assertTrue();
            } catch (err) {
                console.log('Telephony_NetworkSearch_setNetworkSelectionMode_Promise_0900 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_setNetworkSelectionMode_Promise_0900 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0200
     * @tc.name    SlotId parameter input is 0, test getISOCountryCodeForNetwork() returns country code is not empty
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0200', 0, async function (done) {
        recoverRadioState();
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.getISOCountryCodeForNetwork(SLOT_0, (err, data) => {
                if (err) {
                    console.log(
                        'Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0200 fail err: ' + err.message
                    );
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data != null).assertTrue();
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0200
     * @tc.name    SlotId parameter input is 0, test getISOCountryCodeForNetwork() returns country code is not empty
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0200', 0, async function (done) {
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getISOCountryCodeForNetwork(SLOT_0);
                expect(data != null).assertTrue();
            } catch (err) {
                console.log(
                    'Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0200 fail err: ' + err.message
                );
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0200 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_turnOnRadio_Async_0300
     * @tc.name    Test turnOnRadio() is executed 10 times, and it can be executed finishfully every time
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_turnOnRadio_Async_0300', 0, async function (done) {
        recoverRadioState();
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.turnOnRadio(SLOT_0, (err) => {
                if (err) {
                    //Error code judgment is required here
                    recursive(n - 1);
                } else {
                    console.log('Telephony_NetworkSearch_turnOnRadio_Async_0300 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                }
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_turnOnRadio_Promise_0300
     * @tc.name    Test turnOnRadio() is executed 10 times, and it can be executed finishfully every time
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_turnOnRadio_Promise_0300', 0, async function (done) {
        recoverRadioState();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                await radio.turnOnRadio(SLOT_0);
                let data = await radio.isRadioOn(SLOT_0);
                expect(data).assertTrue();
            } catch (err) {
                console.log('Telephony_NetworkSearch_turnOnRadio_Promise_0300 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_turnOnRadio_Promise_0300 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_turnOffRadio_Async_0300
     * @tc.name    Test turnOffRadio() is executed 10 times, and it can be executed finishfully every time
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_turnOffRadio_Async_0300', 0, async function (done) {
        recoverRadioState();
        radio.turnOffRadio(SLOT_0, (err) => {
            function recursive(n) {
                if (n <= 0) {
                    done();
                    return;
                }
                radio.turnOffRadio(SLOT_0, (err) => {
                    if (err) {
                        //Error code judgment is required here
                        recursive(n - 1);
                    } else {
                        console.log('Telephony_NetworkSearch_turnOffRadio_Async_0300 fail err: ' + err.message);
                        expect().assertFail();
                        done();
                    }
                })
            }
            recursive(TEST_RUN_TIME);
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_turnOffRadio_Promise_0300
     * @tc.name    Test turnOffRadio() is executed 10 times, and it can be executed finishfully every time
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_turnOffRadio_Promise_0300', 0, async function (done) {
        recoverRadioState();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                await radio.turnOffRadio(SLOT_0);
                let data = radio.isRadioOn(SLOT_0);
                expect(data).assertFalse();
            } catch (err) {
                console.log('Telephony_NetworkSearch_turnOffRadio_Promise_0300 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_turnOffRadio_Promise_0300 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_isRadioOn_Async_0300
     * @tc.name    The slotId input is 0, test isRadioOn() is executed 10 times, and the data can be returned each time
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_isRadioOn_Async_0300', 0, async function (done) {
        recoverRadioState();
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.isRadioOn(SLOT_0, (err, data) => {
                if (err) {
                    console.log('Telephony_NetworkSearch_isRadioOn_Async_0300 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_isRadioOn_Promise_0300
     * @tc.name    The slotId input is 0, test isRadioOn() is executed 10 times, and the data can be returned each time
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_isRadioOn_Promise_0300', 0, async function (done) {
        recoverRadioState();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = radio.isRadioOn(SLOT_0);
                expect(data).assertTrue();
            } catch (err) {
                console.log('Telephony_NetworkSearch_isRadioOn_Promise_0300 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_isRadioOn_Promise_0300 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSearchInformation_Async_0200
     * @tc.name    The slotId input is 0, test isRadioOn() is executed 10 times, and the data can be returned each time
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getNetworkSearchInformation_Async_0200', 0, async function (done) {
        recoverNetworkSelectionMode();
        function recursive(n) {
            if (n <= 0) {
                done();
                return;
            }
            radio.getNetworkSearchInformation(SLOT_0, (err, data) => {
                if (err) {
                    console.log(
                        'Telephony_NetworkSearch_getNetworkSearchInformation_Async_0200 fail err: ' + err.message
                    );
                    expect().assertFail();
                    done();
                    return;
                }
                console.log('Telephony_NetworkSearch_getNetworkSearchInformation_Async_0200 finish data: '+ 
                JSON.stringify(data));
                expect(data != null && data != undefined).assertTrue();
                expect(data.isNetworkSearchSuccess).assertTrue();
                expect(garrShortOperatorName).assertContain(data.networkSearchResult.operatorName);
                expect(garrPlmnNumeric).assertContain(data.networkSearchResult.plmnNumeric);
                expect(garrNetworkState).assertContain(data.networkSearchResult.state);
                expect(garrNetworkRadioTech).assertContain(data.networkSearchResult.radioTech);
                recursive(n - 1);
            })
        }
        recursive(TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0200
     * @tc.name    The slotId input is 0, test isRadioOn() is executed 10 times, and the data can be returned each time
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0200', 0, async function (done) {
        recoverNetworkSelectionMode();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = radio.getNetworkSearchInformation(SLOT_0);
                console.log(
                    'Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0200 finish data: '+ 
                    JSON.stringify(data));
                expect(data != null && data != undefined).assertTrue();
                expect(data.isNetworkSearchSuccess).assertTrue();
                expect(garrShortOperatorName).assertContain(data.networkSearchResult.operatorName);
                expect(garrPlmnNumeric).assertContain(data.networkSearchResult.plmnNumeric);
                expect(garrNetworkState).assertContain(data.networkSearchResult.state);
                expect(garrNetworkRadioTech).assertContain(data.networkSearchResult.radioTech);
            } catch (err) {
                console.log(
                    'Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0200 fail err: ' + err.message
                );
                expect().assertFail();
                done();
                return;
            }
        }
        console.log('Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0200 finish');
        done();
    })
})
