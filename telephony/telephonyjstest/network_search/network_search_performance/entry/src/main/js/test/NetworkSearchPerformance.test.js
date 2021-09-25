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

    const SLOT_0 = 0;
    const TEST_RUN_TIME = 10;
    const MSEC_5 = 5;
    const OPERATOR_NAME = 'CMCC';
    const OPERATOR_NUMERIC_46000 = '46000';
    const RADIO_TECH = '2';
    const timesValue = {
        TIME_SPAN: 5,
        TEST_RUN_TIME: 10
    }

    async function recoverNetworkSelectionMode() {
        try {
            await radio.setNetworkSelectionMode(gnetworkSMode);
            console.log('Telephony_NetworkSearch_RecoverNetworkSelectionMode success');
        } catch (err) {
            console.log(`Telephony_NetworkSearch_RecoverNetworkSelectionMode fail err: ${err}`);
        }
    }

    async function recoverRadioState() {
        try {
            await radio.turnOnRadio(SLOT_0);
            console.log('Telephony_NetworkSearch_recoverRadioState success');
        } catch (err) {
            console.log(`Telephony_NetworkSearch_recoverRadioState fail err: ${err}`);
        }
    }

    afterAll(async function () {
        //Initialize network selection mode after all test cases
        recoverNetworkSelectionMode();
        //Initialize radio status after all test cases
        recoverRadioState();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Async_0400
     * @tc.name    Test getNetworkState() query function is executed 10 times,
     *             and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getNetworkState_Async_0400', 0, async function (done) {
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log(`Telephony_NetworkSearch_getNetworkState_Async_0400 exec done useTime: ${totalTime}`);
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.getNetworkState((err, data) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log(`Telephony_NetworkSearch_getNetworkState_Async_0400 fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Async_0600
     * @tc.name    The slotId parameter input is 0, the test getNetworkState() query function is executed 10 times,
     *             and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getNetworkState_Async_0600', 0, async function (done) {
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log(`Telephony_NetworkSearch_getNetworkState_Async_0600 exec done useTime: ${totalTime}`);
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.getNetworkState(SLOT_0, (err, data) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log(`Telephony_NetworkSearch_getNetworkState_Async_0600 fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTech_Async_0300
     * @tc.name    The slotId parameter input is 0, the test getRadioTech() query function is executed 10 times,
     *             and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getRadioTech_Async_0300', 0, async function (done) {
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log(`Telephony_NetworkSearch_getRadioTech_Async_0300 exec done useTime: ${totalTime}`);
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.getRadioTech(SLOT_0, (err, { psRadioTech, csRadioTech }) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log(`Telephony_NetworkSearch_getRadioTech_Async_0300 fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getSignalInformation_Async_0300
     * @tc.name    The slotId parameter input is 0, the test getSignalInformation() query function is executed 10
     *             times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_0300', 0, async function (done) {
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log(`Telephony_NetworkSearch_getSignalInformation_Async_0300 exec done useTime: ${totalTime}`);
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.getSignalInformation(SLOT_0, (err, data) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log(`Telephony_NetworkSearch_getSignalInformation_Async_0300 fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Promise_0400
     * @tc.name    Test getNetworkState() query function is executed 10 times,
     *             and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getNetworkState_Promise_0400', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getNetworkState();
            } catch (err) {
                console.log(`Telephony_NetworkSearch_getNetworkState_Promise_0400 err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        console.log(`Telephony_NetworkSearch_getNetworkState_Promise_0400 finish useTime: ${endTime - startTime}`);
        expect(endTime - startTime).assertLess(MSEC_5);
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Promise_0600
     * @tc.name    The slotId parameter input is 0, the test getNetworkState() query function is executed 10 times,
     *             and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getNetworkState_Promise_0600', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getNetworkState(SLOT_0);
            } catch (err) {
                console.log(`Telephony_NetworkSearch_getNetworkState_Promise_0600 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        console.log(`Telephony_NetworkSearch_getNetworkState_Promise_0600 finish useTime: ${endTime - startTime}`);
        expect(endTime - startTime).assertLess(MSEC_5);
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTech_Promise_0300
     * @tc.name    The slotId parameter input is 0, the test getRadioTech() query function is executed 10 times,
     *             and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getRadioTech_Promise_0300', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getRadioTech(SLOT_0);
            } catch (err) {
                console.log(`Telephony_NetworkSearch_getRadioTech_Promise_0300 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        console.log(`Telephony_NetworkSearch_getRadioTech_Promise_0300 finish useTime: ${endTime - startTime}`);
        expect(endTime - startTime).assertLess(MSEC_5);
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getSignalInformation_Promise_0300
     * @tc.name    The slotId parameter input is 0, the test getNetworkState() query function is executed 10 times,
     *             and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getSignalInformation_Promise_0300', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                await radio.getSignalInformation(SLOT_0);
            } catch (err) {
                console.log(`Telephony_NetworkSearch_getSignalInformation_Promise_0300 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        console.log(`Telephony_NetworkSearch_getSignalInformation_Promise_0300 finish useTime: ${endTime - startTime}`);
        expect(endTime - startTime).assertLess(MSEC_5);
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSelectionMode_Async_0400
     * @tc.name    The slotId input is 0, the test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Async_0400', 0, async function (done) {
        recoverNetworkSelectionMode();
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log(
                    `Telephony_NetworkSearch_getNetworkSelectionMode_Async_0400 exec done useTime: ${totalTime}`);
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.getNetworkSelectionMode(SLOT_0, (err, data) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log(`Telephony_NetworkSearch_getNetworkSelectionMode_Async_0400 fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0400
     * @tc.name    The slotId input is 0, the test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0400', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getNetworkSelectionMode(SLOT_0);
            } catch (err) {
                console.log(`Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0400 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        expect(endTime - startTime).assertLess(MSEC_5);
        console.log(
            `Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0400 finish useTime: ${endTime - startTime}`);
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setNetworkSelectionMode_Async_1000
     * @tc.name    Test is executed 10 times in a loop, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_setNetworkSelectionMode_Async_1000', 0, async function (done) {
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
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log(
                    `Telephony_NetworkSearch_setNetworkSelectionMode_Async_1000 exec done useTime: ${totalTime}`);
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.setNetworkSelectionMode(networkSMode, (err, data) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log(`Telephony_NetworkSearch_setNetworkSelectionMode_Async_1000 fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setNetworkSelectionMode_Promise_1000
     * @tc.name    Test executed 10 times in a loop, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_setNetworkSelectionMode_Promise_1000', 0, async function (done) {
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
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.setNetworkSelectionMode(networkSMode);
            } catch (err) {
                console.log(`Telephony_NetworkSearch_setNetworkSelectionMode_Promise_1000 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        expect(endTime - startTime).assertLess(MSEC_5);
        console.log(
            `Telephony_NetworkSearch_setNetworkSelectionMode_Promise_1000 finish useTime: ${endTime - startTime}`);
        done();
    })
    
    /**
     * @tc.number  Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0300
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0300', 0, async function (done) {
        recoverRadioState();
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log(
                    `Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0300 exec done useTime: ${totalTime}`
                );
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.getISOCountryCodeForNetwork(SLOT_0, (err, data) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log(
                        `Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0300 fail err: ${err}`
                    );
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0300
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0300', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getISOCountryCodeForNetwork(SLOT_0);
            } catch (err) {
                console.log(
                    `Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0300 fail err: ${err}`
                );
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        expect(endTime - startTime).assertLess(MSEC_5);
        console.log(
            `Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0300 finish useTime: ${endTime - startTime}`);
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_turnOnRadio_Async_0400
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_turnOnRadio_Async_0400', 0, async function (done) {
        recoverRadioState();
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                `Telephony_NetworkSearch_turnOnRadio_Async_0400 exec done useTime: ${totalTime}`
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.turnOnRadio(SLOT_0, (err) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    //Error code judgment is required here
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_turnOnRadio_Promise_0400
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_turnOnRadio_Promise_0400', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                await radio.turnOnRadio(SLOT_0);
            } catch (err) {
                console.log('Telephony_NetworkSearch_turnOnRadio_Promise_0400 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        expect(endTime - startTime).assertLess(MSEC_5);
        console.log('Telephony_NetworkSearch_turnOnRadio_Promise_0400 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_turnOffRadio_Async_0400
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_turnOffRadio_Async_0400', 0, async function (done) {
        recoverRadioState();
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log('Telephony_NetworkSearch_turnOffRadio_Async_0400 exec done useTime:' + totalTime);
                console.log('Telephony_NetworkSearch_turnOffRadio_Async_0400 finish');
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.turnOffRadio(SLOT_0, (err) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    //Error code judgment is required here
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_turnOffRadio_Promise_0400
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_turnOffRadio_Promise_0400', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                await radio.turnOffRadio(SLOT_0);
            } catch (err) {
                console.log('Telephony_NetworkSearch_turnOffRadio_Promise_0400 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        expect(endTime - startTime).assertLess(MSEC_5);
        console.log('Telephony_NetworkSearch_turnOffRadio_Promise_0400 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_isRadioOn_Async_0400
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_isRadioOn_Async_0400', 0, async function (done) {
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log('Telephony_NetworkSearch_isRadioOn_Async_0400 exec done useTime:' + totalTime);
                console.log('Telephony_NetworkSearch_isRadioOn_Async_0400 finish');
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.isRadioOn(SLOT_0, (err, data) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log('Telephony_NetworkSearch_isRadioOn_Async_0400 fail err: ' + err.message);
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_isRadioOn_Promise_0400
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_isRadioOn_Promise_0400', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.isRadioOn(SLOT_0);
            } catch (err) {
                console.log('Telephony_NetworkSearch_isRadioOn_Promise_0400 fail err: ' + err.message);
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        expect(endTime - startTime).assertLess(MSEC_5);
        console.log('Telephony_NetworkSearch_isRadioOn_Promise_0400 finish');
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSearchInformation_Async_0300
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getNetworkSearchInformation_Async_0300', 0, async function (done) {
        recoverNetworkSelectionMode();
        let totalTime = 0;
        let startTime = 0;
        let endTime = 0;
        function recursive(n) {
            if (n <= 0) {
                console.log(
                    'Telephony_NetworkSearch_getNetworkSearchInformation_Async_0300 exec done useTime:' + totalTime
                );
                console.log('Telephony_NetworkSearch_getNetworkSearchInformation_Async_0300 finish');
                expect(totalTime).assertLess(timesValue.TIME_SPAN);
                done();
                return;
            }
            startTime = new Date().getTime();
            radio.getNetworkSearchInformation(SLOT_0, (err, data) => {
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                if (err) {
                    console.log(
                        'Telephony_NetworkSearch_getNetworkSearchInformation_Async_0300 fail err: ' + err.message
                    );
                    expect().assertFail();
                    done();
                    return;
                }
                recursive(n - 1);
            })
        }
        recursive(timesValue.TEST_RUN_TIME);
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0300
     * @tc.name    Test is executed 10 times, and the output delay is less than 5000us
     * @tc.desc    Performance test
     */
    it('Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0300', 0, async function (done) {
        const startTime = new Date().getTime();
        for (let index = 0; index < TEST_RUN_TIME; index++) {
            try {
                let data = await radio.getNetworkSearchInformation(SLOT_0);
            } catch (err) {
                console.log(
                    'Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0300 fail err: ' + err.message
                );
                expect().assertFail();
                done();
                return;
            }
        }
        const endTime = new Date().getTime();
        expect(endTime - startTime).assertLess(MSEC_5);
        console.log('Telephony_NetworkSearch_getNetworkSearchInformation_Promise_0300 finish');
        done();
    })
})
