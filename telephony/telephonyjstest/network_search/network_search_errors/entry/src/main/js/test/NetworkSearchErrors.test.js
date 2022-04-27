/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import radio from '@ohos.telephony.radio';
import observer from '@ohos.telephony.observer';
import { describe, beforeAll, afterAll, it, expect, afterEach } from 'deccjsunit/index';

describe('ActsNetworkSearchTest', function () {

    const SLOT_0 = 0;
    const SLOT_2 = -1;
    const PREFERRED_MODE_ERR2 = -1;

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
            await sleep(5000);
        }
    }

    beforeAll(async function () {
        await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_AUTO);
        await turnOnRadio();
    })

    afterAll(async function () {
        await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_AUTO);
        await turnOnRadio();
    })

    afterEach(async function () {
        try {
            expect(radio.RADIO_TECHNOLOGY_UNKNOWN === 0).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_1XRTT === 2).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_WCDMA === 3).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_HSPA === 4).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_HSPAP === 5).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_TD_SCDMA === 6).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_EVDO === 7).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_EHRPD === 8).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_LTE === 9).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_LTE_CA === 10).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_IWLAN === 11).assertTrue();
            expect(radio.RADIO_TECHNOLOGY_NR === 12).assertTrue();

            expect(radio.NETWORK_TYPE_UNKNOWN === 0).assertTrue();
            expect(radio.NETWORK_TYPE_GSM === 1).assertTrue();
            expect(radio.NETWORK_TYPE_CDMA === 2).assertTrue();
            expect(radio.NETWORK_TYPE_WCDMA === 3).assertTrue();
            expect(radio.NETWORK_TYPE_TDSCDMA === 4).assertTrue();
            expect(radio.NETWORK_TYPE_LTE === 5).assertTrue();
            expect(radio.NETWORK_TYPE_NR === 6).assertTrue();

            expect(radio.REG_STATE_NO_SERVICE === 0).assertTrue();
            expect(radio.REG_STATE_IN_SERVICE === 1).assertTrue();
            expect(radio.REG_STATE_EMERGENCY_CALL_ONLY === 2).assertTrue();
            expect(radio.REG_STATE_POWER_OFF === 3).assertTrue();

            expect(radio.NSA_STATE_NOT_SUPPORT === 1).assertTrue();
            expect(radio.NSA_STATE_NO_DETECT === 2).assertTrue();
            expect(radio.NSA_STATE_CONNECTED_DETECT === 3).assertTrue();
            expect(radio.NSA_STATE_IDLE_DETECT === 4).assertTrue();
            expect(radio.NSA_STATE_DUAL_CONNECTED === 5).assertTrue();
            expect(radio.NSA_STATE_SA_ATTACHED === 6).assertTrue();

            expect(radio.NETWORK_UNKNOWN === 0).assertTrue();
            expect(radio.NETWORK_CURRENT === 2).assertTrue();
            expect(radio.NETWORK_FORBIDDEN === 3).assertTrue();

            expect(radio.NETWORK_SELECTION_UNKNOWN === 0).assertTrue();
            expect(radio.NETWORK_SELECTION_MANUAL === 2).assertTrue();
        } catch (error) {
            console.log(`Telephony_NetworkSearch error`);
        }
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Async_0700
     * @tc.name    SlotId parameter input is -1, test getNetworkState() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getNetworkState_Async_0700', 0, async function (done) {
        radio.getNetworkState(SLOT_2, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getNetworkState_Async_0700 finish err: ${err}`);
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getNetworkState_Async_0700 fail not go to err ${data}`);
            expect(data.longOperatorName != 'longOperatorName').assertTrue();
            expect(data.shortOperatorName != 'shortOperatorName').assertTrue();
            expect(data.plmnNumeric != 'plmnNumeric').assertTrue();
            expect(data.isRoaming != true).assertTrue();
            expect(data.regState != radio.REG_STATE_IN_SERVICE).assertTrue();
            expect(data.nsaState != radio.NSA_STATE_SA_ATTACHED).assertTrue();
            expect(data.isCaActive != true).assertTrue();
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTech_Async_0400
     * @tc.name    SlotId parameter input is -1, test getRadioTech() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getRadioTech_Async_0400', 0, async function (done) {
        radio.getRadioTech(SLOT_2, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getRadioTech_Async_0400 finish err: ${err}`);
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getRadioTech_Async_0400 fail not go to err ${data}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getSignalInformation_Async_0400
     * @tc.name    SlotId parameter input is -1, test getSignalInformation() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getSignalInformation_Async_0400', 0, async function (done) {
        radio.getSignalInformation(SLOT_2, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getSignalInformation_Async_0400 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getSignalInformation_Async_0400 finish data: ${JSON.stringify(data)}`);
			if (data.length > 0) {
				expect(data[0].signalLevel != -1).assertTrue();
				expect(data[0].signalType != radio.NETWORK_TYPE_WCDMA).assertTrue();
			}
            expect(data.length === 0).assertTrue();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0400
     * @tc.name    SlotId parameter input is -1, test getISOCountryCodeForNetwork() query function and datalengtch = 0
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0400', 0, async function (done) {
        radio.getISOCountryCodeForNetwork(SLOT_2, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0400 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(
                `Telephony_NetworkSearch_getISOCountryCodeForNetwork_Async_0400 finish data: ${JSON.stringify(data)}`);
            expect(data.length === 0).assertTrue();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0400
     * @tc.name    SlotId parameter input is -1, test getISOCountryCodeForNetwork() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0400', 0, async function (done) {
        try {
            let data = await radio.getISOCountryCodeForNetwork(SLOT_2);
            console.log(
                `Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0400 finish data:${JSON.stringify(data)}`);
            expect(data.length === 0).assertTrue();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getISOCountryCodeForNetwork_Promise_0400 fail err: ${err}`);
            expect().assertFail();
            done();
            return;
        }
        done();
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSelectionMode_Async_0500
     * @tc.name    SlotId parameter input is -1, test getNetworkSelectionMode() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Async_0500', 0, async function (done) {
        radio.getNetworkSelectionMode(SLOT_2, (err, res) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getNetworkSelectionMode_Async_0500 err: ${err}`);
                done();
            } else {
                console.log('Telephony_NetworkSearch_getNetworkSelectionMode_Async_0500 fail not go to err');
                expect().assertFail();
                done();
            }

        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0500
     * @tc.name    SlotId parameter input is -1, test getNetworkSelectionMode() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0500', 0, async function (done) {
        try {
            await radio.getNetworkSelectionMode(SLOT_2);
            console.log('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0500 fail not go to err');
            expect().assertFail();
        } catch (err) {
            console.log('Telephony_NetworkSearch_getNetworkSelectionMode_Promise_0500 finish');
            done();
            return;
        }
        done();
    });

    

    

    /**
     * @tc.number  Telephony_NetworkSearch_getNetworkState_Promise_0700
     * @tc.name    SlotId parameter input is -1, test getNetworkState() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getNetworkState_Promise_0700', 0, async function (done) {
        try {
            await radio.getNetworkState(SLOT_2);
            console.log('Telephony_NetworkSearch_getNetworkState_Promise_0700 fail not go to err');
            expect().assertFail();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getNetworkState_Promise_0700 finish err: ${err}`);
            done();
            return;
        }
        done();
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getRadioTech_Promise_0400
     * @tc.name    SlotId parameter input is -1, test getRadioTech() query function go to the error
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getRadioTech_Promise_0400', 0, async function (done) {
        try {
            await radio.getRadioTech(SLOT_2);
            console.log('Telephony_NetworkSearch_getRadioTech_Promise_0400 fail not go to err');
            expect().assertFail();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getRadioTech_Promise_0400 finish err: ${err}`);
            done();
            return;
        }
        done();
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getSignalInformation_Promise_0400
     * @tc.name    SlotId parameter input is -1, test getSignalInformation() query function return the datalength is 0
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getSignalInformation_Promise_0400', 0, async function (done) {
        try {
            let data = await radio.getSignalInformation(SLOT_2);
            console.log(
                `Telephony_NetworkSearch_getSignalInformation_Promise_0400 finish data: ${JSON.stringify(data)}`);
            expect(data.length === 0).assertTrue();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getSignalInformation_Promise_0400 fail err: ${err}`);
            expect().assertFail();
            done();
            return;
        }
        done();
    });

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Async_0400
     * @tc.name    Verify the abnormal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Async_0400', 0, async function (done) {
        radio.getOperatorName(SLOT_2, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getOperatorName_Async_0400 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getOperatorName_Async_0400 finish  data: ${data}`);
            expect(data === '').assertTrue();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Promise_0400
     * @tc.name    Verify the abnormal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Promise_0400', 0, async function (done) {
        try {
            let data = await radio.getOperatorName(SLOT_2);
            console.log(`Telephony_NetworkSearch_getOperatorName_Promise_0400 finish data: ${data}`);
            expect(data === '').assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getOperatorName_Promise_0400 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    
    /**
     * @tc.number  Telephony_NetworkSearch_isRadioOn_Async_0200
     * @tc.name    Test The function isRadioOn
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_isRadioOn_Async_0200', 0, async function (done) {
        radio.isRadioOn((err) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_isRadioOn_Async_0200  fail: ${err}`);
                done();
                return;
            }
            console.log('Telephony_NetworkSearch_isRadioOn_Async_0200  finish');
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkSearch_isRadioOn_Promise_0200
     * @tc.name    Test The function isRadioOn
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_isRadioOn_Promise_0200', 0, async function (done) {
        try {
            await radio.isRadioOn();
            console.log('Telephony_NetworkSearch_isRadioOn_Promise_0200 success');
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_isRadioOn_Promise_0200 fail ${err}`);
            done();
        }
    });

    /**
     * @tc.number  Telephony_StateRegistry_on_0200
     * @tc.name    Add a networkStatus change listen and test observer.on({slotId:0}) to view the callback results
     * @tc.desc    Function test
     */
    it('Telephony_StateRegistry_on_0200', 0, async function (done) {
        observer.on('networkStateChange', { slotId: SLOT_0 }, (networkState) => {
            console.log(`Telephony_StateRegistry_on_0200 networkStateChanged data: ${JSON.stringify(networkState)}`);
            done();
        });
        done();
    });

    /**
     * @tc.number  Telephony_StateRegistry_off_0200
     * @tc.name    Add a networkStatus change listen and test observer.off() to view the callback results
     * @tc.desc    Function test
     */
    it('Telephony_StateRegistry_off_0200', 0, async function (done) {
        observer.off('networkStateChange');
        done();
    });

    /**
     * @tc.number  Telephony_StateRegistry_on_0300
     * @tc.name    Add a networkStatus change listen and test observer.on({slotId:0}) to view the callback results
     * @tc.desc    Function test
     */
    it('Telephony_StateRegistry_on_0300', 0, async function (done) {
        observer.on('signalInfoChange', { slotId: SLOT_0 }, (networkState) => {
            console.log(`Telephony_StateRegistry_on_0200 networkStateChanged data: ${JSON.stringify(networkState)}`);
            done();
        });
        done();
    });

    /**
     * @tc.number  Telephony_StateRegistry_off_0300
     * @tc.name    Add a networkStatus change listen and test observer.off() to view the callback results
     * @tc.desc    Function test
     */
    it('Telephony_StateRegistry_off_0300', 0, async function (done) {
        observer.off('signalInfoChange');
        done();
    });

});
