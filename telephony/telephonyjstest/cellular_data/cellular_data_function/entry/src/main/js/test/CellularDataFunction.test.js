/*
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
import { describe, beforeAll, beforeEach, afterAll, it, expect } from "deccjsunit/index";

var inItialState = false;
const time = 2000;

describe("TelephonyCellularDataFunction", function () {
    const sleep = (time) => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve();
            }, time);
        })
    };

    beforeAll(function () {
        cellular.isCellularDataEnabled((err, data) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_isCellularDataEnabled_beforeAll fail");
                return;
            }
            console.log("Telephony_CellularData_isCellularDataEnabled_beforeAll finish");
            inItialState = data;
        })
    })

    beforeEach(function () {
        cellular.disableCellularData(async(err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_isCellularDataEnabled_beforeEach_disableCellularData fail");
                return;
            }
            console.log("Telephony_CellularData_isCellularDataEnabled_beforeEach_disableCellularData finish");
            await sleep(time);
        })
    })

    afterAll(function () {
        if (inItialState === true) {
            cellular.enableCellularData((err) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_isCellularDataEnabled_enableCellularData fail");
                    return;
                }
                console.log("Telephony_CellularData_isCellularDataEnabled_enableCellularData finish");
            })
        } else {
            cellular.disableCellularData((err) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_isCellularDataEnabled_disableCellularData fail");
                    return;
                }
                console.log("Telephony_CellularData_isCellularDataEnabled_disableCellularData finish");
            })
        }
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataEnabled_Async_0100
     * @tc.name     Call the enableCellularData interface and then call the isCellularDataEnabled interface.
     *              The result is true
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataEnabled_Async_0100", 0, async function (done) {
        cellular.enableCellularData(async (err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_isCellularDataEnabled_Async_0100 enableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_isCellularDataEnabled_Async_0100 enableCellularData finish");
            await sleep(time);
            cellular.isCellularDataEnabled((err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_isCellularDataEnabled_Async_0100 fail");
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log("Telephony_CellularData_isCellularDataEnabled_Async_0100 finish");
                done();
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataEnabled_Async_0200
     * @tc.name     Call the disableCellularData interface and then the isCellularDataEnabled interface.
     *              The return result is false
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataEnabled_Async_0200", 0, async function (done) {
        cellular.disableCellularData(async (err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_isCellularDataEnabled_Async_0200 disableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_isCellularDataEnabled_Async_0200 disableCellularData finish");
            await sleep(time);
            cellular.isCellularDataEnabled((err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_isCellularDataEnabled_Async_0200 fail");
                    done();
                    return;
                }
                expect(data === false).assertTrue();
                console.log("Telephony_CellularData_isCellularDataEnabled_Async_0200 finish");
                done();
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataEnabled_Promise_0100
     * @tc.name     Call the enableCellularData interface and then call the isCellularDataEnabled interface.
     *              The result is true
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataEnabled_Promise_0100", 0, async function (done) {
        try {
            await cellular.enableCellularData();
            console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0100 enableCellularData finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0100 enableCellularData fail");
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0100 fail");
            done();
            return;
        }
        console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0100 finish");
        done();
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataEnabled_Promise_0200
     * @tc.name     Call the enableCellularData interface and then call the isCellularDataEnabled interface.
     *              The result is false
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataEnabled_Promise_0200", 0, async function (done) {
        try {
            await cellular.disableCellularData();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0200 disableCellularData fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data === false).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0200 fail");
            done();
            return;
        }
        console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0200 finish");
        done();
    })

    /*
     * @tc.number   Telephony_CellularData_getCellularDataState_Async_0100
     * @tc.name     Call the enableCellularData interface, call the getCellularDataState interface,
     *              and get the result 1 or 2
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_getCellularDataState_Async_0100", 0, async function (done) {
        cellular.enableCellularData(async (err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_getCellularDataState_Async_0100 enableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_getCellularDataState_Async_0100 enableCellularData finish");
            await sleep(time);
            cellular.getCellularDataState((err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_getCellularDataState_Async_0100 fail");
                    done();
                    return;
                }
                expect(data === cellular.DATA_STATE_CONNECTED).assertTrue();
                console.log("Telephony_CellularData_getCellularDataState_Async_0100 finish");
                done();
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_getCellularDataState_Async_0200
     * @tc.name     Call the enableCellularData interface, call the getCellularDataState interface,
     *              and get the result 0
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_getCellularDataState_Async_0200", 0, async function (done) {
        cellular.disableCellularData(async (err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_getCellularDataState_Async_0200 disableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_getCellularDataState_Async_0200 disableCellularData finish");
            await sleep(time);
            cellular.getCellularDataState((err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_getCellularDataState_Async_0200 getCellularDataState fail");
                    done();
                    return;
                }
                expect(data === cellular.DATA_STATE_DISCONNECTED).assertTrue();
                console.log("Telephony_CellularData_getCellularDataState_Async_0200 getCellularDataState finish");
                done();
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_getCellularDataState_Promise_0100
     * @tc.name     Call the enableCellularData interface, call the getCellularDataState interface,
     *              and get the result 1 or 2
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_getCellularDataState_Promise_0100", 0, async function (done) {
        try {
            await cellular.enableCellularData();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0100 enableCellularData finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0100 enableCellularData fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let data = await cellular.getCellularDataState();
            expect(data === cellular.DATA_STATE_CONNECTED).assertTrue();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0100 finish");
            done();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0100 fail");
            done();
        }
    })

    /*
     * @tc.number   Telephony_CellularData_getCellularDataState_Promise_0200
     * @tc.name     Call the enableCellularData interface, call the getCellularDataState interface,
     *              and get the result 0
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_getCellularDataState_Promise_0200", 0, async function (done) {
        try {
            await cellular.disableCellularData();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0200 disableCellularData finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0200 disableCellularData fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let result = await cellular.getCellularDataState();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0200 finish");
            expect(result === cellular.DATA_STATE_DISCONNECTED).assertTrue();
            done();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0200 fail");
            done();
        }
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularData_Async_0100
     * @tc.name     Open the data switch and query the switch status and data status
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularData_Async_0100", 0, async function (done) {
        //Turn on the cellular data switch
        cellular.isCellularDataEnabled((err, data) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_enableCellularData_Async_0100 isCellularDataEnabled fail");
                done();
                return;
            }
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_enableCellularData_Async_0100 isCellularDataEnabled finish");
            cellular.enableCellularData(async(err) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_enableCellularData_Async_0100 enableCellularData fail");
                    done();
                    return;
                }
                console.log("Telephony_CellularData_enableCellularData_Async_0100 enableCellularData finish");
                await sleep(time);
                cellular.isCellularDataEnabled((err, data) => {
                    if (err) {
                        expect().assertFail();
                        console.log("Telephony_CellularData_enableCellularData_Async_0100 isCellularDataEnabled fail");
                        done();
                        return;
                    }
                    expect(data).assertTrue();
                    console.log("Telephony_CellularData_enableCellularData_Async_0100 isCellularDataEnabled finish");
                    done();
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularData_Async_0200
     * @tc.name     With cellular data enabled, call enableCellularData() again to see the result of the AsyncCallback
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularData_Async_0200", 0, async function (done) {
        cellular.enableCellularData(async (err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_enableCellularData_Async_0200 enableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_enableCellularData_Async_0200 enableCellularData finish");
            await sleep(time);
            cellular.isCellularDataEnabled((err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_enableCellularData_Async_0200 isCellularDataEnabled fail");
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log("Telephony_CellularData_enableCellularData_Async_0200 isCellularDataEnabled finish");
                cellular.enableCellularData(async (err) => {
                    if (err) {
                        expect().assertFail();
                        console.log("Telephony_CellularData_enableCellularData_Async_0200 enableCellularData fail");
                        done();
                        return;
                    }
                    console.log("Telephony_CellularData_enableCellularData_Async_0200 enableCellularData finish");
                    await sleep(time);
                    cellular.isCellularDataEnabled((err, data) => {
                        if (err) {
                            expect().assertFail();
                            console.log(
                                "Telephony_CellularData_enableCellularData_Async_0200 isCellularDataEnabled fail");
                            done();
                            return;
                        }
                        expect(data).assertTrue();
                        console.log(
                            "Telephony_CellularData_enableCellularData_Async_0200 isCellularDataEnabled finish");
                        done();
                    })
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularData_Promise_0100
     * @tc.name     Open the data switch and query the switch status and data status
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularData_Promise_0100", 0, async function (done) {
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data === false).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularData_Promise_0100 fail");
            done();
            return;
        }
        try {
            await cellular.enableCellularData();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularData_Promise_0100 fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularData_Promise_0100 fail");
            done();
            return;
        }
        console.log("Telephony_CellularData_enableCellularData_Promise_0100 finish");
        done();
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularData_Promise_0200
     * @tc.name     Call the enableCellularData() interface again with cellular data enabled to see the callback
     *              result (Promise)
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularData_Promise_0200", 0, async function (done) {
        try {
            await cellular.enableCellularData();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularData_Promise_0200 fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularData_Promise_0200 fail");
            done();
            return;
        }
        try {
            await cellular.enableCellularData();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularData_Promise_0200 fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularData_Promise_0200 fail");
            done();
            return;
        }
        console.log("Telephony_CellularData_enableCellularData_Promise_0200 finish");
        done();
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularData_Async_0100
     * @tc.name     Turn off the data switch and query the switch status and data status
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularData_Async_0100", 0, async function (done) {
        cellular.isCellularDataEnabled((err, data) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_disableCellularData_Async_0100 isCellularDataEnabled fail");
                done();
                return;
            }
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_disableCellularData_Async_0100 isCellularDataEnabled finish");
            cellular.disableCellularData(async(err) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_disableCellularData_Async_0100 disableCellularData fail");
                    done();
                    return;
                }
                console.log("Telephony_CellularData_disableCellularData_Async_0100 disableCellularData finish");
                await sleep(time);
                cellular.isCellularDataEnabled((err, data) => {
                    if (err) {
                        expect().assertFail();
                        console.log("Telephony_CellularData_disableCellularData_Async_0100 fail");
                        done();
                        return;
                    }
                    expect(data === false).assertTrue();
                    cellular.getCellularDataState((err, data) => {
                        if (err) {
                            expect().assertFail();
                            console.log("Telephony_CellularData_disableCellularData_Async_0100 fail");
                            done();
                            return;
                        }
                        expect(data === cellular.DATA_STATE_DISCONNECTED).assertTrue();
                        console.log("Telephony_CellularData_disableCellularData_Async_0100 finish");
                        done();
                    })
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularData_Async_0200
     * @tc.name     Call the disenbleCellularDg() interface again while the cellular data is off to see the result of
     *              the callback (AsyncCallback).
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularData_Async_0200", 0, async function (done) {
        cellular.disableCellularData(async(err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_disableCellularData_Async_0200 disableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_disableCellularData_Async_0200 disableCellularData finish");
            await sleep(time);
            cellular.isCellularDataEnabled((err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_disableCellularData_Async_0200 isCellularDataEnabled fail");
                    done();
                    return;
                }
                expect(data === false).assertTrue();
                console.log("Telephony_CellularData_disableCellularData_Async_0200 isCellularDataEnabled finish");
                cellular.disableCellularData(async(err) => {
                    if (err) {
                        expect().assertFail();
                        console.log("Telephony_CellularData_disableCellularData_Async_0200 disableCellularData fail");
                        done();
                        return;
                    }
                    console.log("Telephony_CellularData_disableCellularData_Async_0200 disableCellularData finish");
                    await sleep(time);
                    cellular.isCellularDataEnabled((err, data) => {
                        if (err) {
                            expect().assertFail();
                            console.log("Telephony_CellularData_disableCellularData_Async_0200 fail");
                            done();
                            return;
                        }
                        expect(data === false).assertTrue();
                        cellular.getCellularDataState((err, data) => {
                            if (err) {
                                expect().assertFail();
                                console.log("Telephony_CellularData_disableCellularData_Async_0200 fail");
                                done();
                                return;
                            }
                            expect(data === cellular.DATA_STATE_DISCONNECTED).assertTrue();
                            console.log("Telephony_CellularData_disableCellularData_Async_0200 finish");
                            done();
                        })
                    })
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularData_Promise_0100
     * @tc.name     Turn off the data switch and query the switch status and data status
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularData_Promise_0100", 0, async function (done) {
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data === false).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularData_Promise_0100 fail");
            done();
            return;
        }
        await sleep(time);
        try {
            await cellular.disableCellularData();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularData_Promise_0100 fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data === false).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularData_Promise_0100 fail");
            done();
            return;
        }
        console.log("Telephony_CellularData_disableCellularData_Promise_0100 finish");
        done();
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularData_Promise_0200
     * @tc.name     Turn off the data switch and query the switch status and data status
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularData_Promise_0200", 0, async function (done) {
        try {
            await cellular.disableCellularData();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularData_Promise_0200 fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data === false).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularData_Promise_0200 fail");
            done();
            return;
        }
        try {
            await cellular.disableCellularData();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularData_Promise_0200 fail");
            done();
            return;
        }
        await sleep(time);
        try {
            let data = await cellular.isCellularDataEnabled();
            expect(data === false).assertTrue();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularData_Promise_0200 fail");
            done();
            return;
        }
        console.log("Telephony_CellularData_disableCellularData_Promise_0200 finish");
        done();
    })
})
