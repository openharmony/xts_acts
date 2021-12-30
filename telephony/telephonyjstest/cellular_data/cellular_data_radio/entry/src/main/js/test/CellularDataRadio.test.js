/**
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

import cellular from "@ohos.telephony.data";
import radio from "@ohos.telephony.radio";
import { describe, beforeAll, afterAll, it, expect } from "deccjsunit/index";

describe("Telephony_CellularDataRadio", function () {
    const TIME_INTERVAL = 0.5;
    const TIME_3_SECONDS = 3;
    const TIME_RADIO_CHANGE = 10;

    const DataConnectState = {
        DATA_STATE_UNKNOWN: -1,
        DATA_STATE_DISCONNECTED: 0,
        DATA_STATE_CONNECTING: 1,
        DATA_STATE_CONNECTED: 2,
        DATA_STATE_SUSPENDED: 3,
    };

    const sleep = function (s) {
        return new Promise((resolve) => {
            setTimeout(() => {
                resolve();
            }, s * 1000);
        })
    };

    const stateChange = async function (caseName, expectState, timeout) {
        let data = null;
        let start = new Date().getTime();
        while (new Date().getTime() - start < timeout * 1000) {
            try {
                data = await cellular.getCellularDataState();
                if (data === expectState) {
                    break;
                }
            } catch (err) {
                console.log(`${caseName} getCellularDataState err: ${err.message}`);
                return null;
            }
            await sleep(TIME_INTERVAL);
        }
        console.log(`${caseName} getCellularDataState finish: ${data}`);
        return data;
    };

    beforeAll(async function () {
        try {
            await radio.turnOnRadio();
            await sleep(TIME_RADIO_CHANGE);
            await cellular.enableCellularData();
            await sleep(TIME_3_SECONDS);
        } catch (err) {
            console.log(`Telephony_CellularData beforeAll err: ${err.message}`);
            expect().assertFail();
        }
    })

    afterAll(async function () {
        try {
            await radio.turnOnRadio();
            await sleep(TIME_RADIO_CHANGE);
        } catch (err) {
            console.log(`Telephony_CellularData afterAll err: ${err.message}`);
            expect().assertFail();
        }
    })

    /**
     * @tc.number   Telephony_CellularData_activationDeactivation_Async_0100
     * @tc.name     Set radio off with async callback, verify the cellular data is disconnected
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_activationDeactivation_Async_0100", 0, async function (done) {
        const CASE_NAME = "Telephony_CellularData_activationDeactivation_Async_0100";
        radio.turnOnRadio(async function (err) {
            if (err) {
                console.log(`${CASE_NAME} turnOnRadio err: ${err.message}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${CASE_NAME} turnOnRadio finish`);
            await sleep(TIME_RADIO_CHANGE);

            cellular.getCellularDataState(async function (err, data) {
                if (err) {
                    console.log(`${CASE_NAME} getCellularDataState err: ${err.message}`);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === DataConnectState.DATA_STATE_CONNECTED).assertTrue();
                console.log(`${CASE_NAME} getCellularDataState finish: ${data}`);

                radio.turnOffRadio(async function (err) {
                    if (err) {
                        console.log(`${CASE_NAME} turnOffRadio err: ${err.message}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${CASE_NAME} turnOffRadio finish`);
                    await sleep(TIME_3_SECONDS);

                    cellular.getCellularDataState(async function (err, data) {
                        if (err) {
                            console.log(`${CASE_NAME} getCellularDataState err: ${err.message}`);
                            expect().assertFail();
                            done();
                            return;
                        }
                        expect(data === DataConnectState.DATA_STATE_DISCONNECTED).assertTrue();
                        console.log(`${CASE_NAME} getCellularDataState finish: ${data}`);
                        done();
                    })
                })
            })
        })
    })

    /**
     * @tc.number   Telephony_CellularData_activationDeactivation_Async_0200
     * @tc.name     Set radio on with async callback, verify the cellular data is connected
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_activationDeactivation_Async_0200", 0, async function (done) {
        const CASE_NAME = "Telephony_CellularData_activationDeactivation_Async_0200";
        radio.turnOffRadio(async function (err) {
            if (err) {
                console.log(`${CASE_NAME} turnOffRadio err: ${err.message}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${CASE_NAME} turnOffRadio finish`);
            await sleep(TIME_3_SECONDS);

            cellular.getCellularDataState(async function (err, data) {
                if (err) {
                    console.log(`${CASE_NAME} getCellularDataState err: ${err.message}`);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === DataConnectState.DATA_STATE_DISCONNECTED).assertTrue();
                console.log(`${CASE_NAME} getCellularDataState finish: ${data}`);

                radio.turnOnRadio(async function (err) {
                    if (err) {
                        console.log(`${CASE_NAME} turnOnRadio err: ${err.message}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${CASE_NAME} turnOnRadio finish`);

                    const data = await stateChange(CASE_NAME, DataConnectState.DATA_STATE_CONNECTED, TIME_RADIO_CHANGE);
                    expect(data === DataConnectState.DATA_STATE_CONNECTED).assertTrue();
                    done();
                })
            })
        })
    })

    /**
     * @tc.number   Telephony_CellularData_activationDeactivation_Promise_0100
     * @tc.name     Set radio off with promise, verify the cellular data is disconnected
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_activationDeactivation_Promise_0100", 0, async function (done) {
        const CASE_NAME = "Telephony_CellularData_activationDeactivation_Promise_0100";
        try {
            await radio.turnOnRadio();
            console.log(`${CASE_NAME} turnOnRadio finish`);
        } catch (err) {
            console.log(`${CASE_NAME} turnOnRadio err: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        await sleep(TIME_RADIO_CHANGE);

        try {
            const data = await cellular.getCellularDataState();
            expect(data === DataConnectState.DATA_STATE_CONNECTED).assertTrue();
            console.log(`${CASE_NAME} getCellularDataState finish: ${data}`);
        } catch (err) {
            console.log(`${CASE_NAME} getCellularDataState err: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }

        try {
            await radio.turnOffRadio();
            console.log(`${CASE_NAME} turnOffRadio finish`);
        } catch (err) {
            console.log(`${CASE_NAME} turnOffRadio err: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        await sleep(TIME_3_SECONDS);

        try {
            const data = await cellular.getCellularDataState();
            expect(data === DataConnectState.DATA_STATE_DISCONNECTED).assertTrue();
            console.log(`${CASE_NAME} getCellularDataState finish: ${data}`);
        } catch (err) {
            console.log(`${CASE_NAME} getCellularDataState err: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        done();
    })

    /**
     * @tc.number   Telephony_CellularData_activationDeactivation_Promise_0200
     * @tc.name     Set radio on with promise, verify the cellular data is connected
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_activationDeactivation_Promise_0200", 0, async function (done) {
        const CASE_NAME = "Telephony_CellularData_activationDeactivation_Promise_0200";
        try {
            await radio.turnOffRadio();
            console.log(`${CASE_NAME} turnOffRadio finish`);
        } catch (err) {
            console.log(`${CASE_NAME} turnOffRadio err: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        await sleep(TIME_3_SECONDS);

        try {
            const data = await cellular.getCellularDataState();
            expect(data === DataConnectState.DATA_STATE_DISCONNECTED).assertTrue();
            console.log(`${CASE_NAME} getCellularDataState finish: ${data}`);
        } catch (err) {
            console.log(`${CASE_NAME} getCellularDataState err: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }

        try {
            await radio.turnOnRadio();
            console.log(`${CASE_NAME} turnOnRadio finish`);
        } catch (err) {
            console.log(`${CASE_NAME} turnOnRadio err: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }

        const data = await stateChange(CASE_NAME, DataConnectState.DATA_STATE_CONNECTED, TIME_RADIO_CHANGE);
        expect(data === DataConnectState.DATA_STATE_CONNECTED).assertTrue();
        done();
    })
})
