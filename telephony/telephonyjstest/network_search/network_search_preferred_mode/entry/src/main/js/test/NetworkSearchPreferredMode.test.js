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
import { describe, beforeAll, it, expect, afterEach } from 'deccjsunit/index';

describe('NetworkSearchPreferredModeTest', function () {
    const SLOT_0 = 0;
    const SLOT_1 = 1;
    const SLOT_2 = 2
    const SLOT_3 = -1;
    const PREFERRED_MODE_ERR7 = 77;
    const PREFERRED_MODE_ERR1 = -1;
    const TIME_WAIT = 5000;
    const longOperatorNames = ['CHINA MOBILE', 'CHN-UNICOM', 'CHINA TELECOM'];

    function sleep(timeout) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve();
            }, timeout);
        })
    }

    async function turnOnRadio() {
        let isOn = await radio.isRadioOn();
        if (!isOn) {
            await radio.turnOnRadio();
            await sleep(TIME_WAIT);
        }
    }

    async function revertPreferredMode() {
        let data = await radio.getPreferredNetwork(SLOT_0);
        if (data !== radio.PREFERRED_NETWORK_MODE_AUTO) {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_AUTO);
        }
    }

    beforeAll(async function () {
        await turnOnRadio()
        await revertPreferredMode();
    })

    afterEach(async function () {
        await turnOnRadio()
        await revertPreferredMode();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Async_0100
     * @tc.name    Verify the normal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Async_0100', 0, async function (done) {
        radio.getOperatorName(SLOT_0, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getOperatorName_Async_0100 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getOperatorName_Async_0100 finish  data: ${data}`);
            expect(longOperatorNames).assertContain(data);
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Async_0400
     * @tc.name    Verify the abnormal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Async_0400', 0, async function (done) {
        radio.getOperatorName(SLOT_3, (err, data) => {
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
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Async_0500
     * @tc.name    Verify the abnormal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Async_0500', 0, async function (done) {
        radio.getOperatorName(SLOT_1, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getOperatorName_Async_0500 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getOperatorName_Async_0500 finish  data: ${data}`);
            expect(data === '').assertTrue();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Async_0600
     * @tc.name    Verify the abnormal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Async_0600', 0, async function (done) {
        radio.getOperatorName(SLOT_2, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getOperatorName_Async_0600 fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getOperatorName_Async_0600 finish  data: ${data}`);
            expect(data === '').assertTrue();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Promise_0100
     * @tc.name    Verify the normal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Promise_0100', 0, async function (done) {
        try {
            let data = await radio.getOperatorName(SLOT_0);
            console.log(`Telephony_NetworkSearch_getOperatorName_Promise_0100 finish  data: ${data}`);
            expect(longOperatorNames).assertContain(data);
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getOperatorName_Promise_0100 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Promise_0400
     * @tc.name    Verify the abnormal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Promise_0400', 0, async function (done) {
        try {
            let data = await radio.getOperatorName(SLOT_3);
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
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Promise_0500
     * @tc.name    Verify the abnormal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Promise_0500', 0, async function (done) {
        try {
            let data = await radio.getOperatorName(SLOT_1);
            console.log(`Telephony_NetworkSearch_getOperatorName_Promise_0500 finish data: ${data}`);
            expect(data === '').assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getOperatorName_Promise_0500 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getOperatorName_Promise_0600
     * @tc.name    Verify the abnormal input of "slotId", test getOperatorName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getOperatorName_Promise_0600', 0, async function (done) {
        try {
            let data = await radio.getOperatorName(SLOT_2);
            console.log(`Telephony_NetworkSearch_getOperatorName_Promise_0600 finish data: ${data}`);
            expect(data === '').assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getOperatorName_Promise_0600 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Async_0100
     * @tc.name    Verify the default value of the callback, test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Async_0100', 0, async function (done) {
        radio.getPreferredNetwork(SLOT_0, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0100 get FAIL err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0100 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Promise_0100
     * @tc.name    Verify the default value of callback, test getPreferredNetwork() to view the return result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Promise_0100', 0, async function (done) {
        try {
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0100 finish  data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0100 FAIL err: ${err}`);
            expect().assertFail();
            done();
            return;
        }
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Async_0200
     * @tc.name    The current preferred network mode is to set the GSM network type,
     *             test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Async_0200', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_GSM, (err) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0200 set fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getPreferredNetwork(SLOT_0, (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0200 get fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0200 finish data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_GSM).assertTrue();
                done();
            })
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Async_0300
     * @tc.name    The current preferred network mode is to set the WCDMA network type,
     *             test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Async_0300', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_WCDMA, (err) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0300 set fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getPreferredNetwork(SLOT_0, (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0300 get fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0300 finish  data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_WCDMA).assertTrue();
                done();
            })
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Async_0400
     * @tc.name    The current preferred network mode is to set the LTE network type,
     *             test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Async_0400', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_LTE, (err) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0400 set fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getPreferredNetwork(SLOT_0, (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0400 get fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0400 finish  data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_LTE).assertTrue();
                done();
            })
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Async_0700
     * @tc.name    Verify the abnormal input of "slotId", test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Async_0700', 0, async function (done) {
        radio.getPreferredNetwork(SLOT_3, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0700 get PASS err: ${err}`);
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0700 fail not into err data: ${data}`);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Async_0800
     * @tc.name    When the Radio status is off, test getPreferredNetwork() to view the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Async_0800', 0, async function (done) {
        radio.turnOffRadio(err => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0800 turnOffRadio fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getPreferredNetwork(SLOT_0, async (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0800 get fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0800 finish  data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                done();
            })
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Async_0900
     * @tc.name    Verify the abnormal input of "slotId", test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Async_0900', 0, async function (done) {
        radio.getPreferredNetwork(SLOT_1, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0900 get PASS err: ${err}`);
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_0900 finish fail data: ${data}`);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Async_1000
     * @tc.name    Verify the abnormal input of "slotId", test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Async_1000', 0, async function (done) {
        radio.getPreferredNetwork(SLOT_2, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_1000 get PASS err: ${err}`);
                done();
                return;
            }
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Async_1000 fail not into err data: ${data}`);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Promise_0200
     * @tc.name    The current preferred network mode is to set the GSM network type, test getPreferredNetwork()
     *             to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Promise_0200', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_GSM);
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0200 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_GSM).assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0200 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Promise_0300
     * @tc.name    The current preferred network mode is to set the WCDMA network type,
     *             test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Promise_0300', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_WCDMA);
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0300 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_WCDMA).assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0300 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Promise_0400
     * @tc.name    The current preferred network mode is to set the LTE network type,
     *             test getPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Promise_0400', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_LTE);
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0400 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_LTE).assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0400 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Promise_0700
     * @tc.name    Verify the abnormal input of "slotId", test getPreferredNetwork() to view the return result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Promise_0700', 0, async function (done) {
        try {
            let data = await radio.getPreferredNetwork(SLOT_3);
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0700 fail  data: ${data}`);
            expect().assertFail();
            done();
            return;
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0700 finish err: ${err}`);
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Promise_0800
     * @tc.name    When the Radio status is off, test getPreferredNetwork() to view the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Promise_0800', 0, async function (done) {
        try {
            await radio.turnOffRadio();
            console.log('Telephony_NetworkSearch_getPreferredNetwork_Promise_0800 turnOffRadio success');
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0800 turnOffRadio fail ${err}`);
            expect().assertFail();
            done();
            return;
        }
        try {
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0800 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0800 FAIL err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Promise_0900
     * @tc.name    Verify the abnormal input of "slotId", test getPreferredNetwork() to view the return result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Promise_0900', 0, async function (done) {
        try {
            let data = await radio.getPreferredNetwork(SLOT_1);
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0900 fail  data: ${data}`);
            expect().assertFail();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_0900 finish err: ${err}`);
        }
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_getPreferredNetwork_Promise_1000
     * @tc.name    Verify the abnormal input of "slotId", test getPreferredNetwork() to view the return result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_getPreferredNetwork_Promise_1000', 0, async function (done) {
        try {
            let data = await radio.getPreferredNetwork(SLOT_2);
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_1000 fail  data: ${data}`);
            expect().assertFail();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_getPreferredNetwork_Promise_1000 finish err: ${err}`);
        }
        done();
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_0100
     * @tc.name    Verify the abnormal input of "preferredNetworkMode",
     *             test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_0100', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_0, PREFERRED_MODE_ERR1, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0100 set  err: ${err}`);
                radio.getPreferredNetwork(SLOT_0, (err, data) => {
                    if (err) {
                        console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0100 get fail err: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0100 finish data: ${data}`);
                    expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                    done();
                })
            } else {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0100 fail err: ${err}`);
                expect().assertFail();
                done();
            }
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_0400
     * @tc.name    Verify the "slotId" abnormal input, test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_0400', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_3, radio.PREFERRED_NETWORK_MODE_GSM, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0400 finish err: ${err}`);
                radio.getPreferredNetwork(SLOT_0, (err, data) => {
                    if (err) {
                        console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0400 get fail err: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0400 finish data: ${data}`);
                    expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                    done();
                })
            } else {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0400 fail: not go to err`);
                expect().assertFail();
                done();
            }
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_0500
     * @tc.name    When the Radio status is off, test setPreferredNetwork() to view the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_0500', 0, async function (done) {
        radio.turnOffRadio(err => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0500 turnOffRadio fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_WCDMA, (err) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0500 set fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                radio.getPreferredNetwork(SLOT_0, async (err, data) => {
                    if (err) {
                        console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0500 get fail err: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0500 finish  data: ${data}`);
                    expect(data === radio.PREFERRED_NETWORK_MODE_WCDMA).assertTrue();
                    done();
                })
            })
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_0600
     * @tc.name    Verify the "slotId" abnormal input, test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_0600', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_1, radio.PREFERRED_NETWORK_MODE_GSM, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0600 finish err: ${err}`);
                radio.getPreferredNetwork(SLOT_0, (err, data) => {
                    if (err) {
                        console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0600 get fail err: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(
                        `Telephony_NetworkSearch_setPreferredNetwork_Async_0600 finish data: ${JSON.stringify(data)}`);
                    expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                    done();
                })
            } else {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0600 fail: not go to err`);
                expect().assertFail();
                done();
            }

        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_0700
     * @tc.name    Verify the "slotId" abnormal input, test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_0700', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_2, radio.PREFERRED_NETWORK_MODE_GSM, (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0700 finish err: ${err}`);
                radio.getPreferredNetwork(SLOT_0, (err, data) => {
                    if (err) {
                        console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0700 get fail err: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0700 finish data: ${data}`);
                    expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                    done();
                })

            } else {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0700 fail: not go to err`);
                expect().assertFail();
                done();
            }

        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_0800
     * @tc.name    Set the preferred network mode to LTE network type,
     *             and verify the RadioTechnology return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_0800', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_LTE, async (err, data) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0800 fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            await sleep(5000);
            radio.getRadioTech(SLOT_0, (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0800 fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0800 end ${JSON.stringify(data)}`);
                expect(data.psRadioTech === radio.RADIO_TECHNOLOGY_LTE ||
                    data.csRadioTech === radio.RADIO_TECHNOLOGY_LTE).assertTrue();
                done();
            });
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_0900
     * @tc.name    The current preferred network mode is to set the LTE\WCDMA network type,
     *             test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_0900', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_LTE_WCDMA, (err) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0900 set fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getPreferredNetwork(SLOT_0, (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0900 get fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_0900 finish  data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_LTE_WCDMA).assertTrue();
                done();
            })
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_1000
     * @tc.name    The current preferred network mode is to set the LTE\WCDMA\GSM network type,
     *             test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_1000', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_LTE_WCDMA_GSM, (err) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_1000 set fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getPreferredNetwork(SLOT_0, (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_1000 get fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_1000 finish  data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                done();
            })
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Async_1100
     * @tc.name    The current preferred network mode is to set the WCDMA\GSM network type,
     *             test setPreferredNetworkMode() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Async_1100', 0, async function (done) {
        radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_WCDMA_GSM, (err) => {
            if (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_1100 set fail err: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            radio.getPreferredNetwork(SLOT_0, (err, data) => {
                if (err) {
                    console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_1100 get fail err: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Async_1100 finish  data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_WCDMA_GSM).assertTrue();
                done();
            })
        })
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_0100
     * @tc.name    Verify the abnormal input of "preferredNetworkMode",
     *             test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_0100', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_0, PREFERRED_MODE_ERR7);
            console.log('Telephony_NetworkSearch_setPreferredNetwork_Promise_0100 set fail: not go to err');
            expect().assertFail();
            done();
        } catch (err) {
            try {
                let data = await radio.getPreferredNetwork(SLOT_0);
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0100 finish data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                done();
            } catch (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0100 fail err: ${err}`);
                expect().assertFail();
                done();
            }
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_0400
     * @tc.name    Verify the abnormal input of "slotId", test setPreferredNetwork() return result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_0400', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_3, radio.PREFERRED_NETWORK_MODE_GSM);
            console.log('Telephony_NetworkSearch_setPreferredNetwork_Promise_0400 set fail: not go to err');
            expect().assertFail();
            done();
        } catch (err) {
            try {
                let data = await radio.getPreferredNetwork(SLOT_0);
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0400 finish data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                done();
            } catch (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0400 fail err: ${err}`);
                expect().assertFail();
                done();
            }
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_0500
     * @tc.name    When the Radio status is off, test setPreferredNetwork() to view the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_0500', 0, async function (done) {
        try {
            await radio.turnOffRadio();
            console.log('Telephony_NetworkSearch_setPreferredNetwork_Promise_0500 turnOffRadio success');
        } catch (err) {
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0500 turnOffRadio fail ${err}`);
            expect().assertFail();
            done();
            return;
        }
        try {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_WCDMA);
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0500 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_WCDMA).assertTrue();
            done();
        } catch (err) {
            console.log('Telephony_NetworkSearch_setPreferredNetwork_Promise_0500 fail err' + err);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_0600
     * @tc.name    Verify the abnormal input of "slotId", test setPreferredNetwork() return result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_0600', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_1, radio.PREFERRED_NETWORK_MODE_GSM);
            console.log('Telephony_NetworkSearch_setPreferredNetwork_Promise_0600 set fail: not go to err');
            expect().assertFail();
            done();
        } catch (err) {
            try {
                let data = await radio.getPreferredNetwork(SLOT_0);
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0600 finish data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                done();
            } catch (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0600 fail err: ${err}`);
                expect().assertFail();
                done();
            }
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_0700
     * @tc.name    Verify the abnormal input of "slotId", test setPreferredNetwork() return result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_0700', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_2, radio.PREFERRED_NETWORK_MODE_GSM);
            console.log('Telephony_NetworkSearch_setPreferredNetwork_Promise_0700 set fail: not go to err');
            expect().assertFail();
            done();
        } catch (err) {
            try {
                let data = await radio.getPreferredNetwork(SLOT_0);
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0700 finish data: ${data}`);
                expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
                done();
            } catch (err) {
                console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0700 fail err: ${err}`);
                expect().assertFail();
                done();
            }
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_0800
     * @tc.name    Set the preferred network mode to LTE network type,
     *             and verify the RadioTechnology return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_0800', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_LTE);
        } catch (err) {
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0800 set fail err: ${err}`);
            expect().assertFail();
            done();
            return;
        }
        try {
            await sleep(5000);
            let data = await radio.getRadioTech(SLOT_0);
            console.log(
                `Telephony_NetworkSearch_setPreferredNetwork_Promise_0800 finish data: ${JSON.stringify(data)}`);
            expect(data.psRadioTech === radio.RADIO_TECHNOLOGY_LTE || data.csRadioTech === radio.RADIO_TECHNOLOGY_LTE)
                .assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0800 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_0900
     * @tc.name    The current preferred network mode is to set the LTE\WCDMA network type,
     *             test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_0900', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_LTE_WCDMA);
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0900 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_LTE_WCDMA).assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_0900 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_1000
     * @tc.name    The current preferred network mode is to set the LTE\WCDMA\GSM network type,
     *             test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_1000', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_LTE_WCDMA_GSM);
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_1000 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_AUTO).assertTrue();
            done();
        } catch (err) {
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_1000 fail err: ${err}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number  Telephony_NetworkSearch_setPreferredNetwork_Promise_1100
     * @tc.name    The current preferred network mode is to set the WCDMA\GSM network type,
     *             test setPreferredNetwork() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkSearch_setPreferredNetwork_Promise_1100', 0, async function (done) {
        try {
            await radio.setPreferredNetwork(SLOT_0, radio.PREFERRED_NETWORK_MODE_WCDMA_GSM);
            let data = await radio.getPreferredNetwork(SLOT_0);
            console.log(`Telephony_NetworkSearch_setPreferredNetwork_Promise_1100 finish data: ${data}`);
            expect(data === radio.PREFERRED_NETWORK_MODE_WCDMA_GSM).assertTrue();
            done();
        } catch (err) {
            console.log('Telephony_NetworkSearch_setPreferredNetwork_Promise_1100 fail err' + err);
            expect().assertFail();
            done();
        }
    })
})
