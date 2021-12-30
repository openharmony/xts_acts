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

import radio from '@ohos.telephony.radio';
import { describe, it, expect, beforeAll, afterAll, afterEach } from 'deccjsunit/index';

describe('NetworkSearchCellInformationTest', function () {
    const SLOT_0 = 0;
    const SLOT_1 = 1;
    const SLOT_2 = 2;
    const SLOT_3 = -1;
    const NETWORK_TYPES = [
        radio.NETWORK_TYPE_UNKNOWN,
        radio.NETWORK_TYPE_GSM,
        radio.NETWORK_TYPE_CDMA,
        radio.NETWORK_TYPE_WCDMA,
        radio.NETWORK_TYPE_TDSCDMA,
        radio.NETWORK_TYPE_LTE,
        radio.NETWORK_TYPE_NR,
    ];
    const NETWORK_SIGNAL = [0, 1, 2, 3, 4, 5]
    const CELL_LAC_TAC_MAX = 0xffff;
    const CELL_CELLID_MAX = 0xfffffff;
    const CELL_GSM_CELLID_MAX = 0xffff;
    const CELL_ARFCN_MAX = 1023;
    const CELL_EARFCN_MAX = 41589;
    const CELL_BSIC_MAX = 63;
    const CELL_PSC_MAX = 511;
    const CELL_PCI_MAX = 503;
    const CELL_MCC = 460;
    const CELL_MNC_MAX = 20;
    const CELL_INFO_MIN = 0;
    const TIME_RADIO_TURNON = 10000;

    function sleep(timeout) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                console.log(`Telephony_NetworkSearch_CellInformation sleep ${timeout}ms`);
                resolve();
            }, timeout);
        })
    }

    async function turnOnRadio() {
        let isOn = await radio.isRadioOn();
        if (!isOn) {
            await radio.turnOnRadio();
            console.log('Telephony_NetworkSearch_CellInformation turnOnRadio success');
            await sleep(TIME_RADIO_TURNON);
        }
    }

    beforeAll(async function () {
        await turnOnRadio();
    })

    afterAll(async function () {
        await turnOnRadio();
    })

    afterEach(async function () {
        await turnOnRadio();
    })

    function assertCellInformation(data) {
        expect(data !== '' && data != undefined && data != null).assertTrue();
        expect(data.length).assertLarger(0);
        for (let i = 0; i < data.length; i++) {
            expect(NETWORK_TYPES).assertContain(data[i].networkType);
            expect(data[i].isCamped).assertTrue();
            expect(data[i].timeStamp).assertLarger(0);
            expect(NETWORK_TYPES).assertContain(data[i].signalInformation.signalType);
            expect(NETWORK_SIGNAL).assertContain(data[i].signalInformation.signalLevel);
            expect(data[i].data != undefined && data[i].data != '' && data[i].data != null).assertTrue();
            if (data[0].networkType === radio.NETWORK_TYPE_LTE) {
                expect(data[i].data.tac >= CELL_INFO_MIN && data[i].data.tac <= CELL_LAC_TAC_MAX).assertTrue();
                expect(data[i].data.cgi >= CELL_INFO_MIN && data[i].data.cgi <= CELL_CELLID_MAX).assertTrue();
                expect(data[i].data.earfcn >= CELL_INFO_MIN && data[i].data.earfcn <= CELL_EARFCN_MAX).assertTrue();
                expect(data[i].data.pci >= CELL_INFO_MIN && data[i].data.pci <= CELL_PCI_MAX).assertTrue();
                expect(data[i].data.mnc >= CELL_INFO_MIN && data[i].data.mnc <= CELL_MNC_MAX).assertTrue();
                expect(data[i].data.mcc).assertEqual(CELL_MCC);
            } else if (data[i].networkType === radio.NETWORK_TYPE_WCDMA) {
                expect(data[i].data.lac >= CELL_INFO_MIN && data[i].data.lac <= CELL_LAC_TAC_MAX).assertTrue();
                expect(data[i].data.cellId >= CELL_INFO_MIN && data[i].data.cellId <= CELL_CELLID_MAX).assertTrue();
                expect(data[i].data.uarfcn >= CELL_INFO_MIN && data[i].data.uarfcn <= CELL_ARFCN_MAX).assertTrue();
                expect(data[i].data.psc >= CELL_INFO_MIN && data[i].data.psc <= CELL_PSC_MAX).assertTrue();
                expect(data[i].data.mnc >= CELL_INFO_MIN && data[i].data.mnc <= CELL_MNC_MAX).assertTrue();
                expect(data[i].data.mcc).assertEqual(CELL_MCC);
            } else if (data[i].networkType === radio.NETWORK_TYPE_GSM) {
                expect(data[i].data.lac >= CELL_INFO_MIN && data[i].data.lac <= CELL_LAC_TAC_MAX).assertTrue();
                expect(data[i].data.cellId >= CELL_INFO_MIN && data[i].data.cellId <= CELL_GSM_CELLID_MAX).assertTrue();
                expect(data[i].data.arfcn >= CELL_INFO_MIN && data[i].data.arfcn <= CELL_ARFCN_MAX).assertTrue();
                expect(data[i].data.bsic >= CELL_INFO_MIN && data[i].data.bsic <= CELL_BSIC_MAX).assertTrue();
                expect(data[i].data.mnc >= CELL_INFO_MIN && data[i].data.mnc <= CELL_MNC_MAX).assertTrue();
                expect(data[i].data.mcc).assertEqual(CELL_MCC);
            } else {
                expect().assertFail();
            }
        }
    }

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Async_0100
     * @tc.name    Test getCellInformation() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Async_0100', 0, async function (done) {
        radio.getCellInformation((err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0100 fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getCellInformation_Async_0100 end data: ${JSON.stringify(data)}`);
            assertCellInformation(data);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Async_0200
     * @tc.name    Test getCellInformation() to view the callback result when the Radio status is off
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Async_0200', 0, async function (done) {
        radio.turnOffRadio(err => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0200 turnOffRadio fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getCellInformation((err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_getCellInformation_Async_0200 fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0200 end data: ${JSON.stringify(data)}`);
                expect(data !== '' && data != undefined && data != null).assertTrue();
                expect(data.length).assertEqual(0);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Async_0300
     * @tc.name    Test getCellInformation() with soltId(0) to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Async_0300', 0, async function (done) {
        radio.getCellInformation(SLOT_0, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0300 fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getCellInformation_Async_0300 end data: ${JSON.stringify(data)}`);
            assertCellInformation(data);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Async_0400
     * @tc.name    Test getCellInformation() with anomalous soltId(1) to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Async_0400', 0, async function (done) {
        radio.getCellInformation(SLOT_1, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0400 fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getCellInformation_Async_0400 end data: ${JSON.stringify(data)}`);
            expect(data !== '' && data != undefined && data != null).assertTrue();
            expect(data.length).assertEqual(0);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Async_0500
     * @tc.name    Test getCellInformation() with anomalous soltId(-1) to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Async_0500', 0, async function (done) {
        radio.getCellInformation(SLOT_3, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0500 fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getCellInformation_Async_0500 end data: ${JSON.stringify(data)}`);
            expect(data !== '' && data != undefined && data != null).assertTrue();
            expect(data.length).assertEqual(0);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Async_0600
     * @tc.name    Test getCellInformation() with anomalous soltId(2) to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Async_0600', 0, async function (done) {
        radio.getCellInformation(SLOT_2, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0600 fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getCellInformation_Async_0600 end data: ${JSON.stringify(data)}`);
            expect(data !== '' && data != undefined && data != null).assertTrue();
            expect(data.length).assertEqual(0);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Async_0700
     * @tc.name    Test getCellInformation() with soltId(0) to view the callback result when the Radio status is off
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Async_0700', 0, async function (done) {
        radio.turnOffRadio(err => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0700 turnOffRadio fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getCellInformation(SLOT_0, (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_getCellInformation_Async_0700 fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_getCellInformation_Async_0700 end data: ${JSON.stringify(data)}`);
                expect(data !== '' && data != undefined && data != null).assertTrue();
                expect(data.length).assertEqual(0);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Promise_0100
     * @tc.name    Test getCellInformation() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Promise_0100', 0, async function (done) {
        radio.getCellInformation().then(data => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0100 end data: ${JSON.stringify(data)}`);
            assertCellInformation(data);
            done();
        }).catch(err => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0100 fail: ${err}`);
            expect().assertFail();
            done();
        })

    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Promise_0200
     * @tc.name    Test getCellInformation() to view the callback result when the Radio status is off
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Promise_0200', 0, async function (done) {
        try {
            await radio.turnOffRadio();
            console.log('Telephony_NetworkSearch_getCellInformation_Promise_0200 turnOffRadio finish');
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0200 turnOffRadio fail: ${err}`);
            expect().assertFail();
            done();
            return;
        }
        try {
            let data = await radio.getCellInformation();
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0200 end data ${data}`);
            expect(data !== '' && data != undefined && data != null).assertTrue();
            expect(data.length).assertEqual(0);
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0200 fail ${err}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Promise_0300
     * @tc.name    Test getCellInformation() with soltId(0) to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Promise_0300', 0, async function (done) {
        radio.getCellInformation(SLOT_0).then(data => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0300 end data: ${JSON.stringify(data)}`);
            assertCellInformation(data);
            done();
        }).catch(err => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0300 fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Promise_0400
     * @tc.name    Test getCellInformation() with anomalous soltId(1) to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Promise_0400', 0, async function (done) {
        radio.getCellInformation(SLOT_1).then(data => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0400 end data: ${JSON.stringify(data)}`);
            expect(data !== '' && data != undefined && data != null).assertTrue();
            expect(data.length).assertEqual(0);
            done();
        }).catch(err => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0400 fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Promise_0500
     * @tc.name    Test getCellInformation() with anomalous soltId(-1) to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Promise_0500', 0, async function (done) {
        radio.getCellInformation(SLOT_3).then(data => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0500 end data: ${JSON.stringify(data)}`);
            expect(data !== '' && data != undefined && data != null).assertTrue();
            expect(data.length).assertEqual(0);
            done();
        }).catch(err => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0500 fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Promise_0600
     * @tc.name    Test getCellInformation() with anomalous soltId(2) to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Promise_0600', 0, async function (done) {
        radio.getCellInformation(SLOT_2).then(data => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0600 end data: ${JSON.stringify(data)}`);
            expect(data !== '' && data != undefined && data != null).assertTrue();
            expect(data.length).assertEqual(0);
            done();
        }).catch(err => {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0600 fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getCellInformation_Promise_0700
     * @tc.name    Test getCellInformation() with soltId(0) to view the callback result when the Radio status is off
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getCellInformation_Promise_0700', 0, async function (done) {
        try {
            await radio.turnOffRadio();
            console.log('Telephony_NetworkSearch_getCellInformation_Promise_0700 turnOffRadio finish');
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0700 turnOffRadio fail: ${err}`);
            expect().assertFail();
            done();
            return;
        }
        try {
            let data = await radio.getCellInformation(SLOT_0);
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0700 end data ${JSON.stringify(data)}`);
            expect(data !== '' && data != undefined && data != null).assertTrue();
            expect(data.length).assertEqual(0);
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getCellInformation_Promise_0700 fail ${err}`);
            expect().assertFail();
            done();
        }
    });

    /**
     * @tc.number  Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0100
     * @tc.name    Test sendUpdateCellLocationRequest() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0100', 0, async function (done) {
        radio.sendUpdateCellLocationRequest((err) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0100 fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0100 success`)
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0200
     * @tc.name    Test sendUpdateCellLocationRequest() to view the callback result when the Radio status is off
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0200', 0, async function (done) {
        radio.turnOffRadio(err => {
            if (err) {
                console.log(
                    `Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0200 turnOffRadio fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.sendUpdateCellLocationRequest(async (err) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0200 fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Async_0200 success`)
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0100
     * @tc.name    Test sendUpdateCellLocationRequest() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0100', 0, async function (done) {
        radio.sendUpdateCellLocationRequest().then(data => {
            console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0100 end data: ${data}`);
            done();
        }).catch(err => {
            console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0100 fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0200
     * @tc.name    Test sendUpdateCellLocationRequest() to view the callback result when the Radio status is off
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0200', 0, async function (done) {
        try {
            await radio.turnOffRadio();
            console.log('Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0200 turnOffRadio finish');
        } catch (err) {
            console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0200 turnOffRadio fail: ${err}`);
            expect().assertFail();
            done();
            return;
        }
        try {
            await radio.sendUpdateCellLocationRequest();
            console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0200 success`);
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_sendUpdateCellLocationRequest_Promise_0200 fail ${err}`);
            expect().assertFail();
            done();
        }
    });
});
